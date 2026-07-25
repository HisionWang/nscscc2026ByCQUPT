proc WaitForDdrReady {vio status_probe timeout_ms} {
    set interval_ms 100
    set elapsed_ms 0
    set status 0

    while {$elapsed_ms <= $timeout_ms} {
        refresh_hw_vio $vio
        set status_raw [get_property INPUT_VALUE $status_probe]
        if {[scan $status_raw %x status] != 1} {
            error "Invalid DDR readiness value '$status_raw'"
        }

        if {($status & 0x7) == 0x7} {
            puts [format "DDR ready after %d ms: sys_resetn=1 calib=1 clock_pll=1" \
                $elapsed_ms]
            return
        }

        after $interval_ms
        incr elapsed_ms $interval_ms
    }

    error [format "DDR readiness timeout after %d ms: status=0x%X sys_resetn=%d calib=%d clock_pll=%d" \
        $timeout_ms $status \
        [expr {($status >> 2) & 1}] \
        [expr {($status >> 1) & 1}] \
        [expr {$status & 1}]]
}

proc AssertTestCpuReset {btn_step_probe} {
    # Preserve btn_step_vio[1]=1 and clear bit 0, which is the VIO test-mode
    # CPU/confreg run control in soc_top.
    set_property OUTPUT_VALUE 2 $btn_step_probe
    commit_hw_vio $btn_step_probe
    after 100
}

proc ReleaseTestCpuReset {btn_step_probe} {
    # Restore the normal inactive button value while releasing CPU/confreg.
    set_property OUTPUT_VALUE 3 $btn_step_probe
    commit_hw_vio $btn_step_probe
}

proc VerifyTestCpuReset {vio result_probe flag_probe} {
    refresh_hw_vio $vio
    set result_raw [get_property INPUT_VALUE $result_probe]
    set flag_raw [get_property INPUT_VALUE $flag_probe]
    if {[scan $result_raw %x result] != 1 ||
        [scan $flag_raw %x correct_flag] != 1} {
        error "Invalid VIO value while verifying CPU reset"
    }
    if {$result != 0 || $correct_flag != 0} {
        error [format \
            "CPU/confreg was not held in reset: result=0x%08X flag=0x%X" \
            $result $correct_flag]
    }
    puts "CPU/confreg held in reset while DDR program was downloaded"
}

proc WaitForFuncResult {vio result_probe flag_probe expected_result timeout_ms} {
    set interval_ms 250
    set elapsed_ms 0
    set result 0
    set correct_flag 0
    set previous_result -1

    while {$elapsed_ms <= $timeout_ms} {
        refresh_hw_vio $vio
        set result_raw [get_property INPUT_VALUE $result_probe]
        set flag_raw [get_property INPUT_VALUE $flag_probe]
        if {[scan $result_raw %x result] != 1} {
            error "Invalid functional result value '$result_raw'"
        }
        if {[scan $flag_raw %x correct_flag] != 1} {
            error "Invalid functional flag value '$flag_raw'"
        }

        if {$result != $previous_result} {
            puts [format \
                "Functional progress after %d ms: result=0x%08X flag=0x%X" \
                $elapsed_ms $result $correct_flag]
            set previous_result $result
        }

        if {$result == $expected_result} {
            return [list pass $result $correct_flag $elapsed_ms]
        }
        if {$correct_flag == 0x2} {
            return [list fail $result $correct_flag $elapsed_ms]
        }

        after $interval_ms
        incr elapsed_ms $interval_ms
    }

    return [list timeout $result $correct_flag $timeout_ms]
}

open_hw_manager
connect_hw_server
open_hw_target
set_property PROBES.FILE [lindex $argv 1] [get_hw_devices xc7a200t_0]
set_property FULL_PROBES.FILE [lindex $argv 1] [get_hw_devices xc7a200t_0]
set_property PROGRAM.FILE [lindex $argv 0] [get_hw_devices xc7a200t_0]
program_hw_devices [get_hw_devices xc7a200t_0]
refresh_hw_device [lindex [get_hw_devices xc7a200t_0] 0]

set vio [lindex [get_hw_vios] 0]
set reset_probe [lindex [get_hw_probes -quiet resetn_vio] 0]
set status_probe [lindex [get_hw_probes -quiet ddr_status_vio] 0]
set switch_probe [lindex [get_hw_probes -quiet switch_vio] 0]
set btn_step_probe [lindex [get_hw_probes -quiet btn_step_vio] 0]
set result_probe [lindex [get_hw_probes -quiet num_data] 0]
set flag_probe [lindex [get_hw_probes -quiet led_rg0_OBUF] 0]
if {$vio eq "" || $reset_probe eq "" || $status_probe eq "" ||
    $switch_probe eq "" || $btn_step_probe eq "" ||
    $result_probe eq "" || $flag_probe eq ""} {
    error "Required VIO control, result or readiness probe was not found"
}

# Hold CPU/confreg before entering VIO mode. The explicit platform reset below
# sets virtual_flag, after which btn_step_vio[0]=0 keeps only CPU/confreg reset
# while the PLL, MIG, JTAG AXI and DDR remain operational.
set test [lindex $argv 2]
AssertTestCpuReset $btn_step_probe
switch $test {
    "perf" {
        set_property OUTPUT_VALUE 7E $switch_probe
    }
    "func" {
        set_property OUTPUT_VALUE F0 $switch_probe
    }
}
commit_hw_vio $switch_probe

# Use the same deterministic post-configuration sequence in CI and manual
# runs. The first JTAG AXI transaction is issued only after the shared clock
# PLL, MIG calibration and AXI reset tree are ready.
set_property OUTPUT_VALUE 0 $reset_probe
commit_hw_vio $reset_probe
after 100
set_property OUTPUT_VALUE 1 $reset_probe
commit_hw_vio $reset_probe
WaitForDdrReady $vio $status_probe 30000

# jtag_axi_master.tcl retains its standalone behavior: it asserts the JTAG
# wrapper's CPU reset, writes the image, and releases that reset at the end.
# The independent VIO test reset remains asserted throughout this operation.
source ../jtag_axi_master.tcl
VerifyTestCpuReset $vio $result_probe $flag_probe

switch $test {
    "perf" {
        set outfile [open "perf_vio.csv" w]
        puts $outfile "correct_flag,soc_count,cpu_count"
        # puts  $outfile \
        # "bitcount_flag,bitcount_soc,bitcount_cpu,buble_sort_flag,bubble_sort_soc,buble_sort_cpu,\
        # coremark_flag,coremark_soc,coremark_cpu,crc32_flag,crc32_soc,crc32_cpu,\
        # dhrystone_flag,dhrystone_soc,dhrystone_cpu,quick_sort_flag,quick_sort_soc,quick_sort_cpu,\
        # select_sort_flag,select_sort_soc,select_sort_cpu,sha_soc_flag,sha_soc,sha_cpu,\
        # stream_soc_flag,stream_soc,stream_cpu,stringsearch_flag,stringsearch_soc,stringsearch_cpu"
        close $outfile
        set first_benchmark 1
        for {set index 126} { $index > 106 } {incr index -1 } {
            # puts "value of a: $index"
            #  1: 0111_1110 = 7E,  2: 0111_1101 = 7D,  3: 0111_1100 = 7C,  4: 0111_1011 = 7B,  5: 0111_1010 = 7A, 
            #  6: 0111_1001 = 79,  7: 0111_1000 = 78,  8: 0111_0111 = 77,  9: 0111_0110 = 76, 10: 0111_0101 = 75, 
            # 11: 0111_0100 = 74, 12: 0111_0011 = 73, 13: 0111_0010 = 72, 14: 0111_0001 = 71, 15: 0111_0000 = 70
            # 16: 0110_1111 = 6F, 17: 0110_1110 = 6E, 18: 0110_1101 = 6D, 19: 0110_1100 = 6C, 20: 0110_1011 = 6B,
            # CPU/confreg is already held for the first benchmark. Later
            # benchmarks use the same CPU-only reset; the PLL and MIG keep
            # running and the downloaded DDR image is preserved.
            if {!$first_benchmark} {
                AssertTestCpuReset $btn_step_probe
            }
            set first_benchmark 0

            set_property OUTPUT_VALUE [format %02x $index] $switch_probe
            commit_hw_vio $switch_probe
            after 100
            ReleaseTestCpuReset $btn_step_probe

            # Then wait 10 seconds, then read num data
            after 10000
            refresh_hw_vio $vio
            set correct_flag [get_property INPUT_VALUE $flag_probe]
            puts $correct_flag
            
            refresh_hw_vio $vio
            set soc_count [get_property INPUT_VALUE $result_probe]
            puts $soc_count
            # set csv_row "$csv_row,$soc_count"

            after 1000
            set_property OUTPUT_VALUE [format %02x [expr $index + 128]] $switch_probe
            commit_hw_vio $switch_probe

            after 1000
            refresh_hw_vio $vio
            set cpu_count [get_property INPUT_VALUE $result_probe]
            puts $cpu_count

            set outfile [open "perf_vio.csv" a]
            puts  $outfile "$correct_flag,$soc_count,$cpu_count"
            close $outfile
        }
    }
    "func" {
        set outfile [open "func_vio.csv" w]
        puts $outfile "seed,status,result,correct_flag,elapsed_ms"

        # Releasing confreg reset reloads its pseudo-random AXI delay generator
        # from switch_vio. After reset, the functional
        # program reads the live switch repeatedly in idle_1s to choose a
        # human-visible inter-test delay. Keep those two meanings separate:
        # preserve each reset seed, then select FF to remove only the software
        # delay. Always run a no-delay AXI baseline and the historical default,
        # plus one logged stress seed selected by CI (or A5 manually).
        set stress_seed [string toupper [lindex $argv 3]]
        if {$stress_seed eq ""} {
            set stress_seed A5
        }
        if {![regexp {^[0-9A-F]{2}$} $stress_seed]} {
            error "Functional stress seed must be exactly two hexadecimal digits"
        }
        set func_seeds {}
        foreach func_seed [list F0 FF $stress_seed] {
            if {[lsearch -exact $func_seeds $func_seed] < 0} {
                lappend func_seeds $func_seed
            }
        }
        set expected_func_result 0x3A00003A
        set func_timeout_ms 60000
        set first_seed 1
        foreach func_seed $func_seeds {
            if {!$first_seed} {
                AssertTestCpuReset $btn_step_probe
                VerifyTestCpuReset $vio $result_probe $flag_probe
            }
            set first_seed 0

            set_property OUTPUT_VALUE $func_seed $switch_probe
            commit_hw_vio $switch_probe
            after 100
            puts "Running functional test with switch/random seed 0x$func_seed"
            ReleaseTestCpuReset $btn_step_probe

            # The AXI LFSR seed is loaded on the synchronized local-reset
            # release edge. Keep the seed stable until that edge has crossed
            # the sys_clk domain before changing the live software switch.
            after 1

            # The AXI LFSR seed has now been latched by confreg. FF makes
            # SW_INTER ^ 0xAAAA zero in the functional program's idle_1s
            # routine. It does not change the already-running AXI LFSR.
            set_property OUTPUT_VALUE FF $switch_probe
            commit_hw_vio $switch_probe
            puts "Functional seed 0x$func_seed latched; runtime wait switch set to 0xFF"

            lassign [WaitForFuncResult \
                $vio $result_probe $flag_probe $expected_func_result \
                $func_timeout_ms] \
                func_status func_result func_flag func_elapsed_ms
            puts $outfile [format "%s,%s,%08X,%X,%d" \
                $func_seed $func_status $func_result $func_flag \
                $func_elapsed_ms]
            flush $outfile

            if {$func_status ne "pass"} {
                close $outfile
                error [format \
                    "Functional test seed 0x%s %s after %d ms: result=0x%08X flag=0x%X expected=0x%08X" \
                    $func_seed $func_status $func_elapsed_ms $func_result \
                    $func_flag $expected_func_result]
            }
            puts [format \
                "Functional seed 0x%s passed after %d ms: result=0x%08X" \
                $func_seed $func_elapsed_ms $func_result]
        }
        close $outfile
        puts [format "All %d functional random seeds passed" \
            [llength $func_seeds]]
    }
    default {
        puts "No VIO result collection requested for '$test'; releasing CPU"
        ReleaseTestCpuReset $btn_step_probe
    }

}

close_hw_manager

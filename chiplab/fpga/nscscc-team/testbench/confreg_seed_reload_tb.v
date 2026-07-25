`timescale 1ns / 1ps

module confreg_seed_reload_tb;

reg         aclk;
reg         timer_clk;
reg         aresetn;
reg         sys_resetn;
reg  [7:0]  switch;
wire        arready;
wire [3:0]  rid;
wire [31:0] rdata;
wire [1:0]  rresp;
wire        rlast;
wire        rvalid;
wire        awready;
wire        wready;
wire [3:0]  bid;
wire [1:0]  bresp;
wire        bvalid;
wire [4:0]  ram_random_mask;
wire [15:0] led;
wire [1:0]  led_rg0;
wire [1:0]  led_rg1;
wire [7:0]  num_csn;
wire [6:0]  num_a_g;
wire [31:0] num_data;
wire [3:0]  btn_key_col;

confreg #(.SIMULATION(1'b0)) dut (
    .aclk           (aclk),
    .timer_clk      (timer_clk),
    .aresetn        (aresetn),
    .sys_resetn     (sys_resetn),
    .arid           (4'd0),
    .araddr         (32'd0),
    .arlen          (8'd0),
    .arsize         (3'd0),
    .arburst        (2'd0),
    .arlock         (1'b0),
    .arcache        (4'd0),
    .arprot         (3'd0),
    .arvalid        (1'b0),
    .arready        (arready),
    .rid            (rid),
    .rdata          (rdata),
    .rresp          (rresp),
    .rlast          (rlast),
    .rvalid         (rvalid),
    .rready         (1'b0),
    .awid           (4'd0),
    .awaddr         (32'd0),
    .awlen          (8'd0),
    .awsize         (3'd0),
    .awburst        (2'd0),
    .awlock         (1'b0),
    .awcache        (4'd0),
    .awprot         (3'd0),
    .awvalid        (1'b0),
    .awready        (awready),
    .wdata          (32'd0),
    .wstrb          (4'd0),
    .wlast          (1'b0),
    .wvalid         (1'b0),
    .wready         (wready),
    .bid            (bid),
    .bresp          (bresp),
    .bvalid         (bvalid),
    .bready         (1'b0),
    .ram_random_mask(ram_random_mask),
    .led            (led),
    .led_rg0        (led_rg0),
    .led_rg1        (led_rg1),
    .num_csn        (num_csn),
    .num_a_g        (num_a_g),
    .num_data       (num_data),
    .switch         (switch),
    .btn_key_col    (btn_key_col),
    .btn_key_row    (4'd0),
    .btn_step       (2'b11)
);

always #5 aclk = ~aclk;
always #7 timer_clk = ~timer_clk;

function [22:0] seed_for_switch;
    input [7:0] value;
    reg [15:0] duplicated;
    begin
        duplicated = {{2{value[7]}}, {2{value[6]}},
                      {2{value[5]}}, {2{value[4]}},
                      {2{value[3]}}, {2{value[2]}},
                      {2{value[1]}}, {2{value[0]}}};
        seed_for_switch = {7'b1010101, ~duplicated};
    end
endfunction

function [22:0] next_lfsr;
    input [22:0] value;
    begin
        next_lfsr = {value[21:0], value[22] ^ value[17]};
    end
endfunction

task wait_aclk;
    begin
        @(posedge aclk);
        #1;
    end
endtask

task expect_seed;
    input [7:0] expected_switch;
    reg [22:0] expected;
    begin
        expected = seed_for_switch(expected_switch);
        if (dut.pseudo_random_23 !== expected) begin
            $display("FAIL: switch=%02x expected seed=%06x actual=%06x",
                     expected_switch, expected, dut.pseudo_random_23);
            $fatal(1);
        end
        if (dut.no_mask !== (expected[15:0] == 16'h00ff)) begin
            $display("FAIL: switch=%02x no_mask mismatch", expected_switch);
            $fatal(1);
        end
        if (dut.short_delay !== (expected[7:0] == 8'hff)) begin
            $display("FAIL: switch=%02x short_delay mismatch",
                     expected_switch);
            $fatal(1);
        end
    end
endtask

reg [22:0] previous_lfsr;

initial begin
    aclk       = 1'b0;
    timer_clk  = 1'b0;
    aresetn    = 1'b0;
    sys_resetn = 1'b0;
    switch     = 8'hf0;

    repeat (3) wait_aclk();
    expect_seed(8'hf0);

    // The system leaves reset while CPU/confreg local reset remains asserted.
    // The LFSR must keep moving so the JTAG DDR path cannot see a frozen mask.
    sys_resetn = 1'b1;
    wait_aclk();
    previous_lfsr = dut.pseudo_random_23;
    wait_aclk();
    if (dut.pseudo_random_23 !== next_lfsr(previous_lfsr)) begin
        $display("FAIL: LFSR did not advance while local reset was asserted");
        $fatal(1);
    end

    // Releasing local reset reloads the switch-selected sequence once.
    switch  = 8'hff;
    aresetn = 1'b1;
    wait_aclk();
    expect_seed(8'hff);
    wait_aclk();
    if (dut.pseudo_random_23 !== next_lfsr(seed_for_switch(8'hff))) begin
        $display("FAIL: LFSR did not advance after FF seed load");
        $fatal(1);
    end

    // A later local reset must not freeze the LFSR. Its release must load the
    // new seed rather than continue the old sequence.
    aresetn = 1'b0;
    wait_aclk();
    previous_lfsr = dut.pseudo_random_23;
    wait_aclk();
    if (dut.pseudo_random_23 !== next_lfsr(previous_lfsr)) begin
        $display("FAIL: LFSR froze during the second local reset");
        $fatal(1);
    end

    switch  = 8'h75;
    aresetn = 1'b1;
    wait_aclk();
    expect_seed(8'h75);

    // System reset still performs the cold-start seed load.
    aresetn    = 1'b0;
    switch     = 8'ha5;
    sys_resetn = 1'b0;
    repeat (2) wait_aclk();
    expect_seed(8'ha5);

    $display("PASS: confreg local-reset release reloads each AXI seed");
    $finish;
end

endmodule

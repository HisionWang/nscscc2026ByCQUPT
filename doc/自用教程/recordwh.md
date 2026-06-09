# 常用命令

* Linux和window换行符不兼容导致的问题：
  
  ```
  sed -i 's/\r$//' configure.sh
  ```
* chiplab的difftest启动：
  
  ```
  export CHIPLAB_HOME="/mnt/d/myCPU_new/chiplab"
  ```

# 安装chisel环境相关

1. sbt的安装最好是直接下载发行版再设置环境变量（bulid工具）
   有传言讲的是mill工具更好

```
https://www.scala-sbt.org/download/
```

2. 下载对应的例子

```
https://github.com/chipsalliance/chisel-template
```

3. 在上面的目录里运行sbt验证项目正确性即可

```
sbt test
```

等待一段时间后出现下面的语句即成功

```
[info] - Gcd should calculate proper greatest common denominator
[info] Run completed in 1 minute, 29 seconds.
[info] Total number of tests run: 1
[info] Suites: completed 1, aborted 0
[info] Tests: succeeded 1, failed 0, canceled 0, ignored 0, pending 0
[info] All tests passed.
[success] Total time: 121 s (02:01), completed Jan 20, 2026, 4:26:18 PM
```

4. 两个初学chisel很适合的项目（某外国大学的实验课）

```
https://github.com/schoeberl/chisel-examples/
https://github.com/schoeberl/chisel-lab/
```

项目基于的教程书本是

```
https://github.com/schoeberl/chisel-book/
```

5.对于chisel程序框架的一些自己的理解
这个框架的最小式是：

```
.
├── build.sbt
└── src
    ├── main
    │   └── scala
    │       └── Hello.scala
    └── test
        └── scala
            └── HelloTest.scala
```

所以严格来说只需要build.sbt和Hello.scala两个文件在文件夹结构满足于的情况下就可以运行
然后就可以生成对应的.v文件了
框架搭建好了，下面就是纯粹的学chisel语法了
指定要生成的verilog模块以及指定生成位置的代码示例：

```
object M extends App {
  emitVerilog(new M(),Array("--target-dir", "generated"))
}
```

仿真test中生成保存波形图的示例：

```
class HelloTest extends AnyFlatSpec with ChiselScalatestTester {
behavior of "Hello"
  it should "pass" in {
    test(new Hello).withAnnotations(Seq(WriteVcdAnnotation))
     { 
      ......
    }
  }
}
```

其他的就暂且待到后面研究了


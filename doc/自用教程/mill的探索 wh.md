# mill的安装与详解

mill是真的非常难理解，他的安装就非常的不同于一般的软件项目

就比如sbt的安装就是像gcc工具链那样下载一个编译好的压缩包解压后环境变量一设置就ok

```
sudo wget -O /usr/local/bin/mill https://github.com/com-lihaoyi/mill/releases/download/0.12.1/0.12.1
sudo chmod +x /usr/local/bin/mill
```
在上面的这个命令的运行结果是

从某网站下载了一个文件下来，然后赋予这个文件执行权限。

所以，这是就完成了这个“mill”的安装

（由于/usr/local/bin/必然在环境变量中，所以说mill可以杯识别）

所以说，执行mill命令，本质上就是在执行这个脚本

下面开始研究当输入这个命令的时候会发生什么东西
```
mill --version
```
前面说到，当输入mill命令后本质上就是在行哪个被下载下来的脚本

所以重点就是这个脚本里面的程序是怎么样的

当然可以直接去翻阅程序查看

简答来说就是，查看执行这个命令的位置有没有相关的文件指示mill的版本信息等

```
root@LAPTOP-6S2IHEA9:/mnt/d/myCPU_new/chisel_learn/chisel-template-main# ll
total 36
drwxrwxrwx 1 hision hision  512 Jan 21 22:35 ./
drwxrwxrwx 1 hision hision  512 Jan 21 22:14 ../
drwxrwxrwx 1 hision hision  512 Jan 20 16:18 .github/
-rwxrwxrwx 1 hision hision 4307 Sep 23 02:45 .gitignore*
-rwxrwxrwx 1 hision hision   29 Sep 23 02:45 .mill-jvm-opts*
-rwxrwxrwx 1 hision hision    6 Jan 21 22:35 .mill-version*
-rwxrwxrwx 1 hision hision 1211 Sep 23 02:45 LICENSE*
-rwxrwxrwx 1 hision hision 5367 Sep 23 02:45 README.md*
drwxrwxrwx 1 hision hision  512 Jan 20 16:24 build/
-rwxrwxrwx 1 hision hision 1161 Jan 21 22:05 build.mill*
-rwxrwxrwx 1 hision hision  692 Sep 23 02:45 build.sbt*
-rwxrwxrwx 1 hision hision 8022 Sep 23 02:45 mill*
drwxrwxrwx 1 hision hision  512 Jan 21 22:36 out/
drwxrwxrwx 1 hision hision  512 Jan 20 16:24 project/
drwxrwxrwx 1 hision hision  512 Jan 20 16:18 src/
drwxrwxrwx 1 hision hision  512 Jan 20 16:24 target/
```

比如在这个项目中，.mill-version*文件等就是被./mill脚本阅读的

（所以这个项目还比较高级，他自带一个./mill，相当于可以用./mill直接去构建项目而可以不需要下载的到/usr/local/bin/里面的脚本）

在脚本文件中，脚本不是程序，固然肯定要有一个可执行的程序来接收干活

所以他会检测在对应位置有没有项目对应需要的可执行文件（脚本代码中会有体现）

如果没有，那就需要去下载（所有有时候会看到不同的项目他会不停的地进行下载）

```
root@LAPTOP-6S2IHEA9:~/.cache/mill/download# ll
total 202036
drwxr-xr-x 2 root   root       4096 Jan 21 22:34 ./
drwxr-xr-x 3 root   root       4096 Jan 21 21:33 ../
-rwxr-xr-x 1 root   root   67788134 Jan 21 21:34 0.12.1*
-rwxr-xr-x 1 root   root   65797311 Jan 21 21:41 0.12.5*
-rwxrwxrwx 1 hision hision 73282127 Jan 21 22:34 0.12.6*
```

比如这就是真正的“可执行文件了”也就是真正的mill

所以像version这种命令，本质也是这些很大的可执行文件运行出来的而不是哪个脚本文件
# DesignCPUByChiselByCQUPT！项目

目前只搭建好了一个简单的框架，代码都是AI写的（顶层框架，转接桥，miniIcache）
代码逻辑应该是写得一坨，后面再搞，但可以正常转成v，项目框架现在也有个雏形了，至少证明chisel写CPU还是有可行性的

转成verilog：

```
sbt run
```

结果放在chiplab的IP文件夹里面的

另外你们如果不习惯用chisel写的话，后续可以用v写，我这边chisel里面可以留黑盒，到时候你们写好了就可以直接加进来了，现目前AI写的的chisel代码里面，dcahe和俩uncache都是黑盒，可以去看一下他的实现，这样你就比较清楚你那边的verilog怎么对接
但建议还是看一下chisel代码，至少读到我这边的chisel大概知道什么意思

如果要学chisel：

sbt安装见doc，其实就是下个发行版然后设置环境变量就行，网上搜一下教程吧
chisel大致教程看
[https://www.bilibili.com/video/BV1m44y1c7DZ/?spm_id_from=333.337.search-card.all.click&vd_source=67253477c65a73eafe2dab35e2c36a9d](https://)
基本上把这一套是极品

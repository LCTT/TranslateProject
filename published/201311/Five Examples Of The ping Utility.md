五个 ping 工具的使用实例
================================================================================

### 什么是 ping 工具###

在讲述一些关于ping工具真实直观的使用实例前，先让我来介绍一下这个命令行工具及其目的。ping工具通常用来测试一台主机在互联网协议(IP)网络内的可达性。其名字源于主动声纳法——在水下创建一个脉冲声音信号(ping)并侦听周围物体的返回信号。该方法同样生动描述了ping网络工具的工作原理。ping工具对一台主机发送回应请求然后等待ICMP响应。

实践中的ping工具的一些例子：

### 查询主机的IP地址 ###

有时候你需要得到某一台主机的IP地址，如图一。只需要键入ping命令后面跟上要查询的主机名。

    ping www.omgubuntu.com

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/11/ping1.png)

### 查询正在使用的ping工具的版本信息 ###

用 -V 选项可以用来查询你手头上ping工具的版本信息。键入下列命令显示正在使用的ping工具的版本信息。

    ping -V

正如你从图二见到的，我正在使用的是“ping utility,iputils-sss20101006”

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/11/ping2.png)

### 自动退出 ping ###

当你用‘ping 主机’命令ping一台机器时，ping自己无法停止，你必需按下CTRL+C强行退出，或者你可以用 -c (count)选项指定发送包的数量。使用-c选项，当网络管理员(其实普通用户也可以)发送完指定数量的包之后，无需按CTRL+C，ping进程就会自动停止。

    ping -c 13 127.0.0.1

上列的命令发送了13个包到我的本地主机上。

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/11/ping3.png)

正如你从图三看到的，我并没有按CTRL+C，而ping自动退出了。

### 指定数据包之间的时间间隔 ###

你知道ping每秒钟发送一个数据包吗？你喜欢快一点还是慢一点？用 -i 选项能指定包之间的时间间隔。用下列命令快速发送或慢速发送包。

###  每0.13秒发送一个包 ###

    ping -i 0.13

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/11/ping4.png)

### 每13秒发送一个包 ###

    ping -i 13

### 结合 -i 选项和 -c 选项 ###

    ping -c 13 -i 3

总共花费39秒发出13个数据包，数据包的时间间隔为三秒。

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/11/ping6.png)

--------------------------------------------------------------------------------

via: http://www.unixmen.com/five-examples-ping-utility/

译者：[Luoxcat](https://github.com/Luoxcat) 校对：[Mr小眼儿](http://blog.csdn.net/tinyeyeser)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

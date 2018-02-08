使用 iftop 命令监控网络带宽
======
系统管理员需要监控 IT 基础设施来确保一切正常运行。我们需要监控硬件也就是内存、硬盘和 CPU 等的性能，我们也必须监控我们的网络。我们需要确保我们的网络不被过度使用，或者我们的程序，网站可能无法正常工作。在本教程中，我们将学习使用 IFTOP。

（**推荐阅读**：[**使用 Nagios** 进行资源监控][1]、[**用于检查系统信息的工具**][2] 、[**要监控的重要日志**][3] ）

Iftop 是网络监控工具，它提供实时带宽监控。 Iftop 测量进出各个套接字连接的总数据量，即它捕获通过网络适配器收到或发出的数据包，然后将这些数据相加以得到使用的带宽。

## 在 Debian/Ubuntu 上安装

Iftop 存在于 Debian/Ubuntu 的默认仓库中，可以使用下面的命令安装：

```
$ sudo apt-get install iftop
```

## 使用 yum 在 RHEL/Centos 上安装

要在 CentOS 或 RHEL 上安装 iftop，我们需要启用 EPEL 仓库。要启用仓库，请在终端上运行以下命令：

### RHEL/CentOS 7

```
$ rpm -Uvh https://dl.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-10.noarch.rpm
```

### RHEL/CentOS 6（64位）

```
$ rpm -Uvh http://download.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
```

### RHEL/CentOS 6 （64位）

```
$ rpm -Uvh http://dl.fedoraproject.org/pub/epel/6/i386/epel-release-6-8.noarch.rpm
```

epel 仓库安装完成后，我们可以用下面的命令安装 iftop：

```
$ yum install iftop
```

这将在你的系统上安装 iftop。我们现在将用它来监控我们的网络。

## 使用 IFTOP

可以打开终端窗口，并输入下面的命令使用 iftop：

```
$ iftop
```

![network monitoring][5]

现在你将看到计算机上发生的网络活动。你也可以使用：

```
$ iftop -n
```

这将在屏幕上显示网络信息，但使用 “-n”，则不会显示与 IP 地址相关的名称，只会显示 IP 地址。这个选项能节省一些将 IP 地址解析为名称的带宽。

我们也可以看到 iftop 可以使用的所有命令。运行 iftop 后，按下键盘上的 “h” 查看 iftop 可以使用的所有命令。

![network monitoring][7]

要监控特定的网络接口，我们可以在 iftop 后加上接口名：

```
$ iftop -I enp0s3
```

如上所述，你可以使用帮助来查看 iftop 可以使用的更多选项。但是这些提到的例子只是可能只是监控网络。


--------------------------------------------------------------------------------

via: http://linuxtechlab.com/monitoring-network-bandwidth-iftop-command/

作者：[SHUSAIN][a]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://linuxtechlab.com/author/shsuain/
[1]:http://linuxtechlab.com/installing-configuring-nagios-server/
[2]:http://linuxtechlab.com/commands-system-hardware-info/
[3]:http://linuxtechlab.com/important-logs-monitor-identify-issues/
[4]:https://i1.wp.com/linuxtechlab.com/wp-content/plugins/a3-lazy-load/assets/images/lazy_placeholder.gif?resize=661%2C424
[5]:https://i0.wp.com/linuxtechlab.com/wp-content/uploads/2017/04/iftop-1.jpg?resize=661%2C424
[6]:https://i1.wp.com/linuxtechlab.com/wp-content/plugins/a3-lazy-load/assets/images/lazy_placeholder.gif?resize=663%2C416
[7]:https://i0.wp.com/linuxtechlab.com/wp-content/uploads/2017/04/iftop-help.jpg?resize=663%2C416

怎样在 Linux 中限制网络带宽使用
================================================================================
假如你经常在 Linux 桌面上运行多个网络应用，或在家中让多台电脑共享带宽；那么你可能想更好地控制带宽的使用。否则，当你使用下载器下载一个大文件时，交互式 SSH 会话可能会变得缓慢以至不可用；或者当你通过 Dropbox 来同步一个大文件夹时，你的室友可能会抱怨在她的电脑上，视频流变得断断续续。

在本教程中，我将为你描述两种在 Linux 中限制网络流量速率的不同方法。

### 在 Linux 中限制一个应用的速率 ###

限制网络流量速率的一种方法是通过一个名为[trickle][1]的命令行工具。通过在程序运行时，预先加载一个速率限制 socket 库 的方法，trickle 命令允许你改变任意一个特定程序的流量。 trickle 命令有一个很好的特性是它仅在用户空间中运行，这意味着，你不必需要 root 权限就可以限制一个程序的带宽使用。要能使用 trickle 程序控制程序的带宽，这个程序就必须使用非静态链接库的套接字接口。当你想对一个不具有内置带宽控制功能的程序进行速率限制时，trickle 可以帮得上忙。

在 Ubuntu，Debian 及其衍生发行版中安装 trickle ：

```
$ sudo apt-get install trickle
```

在 Fdora 或 CentOS/RHEL (带有 [EPEL 软件仓库][2])：

```
$ sudo yum install trickle
```

trickle 的基本使用方法如下。仅需简单地把 trickle 命令（及速率参数）放在你想运行的命令之前。

```
$ trickle -d <download-rate> -u <upload-rate>  <command> 
```

这就可以将 `<command>` 的下载和上传速率限定为特定值（单位 KBytes/s）。

例如，将你的 scp 会话的最大上传带宽设定为 100 KB/s：

```
 $ trickle -u 100 scp backup.tgz alice@remote_host.com:
```

如若你想，你可以通过创建一个[自定义启动器][3]的方式，使用下面的命令为你的 Firefox 浏览器设定最大下载速率（例如， 300 KB/s）。

```
trickle -d 300 firefox %u
```

最后， trickle 也可以以守护进程模式运行，在该模式下，它将会限制所有通过 trickle 启动且正在运行的程序的总带宽之和。 启动 trickle 使其作为一个守护进程（例如， trickled）：

```
$ sudo trickled -d 1000
```

一旦 trickled 守护进程在后台运行，你便可以通过 trickle 命令来启动其他程序。假如你通过 trickle 启动一个程序，那么这个程序的最大下载速率将是 1000 KB/s， 假如你再通过 trickle 启动了另一个程序，则每个程序的(下载)速率极限将会被限制为 500 KB/s，等等。

### 在 Linux 中限制一个网络接口的速率 ###

另一种控制你的带宽资源的方式是在每一个接口上限制带宽。这在你与其他人分享你的网络连接的上行带宽时尤为实用。同其他一样，Linux 有一个工具来为你做这件事。[wondershaper][4]就是干这个的。

wondershaper 实际上是一个 shell 脚本，它使用 [tc][5] 来定义流量调整命令，使用 QoS 来处理特定的网络接口。外发流量通过放在不同优先级的队列中，达到限制传出流量速率的目的；而传入流量通过丢包的方式来达到速率限制的目的。

事实上， wondershaper 的既定目标不仅仅是对一个接口增加其带宽上限；当批量下载或上传正在进行时，wondershaper 还试图去保持互动性会话如 SSH 的低延迟。同样的，它还会控制批量上传(例如， Dropbox 的同步)不会使得下载“窒息”，反之亦然。

在 Ubuntu Debian 及其衍生发行版本 中安装 wondershaper：

```
$ sudo apt-get install wondershaper
```

在 Fdora 或 CentOS/RHEL (带有 [EPEL 软件仓库][2]) 中安装 wondershaper：

```
$ sudo yum install wondershaper 
```

wondershaper 的基本使用如下：

```
 $ sudo wondershaper <interface> <download-rate> <upload-rate> 
```

举个例子， 将 `eth0` 的最大下载/上传带宽分别设定为 1000Kbit/s 和 500Kbit/s:

```
$ sudo wondershaper eth0 1000 500 
```

你也可以通过运行下面的命令将速率限制进行消除：

```
$ sudo wondershaper clear eth0
```

假如你对 wondershaper 的运行原理感兴趣，你可以阅读其 shell 脚本源文件(/sbin/wondershaper)。

### 总结 ###

在本教程中，我介绍了两种不同的方法，来达到如何在 Linux 桌面环境中，控制每个应用或每个接口的带宽使用的目的。 这些工具的使用都很简单，都为用户提供了一个快速且容易的方式来调整或限制流量。 对于那些想更多地了解如何在 Linux 中进行速率控制的读者，请参考 [the Linux bible][7].

--------------------------------------------------------------------------------

via: http://xmodulo.com/limit-network-bandwidth-linux.html

作者：[Dan Nanni][a]
译者：[FSSlc](https://github.com/FSSlc)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://xmodulo.com/author/nanni
[1]:http://monkey.org/~marius/trickle
[2]:http://linux.cn/article-2324-1.html
[3]:http://xmodulo.com/create-desktop-shortcut-launcher-linux.html
[4]:http://lartc.org/wondershaper/
[5]:http://lartc.org/manpages/tc.txt
[6]:http://linux.cn/article-2324-1.html
[7]:http://www.lartc.org/lartc.html

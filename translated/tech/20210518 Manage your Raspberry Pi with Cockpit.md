[#]: subject: (Manage your Raspberry Pi with Cockpit)
[#]: via: (https://opensource.com/article/21/5/raspberry-pi-cockpit)
[#]: author: (Alan Formy-Duval https://opensource.com/users/alanfdoss)
[#]: collector: (lujun9972)
[#]: translator: (ShuyRoy)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

使用Cockpit管理你的树莓派
======
用Cockpit建立你的树莓派的控制中心。
![Neon colorized Raspberry Pi cluster with LEGOs][1]

去年，我写了关于使用[Cockpit管理我的Linux服务器的文章][2]。它是一个基于web的工具，为管理多个服务器及其相关的服务和应用提供了一个干净、强大的接口。它还简化了日常的管理任务。

在这篇文章中，我将会介绍如何在树莓派基金会提供的标准操作系统（OS）上安装Linux服务器的Cockpit web控制台。我还会简要介绍它的特性。


### 在树莓派OS上安装Cockpit

在sudo权限下使用一个账户通过SSH登录你的树莓派系统。如果你还没有建立一个账户：


```
$ ssh pibox
alan@pibox's password:
Linux pibox.someplace.org 5.10.17-v7+ #1403 SMP Mon Feb 22 11:29:51 GMT 2021 armv7l

The programs included with the Debian GNU/Linux system are free software;
the exact distribution terms for each program are described in the
individual files in /usr/share/doc/*/copyright.

Debian GNU/Linux comes with ABSOLUTELY NO WARRANTY, to the extent
permitted by applicable law.
Last login: Tue May  4 09:55:57 2021 from 172.1.4.5
alan@pibox:~ $
```

在树莓派OS上安装Cockpit web控制台和在Linux服务器上一样简单：


```
`$ sudo apt install cockpit`
```

Cockpit只需要60.4 KB的磁盘空间。加上它的几个包依赖项，总使用量是115MB。

安装过程将负责设置和启动服务。你可以使用 `systemctl` 命令来验证状态。


```
$ systemctl status cockpit.socket
● cockpit.socket - Cockpit Web Service Socket
   Loaded: loaded (/lib/systemd/system/cockpit.socket; enabled; vendor preset: enabled)
   Active: active (listening) since Tue 2021-05-04 10:24:43 EDT; 35s ago
     Docs: man:cockpit-ws(8)
   Listen: 0.0.0.0:9090 (Stream)
  Process: 6563 ExecStartPost=/usr/share/cockpit/motd/update-motd  localhost (code=exited, status=0/SUCCESS)
  Process: 6570 ExecStartPost=/bin/ln -snf active.motd /run/cockpit/motd (code=exited, status=0/SUCCESS)
    Tasks: 0 (limit: 2181)
   CGroup: /system.slice/cockpit.socket
```

### 使用Cockpit

#### 连接

默认的监听端口号是9090。打开你最喜欢的web浏览器并输入地址，例如： `https://pibox:9090`.

![Cockpit home page][3]

(Alan Formy-Duval, [CC BY-SA 4.0][4])

你现在可以使用你的常规账户登录。同样，在这个账户上使用sudo权限是很有帮助的——使用SSH和运行Apt很像。一定要勾选“为特权任务重用我的密码”。

#### 管理你的派

Cockpit的初始屏幕以 **System** 开始，将提供当前CPU和内存使用的详细信息和图。


![Initial Cockpit screen][5]

(Alan Formy-Duval, [CC BY-SA 4.0][4])

你可以从这个屏幕看到硬件细节。

![Cockpit hardware details][6]

(Alan Formy-Duval, [CC BY-SA 4.0][4])

通过点击每一项来展开左边的列（例如，日志、存储、服务等）。这些是标准的Cockpit部分，而且非常明显。

#### 日志

这部分展示了日志。它们可以根据日期和严重程度来过滤。

#### 存储

存储部分展示了已经安装的物理驱动器和RAID设备。例如大小、序列号等细节都被展示了出来。还展示了读/写活动和真实的空间使用的图。专门存储日志的在底部展示。

#### 网络

这部分展示了发送和接收活动、IP地址以及网络的日志。你也可以添加更多的网络设备，例如使用各自按钮的bonds、桥以及VLAN。

#### 账户

这里展示了已有的账户。点击每个账户来管理或使用创建新账户按钮来添加用户。账户也可以被删除。

#### 服务

这部分可以让管理员查看系统所有服务的状态。点击任何服务都会转到一个包含启动、重启和禁用的标准任务的屏幕。

#### 应用程序

通常，这个屏幕提供了各种用于管理功能的应用程序，例如389目录服务器或Podman同期的创建。但在我的树莓派OS上，这个屏幕只显示“没有安装或可用的应用程序”。在写应用程序的时候，这个或许还没有实现。尽管如此，你得不得怀疑这类型的过程对于树莓派硬件来说是否太沉重。

#### 软件更新

对任何系统管理员来说，保持软件最新是最重要的任务之一。Cockpit的软件更新部分检查并进行更新。

![Software updates in Cockpit][7]

(Alan Formy-Duval, [CC BY-SA 4.0][4])

#### 终端

Cockpit最整洁的特点之一是终端。你可以使用它，而不是打开一个单独的终端模拟器并使用SSH。我使用中断来安装[ScreenFetch][8]：


```
`$ sudo apt install screenfetch`
```

我使用ScreenFetch生成了这张截图：

![Terminal in Cockpit][9]

(Alan Formy-Duval, [CC BY-SA 4.0][4])

### 使用Cockpit的中心控制

Cockpit在树莓派上的行为就像它在任何其他Linux系统上一样。你可以将它添加到控制面板上进行集中控制。它允许组织将基于树莓派的服务和系统集成到他们的整个Linux基础设施中，无论Cockpit在哪里被用来作为管理控制面板的解决方案。这是非常方便的，因为派经常在无领导者的高密度机架数据中心运行，而这些数据中心通常会缺乏KVM访问。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/5/raspberry-pi-cockpit

作者：[Alan Formy-Duval][a]
选题：[lujun9972][b]
译者：[RiaXu](https://github.com/ShuyRoy)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/alanfdoss
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/raspberrypi_kuberenetes_cluster_lead2_0.jpeg?itok=kx0Zc0NK (Neon colorized Raspberry Pi cluster with LEGOs)
[2]: https://opensource.com/article/20/11/cockpit-server-management
[3]: https://opensource.com/sites/default/files/uploads/cockpit_homepage.png (Cockpit home page)
[4]: https://creativecommons.org/licenses/by-sa/4.0/
[5]: https://opensource.com/sites/default/files/uploads/cockpit_initialscreen.png (Initial Cockpit screen)
[6]: https://opensource.com/sites/default/files/uploads/hardware_details.png (Cockpit hardware details)
[7]: https://opensource.com/sites/default/files/uploads/software_updates.png (Software updates in Cockpit)
[8]: https://opensource.com/article/20/1/screenfetch-neofetch
[9]: https://opensource.com/sites/default/files/uploads/pi_cockpit_terminal.png (Terminal in Cockpit)

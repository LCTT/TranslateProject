[#]: subject: (Manage your Raspberry Pi with Cockpit)
[#]: via: (https://opensource.com/article/21/5/raspberry-pi-cockpit)
[#]: author: (Alan Formy-Duval https://opensource.com/users/alanfdoss)
[#]: collector: (lujun9972)
[#]: translator: (ShuyRoy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13487-1.html)

使用 Cockpit 管理你的树莓派
======

> 用 Cockpit 建立你的树莓派的控制中心。

![](https://img.linux.net.cn/data/attachment/album/202106/15/144053hmswm01w6qus011n.jpg)

去年，我写了关于使用 [Cockpit 管理我的 Linux 服务器的文章][2]。它是一个基于 Web 的工具，为管理多个服务器及其相关的服务和应用提供了一个简洁、强大的界面。它还简化了日常的管理任务。

在这篇文章中，我将会介绍如何在树莓派基金会提供的标准操作系统树莓派 OS 上安装用于 Linux 服务器的 Cockpit Web 控制台。我还会简要介绍它的特性。

### 在树莓派 OS 上安装 Cockpit

在 `sudo` 权限下使用一个账户通过 SSH 登录你的树莓派系统。如果你还没有建立一个账户：

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

在树莓派 OS 上安装 Cockpit Web 控制台和在 Linux 服务器上一样简单：

```
$ sudo apt install cockpit
```

Cockpit 只需要 60.4 KB 的磁盘空间。加上它的几个包依赖项，总使用量是 115MB。

安装过程将负责设置和启动服务。你可以使用 `systemctl` 命令来验证状态：

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

### 使用 Cockpit

#### 连接

默认的监听端口号是 9090。打开你最喜欢的 Web 浏览器并输入地址，例如： `https://pibox:9090`。

![Cockpit home page][3]

你现在可以使用你的普通账户登录。同样，这个账户上需要有使用 `sudo` 的权限 —— 很可能就是你用来 SSH 和运行 Apt 的那个账户。一定要勾选“为特权任务重用我的密码”。

#### 管理你的树莓派

Cockpit 的初始屏幕以 “System” 页开始，提供当前 CPU 和内存使用的详细信息和图表。

![Initial Cockpit screen][5]

你可以从这个屏幕看到硬件细节。

![Cockpit hardware details][6]

通过点击每一项来展开左边的列（例如，日志、存储、服务等）。这些是标准的 Cockpit 部分，不言自明。让我快速描述一下每个部分。

#### 日志

这部分展示了日志。它们可以根据日期和严重程度来过滤。

#### 存储

存储部分展示了已经安装的物理驱动器和 RAID 设备。例如大小、序列号等细节都被展示了出来。还展示了读/写活动和实际空间使用的图表。存储的具体日志显示在底部。

#### 网络

这部分展示了发送和接收活动、IP 地址以及网络特定的日志。你还可以使用相应的按钮添加更多的网络设备，如绑定、网桥和 VLAN。

#### 账户

这里展示了已有的账户。点击每个账户来管理，或使用创建新账户按钮来添加用户。账户也可以被删除。

#### 服务

这部分可以让管理员查看系统所有服务的状态。点击任何服务都会转到一个包含启动、重启和禁用的标准任务的屏幕。

#### 应用程序

通常，这个屏幕提供了各种用于管理功能的应用程序，例如 389 目录服务器或创建 Podman 容器。但在我的树莓派 OS 上，这个屏幕只显示“没有安装或可用的应用程序”。在写这篇文章的时候，这个或许还没有实现。虽然，你可能会怀疑这类型的程序对于树莓派硬件来说是否太过沉重。

#### 软件更新

对任何系统管理员来说，保持软件最新是最重要的任务之一。Cockpit 的软件更新部分可以检查并进行更新。

![Software updates in Cockpit][7]

#### 终端

Cockpit 最方便的特点之一是终端。你可以使用它，而不是打开一个单独的终端模拟器并使用 SSH。我使用终端来安装 [ScreenFetch][8]：

```
$ sudo apt install screenfetch
```

使用 ScreenFetch 生成了这张截图：

![Terminal in Cockpit][9]

### 使用 Cockpit 的中心控制

Cockpit 在树莓派上的表现就像它在其他 Linux 系统上一样。你可以将它添加到仪表盘上进行集中控制。它允许企业在 Cockpit 作为管理仪表盘解决方案的任何地方，将基于树莓派的服务和系统整合到他们的整体 Linux 基础设施中。因为树莓派经常在高密度机架数据中心以<ruby>无外接控制<rt>headless</rt></ruby>方式运行，而这些数据中心通常会缺乏 KVM 访问方式，这是非常方便的。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/5/raspberry-pi-cockpit

作者：[Alan Formy-Duval][a]
选题：[lujun9972][b]
译者：[RiaXu](https://github.com/ShuyRoy)
校对：[wxy](https://github.com/wxy)

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

[#]: subject: "How to screen share with the Linux KDE Plasma Desktop"
[#]: via: "https://opensource.com/article/22/2/screen-share-linux-kde"
[#]: author: "Seth Kenlon https://opensource.com/users/seth"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14332-1.html"

如何在 KDE Plasma 桌面进行屏幕共享
======

> krfb 和 krdc 的组合是使远程 Linux 支持变得无挫折感的宝贵工具。

![](https://img.linux.net.cn/data/attachment/album/202203/06/102407oi1sz113151dd5bw.jpg)

如果你曾经做过专业的或出于家庭义务的远程支持，在待命支持时，解决问题只是第二步，更重要的是可见用户屏幕上的实际内容。有多少次你描述了复杂的桌面任务，后来才发现你的用户甚至还没有打开他们的电脑？支持是重要的，但挫折感是真实的，对于需要支持的人和慷慨地试图提供支持的人来说，这都是一种共同的经历。我相信，作为学习新技能的一种方式，人们自己执行任务是很重要的，但也有一种说法是观察专家应该如何做。这就是屏幕共享的作用，KDE Plasma 桌面已经内置了它。

### 网络安全

Plasma 桌面使用点对点的邀请模式进行屏幕共享。用户启动一个应用，启动一个虚拟网络连接（VNC）服务器，这时，支持人员就可以远程查看甚至控制计算机。如果这听起来像是潜在的不安全，那是因为它可能就是，但有防火墙的干预。如果你是一个与你不在同一网络上的人的支持人员，那么你必须在屏幕共享工作之前建立一个从你的网络到你的用户的网络的安全通道。理想情况下，你会在紧急情况发生前完成这项工作。

  1. [配置用户的路由器][2]，将 VNC 端口（默认为 5900，但你可以使用任何你喜欢的端口）路由到他们的计算机。
  2. [在用户的本地防火墙中打开一个服务][3]，允许 VNC 流量（在你在第一步中指定的端口）。

### 远程邀请

为了启动屏幕共享会话，用户必须启动 **krfb**（表示 “KDE remote frame buffer”）应用。这将启动一个 VNC 服务器，并创建一个临时密码。

![krfb][4]

**krfb** 使用的默认端口是 5900，但如果你需要，可以在 **krfb** 设置中改变。不过，这可能是你想提前做的事情，这样你就可以避免向你的用户解释如何改变协议的端口。

### 查看和控制

当这个窗口打开时，你可以使用你喜欢的 VNC 客户端通过 VNC 登录。KDE 有 **krdc**（表示 “KDE remote desktop client”）应用。在支持的计算机上，启动它并向它提供目标 IP 地址。当你被提示输入密码时，输入你正在连接的 **krfb** 会话中显示的密码。

![Screen sharing with krdc][6]

连接上后，你就可以看到你用户的屏幕，你可以在他们遵循你的指示时引导他们。如果他们在遵循你的指示方面有困难，那么你可以控制他们的鼠标，并演示如何做某事。默认情况下，**krfb**（即他们正在运行的应用）在将控制权交给你之前会征求他们的同意。

### 帮助进行中

能够看到你的用户所看到的东西可以加速故障排除，减少支持电话双方的挫折感。只要你事先为你的支持设置好网络，**krfb** 和 **krdc** 的组合对于指导新用户完成 Linux 桌面发现之旅的 Linux 专业人士来说是很有价值的工具。

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/2/screen-share-linux-kde

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/laptop_screen_desk_work_chat_text.png?itok=UXqIDRDD (Person using a laptop)
[2]: https://opensource.com/article/20/9/firewall
[3]: https://opensource.com/article/19/7/make-linux-stronger-firewalls
[4]: https://opensource.com/sites/default/files/kde-krfb.jpg (krfb)
[5]: https://creativecommons.org/licenses/by-sa/4.0/
[6]: https://opensource.com/sites/default/files/kde-krdc-session.jpg (Screen sharing with krdc)

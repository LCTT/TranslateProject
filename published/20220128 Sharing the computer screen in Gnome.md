[#]: subject: "Sharing the computer screen in Gnome"
[#]: via: "https://fedoramagazine.org/sharing-the-computer-screen-in-gnome/"
[#]: author: "Lukáš Růžička https://fedoramagazine.org/author/lruzicka/"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14261-1.html"

在 Gnome 中共享电脑屏幕
======

![](https://img.linux.net.cn/data/attachment/album/202202/11/101112soc722i55ut7r6nq.jpg)

你不希望别人能够监视甚至控制你的电脑，你通常会努力使用各种安全机制来切断任何此类企图。然而，有时会出现这样的情况：你迫切需要一个朋友，或一个专家来帮助你解决电脑问题，但他们并不同时在同一地点。你如何向他们展示呢？你应该拿着你的手机，拍下你的屏幕照片，然后发给他们吗？你应该录制一个视频吗？当然不是。你可以与他们分享你的屏幕，并可能让他们远程控制你的电脑一段时间。在这篇文章中，我将介绍如何在 Gnome 中允许共享电脑屏幕。

### 设置服务器以共享屏幕

**服务器** 是一台提供（服务）一些内容的计算机，其他计算机（**客户端**）将消费这些内容。在本文中，服务器运行的是 **Fedora Workstation** 和标准的 **Gnome 桌面**。

#### 打开 Gnome 屏幕共享

默认情况下，Gnome 中共享计算机屏幕的功能是 **关闭** 的。要使用它，你需要把它打开：

1. 启动 <ruby>Gnome 控制中心<rt>Gnome Control Center</rt></ruby>。
2. 点击 <ruby>共享<rt>Sharing</rt></ruby> 标签。
  ![Sharing switched off][2]
3. 用右上角的滑块打开共享。
4. 单击 <ruby>屏幕共享<rt>Screen sharing</rt></ruby>。
  ![Sharing switched on][3]
5. 用窗口左上角的滑块打开屏幕共享。
6. 如果你希望能够从客户端控制屏幕，请勾选 <ruby>允许连接控制屏幕<rt>Allow connections to control the screen</rt></ruby>。不勾选这个按钮访问共享屏幕只允许 <ruby>仅浏览<rt>view-only</rt></ruby>。
7. 如果你想手动确认所有传入的连接，请选择 <ruby>新连接必须请求访问<rt>New connections must ask for access</rt></ruby>。
8. 如果你想允许知道密码的人连接（你不会被通知），选择 <ruby>需要密码<rt>Require a password</rt></ruby> 并填写密码。密码的长度只能是 8 个字符。
9. 勾选 <ruby>显示密码<rt>Show password</rt></ruby> 以查看当前的密码是什么。为了多一点保护，不要在这里使用你的登录密码，而是选择一个不同的密码。
10. 如果你有多个网络可用，你可以选择在哪个网络上访问该屏幕。

### 设置客户端以显示远程屏幕

**客户端** 是一台连接到由服务器提供的服务（或内容）的计算机。本演示还将在客户端上运行 **Fedora Workstation**，但如果它运行一个 VNC 客户端，操作系统实际上应该不太重要。

#### 检查可见性

在 Gnome 中，服务器和客户端之间共享计算机屏幕需要一个有效的网络连接，以及它们之间可见的“路由”。如果你不能建立这样的连接，你将无法查看或控制服务器的共享屏幕，这里描述的整个过程将无法工作。

为了确保连接的存在，找出服务器的 IP 地址。

启动 <ruby>Gnome 控制中心<rt>Gnome Control Center</rt></ruby>，又称 <ruby>设置<rt>Settings</rt></ruby>。使用右上角的**菜单**，或**活动**模式。当在**活动**中时，输入：

```
settings
```

并点击相应的图标。

选择 <ruby>网络<rt>Network</rt></ruby> 标签。

点击**设置按钮**（齿轮）以显示你的网络配置文件的参数。

打开 <ruby>详情<rt>Details</rt></ruby>标签，查看你的计算机的 IP 地址。

进入 **你的客户端的** 终端（你想从它连接到别的计算机），使用 `ping` 命令找出客户和服务器之间是否有连接。

```
$ ping -c 5 192.168.122.225
```

检查该命令的输出。如果它与下面的例子相似，说明计算机之间的连接存在。

```
PING 192.168.122.225 (192.168.122.225) 56(84) bytes of data.
64 bytes from 192.168.122.225: icmp_seq=1 ttl=64 time=0.383 ms
64 bytes from 192.168.122.225: icmp_seq=2 ttl=64 time=0.357 ms
64 bytes from 192.168.122.225: icmp_seq=3 ttl=64 time=0.322 ms
64 bytes from 192.168.122.225: icmp_seq=4 ttl=64 time=0.371 ms
64 bytes from 192.168.122.225: icmp_seq=5 ttl=64 time=0.319 ms
--- 192.168.122.225 ping statistics ---
5 packets transmitted, 5 received, 0% packet loss, time 4083ms
rtt min/avg/max/mdev = 0.319/0.350/0.383/0.025 ms
```

如果两台计算机存在同一个子网中，例如在你的家里或办公室，你可能不会遇到任何问题，但当你的服务器没有**公共 IP 地址**，无法从外部互联网上看到时，可能会出现问题。除非你是互联网接入点的唯一管理员，否则你可能需要就你的情况向你的管理员或你的 ISP 咨询。请注意，将你的计算机暴露在外部互联网上始终是一个有风险的策略，你**必须充分注意**保护你的计算机免受不必要的访问。

#### 安装 VNC 客户端（Remmina）

Remmina 是一个图形化的远程桌面客户端，你可以使用多种协议连接到远程服务器，如 VNC、Spice 或 RDP。Remmina 可以从 Fedora 仓库中获得，所以你可以用 `dnf` 命令或 <ruby>软件中心<rt>Software</rt></ruby> 来安装它，以你喜欢的方式为准。使用 `dnf`，下面的命令将安装该软件包和几个依赖项。

```
$ sudo dnf install remmina
```

#### 连接到服务器

如果服务器和客户端之间有连接，请确保以下情况：

1. 计算机正在运行。
2. Gnome 会话正在运行。
3. 启用了屏幕共享的用户已经登录。
4. 会话 **没有被锁定**，也就是说，用户可以使用该会话。

然后你可以尝试从客户端连接到该会话：

1. 启动 **Remmina**。
2. 在地址栏左侧的下拉菜单中选择 **VNC** 协议。
3. 在地址栏中输入服务器的IP地址，然后按下 **回车**。
 ![Remmina Window][4]
4. 当连接开始时，会打开另一个连接窗口。根据服务器的设置，你可能需要等待，直到服务器用户允许连接，或者你可能需要提供密码。
5. 输入密码，然后按 **OK**。
![Remmina Connected to Server][5]
6. 按下 ![Align with resolution button][6] 调整连接窗口的大小，使之与服务器的分辨率一致，或者按 ![Full Screen Button][8] 调整连接窗口的大小，使其覆盖整个桌面。当处于全屏模式时，注意屏幕上边缘的白色窄条。那是 Remmina 菜单，当你需要离开全屏模式或改变一些设置时，你可以把鼠标移到它上面。

当你回到服务器时，你会注意到现在在上栏有一个黄色的图标，这表明你正在 Gnome 中共享电脑屏幕。如果你不再希望共享屏幕，你可以进入菜单，点击 <ruby>屏幕正在被共享<rt>Screen is being shared</rt></ruby>，然后再选择 <ruby>关闭<rt>Turn off</rt></ruby>，立即停止共享屏幕。

![Turn off menu item][9]

#### 会话锁定时终止屏幕共享

默认情况下，当会话锁定时，连接 <ruby>将总是终止<rt>will always terminate</rt></ruby>。在会话被解锁之前，不能建立新的连接。

一方面，这听起来很合理。如果你想和别人分享你的屏幕，你可能不想让他们在你不在的时候使用你的电脑。另一方面，如果你想从远程位置控制你自己的电脑，无论是你在另一个房间的床上，还是你岳母的地方，同样的方法也不是很有用。有两个选项可以处理这个问题。你可以完全禁止锁定屏幕，或者使用支持通过 VNC 连接解锁会话的 Gnome 扩展。

##### 禁用屏幕锁定

要禁用屏幕锁定：

1. 打开 <ruby>Gnome 控制中心<rt>Gnome Control Center</rt></ruby>。
2. 点击 <ruby>隐私<rt>Privacy</rt></ruby>标签。
3. 选择 <ruby>屏幕锁定<rt>Screen Lock</rt></ruby> 设置。
4. 关掉 <ruby>自动屏幕锁定<rt>Automatic Screen Lock</rt></ruby>。

现在，会话将永远不会被锁定（除非你手动锁定），所以它能启动一个 VNC 连接到它。

##### 使用 Gnome 扩展来允许远程解锁会话

如果你不想关闭锁定屏幕的功能，或者你想有一个远程解锁会话的选项，即使它被锁定，你将需要安装一个提供这种功能的扩展，因为这种行为是默认不允许的。

要安装该扩展：

1. 打开**火狐浏览器**，并打开 [Gnome 扩展页面][10]。
  ![Gnome Extensions Page][11]
2. 在页面的上部，找到一个信息块，告诉你为火狐安装 “GNOME Shell integration”。
3. 点击 <ruby>点此安装浏览器扩展<rt>Click here to install browser extension</rt></ruby> 来安装 Firefox 扩展。
4. 安装完毕后，注意到 Firefox 的菜单部分有 Gnome 的标志。
5. 点击 Gnome 标志，回到扩展页面。
6. 搜索 “allow locked remote desktop”。
7. 点击显示的项目，进入该扩展的页面。
8. 使用右边的**开/关**按钮，将扩展**打开**。
  ![Extension selected][12]

现在，可以在任何时候启动 VNC 连接。注意，你需要知道会话密码以解锁会话。如果你的 VNC 密码与会话密码不同，你的会话仍然受到 _一点_ 保护。

### 总结

这篇文章介绍了在 Gnome 中实现共享计算机屏幕的方法。它提到了受限（_仅浏览_）访问和非受限（_完全_）访问之间的区别。然而，对于正式任务的远程访问，例如管理一个生产服务器，这个解决方案无论如何都不算是一个正确的方法。为什么？

  1. 服务器将始终保持其**控制模式**。任何在服务器会话中的人都将能够控制鼠标和键盘。
  2. 如果会话被锁定，从客户端解锁也会在服务器上解锁。它也会把显示器从待机模式中唤醒。任何能看到你的服务器屏幕的人都能看到你此刻正在做什么。
  3. VNC 协议本身没有加密或保护，所以你通过它发送的任何东西都可能被泄露。

你几种可以建立一个受保护的 VNC 连接的方法。例如，你可以通过 SSH 协议建立隧道，以提高安全性。然而，这些都超出了本文的范围。

**免责声明**：上述工作流程在 Fedora 35 上使用几个虚拟机工作时没有问题。如果它对你不起作用，那么你可能遇到了一个错误。请报告它。

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/sharing-the-computer-screen-in-gnome/

作者：[Lukáš Růžička][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/lruzicka/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2022/01/sharing_screen-816x345.jpg
[2]: https://fedoramagazine.org/wp-content/uploads/2022/01/settings_sharing_off.png
[3]: https://fedoramagazine.org/wp-content/uploads/2022/01/settings_sharing_on.png
[4]: https://fedoramagazine.org/wp-content/uploads/2022/01/remmina.png
[5]: https://fedoramagazine.org/wp-content/uploads/2022/01/remmina_connected_client.png
[6]: https://fedoramagazine.org/wp-content/uploads/2022/01/resolution.png
[8]: https://fedoramagazine.org/wp-content/uploads/2022/01/full_screen.png
[9]: https://fedoramagazine.org/wp-content/uploads/2022/01/turn_off_connection.png
[10]: https://extensions.gnome.org
[11]: https://fedoramagazine.org/wp-content/uploads/2022/01/extensions.png
[12]: https://fedoramagazine.org/wp-content/uploads/2022/01/switch_on_extension.png

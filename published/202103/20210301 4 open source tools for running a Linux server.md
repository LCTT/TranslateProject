[#]: subject: (4 open source tools for running a Linux server)
[#]: via: (https://opensource.com/article/21/3/linux-server)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)
[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13192-1.html)

4 个打造多媒体和共享服务器的开源工具
======

> 通过 Linux，你可以将任何设备变成服务器，以共享数据、媒体文件，以及其他资源。

![](https://img.linux.net.cn/data/attachment/album/202103/10/200529sqfnhnh553xfixuw.jpg)

在 2021 年，人们喜欢 Linux 的理由比以往任何时候都多。在这个系列中，我将分享 21 个使用 Linux 的不同理由。这里有四个开源工具，可以将任何设备变成 Linux 服务器。 

有时，我会发现有关服务器概念的某种神秘色彩。许多人，如果他们在脑海中有一个形象的话，他们认为服务器一定是又大又重的机架式机器，由一个谨慎的系统管理员和一群神奇的修理工精心维护。另一些人则把服务器设想成虚无缥缈的云朵，以某种方式为互联网提供动力。

虽然这种敬畏对 IT 工作的安全性是有好处的，但事实上，在开源计算中，没有人认为服务器是或应该是专家的专属领域。文件和资源共享是开源不可或缺的，而开源让它变得比以往任何时候都更容易，正如这四个开源服务器项目所展示的那样。

### Samba

[Samba 项目][2] 是 Linux 和 Unix 的 Windows 互操作程序套件。尽管它是大多数用户从未与之交互的底层代码，但它的重要性却不容小觑。从历史上看，早在微软争相消灭 Linux 和开源的时候，它就是最大最重要的目标。时代变了，微软已经与 Samba 团队会面以提供支持（至少目前是这样），在这一切中，该项目继续确保 Linux 和 Windows 计算机可以轻松地在同一网络上共存。换句话说，无论你使用什么平台，Samba 都可以让你可以轻松地在本地网络上共享文件。

在 [KDE Plasma][3] 桌面上，你可以右键点击自己的任何目录，选择**属性**。在**属性**对话框中，点击**共享**选项卡，并启用**与 Samba 共享（Microsoft Windows）**。

![Samba][4]

就这样，你已经为本地网络上的用户打开了一个只读访问的目录。也就是说，当你在家的时候，你家同一个 WiFi 网络上的任何人都可以访问该文件夹，如果你在工作，工作场所网络上的任何人都可以访问该文件夹。当然，要访问它，其他用户需要知道在哪里可以找到它。通往计算机的路径可以用 [IP 地址][6] 表示，也可以根据你的网络配置，用主机名表示。

### Snapdrop

如果通过 IP 地址和主机名来打开网络是令人困惑的，或者如果你不喜欢打开一个文件夹进行共享而忘记它是开放的，那么你可能更喜欢 [Snapdrop][7]。这是一个开源项目，你可以自己运行，也可以使用互联网上的演示实例通过 WebRTC 连接计算机。WebRTC 可以通过 Web 浏览器实现点对点的连接，也就是说同一网络上的两个用户可以通过 Snapdrop 找到对方，然后直接进行通信，而不需要通过外部服务器。

![Snapdrop][8]

一旦两个或更多的客户端连接了同一个 Snapdrop 服务，用户就可以通过本地网络来回交换文件和聊天信息。传输的速度很快，而且你的数据也保持在本地。

### VLC

流媒体服务比以往任何时候都更常见，但我在音乐和电影方面有非常规的口味，所以典型的服务似乎很少有我想要的东西。幸运的是，通过连接到媒体驱动器，我可以很容易地将自己的内容从我的电脑上传送到我的房子各个角落。例如，当我想在电脑显示器以外的屏幕上观看一部电影时，我可以在我的网络上串流电影文件，并通过任何可以接收 HTTP 的应用来播放它，无论该应用是在我的电视、游戏机还是手机上。

[VLC][9] 可以轻松设置流媒体。事实上，它是**媒体**菜单中的一个选项，或者你可以按下键盘 `Ctrl+S`。将一个文件或一组文件添加到你的流媒体队列中，然后点击 **Stream** 按钮。

![VLC][10]

VLC 通过配置向导来帮助你决定流媒体数据时使用什么协议。我倾向于使用 HTTP，因为它通常在任何设备上可用。当 VLC 开始播放文件时，请进入播放文件计算机的 IP 或主机名以及给它分配的端口 （当使用 HTTP 时，默认是 8080）, 然后坐下来享受。

### PulseAudio

我最喜欢的现代 Linux 功能之一是 [PulseAudio][11]。Pulse 为 Linux 上的音频实现了惊人的灵活性，包括可自动发现的本地网络流媒体。这个功能对我来说的好处是，我可以在办公室的工作站上播放播客和技术会议视频，并通过手机串流音频。无论我走进厨房、休息室还是后院最远的地方，我都能获得完美的音频。此功能在 PulseAudio 之前很久就存在，但是 Pulse 使它像单击按钮一样容易。

需要进行一些设置。首先，你必须确保安装 PulseAudio 设置包（**paprefs**），以便在 PulseAudio 配置中启用网络音频。

![PulseAudio][12]

在 **paprefs** 中，启用网络访问你的本地声音设备，可能不需要认证（假设你信任本地网络上的其他人），并启用你的计算机作为 **Multicast/RTP 发送者**。我通常只选择串流通过我的扬声器播放的任何音频，但你可以在 Pulse 输出选项卡中创建一个单独的音频设备，这样你就可以准确地选择串流的内容。你在这里有三个选项：

  * 串流任何在扬声器上播放的音频
  * 串流所有输出的声音
  * 只将音频直接串流到多播设备（按需）。

一旦启用，你的声音就会串流到网络中，并可被其他本地 Linux 设备接收。这是简单和动态的音频共享。

### 分享的不仅仅是代码

Linux 是共享的。它在服务器领域很有名，因为它很擅长*服务*。无论是提供音频流、视频流、文件，还是出色的用户体验，每一台 Linux 电脑都是一台出色的 Linux 服务器。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/3/linux-server

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/rack_server_sysadmin_cloud_520.png?itok=fGmwhf8I (A rack of servers, blue background)
[2]: http://samba.org
[3]: https://opensource.com/article/19/12/linux-kde-plasma
[4]: https://opensource.com/sites/default/files/uploads/samba_0.jpg (Samba)
[5]: https://creativecommons.org/licenses/by-sa/4.0/
[6]: https://opensource.com/article/18/5/how-find-ip-address-linux
[7]: https://github.com/RobinLinus/snapdrop
[8]: https://opensource.com/sites/default/files/uploads/snapdrop.jpg (Snapdrop)
[9]: https://www.videolan.org/index.html
[10]: https://opensource.com/sites/default/files/uploads/vlc-stream.jpg (VLC)
[11]: https://www.freedesktop.org/wiki/Software/PulseAudio/
[12]: https://opensource.com/sites/default/files/uploads/pulse.jpg (PulseAudio)

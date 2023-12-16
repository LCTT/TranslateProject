[#]: subject: "Jami: A Versatile Open-Source Distributed Communication App"
[#]: via: "https://itsfoss.com/jami/"
[#]: author: "Ankush Das https://itsfoss.com/author/ankush/"
[#]: collector: "lujun9972/lctt-scripts-1700446145"
[#]: translator: "ChatGPT"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-16471-1.html"

Jami：一款多功能开源分布式通讯应用
=======

![][0]

> 下面将引导你安装和使用 Jami，让你对其工作原理和你能从中获取的内容有更深入的理解。

不管你是为了联系亲爱的人，还是为了职业需求与同事/团队沟通，一个安全的通讯平台都是大家的需求。[Jami][1] 就是其中一款通讯平台，利用**分布式网络**来实现视频通话、文件分享、聊天等功能全都不经过服务器。

这个工具完全免费且开源，具有多样的功能。

然而，它的表现如何呢？用户体验会好么？使用体验能像其他已有的专有平台那么流畅么？或者，你能在手机上使用吗？

在这篇文章里，我们将仔细研究 Jami。我们试用了一下以助你作出更明智的决定。

### Jami 的特性

![][2]

对很多用户来说，体验的好坏取决于功能的全面性。

所以，在深入研究 Jami 之前，让我概述一下，你可以期待从它得到什么样的功能：

  * 即时发送消息
  * 群聊
  * 视频会议
  * 音频通话
  * 音频和视频信息
  * 屏幕共享
  * 文件分享
  * 增强功能的扩展
  * 作为 SIP（会话启动协议）客户端

看起来，Jami 是一款在考虑分布式解决方案时值得考虑的全能选项。

听上去挺刺激的，对吧？

那我们现在就来细看一下，看看它是如何工作的，以及我们能从中获得什么。

### 使用 Jami 的入门步骤

![在 Ubuntu 22.04 LTS 上通过 deb 包安装 Jami][3]

在你的系统上安装 Jami 是相当简单的。

你可以直接从它的网站下载最新的官方版本，或者直接在你的包管理器中（对于 Linux）搜索它。

它可以跨平台使用，包括：Linux、Windows、macOS、安卓和 iOS。

对于安卓用户，你可以在 Play Store 或 F-Droid 中安装。至本文撰写之时，Jami 支持所有最新和最棒的操作系统版本，所以，从这个层面上看，它的维护工作做得相当好。

在安装完成之后，就开始了注册过程。不像其他一些平台，它并不需要任何私人信息，只需要你创建一个你喜欢的独特用户名。

完成之后，你只需要把这个用户名与其他用户分享，就可以开始对话了。你也可以展现出 QR 码让其他人连接你。就是这么简单。

![][4]

在注册时，你可以选择加密你的帐户，以在设备上保护它，并自定义显示名。

### 使用 Jami 作为通讯平台

![][5]

使用这类平台时，我们的首要关心点通常是发送 / 接收消息的响应速度，以及语音 / 视频通话的质量。

好消息是：**使用体验快捷顺畅**。不管你是要发送一个视频信息，进行一个音频通话，还是发送文本，Jami 都像你想象的一样响应灵敏。

当我们谈及 **用户界面**，每个人的看法可能都会不同。我发现它的用户界面简明扼要，干净利落。

![][6]

然而，当你调窄应用窗口的宽度时，事情可能会有所不同。它失去了适应较小尺寸的能力，忽视了重要的元素，甚至难以顺畅地访问设置，这降低了使用体验。

![][7]

不要误会，你仍可以正常导航至所有选项。然而，体验感会显得有些生硬。

当把 Jami 的窗口缩小时，我点击了“<ruby>设置<rt>Settings</rt></ruby>”，结果直接进入了“<ruby>账户管理<rt>Manage Account</rt></ruby>”选项，而没有给我任何下拉菜单，也没有为我打开“<ruby>账户<rt>Accounts</rt></ruby>”/“<ruby>一般<rt>General</rt></ruby>”或“<ruby>音频/视频<rt>Audio/Video</rt></ruby>”部分。

假设我想要进入“音频/视频”设置，我就会进入账户设置。接下来，我需要再次导航到其他设置。这并不是一个让人感到方便的体验。

如果你不会经常调小 Jami 的窗口，或者你更喜欢大一点的窗口，那么你应该不会遇到此类问题。总结一下，如果你希望所有东西都有现代化的设计风格，那它可能会有些失望。

当你第一次发送/接收文本或通话时，会被视作一次邀请。一旦你接受了邀请，用户就会出现在你的会话列表中。

发送短信，添加新朋友的体验是无缝连接的，我没有遇到任何问题。

![][8]

> 📋 在撰写本文时进行的最新版本测试中，我无法关闭捐款消息。我答复的同事也遇到这个问题。

在信息中，你会有标记“正在输入中”的提示，你也可以回复一个特定的消息，用一个表情符号做出反应，附加文件，或发送语音或者视频消息。

这些消息都可以被编辑和删除。

![][9]

上面的对话截图是一个通过选择多个用户创建的群聊。

这样，当你创建这样的群聊时，一个新的邀请会被发送到用户那里，这是好的（不是强制他们加入群聊）。如果他们接受了邀请，他们就能加入你创建的群聊。

默认情况下，创建群组的设备将会默认承载群组内的任何音频 / 视频通话。

如果你连接的账户有多个设备，你可以选择你想要作为主机的那个设备。

通话体验有些不尽人意，具体来说，音频通话体验十分出色，音频清晰。

![][10]

然而，视频通话的音频方面就有些令人失望。

当然了，用直连的方式，视频质量会严重依赖网络连接，然而，和网络连接相比，我们得到的质量并没有那么好。（主机是我，网速是 200 Mbps）。

![][11]

视频质量可能是由于优化不佳或网络不佳导致的，但是，双方的音频并不清晰，音量在整个通话中都在上下波动。

虽然我的一些同事能分享他们的屏幕，但是在带有 AMD Radeon 集成 GPU 的 Ubuntu 22.04 LTS 上，应用崩溃了。

![][12]

默认情况下，你无法添加绿幕效果，这和一些专有的视频通话应用不同。然而，你可以安装扩展增加此类功能。

![][13]

另外，为了增强你的体验，你可以调整通话设置，包括自动接听电话，将你的账户作为接入点，切换正在输入中的指示等。

### 总结

如果 Jami 能在现代化用户界面这方面投入更多努力，那么它应该能成为像微软 Teams、Slack 和 Zoom 这样的应用的热门选择。

当然了，因为 P2P 连接原因，视频质量可能不如其他专有选项那么稳定。但在音频通话、视频/音频信息、文字输入、文件发送等方面你应该不会有任何问题，同时享受私密的通讯体验。

总的来说，Jami 为你提供了所有基本的需求，在一个更快的体验上提供了基本的用户界面。

> **[探究 Jami][1]**

它可能不能给你最好的用户体验，但是考虑到它在分布式网络连接、开源应用和隐私保护方面的优势，对于注重隐私的用户来说，它仍是个极好的选择。

*（题图：DA/26649e6b-a4b6-4591-a5c1-ecac982529a9）*

--------------------------------------------------------------------------------

via: https://itsfoss.com/jami/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://jami.net/
[2]: https://itsfoss.com/content/images/2023/12/Screenshot-from-2023-12-05-16-20-33.png
[3]: https://itsfoss.com/content/images/2023/12/jami-install-ubuntu.png
[4]: https://itsfoss.com/content/images/2023/12/jami-signup.png
[5]: https://itsfoss.com/content/images/2023/12/jami-main-screen.png
[6]: https://itsfoss.com/content/images/2023/12/jami-settings.png
[7]: https://itsfoss.com/content/images/2023/12/jami-small-screen.png
[8]: https://itsfoss.com/content/images/2023/12/jami-conversations-text.png
[9]: https://itsfoss.com/content/images/2023/12/jami-conversation-with-file.png
[10]: https://itsfoss.com/content/images/2023/12/jami-audio-call.png
[11]: https://itsfoss.com/content/images/2023/12/jami-video-call.png
[12]: https://itsfoss.com/content/images/2023/12/jami-calling.png
[13]: https://itsfoss.com/content/images/2023/12/jami-extensions.png
[0]: https://img.linux.net.cn/data/attachment/album/202312/14/090829o4hi8hi7844z4w88.jpg
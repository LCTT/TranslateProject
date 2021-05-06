[#]: collector: (lujun9972)
[#]: translator: (wyxplus)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13271-1.html)
[#]: subject: (4 open source chat applications you should use right now)
[#]: via: (https://opensource.com/article/20/4/open-source-chat)
[#]: author: (Sudeshna Sur https://opensource.com/users/sudeshna-sur)

值得现在就去尝试的四款开源聊天应用软件
======

> 现在，远程协作已作为一项必不可少的能力，让开源实时聊天成为你工具箱中必不可少的一部分吧。

![](https://img.linux.net.cn/data/attachment/album/202104/06/103454xundd858446u08r0.jpg)

清晨起床后，我们通常要做的第一件事是检查手机，看看是否有同事和朋友发来的重要信息。无论这是否是一个好习惯，但这种行为早已成为我们日常生活的一部分。

>  人是理性动物。他可以为任何他想相信的事情想出一个理由。
>  – 阿纳托尔·法朗士

无论理由是否合理，我们每天都在使用的一系列的通讯工具，例如电子邮件、电话、网络会议工具或社交网络。甚至在 COVID-19 之前，居家办公就已经使这些通信工具成为我们生活中的重要部分。随着疫情出现，居家办公成为新常态，我们交流方式的方方面面正面临着前所未有的改变，这让这些工具变得不可或缺。

### 为什么需要聊天？

作为全球团队的一部分进行远程工作时，我们必须要有一个相互协作的环境。聊天应用软件在帮助我们保持相互联系中起着至关重要的作用。与电子邮件相比，聊天应用软件可提供与全球各地的同事快速、实时的通信。

选择一款聊天应用软件需要考虑很多因素。为了帮助你选择最适合你的应用软件，在本文中，我将探讨四款开源聊天应用软件，和一个当你需要与同事“面对面”时的开源视频通信工具，然后概述在高效的通讯应用软件中，你应当考虑的一些功能。

### 四款开源聊天软件

#### Rocket.Chat

![Rocket.Chat][2]

[Rocket.Chat][3] 是一个综合性的通讯平台，其将频道分为公开房间（任何人都可以加入）和私有房间（仅受邀请）。你还可以直接将消息发送给已登录的人员。其能共享文档、链接、照片、视频和<ruby>动态图<rt>GIF</rt></ruby>，以及进行视频通话，并可以在平台中发送语音信息。

Rocket.Chat 是自由开源软件，但是其独特之处在于其可自托管的聊天系统。你可以将其下载到你的服务器上，无论它是本地服务器或是在公有云上的虚拟专用服务器。

Rocket.Chat 是完全免费，其 [源码][4] 可在 Github 获得。许多开源项目都使用 Rocket.Chat 作为他们官方交流平台。该软件在持续不断的发展且不断更新和改进新功能。

我最喜欢 Rocket.Chat 的地方是其能够根据用户需求来进行自定义操作，并且它使用机器学习在用户通讯间进行自动的、实时消息翻译。你也可以下载适用于你移动设备的 Rocket.Chat，以便能随时随地使用。

#### IRC

![IRC on WeeChat 0.3.5][5]

IRC（<ruby>[互联网中继聊天][6]<rt>Internet Relay Chat</rt></ruby>）是一款实时、基于文本格式的通信软件。尽管其是最古老的电子通讯形式之一，但在许多知名的软件项目中仍受欢迎。

IRC 频道是单独的聊天室。它可以让你在一个开放的频道中与多人进行聊天或与某人私下一对一聊天。如果频道名称以 `#` 开头，则可以假定它是官方的聊天室，而以 `##` 开头的聊天室通常是非官方的聊天室。

[上手 IRC][7] 很容易。你的 IRC 昵称可以让人们找到你，因此它必须是唯一的。但是，你可以完全自主地选择 IRC 客户端。如果你需要比标准 IRC 客户端更多功能的应用程序，则可以使用 [Riot.im][8] 连接到 IRC。

考虑到它悠久的历史，你为什么还要继续使用 IRC？出于一个原因是，其仍是我们所依赖的许多自由及开源项目的家园。如果你想参于开源软件开发和社区，可以选择用 IRC。

#### Zulip

![Zulip][9]

[Zulip][10] 是十分流行的群聊应用程序，它遵循基于话题线索的模式。在 Zulip 中，你可以订阅<ruby>流<rt>stream</rt></ruby>，就像在 IRC 频道或 Rocket.Chat 中一样。但是，每个 Zulip 流都会拥有一个唯一的<ruby>话题<rt>topic</rt></ruby>，该话题可帮助你以后查找对话，因此其更有条理。

与其他平台一样，它支持表情符号、内嵌图片、视频和推特预览。它还支持 LaTeX 来分享数学公式或方程式、支持 Markdown 和语法高亮来分享代码。

Zulip 是跨平台的，并提供 API 用于编写你自己的程序。我特别喜欢 Zulip 的一点是它与 GitHub 的集成整合功能：如果我正在处理某个<ruby>议题<rt>issue</rt></ruby>，则可以使用 Zulip 的标记回链某个<ruby>拉取请求<rt>pull request</rt></ruby> ID。

Zulip 是开源的（你可以在 GitHub 上访问其 [源码][11]）并且免费使用，但它有提供预置支持、[LDAP][12] 集成和更多存储类型的付费产品。

#### Let's Chat

![Let's Chat][13]

[Let's Chat][14] 是一个面向小型团队的自托管的聊天解决方案。它使用 Node.js 和 MongoDB 编写运行，只需鼠标点击几下即可将其部署到本地服务器或云服务器。它是自由开源软件，可以在 GitHub 上查看其 [源码][15]。

Let's Chat 与其他开源聊天工具的不同之处在于其企业功能：它支持 LDAP 和 [Kerberos][16] 身份验证。它还具有新用户想要的所有功能：你可以在历史记录中搜索过往消息，并使用 @username 之类的标签来标记人员。

我喜欢 Let's Chat 的地方是它拥有私人的受密码保护的聊天室、发送图片、支持 GIPHY 和代码粘贴。它不断更新，不断增加新功能。

### 附加：开源视频聊天软件 Jitsi

![Jitsi][17]

有时，文字聊天还不够，你还可能需要与某人面谈。在这种情况下，如果不能选择面对面开会交流，那么视频聊天是最好的选择。[Jitsi][18] 是一个完全开源的、支持多平台且兼容 WebRTC 的视频会议工具。

Jitsi 从 Jitsi Desktop 开始，已经发展成为许多 [项目][19]，包括 Jitsi Meet、Jitsi Videobridge、jibri 和 libjitsi，并且每个项目都在 GitHub 上开放了 [源码][20]。

Jitsi 是安全且可扩展的，并支持诸如<ruby>联播<rt>simulcast</rt></ruby>和<ruby>带宽预估<rt>bandwidth estimation</rt></ruby>之类的高级视频路由的概念，还包括音频、录制、屏幕共享和拨入功能等经典功能。你可以来为你的视频聊天室设置密码以保护其不受干扰，并且它还支持通过 YouTube 进行直播。你还可以搭建自己的 Jitsi 服务器，并将其托管在本地或<ruby>虚拟专用服务器<rt>virtual private server</rt></ruby>（例如 Digital Ocean Droplet）上。

我最喜欢 Jitsi 的是它是免费且低门槛的。任何人都可以通过访问 [meet.jit.si][21] 来立即召开会议，并且用户无需注册或安装即可轻松参加会议。（但是，注册的话能拥有日程安排功能。）这种入门级低门槛的视频会议服务让 Jitsi 迅速普及。

### 选择一个聊天应用软件的建议

各种各样的开源聊天应用软件可能让你很难抉择。以下是一些选择一款聊天应用软件的一般准则。

  * 最好具有交互式的界面和简单的导航工具。
  * 最好寻找一种功能强大且能让人们以各种方式使用它的工具。
  * 如果与你所使用的工具有进行集成整合的话，可以重点考虑。一些工具与 GitHub 或 GitLab 以及某些应用程序具有良好的无缝衔接，这将是一个非常有用的功能。
  * 有能托管到云主机的工具将十分方便。
  * 应考虑到聊天服务的安全性。在私人服务器上托管服务的能力对许多组织和个人来说是必要的。
  * 最好选择那些具有丰富的隐私设置，并拥有私人聊天室和公共聊天室的通讯工具。

由于人们比以往任何时候都更加依赖在线服务，因此拥有备用的通讯平台是明智之举。例如，如果一个项目正在使用 Rocket.Chat，则必要之时，它还应具有跳转到 IRC 的能力。由于这些软件在不断更新，你可能会发现自己已经连接到多个渠道，因此集成整合其他应用将变得非常有价值。

在各种可用的开源聊天服务中，你喜欢和使用哪些？这些工具又是如何帮助你进行远程办公？请在评论中分享你的想法。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/4/open-source-chat

作者：[Sudeshna Sur][a]
选题：[lujun9972][b]
译者：[wyxplus](https://github.com/wyxplus)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/sudeshna-sur
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/talk_chat_communication_team.png?itok=CYfZ_gE7 (Chat bubbles)
[2]: https://opensource.com/sites/default/files/uploads/rocketchat.png (Rocket.Chat)
[3]: https://rocket.chat/
[4]: https://github.com/RocketChat/Rocket.Chat
[5]: https://opensource.com/sites/default/files/uploads/irc.png (IRC on WeeChat 0.3.5)
[6]: https://en.wikipedia.org/wiki/Internet_Relay_Chat
[7]: https://opensource.com/article/16/6/getting-started-irc
[8]: https://opensource.com/article/17/5/introducing-riot-IRC
[9]: https://opensource.com/sites/default/files/uploads/zulip.png (Zulip)
[10]: https://zulipchat.com/
[11]: https://github.com/zulip/zulip
[12]: https://en.wikipedia.org/wiki/Lightweight_Directory_Access_Protocol
[13]: https://opensource.com/sites/default/files/uploads/lets-chat.png (Let's Chat)
[14]: https://sdelements.github.io/lets-chat/
[15]: https://github.com/sdelements/lets-chat
[16]: https://en.wikipedia.org/wiki/Kerberos_(protocol)
[17]: https://opensource.com/sites/default/files/uploads/jitsi_0_0.jpg (Jitsi)
[18]: https://jitsi.org/
[19]: https://jitsi.org/projects/
[20]: https://github.com/jitsi
[21]: http://meet.jit.si

[#]: subject: "9 Best Matrix Clients for Decentralized Messaging"
[#]: via: "https://itsfoss.com/best-matrix-clients/"
[#]: author: "Ankush Das https://itsfoss.com/author/ankush/"
[#]: collector: "lkxed"
[#]: translator: "TravinDreek"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-15515-1.html"

9 款最佳的去中心化通讯软件 Matrix 的客户端
======

![][0]

Matrix 是一套开放的网络标准，专用于去中心化实时加密通讯。

这套标准由 Matrix.org 基金会发布和维护。Matrix.org 基金会是一个非营利性组织，致力于创建一个开放、独立且不断演进的通讯平台。

如果一款应用支持 Matrix 协议，那就可以视它为 Matrix 客户端。

### 为何要选用 Matrix 客户端？

[Matrix][1] 客户端致力于安全性和隐私性，并且提供了一个去中心化的网络，令许多特性得以实现。

自 2019 年（正式版本发布）以来，部分组织以及政府机构便开始逐渐采用 Matrix 协议，从而搭建安全、隐私、可靠的通讯平台。

就实际而言，去中心化的协议实现了不同组织间的相互通讯，同时也使得这个通讯协议得以抵抗审查。

如果你想要逃脱科技巨头的魔爪，那 Matrix 就是正确的选择。

不仅如此，你还可以运行自己的服务器，并加入 Matrix 网络。换言之，通讯的基础设施是去中心化的，但你仍然能够根据需要，对其进行部署和配置。

如果你好奇的话，Matrix 协议具备了你需要的所有基本功能：

* 去中心化交流
* 端到端加密
* WebRTC 语音通话 / 视频通话
* 实时同步
* 消息已读用户显示
* “正在输入中” 提示
* 群组聊天

而且，我还要再强调一次：这个项目是**开源**的！

所以，Matrix 客户端已经是不二之选了。对那些注重隐私和安全的用户来说，则更是如此。

> LCTT 译注：实际上，Matrix 只是在隐私和便利之间达成了一种相对的平衡。它是将类似 Mastodon 的 <ruby>联邦<rt>federated</rt></ruby> 网络结构用在了聊天中，也就是说，虽然整个网络去中心化成了许多节点，但节点服务器的运营者仍然能对其用户进行少量掌控。但总的来说，相对那些中心化的聊天应用而言，Matrix 是个值得考虑的替代品。

### 9 款最佳的开源 Matrix 客户端

本文中，我将介绍一些最好用的 Matrix 客户端，其中主要是桌面客户端（Linux、Windows、macOS），同时也推荐一些移动客户端和终端客户端。

#### 1、Element

![element][2]

[Element][3] 是最佳的 Slack 开源替代品之一。它可以用于个人通讯，也能用于群组聊天。

你可以免费使用，不过你也可以选择自己搭建服务器，或者付费使用托管的家庭服务器。Element 提供了许多有用的功能，让你能够高效协作，并与你的团队或好友加密通讯。

> LCTT 译注：如同 Mastodon 一样，自费搭建服务器或者付费使用服务器，对大部分用户而言都是不必要的。初学者建议前往 <https://joinmatrix.org/servers/>，并选择一个现有的服务器进行注册，其中许多服务器都是免费开放注册，并且国内可以连接的。下述的订阅功能也并不是必要的。

如果你选择付费订阅，你还能将 Signal、WhatsApp 和 Telegram 聊天并入其中。

它支持 Linux、Windows 和 macOS，同时还提供 Android 和 iOS 的手机客户端。并且，你还能在网页浏览器中使用它。因此，这是个方便的选择。

> LCTT 译注：国内用户可能会在桌面客户端遇到错误，导致无法使用 Element。这是因为它在首次启动会连接 matrix.org，但是国内用户无法访问这个地址。要解决此问题，须手动修改配置文件（篇幅有限，详见相关教程）。实在无法解决，可使用基于 Element 的 [SchildiChat](https://schildi.chat/)，或下文列出的其他客户端。

> **[Element][4]**

#### 2、Rocket.Chat

![rocket chat][5]

[Rocket.Chat][6] 是另一个 Slack 替代品，我们更喜欢把它当成团队内部的通讯工具。

你可以在 Linux、Windows 和 macOS 上使用它，也可以获取 Android 和 iOS 的手机应用。

尽管你可以选择自建服务器或付费订阅，但它也宣布正在添加 [Matrix 协议的支持][7]。

本文创作之时，已经可以在 alpha 版中使用 Matrix 网络。不过，稳定版应该很快就会发布了。所以，如果你已经在使用 Rocket.Chat，或者想把它当作 Matrix 客户端来使用，那么敬请关注后续版本的发布。

> **[Rocket.Chat][8]**

#### 3、NeoChat

![neochat][9]

NeoChat 是一个简单的 Matrix 客户端，目前在 KDE 社区的管理下积极开发。

与 Element 不同，它只支持 Linux 和 Windows，特别是为 KDE Plasma 量身定做。你也可以在其他桌面环境使用它。

你可以在 KDE 的 “<ruby>发现<rt>Discover</rt></ruby>” 软件中心、Flathub 以及 Snap 商店安装它。它不支持手机平台。所以，如果有桌面用户想要一个简单的 Matrix 客户端，那 NeoChat 也是一个不错的选择。

> LCTT 译注：纠正一下，NeoChat 也支持安卓，可直接下载二进制，也可在 F-Droid 中添加 KDE 仓库后下载。除此之外，它还支持 macOS。详见其源代码仓库。

了解更多，可以查看它的 [源代码][10]。

> **[NeoChat][11]**

#### 4、FluffyChat

![fluffychat][12]

FluffyChat 在用户体验方面，是一个美观（可爱）的 Matrix 客户端。

如果你想要一个简单又直观的 Matrix 客户端，并且支持桌面和手机（安卓和 iOS），那么 FluffyChat 是一个不错的选择。

Linux 用户可以从 Snap 商店或 Flathub 安装它。它并不提供 Windows 和 macOS 的原生应用支持，但你可以在网页浏览器中使用它。

如果你好奇的话，可以从它的 [GitLab 页面][13] 了解更多。

> **[FluffyChat][14]**

#### 5、Fractal

![fractal][15]

Fractal 是一款用于 GNOME 桌面的 Matrix 聊天客户端，使用 Rust 编写。正如其描述所说，它的界面经过优化，适合大型团队的协作。

由于它以 Flatpak 的形式发布，你可以在任何 Linux 发行版上安装它，无论桌面环境如何。

如果你喜欢能够在系统上快速运行的应用，那 Fractal 可能是不错的选择。可以前往它的 [GitLab 页面][16] 了解更多。

> **[Fractal][17]**

#### 6、Hydrogen Web（实验性）

![hydrogen][18]

在找其它的精简的（专注性能）Matrix 客户端吗？

Hydrogen 聊天客户端提供轻量级体验、离线功能，并有着广泛的浏览器支持。

虽然仍未完工，但 Element 背后的同一支团队正在开发着它。所以，如果你期待看到一个轻量的 Matrix 客户端替代品，你可以在它的 [GitHub 页面][19] 跟进该项目。

> **[Hydrogen][20]**

#### 7、Matrix Commander（基于命令行）

如果你想要用终端在 Matrix 网络上来收发文字消息，这个命令行工具就十分不错。

当然，并非一切都能在终端完成。所以，最好创建 cron 任务来实现消息提醒、机器人等用例。

你可以在 [PyPi][21] 或者 Docker Hub 上找到它。

> **[Matrix Commander][22]**

#### 8、Gomuks（基于命令行）

![gomuks][23]

想试试用 Go 写的终端 Matrix 客户端？

并非每个人都可以尝试。不过，如果你喜欢用 Go 写的命令行工具，可以用 Gomuks 这个简单的 Matrix 客户端来进行基本聊天。

你可以在它的 [GitHub Releases 部分][24] 找到其 Linux、Windows 和 macOS 的二进制文件。

> **[Gomuks][25]**

#### 9、Syphon（Alpha 版）

![syphon][26]

我们通常会避免列出仍处于早期开发的程序。但是，Syphon 作为一个手机专用的 Matrix 客户端，是一个有趣的选择。

如果你想要为你的安卓 / iOS 设备安装一个类似 Signal 的开源 Matrix 客户端，那选择 Syphon 也不错。用户界面看起来很熟悉（但并不是完全照抄的）。如果你想实验一下，那可以试试。

> **[Syphon][27]**

### 总结

Matrix 协议也许没能流行于所有组织和人群之中。但是，可以证明的是，作为一个开源项目，它能称得上是一个隐私可靠的去中心化网络。

最好的一点在于，你可以选择你想要的客户端，而不必被迫使用特定的应用才能在多个设备之间进行通信。 

所以，你会选择什么作为你最喜欢的 Matrix客户端？

--------------------------------------------------------------------------------

via: https://itsfoss.com/best-matrix-clients/

作者：[Ankush Das][a]
选题：[lkxed][b]
译者：[Peaksol](https://github.com/TravinDreek)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lkxed
[1]: https://matrix.org/
[2]: https://itsfoss.com/content/images/wordpress/2022/06/element-2022.jpg
[3]: https://itsfoss.com/element/
[4]: https://element.io/
[5]: https://itsfoss.com/content/images/wordpress/2022/06/rocket-chat-2022.jpg
[6]: https://itsfoss.com/rocket-chat/
[7]: https://news.itsfoss.com/rocket-chat-matrix/
[8]: https://rocket.chat/
[9]: https://itsfoss.com/content/images/wordpress/2022/06/neochat.png
[10]: https://invent.kde.org/network/neochat
[11]: https://apps.kde.org/neochat/
[12]: https://itsfoss.com/content/images/wordpress/2022/06/fluffychat.png
[13]: https://gitlab.com/famedly/fluffychat
[14]: https://fluffychat.im/
[15]: https://itsfoss.com/content/images/wordpress/2022/06/fractal.png
[16]: https://gitlab.gnome.org/GNOME/fractal
[17]: https://wiki.gnome.org/Apps/Fractal
[18]:https://itsfoss.com/content/images/wordpress/2022/06/hydrogen.png
[19]: https://github.com/vector-im/hydrogen-web/
[20]: https://github.com/vector-im/hydrogen-web/
[21]: https://pypi.org/project/matrix-commander/
[22]: https://github.com/8go/matrix-commander
[23]: https://itsfoss.com/content/images/wordpress/2022/06/gomuks.png
[24]: https://github.com/tulir/gomuks/releases
[25]: https://maunium.net/go/gomuks/
[26]: https://itsfoss.com/content/images/wordpress/2022/06/syphon.jpg
[27]: https://syphon.org/
[0]: https://img.linux.net.cn/data/attachment/album/202302/06/163855x1rdxojvn1ohh00v.jpg
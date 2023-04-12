[#]: subject: "‘Speek!’ : An Open-Source Chat App That Uses Tor"
[#]: via: "https://itsfoss.com/speek/"
[#]: author: "Pratham Patel https://itsfoss.com/author/pratham/"
[#]: collector: "lkxed"
[#]: translator: "XiaotingHuang22"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

‘Speek!’ : 一个使用 Tor 的开源聊天应用程序
======
一个有趣的、开源的私人通讯软件，它利用 Tor （译者注：一个可以实现匿名通信的自由软件。其名源于「The Onion Router」（洋葱路由器）的英文缩写）来保证你的通信安全和私密。

Speek 是一种网络通讯服务，它利用多种技术保证网络聊天的私密性。

它是端到端加密的、去中心化和开源的。

毫无疑问，它的目标是将自己定位为 [WhatsApp 的替代品][1] 之一和 [Linux 上的 Signal][2] 的竞争对手。

那么，它到底如何呢？ 让我们一起来仔细看看细节。

### “Speek!” 适用于 Linux 和 Android 的点对点(译者注：又称对等式网络，是无中心服务器、依靠用户群（peers）交换信息的互联网体系，它的作用在于，减低以往网路传输中的节点，以降低资料遗失的风险。)即时消息应用程序

![Speek 截图][3]

Speek!（名称中带有感叹号）是一种加密的聊天软件，旨在对抗审查制度，同时保护数据隐私。

为了简单起见，我们在本文的其余部分忽略感叹号。

你也可以认为它是 [Session][4] 的替代品，但有一些区别。

与其他可用的通讯软件相比，它是一个相当新的竞争对手。 但是如果你想尝试开源的解决方案，它应该作为候选者。

虽然 Speek 声称能保持匿名，但如果你需要的是完全匿名的话，你应该始终注意自己在设备上的活动。 因为你需要考虑的不仅仅是即时通讯软件。

![speek id][5]

Speek 利用去中心化的 Tor 网络来保证安全性和私密性。 不仅如此，这样做可以让你无需电话号码就能使用服务。你只需要你的 Speek ID 就可以与人联系，而别人很难知道你的 ID。

### Speek 的亮点

![speek 选项][6]

Speek的一些主要亮点包括：

* 端到端加密：除收件人外，没有人可以查看您的消息。
* 通过 TOR 路由流量：使用 TOR 路由消息，增强隐私。
* 没有中央服务器：增加了对审查的抵抗力，因为很难关闭服务。 此外，没有针对黑客的单一攻击点。
* 无需注册：无需共享任何个人信息即可开始使用该服务。 你只需要一个公钥来识别/添加用户。
* 自毁聊天：当您关闭应用程序时，消息会自动删除。 增添了额外的隐私和安全性。
* 无元数据：它会在你交换消息时消除任何元数据。
* 私人文件共享：你还可以使用该服务安全地共享文件。

### 下载适用于 Linux 和其他平台的 Speek

你可以从他们的 [官方网站][7] 下载 Speek。

在撰写本文时，Speek 仅适用于 Linux、Android、macOS 和 Windows。

对于 Linux，你会找到一个 [AppImage][8] 文件。 如果你不知道 AppImages，可以参考我们的 [AppImage 指南][9] 来运行该应用程序。

![安卓系统上的 speek][10]

另外，[Google Play 商店][11] 上的 Android 应用程序还很新。 因此，你在尝试使用它时可以期待一下它的改进。

[Speek!][12]

### 关于 Speek 的用户体验

![Speek 截图][13]

这个应用的用户体验非常令人满意，包含了所有必备的功能。 它可以更好，但已经很不错了。

嗯，关于 Speek 的 GUI 没什么好说的。 GUI 非常极简风。 它的核心是一个聊天应用程序，而它做得恰如其分。 没有限时动态，没有地图，没有不必要的附加组件。

在我使用这个应用程序的有限时间里，我很满意它的功能。 它提供的功能使其成为一款出色的聊天应用程序，可通过其背后的所有技术提供安全和私密的消息传递体验。

如果将它与一些商业上更成功的聊天软件进行比较，它在功能上存在不足。 但话又说回来，Speek 的设计就不是一个只关注用户体验的时尚聊天应用。

因此，我只向注重隐私的用户推荐 Speek。 如果你想要平衡用户体验和功能，你可能希望继续使用像 Signal 这样的私人聊天软件。

*你对于 Speek 又有什么看法？ 对于注重隐私的用户来说，它是一个很好的私人聊天软件吗？ 请在下方评论区告诉我你的想法。*

--------------------------------------------------------------------------------

via: https://itsfoss.com/speek/

作者：[Pratham Patel][a]
选题：[lkxed][b]
译者：[XiaotingHuang22](https://github.com/XiaotingHuang22)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/pratham/
[b]: https://github.com/lkxed
[1]: https://itsfoss.com/private-whatsapp-alternatives/
[2]: https://itsfoss.com/install-signal-ubuntu/
[3]: https://itsfoss.com/wp-content/uploads/2022/05/01_speek_gui-1-800x532.webp
[4]: https://itsfoss.com/session-messenger/
[5]: https://itsfoss.com/wp-content/uploads/2022/05/speek-id-800x497.png
[6]: https://itsfoss.com/wp-content/uploads/2022/05/speek-options-800x483.png
[7]: https://speek.network
[8]: https://itsfoss.com/appimage-interview/
[9]: https://itsfoss.com/use-appimage-linux/
[10]: https://itsfoss.com/wp-content/uploads/2022/05/speek-android.jpg
[11]: https://play.google.com/store/apps/details?id=com.speek.chat
[12]: https://speek.network/
[13]: https://itsfoss.com/wp-content/uploads/2022/05/01_speek_gui-1-800x532.webp

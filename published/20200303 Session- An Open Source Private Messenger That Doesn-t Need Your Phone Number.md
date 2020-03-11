[#]: collector: (lujun9972)
[#]: translator: (HankChow)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11982-1.html)
[#]: subject: (Session: An Open Source Private Messenger That Doesn’t Need Your Phone Number)
[#]: via: (https://itsfoss.com/session-messenger/)
[#]: author: (Ankush Das https://itsfoss.com/author/ankush/)

Session：一款不需要电话号码的开源通信应用
======

Signal 作为一款私人通信应用，正在变得愈发流行。而我们下面要介绍开源应用 Session 则是 Signal 的一个<ruby>复刻<rt>fork</rt></ruby>，它的一大亮点是并不需要提供手机号码即可以开始使用。

### Session：一款真正意义上的私人通信应用

![][1]

对于私人通信服务来说，有没有既能保护通信安全性，又尊重用户跨平台隐私的集大成者呢？很多注重个人隐私的用户似乎都在寻找这个问题的答案。

最近，我留意到 [Loki 基金会][3]开发的一款叫做 [Session][2] 的开源通信应用。从技术上来说，Session 是另一款[开源、加密的通信应用 Signal][4] 的一个复刻。

在本文中，我会讲述我自己使用 Session 的体验，以及 Session 的一些主要功能。

Session 在这个领域中算是一款比较新的应用了，因此我还会在文章的最后提到它的一些不足之处。

### Session 的一些主要功能

接下来我会重点介绍 Session 的主要功能，可以供你参考这款应用是否值得使用。

#### Session 的使用过程中不需要提供手机号码

![][5]

在 Signal 或者其它类似的通信应用中，用户都需要提供手机号码才得以成功注册。注重隐私的用户们都认为这样的做法会潜藏着巨大的安全隐患。

而使用 Session 则简单得多。在 PC 或手机上安装应用之后，只需要点击“<ruby>创建账号<rt>Create Account</rt></ruby>”，无须提供手机号码，它就会生成一个类似 05652245af9a8bfee4f5a8138fd5c..... 这样的随机且唯一的 Session ID。

此后，把 Session ID 分享给想要添加的联系人就可以了。Session 还支持二维码，其他人可以通过扫描二维码添加你的 Session ID 为好友。

#### Session 使用了区块链等加密技术

![Session ID][6]

对[区块链][7]有所了解的用户都很期待区块链能为普罗大众做出什么有实际意义的应用，而 Session 可以算得上其中一个。尽管 Session 的核心是基于区块链的，但普通用户在使用时并不需要真正弄懂区块链。

如果你好奇它的工作原理，可以参考这篇[官方的博客文章][8]，里面有相关的解释。

#### 跨平台支持

![][9]

这样严格保护隐私的应用，是否能在不同平台上使用？

答案是肯定的。首先，它支持 Linux 和 Android 平台，同时也支持 Windows/Mac/iOS 平台。因此跨平台、跨设备的消息同步是没有问题的。

#### 包含基本隐私选项

![][10]

毫无疑问，基本的隐私功能是必须有的，这是作为一个以安全为卖点的应用所必备的体验。

最基本的选项包括：

* **消息有效期**：你可以控制一条消息在接收者阅读前的保留时长
* **已读回执**：消息发送者可以知晓你已经阅读该消息

#### Session 使用去中心化网络保护你的元数据

尽管 Session 不使用<ruby>端对端<rt>peer-to-peer</rt></ruby>技术，但它也不使用中心化的服务器。

Session 采用了去中心化的架构实现消息的传输和路由。如果你不熟悉这方面的内容，可以关注 Session 的官方博客，尝试了解[中心化网络和去中心化网络的区别][11]，以及它的实际工作原理。

同时，这样的网络架构还有助于保护诸如与 IP 地址相关的信息等元数据。

#### 其它功能

除了专注于隐私之外，Session 也支持群聊、语音消息、发送附件等通信应用的基本功能。

### 在 Linux 上安装 Session

在[官方下载页面][12]中可以下载到对应的 .AppImage 文件。如果你不了解这个文件的使用方法，可以查阅我们的[相关文章][13]。

另外，你也可以在它的 [Github 发布页面][14] 获取到对应的 .deb 安装文件。

- [下载 Session][12]

### 我使用 Session 的体验

我在各种平台上都试用过 Session，其中在 PC 上我使用了 Pop!\_OS 19.10 的 .AppImage 文件运行这个应用。

总的来说，使用的体验很不错，用户界面也没有出现问题。

在设置中备份了密码（也称为<ruby>种子<rt>seed</rt></ruby>）后，可以很方便地恢复账号。

![][15]

当然，我也发现了一些需要改进的地方：

* 在接受好友请求时会出现延迟
* 设备间连接的方式不太直观
* 当你在不同的设备上使用同一个 Session ID 向同一个人回复消息时，对方会收到两个不同的对话

### 总结

当然，最完美的事物是不存在的。我也会一直使用 Session 并考虑它发展的方向，这是一个注重隐私的用户应该做的事情。

欢迎在评论区发表你的看法。


--------------------------------------------------------------------------------

via: https://itsfoss.com/session-messenger/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[HankChow](https://github.com/HankChow)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/02/session-app.jpg?ssl=1
[2]: https://getsession.org/
[3]: https://loki.foundation/
[4]: https://linux.cn/article-11764-1.html
[5]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/02/session-create.jpg?ssl=1
[6]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/03/session-application-id.jpg?ssl=1
[7]: https://en.wikipedia.org/wiki/Blockchain
[8]: https://getsession.org/how-session-protects-your-anonymity-with-blockchain-and-crypto/
[9]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/02/session-cross-platform.jpg?ssl=1
[10]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/02/session-settings.jpg?fit=800%2C512&ssl=1
[11]: https://getsession.org/centralisation-vs-decentralisation-in-private-messaging/
[12]: https://getsession.org/download/
[13]: https://itsfoss.com/use-appimage-linux/
[14]: https://github.com/loki-project/session-desktop/releases
[15]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/02/session-seed.jpg?ssl=1

[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12656-1.html)
[#]: subject: (How Nextcloud simplified the signup process for decentralization)
[#]: via: (https://opensource.com/article/20/9/decentralization-signup)
[#]: author: (Jan C. Borchardt https://opensource.com/users/jancborchardt)

Nextcloud 如何简化去中心化的注册流程？
======

> Nextcloud 是开源软件，我们不提供托管服务，但我们却能从根本上简化注册体验。

![](https://img.linux.net.cn/data/attachment/album/202009/27/100351eqd88qub0b3ww0tu.jpg)

我们一直有个列表，上面有几十个 Nextcloud 提供商，然而我听到的最常见的问题，即使是我的技术方面的朋友，也是： 

> ”嗨，Jan，你推荐哪个 Nextcloud 提供商？”

当然，这也是可以理解的。如果你有一长串的供应商，你怎么选择？托管商在附近？名字可爱？标志最大？

每一个使用服务器的去中心化开源解决方案都在努力解决这些：

  * Mastodon 有 [joinmastodon.org][2] 来选择社区，但很明显主实例是 mastodon.social。
  * Diaspora 有[joindiaspora.com][3]，它也是主实例。
  * Matrix 有 [matrix.to][4]，还有一个在 [Element.io][5] 的应用（多平台）。
  * WordPress 有 [wordpress.com][6]。我不确定是否有提供商能接近它的知名度。
  * PeerTube 有一堆实例，都有不同的技术细节。
  * Pixelfed 在[beta.joinpixelfed.org][7] 有一个早期版本的实例选择器，以及在 [pixelfed.social][8] 有一个大型实例。
  * 还有更多的去中心化开源应用的例子，这里列出了如何通过终端访问它、设置 Rust 实现、或使其在网络打印机上运行。

这就导致了一些问题：

  * 🔮 人们不知道该选哪个，有<ruby>错失恐惧症<rt>Fear Of Missing Out</rt></ruby>（FOMO），然后根本不选。这就是选择的悖论！
  * 🕸 网络并不是真正的去中心化，因为大多数人都在少数服务器上，或者主要是只有一台服务器。

Nextcloud 不存在这些问题。

### 我们的解决方案：简单注册

这是它是如何工作的：

当你下载我们的手机或桌面应用时，你首先看到的是“登录”或“使用供应商注册”的选择。这是任何专有应用都会做的事情：

![Android client][9]

选择“注册”可打开应用中的[简易注册页面][10]。

![Web client][11]

你输入你的电子邮件地址，然后点击“注册”。

输入密码，就可以了! 🎉

> ”等一下，这怎么这么简单？“

我知道，对吧？✨

事实上，它甚至比很多集中式的应用更简单，在那里你需要输入你的全名和电话号码，然后点击谷歌的验证码。

这基本上可以归结为：

### 我们为你选择

而不是面对一个无法判断什么适合你供应商的名单，我们只向你展示一个选择。就好像我是你的朋友一样，我回答了那个关于我推荐哪家供应商的问题。

很好！😊

澄清一下：你可以修改供应商，但默认的应该很适合你。目前，它只是地理位置上离你最近的提供商。

除此之外，我们对通过简单注册列出的提供商有一些要求，以确保无论你选择哪一个提供商都能获得良好的用户体验：

  * 🎁 2 GB 的免费存储空间，而且不仅仅是试用期。
  * 🍱 一套核心应用。文件、日历、联系人、邮件、通话、任务、笔记。有些供应商甚至提供更多。
  * 🛡 最新版本，让你始终保持最新的功能、修复和安全更新。

除此之外，我们还提出了一个尊重隐私的流程。当你点击“注册”时，你的邮件不会发送给我们，而是直接发送给你选择的供应商，这将无缝过渡到他们的设置步骤，在那里你选择一个密码。这意味着在 Nextcloud 不会有任何数据泄露给我们，我们甚至不知道你选择的是哪家提供商！

因此，虽然我们提供这项服务，而且它超级容易使用，但我们只做绝对最低限度的数据处理，以连接你与你的理想供应商。

### 去中心化项目需要简单的注册方式

很多开源软件项目可以从简单注册这样的体验中受益。我们[在最初发布的时候写过有关它的文章][12]，我们希望这篇文章能澄清使它成功的设计决策，以便它能被更多项目采用。

去中心化是赋能，但只有当人们即使不知道服务器是什么也能简单注册时，才是真正的革命。

当然，现在也还不完美。比如，如果你已经在 Nextcloud 实例上有了账户，任何一个应用的登录过程都会要求你输入一个服务器地址，而很多人根本不知道那是什么。比如在很多邮件应用中，在这一步会有一个最受欢迎的供应商列表，底部有一个“自定义服务器”的条目。这也可能是一种可能性，但同样带来了系统过于集中的风险，或者让人们对选择什么感到困惑。

所以，我们不断尝试为所有 Nextcloud 桌面和移动应用改进这一点，比如 Nextcloud Talk 或者所有优秀的社区开发的应用。在 Android 上，我们与 DAVx5（Android 上的日历和联系人同步）紧密集成，而且，对于其他 Android 应用，还有一个[单点登录库][13]。不幸的是，在 iOS 上，就没有那么容易了，因为应用必须来自同一个开发者才能共享凭证。

如果你想合作解决类似这些有趣的挑战，[来加入我们的 Nextcloud 设计团队吧][14]！

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/9/decentralization-signup

作者：[Jan C. Borchardt][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jancborchardt
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/rh_003601_05_mech_osyearbook2016_cloud_cc.png?itok=XSV7yR9e (clouds in the sky with blue pattern)
[2]: https://joinmastodon.org/
[3]: https://joindiaspora.com
[4]: https://matrix.to
[5]: http://Element.io
[6]: https://wordpress.com
[7]: http://beta.joinpixelfed.org
[8]: http://pixelfed.social
[9]: https://opensource.com/sites/default/files/nextcloud-android-small.png (Android client)
[10]: https://nextcloud.com/signup
[11]: https://opensource.com/sites/default/files/nextcloud-web-small.png (Web client)
[12]: https://nextcloud.com/blog/introducing-simple-signup-you-can-now-get-started-with-nextcloud-in-2-steps/
[13]: https://github.com/nextcloud/Android-SingleSignOn
[14]: https://nextcloud.com/design

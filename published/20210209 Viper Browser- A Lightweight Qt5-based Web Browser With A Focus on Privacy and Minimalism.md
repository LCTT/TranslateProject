[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13139-1.html)
[#]: subject: (Viper Browser: A Lightweight Qt5-based Web Browser With A Focus on Privacy and Minimalism)
[#]: via: (https://itsfoss.com/viper-browser/)
[#]: author: (Ankush Das https://itsfoss.com/author/ankush/)

Viper 浏览器：一款注重隐私和简约的轻量级 Qt5 浏览器
======

![](https://img.linux.net.cn/data/attachment/album/202102/21/110148d7r3hlurczc1ci73.jpg)

> Viper 浏览器是一个基于 Qt 的浏览器，它提供了简单易用的用户体验，同时考虑到隐私问题。

虽然大多数流行的浏览器都运行在 Chromium 之上，但像 [Firefox][1]、[Beaker 浏览器][2]以及其他一些 [chrome 替代品][3]这样独特的替代品不应该停止存在。

尤其是考虑到谷歌最近可能想到从 Chromium 中剥离[谷歌浏览器特有的功能][4]，并给出了滥用的借口。

在寻找更多的 Chrome 替代品时，我在 [Mastodon][6] 上看到了一个有趣的项目 “[Viper 浏览器][5]”。

### Viper 浏览器：一个基于 Qt5 的开源浏览器

**注意**：Viper 浏览器是一个只有几个贡献者的相当新的项目。它缺乏某些功能，我将在下文提及。

Viper 是一款有趣的 Web 浏览器，在利用 [QtWebEngine][8] 的同时，它专注于成为一个强大而又轻巧的选择。

QtWebEngine 借用了 Chromium 的代码，但它不包括连接到 Google 平台的二进制文件和服务。

我花了一些时间使用它并进行一些日常浏览活动，我必须说，我对它相当感兴趣。不仅仅是因为它是一个简单易用的东西（浏览器可以那么复杂），而且它还专注于增强你的隐私，为你提供添加不同的广告阻止选项以及一些有用的选项。

![][9]

虽然我认为它并不是为所有人准备的，但还是值得一看的。在你继续尝试之前，让我简单介绍一下它的功能。

### Viper 浏览器的功能

![][10]

我将列出一些你会发现有用的关键功能：

* 管理 cookies 的能力
* 多个预设选项以选择不同的广告屏蔽器网络。
* 简单且易于使用
* 隐私友好的默认搜索引擎 - [Startpage][11] （你可以更改）
* 能够添加用户脚本
* 能够添加新的 user-agent
* 禁用 JavaScript 的选项
* 能够阻止图像加载

除了这些亮点之外，你还可以轻松地调整隐私设置，以删除你的历史记录、清理已有 cookies，以及一些更多的选项。

![][12]

### 在 Linux 上安装 Viper 浏览器

它只是在[发布页][13]提供了一个 AppImage 文件，你可以利用它在任何 Linux 发行版上进行测试。

如果你需要帮助，你也可以参考我们的[在 Linux 上使用 AppImage 文件][14]指南。如果你好奇，你可以在 [GitHub][5] 上探索更多关于它的内容。

- [Viper 浏览器][5]

### 我对使用 Viper 浏览器的看法

我不认为这是一个可以立即取代你当前浏览器的东西，但如果你有兴趣测试尝试提供 Chrome 替代品的新项目，这肯定是其中之一。

当我试图登录我的谷歌账户时，它阻止了我，说它可能是一个不安全的浏览器或不支持的浏览器。因此，如果你依赖你的谷歌帐户，这是一个令人失望的消息。

但是，其他社交媒体平台也可以与 YouTube 一起正常运行（无需登录）。不支持 Netflix，但总体上浏览体验是相当快速和可用的。

你可以安装用户脚本，但 Chrome 扩展还不支持。当然，这要么是有意为之，要么是在开发过程中特别考虑到它是一款隐私友好型的网络浏览器。

### 总结

考虑到这是一个鲜为人知但对某些人来说很有趣的东西，你对我们有什么建议吗？ 是一个值得关注的开源项目么？

请在下面的评论中告诉我。

--------------------------------------------------------------------------------

via: https://itsfoss.com/viper-browser/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://www.mozilla.org/en-US/firefox/new/
[2]: https://itsfoss.com/beaker-browser-1-release/
[3]: https://itsfoss.com/open-source-browsers-linux/
[4]: https://www.bleepingcomputer.com/news/google/google-to-kill-chrome-sync-feature-in-third-party-browsers/
[5]: https://github.com/LeFroid/Viper-Browser
[6]: https://mastodon.social/web/accounts/199851
[7]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/02/viper-browser.png?resize=800%2C583&ssl=1
[8]: https://wiki.qt.io/QtWebEngine
[9]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/02/viper-browser-setup.jpg?resize=793%2C600&ssl=1
[10]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/02/viper-preferences.jpg?resize=800%2C660&ssl=1
[11]: https://www.startpage.com
[12]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/02/viper-browser-tools.jpg?resize=800%2C262&ssl=1
[13]: https://github.com/LeFroid/Viper-Browser/releases
[14]: https://itsfoss.com/use-appimage-linux/

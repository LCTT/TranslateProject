[#]: subject: (NewsFlash: A Modern Open-Source Feed Reader With Feedly Support)
[#]: via: (https://itsfoss.com/newsflash-feedreader/)
[#]: author: (Ankush Das https://itsfoss.com/author/ankush/)
[#]: collector: (lujun9972)
[#]: translator: (DCOLIVERSUN)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13264-1.html)

NewsFlash: 一款支持 Feedly 的现代开源 Feed 阅读器
======

![](https://img.linux.net.cn/data/attachment/album/202104/03/001037r2udx6u6xqu5sqzu.jpg)

有些人可能认为 RSS 阅读器已经不再，但它们仍然坚持在这里，特别是当你不想让大科技算法来决定你应该阅读什么的时候。Feed 阅读器可以帮你自助选择阅读来源。

我最近遇到一个很棒的 RSS 阅读器 NewsFlash。它支持通过基于网页的 Feed 阅读器增加 feed，例如 [Feedly][1] 和 NewsBlur。这是一个很大的安慰，因为如果你已经使用这种服务，就不必人工导入 feed，这节省了你的工作。

NewsFlash 恰好是 [FeedReadeer][2] 的精神继承者，原来的 FeedReader 开发人员也参与其中。

如果你正在找适用的 RSS 阅读器，我们整理了 [Linux Feed 阅读器][3] 列表供您参考。

### NewsFlash: 一款补充网页 RSS 阅读器账户的 Feed 阅读器

![][4]

请注意，NewsFlash 并不只是针对基于网页的 RSS feed 账户量身定做的，你也可以选择使用本地 RSS feed，而不必在多设备间同步。

不过，如果你在用是任何一款支持的基于网页的 feed 阅读器，那么 NewsFlash 特别有用。

这里，我将重点介绍 NewsFlash 提供的一些功能。

### NewsFlash 功能

![][5]

  * 支持桌面通知
  * 快速搜索、过滤
  * 支持标签
  * 便捷、可重定义的键盘快捷键
  * 本地 feed
  * OPML 文件导入/导出
  * 无需注册即可在 Feedly 库中轻松找到不同 RSS Feed
  * 支持自定义字体
  * 支持多主题（包括深色主题）
  * 启动/禁止缩略图
  * 细粒度调整定期同步间隔时间
  * 支持基于网页的 Feed 账户，例如 Feedly、Fever、NewsBlur、feedbin、Miniflux

除上述功能外，当你调整窗口大小时，还可以打开阅读器视图，这是一个细腻的补充功能。

![newsflash 截图1][6]

账户重新设置也很容易，这将删除所有本地数据。是的，你可以手动清除缓存并设置到期时间，并为你关注的所有 feed 设置一个用户数据存在本地的到期时间。

### 在 Linux 上安装 NewsFlash

你无法找到适用于各种 Linux 发行版的官方软件包，只有 [Flatpak][8]。

对于 Arch 用户，可以从 [AUR][9] 下载。

幸运的是，[Flatpak][10] 软件包可以让你轻松在 Linux 发行版上安装 NewsFlash。具体请参阅我们的 [Flatpak 指南][11]。

你可以参考 NewsFlash 的 [GitLab 页面][12] 去解决大部分问题。

### 结束语

我现在用 NewsFlash 作为桌面本地解决方案，不用基于网页的服务。你可以通过直接导出 OPML 文件在移动 feed 应用上得到相同的 feed。这已经被我验证过了。

用户界面易于使用，也提供了数一数二的新版 UX。虽然这个 RSS 阅读器看似简单，但提供了你可以找到的所有重要功能。

你怎么看 NewsFlash？你喜欢用其他类似产品吗？欢迎在评论区中分享你的想法。

--------------------------------------------------------------------------------

via: https://itsfoss.com/newsflash-feedreader/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[DCOLIVERSUN](https://github.com/DCOLIVERSUN)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://feedly.com/
[2]: https://jangernert.github.io/FeedReader/
[3]: https://itsfoss.com/feed-reader-apps-linux/
[4]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/03/newsflash.jpg?resize=945%2C648&ssl=1
[5]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/03/newsflash-screenshot.jpg?resize=800%2C533&ssl=1
[6]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/03/newsflash-screenshot-1.jpg?resize=800%2C532&ssl=1
[7]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2018/04/best-feed-reader-apps-linux.jpg?fit=800%2C450&ssl=1
[8]: https://flathub.org/apps/details/com.gitlab.newsflash
[9]: https://itsfoss.com/aur-arch-linux/
[10]: https://itsfoss.com/what-is-flatpak/
[11]: https://itsfoss.com/flatpak-guide/
[12]: https://gitlab.com/news-flash/news_flash_gtk

[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11876-1.html)
[#]: subject: (Get your RSS feeds and podcasts in one place with this open source tool)
[#]: via: (https://opensource.com/article/20/1/open-source-rss-feed-reader)
[#]: author: (Kevin Sonney https://opensource.com/users/ksonney)

使用此开源工具在一起收取你的 RSS 订阅源和播客
======

> 在我们的 20 个使用开源提升生产力的系列的第十二篇文章中使用 Newsboat 收取你的新闻 RSS 源和播客。

![](https://img.linux.net.cn/data/attachment/album/202002/10/162526wv5jdl0m12sw10md.jpg)

去年，我在 19 天里给你介绍了 19 个新（对你而言）的生产力工具。今年，我换了一种方式：使用你在使用或者还没使用的工具，构建一个使你可以在新一年更加高效的环境。

### 使用 Newsboat 访问你的 RSS 源和播客

RSS 新闻源是了解各个网站最新消息的非常方便的方法。除了 Opensource.com，我还会关注 [SysAdvent][2] sysadmin 年度工具，还有一些我最喜欢的作者以及一些网络漫画。RSS 阅读器可以让我“批处理”阅读内容，因此，我每天不会在不同的网站上花费很多时间。

![Newsboat][3]

[Newsboat][4] 是一个基于终端的 RSS 订阅源阅读器，外观感觉很像电子邮件程序 [Mutt][5]。它使阅读新闻变得容易，并有许多不错的功能。

安装 Newsboat 非常容易，因为它包含在大多数发行版（以及 MacOS 上的 Homebrew）中。安装后，只需在 `~/.newsboat/urls` 中添加订阅源。如果你是从其他阅读器迁移而来，并有导出的 OPML 文件，那么可以使用以下方式导入：

```
newsboat -i </path/to/my/feeds.opml>
```

添加订阅源后，Newsboat 的界面非常熟悉，特别是如果你使用过 Mutt。你可以使用箭头键上下滚动，使用 `r` 检查某个源中是否有新项目，使用 `R` 检查所有源中是否有新项目，按回车打开订阅源，并选择要阅读的文章。

![Newsboat article list][6]

但是，你不仅限于本地 URL 列表。Newsboat 还是 [Tiny Tiny RSS][7]、ownCloud 和 Nextcloud News 等新闻阅读服务以及一些 Google Reader 后续产品的客户端。[Newsboat 的文档][8]中涵盖了有关此的详细信息以及其他许多配置选项。

![Reading an article in Newsboat][9]

#### 播客

Newsboat 还通过 Podboat 提供了[播客支持][10]，Podboat 是一个附带的应用，它可帮助下载和排队播客节目。在 Newsboat 中查看播客源时，按下 `e` 将节目添加到你的下载队列中。所有信息将保存在 `~/.newsboat` 目录中的队列文件中。Podboat 读取此队列并将节目下载到本地磁盘。你可以在 Podboat 的用户界面（外观和行为类似于 Newsboat）执行此操作，也可以使用 `podboat -a` 让 Podboat 下载所有内容。作为播客人和播客听众，我认为这*真的*很方便。

![Podboat][11]

总体而言，Newsboat 有一些非常好的功能，并且是一些基于 Web 或桌面应用的不错的轻量级替代方案。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/1/open-source-rss-feed-reader

作者：[Kevin Sonney][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/ksonney
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/ship_captain_devops_kubernetes_steer.png?itok=LAHfIpek (Ship captain sailing the Kubernetes seas)
[2]: https://sysadvent.blogspot.com/
[3]: https://opensource.com/sites/default/files/uploads/productivity_12-1.png (Newsboat)
[4]: https://newsboat.org
[5]: http://mutt.org/
[6]: https://opensource.com/sites/default/files/uploads/productivity_12-2.png (Newsboat article list)
[7]: https://tt-rss.org/
[8]: https://newsboat.org/releases/2.18/docs/newsboat.html
[9]: https://opensource.com/sites/default/files/uploads/productivity_12-3.png (Reading an article in Newsboat)
[10]: https://newsboat.org/releases/2.18/docs/newsboat.html#_podcast_support
[11]: https://opensource.com/sites/default/files/uploads/productivity_12-4.png (Podboat)

[#]: collector: (lujun9972)
[#]: translator: (lxbwolf)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12203-1.html)
[#]: subject: (Browse the Peer-to-peer Web With Beaker Browser)
[#]: via: (https://itsfoss.com/beaker-browser/)
[#]: author: (John Paul https://itsfoss.com/author/john/)

使用 Beaker 浏览器浏览对等 Web
======

![](https://img.linux.net.cn/data/attachment/album/202005/10/082745ztmi4kqh4iq449ll.jpg)

在过去 50 年中，我们所了解的互联网没有什么变化，全球的网民使用他们的设备从遍布在世界各地的服务器上检索数据。

一群专业的技术专家想改变现状，使互联网变成人们可以连接和直接分享信息的地方，而不是依赖一个中心服务器（去中心化）。

我们已经在 It’s FOSS 讨论过很多这样的去中心化的服务。[YouTube 竞品：LBRY][1]、[Twitter 竞品：Mastodon][2] 是其中的两个例子。

今天我将要介绍另一个这样的产品，名为 [Beaker 浏览器][3]，它的设计目标是浏览对等 Web。

![Beaker Browser][4]

### “对等 Web” 是什么？

根据 Beaker 浏览器的[开发者之一][5]的描述，“对等 Web 是一项实验性的技术 ……旨在提高我们掌控 Web 的能力。”

还有，他们说对等 Web 有三个主要原则：任何一点都可以成为服务器；多台计算机可以为同一个网站提供服务；没有后端。

从这些原则中你可以看出，对等 Web 的思想与 BitTorrent 很像，文件由多个对端做种，这些对端共同承担带宽负载。这减少了一个用户需要提供给他们的网站的总带宽。

![Beaker Browser Settings][6]

对等 Web 另一个重要的方面是创作者对于他们自己的想法的控制能力。当今年代，平台都是由庞大的组织控制的，往往拿你的数据为他们所用。Beaker 把数据的控制能力返还给了内容创造者。

### 使用 Beaker 浏览去中心化的 web

[Beaker 浏览器][3] 是在 2016 年被创建的。该项目（及其周边技术）由[蓝链实验室][7]的三人团队创建。Beaker 浏览器使用 [Dat 协议][8]在计算机之间共享数据。使用 Dat 协议的网站以 `dat://` 而不是 `http://` 开头。

Dat 协议的优势如下：

  * 快速 – 档案能立即从多个源同步。
  * 安全 – 所有的更新都是有签名和经过完整性检查的。
  * 灵活 – 可以在不修改档案 URL 的情况下迁移主机。
  * 版本控制 – 每次修改都被写到只能追加的版本日志中。
  * 去中心化 – 任何设备都可以作为承载档案的主机。

![Beaker Browser Seeding][9]

Beaker 浏览器本质上是阉割版的 Chromium，原生支持 `dat://` 地址，也可以访问普通的 `http://` 站点。

每次访问一个 dat 站点，在你请求时该站点的内容才会下载到你的计算机。例如，在一个站点上的 about 页面中有一张 Linux Torvalds 的图片，只有在你浏览到该站点的这个页面时，才会下载这张图片。

此外，当你浏览一个 dat 网站时，“[你会短暂性的][10]重新上传或做种你从该网站上下载的所有文件。”你也可以选择为网站（主动）做种来帮助创造者。

![Beaker Browser Menu][11]

由于 Beaker 的志向就是创建一个更开放的网络，因此你可以很容易地查看任何网站的源码。不像在大多数浏览器上你只能看到当前浏览的页面的源码那样，使用 Beaker 你能以类似 GitHub 的视图查看整个站点的结构。你甚至可以复刻这个站点，并托管你自己的版本。

除了浏览基于 dat 的网站外，你还可以创建自己的站点。在 Beaker 浏览器的菜单里，有创建新网站或空项目的选项。如果你选择了创建一个新网站，Beaker 会搭建一个小的演示站点，你可以使用浏览器里自带的编辑器来编辑。

然而，如果你像我一样更喜欢用 Markdown，你可以选择创建一个空项目。Beaker 会创建一个站点的结构，赋给它一个 `dat://` 地址。你只需要创建一个 `index.md` 文件后就行了。这有个[简短教程][12]，你可以看到更多信息。你也可以用创建空项目的方式搭建一个 web 应用。

![Beaker Browser Website Template][13]

由于 Beaker 的角色是个 Web 服务器和站点做种者，当你关闭它或关机后你的站点就不可用了。幸运的是，你不必一直开着你的计算机或浏览器。你也可以使用名为 [Hashbase][14] 的做种服务或者你可以搭建一个 [homebase][15] 做种服务器。

虽然 Beaker [适用于][16] Linux、Windows 和 macOS，但是在使用 Beaker 之前，还是要查阅下[各平台的教程][17]。

### Beaker 浏览器不是大众可用的，但它有这个意图

当第一次接触到时，我对 Beaker 浏览器有极高的热情。（但是）如它现在的名字一样（烧杯），Beaker 浏览器仍是非常实验性的。我尝试浏览过的很多 dat 站点还不可用，因为用户并没有为站点做种。当站点恢复可用时 Beaker 确实可以选择通知你。

![Beaker Browser No Peer][18]

另一个问题是，Beaker 是真正阉割版的 Chromium。它不能安装扩展或主题。你只能使用白色主题和极少的工具集。我不会把 Beaker 浏览器作为常用浏览器，而且能访问 dat 网站并不是把它留在系统上的充分条件。

我曾经寻找一个能支持 `dat://` 协议的 Firefox 扩展。我确实找到了这样一款扩展，但它需要安装一系列其他的软件。相比而言，安装 Beaker 比安装那些软件容易点。

就如它现在的名字一样，Beaker 不适合我。也许在将来更多的人使用 Beaker 或者其他浏览器支持 dat 协议。那时会很有趣。目前而言，聊胜于无。

在使用 Beaker 的时间里，我用内建的工具创建了一个[网站][19]。不要担心，我已经为它做种了。

![Beaker Bowser Site Source][20]

你怎么看 Beaker 浏览器？你怎么看对等 Web？请尽情在下面评论。

如果你觉得本文有意思，请花点时间把它分享到社交媒体，Hacker News 或 [Reddit][21]。

--------------------------------------------------------------------------------

via: https://itsfoss.com/beaker-browser/

作者：[John Paul][a]
选题：[lujun9972][b]
译者：[lxbwolf](https://github.com/lxbwolf)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/john/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/lbry/
[2]: https://itsfoss.com/mastodon-open-source-alternative-twitter/
[3]: https://beakerbrowser.com/
[4]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/04/beaker-browser.jpg?resize=800%2C426&ssl=1
[5]: https://pfrazee.hashbase.io/blog/what-is-the-p2p-web
[6]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/04/beaker-bowser-setting.jpg?resize=800%2C573&ssl=1
[7]: https://bluelinklabs.com/
[8]: https://www.datprotocol.com/
[9]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/04/beaker-bowser-seedding.jpg?resize=800%2C466&ssl=1
[10]: https://beakerbrowser.com/docs/faq/
[11]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/04/beaker-browser-menu.jpg?ssl=1
[12]: https://beakerbrowser.com/docs/guides/create-a-markdown-site
[13]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/04/beaker-browser-website-template.jpg?resize=800%2C459&ssl=1
[14]: https://hashbase.io/
[15]: https://github.com/beakerbrowser/homebase
[16]: https://beakerbrowser.com/install/
[17]: https://beakerbrowser.com/docs/guides/
[18]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/04/beaker-browser-no-peer.jpg?resize=800%2C424&ssl=1
[19]: https://41bfbd06731e8d9c5d5676e8145069c69b254e7a3b710ddda4f6e9804529690c/
[20]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/04/beaker-bowser-source.jpg?resize=800%2C544&ssl=1
[21]: https://reddit.com/r/linuxusersgroup

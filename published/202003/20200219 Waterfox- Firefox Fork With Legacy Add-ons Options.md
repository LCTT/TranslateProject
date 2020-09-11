[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12033-1.html)
[#]: subject: (Waterfox: Firefox Fork With Legacy Add-ons Options)
[#]: via: (https://itsfoss.com/waterfox-browser/)
[#]: author: (Ankush Das https://itsfoss.com/author/ankush/)

水狐：一个支持旧版扩展的火狐复刻版
======

> 在本周的开源软件推荐中，我们将介绍一个基于 Firefox 的浏览器，该浏览器支持 Firefox 如今已不再支持的旧版扩展，同时尽可能地提供了快速的用户体验。

在 Web 浏览器方面，虽然谷歌浏览器已经占据了最大的市场份额，但 [Mozilla Firefox 仍然是关切隐私的主流 Web 浏览器的一面大旗][1]。

Firefox 最近有了很多改进，这些改进的副作用之一是它删除了旧版<ruby>扩展附件<rt>add-on</rt></ruby>的支持。如果你最喜欢的扩展附件在最近几个月/几年内消失了，那么你可以以 Witerfox 的形式再次拥有它们。

> 注意！
>
> 我们注意到，Waterfox 已被 System1 收购。该公司还收购了注重隐私的搜索引擎 Startpage。尽管 System1 声称他们提供注重隐私的产品，因为“这是刚需”，但我们不能对此担保。换句话说，这要取决于你是否信任 System1 和 Waterfox。

### Waterfox：一个基于 Firefox 的浏览器

![Waterfox Classic][2]

[Waterfox][3] 是基于 Firefox 构建的一个好用的开源浏览器，它注重隐私并支持旧版扩展。它没有将自己定位为偏执于隐私的浏览器，但确实尊重这个基本的认知。

你可以得到两个单独的 Waterfox 浏览器版本。当前版旨在提供现代体验，而经典版则旨在支持 [NPAPI 插件][4] 和 [bootstrap 扩展][5]。

![Waterfox Classic][6]

如果你不需要使用 bootstrap 扩展程序，而是需要 [WebExtensions][7]，则应该选择 Waterfox 当前版。

而如果你需要设置一个需要大量 NPAPI 插件或 Bootstrap 扩展的浏览器，则 Waterfox 经典版将非常适合你。

因此，如果你喜欢 Firefox，但想在同一阵营内尝试一些不同的体验，那么这个 Firefox 替代选择就是为此而生的。

### Waterfox 的功能

![Waterfox Current][8]

当然，从技术上讲，你应该能够做 Mozilla Firefox 支持的许多操作。

因此，我将在此处的列表中突出显示 Waterfox 的所有重要功能。

* 支持 NPAPI 插件
* 支持 Bootstrap 扩展
* 分别提供了支持旧版本扩展和现代的 WebExtension 两个版本。
* 跨平台支持（Windows、Linux 和 macOS）
* 主题定制
* 支持已经归档的扩展

### 在 Ubuntu/Linux 上安装 Waterfox

与其他流行的浏览器不同，它没有可以安装的软件包。因此，你将必须从其[官方下载页面][9]下载归档包。

![][10]

根据你想要的版本（当前版/经典版），只需下载该文件，它是以 .tar.bz2 为扩展名的文件。

下载后，只需解压缩文件即可。

接下来，转到解压缩的文件夹并查找 `Waterfox` 文件。你只需双击它即可运行以启动浏览器。

如果这不起作用，则可以使用终端并导航到提取的 `Waterfox` 文件夹。到达那里后，你只需使用一个命令即可运行它。看起来如下：

```
cd waterfox-classic
./waterfox
```

无论是哪种情况，你都可以访问其 [GitHub 页面][11]以了解将其安装在系统上的更多方式。

- [下载 Waterfox][3]

### 总结

我在我的 Pop!_OS 19.10 系统中启动了它，在我这里工作的很好。尽管我不准备从 Firefox 切换到 Waterfox，因为我没有使用任何旧版扩展附件。但对于某些用户来说，它可能是一个重要选择。

你可以尝试一下，在下面的评论中让我知道你的想法。

--------------------------------------------------------------------------------

via: https://itsfoss.com/waterfox-browser/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/why-firefox/
[2]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/02/waterfox-classic.png?fit=800%2C423&ssl=1
[3]: https://www.waterfox.net/
[4]: https://en.wikipedia.org/wiki/NPAPI
[5]: https://wiki.mozilla.org/Extension_Manager:Bootstrapped_Extensions
[6]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/02/waterfox-classic-screenshot.jpg?ssl=1
[7]: https://wiki.mozilla.org/WebExtensions
[8]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/02/waterfox-screenshot.jpg?ssl=1
[9]: https://www.waterfox.net/download/
[10]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/02/waterfox-download-page.jpg?ssl=1
[11]: https://github.com/MrAlex94/Waterfox

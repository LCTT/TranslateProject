[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11374-1.html)
[#]: subject: (How to put an HTML page on the internet)
[#]: via: (https://jvns.ca/blog/2019/09/06/how-to-put-an-html-page-on-the-internet/)
[#]: author: (Julia Evans https://jvns.ca/)

如何在互联网放置 HTML 页面
======

![](https://img.linux.net.cn/data/attachment/album/201909/22/234957mmzoie1imufsuwea.jpg)

我喜欢互联网的一点是在互联网放置静态页面是如此简单。今天有人问我该怎么做，所以我想我会快速地写下来！

### 只是一个 HTML 页面

我的所有网站都只是静态 HTML 和 CSS。我的网页设计技巧相对不高（<https://wizardzines.com> 是我自己开发的最复杂的网站），因此保持我所有的网站相对简单意味着我可以做一些改变/修复，而不会花费大量时间。

因此，我们将在此文章中采用尽可能简单的方式 —— 只需一个 HTML 页面。

### HTML 页面

我们要放在互联网上的网站只是一个名为 `index.html` 的文件。你可以在 <https://github.com/jvns/website-example> 找到它，它是一个 Github 仓库，其中只包含一个文件。

HTML 文件中包含一些 CSS，使其看起来不那么无聊，部分复制自 <https://example.com>。

### 如何将 HTML 页面放在互联网上

有以下几步：

  1. 注册 [Neocities][1] 帐户
  2. 将 index.html 复制到你自己 neocities 站点的 index.html 中
  3. 完成

上面的 `index.html` 页面位于 [julia-example-website.neocities.com][2] 中，如果你查看源代码，你将看到它与 github 仓库中的 HTML 相同。

我认为这可能是将 HTML 页面放在互联网上的最简单的方法（这是一次回归 Geocities，它是我在 2003 年制作我的第一个网站的方式）:)。我也喜欢 Neocities （像 [glitch][3]，我也喜欢）它能实验、学习，并有乐趣。

### 其他选择

这绝不是唯一简单的方式，在你推送 Git 仓库时，Github pages 和 Gitlab pages 以及 Netlify 都将会自动发布站点，并且它们都非常易于使用（只需将它们连接到你的 GitHub 仓库即可）。我个人使用 Git 仓库的方式，因为 Git 不会让我感到紧张，我想知道我实际推送的页面发生了什么更改。但我想你如果第一次只想将 HTML/CSS 制作的站点放到互联网上，那么 Neocities 就是一个非常好的方法。

如果你不只是玩，而是要将网站用于真实用途，那么你或许会需要买一个域名，以便你将来可以更改托管服务提供商，但这有点不那么简单。

### 这是学习 HTML 的一个很好的起点

如果你熟悉在 Git 中编辑文件，同时想练习 HTML/CSS 的话，我认为将它放在网站中是一个有趣的方式！我真的很喜欢它的简单性 —— 实际上这只有一个文件，所以没有其他花哨的东西需要去理解。

还有很多方法可以复杂化/扩展它，比如这个博客实际上是用 [Hugo][4] 生成的，它生成了一堆 HTML 文件并放在网络中，但从基础开始总是不错的。

--------------------------------------------------------------------------------

via: https://jvns.ca/blog/2019/09/06/how-to-put-an-html-page-on-the-internet/

作者：[Julia Evans][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://jvns.ca/
[b]: https://github.com/lujun9972
[1]: https://neocities.org/
[2]: https://julia-example-website.neocities.org/
[3]: https://glitch.com
[4]: https://gohugo.io/

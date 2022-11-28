[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12738-1.html)
[#]: subject: (Simplify your web experience with this internet protocol alternative)
[#]: via: (https://opensource.com/article/20/10/gemini-internet-protocol)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

使用互联网协议替代方案 Gemini 简化你的 Web 体验
======

> 用 Gemini 协议发现更安静、更简单的互联网新角落。

![](https://img.linux.net.cn/data/attachment/album/202010/21/070950dzph7mlm0h035h3o.jpg)

如果你很久以前就已经上网了，或者是知识非常丰富，你可能还记得一个早期的文本共享协议，叫做 [Gopher][2]。Gopher 最终被 HTTP 协议所取代，当然，HTTP 协议是现代万维网的基础。对于很多人来说，“<ruby>互联网<rt>internet</rt></ruby>”和“<ruby>万维网<rt>World Wide Web</rt></ruby>”是一回事，因为很多人没有意识到在网上进行了*非* www 子域下的任何操作。

但一直以来，都有各种网络协议在互联网络上共享信息：Telnet、FTP、SSH、Torrent、GNUnet 等等。最近，在这一系列的替代品中又多了一个，它叫 [Gemini][3]。

Gemini（双子座）协议，以“水星计划”和“阿波罗计划”的基础实验之间的太空任务命名，旨在和平地处在 Gopher 和 HTTP 之间。无论如何，它的目的并不是要取代现代 Web，但它确实试图创造一个简化的网络和一个现代化的 Gopher。

它的发展历史虽然可能很年轻，但意义重大，原因有很多。当然，人们会因为技术和哲学上的原因而对现代 Web 表示质疑，但它只是一般的臃肿。当你真正想要的是一个非常具体的问题的可靠答案时，那么无数次点击谷歌搜索的结果让人感觉过头了。

许多人使用 Gopher 就是因为这个原因：它的规模小到可以让小众的兴趣很容易找到。然而，Gopher 是一个旧的协议，它对编程、网络和浏览做出了一些假设，但这些假设已经不再适用了。 Gemini 的目标是将最好的网络带入一种类似于 Gopher 但易于编程的格式。一个简单的 Gemini 浏览器可以用几百行代码写成，并且有一个非常好的浏览器用 1600 行左右写成。这对于程序员、学生和极简主义者来说都是一个强大的功能。

### 如何浏览 Gemini

就像早期的网络一样，Gemini 的规模很小，所以有一个列表列出了运行 Gemini 网站的已知服务器。就像浏览 HTTP 站点需要一个网页浏览器一样，访问 Gemini 站点也需要一个 Gemini 浏览器。在 [Gemini 网站][4]上列出了有几个可用的浏览器。

最简单的一个是 [AV-98][5] 客户端。它是用 Python 编写的，在终端中运行。要想试试的话，请下载它：

```
$ git clone https://tildegit.org/solderpunk/AV-98.git
```

进入下载目录，运行 AV-98：

```
$ cd AV-98.git
$ python3 ./main.py
```

客户端是一个交互式的提示符。它有有限的几个命令，主要的命令是简单的 `go`，后面跟着一个 Gemini 服务器地址。在已知的 [Gemini 服务器][6]列表中选择一个看起来很有趣的服务器，然后尝试访问它：

```
AV-98> go gemini://example.club

Welcome to the example.club Gemini server!

Here are some folders of ASCII art:

[1] Penguins
[2] Wildebeests
[3] Demons
```

导航是按照编号的链接来进行的。例如，要进入 `Penguins` 目录，输入 `1` 然后按回车键：


```
AV-98> 1

[1] Gentoo
[2] Emperor
[3] Little Blue
```

要返回，输入 `back` 并按回车键：

```
AV-98> back
```

更多命令，请输入 `help`。

### 用 Gemini 作为你的 web 替代

Gemini 协议非常简单，初级和中级程序员都可以为其编写客户端，而且它是在互联网上分享内容的一种简单快捷的方式。虽然万维网的无处不在对广泛传播是有利的，但总有替代方案的空间。看看 Gemini，发现更安静、更简单的互联网的新角落。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/10/gemini-internet-protocol

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/1980s-computer-yearbook.png?itok=eGOYEKK- (Person typing on a 1980's computer)
[2]: https://en.wikipedia.org/wiki/Gopher_%28protocol%29
[3]: https://gemini.circumlunar.space/
[4]: https://gemini.circumlunar.space/clients.html
[5]: https://tildegit.org/solderpunk/AV-98
[6]: https://portal.mozz.us/gemini/gemini.circumlunar.space/servers

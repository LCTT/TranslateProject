对网站进行归档
======

我最近深入研究了网站归档，因为有些朋友担心遇到糟糕的系统管理或恶意删除时失去对放在网上的内容的控制权。这使得网站归档成为系统管理员工具箱中的重要工具。事实证明，有些网站比其他网站更难归档。本文介绍了对传统网站进行归档的过程，并阐述在面对最新流行单页面应用程序（SPA）的现代网站时，它有哪些不足。

### 转换为简单网站

手动编码 HTML 网站的日子早已不复存在。现在的网站是动态的，并使用最新的 JavaScript、PHP 或 Python 框架即时构建。结果，这些网站更加脆弱：数据库崩溃、升级出错或者未修复的漏洞都可能使数据丢失。在我以前是一名 Web 开发人员时，我不得不接受客户这样的想法：希望网站基本上可以永久工作。这种期望与 web 开发“快速行动和破除陈规”的理念不相符。在这方面，使用 [Drupal][2] 内容管理系统（CMS）尤其具有挑战性，因为重大更新会破坏与第三方模块的兼容性，这意味着客户很少承担的起高昂的升级成本。解决方案是将这些网站归档：以实时动态的网站为基础，将其转换为任何 web 服务器可以永久服务的纯 HTML 文件。此过程对你自己的动态网站非常有用，也适用于你想保护但无法控制的第三方网站。

对于简单的静态网站，古老的 [Wget][3] 程序就可以胜任。然而镜像保存一个完整网站的命令却是错综复杂的：

```
$ nice wget --mirror --execute robots=off --no-verbose --convert-links \
    --backup-converted --page-requisites --adjust-extension \
    --base=./ --directory-prefix=./ --span-hosts \
    --domains=www.example.com,example.com http://www.example.com/
```

以上命令下载了网页的内容，也抓取了指定域名中的所有内容。在对你喜欢的网站执行此操作之前，请考虑此类抓取可能对网站产生的影响。上面的命令故意忽略了 `robots.txt` 规则，就像现在[归档者的习惯做法][4]，并以尽可能快的速度归档网站。大多数抓取工具都可以选择在两次抓取间暂停并限制带宽使用，以避免使网站瘫痪。

上面的命令还将获取 “页面所需（LCTT 译注：单页面所需的所有元素）”，如样式表（CSS）、图像和脚本等。下载的页面内容将会被修改，以便链接也指向本地副本。任何 web 服务器均可托管生成的文件集，从而生成原始网站的静态副本。

以上所述是事情一切顺利的时候。任何使用过计算机的人都知道事情的进展很少如计划那样；各种各样的事情可以使程序以有趣的方式脱离正轨。比如，在网站上有一段时间很流行日历块。内容管理系统会动态生成这些内容，这会使爬虫程序陷入死循环以尝试检索所有页面。灵巧的归档者可以使用正则表达式（例如 Wget 有一个 `--reject-regex` 选项）来忽略有问题的资源。如果可以访问网站的管理界面，另一个方法是禁用日历、登录表单、评论表单和其他动态区域。一旦网站变成静态的，（那些动态区域）也肯定会停止工作，因此从原始网站中移除这些杂乱的东西也不是全无意义。

### JavaScript 噩梦

很不幸，有些网站不仅仅是纯 HTML 文件构建的。比如，在单页面网站中，web 浏览器通过执行一个小的 JavaScript 程序来构建内容。像 Wget 这样的简单用户代理将难以重建这些网站的有意义的静态副本，因为它根本不支持 JavaScript。理论上，网站应该使用[渐进增强][5]技术，在不使用 JavaScript 的情况下提供内容和实现功能，但这些指引很少被人遵循 —— 使用过 [NoScript][6] 或 [uMatrix][7] 等插件的人都知道。

传统的归档方法有时会以最愚蠢的方式失败。在尝试为一个本地报纸网站（[pamplemousse.ca][8]）创建备份时，我发现 WordPress 在包含 的 JavaScript 末尾添加了查询字符串（例如：`?ver=1.12.4`）。这会使提供归档服务的 web 服务器不能正确进行内容类型检测，因为其靠文件扩展名来发送正确的 `Content-Type` 头部信息。在 web 浏览器加载此类归档时，这些脚本会加载失败，导致动态网站受损。

随着 web 向使用浏览器作为执行任意代码的虚拟机转化，依赖于纯 HTML 文件解析的归档方法也需要随之适应。这个问题的解决方案是在抓取时记录（以及重现）服务器提供的 HTTP 头部信息，实际上专业的归档者就使用这种方法。

### 创建和显示 WARC 文件

在 <ruby>[互联网档案馆][9]<rt>Internet Archive</rt></ruby> 网站，Brewster Kahle 和 Mike Burner 在 1996 年设计了 [ARC][10] （即 “ARChive”）文件格式，以提供一种聚合其归档工作所产生的百万个小文件的方法。该格式最终标准化为 WARC（“Web ARChive”）[规范][11]，并在 2009 年作为 ISO 标准发布，2017 年修订。标准化工作由<ruby>[国际互联网保护联盟][12]<rt>International Internet Preservation Consortium</rt></ruby>（IIPC）领导，据维基百科称，这是一个“*为了协调为未来而保护互联网内容的努力而成立的国际图书馆组织和其他组织*”；它的成员包括<ruby>美国国会图书馆<rt>US Library of Congress</rt></ruby>和互联网档案馆等。后者在其基于 Java 的 [Heritrix crawler][13]（LCTT 译注：一种爬虫程序）内部使用了 WARC 格式。

WARC 在单个压缩文件中聚合了多种资源，像 HTTP 头部信息、文件内容，以及其他元数据。方便的是，Wget 实际上提供了 `--warc` 参数来支持 WARC 格式。不幸的是，web 浏览器不能直接显示 WARC 文件，所以为了访问归档文件，一个查看器或某些格式转换是很有必要的。我所发现的最简单的查看器是 [pywb][14]，它以 Python 包的形式运行一个简单的 web 服务器提供一个像“<ruby>时光倒流机网站<rt>Wayback Machine</rt></ruby>”的界面，来浏览 WARC 文件的内容。执行以下命令将会在 `http://localhost:8080/` 地址显示 WARC 文件的内容：

```
$ pip install pywb
$ wb-manager init example
$ wb-manager add example crawl.warc.gz
$ wayback
```

顺便说一句，这个工具是由 [Webrecorder][15] 服务提供者建立的，Webrecoder 服务可以使用 web 浏览器保存动态页面的内容。

很不幸，pywb 无法加载 Wget 生成的 WARC 文件，因为它[遵循][16]的 [1.0 规范不一致][17]，[1.1 规范修复了此问题][17]。就算 Wget 或 pywb 修复了这些问题，Wget 生成的 WARC 文件对我的使用来说不够可靠，所以我找了其他的替代品。引起我注意的爬虫程序简称 [crawl][19]。以下是它的调用方式：

```
$ crawl https://example.com/
```

（它的 README 文件说“非常简单”。）该程序支持一些命令行参数选项，但大多数默认值都是最佳的：它会从其他域获取页面所需（除非使用 `-exclude-related` 参数），但肯定不会递归出域。默认情况下，它会与远程站点建立十个并发连接，这个值可以使用 `-c` 参数更改。但是，最重要的是，生成的 WARC 文件可以使用 pywb 完美加载。

### 未来的工作和替代方案

这里还有更多有关使用 WARC 文件的[资源][20]。特别要提的是，这里有一个专门用来归档网站的 Wget 的直接替代品，叫做 [Wpull][21]。它实验性地支持了 [PhantomJS][22] 和 [youtube-dl][23] 的集成，即允许分别下载更复杂的 JavaScript 页面以及流媒体。该程序是一个叫做 [ArchiveBot][24] 的复杂归档工具的基础，ArchiveBot 被那些在 [ArchiveTeam][25] 的“*零散离群的归档者、程序员、作家以及演说家*”使用，他们致力于“*在历史永远丢失之前保存它们*”。集成 PhantomJS 好像并没有如团队期望的那样良好工作，所以 ArchiveTeam 也用其它零散的工具来镜像保存更复杂的网站。例如，[snscrape][26] 将抓取一个社交媒体配置文件以生成要发送到 ArchiveBot 的页面列表。该团队使用的另一个工具是 [crocoite][27]，它使用无头模式的 Chrome 浏览器来归档 JavaScript 较多的网站。

如果没有提到称做“网站复制者”的 [HTTrack][28] 项目，那么这篇文章算不上完整。它工作方式和 Wget 相似，HTTrack 可以对远程站点创建一个本地的副本，但是不幸的是它不支持输出 WRAC 文件。对于不熟悉命令行的小白用户来说，它在人机交互方面显得更有价值。

同样，在我的研究中，我发现了叫做 [Wget2][29] 的 Wget 的完全重制版本，它支持多线程操作，这可能使它比前身更快。和 Wget 相比，它[舍弃了一些功能][30]，但是最值得注意的是拒绝模式、WARC 输出以及 FTP 支持，并增加了 RSS、DNS 缓存以及改进的 TLS 支持。

最后，我个人对这些工具的愿景是将它们与我现有的书签系统集成起来。目前我在 [Wallabag][31] 中保留了一些有趣的链接，这是一种自托管式的“稍后阅读”服务，意在成为 [Pocket][32]（现在由 Mozilla 拥有）的免费替代品。但是 Wallabag 在设计上只保留了文章的“可读”副本，而不是一个完整的拷贝。在某些情况下，“可读版本”实际上[不可读][33]，并且 Wallabag 有时[无法解析文章][34]。恰恰相反，像 [bookmark-archiver][35] 或 [reminiscence][36] 这样其他的工具会保存页面的屏幕截图以及完整的 HTML 文件，但遗憾的是，它没有 WRAC 文件所以没有办法更可信的重现网页内容。

我所经历的有关镜像保存和归档的悲剧就是死数据。幸运的是，业余的归档者可以利用工具将有趣的内容保存到网上。对于那些不想麻烦的人来说，“互联网档案馆”看起来仍然在那里，并且 ArchiveTeam 显然[正在为互联网档案馆本身做备份][37]。

--------------------------------------------------------------------------------

via: https://anarc.at/blog/2018-10-04-archiving-web-sites/

作者：[Anarcat][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[fuowang](https://github.com/fuowang)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://anarc.at
[1]: https://anarc.at/blog
[2]: https://drupal.org
[3]: https://www.gnu.org/software/wget/
[4]: https://blog.archive.org/2017/04/17/robots-txt-meant-for-search-engines-dont-work-well-for-web-archives/
[5]: https://en.wikipedia.org/wiki/Progressive_enhancement
[6]: https://noscript.net/
[7]: https://github.com/gorhill/uMatrix
[8]: https://pamplemousse.ca/
[9]: https://archive.org
[10]: http://www.archive.org/web/researcher/ArcFileFormat.php
[11]: https://iipc.github.io/warc-specifications/
[12]: https://en.wikipedia.org/wiki/International_Internet_Preservation_Consortium
[13]: https://github.com/internetarchive/heritrix3/wiki
[14]: https://github.com/webrecorder/pywb
[15]: https://webrecorder.io/
[16]: https://github.com/webrecorder/pywb/issues/294
[17]: https://github.com/iipc/warc-specifications/issues/23
[18]: https://github.com/iipc/warc-specifications/pull/24
[19]: https://git.autistici.org/ale/crawl/
[20]: https://archiveteam.org/index.php?title=The_WARC_Ecosystem
[21]: https://github.com/chfoo/wpull
[22]: http://phantomjs.org/
[23]: http://rg3.github.io/youtube-dl/
[24]: https://www.archiveteam.org/index.php?title=ArchiveBot
[25]: https://archiveteam.org/
[26]: https://github.com/JustAnotherArchivist/snscrape
[27]: https://github.com/PromyLOPh/crocoite
[28]: http://www.httrack.com/
[29]: https://gitlab.com/gnuwget/wget2
[30]: https://gitlab.com/gnuwget/wget2/wikis/home
[31]: https://wallabag.org/
[32]: https://getpocket.com/
[33]: https://github.com/wallabag/wallabag/issues/2825
[34]: https://github.com/wallabag/wallabag/issues/2914
[35]: https://pirate.github.io/bookmark-archiver/
[36]: https://github.com/kanishka-linux/reminiscence
[37]: http://iabak.archiveteam.org

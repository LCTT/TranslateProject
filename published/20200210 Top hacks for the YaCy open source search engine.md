[#]: collector: (lujun9972)
[#]: translator: (HankChow)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11919-1.html)
[#]: subject: (Top hacks for the YaCy open source search engine)
[#]: via: (https://opensource.com/article/20/2/yacy-search-engine-hacks)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

使用开源搜索引擎 YaCy 的技巧
======

> 无需适应其他人的眼光，而是使用 YaCY 搜索引擎定义你想要的互联网。

![](https://img.linux.net.cn/data/attachment/album/202002/23/115822jqkdyjwzdqwdad0y.jpg)

在我以前介绍 [YaCy 入门][2]的文章中讲述过 [YaCy][3] 这个<ruby>对等<rt>peer-to-peer</rt></ruby>式的搜索引擎是如何安装和使用的。YaCy 最令人兴奋的一点就是它事实上是一个本地客户端，全球范围内的每一个 YaCy 用户都是构成整个这个分布式搜索引擎架构的一个节点，这意味着每个用户都可以掌控自己的互联网搜索体验。

Google 曾经提供过 google.com/linux 这样的主题简便方式以便快速筛选出和 Linux 相关的搜索内容，这个小功能受到了很多人的青睐，但 Google 最终还是在 2011 年的时候把它[下线][4]了。

而 YaCy 则让自定义搜索引擎变得可能。

### 自定义 YaCy

YaCy 安装好之后，只需要访问 `localhost:8090` 就可以使用了。要自定义搜索引擎，只需要点击右上角的“<ruby>管理<rt>Administration</rt></ruby>”按钮（它可能隐藏在小屏幕的菜单图标中）。

你可以在管理面板中配置 YaCy 对系统资源的使用策略，以及如何跟其它的 YaCy 客户端进行交互。

![YaCy profile selector][5]

例如，点击侧栏中的“<ruby>第一步<rt>First steps</rt></ruby>”按钮可以配置备用端口，以及设置 YaCy 对内存和硬盘的使用量；而“<ruby>监控<rt>Monitoring</rt></ruby>”面板则可以监控 YaCy 的运行状况。大多数功能都只需要在面板上点击几下就可以完成了，例如以下几个常用的功能。

### 内网搜索应用

目前市面上也有不少公司推出了[内网搜索应用][6]，而 YaCy 可以免费为你提供一个。对于能够通过 HTTP、FTP、Samba 等协议访问的文件，YaCy 都可以进行索引，因此无论是作为私人的文件搜索还是企业内部的本地共享文件搜索，YaCy 都可以实现。它可以让内部网络中的用户使用你个人的 YaCy 实例来查找共享文件，于此同时保持对内部网络以外的用户不可见。

### 网络配置

YaCy 在默认情况下就支持隐私和隔离。点击“<ruby>用例与账号<rt>Use Case & Account</rt></ruby>”页面顶部的“<ruby>网络配置<rt>Network Configuration</rt></ruby>”链接，即可进入网络配置面板设置对等网络。

![YaCy network configuration][7]

### 爬取站点

YaCy 的分布式运作方式决定了它对页面的爬取是由用户驱动的。并没有一个大型公司对整个互联网上的所有可访问页面都进行搜索，对于 YaCy 来说也是这样，一个站点只有在被用户指定爬取的前提下，才会被 YaCy 爬取并进入索引。

YaCy 客户端提供了两种爬取页面的方式：你可以手动爬取，并让 YaCy 根据建议去爬取。

![YaCy advanced crawler][8]

#### 手动爬取

手动爬取是指由用户输入指定的网站 URL 并启动 YaCy 的爬虫任务。只需要点击“<ruby>高级爬虫<rt>Advanced Crawler</rt></ruby>”并输入计划爬取的若干 URL，然后选择页面底部的“<ruby>进行远程索引<rt>Do Remote indexing</rt></ruby>”选项，这个选项会让客户端向互联网广播它要索引的 URL，可选地接受这些请求的客户端可以帮助你爬取这些 URL。

点击页面底部的“<ruby>开始新爬虫任务<rt>Start New Crawl Job</rt></ruby>”按钮就可以开始进行爬取了，我就是这样对一些常用和有用站点进行爬取和索引的。

爬虫任务启动之后，YaCy 会将这些 URL 对应的页面在本地生成和存储索引。在高级模式下，也就是本地计算机允许 8090 端口流量进出时，全网的 YaCy 用户都可以使用到这一份索引。

#### 加入爬虫网络

尽管一些非常敬业的 YaCy 高级用户已经强迫症般地在互联网上爬取了很多页面，但对于全网浩如烟海的页面而言也只是沧海一粟。单个用户所拥有的资源远不及很多大公司的网络爬虫，但大量 YaCy 用户如果联合起来成为一个社区，能产生的力量就大得多了。只要开启了 YaCy 的爬虫请求广播功能，就可以让其它客户端参与进来爬取更多页面。

只需要在“<ruby>高级爬虫<rt>Advanced Crawler</rt></ruby>”面板中点击页面顶部的“<ruby>远程爬取<rt>Remote Crawling</rt></ruby>”，勾选“<ruby>加载<rt>Load</rt></ruby>”旁边的复选框，就可以让你的客户端接受其它人发来的爬虫任务请求了。

![YaCy remote crawling][9]

### YaCy 监控相关

YaCy 除了作为一个非常强大的搜索引擎，还提供了很丰富的主题和用户体验。你可以在“<ruby>监控<rt>Monitor</rt></ruby>”面板中监控 YaCy 客户端的网络运行状况，甚至还可以了解到有多少人从 YaCy 社区中获取到了自己所需要的东西。

![YaCy monitoring screen][10]

### 搜索引擎发挥了作用

你使用 YaCy 的时间越长，就越会思考搜索引擎如何改变自己的视野，因为你对互联网的体验很大一部分来自于你在搜索引擎中一次次简单查询的结果。实际上，当你和不同行业的人交流时，可能会注意到每个人对“互联网”的理解都有所不同。有些人会认为，互联网的搜索引擎中充斥着各种广告和推广，同时也仅仅能从搜索结果中获取到有限的信息。例如，假设有人不断搜索关于关键词 X 的内容，那么大部分商业搜索引擎都会在搜索结果中提高关键词 X 的权重，但与此同时，另一个关键词 Y 的权重则会相对降低，从而让关键词 Y 被淹没在搜索结果当中，即使这样对完成特定任务更好。

就像在现实生活中一样，走出虚拟的世界视野会让你看到一个更广阔的世界。尝试使用 YaCy，看看你发现了什么。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/2/yacy-search-engine-hacks

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[HankChow](https://github.com/HankChow)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/browser_desktop_website_checklist_metrics.png?itok=OKKbl1UR (Browser of things)
[2]: https://linux.cn/article-11905-1.html
[3]: https://yacy.net/
[4]: https://www.linuxquestions.org/questions/linux-news-59/is-there-no-more-linux-google-884306/
[5]: https://opensource.com/sites/default/files/uploads/yacy-profiles.jpg (YaCy profile selector)
[6]: https://en.wikipedia.org/wiki/Vivisimo
[7]: https://opensource.com/sites/default/files/uploads/yacy-network-config.jpg (YaCy network configuration)
[8]: https://opensource.com/sites/default/files/uploads/yacy-advanced-crawler.jpg (YaCy advanced crawler)
[9]: https://opensource.com/sites/default/files/uploads/yacy-remote-crawl-accept.jpg (YaCy remote crawling)
[10]: https://opensource.com/sites/default/files/uploads/yacy-monitor.jpg (YaCy monitoring screen)

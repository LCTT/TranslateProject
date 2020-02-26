[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11905-1.html)
[#]: subject: (Customize your internet with an open source search engine)
[#]: via: (https://opensource.com/article/20/2/open-source-search-engine)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

用开源搜索引擎定制你的互联网
======

> 上手开源的对等 Web 索引器 YaCy。

![](https://img.linux.net.cn/data/attachment/album/202002/19/103541la7erglz7oloa4ye.jpg)

很久以前，互联网很小，小到几个人就可以索引它们，这些人收集了所有网站的名称和链接，并按主题将它们分别列在页面或印刷书籍中。随着万维网网络的发展，形成了“网站环”形式，具有类似的内容、主题或敏感性的站点捆绑在一起，形成了通往每个成员的循环路径。环中任何站点的访问者都可以单击按钮以转到环中的下一个或上一个站点，以发现与其兴趣相关的新站点。

又过了一段时间，互联网似乎变得臃肿不堪了。每个人都在网络上，有很多冗余信息和垃圾邮件，多到让你无法找到任何东西。Yahoo 和 AOL、CompuServe 以及类似的服务各自采用了不同的方法来解决这个问题，但是直到谷歌出现后，现代的搜索模型才得以普及。按谷歌的做法，互联网应该通过搜索引擎进行索引、排序和排名。

### 为什么选择开源替代品？

像谷歌和 DuckDuckGo 这样的搜索引擎显然是卓有成效的。你可能是通过搜索引擎访问的本站。尽管对于因主机没有选择遵循优化搜索引擎的最佳实践从而导致会内容陷入困境这件事仍存在争论，但用于管理丰富的文化、知识和轻率的信息（即互联网）的现代解决方案是冷冰冰的索引。

但是也许出于隐私方面的考虑，或者你希望为使互联网更加独立而做出贡献，你或许不愿意使用谷歌或 DuckDuckGo。如果你对此感兴趣，那么可以考虑参加 [YaCy][2]，这是一个对等互联网索引器和搜索引擎。

### 安装 YaCy

要安装并尝试 YaCy，请首先确保已安装 Java。如果你使用的是 Linux，则可以按照我的《[如何在 Linux 上安装 Java][3]》中的说明进行操作。如果你使用 Windows 或 MacOS，请从 [AdoptOpenJDK.net][4] 获取安装程序。

安装 Java 后，请根据你的平台[下载安装程序][5]。

如果你使用的是 Linux，请解压缩 tarball 并将其移至 `/opt` 目录：

```
$ sudo tar --extract --file  yacy_*z --directory /opt
```

根据下载的安装程序的说明启动 YaCy。

在 Linux 上，启动在后台运行的 YaCy：

```
$ /opt/startYACY.sh &
```

在 Web 浏览器中，导航到 `localhost:8090` 并进行搜索。

![YaCy start page][6]

### 将 YaCy 添加到你的地址栏

如果你使用的是 Firefox Web 浏览器，则只需单击几下，即可在 Awesome Bar（Mozilla 给 URL 栏起的名称）中将 YaCy 设置为默认搜索引擎。

首先，如果尚未显示，在 Firefox 工具栏中使专用搜索栏显示出来（你不必使搜索栏保持一直可见；只需要激活它足够长的时间即可添加自定义搜索引擎）。Firefox 右上角的“汉堡”菜单中的“自定义”菜单中提供了搜索栏。在 Firefox 工具栏上的搜索栏可见后，导航至 `localhost:8090`，然后单击刚添加的 Firefox 搜索栏中的放大镜图标。单击选项将 YaCy 添加到你的 Firefox 的搜索引擎中。

![Adding YaCy to Firefox][7]

完成此操作后，你可以在 Firefox 首选项中将其标记为默认值，或者仅在 Firefox 搜索栏中执行的搜索中选择性地使用它。如果将其设置为默认搜索引擎，则可能不需要专用搜索栏，因为 Awesome Bar 也使用默认引擎，因此可以将其从工具栏中删除。

### 对等搜索引擎如何工作

YaCy 是一个开源的分布式搜索引擎。它是用 [Java][8] 编写的，因此可以在任何平台上运行，并且可以执行 Web 爬网、索引和搜索。这是一个对等（P2P）网络，因此每个运行 YaCy 的用户都将努力地不断跟踪互联网的变化情况。当然，没有单个用户能拥有整个互联网的完整索引，因为这将需要一个数据中心来容纳，但是该索引分布在所有 YaCy 用户中且是冗余的。它与 BitTorrent 非常相似（因为它使用分布式哈希表 DHT 来引用索引条目），只不过你所共享的数据是单词和 URL 关联的矩阵。通过混合哈希表返回的结果，没人能说出谁搜索了哪些单词，因此所有搜索在功能上都是匿名的。这是用于无偏见、无广告、未跟踪和匿名搜索的有效系统，你只需要使用它就加入了它。

### 搜索引擎和算法

索引互联网的行为是指将网页分成单个单词，然后将页面的 URL 与每个单词相关联。在搜索引擎中搜索一个或多个单词将获取与该查询关联的所有 URL。YaCy 客户端在运行时也是如此。

客户端要做的另一件事是为你的浏览器提供搜索界面。你可以将 Web 浏览器指向 `localhost:8090` 来搜索 YaCy，而不是在要搜索时导航到谷歌。你甚至可以将其添加到浏览器的搜索栏中（取决于浏览器的可扩展性），因此可以从 URL 栏中进行搜索。

### YaCy 的防火墙设置

首次开始使用 YaCy 时，它可能运行在“初级”模式下。这意味着你的客户端爬网的站点仅对你可用，因为其他 YaCy 客户端无法访问你的索引条目。要加入对等环境，必须在路由器的防火墙（或者你正在运行的软件防火墙）中打开端口 8090，这称为“高级”模式。

如果你使用的是 Linux，则可以在《[使用防火墙让你的 Linux 更加强大][9]》中找到有关计算机防火墙的更多信息。在其他平台上，请参考操作系统的文档。

互联网服务提供商（ISP）提供的路由器上几乎总是启用了防火墙，并且有太多种类的防火墙无法准确说明。大多数路由器都提供了在防火墙上“打洞”的选项，因为许多流行的联网游戏都需要双向流量。

如果你知道如何登录路由器（通常为 192.168.0.1 或 10.1.0.1，但可能因制造商的设置而异），则登录并查找配置面板来控制“防火墙”或“端口转发”或“应用”。

找到路由器防火墙的首选项后，将端口 8090 添加到白名单。例如：

![Adding YaCy to an ISP router][10]

如果路由器正在进行端口转发，则必须使用相同的端口将传入的流量转发到计算机的 IP 地址。例如：

![Adding YaCy to an ISP router][11]

如果由于某种原因无法调整防火墙设置，那也没事。YaCy 将继续以初级模式运行并作为对等搜索网络的客户端运行。

### 你的互联网

使用 YaCy 搜索引擎可以做的不仅仅是被动搜索。你可以强制抓取不太显眼的网站，可以请求对网站进行网络抓取，可以选择使用 YaCy 进行本地搜索等等。你可以更好地控制*你的*互联网的所呈现的一切。高级用户越多，索引的网站就越多。索引的网站越多，所有用户的体验就越好。加入吧！

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/2/open-source-search-engine

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/laptop_screen_desk_work_chat_text.png?itok=UXqIDRDD (Person using a laptop)
[2]: https://yacy.net/
[3]: https://linux.cn/article-11614-1.html
[4]: https://adoptopenjdk.net/releases.html
[5]: https://yacy.net/download_installation/
[6]: https://opensource.com/sites/default/files/uploads/yacy-startpage.jpg (YaCy start page)
[7]: https://opensource.com/sites/default/files/uploads/yacy-add-firefox.jpg (Adding YaCy to Firefox)
[8]: https://opensource.com/resources/java
[9]: https://opensource.com/article/19/7/make-linux-stronger-firewalls
[10]: https://opensource.com/sites/default/files/uploads/router-add-app.jpg (Adding YaCy to an ISP router)
[11]: https://opensource.com/sites/default/files/uploads/router-add-app1.jpg (Adding YaCy to an ISP router)

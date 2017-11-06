三种 Python 网络内容抓取工具与爬虫
============================================================

> 运用这些很棒的 Python 爬虫工具来获取你需要的数据。

![ python网络内容抓取工具与爬虫](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/openweb-osdc-lead.png?itok=yjU4KliG "Python web scrapers and crawlers")

在一个理想的世界里，你需要的所有数据都将以公开而文档完备的格式清晰地展现，你可以轻松地下载并在任何你需要的地方使用。

然而，在真实世界里，数据是凌乱的，极少被打包成你需要的样子，要么经常是过期的。

你所需要的信息经常是潜藏在一个网站里。相比一些清晰地、有调理地呈现数据的网站，更多的网站则不是这样的。<ruby>[爬取数据][33]<rt>crawling</rt></ruby>、<ruby>[挖掘数据][34]<rt>scraping</rt></ruby>、加工数据、整理数据这些是获取整个网站结构来绘制网站拓扑来收集数据所必须的活动，这些可以是以网站的格式储存的或者是储存在一个专有数据库中。

也许在不久的将来，你需要通过爬取和挖掘来获得一些你需要的数据，当然你几乎肯定需要进行一点点的编程来正确的获取。你要怎么做取决于你自己，但是我发现 Python 社区是一个很好的提供者，它提供了工具、框架以及文档来帮助你从网站上获取数据。

在我们进行之前，这里有一个小小的请求：在你做事情之前请思考，以及请耐心。抓取这件事情并不简单。不要把网站爬下来只是复制一遍，并其它人的工作当成是你自己的东西（当然，没有许可）。要注意版权和许可，以及你所爬行的内容应用哪一个标准。尊重 [robots.txt][15] 文件。不要频繁的针对一个网站，这将导致真实的访问者会遇到访问困难的问题。

在知晓这些警告之后，这里有一些很棒的 Python 网站爬虫工具，你可以用来获得你需要的数据。

### Pyspider

让我们先从 [pyspider][16] 开始介绍。这是一个带有 web 界面的网络爬虫，让与使之容易跟踪多个爬虫。其具有扩展性，支持多个后端数据库和消息队列。它还具有一些方便的特性，从优先级到再次访问抓取失败的页面，此外还有通过时间顺序来爬取和其他的一些特性。Pyspider 同时支持 Python 2 和 Python 3。为了实现一个更快的爬取，你可以在分布式的环境下一次使用多个爬虫进行爬取。

Pyspyder 的基本用法都有良好的 [文档说明][17] ，包括简单的代码片段。你能通过查看一个 [在线的样例][18] 来体验用户界面。它在 Apache 2 许可证下开源，Pyspyder 仍然在 GitHub 上积极地开发。

### MechanicalSoup

[MechanicalSoup][19] 是一个基于极其流行而异常多能的 HTML 解析库 [Beautiful Soup][20] 建立的爬虫库。如果你的爬虫需要相当的简单，但是又要求检查一些选择框或者输入一些文字，而你又不想为这个任务单独写一个爬虫，那么这会是一个值得考虑的选择。

MechanicalSoup 在 MIT 许可证下开源。查看 GitHub 上该项目的 [example.py][21] 样例文件来获得更多的用法。不幸的是，到目前为止，这个项目还没有一个很好的文档。

### Scrapy

[Scrapy][22] 是一个有着活跃社区支持的抓取框架，在那里你可以建造自己的抓取工具。除了爬取和解析工具，它还能将它收集的数据以 JSON 或者 CSV 之类的格式轻松输出，并存储在一个你选择的后端数据库。它还有许多内置的任务扩展，例如 cookie 处理、代理欺骗、限制爬取深度等等，同时还可以建立你自己附加的 API。

要了解 Scrapy，你可以查看[网上的文档][23]或者是访问它诸多的[社区][24]资源，包括一个 IRC 频道、Reddit 子版块以及关注他们的 StackOverflow 标签。Scrapy 的代码在 3 句版 BSD 许可证下开源，你可以在 [GitHub][25] 上找到它们。

如果你完全不熟悉编程，[Portia][26] 提供了一个易用的可视化的界面。[scrapinghub.com][27] 则提供一个托管的版本。

### 其它

*   [Cola][6] 自称它是个“高级的分布式爬取框架”，如果你在寻找一个 Python 2 的方案，这也许会符合你的需要，但是注意它已经有超过两年没有更新了。
*   [Demiurge][7] 是另一个可以考虑的潜在候选者，它同时支持 Python 2和 Python 3，虽然这个项目的发展较为缓慢。
*   如果你要解析一些 RSS 和 Atom 数据，[Feedparser][8] 或许是一个有用的项目。
*   [Lassie][9] 让从网站检索像说明、标题、关键词或者是图片一类的基本内容变得简单。
*   [RoboBrowser][10] 是另一个简单的库，它基于 Python 2 或者 Python 3，它具有按钮点击和表格填充的基本功能。虽然它有一段时间没有更新了，但是它仍然是一个不错的选择。

* * *

这远不是一个完整的列表，当然，如果你是一个编程专家，你可以选择采取你自己的方法而不是使用这些框架中的一个。或者你发现一个用其他语言编写的替代品。例如 Python 编程者可能更喜欢 [Python 附带的][28] [Selenium][29]，它可以在不使用实际浏览器的情况下进行爬取。如果你有喜欢的爬取和挖掘工具，请在下面评论让我们知道。

（题图：[You as a Machine][13]. Modified by Rikki Endsley. [CC BY-SA 2.0][14]）

--------------------------------------------------------------------------------

via: https://opensource.com/resources/python/web-scraper-crawler

作者：[Jason Baker][a]
译者：[ZH1122](https://github.com/ZH1122)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/jason-baker
[1]:https://opensource.com/resources/python?intcmp=7016000000127cYAAQ
[2]:https://opensource.com/resources/python/ides?intcmp=7016000000127cYAAQ
[3]:https://opensource.com/resources/python/gui-frameworks?intcmp=7016000000127cYAAQ
[4]:https://opensource.com/tags/python?intcmp=7016000000127cYAAQ
[5]:https://developers.redhat.com/?intcmp=7016000000127cYAAQ
[6]:https://github.com/chineking/cola
[7]:https://github.com/matiasb/demiurge
[8]:https://github.com/kurtmckee/feedparser
[9]:https://github.com/michaelhelmick/lassie
[10]:https://github.com/jmcarp/robobrowser
[11]:https://opensource.com/resources/python/web-scraper-crawler?imm_mid=0f7103&cmp=em-prog-na-na-newsltr_20171007&rate=Wn1vUb9FpPK-IGQ1waRzgdIsDN3pXBH6rO2xnjoK_t4
[12]:https://opensource.com/user/19894/feed
[13]:https://www.flickr.com/photos/youasamachine/8025582590/in/photolist-decd6C-7pkccp-aBfN9m-8NEffu-3JDbWb-aqf5Tx-7Z9MTZ-rnYTRu-3MeuPx-3yYwA9-6bSLvd-irmvxW-5Asr4h-hdkfCA-gkjaSQ-azcgct-gdV5i4-8yWxCA-9G1qDn-5tousu-71V8U2-73D4PA-iWcrTB-dDrya8-7GPuxe-5pNb1C-qmnLwy-oTxwDW-3bFhjL-f5Zn5u-8Fjrua-bxcdE4-ddug5N-d78G4W-gsYrFA-ocrBbw-pbJJ5d-682rVJ-7q8CbF-7n7gDU-pdfgkJ-92QMx2-aAmM2y-9bAGK1-dcakkn-8rfyTz-aKuYvX-hqWSNP-9FKMkg-dyRPkY
[14]:https://creativecommons.org/licenses/by/2.0/
[15]:http://www.robotstxt.org/
[16]:https://github.com/binux/pyspider
[17]:http://docs.pyspider.org/en/latest/
[18]:http://demo.pyspider.org/
[19]:https://github.com/hickford/MechanicalSoup
[20]:https://www.crummy.com/software/BeautifulSoup/
[21]:https://github.com/hickford/MechanicalSoup/blob/master/example.py
[22]:https://scrapy.org/
[23]:https://doc.scrapy.org/en/latest/
[24]:https://scrapy.org/community/
[25]:https://github.com/scrapy/scrapy
[26]:https://github.com/scrapinghub/portia
[27]:https://portia.scrapinghub.com/
[28]:https://selenium-python.readthedocs.io/
[29]:https://github.com/SeleniumHQ/selenium
[30]:https://opensource.com/users/jason-baker
[31]:https://opensource.com/users/jason-baker
[32]:https://opensource.com/resources/python/web-scraper-crawler?imm_mid=0f7103&cmp=em-prog-na-na-newsltr_20171007#comments
[33]:https://en.wikipedia.org/wiki/Web_crawler
[34]:https://en.wikipedia.org/wiki/Web_scraping

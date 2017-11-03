三种python网络内容抓取工具与爬虫
============================================================

###运用这些很棒的python爬虫工具来获取你需要的数据。



![ python网络内容抓取工具与爬虫](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/openweb-osdc-lead.png?itok=yjU4KliG "Python web scrapers and crawlers")
图片来源 : [You as a Machine][13]. Modified by Rikki Endsley. [CC BY-SA 2.0][14].

在一个理想的世界里，你需要的所有数据都将清楚的以公开且排版好的格式出现，你轻松的就可以下载和使用在任何你需要的地方。

在真实世界里，数据是凌乱的，极少的被打包成你需要的样子，或者经常是过期的。

更多的python资源

*   [什么是python？][1]

*   [最好的python集成开发工具][2]

*   [最好的python图形化界面开发框架][3]

*   [最新的python内容][4]

*   [更多的开发者资源][5]

你所需要的信息经常是混杂在一个网站里。相比一些将数据呈现的清楚、有调理的网站，更多的是不清楚的。[爬取数据][33]、[抓取数据][34] 、加工数据、整理数据这些是获取整个网站结构来绘制网站拓扑来收集数据所必须的活动。这些可以是以网站的格式储存或者是储存在一个私人的数据库。

也许在不久的将来，你需要通过爬行喝抓取来获得一些你需要的数据，当然你需要进行一点点的编程来正确的获取。你要怎么做这取决于你自己，但是我发现python社区是一个很好的提供者，它提供工具、框架以及文档来帮助你从网站上获取数据。

在我们参与之前，这里有一个小小的请求：在你做事情之前请思考，以及请友善。抓取的内容可能意味着很多的事情。不要把网站爬下来以后复制，并把它当成是自己的东西呈现在另一个地方（当然是在没有许可的情况下）。要注意版权和许可，以及你所爬行的内容应用哪一个标准。尊重 [robots.txt][15] 文件。不要频繁的袭击一个网站，这将导致真是的访问者会遇到访问困难的问题。

在警告之后，这里有一些很棒的python网站爬虫工具，你可以用来获得你需要的数据。

### Pyspider

首先从 [pyspider][16] 开始介绍。一个带有基于网站使用者接口的网络爬虫让与多线程爬虫保持联系变得容易。它是一个可以扩展的版本，它带有多个后端数据库和支持信息队列。它还具有一些简便的特性，从优先次序到再次访问失败页面。此外还有通过时间顺序来爬取和其他的一些特性。Pyspider同时支持python2和python3。为了实现一个更快的爬虫，你可以在分布式的环境下使用多线程进行爬取。

Pyspyder的基本用法都有很好的 [文档说明][17] ，包括简单的代码片段。你能通过查看一个 [在线的样例][18] 来获得用户界面的感觉。它在Apache 2 license下开源许可，pyspyder仍然在GitHub上活跃的发展。

### MechanicalSoup

[MechanicalSoup][19] 是一个基于流行通用的HTML语法解析库 [Beautiful Soup][20]建立的爬虫库。如果你的爬虫需要相当的简单，但是又要求检查一些选择框或者输入一些文字切你又不想为这个任务单独写一个爬虫，那么这会是一个值得考虑的选择。

MechanicalSoup在MIT license下开源许可。查看GitHub上该项目的[example.py][21]样例文件来获得更多的用法。不幸的是，到目前为止，这个项目还没有一个很好的文档。

### Scrapy

[Scrapy][22] 是一个有着活跃社区支持的爬虫框架，在那里你可以建造自己的爬虫工具。除了是爬取和解析工具，它还能将它收集的数据以JSON或者CSV一类的格式输出或者是存储在一个你选择的后端数据库。它还有许多内置的扩展，例如cookie处理、代理欺骗、限制爬虫深度。同时还有可以建立自己附件的API。

为了入门Scrapy，你可以查看 [网上的文档][23]或者是访问它诸多的[社区][24]资源，包括一个IRC频道Subreddit 以及关注他们的StackOverflow。Scrapy的代码在3-clause BSD license下开源许可，你可以在 [GitHub][25]上找到他们。

如果你不熟悉编程，[Portia][26] 提供了一个可视化的接口让它变得简单。[scrapinghub.com][27]提供一个托管的版本。

### 其他

*   [Cola][6] 描述它自己是个高级的分布式爬虫框架，如果你在寻找一个python2的方法，这也许会符合你的需要，但是注意它已经有超过两年没有更新了。
*   [Demiurge][7] 是另一个可以考虑的潜在候选者，它同时支持python2和python3，虽然这个项目的发展较为缓慢。
*   [Feedparser][8] 是一个有用的项目，它可以解析一些在RSS和摘要上的数据。

*   [Lassie][9] 让从网站检索像说明、标题、关键词或者是图片一类的基础内容变得简单。
*   [RoboBrowser][10] 是另一个简单的库，它基于python2或者python3的函数库，其包括按钮点击和表格填充。虽然它有一段时间没有更新了，但是它仍然是一个不错的选择。

* * *

这远不是一个完整的列表，当然，如果你是一个编程专家，你可以选择采取你自己的方法而不是使用这些框架中的一个。或者你发现一个用其他语言编写的替代品。例如python编程者可能更喜欢[python附带的][28] [Selenium][29]，它可以在不使用浏览器的情况下进行爬取。如果你得到了一个好的爬虫工具，请在下面评论让我们知道。
--------------------------------------------------------------------------------

via: https://opensource.com/resources/python/web-scraper-crawler

作者：[Jason Baker ][a]
译者：[译者ID](https://github.com/ZH1122)
校对：[校对者ID](https://github.com/校对者ID)

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

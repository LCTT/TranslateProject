3 Python web scrapers and crawlers
============================================================

### Check out these great Python tools for crawling and scraping the web, and parsing out the data you need.


![Python web scrapers and crawlers](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/openweb-osdc-lead.png?itok=yjU4KliG "Python web scrapers and crawlers")
Image credits : [You as a Machine][13]. Modified by Rikki Endsley. [CC BY-SA 2.0][14].

In a perfect world, all of the data you need would be cleanly presented in an open and well-documented format that you could easily download and use for whatever purpose you need.

In the real world, data is messy, rarely packaged how you need it, and often out-of-date.

More Python Resources

*   [What is Python?][1]

*   [Top Python IDEs][2]

*   [Top Python GUI frameworks][3]

*   [Latest Python content][4]

*   [More developer resources][5]

Often, the information you need is trapped inside of a website. While some websites make an effort to present data in a clean, structured data format, many do not. [Crawling][33], [scraping][34], processing, and cleaning data is a necessary activity for a whole host of activities from mapping a website's structure to collecting data that's in a web-only format, or perhaps, locked away in a proprietary database.

Sooner or later, you're going to find a need to do some crawling and scraping to get the data you need, and almost certainly you're going to need to do a little coding to get it done right. How you do this is up to you, but I've found the Python community to be a great provider of tools, frameworks, and documentation for grabbing data off of websites.

Before we jump in, just a quick request: think before you do, and be nice. In the context of scraping, this can mean a lot of things. Don't crawl websites just to duplicate them and present someone else's work as your own (without permission, of course). Be aware of copyrights and licensing, and how each might apply to whatever you have scraped. Respect [robots.txt][15] files. And don't hit a website so frequently that the actual human visitors have trouble accessing the content.

With that caution stated, here are some great Python tools for crawling and scraping the web, and parsing out the data you need.

### Pyspider

Let's kick things off with [pyspider][16], a web-crawler with a web-based user interface that makes it easy to keep track of multiple crawls. It's an extensible option, with multiple backend databases and message queues supported, and several handy features baked in, from prioritization to the ability to retry failed pages, crawling pages by age, and others. Pyspider supports both Python 2 and 3, and for faster crawling, you can use it in a distributed format with multiple crawlers going at once.

Pyspyder's basic usage is well [documented][17] including sample code snippets, and you can check out an [online demo][18] to get a sense of the user interface. Licensed under the Apache 2 license, pyspyder is still being actively developed on GitHub.

### MechanicalSoup

[MechanicalSoup][19] is a crawling library built around the hugely-popular and incredibly versatile HTML parsing library [Beautiful Soup][20]. If your crawling needs are fairly simple, but require you to check a few boxes or enter some text and you don't want to build your own crawler for this task, it's a good option to consider.

MechanicalSoup is licensed under an MIT license. For more on how to use it, check out the example source file [example.py][21] on the project's GitHub page. Unfortunately, the project does not have robust documentation at this time

### Scrapy

[Scrapy][22] is a scraping framework supported by an active community with which you can build your own scraping tool. In addition to scraping and parsing tools, it can easily export the data it collects in a number of formats like JSON or CSV and store the data on a backend of your choosing. It also has a number of built-in extensions for tasks like cookie handling, user-agent spoofing, restricting crawl depth, and others, as well as an API for easily building your own additions.

For an introduction to Scrapy, check out the [online documentation][23] or one of their many [community][24] resources, including an IRC channel, Subreddit, and a healthy following on their StackOverflow tag. Scrapy's code base can be found [on GitHub][25] under a 3-clause BSD license.

If you're not all that comfortable with coding, [Portia][26] provides a visual interface that makes it easier. A hosted version is available at [scrapinghub.com][27].

### Others

*   [Cola][6] describes itself as a “high-level distributed crawling framework” that might meet your needs if you're looking for a Python 2 approach, but note that it has not been updated in over two years.

*   [Demiurge][7], which supports both Python 2 and Python 3, is another potential candidate to look at, although development on this project is relatively quiet as well.

*   [Feedparser][8] might be a helpful project to check out if the data you are trying to parse resides primarily in RSS or Atom feeds.

*   [Lassie][9] makes it easy to retrieve basic content like a description, title, keywords, or a list of images from a webpage.

*   [RoboBrowser][10] is another simple library for Python 2 or 3 with basic functionality, including button-clicking and form-filling. Though it hasn't been updated in a while, it's still a reasonable choice.

* * *

This is far from a comprehensive list, and of course, if you're a master coder you may choose to take your own approach rather than use one of these frameworks. Or, perhaps, you've found a great alternative built for a different language. For example, Python coders would probably appreciate checking out the [Python bindings][28] for [Selenium][29] for sites that are trickier to crawl without using an actual web browser. If you've got a favorite tool for crawling and scraping, let us know in the comments below.

--------------------------------------------------------------------------------

via: https://opensource.com/resources/python/web-scraper-crawler

作者：[Jason Baker ][a]
译者：[译者ID](https://github.com/译者ID)
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

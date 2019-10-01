[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11351-1.html)
[#]: subject: (Sandboxie's path to open source, update on the Pentagon's open source initiative, open source in Hollywood, and more)
[#]: via: (https://opensource.com/article/19/9/news-september-15)
[#]: author: (Lauren Maffeo https://opensource.com/users/lmaffeo)

开源新闻综述：五角大楼、好莱坞和 Sandboxie 的开源
======

> 不要错过两周以来最大的开源头条新闻。

![Weekly news roundup with TV][1]

在本期我们的开源新闻综述中有 Sandboxie 的开源之路、五角大楼开源计划的进一步变化、好莱坞开源等等！

### 五角大楼不符合白宫对开源软件的要求

2016 年，美国白宫要求每个美国政府机构必须在三年内开放至少 20％ 的定制软件。2017 年有一篇关于这一倡议的[有趣文章][5]，其中列出了一些令人激动的事情和面临的挑战。

根据美国政府问责局（GAO）的说法，[美国五角大楼做的还远远不足][6]。

在一篇关于 Nextgov 的文章中，Jack Corrigan 写道，截至 2019 年 7 月，美国五角大楼仅发布了 10％ 的代码为开源代码。他们还没有实施的其它白宫任务包括要求制定开源软件政策和定制代码的清单。

根据该报告，一些美国政府官员告诉 GAO，他们担心美国政府部门间共享代码的安全风险。他们还承认没有创建衡量开源工作成功的指标。美国五角大楼的首席技术官将五角大楼的规模列为不执行白宫的开源任务的原因。在周二发布的一份报告中，GAO 表示，“在（美国国防部）完全实施其试点计划并确定完成行政管理和预算局（OMB）要求的里程碑之前，该部门将无法达成显著的成本节约和效率的目的。”

### Sandboxie 在开源的过程中变成了免费软件

一家英国安全公司 Sophos Group plc 发布了[其流行的 Sandboxie 工具的免费版本][2]，它用作Windows 的隔离操作环境（[可在此下载][2]）。

Sophos 表示，由于 Sandboxie 不是其业务的核心，因此更容易做出的决定就是关闭它。但 Sandboxie 因为无需让用户的操作系统冒风险就可以在安全的环境中运行未知软件而[广受赞誉][3]，因此该团队正在投入额外的工作将其作为开源软件发布。这个免费但非开源的中间阶段似乎与当前的系统设计有关，因为它需要激活密钥：

> Sandboxie 目前使用许可证密钥来激活和授予仅针对付费客户开放的高级功能的访问权限（与使用免费版本的用户相比）。我们修改了代码，并发布了一个不限制任何功能的免费版本的更新版。换句话说，新的免费许可证将可以访问之前仅供付费客户使用的所有功能。

受此工具的社区影响，Sophos 的高级领导人宣布发布 Sandboxie 版本 5.31.4，这个不受限制的程序版本将保持免费，直到该工具完全开源。

> “Sandboxie 用户群代表了一些最热情、前瞻性和知识渊博的安全社区成员，我们不想让你失望，”[Sophos 的博文说到][4]。“经过深思熟虑后，我们认为让 Sandboxie 走下去的最佳方式是将其交还给用户，将其转换为开源工具。”

### 志愿者团队致力于查找和数字化无版权书籍

1924 年以前在美国出版的所有书籍都是[公有的、可以自由使用/复制的][7]。1964 年及之后出版的图书在出版日期后将保留 95 年的版权。但由于版权漏洞，1923 年至 1964 年间出版的书籍中有高达 75％ 可以免费阅读和复制。现在只需要耗时确认那些书是什么。

因此，一些图书馆、志愿者和档案管理员们联合起来了解哪些图书没有版权，然后将其数字化并上传到互联网。由于版权续约记录已经数字化，因此很容易判断 1923 年至 1964 年间出版的书籍是否更新了其版权。但是，由于试图提供的是反证，因此寻找缺乏版权更新的难度要大得多。

参与者包括纽约公共图书馆（NYPL），它[最近解释了][8]为什么这个耗时的项目是值得的。为了帮助更快地找到更多书籍，NYPL 将许多记录转换为 XML 格式。这样可以更轻松地自动执行查找可以将哪些书籍添加到公共域的过程。

### 好莱坞的学院软件基金会获得新成员

微软和苹果公司宣布计划以<ruby>学院软件基金会<rt>Academy Software Foundation</rt></ruby>（ASWF）的高级会员做出贡献。他们将加入[创始董事会成员][9]，其它成员还包括 Netflix、Google Cloud、Disney Studios 和 Sony Pictures。

学院软件基金会于 2018 年作为[电影艺术与科学学院][10]和[Linux 基金会][11]的联合项目而启动。

> 学院软件基金会（ASWF）的使命是提高贡献到内容创作行业的开源软件库的质量和数量；提供一个中立的论坛来协调跨项目的工作；提供通用的构建和测试基础架构；并为个人和组织提供参与推进我们的开源生态系统的明确途径。

在第一年内，该基金会构建了 [OpenTimelineIO][12]，这是一种开源 API 和交换格式，可帮助工作室团队跨部门协作。OpenTImelineIO 被该[基金会技术咨询委员会][13]去年 7 月正式接受为第五个托管项目。他们现在将它与 [OpenColorIO][14]、[OpenCue][15]、[OpenEXR][16] 和 [OpenVDB] [17] 并列维护。

### 其它新闻

* [Comcast 将开源网络软件投入生产环境][18]
* [SD Times 本周开源项目：Ballerina][19]
* [美国国防部努力实施开源计划][20]
* [Kong 开源通用服务网格 Kuma][21]
* [Eclipse 推出 Jakarta EE 8][22]

一如既往地感谢 Opensource.com 的工作人员和主持人本周的帮助。

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/9/news-september-15

作者：[Lauren Maffeo][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/lmaffeo
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/weekly_news_roundup_tv.png?itok=B6PM4S1i (Weekly news roundup with TV)
[2]: https://www.sandboxie.com/DownloadSandboxie
[3]: https://betanews.com/2019/09/13/sandboxie-free-open-source/
[4]: https://community.sophos.com/products/sandboxie/f/forum/115109/major-sandboxie-news-sandboxie-is-now-a-free-tool-with-plans-to-transition-it-to-an-open-source-tool/414522
[5]: https://medium.com/@DefenseDigitalService/code-mil-an-open-source-initiative-at-the-pentagon-5ae4986b79bc
[6]: https://www.nextgov.com/analytics-data/2019/09/pentagon-needs-make-more-software-open-source-watchdog-says/159832/
[7]: https://www.vice.com/en_us/article/a3534j/libraries-and-archivists-are-scanning-and-uploading-books-that-are-secretly-in-the-public-domain
[8]: https://www.nypl.org/blog/2019/09/01/historical-copyright-records-transparency
[9]: https://variety.com/2019/digital/news/microsoft-apple-academy-software-foundation-1203334675/
[10]: https://www.oscars.org/
[11]: http://www.linuxfoundation.org/
[12]: https://github.com/PixarAnimationStudios/OpenTimelineIO
[13]: https://www.linuxfoundation.org/press-release/2019/07/opentimelineio-joins-aswf/
[14]: https://opencolorio.org/
[15]: https://www.opencue.io/
[16]: https://www.openexr.com/
[17]: https://www.openvdb.org/
[18]: https://www.fiercetelecom.com/operators/comcast-puts-open-source-networking-software-into-production
[19]: https://sdtimes.com/os/sd-times-open-source-project-of-the-week-ballerina/
[20]: https://www.fedscoop.com/open-source-software-dod-struggles/
[21]: https://sdtimes.com/micro/kong-open-sources-universal-service-mesh-kuma/
[22]: https://devclass.com/2019/09/11/hey-were-open-source-again-eclipse-unveils-jakarta-ee-8/

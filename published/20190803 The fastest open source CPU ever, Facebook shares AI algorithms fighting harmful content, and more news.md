[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11187-1.html)
[#]: subject: (The fastest open source CPU ever, Facebook shares AI algorithms fighting harmful content, and more news)
[#]: via: (https://opensource.com/article/19/8/news-august-3)
[#]: author: (Lauren Maffeo https://opensource.com/users/lmaffeo)

开源新闻综述：有史以来最快的开源 CPU、Facebook 分享对抗有害内容的 AI 算法
======

> 不要错过最近两周最大的开源新闻。

![Weekly news roundup with TV][1]

在本期开源新闻综述中，我们分享了 Facebook 开源了两种算法来查找有害内容，Apple 在数据传输项目中的新角色以及你应该知道的更多新闻。

### Facebook 开源算法用于查找有害内容

Facebook 宣布它[开源两种算法][2]用于在该平台上发现儿童剥削、恐怖主义威胁和写实暴力。在 8 月 1 日的博客文章中，Facebook 分享了 PDQ 和 TMK + PDQF 这两种将文件存储为数字哈希的技术，然后将它们与已知的有害内容示例进行比较 - [现在已放在 GitHub 上][3]。

该代码是在 Facebook 要尽快将有害内容从平台上移除的压力之下发布的。三月份在新西兰的大规模谋杀案被曝光在 Facebook Live 上，澳大利亚政府[威胁][4]如果视频没有及时删除 Facebook 高管将被处以罚款和入狱。通过发布这些算法的源代码，Facebook 表示希望非营利组织、科技公司和独立开发人员都能帮助他们更快地找到并删除有害内容。

### 阿里巴巴发布了最快的开源 CPU

上个月，阿里巴巴的子公司平头哥半导体公司[发布了其玄铁 91 处理器][5]。它可以用于人工智能、物联网、5G 和自动驾驶汽车等基础设施。它拥有 7.1 Coremark/MHz 的基准，使其成为市场上最快的开源 CPU。

平头哥宣布计划在今年 9 月在 GitHub 上提供其优质代码。分析师认为此次发布旨在帮助中国实现其目标，即到 2021 年使用本地供应商满足 40％ 的处理器需求。近期美国的关税调整威胁要破坏这一目标，从而造成了对开源计算机组件的需求。

### Mattermost 为开源协作应用提供了理由

所有开源社区都受益于可以从一个或多个地方彼此进行通信。团队聊天应用程序的世界似乎由 Slack 和 Microsoft Teams 等极少数的强大工具主导。大多数选择都是基于云的和专有产品的；而 Mattermost 采用了不同的方法，销售开源协作应用程序的价值。

“人们想要一个开源替代品，因为他们需要信任、灵活性和只有开源才能提供的创新，”Mattermost 的联合创始人兼首席执行官 Ian Tien 说。

随着从优步到国防部的客户，Mattermost 走上了一个关键市场：需要开源软件的团队，他们可以信任这些软件并安装在他们自己的服务器上。对于需要协作应用程序在其内部基础架构上运行的企业，Mattermost 填补了 [Atlassian 离开后][6] 的空白。在 Computerworld 的一篇文章中，Matthew Finnegan [探讨][7]了为什么在本地部署的开源聊天工具尚未死亡。

### Apple 加入了开源数据传输项目

Google、Facebook、Twitter 和微软去年联合创建了<ruby>数据传输项目<rt>Data Transfer Project</rt></ruby>（DTP）。DTP 被誉为通过自己的数据提升数据安全性和用户代理的一种方式，是一种罕见的技术上的团结展示。本周，Apple 宣布他们也将[加入][8]。

DTP 的目标是帮助用户通过开源平台将数据从一个在线服务转移到另一个在线服务。DTP 旨在通过使用 API 和授权工具来取消中间人，以便用户将数据从一个服务转移到另一个服务。这将消除用户下载数据然后将其上传到另一个服务的需要。Apple 加入 DTP 的选择将允许用户将数据传入和传出 iCloud，这可能是隐私权拥护者的一大胜利。

#### 其它新闻

* [FlexiWAN 的开源 SD-WAN 可在公共测试版中下载] [9]
* [开源的 Windows 计算器应用程序获得了永远置顶模式] [10]
* [通过 Zowe，开源和 DevOps 正在使大型计算机民主化] [11]
* [Mozilla 首次推出 WebThings Gateway 开源路由器固件的实现] [12]
* [更新：向 Mozilla 代码库做成贡献][13]

*谢谢 Opensource.com 的工作人员和主持人本周的帮助。*

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/8/news-august-3

作者：[Lauren Maffeo][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/lmaffeo
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/weekly_news_roundup_tv.png?itok=B6PM4S1i (Weekly news roundup with TV)
[2]: https://www.theverge.com/2019/8/1/20750752/facebook-child-exploitation-terrorism-open-source-algorithm-pdq-tmk
[3]: https://github.com/facebook/ThreatExchange/tree/master/hashing/tmk
[4]: https://www.buzzfeed.com/hannahryan/social-media-facebook-livestreaming-laws-christchurch
[5]: https://hexus.net/tech/news/cpu/133229-alibabas-16-core-risc-v-fastest-open-source-cpu-yet/
[6]: https://lab.getapp.com/atlassian-slack-on-premise-software/
[7]: https://www.computerworld.com/article/3428679/mattermost-makes-case-for-open-source-as-team-messaging-market-booms.html
[8]: https://www.techspot.com/news/81221-apple-joins-data-transfer-project-open-source-project.html
[9]: https://www.fiercetelecom.com/telecom/flexiwan-s-open-source-sd-wan-available-for-download-public-beta-release
[10]: https://mspoweruser.com/open-source-windows-calculator-app-to-get-always-on-top-mode/
[11]: https://siliconangle.com/2019/07/29/zowe-open-source-devops-democratizing-mainframe-computer/
[12]: https://venturebeat.com/2019/07/25/mozilla-debuts-webthings-gateway-open-source-router-firmware-for-turris-omnia/
[13]: https://developer.mozilla.org/en-US/docs/Mozilla/Developer_guide/Introduction

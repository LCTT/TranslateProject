[#]: subject: (How Free & Open Source Software Can Save Online Privacy)
[#]: via: (https://news.itsfoss.com/save-privacy-with-foss/)
[#]: author: (Team It's FOSS https://news.itsfoss.com/author/team/)
[#]: collector: (lujun9972)
[#]: translator: (zz-air)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13512-1.html)

自由/开源软件如何保护在线隐私
======

![](https://i2.wp.com/news.itsfoss.com/wp-content/uploads/2021/06/online-privacy.png?w=1200&ssl=1)

_多年来，我一直使用科技巨头提供的服务。大部分都是免费的，但是是以牺牲我的隐私为代价的。但那些日子已经过去了，现在我浏览、聊天、工作，没有任何人能跟踪、变现和审查我的数据。多亏了自由/开源软件。_

### 我开始担心大型科技公司了

![][1]

我一直觉得机器应该按照我的意愿行事，而不是反过来。这就是为什么谷歌的 Android 操作系统在 2008 年首次上市时就立刻吸引了我。在当时，谷歌的开源方式确实令人耳目一新。我花了几个小时定制了我的 HTC Hero 手机。我对它是不是比我朋友的 iPhone 或塞班设备更丑并不在意。我的新玩意具有无限的通用性。

一跃十年，谷歌已经成为了科技巨头，使 iOS 相形见绌并且淘汰了塞班操作系统。如今，这个公司占据了 90% 以上的搜索流量，并主导着浏览器市场。这种惊人的增长是有代价的，谷歌删除了“不作恶”条款就说明了这一点。这家搜索巨头目前正陷入官司之中，比如关于 [数据收集和追踪不当行为][2] 的案件。研究人员还在谷歌的联系人追踪应用程序中发现了 [隐私缺陷][3]。更重要的是，这家科技巨头宣布了一个颇具争议的 [可以追踪用户浏览行为][4] 的新算法，从而更好地提供广告服务。

现在，我不想把责任推给谷歌。亚马逊刚刚建立了美国历史上最大的民用 [监控网络][5] 。它让警方可以在未经许可的情况下使用数百万个家庭监控摄像头。于此同时，欧洲对亚马逊遵守 [隐私规定][6] 的情况进行了调查。微软也是如此。它也为顺带着促进 [工作场所监控][7] 功能而道歉。

有人可能认为，人们至少可以指望苹果来保护他们的隐私。这家科技巨头最近让他们选择知道应用程序是否会追踪他们的行为。事实证明，[只有 5%][8] 的美国用户选择接受这种新的应用追踪透明度。与此同时，该公司从谷歌这样的数据经纪商的业务中获得了 [巨大的利益][9]。更别提《堡垒之夜》开发商 Epic Games 和苹果之间的 [反垄断审判][10] ，后者声称要保护其应用商店的隐私。当然，还有 Facebook。该公司的隐私不当行为在参议院就 [剑桥分析公司][11] 丑闻举行的听证会上达到了高潮，失去了用户仅存的信任。

尽管如此 —— 或者因为 —— 这些有问题的做法，这些公司的总价值在 2021 年 3 月超过了 [7.5 万亿美元][12]。“科技巨头”们 现在超过了德国和英国国内生产总值的总和！

### 为什么隐私很重要

![][13]

我们都在使用大科技公司的服务。我们是 <ruby>[监控资本主义][14]<rt>Surveillance Capitalism</rt></ruby> 的一部分，这是哈佛大学教授 Shoshana Zuboff 创造的一个术语，在 Cory Doctorow 的 [新书][15]《监控资本主义》里也讨论了它。这是一个以技术垄断为中心的经济体系，通过收集个人数据来获取利润最大化。这一制度威胁到民主的核心，因为它导致了大规模监视，扰乱了选举程序，推动了思想的一致性和审查制度。

监视资本主义的基础是对我们生活的侵犯，令人深感不安。我们往往忘记隐私是一项基本权利。它被<ruby>联合国人权理事会<rt>UN Human Rights Council</rt></ruby>、《<ruby>公民权利与政治权利国际公约<rt>International Covenant on Civil and Political Rights</rt></ruby>》和一些条约所规定。我认为我们都能体会到：在我们的生活中有很多方面我们想要保持隐私，即使没有错误的行为。无论是为了自由地表达自己，探索自己的个性，而不被他人评判。还是为了保护我们不受监视、审查和操纵。这就是窗帘被发明的原因。还有银行保密、律师-客户特权，通信保密，投票保密，告解室保密或医疗保密。

解决网络隐私问题是一个广泛问题，它需要对我们的法律体系和社会习俗的全面改变。对技术垄断的监管是这个十年的主要挑战之一。最近科技巨头和政府之间的对峙就说明了这一点：[澳大利亚 vs. Facebook][16]、 [中国 vs. 腾讯][17]、 [印度 vs. WhatsApp][18]、[欧盟 vs. Facebook][19] 或者是 [美国 vs. 科技巨头][20]。多年来，数字权利组织和软件基金会一直在倡导更好的隐私法律、用户权利和创新自由，如：<ruby>电子前沿基金会<rt>Electronic Frontier Foundation</rt></ruby>、<ruby>自由软件基金会<rt>Free Software Foundation</rt></ruby>、<ruby>新闻自由基金会<rt>Freedom of the Press Foundation</rt></ruby>、<ruby>隐私国际<rt>Privacy International</rt></ruby>、<ruby>开放权利组织<rt>Open Rights Group</rt></ruby>或<ruby>欧洲数字权利<rt>European Digital Rights</rt></ruby>。

### 这和自由/开源软件有什么关系？

![][21]

自 1983 年成立以来，<ruby>[自由软件运动][22]<rt>Free Software movement</rt></ruby> 已经成为一个相当多样化的社区。自由和开源软件通常被称为 FOSS、FLOSS、Libre Software 或 Free Software。 它包括一系列许可证，授权给用户 [使用、学习、分享并提高][23] 这个软件的权力。以及 [维修][24] 的权利。 <ruby>自由软件<rt>Free Software</rt></ruby>的“<ruby>自由<rt>Free</rt></ruby>”是指 “[言论自由][25]”的“自由”，有时也指 “免费啤酒”的“免费”。因此，自由/开源软件（FOSS）不仅仅是技术。它是关于社会、政治和经济解放的。

几年前，一场隐私争议震动了自由软件社区。Ubuntu 12.10（各种不同的 GHU/Linux 风格之一）开始在人们的电脑上建立互联网连接进行本地搜索。它为亚马逊提供广告服务，并与 Facebook 或 Twitter 共享私人数据。遭到了 [剧烈反弹][26]。几年后， Canonical（Ubuntu 背后的公司）最终取消了在线搜索和亚马逊 Web 应用。最近 [Audacity 闹剧][27] 是自由/开源软件如何保护隐私的另一个例子。新的项目管理层决定将谷歌的 Analytics 和 Yandex 添加到音频软件中，但由于公众的强烈抗议，最终放弃了这一计划。

尽管自由软件有很多优点，但它也不能免于批评。一种说法是自由/开源软件项目经常被放弃。然而最近在 [实证软件工程和测量会议][28] 上提出的一项研究表明，情况并非如此：在 1932 个流行的开源项目中，有 7%（128 个项目）在被忽视后由新的开发人员接管，使烂尾率降低到不到 10%（187 个项目）。

另一个常见的批评是自由/开源软件通过公布代码暴露了潜在的安全漏洞。另一方面，将源代码保密 [不一定会提高安全性][29]。认为封闭源代码要比自由/开源软件安全得多的观点，却忽略了一个事实，即专有堆栈越来越多地构建在 [开放源代码之上][30]。自由软件也倾向于去中心化，这有助于增强抵御监视、单点故障或大规模数据泄露。所以可以肯定的是，自由/开源软件并不能避免安全漏洞。但专有的解决方案也是如此，正如来自 Facebook、Linkedin 和 Clubhouse 的最新 [10 亿人的数据泄露][31] 或者对 SolarWind 和 Colonial 管道公司的大规模 [安全攻击][32] 所说明的那样。

总之，自由软件在促进网上隐私方面发挥了重要作用。近四十年来，自由/开源软件一直鼓励开发人员审计代码、修复问题并确保幕后没有任何可疑的事情发生。

### 使用自由/开源软件实现在线隐私的七个步骤

![][33]

在等待更好的隐私法律出台的同时，还有很多事情可以让你的设备更隐私。以下是用尊重隐私、自由/开源软件取代大型科技公司的七个步骤。 根据你的 [威胁模型][34]，你可能想首先考虑步骤 1 到步骤 4，因为它们已经提供了一个合理的隐私水平。如果你有一些技术技能，想要更进一步，看看步骤 5 到步骤 7。

  1. **[参与到隐私保护中来][35]**。关于在线隐私、数据利用、过滤泡沫、监控和审查，还有很多值得我们讨论和学习的地方。参与进来，传播信息。
  2. **[选择一个安全和隐私的浏览器][36]**。切换到 Firefox。阻止追踪器、cookie 和广告。使用尊重隐私的搜索引擎。可能要用 Tor 或 VPN 加密你的通信。
  3. **[保持交流的私密性][37]**。使用端到端加密保护你的电子邮件、消息和电话。抛弃传统的社交媒体，探索 fediversity ，这是一个由各种在线服务组成的联合家庭。
  4. **[保护你的数据][38]**。使用长且独特的密码。为你的每个账户和设备选择一个不同的密码。将它们安全地保存在加密的密码管理器中。考虑使用双因素身份验证。创建一个常规备份例程。并对敏感数据进行加密。
  5. **[解绑你的电脑][39]**。切换到 GNU/Linux ，并首选自由和开源的应用程序。根据你的需要，选择一个对初学者友好的发行版，如 Linux Mint 或 Ubuntu；对于更有经验的用户，选择 Debian、Manjaro、openSUSE、Fedora 或 Gentoo Linux。对于隐私爱好者，可以看看 Qubes OS、Whonix 或 Tails。
  6. **[解绑你的手机][40]**。切换到一个定制的移动操作系统，如 LineageOS、CalyxOS、GrapheneOS 或 /e/。首选社区维护的应用商店提供的自由及开源应用。
  7. **[解绑你的云][41]**。选择尊重隐私的云服务商。或设置你自己的安全服务器和自托管服务，例如云存储、图库、任务和联系人管理，或媒体流。 

### 结束

![][42]

面对在线隐私没有一键式解决方案。用自由及开源软件取代大型科技公司是一个过程。有些改动很简单，比如安装 Firefox 或 Signal。其他方法需要更多的时间和技能。但它们绝对值得。你并不孤单，你可以依靠一个很棒的社区的支持。所以，请允许我引用《华盛顿邮报》在线专栏的 [Geoffrey A. Fowler][43] 的话作为总结: “_隐私没有消亡，但你必须足够愤怒才能要求它_”。

* * *

### 关于作者

![][48]

_Georg Jerska 是一个对保护公民隐私特别感兴趣的开源爱好者。他和他的小团队运营着 [GoFOSS][44]，这是一个关于如何用尊重隐私的自由和开源软件取代大型科技公司的全面指南。_

_[开源][46] 插图 [Katerina Limpitsouni][47]。_

_所表达的观点只是作者的观点，并不一定反应我们的官方政策或立场。_

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/save-privacy-with-foss/

作者：[Team It's FOSS][a]
选题：[lujun9972][b]
译者：[zz-air](https://github.com/zz-air)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/team/
[b]: https://github.com/lujun9972
[1]: https://i2.wp.com/news.itsfoss.com/wp-content/uploads/2021/06/big_tech.png?resize=706%2C636&ssl=1
[2]: https://www.gizmodo.com.au/2021/05/google-location-services-lawsuit
[3]: https://blog.appcensus.io/2021/04/27/why-google-should-stop-logging-contact-tracing-data
[4]: https://news.itsfoss.com/google-floc
[5]: https://www.theguardian.com/commentisfree/2021/may/18/amazon-ring-largest-civilian-surveillance-network-us
[6]: https://edps.europa.eu/press-publications/press-news/press-releases/2021/edps-opens-two-investigations-following-schrems_en
[7]: https://www.theguardian.com/technology/2020/dec/02/microsoft-apologises-productivity-score-critics-derided-workplace-surveillance
[8]: https://www.flurry.com/blog/ios-14-5-opt-in-rate-att-restricted-app-tracking-transparency-worldwide-us-daily-latest-update
[9]: https://www.nytimes.com/2020/10/25/technology/apple-google-search-antitrust.html
[10]: https://www.nytimes.com/2021/05/25/business/dealbook/apple-epic-case.html
[11]: https://en.wikipedia.org/wiki/Cambridge_Analytica
[12]: https://en.wikipedia.org/wiki/List_of_public_corporations_by_market_capitalization#2021
[13]: https://i1.wp.com/news.itsfoss.com/wp-content/uploads/2021/06/privacy.png?resize=706%2C584&ssl=1
[14]: https://en.wikipedia.org/wiki/Surveillance_capitalism
[15]: https://www.goodreads.com/book/show/55134785-how-to-destroy-surveillance-capitalism
[16]: https://www.bbc.com/news/world-australia-56163550
[17]: https://www.nytimes.com/2021/06/02/technology/china-tencent-monopoly.html
[18]: https://www.theguardian.com/world/2021/may/26/whatsapp-sues-indian-government-over-mass-surveillance-internet-laws
[19]: https://nypost.com/2021/05/26/eu-reportedly-set-to-open-formal-antitrust-probe-into-facebook
[20]: https://www.nytimes.com/interactive/2020/10/06/technology/house-antitrust-report-big-tech.html
[21]: https://i1.wp.com/news.itsfoss.com/wp-content/uploads/2021/06/foss.png?resize=706%2C631&ssl=1
[22]: https://itsfoss.com/what-is-foss
[23]: https://fsfe.org/freesoftware/freesoftware.en.html
[24]: https://framatube.org/videos/watch/99069c5c-5a00-489e-97cb-fd5cc76de77c
[25]: https://www.eff.org/deeplinks/2015/04/remembering-case-established-code-speech
[26]: https://itsfoss.com/canonical-targets-website-crictical-ubuntu-privacy
[27]: https://github.com/audacity/audacity/pull/835
[28]: https://arxiv.org/abs/1906.08058
[29]: https://www.schneier.com/crypto-gram/archives/2002/0515.html#1
[30]: https://www.bcg.com/publications/2021/open-source-software-strategy-benefits
[31]: https://www.politico.eu/article/how-to-leak-data-and-get-away-with-it
[32]: https://theconversation.com/the-colonial-pipeline-ransomware-attack-and-the-solarwinds-hack-were-all-but-inevitable-why-national-cyber-defense-is-a-wicked-problem-160661
[33]: https://i1.wp.com/news.itsfoss.com/wp-content/uploads/2021/06/steps.png?w=1054&ssl=1
[34]: https://www.eff.org/files/2015/11/24/3mod_threat-modeling-ssd_9-3-15.pdf
[35]: https://www.gofoss.today/nothing-to-hide
[36]: https://www.gofoss.today/intro-browse-freely
[37]: https://www.gofoss.today/intro-speak-freely
[38]: https://www.gofoss.today/intro-store-safely
[39]: https://www.gofoss.today/intro-free-your-computer
[40]: https://www.gofoss.today/intro-free-your-phone
[41]: https://www.gofoss.today/intro-free-your-cloud
[42]: https://i2.wp.com/news.itsfoss.com/wp-content/uploads/2021/06/gofoss.png?resize=300%2C300&ssl=1
[43]: https://www.washingtonpost.com/technology/2019/12/31/how-we-survive-surveillance-apocalypse
[44]: https://gofoss.today/
[45]: https://gofoss.today
[46]: https://undraw.co/license
[47]: https://undraw.co
[48]: https://i1.wp.com/news.itsfoss.com/wp-content/uploads/2021/06/georg.png?resize=300%2C300&ssl=1
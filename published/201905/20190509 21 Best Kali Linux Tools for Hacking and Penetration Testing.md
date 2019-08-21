[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10860-1.html)
[#]: subject: (21 Best Kali Linux Tools for Hacking and Penetration Testing)
[#]: via: (https://itsfoss.com/best-kali-linux-tools/)
[#]: author: (Ankush Das https://itsfoss.com/author/ankush/)

用于黑客渗透测试的 21 个最佳 Kali Linux 工具
======

> 这里是最好的 Kali Linux 工具列表，它们可以让你评估 Web 服务器的安全性，并帮助你执行黑客渗透测试。

如果你读过 [Kali Linux 点评][1]，你就知道为什么它被认为是[最好的黑客渗透测试的 Linux 发行版][2]之一，而且名副其实。它带有许多工具，使你可以更轻松地测试、破解以及进行与数字取证相关的任何其他工作。

它是<ruby>道德黑客<rt>ethical hacker</rt></ruby>最推荐的 Linux 发行版之一。即使你不是黑客而是网站管理员 —— 你仍然可以利用其中某些工具轻松地扫描你的网络服务器或网页。

在任何一种情况下，无论你的目的是什么 —— 让我们来看看你应该使用的一些最好的 Kali Linux 工具。

*注意：这里不是所提及的所有工具都是开源的。*

### 用于黑客渗透测试的 Kali Linux 工具

![Kali Linux](https://img.linux.net.cn/data/attachment/album/201905/15/234125c22rx77mmz9m37zo.jpg)

Kali Linux 预装了几种类型的工具。如果你发现有的工具没有安装，只需下载并进行设置即可。这很简单。

#### 1、Nmap

![Kali Linux Nmap][4]

[Nmap][5] （即 “<ruby>网络映射器<rt>Network Mapper</rt></ruby>”）是 Kali Linux 上最受欢迎的信息收集工具之一。换句话说，它可以获取有关主机的信息：其 IP 地址、操作系统检测以及网络安全的详细信息（如开放的端口数量及其含义）。

它还提供防火墙规避和欺骗功能。

#### 2、Lynis

![Lynis Kali Linux Tool][6]

[Lynis][7] 是安全审计、合规性测试和系统强化的强大工具。当然，你也可以将其用于漏洞检测和渗透测试。

它将根据检测到的组件扫描系统。例如，如果它检测到 Apache —— 它将针对入口信息运行与 Apache 相关的测试。

#### 3、WPScan

![][8]

WordPress 是[最好的开源 CMS][9]之一，而这个工具是最好的免费 WordpPress 安全审计工具。它是免费的，但不是开源的。

如果你想知道一个 WordPress 博客是否在某种程度上容易受到攻击，[WPScan][10] 就是你的朋友。

此外，它还为你提供了所用的插件的详细信息。当然，一个安全性很好的博客可能不会暴露给你很多细节，但它仍然是 WordPress 安全扫描找到潜在漏洞的最佳工具。

#### 4、Aircrack-ng

![][11]

[Aircrack-ng][12] 是评估 WiFi 网络安全性的工具集合。它不仅限于监控和获取信息 —— 还包括破坏网络（WEP、WPA 1 和 WPA 2）的能力。

如果你忘记了自己的 WiFi 网络的密码，可以尝试使用它来重新获得访问权限。它还包括各种无线攻击能力，你可以使用它们来定位和监控 WiFi 网络以增强其安全性。

#### 5、Hydra

![][13]

如果你正在寻找一个有趣的工具来破解登录密码，[Hydra][14] 将是 Kali Linux 预装的最好的工具之一。

它可能不再被积极维护，但它现在放在 [GitHub][15] 上，所以你也可以为它做贡献。

#### 6、Wireshark

![][17]

[Wireshark][18] 是 Kali Linux 上最受欢迎的网络分析仪。它也可以归类为用于网络嗅探的最佳 Kali Linux 工具之一。

它正在积极维护，所以我肯定会建议你试试它。

#### 7、Metasploit Framework

![][19]

[Metsploit Framework][20]（MSF）是最常用的渗透测试框架。它提供两个版本：一个开源版，另外一个是其专业版。使用此工具，你可以验证漏洞、测试已知漏洞并执行完整的安全评估。

当然，免费版本不具备所有功能，所以如果你在意它们的区别，你应该在[这里][21]比较一下版本。

#### 8、Skipfish

![][22]

与 WPScan 类似，但它不仅仅专注于 WordPress。[Skipfish][23] 是一个 Web 应用扫描程序，可以为你提供几乎所有类型的 Web 应用程序的洞察信息。它快速且易于使用。此外，它的递归爬取方法使它更好用。

Skipfish 生成的报告可以用于专业的 Web 应用程序安全评估。

#### 9、Maltego

![][24]

[Maltego][25] 是一种令人印象深刻的数据挖掘工具，用于在线分析信息并连接信息点（如果有的话）。 根据这些信息，它创建了一个有向图，以帮助分析这些数据之间的链接。

请注意，这不是一个开源工具。

它已预装，但你必须注册才能选择要使用的版本。如果个人使用，社区版就足够了（只需要注册一个帐户），但如果想用于商业用途，则需要订阅 classic 或 XL 版本。

#### 10、Nessus

![Nessus][26]

如果你的计算机连接到了网络，Nessus 可以帮助你找到潜在攻击者可能利用的漏洞。当然，如果你是多台连接到网络的计算机的管理员，则可以使用它并保护这些计算机。

但是，它不再是免费的工具了，你可以从[官方网站][27]免费试用 7 天。

#### 11、Burp Suite Scanner

![][28]

[Burp Suite Scanner][29] 是一款出色的网络安全分析工具。与其它 Web 应用程序安全扫描程序不同，Burp 提供了 GUI 和一些高级工具。

社区版仅将功能限制为一些基本的手动工具。对于专业人士，你必须考虑升级。与前面的工具类似，这也不是开源的。

我使用过免费版本，但是如果你想了解更多细节，你应该查看他们[官方网站][29]上提供的功能。

#### 12、BeEF

![][30]

BeEF（<ruby>浏览器利用框架<rt>Browser Exploitation Framework</rt></ruby>）是另一个令人印象深刻的工具。它专为渗透测试人员量身定制，用于评估 Web 浏览器的安全性。

这是最好的 Kali Linux 工具之一，因为很多用户在谈论 Web 安全时希望了解并修复客户端的问题。

#### 13、Apktool

![][31]

[Apktool][32] 确实是 Kali Linux 上用于逆向工程 Android 应用程序的流行工具之一。当然，你应该正确利用它 —— 出于教育目的。

使用此工具，你可以自己尝试一下，并让原开发人员了解你的想法。你认为你会用它做什么？

#### 14、sqlmap

![][34]

如果你正在寻找一个开源渗透测试工具 —— [sqlmap][35] 是最好的之一。它可以自动化利用 SQL 注入漏洞的过程，并帮助你接管数据库服务器。

#### 15、John the Ripper

![John The Ripper][36]

[John the Ripper][37] 是 Kali Linux 上流行的密码破解工具。它也是自由开源的。但是，如果你对[社区增强版][37]不感兴趣，可以用于商业用途的[专业版][38]。

#### 16、Snort

想要实时流量分析和数据包记录功能吗？[Snort][39] 可以鼎力支持你。即使它是一个开源的入侵防御系统，也有很多东西可以提供。

如果你还没有安装它，[官方网站][40]提及了安装过程。

#### 17、Autopsy Forensic Browser

![][41]

[Autopsy][42] 是一个数字取证工具，用于调查计算机上发生的事情。那么，你也可以使用它从 SD 卡恢复图像。它也被执法官员使用。你可以阅读[文档][43]来探索可以用它做什么。

你还应该查看他们的 [GitHub 页面][44]。

#### 18、King Phisher

![King Phisher][45]

网络钓鱼攻击现在非常普遍。[King Phisher 工具][46]可以通过模拟真实的网络钓鱼攻击来帮助测试和提升用户意识。出于显而易见的原因，在模拟一个组织的服务器内容前，你需要获得许可。

#### 19、Nikto

![Nikto][47]

[Nikto][48] 是一款功能强大的 Web 服务器扫描程序 —— 这使其成为最好的 Kali Linux 工具之一。 它会检查存在潜在危险的文件/程序、过时的服务器版本等等。

#### 20、Yersinia

![][49]

[Yersinia][50] 是一个有趣的框架，用于在网络上执行第 2 层攻击（第 2 层是指 [OSI 模型][51]的数据链路层）。当然，如果你希望你的网络安全，则必须考虑所有七个层。但是，此工具侧重于第 2 层和各种网络协议，包括 STP、CDP，DTP 等。

#### 21、Social Engineering Toolkit (SET)

![][52]

如果你正在进行相当严格的渗透测试，那么这应该是你应该检查的最佳工具之一。社交工程是一个大问题，使用 [SET][53] 工具，你可以帮助防止此类攻击。

### 总结

实际上 Kali Linux 捆绑了很多工具。请参考 Kali Linux 的[官方工具列表页面][54]来查找所有内容。

你会发现其中一些是完全自由开源的，而有些则是专有解决方案（但是免费）。但是，出于商业目的，你应该始终选择高级版本。

我们可能错过了你最喜欢的某个 Kali Linux 工具。请在下面的评论部分告诉我们。

--------------------------------------------------------------------------------

via: https://itsfoss.com/best-kali-linux-tools/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/kali-linux-review/
[2]: https://itsfoss.com/linux-hacking-penetration-testing/
[3]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/04/kali-linux-tools.jpg?resize=800%2C518&ssl=1
[4]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/04/kali-linux-nmap.jpg?resize=800%2C559&ssl=1
[5]: https://nmap.org/
[6]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/04/lynis-kali-linux-tool.jpg?resize=800%2C525&ssl=1
[7]: https://cisofy.com/lynis/
[8]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/04/wpscan-kali-linux.jpg?resize=800%2C545&ssl=1
[9]: https://itsfoss.com/open-source-cms/
[10]: https://wpscan.org/
[11]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/04/aircrack-ng-kali-linux-tool.jpg?resize=800%2C514&ssl=1
[12]: https://www.aircrack-ng.org/
[13]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/04/hydra-kali-linux.jpg?resize=800%2C529&ssl=1
[14]: https://github.com/vanhauser-thc/thc-hydra
[15]: https://github.com/vanhauser-thc/THC-Archive
[16]: https://itsfoss.com/new-linux-distros-2013/
[17]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/04/wireshark-network-analyzer.jpg?resize=800%2C556&ssl=1
[18]: https://www.wireshark.org/
[19]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/04/metasploit-framework.jpg?resize=800%2C561&ssl=1
[20]: https://github.com/rapid7/metasploit-framework
[21]: https://www.rapid7.com/products/metasploit/download/editions/
[22]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/04/skipfish-kali-linux-tool.jpg?resize=800%2C515&ssl=1
[23]: https://gitlab.com/kalilinux/packages/skipfish/
[24]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/04/maltego.jpg?resize=800%2C403&ssl=1
[25]: https://www.paterva.com/web7/buy/maltego-clients.php
[26]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/05/nessus.jpg?resize=800%2C456&ssl=1
[27]: https://www.tenable.com/try
[28]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/04/burp-suite-community-edition-800x582.jpg?resize=800%2C582&ssl=1
[29]: https://portswigger.net/burp
[30]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/04/beef-framework.jpg?resize=800%2C339&ssl=1
[31]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/04/apktool.jpg?resize=800%2C504&ssl=1
[32]: https://github.com/iBotPeaches/Apktool
[33]: https://itsfoss.com/format-factory-alternative-linux/
[34]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/05/sqlmap.jpg?resize=800%2C528&ssl=1
[35]: http://sqlmap.org/
[36]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/05/john-the-ripper.jpg?ssl=1
[37]: https://github.com/magnumripper/JohnTheRipper
[38]: https://www.openwall.com/john/pro/
[39]: https://www.snort.org/
[40]: https://www.snort.org/#get-started
[41]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/05/autopsy-forensic-browser.jpg?resize=800%2C319&ssl=1
[42]: https://www.sleuthkit.org/autopsy/
[43]: https://www.sleuthkit.org/autopsy/docs.php
[44]: https://github.com/sleuthkit/autopsy
[45]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/05/king-phisher.jpg?resize=800%2C626&ssl=1
[46]: https://github.com/securestate/king-phisher
[47]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/05/nikto.jpg?resize=800%2C511&ssl=1
[48]: https://gitlab.com/kalilinux/packages/nikto/
[49]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/05/yersinia.jpg?resize=800%2C516&ssl=1
[50]: https://github.com/tomac/yersinia
[51]: https://en.wikipedia.org/wiki/OSI_model
[52]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/05/social-engineering-toolkit.jpg?resize=800%2C511&ssl=1
[53]: https://www.trustedsec.com/social-engineer-toolkit-set/
[54]: https://tools.kali.org/tools-listing

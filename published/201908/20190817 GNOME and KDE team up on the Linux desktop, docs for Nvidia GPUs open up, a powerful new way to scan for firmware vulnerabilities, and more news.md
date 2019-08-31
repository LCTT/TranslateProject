[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11241-1.html)
[#]: subject: (GNOME and KDE team up on the Linux desktop, docs for Nvidia GPUs open up, a powerful new way to scan for firmware vulnerabilities, and more news)
[#]: via: (https://opensource.com/article/19/8/news-august-17)
[#]: author: (Scott Nesbitt https://opensource.com/users/scottnesbitt)

开源新闻综述：GNOME 和 KDE 达成合作、Nvidia 开源 GPU 文档
======

> 不要错过两周以来最大的开源头条新闻。

![Weekly news roundup with TV][1]

在本期开源新闻综述中，我们将介绍两种新的强大数据可视化工具、Nvidia 开源其 GPU 文档、激动人心的新工具、确保自动驾驶汽车的固件安全等等！

### GNOME 和 KDE 在 Linux 桌面上达成合作伙伴

Linux 在桌面计算机上一直处于分裂状态。在最近的一篇[公告][2]中称，“两个主要的 Linux 桌面竞争对手，[GNOME 基金会][3] 和 [KDE][4] 已经同意合作。”

这两个组织将成为今年 11 月在巴塞罗那举办的 [Linux App Summit（LAS）2019][5] 的赞助商。这一举措在某种程度上似乎是对桌面计算不再是争夺支配地位的最佳场所的回应。无论是什么原因，Linux 桌面的粉丝们都有新的理由希望未来出现一个标准化的 GUI 环境。

### 新的开源数据可视化工具

这个世界上很少有不是由数据驱动的。除非数据以人们可以互动的形式出现，否则它并不是很好使用。最近开源的两个数据可视化项目正在尝试使数据更有用。

第一个工具名为 **Neuroglancer**，由 [Google 的研究团队][6]创建。它“使神经科医生能够在交互式可视化中建立大脑神经通路的 3D 模型。”Neuroglancer 通过使用神经网络追踪大脑中的神经元路径并构建完整的可视化来实现这一点。科学家已经使用了 Neuroglancer（你可以[从 GitHub 取得][7]）通过扫描果蝇的大脑来建立一个交互式地图。

第二个工具来自一个不太能想到的的来源：澳大利亚信号理事会。这是该国家类似 NSA 的机构，它“开源了[内部数据可视化和分析工具][8]之一。”这个被称为 **[Constellation][9]** 的工具可以“识别复杂数据集中的趋势和模式，并且能够扩展到‘数十亿输入’。”该机构总干事迈克•伯吉斯表示，他希望“这一工具将有助于产生有利于所有澳大利亚人的科学和其他方面的突破。”鉴于它是开源的，它可以使整个世界受益。

### Nvidia 开始发布 GPU 文档

多年来，图形处理单元（GPU）制造商 Nvidia 并没有做出什么让开源项目轻松开发其产品的驱动程序的努力。现在，该公司通过[发布 GPU 硬件文档][10]向这些项目迈出了一大步。

该公司根据 MIT 许可证发布的文档[可在 GitHub 上获取][11]。它涵盖了几个关键领域，如设备初始化、内存时钟/调整和电源状态。据硬件新闻网站 Phoronix 称，开发了 Nvidia GPU 的开源驱动程序的 Nouveau 项目将是率先使用该文档来推动其开发工作的项目之一。

### 用于保护固件的新工具

似乎每周都有的消息称，移动设备或连接互联网的小设备中出现新漏洞。通常，这些漏洞存在于控制设备的固件中。自动驾驶汽车服务 Cruise [发布了一个开源工具][12]，用于在这些漏洞成为问题之前捕获这些漏洞。

该工具被称为 [FwAnalzyer][13]。它检查固件代码中是否存在许多潜在问题，包括“识别潜在危险的可执行文件”，并查明“任何错误遗留的调试代码”。Cruise 的工程师 Collin Mulliner 曾帮助开发该工具，他说通过在代码上运行 FwAnalyzer，固件开发人员“现在能够检测并防止各种安全问题。”

### 其它新闻

* [为什么洛杉矶决定将未来寄予开源][14]
* [麻省理工学院出版社发布了关于开源出版软件的综合报告][15]
* [华为推出鸿蒙操作系统，不会放弃 Android 智能手机][16]

*一如既往地感谢 Opensource.com 的工作人员和主持人本周的帮助。*

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/8/news-august-17

作者：[Scott Nesbitt][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/scottnesbitt
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/weekly_news_roundup_tv.png?itok=B6PM4S1i (Weekly news roundup with TV)
[2]: https://www.zdnet.com/article/gnome-and-kde-work-together-on-the-linux-desktop/
[3]: https://www.gnome.org/
[4]: https://kde.org/
[5]: https://linuxappsummit.org/
[6]: https://www.cbronline.com/news/brain-mapping-google-ai
[7]: https://github.com/google/neuroglancer
[8]: https://www.computerworld.com.au/article/665286/australian-signals-directorate-open-sources-data-analysis-tool/
[9]: https://www.constellation-app.com/
[10]: https://www.phoronix.com/scan.php?page=news_item&px=NVIDIA-Open-GPU-Docs
[11]: https://github.com/nvidia/open-gpu-doc
[12]: https://arstechnica.com/information-technology/2019/08/self-driving-car-service-open-sources-new-tool-for-securing-firmware/
[13]: https://github.com/cruise-automation/fwanalyzer
[14]: https://www.techrepublic.com/article/why-la-decided-to-open-source-its-future/
[15]: https://news.mit.edu/2019/mit-press-report-open-source-publishing-software-0808
[16]: https://www.itnews.com.au/news/huawei-unveils-harmony-operating-system-wont-ditch-android-for-smartphones-529432

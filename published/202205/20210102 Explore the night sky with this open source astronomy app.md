[#]: collector: (lujun9972)
[#]: translator: (hanszhao80)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-14599-1.html)
[#]: subject: (Explore the night sky with this open source astronomy app)
[#]: via: (https://opensource.com/article/21/1/kstars)
[#]: author: (Don Watkins https://opensource.com/users/don-watkins)

使用开源天文应用程序 KStars 探索夜空
======

> 使用 KStars 从你的 Linux 桌面或安卓设备眺望星辰。

![](https://img.linux.net.cn/data/attachment/album/202205/16/104339d0u39oiyzugzjf86.jpg)

我一直对夜空很着迷。当我年轻的时候，唯一可用的参考资料是书籍，它们似乎描绘了一个与我从家里看到的不一样的天空。

五年多前，我曾介绍过两个开源天文馆应用程序 [Celestia 和 Stellarium][2] 的使用体验。最近，我又了解到一个应用 [KStars][3]。这是一个令人惊叹的开源应用程序，可以帮助儿童（和成人）参与科学和天文学。它的网站上说：

> “KStars 是一款自由开源的、跨平台的天文学软件。它提供了从地球上的任何位置、任何日期和时间对夜空的一个精确的图形化模拟。可展示包括多达 1 亿颗恒星，13,000 个深空天体，所有 8 个行星，太阳和月亮，以及数千颗彗星，小行星，超新星和卫星。“

KStars 是 [KDE 教育项目][4] 的一部分。最新版本可用于 Linux、Windows 和 MacOS，它集成了 [StellarSolver][5]，这是一个跨平台的 SExtractor 程序，它可以从天文图像构建一个天体目录。

### 安装 KStars

KStars 采用 GPL 2.0 协议自由授权。源代码可以在官方的 [KDE GitLab 实例][6] 查看（这是 GitHub 的一个只读镜像）。KDE 教育项目有着优秀的 [安装文档][7]。

我用的系统是 [Pop!_OS][8]，可以在 Pop!_Shop 找到这款应用程序。

可以从你的发行版的软件存储库中找到 KStars 在 Linux 上安装。而在安卓设备上，可以从 [Google Play 商店][9] 下载适配安卓的 KStars Lite。KDE 项目维护了一份优秀的 [KStars 手册][10] 来帮助用户。

### 使用 KStars

安装完后，从你的“<ruby>应用<rt>Applications</rt></ruby>”菜单启动程序。启动向导会指导你完成初始化设置。

![KStars 启动向导][11]

这些指示很容易理解。向导会提示设置你住所的位置。不幸的是，我所在的小村庄不在列表里，但附近一个更大的社区在里面。

![KStars 位置设置][13]

你还可以下载该程序的其他数据和额外功能。

![KStars 扩展][14]

这里有很多可用的选项。我选择“<ruby>在详细信息窗口中显示常见图像<rt>Common images displayed in the detail window</rt></ruby>”。

一旦完成设置，KStars 会呈现一张基于你的位置的夜空图。

![KStars 夜空显示][15]

左上角显示了当前时区（这张图里是 2020 年 11 月 30 日傍晚 5 点 58 分）。

使用鼠标左键，可以向左、向右、向上和向下移动显示。你可以使用鼠标滚轮进行放大和缩小。将鼠标光标放在天体上并右键单击可查看当前天体的描述。

![KStars 天体描述][16]

### 参与

KStars 正在积极寻求错误报告、天文学知识、代码、翻译等方面的帮助。主要开发者和维护者是 [Jasem Mutlaq][17]。如果你愿意贡献一份力量，请访问 [项目网站][18] 或加入邮件列表以了解更多信息。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/1/kstars

作者：[Don Watkins][a]
选题：[lujun9972][b]
译者：[hanszhao80](https://github.com/hanszhao80)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/don-watkins
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/osdc_520x292_opensourcestars.png?itok=hnrMETFh (Open source stars.)
[2]: https://opensource.com/education/15/7/open-source-apps-explore-night-sky
[3]: https://edu.kde.org/kstars/
[4]: https://edu.kde.org/
[5]: https://github.com/rlancaste/stellarsolver
[6]: https://invent.kde.org/education/kstars
[7]: https://edu.kde.org/kstars/install.php
[8]: https://pop.system76.com/
[9]: https://play.google.com/store/apps/details?id=org.kde.kstars.lite&hl=en
[10]: https://docs.kde.org/trunk5/en/extragear-edu/kstars/index.html
[11]: https://opensource.com/sites/default/files/uploads/kstars_startupwizard.png (KStars Startup Wizard)
[12]: https://creativecommons.org/licenses/by-sa/4.0/
[13]: https://opensource.com/sites/default/files/uploads/kstars_setlocation.png (KStars location setup)
[14]: https://opensource.com/sites/default/files/uploads/kstars_addons.png (KStars add-ons)
[15]: https://opensource.com/sites/default/files/uploads/kstars_sky.png (KStars night sky display)
[16]: https://opensource.com/sites/default/files/uploads/kstars_objectdescription.png (KStars describes objects)
[17]: https://github.com/knro
[18]: https://edu.kde.org/kstars

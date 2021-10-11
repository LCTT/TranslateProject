[#]: subject: "Building an open source community health analytics platform"
[#]: via: "https://opensource.com/article/21/9/openrit-mystic"
[#]: author: "Quinn Foster https://opensource.com/users/quinn-foster"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-13800-1.html"

构建开源的社区健康分析平台
======

> 一个学术性的 OSPO 正在与 CHAOSS 软件合作，以建立一个社区健康分析平台。

![](https://img.linux.net.cn/data/attachment/album/202109/19/100755mlngkwvvwjjlblgn.png)

<ruby>罗切斯特理工学院<rt>Rochester Institute of Technology</rt></ruby>（RIT）最近在增加其在开源世界的影响力方面取得了相当大的进展。RIT的自由和开源软件及自由文化辅修课程是学术界的第一个此类课程。例如，其开源项目办公室 Open@RIT 已经开始帮助 RIT 的教职员工和研究员为他们的开源项目建立和维护社区。

这些进展是由 RIT 的学生、教师和工作人员推动的。目前，大学里已经有越来越多的人在管理他们自己的开源项目。然而，运行一个完全的开源项目可能是很麻烦的。这主要来自于维护项目的社区和管理数据，如项目的代码、问题跟踪和仓库。

为了帮助他们，Open@RIT 正在创建一个名为 Mystic 的系统，这是一个社区健康分析平台，利用了 [GrimoireLab][2]，这是一个由 [CHAOSS][3] 软件开发的开源工具包，为开源项目提供了指标和分析。GrimoireLab 允许用户收集、丰富、过滤和可视化一个项目的数据，例如一个报告的问题被解决的时间、贡献者的关系等。

Mystic 将作为一个前端门户，任何人都可以提交他们的项目。在那里，项目将被直接发送到 GrimoireLab，它将在几分钟后为提交者计算并发布项目的指标。

> Open@RIT 的全栈开发者和 Mystic 的首席开发者 Emi Simpson 说：“我们希望 RIT 的任何管理、领导或参与开源项目的人都能将该项目提交给 Mystic，并获得他们需要的任何指标”。

这个过程很简单。登录 Mystic 后，上传项目的用户会打开一个弹出式窗口，输入项目的细节和数据源的链接，如 GitLab、RSS feed 和一个<ruby>开放软件基金会<rt>Open Software Foundation</rt></ruby>（OSF）项目名。一旦保存了细节和项目，Mystic 就会使用 GrimoireLab 从项目源中自动检索指标，并为每个源渲染图表。然后，该项目及其指标将显示在它自己的仪表板上。

![Mystic statistics page][4]

这些仪表盘将并列显示在一个页面上，以供其他人查看，鼓励 RIT 内部的开源社区之间的合作开发和互动。Simpson 和 Open@RIT 希望这将增加 RIT 的开放工作的参与度，并进一步巩固该大学作为开放工作中心的地位。

> Simpson 说：“如果有人问 RIT 在为开源软件做什么，我希望人们能够指着 Mystic 和 GrimoireLab 说就是这些。通过建立‘这些是我们正在做的，这些是我们的贡献，这些是人们正在做的项目’的指标，我们可以在 RIT 建立一个以我们正在做的开源工作为中心的社区。”

目前，Mystic 仍在开发中，还没有准备好进入生产环境，但它对 RIT 和整个开源的潜力仍然是有目共睹的。未来的目标包括实现与大学报告工具的轻松整合，以及在项目层面和总体上的综合仪表盘。

你对 Mystic 的贡献感兴趣吗？[请与我们联系][6] 开始吧。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/9/openrit-mystic

作者：[Quinn Foster][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/quinn-foster
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/metrics_data_dashboard_system_computer_analytics.png?itok=oxAeIEI- (metrics and data shown on a computer screen)
[2]: https://chaoss.github.io/grimoirelab/
[3]: https://chaoss.community/
[4]: https://opensource.com/sites/default/files/uploads/mystic_statistics_page.png (Mystic statistics page)
[5]: https://creativecommons.org/licenses/by-sa/4.0/
[6]: https://opensource.ieee.org/rit/mystic

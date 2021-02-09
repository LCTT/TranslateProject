[#]: collector: (lujun9972)
[#]: translator: (Chao-zhi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13096-1.html)
[#]: subject: (EndeavourOS Aims to Fill the Void Left by Antergos in Arch Linux World)
[#]: via: (https://itsfoss.com/endeavouros/)
[#]: author: (John Paul https://itsfoss.com/author/john/)

EndeavourOS：填补 Antergos 在 ArchLinux 世界留下的空白
======

![](https://img.linux.net.cn/data/attachment/album/202102/07/225558rdb85bmm6uumro71.jpg)

我相信我们的大多数读者都知道 [Antergos 项目的终结][2]。在这一消息宣布之后，Antergos 社区的成员创建了几个发行版来继承 Antergos。今天，我们将着眼于 Antergos 的“精神继承人”之一：[EndeavourOS][3]。

### EndeavourOS 不是 Antergos 的分支

在我们开始之前，我想非常明确地指出，EndeavourOS 并不是一个 Antergos 的复刻版本。开发者们以 Antergos 为灵感，创建了一个基于 Arch 的轻量级发行版。

![Endeavouros First Boot][4]

根据 [这个项目网站][5] 的说法，EndeavourOS 的诞生是因为 Antergos 社区的人们想要保持 Antergos 的精神。他们的目标很简单：“让 Arch 拥有一个易于使用的安装程序和一个友好、有帮助的社区，在掌握系统的过程中能够有一个社区可以依靠。”

与许多基于 Arch 的发行版不同，EndeavourOS 打算像 [原生 Arch][5] 那样使用，“所以没有一键式安装你喜欢的应用程序的解决方案，也没有一堆你最终不需要的预装应用程序。”对于大多数人来说，尤其是那些刚接触 Linux 和 Arch 的人，会有一个学习曲线，但 EndeavourOS 的目标是建立一个大型友好的社区，鼓励人们提出问题并了解他们的系统。

![Endeavouros Installing][6]

### 正在进行的工作

EndeavourOS 在 [2019 年 5 月 23 日首次宣布成立][8] 随后 [在 7 月 15 日发布第一个版本][7]。不幸的是，这意味着开发人员无法将他们计划的所有功能全部整合进来。（LCTT 译注：本文原文发表于 2019 年，而现在，EndeavourOS 还在持续活跃着。）

例如，他们想要一个类似于 Antergos 的在线安装，但却遇到了[当前选项的问题][9]。“Cnchi 运行在 Antergos 生态系统之外会造成严重的问题，需要彻底重写才能发挥作用。RebornOS 的 Fenix 安装程序还没有完全成型，需要更多时间才能正常运行。”于是现在，EndeavourOS 将会和 [Calamares 安装程序 ][10] 一起发布。

EndeavourOS 会提供 [比 Antergos 少的东西][9]：它的存储库比 Antergos 小，尽管他们会附带一些 AUR 包。他们的目标是提供一个接近 Arch 却不是原生 Arch 的系统。

![Endeavouros Updating With Kalu][12]

开发者[进一步声明 ][13]:

> “Linux，特别是 Arch，核心精神是自由选择，我们提供了一个基本的安装，让你在一个精细的层面上方便地探索各项选择。我们永远不会强行为你作决定，比如为你安装 GUI 应用程序，如 Pamac，甚至采用沙盒解决方案，如 Flatpak 或 Snaps。想安装成什么样子完全取决于你，这是我们与 Antergos 或 Manjaro 的主要区别，但与 Antergos 一样，如果你安装的软件包遇到问题，我们会尽力帮助你。”

### 体验 EndeavourOS

我在 [VirtualBox][14] 中安装了 EndeavourOS，并且研究了一番。当我第一次启动时，我看到一个窗口，里面有关于安装的 EndeavourOS 网站的链接。它还有一个安装按钮和一个手动分区工具。Calamares 安装程序的安装过程非常顺利。

在我重新启动到新安装的 EndeavourOS 之后，迎接我的是一个彩色主题的 XFCE 桌面。我还收到了一堆通知消息。我使用过的大多数基于 Arch 的发行版都带有一个 GUI 包管理器，比如 [pamac][15] 或 [octopi][16]，以进行系统更新。EndeavourOS 配有 [kalu][17]（kalu 是 “Keeping Arch Linux Up-to-date” 的缩写）。它可以更新软件包、可以看 Archlinux 新闻、可以更新 AUR 包等等。一旦它检查到有更新，它就会显示通知消息。

我浏览了一下菜单，看看默认安装了什么。默认的安装并不多，连办公套件都没有。他们想让 EndeavourOS 成为一块空白画布，让任何人都可以创建他们想要的系统。他们正朝着正确的方向前进。

![Endeavouros Desktop][18]

### 总结思考

EndeavourOS 还很年轻。第一个稳定版本都没有发布多久。它缺少一些东西，最重要的是一个在线安装程序。这就是说，我们无法估计他能够走到哪一步。（LCTT 译注：本文发表于 2019 年）

虽然它不是 Antergos 的精确复刻，但 EndeavourOS 希望复制 Antergos 最重要的部分——热情友好的社区。很多时候，Linux 社区对初学者似乎是不受欢迎甚至是完全敌对的。我看到越来越多的人试图与这种消极情绪作斗争，并将更多的人引入 Linux。随着 EndeavourOS 团队把焦点放在社区建设上，我相信一个伟大的发行版将会诞生。

如果你当前正在使用 Antergos，有一种方法可以让你[不用重装系统就切换到 EndeavourOS][20]

如果你想要一个 Antergos 的精确复刻，我建议你去看看 [RebornOS][21]。他们目前正在开发一个名为 Fenix 的 Cnchi 安装程序的替代品。

你试过 EndeavourOS 了吗？你的感受如何？

--------------------------------------------------------------------------------

via: https://itsfoss.com/endeavouros/

作者：[John Paul][a]
选题：[lujun9972][b]
译者：[Chao-zhi](https://github.com/Chao-zhi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/john/
[b]: https://github.com/lujun9972
[1]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/08/endeavouros-logo.png?ssl=1
[2]: https://itsfoss.com/antergos-linux-discontinued/
[3]: https://endeavouros.com/
[4]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/08/endeavouros-first-boot.png?resize=800%2C600&ssl=1
[5]: https://endeavouros.com/info-2/
[6]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/08/endeavouros-installing.png?resize=800%2C600&ssl=1
[7]: https://endeavouros.com/endeavouros-first-stable-release-has-arrived/
[8]: https://forum.antergos.com/topic/11780/endeavour-antergos-community-s-next-stage
[9]: https://endeavouros.com/what-to-expect-on-the-first-release/
[10]: https://calamares.io/
[11]: https://itsfoss.com/veltos-linux/
[12]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/08/endeavouros-updating-with-kalu.png?resize=800%2C600&ssl=1
[13]: https://endeavouros.com/second-week-after-the-stable-release/
[14]: https://itsfoss.com/install-virtualbox-ubuntu/
[15]: https://aur.archlinux.org/packages/pamac-aur/
[16]: https://octopiproject.wordpress.com/
[17]: https://github.com/jjk-jacky/kalu
[18]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/08/endeavouros-desktop.png?resize=800%2C600&ssl=1
[19]: https://itsfoss.com/clear-linux/
[20]: https://forum.endeavouros.com/t/how-to-switch-from-antergos-to-endevouros/105/2
[21]: https://rebornos.org/

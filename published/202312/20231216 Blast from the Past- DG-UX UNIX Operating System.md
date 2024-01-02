[#]: subject: "Blast from the Past: DG/UX UNIX Operating System"
[#]: via: "https://itsfoss.com/dg-ux-os/"
[#]: author: "Bill Dyer https://itsfoss.com/author/bill/"
[#]: collector: "lujun9972/lctt-scripts-1700446145"
[#]: translator: "ChatGPT"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-16481-1.html"

重温过去：DG/UX UNIX 操作系统
======

![][0]

> 和我一起重温怀旧时光，回顾我使用 DG/UX UNIX 操作系统和数据通用公司的 AViiON 工作站和服务器的经历。

我尝试寻找一些我以前使用过的旧操作系统 [DG/UX][1] 的信息。遗憾的是，关于它的信息已经不多了。这个小型操作系统深得我心，虽然我知道我的经历不会改写历史，但我还是愿意记录下我与之相关的经验，传承历史。

这款 [Unix][3] [操作系统][4] 由 <ruby>[数据通用公司][2]<rt>Data General</rt></ruby> 开发，主要服务于 [Eclipse MV][5] 迷你计算机系列以及随后的 [AViiON][6] 工作站和服务器。我并未在 Eclipse 系统上工作过，我的工作主要在 AViiON 系统上进行。这些系统坚固得就像坦克，使用起来也异常简洁。

![Data General AV/4000 | Picture copyright WolfeDen.org][7]

### 操作系统概述

我在 1990 年代中期开始接触 DG/UX，当时它已经存在了一段时间。DG/UX 1 在 1985 年 3 月发布，是基于 [UNIX System V][8] Release 2，且融入了 [4.1BSD][9] 的优秀特性构建的。几年后，DG/UX 3.10 就添加了 [TCP/IP][10] 网络、[NFS][11] 和 [X Window System][12]。记得 [CDE][13] 吗？

![CDE (Common Desktop Environment)][14]

DG/UX 4 在 1988 年发布（这个“4”在后面让我非常困扰...），此版本是系统的一次重大设计革新，基于 [System V Release 3][16]。同时，其文件系统可以通过逻辑磁盘设施跨越多个磁盘。

DG/UX 5.4 版本的改变非常有意义，这也是我开始使用的版本。这个版本将传统的 Unix 文件缓冲区缓存替换为了统一的、按需分页的虚拟内存管理。

该操作系统比其他一些 Unix 变体更强大，例如，它内置了完整的 [C][17] 语言编译器。我们同时还有一支 [COBOL][18] 程序员团队，不过我记得 COBOL 是作为插件使用的。现在，虽然大家都觉得 C 语言编译器是理所当然的存在，但在那个时代，它是一份无比珍贵的礼物。我编写过许多为管理任务服务的脚本，同时我还为特定的工作需求编写了几个 C 程序。

这款操作系统体积小巧，简单易用。System V 和加入的 BSD 工具是完美的结合，可以说，这是最优秀的两全其美的产物。不论是安装还是升级，都非常的简便，并且对内存或者处理器资源的需求也非常低。

内置在系统中的 [卷管理器][19] 简单但功能强大。基本上所有的磁盘管理都可以在线上完成，无需将文件系统切换为离线状态。在一个保险/风险管理工作环境中，这一特性是非常重要的。我们可以扩容、迁移、进行镜像或者缩容，这些功能也可以对交换区进行操作，在不中断系统运行的条件下原地迁移磁盘存储。

### 机器

我曾接触过的 AViiON 机器分两种类型：一种是 AV300 [pizza box][20] 工作站，另一种是配有 [CLARiiON][21] 磁盘阵列的 AV9500 服务器。

![Data General AViiON AV/300D came in Pizza Box style | Picture Credit Pizza Box Computer][22]

在 AViiON 中，DG/UX 支持使用 [多处理器][23]。在一个保险/风险管理工作环境中，这是一项很大的优势，因为并不是所有的 Unix 包都支持这个功能。此外，DG/UX 还能无缝地与 CLARiiON 阵列配合工作。

有了像 CLARiiON 这样的 RAID，为特定账户配置空间非常容易。但一个以前的管理员在创造账户时总是会选择“使用第一个可用空间”。很快我们碰到了一些问题，比如：一个单独的查询就会点亮全部 125 个磁盘上的指示灯 —— 一个账户的数据分布着整个阵列设备。

![By Michael Moll - photo taken by Michael Moll, CC BY 2.5, https://commons.wikimedia.org/w/index.php?curid=512844][24]

当我成为主管理员后，我就着手修复这个问题，把一个阵列指定给一些较大的帐户，小帐户分组到两个阵列上。整个修复过程花了我一个星期的晚班时间，但是 DG/UX 让重排文件到指定阵列的整个过程变得异常轻松。

RAID 本身也异常稳定。在某个时期，我们使用过 IBM 1GB 的磁盘。这些硬盘的内部机构有时候会卡住，能让它们回复正常工作的唯一方法就是把他们取出来，在地板上像旋转陀螺那样旋转（没错，我是认真的！）。偶尔，磁盘可能彻底报废，无法再转动。现在，RAID 会在阵列内复制每个磁盘的数据，因此数据仍旧存在，尽管效率将受到影响。有一次，我不得不从另一台计算机上“借用”一个磁盘，让一个阵列能够维持运行，直到我们得到替代品。当天，CLARiiON 的表现极为出色，我们并不想再继续这样冒险，因此我们决定替换所有磁盘，而 DG/UX 的备份/恢复工具使这项工作毫无障碍的进行。

### 技术支持

关于技术支持并没有太多可以讲的，因为它真的很棒。我从未在技术支持上遇到过问题，每个问题都得到了礼貌、准确的回答，如今这点已经很少见了。

你还记得我前面提到的那个“4”吗？就是那个后来让我感到困扰的数字？我曾经因此而拨打技术支持电话。在 1995 年，我收到了操作系统升级的磁带，但我们那时正在运行的是 5.4 版本。我见到 4.10 版本的磁带时非常惊讶，我原以为这是个错误，我被寄给了错误的磁带，我并不想将系统降级。

事实证明，我收到的是正确的磁带。那个“4”是为了向 System V Release **4** 版本致敬。我有时还会觉得这很奇怪 — 升级一个操作系统，却让版本号降低。下面是一些版本的列表说明：

  1. DG/UX 5.4 - 3.00 - 1994 年 1 月
  2. DG/UX 5.4 - 3.10 - 1994 年 7 月
  3. DG/UX 5.4 - 4.00 - 1995 年 1 月
  4. DG/UX - **4.10** - 1995 年 8 月
  5. DG/UX - **4.11** - 1995 年 12 月

### DG/UX 和 AViiON 的结束

我在 1995 年底离开了这个岗位，但听说在世纪之交 [EMC][25] 收购了数据通用公司，以便能够获得 CLARiiON 阵列和软件。考虑到 CLARiiON 的稳定性，这个决定我认为是理解的。据我记得，EMC 在收购后的几年内还在支持 DG/UX 操作系统和 AViiON，然后就停止支持了。我内心希望他们能一直保留这个操作系统，但那个时候，Unix 世界已经被像 [IBM][26]、[Sun Microsystems][27] 和 [HP][28] 这些大公司主导，同时还有像 [Linux][29] 这样的新兴力量在逐渐崭露头角。

数据通用公司和 DG/UX 无疑是拥有一段美好历史的。它们的卓越支持和操作系统是今天绝难比拟的。我特别喜欢那个操作系统，它也是一款绝对值得被铭记的操作系统。

*（题图：DA/e651f994-3695-4bfd-89cc-c6b7b1ad0309）*

--------------------------------------------------------------------------------

via: https://itsfoss.com/dg-ux-os/

作者：[Bill Dyer][a]
选题：[lujun9972][b]
译者：[ChatGPT](https://linux.cn/lctt/ChatGPT)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/bill/
[b]: https://github.com/lujun9972
[1]: https://archive.org/details/installing_the_dgux_system
[2]: https://en.wikipedia.org/wiki/Data_General
[3]: https://en.wikipedia.org/wiki/Unix
[4]: https://en.wikipedia.org/wiki/Operating_system
[5]: https://en.wikipedia.org/wiki/Eclipse_MV
[6]: https://en.wikipedia.org/wiki/Aviion
[7]: https://itsfoss.com/content/images/2023/12/data-general-avion.jpg
[8]: https://en.wikipedia.org/wiki/UNIX_System_V
[9]: https://en.wikipedia.org/wiki/BSD
[10]: https://en.wikipedia.org/wiki/TCP/IP
[11]: https://en.wikipedia.org/wiki/Network_File_System
[12]: https://en.wikipedia.org/wiki/X_Window_System
[13]: https://itsfoss.com/common-desktop-environment/
[14]: https://itsfoss.com/content/images/wordpress/2021/12/cde_desktop-4.jpg
[15]: https://itsfoss.com/content/images/size/w256h256/2022/12/android-chrome-192x192.png
[16]: https://en.wikipedia.org/wiki/System_V_Release_3
[17]: https://en.wikipedia.org/wiki/C_(programming_language)
[18]: https://en.wikipedia.org/wiki/COBOL
[19]: https://en.wikipedia.org/wiki/Logical_volume_management
[20]: https://en.wikipedia.org/wiki/Pizza_box_form_factor
[21]: https://en.wikipedia.org/wiki/Clariion
[22]: https://itsfoss.com/content/images/2023/12/aviion-av300-front--1-.jpg
[23]: https://en.wikipedia.org/wiki/Multiprocessor
[24]: https://itsfoss.com/content/images/2023/12/EMC_Clariion_CX500.jpg
[25]: https://en.wikipedia.org/wiki/EMC_Corporation
[26]: https://en.wikipedia.org/wiki/IBM
[27]: https://en.wikipedia.org/wiki/Sun_Microsystems
[28]: https://en.wikipedia.org/wiki/Hewlett-Packard
[29]: https://www.linux.com/what-is-linux/
[0]: https://img.linux.net.cn/data/attachment/album/202312/17/083916hnnvzxs1tnmn7thn.jpg
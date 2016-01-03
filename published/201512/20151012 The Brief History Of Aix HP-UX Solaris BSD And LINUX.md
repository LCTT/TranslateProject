UNIX 家族小史
================================================================================
![](http://1426826955.rsc.cdn77.org/wp-content/uploads/2015/05/linux-712x445.png)

要记住，当一扇门在你面前关闭的时候，另一扇门就会打开。肯·汤普森（[Ken Thompson][1]） 和丹尼斯·里奇（[Dennis Richie][2]） 两个人就是这句名言很好的实例。他们俩是**20世纪**最优秀的信息技术专家之二，因为他们创造了最具影响力和创新性的软件之一： **UNIX**。

### UNIX 系统诞生于贝尔实验室 ###

**UNIX** 最开始的名字是 **UNICS** (**UN**iplexed **I**nformation and **C**omputing **S**ervice)，它有一个大家庭，并不是从石头缝里蹦出来的。UNIX的祖父是 **CTSS** (**C**ompatible **T**ime **S**haring **S**ystem)，它的父亲是 **Multics** (**MULT**iplexed **I**nformation and **C**omputing **S**ervice)，这个系统能支持大量用户通过交互式分时（timesharing）的方式使用大型机。

UNIX 诞生于 **1969** 年，由**肯·汤普森**以及后来加入的**丹尼斯·里奇**共同完成。这两位优秀的研究员和科学家在一个**通用电器 GE**和**麻省理工学院**的合作项目里工作，项目目标是开发一个叫 Multics 的交互式分时系统。

Multics 的目标是整合分时技术以及当时其他先进技术，允许用户在远程终端通过电话（拨号）登录到主机，然后可以编辑文档，阅读电子邮件，运行计算器，等等。

在之后的五年里，AT&T 公司为 Multics 项目投入了数百万美元。他们购买了 GE-645 大型机，聚集了贝尔实验室的顶级研究人员，例如肯·汤普森、 Stuart Feldman、丹尼斯·里奇、道格拉斯·麦克罗伊（M. Douglas McIlroy）、 Joseph F. Ossanna 以及 Robert Morris。但是项目目标太过激进，进度严重滞后。最后，AT&T 高层决定放弃这个项目。

贝尔实验室的管理层决定停止这个让许多研究人员无比纠结的操作系统上的所有遗留工作。不过要感谢汤普森，里奇和一些其他研究员，他们把老板的命令丢到一边，并继续在实验室里满怀热心地忘我工作，最终孵化出前无古人后无来者的 UNIX。

UNIX 的第一声啼哭是在一台 PDP-7 微型机上，它是汤普森测试自己在操作系统设计上的点子的机器，也是汤普森和 里奇一起玩 Space and Travel 游戏的模拟器。

> “我们想要的不仅是一个优秀的编程环境，而是能围绕这个系统形成团体。按我们自己的经验，通过远程访问和分时主机实现的公共计算，本质上不只是用终端输入程序代替打孔机而已，而是鼓励密切沟通。”丹尼斯·里奇说。

UNIX 是第一个靠近理想的系统，在这里程序员可以坐在机器前自由摆弄程序，探索各种可能性并随手测试。在 UNIX 整个生命周期里，它吸引了大量因其他操作系统限制而投身过来的高手做出无私贡献，因此它的功能模型一直保持上升趋势。

UNIX 在 1970 年因为 PDP-11/20 获得了首次资金注入，之后正式更名为 UNIX 并支持在 PDP-11/20 上运行。UNIX 带来的第一次用于实际场景中是在 1971 年，贝尔实验室的专利部门配备来做文字处理。

### UNIX 上的 C 语言革命 ###

丹尼斯·里奇在 1972 年发明了一种叫 “**C**” 的高级编程语言 ，之后他和肯·汤普森决定用 “C” 重写 UNIX 系统，来支持更好的移植性。他们在那一年里编写和调试了差不多 100,000 行代码。在迁移到 “C” 语言后，系统可移植性非常好，只需要修改一小部分机器相关的代码就可以将 UNIX 移植到其他计算机平台上。

UNIX 第一次公开露面是 1973 年丹尼斯·里奇和肯·汤普森在操作系统原理（Operating Systems Principles）上发表的一篇论文，然后 AT&T 发布了 UNIX 系统第 5 版，并授权给教育机构使用，之后在 1975 年第一次以 **$20.000** 的价格授权企业使用 UNIX 第 6 版。应用最广泛的是 1980 年发布的 UNIX 第 7 版，任何人都可以购买授权，只是授权条款非常严格。授权内容包括源代码，以及用 PDP-11 汇编语言写的及其相关内核。反正，各种版本 UNIX 系统完全由它的用户手册确定。

### AIX 系统 ###

在 **1983** 年，**微软**计划开发 **Xenix** 作为 MS-DOS 的多用户版继任者，他们在那一年花了 $8,000 搭建了一台拥有 **512 KB** 内存以及 **10 MB**硬盘并运行 Xenix 的 Altos 586。而到 1984 年为止，全世界 UNIX System V 第二版的安装数量已经超过了 100,000 。在 1986 年发布了包含因特网域名服务的 4.3BSD，而且 **IBM** 宣布 **AIX 系统**的安装数已经超过 250,000。AIX 基于 Unix System V 开发，这套系统拥有 BSD 风格的根文件系统，是两者的结合。

AIX 第一次引入了 **日志文件系统 (JFS)** 以及集成逻辑卷管理器 (Logical Volume Manager ，LVM)。IBM 在 1989 年将 AIX 移植到自己的 RS/6000 平台。2001 年发布的 5L 版是一个突破性的版本，提供了 Linux 友好性以及支持 Power4 服务器的逻辑分区。

在 2004 年发布的 AIX 5.3 引入了支持高级电源虚拟化（ Advanced Power Virtualization，APV）的虚拟化技术，支持对称多线程、微分区，以及共享处理器池。

在 2007 年，IBM 同时发布 AIX 6.1 和 Power6 架构，开始加强自己的虚拟化产品。他们还将高级电源虚拟化重新包装成 PowerVM。

这次改进包括被称为 WPARs 的负载分区形式，类似于 Solaris 的 zones/Containers，但是功能更强。

### HP-UX 系统 ###

**惠普 UNIX (Hewlett-Packard’s UNIX，HP-UX)** 源于 System V 第 3 版。这套系统一开始只支持 PA-RISC HP 9000 平台。HP-UX 第 1 版发布于 1984 年。

HP-UX 第 9 版引入了 SAM，一个基于字符的图形用户界面 (GUI)，用户可以用来管理整个系统。在 1995 年发布的第 10 版，调整了系统文件分布以及目录结构，变得有点类似 AT&T SVR4。

第 11 版发布于 1997 年。这是 HP 第一个支持 64 位寻址的版本。不过在 2000 年重新发布成 11i，因为 HP 为特定的信息技术用途，引入了操作环境（operating environments）和分级应用（layered applications）的捆绑组（bundled groups）。

在 2001 年发布的 11.20 版宣称支持安腾（Itanium）系统。HP-UX 是第一个使用 ACLs（访问控制列表，Access Control Lists）管理文件权限的 UNIX 系统，也是首先支持内建逻辑卷管理器（Logical Volume Manager）的系统之一。

如今，HP-UX 因为 HP 和 Veritas 的合作关系使用了 Veritas 作为主文件系统。

HP-UX 目前的最新版本是 11iv3, update 4。

### Solaris 系统 ###

Sun 的 UNIX 版本是 **Solaris**，用来接替 1992 年创建的 **SunOS**。SunOS 一开始基于 BSD（伯克利软件发行版，Berkeley Software Distribution）风格的 UNIX，但是 SunOS 5.0 版以及之后的版本都是基于重新包装为 Solaris 的 Unix System V 第 4 版。

SunOS 1.0 版于 1983 年发布，用于支持 Sun-1 和 Sun-2 平台。随后在 1985 年发布了 2.0 版。在 1987 年，Sun 和 AT&T 宣布合作一个项目以 SVR4 为基础将 System V 和 BSD 合并成一个版本。

Solaris 2.4 是 Sun 发布的第一个 Sparc/x86 版本。1994 年 11 月份发布的 SunOS 4.1.4 版是最后一个版本。Solaris 7 是首个 64 位 Ultra Sparc 版本，加入了对文件系统元数据记录的原生支持。

Solaris 9 发布于 2002 年，支持 Linux 特性以及 Solaris 卷管理器（Solaris Volume Manager）。之后，2005 年发布了 Solaris 10，带来许多创新，比如支持 Solaris Containers，新的 ZFS 文件系统，以及逻辑域（Logical Domains）。

目前 Solaris 最新的版本是 第 10 版，最后的更新发布于 2008 年。

### Linux ###

到了 1991 年，用来替代商业操作系统的自由（free）操作系统的需求日渐高涨。因此，**Linus Torvalds** 开始构建一个自由的操作系统，最终成为 **Linux**。Linux 最开始只有一些 “C” 文件，并且使用了阻止商业发行的授权。Linux 是一个类 UNIX 系统但又不尽相同。

2015 年发布了基于 GNU Public License （GPL）授权的 3.18 版。IBM 声称有超过 1800 万行开源代码开源给开发者。

如今 GNU Public License 是应用最广泛的自由软件授权方式。根据开源软件原则，这份授权允许个人和企业自由分发、运行、通过拷贝共享、学习，以及修改软件源码。

### UNIX vs. Linux：技术概要 ###

- Linux 鼓励多样性，Linux 的开发人员来自各种背景，有更多不同经验和意见。
- Linux 比 UNIX 支持更多的平台和架构。
- UNIX 商业版本的开发人员针对特定目标平台以及用户设计他们的操作系统。
- **Linux 比 UNIX 有更好的安全性**，更少受病毒或恶意软件攻击。截止到现在，Linux 上大约有 60-100 种病毒，但是没有任何一种还在传播。另一方面，UNIX 上大约有 85-120 种病毒，但是其中有一些还在传播中。
- 由于 UNIX 命令、工具和元素很少改变，甚至很多接口和命令行参数在后续 UNIX 版本中一直沿用。
- 有些 Linux 开发项目以自愿为基础进行资助，比如 Debian。其他项目会维护一个和商业 Linux 的社区版，比如 SUSE 的 openSUSE 以及红帽的 Fedora。
- 传统 UNIX 是纵向扩展，而另一方面 Linux 是横向扩展。

--------------------------------------------------------------------------------

via: http://www.unixmen.com/brief-history-aix-hp-ux-solaris-bsd-linux/

作者：[M.el Khamlichi][a]
译者：[zpl1025](https://github.com/zpl1025)
校对：[Caroline](https://github.com/carolinewuyan)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.unixmen.com/author/pirat9/
[1]:http://www.unixmen.com/ken-thompson-unix-systems-father/
[2]:http://www.unixmen.com/dennis-m-ritchie-father-c-programming-language/

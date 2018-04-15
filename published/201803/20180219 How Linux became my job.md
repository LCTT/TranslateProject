Linux 如何成为我的工作
======

> IBM 工程师 Phil Estes 分享了他的 Linux 爱好如何使他成为了一位开源领袖、贡献者和维护者。

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/linux_penguin_green.png?itok=ENdVzW22)

从很早很早以前起，我就一直使用开源软件。那个时候，没有所谓的社交媒体。没有火狐，没有谷歌浏览器（甚至连谷歌也没有），没有亚马逊，甚至几乎没有互联网。事实上，那个时候最热门的是最新的 Linux 2.0 内核。当时的技术挑战是什么？嗯，是 Linux 发行版本中旧的 [a.out][2] 格式被 [ELF 格式][1]代替，导致升级一些 [Linux][3] 的安装可能有些棘手。

我如何将我自己对这个初出茅庐的年轻操作系统的兴趣转变为开源事业是一个有趣的故事。

###  Linux 为乐趣为生，而非利益 

1994 年我大学毕业时，计算机实验室是 UNIX 系统的小型网络；如果你幸运的话，它们会连接到这个叫做互联网的新东西上。我知道这难以置信！（那时，）“Web”（就是所知道的那个）大多是手写的 HTML，`cgi-bin` 目录是启用动态 Web 交互的一个新平台。我们许多人对这些新技术感到兴奋，我们还自学了 shell 脚本、[Perl][4]、HTML，以及所有我们在父母的 Windows 3.1 PC 上从没有见过的简短的 UNIX 命令。

毕业后，我加入 IBM，工作在一个不能访问 UNIX 系统的 PC 操作系统上，不久，我的大学切断了我通往工程实验室的远程通道。我该如何继续通过 [Pine][6] 使用 `vi` 和 `ls` 读我的电子邮件的呢？我一直听说开源 Linux，但我还没有时间去研究它。

1996 年，我在德克萨斯大学奥斯丁分校开始读硕士学位。我知道这将涉及编程和写论文，不知道还有什么，但我不想使用专有的编辑器，编译器或者文字处理器。我想要的是我的 UNIX 体验! 

所以我拿了一个旧电脑，找到了一个 Linux 发行版本  Slackware 3.0，在我的 IBM 办公室下载了一张又一张的软盘。可以说我在第一次安装 Linux 后就没有回过头了。在最初的那些日子里，我学习了很多关于 Makefile 和 `make` 系统、构建软件、补丁还有源码控制的知识。虽然我开始使用 Linux 只是为了兴趣和个人知识，但它最终改变了我的职业生涯。

虽然我是一个愉快的 Linux 用户，但我认为开源开发仍然是其他人的工作；我觉得在线邮件列表都是神秘的 [UNIX][7] 极客的。我很感激像 Linux HOWTO 这样的项目，它们在我尝试添加软件包、升级 Linux 版本，或者安装新硬件和新 PC 的设备驱动程序撞得鼻青脸肿时帮助了我。但是要处理源代码并进行修改或提交到上游……那是别人的事，不是我。 

### Linux 如何成为我的工作 

1999 年，我终于有理由把我对 Linux 的个人兴趣与我在 IBM 的日常工作结合起来了。我接了一个研究项目，将 IBM 的 Java 虚拟机（JVM）移植到 Linux 上。为了确保我们在法律上是安全的，IBM 购买了一个塑封的盒装的 Red Hat Linux 6.1 副本来完成这项工作。在 IBM 东京研究实验室工作时，为了编写我们的 JVM 即时编译器（JIT），参考了 AIX JVM 源代码和 Windows 及 OS/2 的 JVM 源代码，我们在几周内就有了一个可以工作在 Linux 上的 JVM，击败了 SUN 公司官方宣告花了几个月才把 Java 移植到 Linux。既然我在 Linux 平台上做得了开发，我就更喜欢它了。 

到 2000 年，IBM 使用 Linux 的频率迅速增加。由于 [Dan Frye][8] 的远见和坚持，IBM 在 Linux 上下了“[一亿美元的赌注][9]”，在 1999 年创建了 Linux 技术中心（LTC）。在 LTC 里面有内核开发者、开源贡献者、IBM 硬件设备的驱动程序编写者，以及各种各样的针对 Linux 的开源工作。比起留在与 LTC 联系不大的部门，我更想要成为这个令人兴奋的 IBM 新天地的一份子。 

从 2003 年到 2013 年我深度参与了 IBM 的 Linux 战略和 Linux 发行版（在 IBM 内部）的使用，最终组成了一个团队成为大约 60 个产品的信息交换所，Linux 的使用涉及了 IBM 每个部门。我参与了收购，期望每个设备、管理系统和虚拟机或者基于物理设备的中间件都能运行 Linux。我开始熟悉 Linux 发行版的构建，包括打包、选择上游来源、开发发行版维护的补丁集、做定制，并通过我们的发行版合作伙伴提供支持。 

由于我们的下游供应商，我很少提交补丁到上游，但我通过配合 [Ulrich Drepper][10] （将一个小补丁提交到 glibc）和改变[时区数据库][11]的工作贡献了自己的力量（Arthur David Olson 在 NIH 的 FTP 站点维护它的时候接受了这个改变）。但我仍然没有把开源项目的正式贡献者的工作来当做我的工作的一部分。是该改变这种情况的时候了。 

在 2013 年末，我加入了 IBM 在开源社区的云组织，并正在寻找一个上游社区参与进来。我会在 Cloud Foundry 工作，还是会加入 IBM 为 OpenStack 贡献的大组中呢？都不是，因为在 2014 年 Docker 席卷了全球，IBM 要我们几个参与到这个热门的新技术。我在接下来的几个月里，经历了许多的第一次：使用 GitHub，比起只是 `git clone` [学习了关于 Git 的更多知识][12]，做过 Pull Request 的审查，用 Go 语言写代码，等等。在接下来的一年中，我在 Docker 引擎项目上成为一个维护者，为 Dockr 创造下一版的镜像规范（支持多个架构），并在一个关于容器技术的会议上出席和讲话。 

### 如今的我

一晃几年过去，我已经成为了包括 CNCF 的 [containerd][13] 项目在内的开源项目的维护者。我还创建了项目（如 [manifest-tool][14] 和 [bucketbench][15]）。我也通过 OCI 参与了开源治理，我现在是技术监督委员会的成员；而在Moby 项目，我是技术指导委员会的成员。我乐于在世界各地的会议、沙龙、IBM 内部发表关于开源的演讲。 

开源现在是我在 IBM 职业生涯的一部分。我与工程师、开发人员和行业领袖的联系可能比我在 IBM 内认识的人的联系还要多。虽然开源与专有开发团队和供应商合作伙伴有许多相同的挑战，但据我的经验，开源与全球各地的人们的关系和联系远远超过困难。随着不同的意见、观点和经验的不断优化，可以对软件和涉及的在其中的人产生一种不断学习和改进的文化。 

这个旅程 —— 从我第一次使用 Linux 到今天成为一个领袖、贡献者，和现在云原生开源世界的维护者 —— 我获得了极大的收获。我期待着与全球各地的人们长久的进行开源协作和互动。

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/2/my-open-source-story-phil-estes

作者：[Phil Estes][a]
译者：[ranchong](https://github.com/ranchong)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/estesp
[1]:https://en.wikipedia.org/wiki/Executable_and_Linkable_Format
[2]:https://en.wikipedia.org/wiki/A.out
[3]:https://opensource.com/node/19796
[4]:https://opensource.com/node/25456
[5]:https://opensource.com/node/35141
[6]:https://opensource.com/article/17/10/alpine-email-client
[7]:https://opensource.com/node/22781
[8]:https://www.linkedin.com/in/danieldfrye/
[9]:http://www-03.ibm.com/ibm/history/ibm100/us/en/icons/linux/
[10]:https://www.linkedin.com/in/ulrichdrepper/
[11]:https://en.wikipedia.org/wiki/Tz_database
[12]:https://linux.cn/article-9319-1.html
[13]:https://github.com/containerd/containerd
[14]:https://github.com/estesp/manifest-tool
[15]:https://github.com/estesp/bucketbench

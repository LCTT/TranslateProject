Linux 如何成为我的工作
======

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/linux_penguin_green.png?itok=ENdVzW22)

从很早很早以前起，我就一直使用开源软件。那个时候，没有所谓的社交媒体。没有搜狐，没有谷歌浏览器（甚至连谷歌也没有），没有亚马逊，几乎没有一个互联网。事实上，那个时候最热门的是最新的Linux 2.0内核。当时的技术挑战是什么？嗯，是 Linux 发行版本中旧的 a.out 格式被 ELF 格式代替，导致升级一些 linux 的安装可能有些棘手。
我如何将我自己对这个初出茅庐的年轻操作系统的兴趣转变为开源事业是一个有趣的故事。
###  Linux 为乐趣，而非利润 

1994 年我大学毕业时，计算机实验室是 UNIX 系统的小型网络；如果你幸运的话，他们会连接到这个叫做互联网的新东西。这难以置信，我知道！“网络”（正如我们所知道的）大多是手写的 HTML, `cgi-bin` 目录是启用动态 web 交互的一个新的平台。我们许多人对这些新技术感到兴奋，我们还自学了 shell 脚本， Per，HTML，以及所有我们在爸妈的 Windows3.1 上从没有见过的简介的 UNIX 命令。通过 `vi`，`ls`，和阅读我的邮件。

毕业后，我加入 IBM，在一个没有 UNIX 系统的 PC 操作系统上工作，不久，我的大学切断了我通往工程实验室的远程通道。我如何继续用 Pine（Pine是以显示导向为主的处理程序）读我的电子邮件？我一直听说开源 Linux，但我没有时间去研究它。

1996 年，我在德克萨斯大学奥斯丁分校开始读硕士学位。我知道这将涉及编程和写论文，不知道还有什么，但我不想使用专有的编辑器，编译器或者文字处理器。我想要的是我的 UNIX 经验! 

所以我拿了一个旧电脑，找到并下载了一个 Slackware 3.0 的 Linux 发行版本，分配磁盘后，放在了我的 IBM 办公室。可以说我在第一次安装 Linux 后就没有回过头了。在最初的那些日子里，我学习了很多关于文件和 `make` 系统，关于建设软件和补丁还有源码控制的知识。虽然我只是开始使用 Linux 来获得乐趣和个人知识，但他最终改变了我的职业生涯。

虽然我是一个愉快的 Linux 用户，但我认为开源开发任然是其他人的工作；我想到了一个神秘的 UNIX 极客的在线邮件列表。我很感激 Linux HOWTO 项目，他帮助我尝试添加软件包，升级 Linux 版本，或者安装新硬件和新 PC 的设备驱动程序。但是要处理源代码并进行修改或提交到上游… …那是给别人的，不是我。 

### Linux 如何成为我的工作 

1999 年，我终于有理由把我个人对 Linux 的兴趣与我在 IBM 的日常工作结合起来了。我带了一个研究项目接到 JVM 虚拟机的 Linux 上。为了确保我们在法律上是安全的，IBM 购买了一个压缩包，创建 Red Hat Linux 6.1 副本来完成这项工作。在 IBM 东京研究实验室工作时，写下了我们的 JVM 即时（JIT）编辑器，AIX JAV 源代码，Windows 和 OS/2 的 JVM 参考源代码，我们有一个 JVM 的 Linux 工作在几周之内，击败了 SUN’S 公司官方 java 公告的 Linux 端口好几个月。既然我在 Linux 平台上做了开发，我得在上面服务。 

到 2000 年，IBM 使用 Linux 的频率迅速增加。由于 Dan Frye 的远见和坚持，IBM 提出了“亿美元的赌注”在 Linux，在 1999 年创建 Linux 技术中心（LTC）。在 LTC 里面有内核开发者，开源贡献者，IBM 硬件设备驱动程序的编写者，以及各种各样的 Linux 开源代码的工作重点。比起剩下毫无相关的与 LTC 公司连接，我想去的是这个令人兴奋的 IBM 新天地。 

从 2003 年到 2013 年我深入参与了 IBM 的 Linux 战略和深入使用了 Linux 发行版，最终组成一个团队，成为 IBM 每个部门大约 60 个产品的信息交换所。我参与了收购，期望每个设备，管理系统和虚拟机或者基于物理设备的中间器件都能运行 Linux。我开始熟悉 Linux 发行版的建设，包括打包资源，选择上游资源，发展原有发行版的补丁集，做定制，并通过我们的合作伙伴提供支持的发行版。 

由于我们的下游供应商，我很少提交补丁到上游，但我通过配合 Ulrich Drepper （包括一个小补丁到glibc）去改变时区数据库的工作贡献自己的力量， Arthur David Olson 接受他在 NIH 的 FTP 站点的维护。但作为我工作的一部分，我还没有作为开源项目的正式贡献者工作过。是该改变这种情况的时候了。 

在 2013 年末，我在开源集团加入了 IBM 的云组织，并正在寻找一个上游社区参与进来。这将是我们在云上工作，还是我会加入 IBM 的为 OpenStack 贡献的大组？都不是，是因为在 2014 年 Docker（开源的应用容器引擎）席卷了全球，IBM 邀请我们几个参与这个热门的新技术。我在接下来的几个月里，经历了许多的第一次：使用 GitHub，比起只是 git clone 学习了更多关于 Git，有 Pull requests 的复查，在 Go 上写代码，等等。在接下来的一年中，我在 Docker 引擎项目上成为一个维修者，以创造形象规范的下一版 Docker（支持多个架构），出席和讲话在一个关于封装技术的会议上。 

### 现在我在哪里 

一晃几年过去，我已经成为了一个开源项目的维护者，包括云端原生计算基础的（集中网络控制设备）containerd（一个控制 runC 的守护进程）项目。我还创建项目（如清单工具和比较容器运行时性能）。我已经通过 OCI（为创造开放的行业标准容器格式和runtime明确目的开放的治理结构）参与开源治理。我在世界会议，Meetuo 网站群，IBM 内部有过很高兴的关于开源的演讲。 

开源现在是我在 IBM 职业生涯的一部分。我与工程师，开发人员和行业领导的联系可能比我在 IBM 内认识的人的联系还要多。虽然开源与专有开发团队和供应商合作伙伴有许多相同的挑战，但据我的经验，开源与全球各地的人们的关系和联系远远超过困难。随着不同的意见、观点和经验的不断优化，可以对软件和涉及的在其中的人产生一种不断学习和改进的文化。 

这个旅程—从我第一次使用Linux到今天成为一个指导者，贡献者，和现在云本地开源世界的维护者—我获得了极大的收获。我期待着与全球各地的人们长久的进行开源协作和互动。

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/2/my-open-source-story-phil-estes

作者：[Phil Estes][a]
译者：[译者ID](https://github.com/译者 ranchong)
校对：[校对者ID](https://github.com/校对者ID)

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
[12]:https://opensource.com/article/18/1/step-step-guide-git
[13]:https://github.com/containerd/containerd
[14]:https://github.com/estesp/manifest-tool
[15]:https://github.com/estesp/bucketbench

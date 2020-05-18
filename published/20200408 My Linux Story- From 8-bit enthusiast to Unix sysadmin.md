[#]: collector: (lujun9972)
[#]: translator: (Acceleratorrrr)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12228-1.html)
[#]: subject: (My Linux Story: From 8-bit enthusiast to Unix sysadmin)
[#]: via: (https://opensource.com/article/20/4/linux-story)
[#]: author: (James Farrell https://opensource.com/users/jamesf)

我的 Linux 故事：从 8 位发烧友到 Unix 系统管理员
======

> 我是如何从一个电脑爱好者成为职业系统管理员和 Linux 粉丝的。

![](https://img.linux.net.cn/data/attachment/album/202005/18/132731pnnzy7t5tz7hvc6z.jpg)

故事得从 1980 年中期我父母给家里购买[苹果 \]\[c][2] 开始。尽管很喜欢打游戏，但我还是很快被实用又好玩的 BASIC 编程迷住了。那个年代的人们还是把电脑当作小一点的打字机对待，所以拥有“高级电脑技能”的人可以轻松使用他们的魔法。

以用 BASIC 和点阵打印机自动生成惩罚作业来举个例子。被罚写两百遍道歉时，我问老师我可不可以用打字代替手写。经过同意后，我写了 5 行 BASIC 语句来自动生成作业。另外一个小技巧是用非可视化文本编辑器，比如用 AppleWorks 微调字体、行距和边距，把学期论文“拉长”到要求的篇幅。

对电脑的痴迷很快让我得到了带有内存驱动卡和 x86 协处理器的苹果 ][gs。那时候，调制解调器和 BBS 刚开始火起来，有了这样的双处理器系统后，我就可以安装各种琳琅满目的软件。但是由于调制解调器 2400bps 的速度限制，对我每天都要下载几 KB 的有趣东西形成了阻碍。我对苹果痴迷一段时间，不久之后就换了。

### 探索 Unix

我的本科专业是计算机信息系统，研究生专业是计算机科学。本科教育主要使用个人电脑，很少涉及大型分时系统。研究生的时候才开始真正有意思起来，拨号进入带有互联网连接的 Unix 简直打开了新世界的大门。尽管我依然用着我的双处理器 ][gs 来使用调制解调器还有写写论文，不过 Unix 系统真正吸引了我的注意力，因为它可以访问通用的 Telnet 游戏、文件传输协议（FTP）、在线邮箱和进行 C 语言编程。当时 Gopher 非常受欢迎，特别是在我们这群终端用户当中。

被分到学院计算机部门是我研究生命运的转折点，这个部门主管学校的计算机服务。学生们可以使用 X Window 终端来登录基于 [Ultrix][3] 的系统。大部分都是灰度的黑白界面，彩色处理在当时非常占用 CPU，也很影响系统性能。也有一些彩色系统还不错，但是这些机器都很慢。

我很喜欢那个时候，我有系统管理员权限而且工作是维护系统和网络。我有一些很好的导师，他们对我选择从事系统管理员而不是程序员起了关键作用（尽管我至今仍然热爱编程）。

### 从 Unix 到 Linux

稀缺是创造之母，当需要分享匮乏的学校电脑系统资源的时候，我们学生们变得富有创造力。需要用电脑的学生是 Ultrix 工作站承受量的三到五倍，所以寻找资源往往是个难题（特别是要交付项目的时候）。在不需要图形化显示的时候，我们有一个 56k 的点对点协议的调制解调器池可供远程系统访问接入。但是找到一个有空余资源的机器并共享系统进行源码编译通常会导致进度缓慢。和大部分人一样，我发现晚上工作通常会有所帮助，但我还需要其它一些东西让我的项目迭代快一点。

后来学校的一个系统管理员建议我去看一个免费提供的 Unix 系统。那就是 Linux，它被装在 3.5 英寸的软盘里。多亏我们学校超快的 T1 线路，我很容易就搜索到新闻组和其他资源来学习如何下载它。它全是基于 32 位的英特尔 PC 机的，而我并没有这一类的设备。

幸运的是，我在学校的工作让我有机会接触到堆积如山的废旧电脑，所以命运的齿轮又开始旋转起来。

我找到了足够多的废旧 PC 组装了一个可靠的 80386 PC，带有足够内存（我确定不到 1GB），它有一个能用的显卡、一个细缆（同轴）以太网卡和一个硬盘。我所用的镜像是 Linux 内核 0.98，我不记得它是不是正式发行版的一部分了（可能是 SLS）。我所记得的是，它有一系列的软盘镜像，第一张软盘启动内核和一个最小安装程序，然后格式化硬盘，接着要求插入每个后续的软盘来安装 GNU 核心实用程序。在核心实用程序装好并引导系统之后，你可以下载和安装其他的软件包镜像，比如编译器之类的。

这是我学术道路上巨大的福音。在没有运行 X Window 显示服务器的情况下，这台电脑性能比学校的 Ultrix 工作站强很多。学校允许我把这台机器连到校园网络，挂载学校的学生网络文件系统（NFS）共享，并且能直接访问互联网。因为我的研究生课程用 [GCC][5]（还有 Perl 4）来完成大部分学生作业，所以我可以在本地进行开发工作。这使得我可以独享关键资源，从而使我能够更快速地迭代我的项目。

但是，这个方案不是完美的。硬件有时会有点不稳定（这可能就是它们被丢弃的原因），但我都能搞定。真正让我感受到的是 Linux 和 Ultrix 在操作系统和系统库层面的差异。我开始理解移植软件到其他操作系统的意义，我可以自由地在任何地方开发，但是我必须以 Ultrix 编译的二进制文件交付项目。在一个平台上完美运行的 C 语言代码可能在另一个平台出错。这非常令人沮丧，但是我可能本能的察觉到了早期 Linux 解引用空指针的方法。Linux 倾向于把它作为空操作处理，但是 Ultrix 会立即触发核心转储和段错误 [SIGSEGV][6]。这是我第一次程序移植时的重大发现，正好在要交作业的几天之前。这同时对我研究 C++ 造成了一些麻烦，因为我粗心地同时使用了 `malloc()`/`free()` 和自动[构造函数和析构函数][7]处理，让我的项目到处都是空指针炸弹。

研究生课程快结束的时候，我升级到了一台性能野兽工作站：一颗英特尔 486DX2 66MHz 芯片、一块 SCSI 硬盘、一块光驱和一个 1024x768  RGB 显示器，并且还用一个 16550 UART 串口卡完美地匹配了我的新 US Robotics V.Everything 牌调制解调器。它可以双启动 Windows 和 Linux 系统，但更重要的是显卡和 CPU 的速度让我的开发环境幸福感倍增。那台旧的 386 依然在学校服役，不过我我现在大部分繁重的功课和钻研都转移到了家里。

和 [Mike Harris][8] 关于 90 年代的 Linux 故事类似，我真的对当时流行的 CD 集合很着迷。我住的附近有家新开的 Micro Center 计算机商店，这个宝库充满了电脑配件、高级专业书籍和你能想到的各种 Linux（以及免费的 Unix）CD。我还记得 [Yggdrasil][9] 和 [Slackware][10] 是我最喜欢的发行版。真正让人难以置信的是 CD 存储空间的巨大容量 —— 650MB！使它成为获得软件的必不可少的载体。是的，你可以用 56k 的速度下载，但是真的很慢。更别提大部分人负担不起存档这么多供以后使用的闲置数据。

### 而到了今天

就是这些开启了我长达 25 年的系统管理员的职业生涯和开源软件的乐趣。Linux 一直是我事业和个人开发中的重要组成部分。最近我依旧醉心于 Linux（主要是 CentOS、RedHat 和 Ubuntu)，但也经常从 [FreeBSD][11] 和其他炫酷开源软件中得到乐趣。

Linux 让我来到了 Opensource.com，我希望在这里能回馈社区，为新一代电脑爱好者出一份力。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/4/linux-story

作者：[James Farrell][a]
选题：[lujun9972][b]
译者：[Accelerator](https://github.com/Acceleratorrrr)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jamesf
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/1980s-computer-yearbook.png?itok=eGOYEKK- (Person typing on a 1980's computer)
[2]: https://en.wikipedia.org/wiki/Apple_IIc
[3]: https://en.wikipedia.org/wiki/Ultrix
[4]: https://en.wikipedia.org/wiki/Point-to-Point_Protocol
[5]: https://en.wikipedia.org/wiki/GNU_Compiler_Collection
[6]: https://en.wikipedia.org/wiki/Segmentation_fault
[7]: https://www.tutorialspoint.com/cplusplus/cpp_constructor_destructor.htm
[8]: https://linux.cn/article-11831-1.html
[9]: https://en.wikipedia.org/wiki/Yggdrasil_Linux/GNU/X
[10]: http://slackware.com
[11]: https://www.freebsd.org/

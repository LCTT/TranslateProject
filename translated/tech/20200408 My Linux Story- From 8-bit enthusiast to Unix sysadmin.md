[#]: collector: (lujun9972)
[#]: translator: (Acceleratorrrr)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (My Linux Story: From 8-bit enthusiast to Unix sysadmin)
[#]: via: (https://opensource.com/article/20/4/linux-story)
[#]: author: (James Farrell https://opensource.com/users/jamesf)

我的 Linux 故事：从8比特爱好者到 Unix 系统管理员
======
我是如何从一个电脑爱好者成为职业系统管理员和 Linux 粉丝的
![Person typing on a 1980's computer][1]

故事得从1980年中期爸妈给家里购买[苹果 \]\[c][2] 开始。尽管很喜欢打游戏，但我还是很快被实用又好玩的 BASIC 编程迷住了。那个年代的人们还是把电脑当作打字机对待，所以懂电脑的人可以轻松使用他们的魔法。

用 BASIC 和点阵打印机自动生成惩罚作业来举个例子。被罚写两百遍道歉时，我问老师我可不可以打字代替手写。经过同意后，我写了5行 BASIC 语句来自动生成作业。另外一个小技巧是用非可视化文本编辑器，比如用 AppleWorks 微调字体，行距和边距，把学期报告扩充到要求的长度。

对电脑对喜爱很快让我接触到有 RAM 驱动和 x86 协处理器的苹果 ][gs。调制解调器和网络论坛刚开始火起来，它的双核处理器系统让我可以游刃有余的选择软件。但是由于调制解调器2400比特每秒的速度限制，下载任何超过几 KB 的东西都需要一天。我玩了不久之后就腻了。

### 探索 Unix

我的本科专业是计算机信息系统，硕士专业是计算机科学。本科教育主要是学习硬件和一些分时系统。研究生的时候才开始真正有意思起来，拨号上网简直打开了新世界的大门。尽管我依然用着我的双核 ][gs 来进行调制解调还有写写作业，不过Unix 系统让我真的热爱上方便的远程登录类游戏，文件传输协议，在线邮箱和 C 语言。当时 Gopher 非常受欢迎，特别是在我们这群终端用户中。

被分到学院计算机部门是我本科命运般的转折点，这个部门主管学校的计算机服务。学生们必须要用 X 视窗终端来登陆 [Ultrix][3] 系统。大部分都是黑白界面，彩色处理在当时非常占 CPU 也很影响系统性能。也有一些做的不错的彩色系统，但是这些机器都很慢。

我很喜欢那个时候，我有系统管理员权限而且工作是维护系统和网络。有一些出色的同事教我，他们对我选择从事系统管理员而不是程序员起了关键作用（尽管我至今热爱编程）。

### 从 Unix 到 Linux

稀缺是创造之母，当需要分享匮乏的学校电脑系统资源的时候，我们经常突发奇想。需要用电脑的学生是 Ultrix 工作站承受量的四到五倍，所以很难找到资源（特别是要交项目的时候）。虽然有一堆56k点对点协议的调制解调器处理远程系统访问，而且那时还不需要图像显示。但是发现一个有空余资源的机器然后分享出来的过程依然十分缓慢。和大部分人一样，我发现晚上加班很有效率，但我需要另外一些东西让我的项目迭代快一点。

后来学校但一个系统管理员建议我了解一个免费的 Unix 系统。那就是 Linux，被装在一个 3.5 英寸的软盘里。多亏我们学校超快的 T1 载波，让我很方便的查询到这个新群体和一些下载教程。这是一个我之前不曾接触过的32位网络计算机工具。

幸运的是，我的工作让我有机会使用一些淘汰的旧电脑，所以命运的齿轮又开始旋转起来。

我用一些报废的主机组装了一个可靠的，有足够 RAM 的80386台机（我确定不到 1GB），它有一个能用的显卡，一个细缆（同轴）以太网卡和一个硬盘。镜像用的是 Linux 内核0.98，不记得它是不是正式发行版的一部分了（可能是 SLS）。可我还能记得安装的一系列过程 - 首先启动内核和安装程序，然后格式化硬盘，接着要求每一个软盘安装 GNU 工具核心。核心装好之后，系统就可以启动了，你可以下载和安装其他的镜像包，比如编译器之类的。

这是我学术道路上巨大的福利。没有了 X 视窗显示，这台电脑性能比学校的 Ultrix 工作站强很多。学校允许我把这台机器连到校园网络，连接到学生网络文件系统，并且能直接接入内网。因为我研究生时主要用 [GNU 编译器套装][5] (还有 Perl 4)写作业，所以我可以进行本地开发。我可以使用这台主机作为独占资源来让我的项目更快迭代。

但是，这个方案不是完美的。硬件有时会有点不稳定（这可能就是放弃使用它的原因），但我都能搞定。操作系统和系统自带库层面才真正让我感受到 Linux 和 Ultrix 的不同。我开始领会到移植软件到其他操作系统的意义，我可以开发任何我想要的软件，但是我必须要把项目转换成 Ultrix 编译的二进制文件来传输。在一个平台上能运行的 C 语言可能在另一个平台出错。这让我非常沮丧，但是我可能本能的察觉到了早期 Linux 废弃空指针的方法。Linux 倾向于把它作为无操作处理，但是 Ultrix 会立即触发核心转储和段错误 [SIGSEGV][6]。这是正好在要交作业的几天之前，我第一次程序移植时的重大发现。这同时对我研究 C++ 造成了一些麻烦，因为我不小心使用同时使用 malloc()/free() 和自动[构造函数和析构函数]处理项目，结果空指针被炸得到处都是。

研究生快结束的时候，我用一颗英特尔 486DX2 66赫兹芯片和一块小型计算机系统接口硬盘，一块光驱和 一个1024x768 RGB 显示器将主机升级成了性能野兽。还把一个 16550 通用异步收发器完美组合到新的 US Robotics V.Everything 牌的调制解调器上。它可以跑 Windows 和 Linux 双系统，但最重要的是显卡和 CPU 的速度让开发环境幸福感倍增。那台旧的386依然在学校服役，不过我主要的工作都转移到了家里。

和 [麦克.哈里斯的故事][8] 里关于90年代的 Linux 类似，我真的对当时流行的光驱很着迷。我住的地方附近有小型电脑器材店，这个宝库充满了电脑配件，高级专业书籍和你能想到的任何 Linux （还有免费的 Unix）CD。我还记得[Yggdrasil][9]和[Slackware][10]是我最喜欢的发行版之一。更惊人的是 CD 650MB 巨大的存储量！使它成为软件必不可少载体。是的，你可以用56k 的速度下载，但是真的很慢。更别提大部分人负担不起将这么多闲置的数据存档供以后使用。

### 直到今天

就是这些开启了我长达25年的系统管理员和开源软件粉丝生涯。Linux 是我事业和个人开发中重要的一部分。最近我依旧醉心于 Linux （主要是 CentOS, RedHat, and Ubuntu)，但也经常从[FreeBSD][11]和其他炫酷开源系统中体验乐趣。

Linux 领导了我涉足 Opensource.com，我希望能回馈社区同时为下一代电脑出一份力。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/4/linux-story

作者：[James Farrell][a]
选题：[lujun9972][b]
译者：[Accelerator](https://github.com/Acceleratorrrr)
校对：[校对者ID](https://github.com/校对者ID)

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
[8]: https://opensource.com/article/19/11/learning-linux-90s
[9]: https://en.wikipedia.org/wiki/Yggdrasil_Linux/GNU/X
[10]: http://slackware.com
[11]: https://www.freebsd.org/

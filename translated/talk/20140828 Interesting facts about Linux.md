关于Linux的趣事
================================================================================
2014年8月25日，是Linux的第23个生日。1991年8月25日，一位21岁的赫尔辛基大学的学生发布了举世闻名的[新闻组][1](Usenet post)，标志着现在世界著名的Linux正式诞生。

23年以后的现在，Linux已经无处不在，不仅仅被安装于终端用户的桌面系统，[智能手机][2]和嵌入式系统，甚至也被[龙头企业][3]用于他们的关键系统，比如[美国海军的核潜艇][4]（US Navy's nuclear submarines）和[联邦航空局的空中管制系统][5](FAA's air traffic control)。Linux进入了无处不在的云计算时代，在云计算平台方面仍然保持着它的优势。

今天，让我来告诉大家**一些你们可能不知道的Linux趣事和Linux历史**。如果有什么要补充的，请在评论中分享出来。在这篇文章里，我将会用“linux”、“kernel”和“Linux kernel”来表示同一个意思。

1.关于linux是否是一个开源的操作系统这种争论一直是无休无止的。事实上，“Linux”操作系统的核心组件参照的是Linux kernel（内核）。而反派认为Linux不是一个纯粹的操作系统，因为他们认为仅仅一个内核（kernel），并不是一个操作系统，自由软件的推崇者认为最大的操作系统应叫做“[GNU/Linux][7]”，把功劳归于应得的人。（比如：[GNU project][8]）。另一方面，一些Linux的开发者和程序员认为，Linux拥有成为一个操作系统的资格，因为它实现了[POSIX标准][9]。

2.从openhub网站的统计来看，绝大部分（95%）的Linux是用C语言写的。第二（2.8%）受欢迎的是汇编语言。毫无疑问，C语言比C++ 的更受欢迎，也表明了Linus对C++的立场。下面是Linus编程语言的分类。

![](https://farm4.staticflickr.com/3845/15025332121_055cfe3a2c_z.jpg)

3.在全世界，Linux已经被[13,036个贡献者][10]创建和修改。当然，贡献最多的还是Linus Torvalds自己。从Linux创建至今，他提交了20,000次以上的代码。下图显示了总提交次数最多的前十位Linux贡献者。

![](https://farm4.staticflickr.com/3837/14841786838_7a50625f9d_b.jpg) 

4.Linux的代码行（SLOC）超过了1700万行。估计整个代码库的花费大概是5,526人年，或者是超过300M（1M=10*1000万亿）美元，[基于模型的基本估算法][11]（basic COCOMO model）。

5.企业并不是单纯的Linux消费者。他们的员工也在[积极参与][12]Linux的开发。下图显示了参与Linux内核开发的企业员工2013年提交次数总和的前十位。他们包括Linux商业版发行者(Red Hat,SUSE),芯片/嵌入式系统制造商（Intel，Texas Instrument，wolfson），非盈利性组织（Linaro）和其它的IT公司（IBM，Samsung，Google）。

![](https://farm6.staticflickr.com/5573/14841856427_a5a1828245_o.png)

6.Linux的官方吉祥物是一个非常可爱的小企鹅“Tux”。[第一次提出][13]并决定用小企鹅作为Linux吉祥物/标志这个想法的是Linus自己。为什么是小企鹅呢？因为Linus本人很喜欢企鹅，尽管他曾经被一只凶猛的企鹅咬伤过，还导致他得了一场病。

7.一个Linux“发行版”包括Linux内核、支持GUN的组件和库、和一些第三方的应用。根据[distrowatch网站][14]的报告，现在总共有286个活跃的Linux发行版。其中最老的一个版本叫[Slackware][15],它是从1993年正式发布出来的一个可用的版本。

8.Kernel.org是一个Linux源码的主要仓库，曾经在2011年8月被一个匿名的攻击者[攻陷][16],攻击者打算篡改kernel.org的服务器。为了加强Linux内核访问策略的安全性，Linux基金会最近在Linux内核的Git官方托管的仓库上[开启了][17]双重认证。

9.Linux在500强超级计算机中的优势还在[增加][18]。截至2014年6月，世界范围内运算速度最快的计算机97%都是运行在Linux上面的。

10.太空监视（spacewatch），是亚利桑那大学月球与行星实验室的一个研究项目，在GNU/Linux和它的创造者们出现之后，用他们名字命名了几颗小行星（[小行星9793 Torvalds][19],[小行星9882 Stallman][20]，[小行星9885 Linux][21]，[小行星9965 GUN][22]），以表彰他们把开源操作系统用于他们的小行星调查活动。

11.纵观Linux内核发展的近代史，版本从2.6到3.0有一个很大的跳跃。这个[重编的版本号3][23]实际上并不是意味着Linux内核有什么重大的构建，但却标志着Linux 20周年的一个里程碑。

12.在2000年的时候，乔帮主还在苹果。他当时就[尝试雇佣][24]Linus Torvalds，让他放弃Linux的开发，转而为“Unix最大的用户群工作”，这个项目后面发展成了MAC OS X。当时，Linus拒绝了乔帮主的邀请。

13.Linux 内核的重启函数[reboot()][25]需要两个神奇的数字，而这第二个数字来自Linus Torvalds和他3个女儿的出生日期。

14.虽然全世界都有Linux的很多粉丝，但是也仍然存在很多对Linux的批评（主要是针对桌面系统），如缺乏硬件支持，缺乏标准化，由于很短的升级和发布周期导致系统的不稳定等等。2014年Linux内核小组在LinuxCon大会上，当Linus被问及Linux的未来将何去何从，他表示“I still want the desktop”(我仍然希望桌面化)。

如果你还知道一些关于Linux的趣事，请在评论中与我们分享。

--------------------------------------------------------------------------------

via: http://xmodulo.com/2014/08/interesting-facts-linux.html

作者：[Dan Nanni][a]
译者：[barney-ro](https://github.com/barney-ro)
校对：[Caroline](https://github.com/carolinewuyan)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://xmodulo.com/author/nanni
[1]:https://groups.google.com/forum/message/raw?msg=comp.os.minix/dlNtH7RRrGA/SwRavCzVE7gJ
[2]:http://developer.android.com/about/index.html
[3]:http://fortune.com/2013/05/06/how-linux-conquered-the-fortune-500/
[4]:http://www.linuxjournal.com/article/7789
[5]:http://fcw.com/Articles/2006/05/01/FAA-manages-air-traffic-with-Linux.aspx
[6]:http://thecloudmarket.com/stats
[7]:http://www.gnu.org/gnu/why-gnu-linux.html
[8]:http://www.gnu.org/gnu/gnu-history.html
[9]:http://en.wikipedia.org/wiki/POSIX
[10]:https://www.openhub.net/p/linux/contributors/summary
[11]:https://www.openhub.net/p/linux/estimated_cost
[12]:http://www.linuxfoundation.org/publications/linux-foundation/who-writes-linux-2013
[13]:http://www.sjbaker.org/wiki/index.php?title=The_History_of_Tux_the_Linux_Penguin
[14]:http://distrowatch.com/search.php?ostype=All&category=All&origin=All&basedon=All&notbasedon=None&desktop=All&architecture=All&status=Active
[15]:http://www.slackware.com/info/
[16]:http://pastebin.com/BKcmMd47
[17]:http://www.linux.com/news/featured-blogs/203-konstantin-ryabitsev/784544-linux-kernel-git-repositories-add-2-factor-authentication
[18]:http://www.top500.org/statistics/details/osfam/1
[19]:http://ssd.jpl.nasa.gov/sbdb.cgi?sstr=9793
[20]:http://ssd.jpl.nasa.gov/sbdb.cgi?sstr=9882
[21]:http://ssd.jpl.nasa.gov/sbdb.cgi?sstr=9885
[22]:http://ssd.jpl.nasa.gov/sbdb.cgi?sstr=9965
[23]:https://lkml.org/lkml/2011/5/29/204
[24]:http://www.wired.com/2012/03/mr-linux/2/
[25]:http://lxr.free-electrons.com/source/kernel/reboot.c#L199
[26]:http://www.nndb.com/people/444/000022378/
[27]:http://linuxfonts.narod.ru/why.linux.is.not.ready.for.the.desktop.current.html
[28]:https://www.youtube.com/watch?v=8myENKt8bD0

Systemd这个有争议的项目正在接管你身边的Linux发行版
=========
![](http://core4.staticworld.net/images/article/2014/10/linux-attack-100528169-gallery.jpg)

Systemd 是目前为止在Linux平台上最有争议的项目之一。它到底有多大的争议？它的争议大到systemd的开发者之一Lennart Poettering 声称有人使用[比特币][2]雇佣职业杀手要干掉他。但是还是有比较理智的做法的，有一个[抵制systemd网站][3]在技术角度上提出了抵制systemd的原因。

如此强烈的抵制也反映了systemd的成功。它已经被或将要被Fedroa、OpenSUSE、Ubuntu、Debian、Arch Linux等众多发行版采用。随着时间推移，GNOME越来越依赖它，Debian[回归GNOME][4]的原因之一就是它采用了systemd。systemd无处不在！

那么如此激烈的争论到底是关于什么呢？让我们近距离观察这场战争。

###Systemd是一个全新的init

[Systemd][5]的核心是取代老旧的[SysV init][6]。init用来初始化你的操作系统，当你启动系统时，init负责加载需要的驱动，激活你的网络链接，启动众多的系统服务，最后进入图形登陆界面。而SysV init 是一个老旧的系统，它基本上仅运行**/etc/init.d**目录下的一些脚本。

Systemd是一个现代技术，用以取代老旧以及粗糙的SysV init。它可以在接收到事件响应时启动相关服务；比如，当你接入了一个USB打印机，systemd可以在接收到设备接入响应时启动打印服务。当它接收到某个网络端口的连接请求时，它可以启动在此端口上监听的服务并且传递这个连接。

获取更多关于SysV init 与 systemd的信息，可以参考Jorgen Schäfer的 “[Why systemd?][9]”

###但是systemd远不止此###

systemd的反对者之中也有部分人认为SysV太老了，应该被取代掉。但是批评systemd的人发现Systemd是一个巨大的项目，其中包括了很多其他的功能。它是一个软件套件，而不仅仅是一个init。

![An illustration of systemd's structure.](https://cms-images.idgesg.net/images/article/2014/10/systemd-diagram-100528171-orig.png)

*[维基共享资源][10] systemd 结构图解*

Systemd包括用于管理用户登陆的守护进程logind，还包括journald，并且journald 颇有争议的使用了二进制形式保存系统日志而不是以文本形式。systemd也采用了[udev][11]的思想及代码，它对**/dev/**目录下的虚拟设备文件进行管理，并且处理设备接入或推出时所产生的事件。除了这些还有很多其他的，如：systemd还包括了[cron][12]风格的任务调度器与网络守护进程networkd等等。

###抨击者认为systemd不是类UNIX风格

多数的抱怨源于人们认为systemd项目太大以至于超出了它的工作范围，并且它从Linux系统接管的部分太多了。不要感到惊奇，systemd的抵制活动是以下面的抱怨开始的：

>"systemd文件是一大堆的复杂的高度耦合的二进制组成的，这违反了UNIX哲学：‘做一件事情，并把它做好’。它超出了一个init程序的职责范围，因为它还有电源管理，设备管理，挂载管理，cron（定时执行工具），磁盘加密，socket接口/inetd，syslog，网络配置，登陆/会话管理，文件预读，GPT分区发现，容器注册，hostname/locale/time管理，mDNS/DNS-SD等功能，它将Linux控制台以及其他的一些功能都包装在一个程序里面。

##那么，systemd是好是坏？

到这里，我判断一下，到底谁是正确的。

![](https://cms-images.idgesg.net/images/article/2013/09/linux-penguin-100055693-medium.png)

systemd最初的想法是非常好的。Linux需要一个新的东西来替换老的 SysV init 和沉重的 SysV init 脚本，这个新的程序应该是灵活的，现代化的系统守护进程，它可以响应更多类型，并且智能化的管理众多的守护进程。然而，事实上systemd好像成为了**一个仅依赖Linux核心的完全统一的系统层**。

*但是*，尽管Linux是一个社区开发项目，但它不是为PC世界的专栏作家或者是一群网络评论者提供的，这些人都不能决定它的进化与发展。只有那些亲手贡献代码以及全身心投入的人才有这个资格。巧的是，Linux发行版以及那些参与者好像大部分都倾向与systemd。

>'我对于systemd本身并没有很强烈的个人看法。我与核心开发人员争论过它的bug与兼容性，并且我认为它的一些设计是愚蠢的（比如二进制的日志），但这只是细节，不是大问题。

如果 Linux Torvald 对于systemd的设计没有什么反对意见，那么说明它可能还是不错的。如果你想平静的看下为什么Linux发行版要使用systemd的话，我推荐这篇文章，[Debian's systemd discussion document][13]。

你是如何看systemd的，可以在评论回复！但是请文明讨论。

*更新这篇文章以澄清之前的错误的消息，ubuntu 桌面版将在下一个版本中纳入systemd。之前我们错误的认为ubuntu已经使用了systemd*。

-------------------------------------------------------------------------------

via: http://www.pcworld.com/article/2841873/meet-systemd-the-controversial-project-taking-over-a-linux-distro-near-you.html

作者：[Chris Hoffman][a]
译者：[SPccman](https://github.com/SPccman)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.pcworld.com/article/2841873/meet-systemd-the-controversial-project-taking-over-a-linux-distro-near-you.html#chrishoffman
[1]:https://plus.google.com/app/basic/stream/z13rdjryqyn1xlt3522sxpugoz3gujbhh04
[2]:http://www.pcworld.com/article/2033715/7-things-you-need-to-know-about-bitcoin.html
[3]:http://boycottsystemd.org/
[4]:http://www.pcworld.com/article/2691192/how-gnome-3-14-is-winning-back-disillusioned-linux-users.html
[5]:http://www.freedesktop.org/wiki/Software/systemd/
[6]:http://en.wikipedia.org/wiki/Init#SysV-style
[7]:http://www.pcworld.com/column/world-beyond-windows/
[8]:http://www.pcworld.com/blog/world-beyond-windows/index.rss
[9]:http://blog.jorgenschaefer.de/2014/07/why-systemd.html
[10]:http://en.wikipedia.org/wiki/File:Systemd_components.svg
[11]:http://en.wikipedia.org/wiki/Udev
[12]:http://en.wikipedia.org/wiki/Cron
[13]:http://www.markshuttleworth.com/archives/1295
[14]:http://www.pcworld.com/article/2836984/why-ubuntu-1410-utopic-unicorns-humble-changes-are-the-calm-before-the-storm.html
[15]:http://www.maximumpc.com/article/news/linus_torvalds_tosses_f-bombs_middle_fingers_and_general_disdain_nvidia
[16]:http://www.zdnet.com/linus-torvalds-and-others-on-linuxs-systemd-7000033847/
[17]:https://wiki.debian.org/Debate/initsystem/systemd

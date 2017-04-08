# OpenSUSE Leap 42.2 Gnome - 好些了但是还不是那么好

更新: 2017 年二月六号

是时候再给 Leap 一个机会了。让我再罗嗦一下。给 Leap 一次机会吧。是的。几周之前，我回顾了最新的 [openSUSE][1] 发行版的 Plasma 版本，虽然它火力全开，就像经典的帝国冲锋队（注：帝国冲锋队是科幻电影《星球大战》系列中，隶属反派政权银河帝国下的军事部队），但是多部分攻击没有命中要害。这是一个相对普通的，传递一切，但是缺少精华的发行版。

我现在将做一个 Gnome 的实验。为这个发行版搭载一个全新的桌面环境，同时观察它的表现。我们最近在 CentOS 上做了一些类似的事情，但是得到了相当惊讶的结果。我们可能受幸运之神祝福。现在开始动手。

 ![Teaser](http://www.dedoimedo.com/images/computers-years/2016-2/opensuse-gnome-teaser.jpg) 

### 安装 Gnome 桌面

你可以通过使用 YaST > Software Management 中的 Patterns 标签来安装新的桌面环境。特别的，你可以安装 Gnome, Xfce, LXQt, MATE 以及其他桌面环境。一个非常简单的过程需要大概 900M 的磁盘空间。没有错误，没有警告。

 ![Patterns, Gnome](http://www.dedoimedo.com/images/computers-years/2016-2/opensuse-gnome-patterns.png) 

### Gnome 的美化工作

我花费了较短时间来征服 openSUSE。鉴于我拥有大量的在 [Fedora 24][2] 上做相同工作，如[拉皮条(原文：pimping)][3]，的经验，所以这个过程是相当快和简单的。首先，获得一些 Gnome [扩展][4]。静待 20 分钟，搅拌并服务于粘土碗（原文：Stir and serve in clay bowls）。

对于餐后甜点，开启 Gnome Tweak Tool ，然后添加一些窗口按钮。最重要的，安装最最重要的，救命的插件 - [Dash to Dock][5]。因为之后你终于可以想人类一样工作，而没有使人恼火的的低效率活动。消化，调整一些新的图标。这个工作最终耗时 42 分 12 秒。明白了吗？42.2 分钟。天啊。

 ![Gnome 1](http://www.dedoimedo.com/images/computers-years/2016-2/opensuse-gnome-1.jpg) 

 ![Gnome 2](http://www.dedoimedo.com/images/computers-years/2016-2/opensuse-gnome-2.jpg) 

### 别的定制和增强

我实际上在 Gnome 中使用 Breeze 窗口装饰，而且工作地挺好。这比你尝试去个性化 Plasma 要好的多。看了一眼后流泪了，因为这个界面看起来太可怕了。

 ![Gnome 3](http://www.dedoimedo.com/images/computers-years/2016-2/opensuse-gnome-3.jpg) 

 ![Gnome 4](http://www.dedoimedo.com/images/computers-years/2016-2/opensuse-gnome-4.jpg) 

### 智能手机支持

比 Plasma 好太多了 - [iPhone][7] 和 [Ubuntu Phone][8] 都可以正常的识别和挂载。这个提醒了所有 CentOS 7.2 的 [KDE][9] 和 [Gnome][10] 行为的差异和不一致。所以这个肯定跨越了特殊平台的界限。桌面环境有这个通病。

 ![Ubuntu Phone](http://www.dedoimedo.com/images/computers-years/2016-2/opensuse-gnome-ubuntu-phone.jpg) 

一个显著的 bug 是你需要时常清理图标的缓存，否则你会在文件管理器里面看到老的图标。关于这个问题，我很快会有一整个文章来说明。

### 多媒体

不幸的是，Gnome 出现了和 Plasma 相同的问题。缺少依赖。没有 H.264 编码，意味着你不可以看99%你需要的东西。这就像是，一个月没有网。

 ![Failed codecs setup](http://www.dedoimedo.com/images/computers-years/2016-2/opensuse-gnome-failed-codecs.png) 

### 资源利用

Gnome 版本比 Plasma 更快，即使合成器（原文：Compositor）关掉，可以忽略 KWin 崩溃以及反应迟缓。CPU 的利用率在 2-3%，内存使用率徘徊在 900M。我觉得应该处于中游。

 ![Resources](http://www.dedoimedo.com/images/computers-years/2016-2/opensuse-gnome-resources.jpg) 

### 电池消耗

实际上 Gnome 的电池损耗比 Plasma 严重。不确定为什么。但是即使屏幕亮度调到 50%，Leap Gnome 只能给我的 G50 续航大约 2.5 小时。我没有深究电池消耗在什么地方，但是它却确实消耗很快。

 ![Battery usage](http://www.dedoimedo.com/images/computers-years/2016-2/opensuse-gnome-battery.jpg) 

### 奇怪的问题

Gnome 也有一些小毛病和错误。比如说，桌面不停地请求无线网络的密码，可能是我的 Gnome 没有很好地处理 KWallet 或者别的什么。同时，在我注销 Plasma 会话之后，KWi仍然在运行，消耗了100% 的 CPU 直到我杀死这个进行。真是一件丢人的事。

 ![KWin leftover](http://www.dedoimedo.com/images/computers-years/2016-2/opensuse-gnome-kwin-leftover.jpg) 

### 硬件支持

暂停并恢复，一切顺利。我至今没有在 Gnome 版本中体验断网。webcam 同样工作。总之，硬件支持貌似相当好。蓝牙也正常工作。哇！可能是我们在网络下标注它。（原文：To wit）

 ![Webcam](http://www.dedoimedo.com/images/computers-years/2016-2/opensuse-gnome-webcam.jpg) 

 ![Bluetooth works](http://www.dedoimedo.com/images/computers-years/2016-2/opensuse-gnome-bt-works.png) 

### 网络

利用 Samba 打印？你有相同的，差劲的小应用程序，就像在 [Yakkety Yak][11]，它把视野全弄乱了。但是之后，它说没有打印共享，请检查防火墙。无论如何，这部在是 1999 年了。能够打印不再是一项特权，而是一个基本人的权利。人类在这上面已经举行变革。但是，我没有在这个上面进行截图。太糟了。

### 剩下的呢?

总而言之，这是一个标准的 Gnome 桌面，带有它的一点点智力上的挑战的方式去计算和人类工程学，也可以通过扩展的严密使用来驯服。它比 Plasma 更友好一些，你可以在大多数日常的工作中，得到更好的结果。之后，你就会被选项的缺少困住，但是这些选项在 Plasma 中压倒性地多。但是你要记住，你的桌面不再每分钟都反应迟缓，这确实是个奖励。

### 结论

OpenSUSE Leap 42.2 Gnome 是一个比 Plasma 部分更好的产品，而且没有错误。它更稳定，更快，更加优雅，更加容易定制，而且那些关键的日常功能都确定工作。例如，如果你倾向于不用防火墙，你可以打印到 Samba，在不失去时间戳的情况下拷贝文件到 Samba 服务器，使用蓝牙，使用你的 Ubuntu 手机，而且这些都不会出现很严重结果的崩溃。整个栈是非常有特色，并且更好地被支持。

然而，Leap 仍然是一个合理的发行版。它在一些其他发行版处理地优秀和高雅的核心地域挣扎，而且比较差的 QA，直接导致了许多大而显著的问题。至少，质量的缺失已经成为过去这些年 openSUSE 几乎不变的元素。现在或者将来，你会得到一个相当好的幼体。但是它们中大多很普通。这就是大概最能定义 openSUSE Leap 的词，普通。你应该自己去尝试和观察。你很有可能不会惊讶。这个羞愧的事情，因为对我来说，SUSE 有一个充满乐趣的地方，并且现在它倔强地拒绝重新点燃爱火。

干杯。

--------------------------------------------------------------------------------

作者简介：

我是 Igor Ljubuncic。现在大约 38 岁，已婚但还没有孩子。我现在在一个大胆创新的云科技公司做首席工程师。直到大约 2015 年初，我还在一个全世界最大的 IT 公司之一中做系统架构工程师，和一个工程计算团队开发新的基于 Linux 的解决方案，优化内核以及攻克 Linux 的问题。在那之前，我是一个为高性能计算环境设计创新解决方案的团队的技术领导。还有一些其他花哨的头衔，包括系统专家、系统程序员等等。所有这些都曾是我的爱好，但从 2008 年开始成为了我的有偿的工作。还有什么比这更令人满意的呢？

从 2004 年到 2008 年间，我曾通过作为医学影像行业的物理学家来糊口。我的工作专长集中在解决问题和算法开发。为此，我广泛地使用了Matlab，主要用于信号和图像处理。另外，我得到了几个主要的工程方法学的认证，包括 MEDIC 六西格玛绿带、试验设计以及统计工程学。

我也写过书，包括《Linux 上的高幻想和技术工作》和《相互包容》。

请参阅我的完整开源项目，出版物和专利列表，只需向下滚动。

有关我的奖项、提名和 IT 相关认证的完整列表，请进行跳转。

-------------


via: http://www.dedoimedo.com/computers/opensuse-42-2-gnome.html

作者：[Igor Ljubuncic][a]
译者：[mudongliang](https://github.com/mudongliang)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.dedoimedo.com/faq.html

[1]:http://www.dedoimedo.com/computers/opensuse-42-2.html
[2]:http://www.dedoimedo.com/computers/fedora-24-gnome.html
[3]:http://www.dedoimedo.com/computers/fedora-24-pimp.html
[4]:http://www.dedoimedo.com/computers/fedora-23-extensions.html
[5]:http://www.dedoimedo.com/computers/gnome-3-dash.html
[6]:http://www.dedoimedo.com/computers/fedora-24-pimp-more.html
[7]:http://www.dedoimedo.com/computers/iphone-6-after-six-months.html
[8]:http://www.dedoimedo.com/computers/ubuntu-phone-sep-2016.html
[9]:http://www.dedoimedo.com/computers/lenovo-g50-centos-kde.html
[10]:http://www.dedoimedo.com/computers/lenovo-g50-centos-gnome.html
[11]:http://www.dedoimedo.com/computers/ubuntu-yakkety-yak.html

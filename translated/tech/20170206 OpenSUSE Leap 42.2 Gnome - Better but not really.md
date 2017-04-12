OpenSUSE Leap 42.2 Gnome - 好一些但还不够
==============

是时候再给 Leap 一个机会了。让我再罗嗦一下。给 Leap 一次机会吧。是的。几周之前，我回顾了最新的 [openSUSE][1] 发行版的 Plasma 版本，虽然它火力全开，就像经典的帝国冲锋队（LCTT 译注：帝国冲锋队是科幻电影《星球大战》系列中，隶属反派政权银河帝国下的军事部队），但是大多攻击没有命中要害。这是一个相对普通的，该有的都有，但是缺少精华的发行版。

我现在将做一个 Gnome 的实验。为这个发行版搭载一个全新的桌面环境，看看它怎么样。我们最近在 CentOS 上做了一些类似的事情，但是得到了出乎预料的结果。愿幸运之神庇佑我们。现在开始动手。

![Teaser](http://www.dedoimedo.com/images/computers-years/2016-2/opensuse-gnome-teaser.jpg) 

### 安装 Gnome 桌面

你可以通过使用 YaST > Software Management 中的 Patterns 标签来安装新的桌面环境。可以安装 Gnome、 Xfce、 LXQt、 MATE 以及其它桌面环境。这是一个非常简单的过程，需要大概 900M 的磁盘空间。没有遇到错误，也没有警告。

![Patterns, Gnome](http://www.dedoimedo.com/images/computers-years/2016-2/opensuse-gnome-patterns.png) 

#### Gnome 的美化工作

我花费了一点时间来征服 openSUSE。鉴于我在 [Fedora 24][2] 上拥有大量做相同工作的经验，[只需要一点点时间][3]，这个过程相当快而简单。首先，获得一些 Gnome [扩展][4]。“慢品一刻，碗筷轻碰”。

对于“餐后甜点”，你可以开启 Gnome Tweak Tool，然后添加一些窗口按钮。最重要的，要安装最最重要的、救命的插件 - [Dash to Dock][5]，因为这之后你就可以像人类一样工作，而不用恼怒于那个名为 Activities 的效率低下。“饭后消食”，就是调整一些新的图标，这简直易如反掌。这个工作最终耗时 42 分 12 秒。明白了吗？42.2 分钟。天啊！这是巧合吗！

![Gnome 1](http://www.dedoimedo.com/images/computers-years/2016-2/opensuse-gnome-1.jpg) 

![Gnome 2](http://www.dedoimedo.com/images/computers-years/2016-2/opensuse-gnome-2.jpg) 

#### 别的定制和增强

我实际上在 Gnome 中使用了 Breeze 窗口装饰，而且工作地挺好。这比你尝试去个性化 Plasma 要好的多。看哭了，这个界面看起来如此阴暗而压抑。

![Gnome 3](http://www.dedoimedo.com/images/computers-years/2016-2/opensuse-gnome-3.jpg) 

![Gnome 4](http://www.dedoimedo.com/images/computers-years/2016-2/opensuse-gnome-4.jpg) 

#### 智能手机支持

比 Plasma 好太多了 - [iPhone][7] 和 [Ubuntu Phone][8] 都可以正常的识别和挂载。这个提醒了我 CentOS 7.2 的 [KDE][9] 和 [Gnome][10] 的行为也是差异而不一致的，所以这肯定跨越了特定平台的界限。桌面环境有这个通病。

![Ubuntu Phone](http://www.dedoimedo.com/images/computers-years/2016-2/opensuse-gnome-ubuntu-phone.jpg) 

一个显著的 bug 是你需要时常清理图标的缓存，否则你会在文件管理器里面看到老的图标。关于这个问题，我很快会有一篇文章来说明。

#### 多媒体

不幸的是，Gnome 出现了和 Plasma 相同的问题。缺少依赖软件包。没有 H.264 编码，意味着你不可以看 99% 你需要看的东西。这就像是，一个月没有网。

![Failed codecs setup](http://www.dedoimedo.com/images/computers-years/2016-2/opensuse-gnome-failed-codecs.png) 

#### 资源利用

Gnome 版本比 Plasma 更快，即使关掉窗口合成器，也忽略 KWin 崩溃以及反应迟缓也是这样。CPU 的利用率在 2-3%，内存使用率徘徊在 900M。我觉得我的配置应该处于中等水平。

![Resources](http://www.dedoimedo.com/images/computers-years/2016-2/opensuse-gnome-resources.jpg) 

#### 电池消耗

实际上 Gnome 的电池损耗比 Plasma 严重。我不确定是为什么。但是即使屏幕亮度调低到 50%，Leap Gnome 只能让我的 G50 续航大约 2.5 小时。我没有深究电池消耗在什么地方，但是它确实消耗得很快。

![Battery usage](http://www.dedoimedo.com/images/computers-years/2016-2/opensuse-gnome-battery.jpg) 

#### 奇怪的问题

Gnome 也有一些小毛病和错误。比如说，桌面不停地请求无线网络的密码，可能是我的 Gnome 没有很好地处理 KWallet 或者别的什么。此外，在我注销 Plasma 会话之后，KWin 进程仍然在运行，消耗了 100% 的 CPU 直到我杀死这个进程。当然，这不是 Gnome 的锅，真是一件丢人的事。

![KWin leftover](http://www.dedoimedo.com/images/computers-years/2016-2/opensuse-gnome-kwin-leftover.jpg) 

#### 硬件支持

挂起和恢复，一切顺利。我至今没有在 Gnome 版本中体验过断网。网络摄像头同样工作。总之，硬件支持貌似相当好。蓝牙也正常工作。也许我们应该标注它是联网的。机智~

![Webcam](http://www.dedoimedo.com/images/computers-years/2016-2/opensuse-gnome-webcam.jpg) 

![Bluetooth works](http://www.dedoimedo.com/images/computers-years/2016-2/opensuse-gnome-bt-works.png) 

#### 网络

利用 Samba 打印？你有就像在 [Yakkety Yak][11]中一样差劲的小应用程序，它把桌面全弄乱了。但是之后，它说没有打印共享，请检查防火墙！无论如何，这不在是 1999 年了。能够打印不再是一项特权，而是一项人的基本权利，这方面人类不需要变革了。但是，我没有在这个上面进行截图。太糟了，哎。

#### 剩下的呢?

总而言之，这是一个标准的 Gnome 桌面，需要稍微动点脑子才能搞定和高效一些，安装一些扩展可以把它弄得服服帖帖。它比 Plasma 更友好一些，你可以用在大多数日常的工作中，整体来说你可以得到更好的体验。然后你会发现它的选项要比 Plasma 少得多。但是你要记住，你的桌面不再每分钟都反应迟缓，这确实是最棒的。

### 结论

OpenSUSE Leap 42.2 Gnome 是一个比 Plasma 各方面要更好的产品，而且没有错误。它更稳定，更快，更加优雅，更加容易定制，而且那些关键的日常功能都肯定可以工作。例如，你可以打印到 Samba，如果你不用防火墙，拷贝文件到 Samba 服务器不会丢掉时间戳。使用蓝牙、使用你的 Ubuntu 手机，这些都不会出现很严重的崩溃。整个这一套是功能完善、并且支持良好的。

然而，Leap 仍然是一个不错的发行版。它在一些其他发行版的核心区域可以表现得优秀而高雅，但是由于糟糕的 QA，直接导致了许多重大明显的问题。至少，质量的缺失已经成为过去这些年 openSUSE 几乎不变的元素。现在或者将来，你会得到一个还不错的早期产品。但是它们中大多都很普通。这就是大概最能定义 openSUSE Leap 的词，普通。你应该自己去尝试和观察，你很有可能不会惊讶。这结果太丢人了，因为对我来说，SUSE 有一些亮点，但是不能让我爱上它。给个 6 分吧，简直是浪费情绪。

再见了您呐。

--------------------------------------------------------------------------------

作者简介：

我是 Igor Ljubuncic。现在大约 38 岁，已婚但还没有孩子。我现在在一个大胆创新的云科技公司做首席工程师。直到大约 2015 年初，我还在一个全世界最大的 IT 公司之一中做系统架构工程师，和一个工程计算团队开发新的基于 Linux 的解决方案，优化内核以及攻克 Linux 的问题。在那之前，我是一个为高性能计算环境设计创新解决方案的团队的技术领导。还有一些其他花哨的头衔，包括系统专家、系统程序员等等。所有这些都曾是我的爱好，但从 2008 年开始成为了我的付费工作。还有什么比这更令人满意的呢？

从 2004 年到 2008 年间，我曾通过作为医学影像行业的物理学家来糊口。我的工作专长集中在解决问题和算法开发。为此，我广泛地使用了 Matlab，主要用于信号和图像处理。另外，我得到了几个主要的工程方法学的认证，包括 MEDIC 六西格玛绿带、试验设计以及统计工程学。


-------------


via: http://www.dedoimedo.com/computers/opensuse-42-2-gnome.html

作者：[Igor Ljubuncic][a]
译者：[mudongliang](https://github.com/mudongliang)
校对：[wxy](https://github.com/wxy)

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

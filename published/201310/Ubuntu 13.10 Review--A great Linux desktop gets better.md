Ubuntu 13.10评论：日趋完善，一个伟大的Linux桌面系统
=============================================

**摘要：Ubuntu 13.10也许并不是最激动人心的桌面Linux，但它却非常可靠，拥有许多有用的新特性。**

许多桌面发烧友至今仍然对Ubuntu转用Unity耿耿于怀，另外有些人不喜欢[Ubuntu][2]的母公司[Canonical][1]一意孤行，用Mir代替更主流的Wayland，还有些人不喜欢Ubuntu将本地搜索与Web搜索合并在一起。我想说，那又怎样！

![](http://cdn-static.zdnet.com/i/r/story/70/00/021825/ubuntu-1310-saucy-salamander-620x349.jpg)
*Ubuntu 13.10即将发布，本文只是预热。*

让我来告诉你们，什么是事实！回首2011年4月，Ubuntu的创始人Mark Shuttleworth曾经说过，Ubuntu新的发展方向是，“为普通消费者带来[快乐、自由、创新、性能和安全，而这些正是Linux平台中一直所缺少的东西][3]”。如今，他做到了！

Ubuntu 13.10，代号“俏皮的蝾螈(Saucy Salamander)”，已经进入发布前的最后阶段。的确，Ubuntu也许不是那些每天热衷于编译内核代码的Linux专家们所喜爱的桌面Linux，因为它本就不是为那些人准备的。

Ubuntu是一个所有人，甚至[包括我那81岁的老岳母][3-1]，都能使用的Linux桌面操作系统。基于这个角度，Ubuntu已经成功了，而下周最终发布的新版本，对于那些仅仅只是想学习使用一台电脑的新人来说，其意义绝不亚于一场胜利。

为了目睹新版的Ubuntu是如何做到这一点的，我在两套系统上分别安装运行了beta版和RC版。第一套测试环境是我2007年产的Dell Inspiron 530S，搭载2.2GHz Intel奔腾 E2200双核处理器、4G内存、500GSATA串口硬盘，集成Intel 3100GMA显示芯片组。第二套测试环境是2008年入手的Gateway DX4710，搭载2.5GHz Intel酷睿2四核处理器，6G内存，1T串口硬盘，同样集成了Intel GMA 3100显卡。

安装过程小菜一碟。首先说明一下，我并没有尝试在有Windows 8 Secure Boot锁定的系统上安装Ubuntu，如果你想尝试的话，这里有[如何安装Ubuntu与Win8双系统的教程][4]，如果是其他使用统一可扩展固件接口(Unified Extensible Firmware Interface - UEFI)的系统，也可以看下这个教程。

安装过程中有个不错的新功能，就是安装的同时你可以登录或创建一个免费[Ubuntu One][5]的云端服务账户。Ubuntu One是一款类似Dropbox的存储服务，提供5G免费空间，[商业版费用为39.95美刀][6]，提供20G空间和音乐流媒体支持。该服务除了完美集成在Ubuntu系统中，你也可以在Windows、Mac OS、Android和IOS系统中使用它。

首先，安装完成后，我注意到的第一件事是，在我这两台老电脑上，Ubuntu 13.10运行非常流畅，就像在顶级配置的电脑上运行一样。（译者表示，这样的配置竟然还叫老电脑，让译者的1G内存情何以堪，你们有考虑过老闪龙的感受吗！）如果你的机子比我的还老，跑Windows 7以上的系统都嫌慢，并且比较在意即将结束的XP官方支持，可以考虑一下Ubuntu，或者其他易于上手的Linux发行版，比如Mint。

再来看看核心部分。首先，“俏皮的蝾螈”运行[Linux 3.11 内核][7]。

在此基础上，再看看显示引擎，本来大家预测的是Mir，但是PC上的Mir暂时还没有准备好迎来它的黄金时期。内有Ubuntu家族中诸如[Kubuntu][8]的反对，[外有Intel的抵制][9]，Mir需要同时面对“内忧外患”。

最后的结果就是13.10将仍然默认使用老旧的Xorg-server 1.4.3。如果你富有冒险精神，可以选择尝试一下Mir。如果你想要在智能手机上运行Ubuntu，也就是传说中的[Ubuntu Touch，恰好，你就可以用到Mir][10]。

如果你是一个开发者，这是个大问题。但如果只是普通用户，你根本不必在意。例如，Valve公司基于Ubuntu的Steam系统上线后，Ubuntu仍将是最棒的Linux游戏平台。

在图形架构之上，Ubuntu搭载的是基于Unity 7接口的GNOME 3.8。最新的[Unity 8][11]强调使用屏幕边缘来控制计算机设备，但Unity 8只将在Ubuntu Touch 13.10中使用，默认并不会加入桌面版的13.10。

如果确实不习惯Unity，你也可以方便地在安装时去掉它。或者，你也可以使用其他[Ubuntu家族的Linux发行版][12]，例如面向KDE用户的Kubuntu，Cinnamon粉丝喜欢的Mint，又或者专门针对LXDE爱好者的[Lubuntu][13]。搭载Unity的Ubuntu主要为新手用户提供，你完全可以挑选你喜欢的任一款Ubuntu桌面系统。

在新版Ubuntu的软件包最终敲定之前，人们都以为它会选用Google的Chrome浏览器的开源版本Chromium。但是最终，它还是选择了Firefox 24作为默认浏览器。

![img](http://cdn-static.zdnet.com/i/r/story/70/00/021826/08ubuntu1310-620x.png?hash=ZJDlAzAyMG)

其他应用程序都将是Ubuntu或Linux桌面用户熟悉的面孔。办公套件为LibreOffice 4.12；邮件客户端为Thunderbird 24；照片编辑有Gimp 2.8.6，默认的音乐播放器为Rhythmbox 2.99.1。

对新用户来说，最值得一提的新特性将是[Smart Scopes][14](之前叫做Lens)。Lens最初被提出来的时候，其功能只是根据本地Unity Dash的搜索结果对Amazon的搜索结果进行整合。原本是作为默认功能的，但最终该特性被改为了可选。

![img](http://cdn-static.zdnet.com/i/r/story/70/00/021826/05ubuntu1310-620x.png?hash=ZmN2LJMwLG)

在Ubuntu 13.10中，当你使用Unity Dash搜索时，不但可以使用Amazon，还可以选择Facebook、Google、Yelp以及其他多个在线Web页面。

它是如何工作的呢？当你在Unity Dash中输入一个搜索条目时，Ubuntu会尝试猜测最佳匹配项。例如，如果我搜索“最炫民族风”，它除了在我的电脑中搜索，还会在Web的音乐分类下进行搜索。

其中每个分类都有多个源或scopes，例如选择“参考”分类，会自动对应[维基百科][15]、在线词典[Wordnik][16]和[Zotero][17](一个Linux下的类似笔记管理软件)这三个源。

担心基于Web的搜索会泄露个人隐私？Ubuntu已经通过匿名搜索和匿名结果解决了这一问题。

如果说你仍然不想从桌面直接进行Web搜索，别担心，你可以在“设置/安全与隐私/搜索”中将它们全部关闭。或者，我建议通过以下步骤，只使用你信任的搜索引擎：

- 打开应用程序源（屌丝青年可以使用快捷键，Win键+A）
- 往下“滚”，一直滚到Dash插件
- 选择“See X more results.”
- 选择你想要禁止的源
- 点击“Disable”

坦白讲，经过一些修改，我很喜欢这个新功能，当然，Ubuntu 13.10的其他部分我也很喜欢。

经过几个星期的试用，Ubuntu 13.10一直运行良好。对我来说，它是一个流畅、安全、使用方便的桌面Linux。

尽管Unity不太合我个人的胃口，但我仍然认为，Shuttleworth已经成功地打造了一款所有人都可以使用的Linux桌面系统。不相信我？自己下载[俏皮的蝾螈][18]试试看吧~

--------------------------------------------------------------------------------

![](http://cdn-static.zdnet.com/i/r/author/steven-j-vaughan-nichols-140x105.jpg)

**About Steven J. Vaughan-Nichols**
文章作者简介：

**Steven J. Vaughan-Nichols**，亦称sjvn，早在上世纪80年代，CP/M-80还是最前沿操作系统的时候，就开始撰写技术及商业文章。范围涵盖网络、Linux、开源以及操作系统。

--------------------------------------------------------------------------------

via: http://www.zdnet.com/ubuntu-13-10-review-a-great-linux-desktop-gets-better-7000021825/

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

译者：[小眼儿](https://github.com/tinyeyeser) 校对：[wxy](https://github.com/wxy)

[1]:http://www.canonical.com/
[2]:http://www.ubuntu.com/
[3]:http://www.markshuttleworth.com/archives/671
[3-1]:http://www.zdnet.com/blog/open-source/if-my-mother-in-law-can-use-ubuntu-linux-anyone-can/10802
[4]:https://help.ubuntu.com/community/UEFI
[5]:https://one.ubuntu.com/
[6]:https://one.ubuntu.com/services
[7]:https://www.google.com/search?q=site:www.zdnet.com+Linuix+3.11
[8]:http://www.kubuntu.org/
[9]:http://cgit.freedesktop.org/xorg/driver/xf86-video-intel/commit/?id=58a7611
[10]:https://wiki.ubuntu.com/Mir/13.10/NoDefaultQ%26A
[11]:http://www.jonobacon.org/2013/08/27/ubuntu-in-a-nutshell-unity-and-convergence/
[12]:http://www.ubuntu.com/about/about-ubuntu/derivatives
[13]:https://wiki.ubuntu.com/Lubuntu
[14]:http://askubuntu.com/questions/310660/what-are-smart-scopes
[15]:http://www.wikipedia.org/
[16]:http://www.wordnik.com/
[17]:http://www.zotero.org/
[18]:http://releases.ubuntu.com/saucy

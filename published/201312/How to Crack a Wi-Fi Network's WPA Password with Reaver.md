如何使用Reaver破解Wi-Fi网络的WPA密码
================================================================================
![](http://img.gawkerassets.com/img/17pw3mgej3x93jpg/ku-xlarge.jpg)

Wi-Fi网络能够让我们便利地访问因特网，但同时，我们又不希望隔壁抠门猥琐男总是蹭我们的网，所以自然要给WiFi加个密码，对吧？于是，好消息是，也许你已经看过我的另一篇文章，“[如何轻易破解WEP密码][1]”，所以你使用了更稳固的WPA安全协议。

但坏消息是，现在有一款自由开源新工具——[Reaver][2]，已经挖掘出了无线路由器的一个漏洞，由此能够破解绝大多数路由器上的密码。今天，我就来一步步介绍，如何使用Reaver破解WPA/WPA2密码。最后我会给出相应的防范对策。

文章的第一部分，是使用Reaver破解WPA的详细步骤，读者可以看视频，也可以跟着下面的文字一起做。然后，我会解释Reaver的工作原理。最后，介绍如何防范Reaver攻击。

[http://www.youtube.com/embed/z1c1OIMbmb0?wmode=transparent&rel=0&autohide=1&showinfo=0&enablejsapi=1][3]

在正式开始之前，我还是要不厌其烦强调一下：知识就是力量，但是拥有力量不代表着可以为所欲为、触犯法律。同样，骑白马的不一定是王子，会开锁的也不一定是小偷。本文只是关于某些技术的实验与验证，只适用于学习。你知道的越多，就能够越好的保护自己。

###准备工作###

首先，无需成为一名网络专家，学会使用复杂的命令行工具，你只需要准备一张空白DVD、一台能连接WiFi的电脑，并腾出几个小时时间，这就是我们基本需要的东西。要安装Reaver，可以有很多方法，但是这里我们建议你按照下面的指南来做：

![](http://img.gawkerassets.com/img/194pra0777vwyjpg/ku-xlarge.jpg)

- [**The BackTrack 5 Live DVD**][4]。BackTrack是一款支持自启动的Linux发行版，上面集成了大量的网络测试工具。虽然这对于安装、配置Reaver并不是必需的一个条件，但是对于大多数用户却是最简单一个方法。从[BackTrack的下载页面（传送门）][5]下载Live DVD，然后刻盘。这里你也可以下载镜像然后使用VMware安装，如果你不知道VMware是啥，额，那就还是刻盘吧。如图所示，下载的时候，下拉菜单选择BackTrack 5 R3版本、Gnome环境、根据你的CPU选择32或64位系统（如果这里不确定是32还是64，为了保险起见，请选择32位），下载类型选择ISO，然后就可以点击下载了。

- **配有DVD光驱、支持WiFi的电脑**。BackTrack支持大多数的笔记本无线网卡，这一点对于大多数读者应该没什么问题。同时，你的电脑需要有一个DVD光驱，这样才能从BackTrack光盘启动。我的测试环境是一台用了6年的MacBook Pro。

- **附近要有采用WPA加密的WiFi网络**。没WiFi网，你破解谁去 =。=  ……一会我会在“Reaver的工作原理部分”介绍，WiFi防护设置是如何产生安全漏洞、WPA破解是如何成为可能的。

- **最后，你还需要一点点的耐心**。这是整个实验的最后一步，使用Reaver破解WPA密码并不难，它采用的是暴力破解，因此，你的电脑将会测试大量不同的密码组合，来尝试破解路由器，直到最终找到正确的密码。我测试的时候，Reaver花了大概两个半小时破解了我的WiFi密码。[Reaver的主页][6]上介绍，一般这个时间在4到10个小时之间，视具体情况而定。

###让我们开始吧###

此时，你应该已经把BackTrack的DVD光盘刻录好了，笔记本也应该已经准备就绪。

####第1步：启动BackTrack####

要启动BackTrack，只需将DVD放入光驱，电脑从光盘启动。（如果不知道如何使用live CD或DVD启动，请自行Google。）启动过程中，BackTrack会让你选择启动模式，选择默认的“BackTrack Text - Default Boot Text Mode”然后回车。

最终BackTrack会来到一个命令行界面，键入`startx`，回车，BackTrack就会进入它的图形界面。

####第2步：安装Reaver####

（文章更新：Reaver在R3版中已经预装，如果你安装的是BT5的R3版，这一步骤可以忽略，直接跳到第3步。）

Reaver已经加入了BackTrack的最新版软件包，只是还没有集成到live DVD里，所以，在本文最初撰写的时候，你还需要手动安装Reaver。要安装Reaver，首先设置电脑联网。

1.点击Applications > Internet > Wicd Network Manager
2.选择你的网络并点击Connect，如果需要的话，键入密码，点击OK，然后再次点击Connect。

连上网以后，安装Reaver。点击菜单栏里的终端按钮（或者依次点击 Applications > Accessories > Terminal）。在终端界面，键入以下命令：

    apt-get update

更新完成之后，键入：

    apt-get install reaver

如果一切顺利，Reaver现在应该已经安装好了。如果你刚才的下载安装操作使用的是WiFi上网，那么在继续下面的操作之前，请先断开网络连接，并假装不知道WiFi密码 =。=  接下来我们要准备破解它~

####第3步：搜集设备信息，准备破解####

在使用Reaver之前，你需要获取你无线网卡的接口名称、路由的BSSID（BSSID是一个由字母和数字组成的序列，用于作为路由器的唯一标识）、以及确保你的无线网卡处于监控模式。具体参见以下步骤。

**找到无线网卡：**在终端里，键入：

    iwconfig

回车。此时你应该看到无线设备的相关信息。一般，名字叫做`wlan0`，但如果你的机子不止一个无线网卡，或者使用的是不常见的网络设备，名字可能会有所不同。

![](http://img.gawkerassets.com/img/194prsh4oyo2mjpg/ku-xlarge.jpg)

**将无线网卡设置为监控模式**：假设你的无线网卡接口名称为`wlan0`，执行下列命令，将无线网卡设置为监控模式：

    airmon-ng start wlan0

这一命令将会输出监控模式接口的名称，如下图中箭头所示，一般情况下，都叫做`mon0`。

![](http://img.gawkerassets.com/img/194prrjkz8yorjpg/ku-xlarge.jpg)

**找到你打算破解的路由器的BSSID**：最后，你需要获取路由器的唯一标识，以便Reaver指向要破解的目标。执行以下命令：

    airodump-ng wlan0

（注意：如果`airodump-ng wlan0`命令执行失败，可以尝试对监控接口执行，例如`airodump-ng mon0`）

此时，你将看到屏幕上列出周围一定范围内的无线网络，如下图所示：

![](http://img.gawkerassets.com/img/194prtyebc284jpg/ku-xlarge.jpg)

当看到你想要破解的网络时，按下Ctrl+C，停止列表刷新，然后复制该网络的BSSID（图中左侧字母、数字和分号组成的序列）。从ENC这一列可以看出，该网络是WPA或WPA2协议。（如果为WEP协议，可以参考我的[前一篇文章——WEP密码破解指南][7]）

现在，手里有了BSSID和监控接口的名称，万事俱备，只欠破解了。

####第4步：使用Reaver破解无线网络的WPA密码####

在终端中执行下列命令，用你实际获取到的BSSID替换命令中的 `bssid` ：

    reaver -i moninterface -b bssid -vv

例如，如果你和我一样，监控接口都叫做 `mon0`，并且你要破解的路由器BSSID是`8D:AE:9D:65:1F:B2`，那么命令应该是下面这个样子： 

    reaver -i mon0 -b 8D:AE:9D:65:1F:B2 -vv

最后，回车！接下来，就是喝喝茶、发发呆，等待Reaver魔法的发生。Reaver将会通过暴力破解，尝试一系列PIN码，这将会持续一段时间，在我的测试中，Reaver花了2个半小时破解网络，得出正确密码。正如前文中提到过的，Reaver的文档号称这个时间一般在4到10个小时之间，因此根据实际情况不同，这个时间也会有所变化。当Reaver的破解完成时，它看起来是下图中这个样子：

![](http://img.gawkerassets.com/img/18qpo7omnvkbejpg/ku-medium.jpg)

**一些要强调的事实**：Reaver在我的测试中工作良好，但是并非所有的路由器都能顺利破解（后文会具体介绍）。并且，你要破解的路由器需要有一个相对较强的信号，否则Reaver很难正常工作，可能会出现其他一些意想不到的问题。整个过程中，Reaver可能有时会出现超时、PIN码死循环等问题。一般我都不管它们，只是保持电脑尽量靠近路由器，Reaver最终会自行处理这些问题。

除此以外，你可以在Reaver运行的任意时候按下Ctrl+C中断工作。这样会退出程序，但是Reaver下次启动的时候会自动恢复继续之前的工作，前提是只要你没有关闭或重启电脑（如果你直接在live DVD里运行，关闭之前的工作都会丢失）。

###Reaver的工作原理###

你已经学会了使用Reaver，现在，让我们简单了解一下Reaver的工作原理。它利用了WiFi保护设置（WiFi Protected Setup - 下文中简称为WPS）的一个弱点，WPS是许多路由器上都有的一个功能，可以为用户提供简单的配置过程，它与设备中硬编码保存的一个PIN码绑定在一起。Reaver利用的就是PIN码的一个缺陷，最终的结果就是，只要有足够的时间，它就能破解WPA或WPA2的密码。

关于这个缺陷的具体细节，参看[Sean Gallagher's excellent post on Ars Technica][8]。

###如何防范Reaver攻击###

该缺陷存在于WPS的实现过程中，因此，如果能够关闭WPS，WiFi就是安全的（或者，更好的情况是，你的路由器天生就木有这一功能）。但不幸的是，正如Gallagher[在Ars的文章中所指出的][9]，即使在路由器设置中人为关掉了WPS，Reaver仍然能够破解其密码。

> 在一次电话通话中，Craig Heffner说道，很多路由器即使关闭WPS都无法有效防范攻击。他和同事一起测试过，所有的Linksys和Cisco Valet无线路由器都是如此。“在所有的Linksys路由器上，你甚至无法手动关闭WPS，”他说，尽管Web界面中有关闭WPS配置的按钮，但是“它仍然会自动打开，极易受到攻击”。

因此，方法一：失败！。也许你可以亲自尝试把你的路由器WPS关闭，然后测试一下Reaver是否还能成功破解。

你也可以在路由器中设置一下MAC地址过滤（只允许指定的白名单设备连接你的网络），但是有经验的黑客还是能够检测出设备的白名单MAC地址，并使用MAC地址仿冒你的计算机。

方法二：失败！那到底该怎么办？

我的建议是，我曾经在我的路由器上安装了开源路由固件[DD-WRT][10]，成功防御了Reaver攻击。因为，[DD-WRT天生就是不支持WPS的][11]，因此，这成为了又一个我热爱自由软件的原因。如果你也对DD-WRT感兴趣，可以看一下这里的[设备支持列表][12]，看是否支持你的路由器设备。除了安全上的升级，DD-WRT还可以[监控网络行为][13]，[设置网络驱动器][14]，[拦截广告][15]，[增强WiFi信号范围][16]等，它完全可以[让你60美刀的路由器发挥出600美刀路由器的水平][17]！

--------------------------------------------------------------------------------

via: http://lifehacker.com/5873407/how-to-crack-a-wi+fi-networks-wpa-password-with-reaver

译者：[Mr小眼儿](http://blog.csdn.net/tinyeyeser) 校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://lifehacker.com/5305094/how-to-crack-a-wi+fi-networks-wep-password-with-backtrack
[2]:http://code.google.com/p/reaver-wps/
[3]:http://www.youtube.com/embed/z1c1OIMbmb0?wmode=transparent&rel=0&autohide=1&showinfo=0&enablejsapi=1
[4]:http://www.backtrack-linux.org/downloads/
[5]:http://www.backtrack-linux.org/downloads/
[6]:http://code.google.com/p/reaver-wps/
[7]:http://lifehacker.com/5305094/how-to-crack-a-wi+fi-networks-wep-password-with-backtrack
[8]:http://arstechnica.com/business/news/2011/12/researchers-publish-open-source-tool-for-hacking-wifi-protected-setup.ars
[9]:http://arstechnica.com/business/news/2012/01/hands-on-hacking-wifi-protected-setup-with-reaver.ars
[10]:http://dd-wrt.com/
[11]:http://code.google.com/p/reaver-wps/issues/detail?id=44
[12]:http://dd-wrt.com/wiki/index.php/Supported_Devices
[13]:http://lifehacker.com/5821773/how-to-monitor-your-internet-usage-so-you-dont-exceed-your-data-cap
[14]:http://lifehacker.com/5756233/get-more-out-of-your-dd+wrt-router-with-an-external-drive?tag=ddwrt
[15]:http://lifehacker.com/5680670/turn-your-dd+wrt-enabled-router-into-a-whole-house-ad-blocker?tag=ddwrt
[16]:http://lifehacker.com/5563196/turn-your-old-router-into-a-range+boosting-wi+fi-repeater?tag=ddwrt
[17]:http://lifehacker.com/178132/hack-attack-turn-your-60-router-into-a-600-router

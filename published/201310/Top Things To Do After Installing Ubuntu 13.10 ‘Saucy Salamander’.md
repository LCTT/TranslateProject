安装Ubuntu13.10 - Saucy Salamander(活泼的蝾螈)后的首要事情
================================================

已于**10月17日**发布的 **Ubuntu 13.10 Saucy Salamander**，有着许多新的显著特点、较多的更新及明显的性能改进。这篇简短的操作手册（how-to）将会讨论在日常的使用中怎么样进一步提升Ubuntu 13.10的性能。

如果你已经装有Ubuntu以前的版本，想升级到最新的13.10的话，请参照着我们的指南一步一步操作。[升级到Ubuntu 13.10 Saucy Salamander][1]。

首先，在全新安装Ubuntu 13.10 Saucy后，第一步就是检查如下的几件事情。

**A. 它能正常的跑起来吗，如果不能，[查看我们以前发表的文章来解决相应的问题][2]。**

**B. wifi连接速度是否正常，如果太慢，[查看我们以前发表的文章来解决相应的问题][3]。**

## 1. 更新系统 ##

安装完Ubuntu 13.10 Saucy后，首要的事情就是更新或升级软件源库，确保你的系统中的所有软件都更新到最新版本。

    $ sudo apt-get update && sudo apt-get upgrade

## 2. 安装Ubuntu Tweak软件 ##

在Ubuntu系统或它的衍生发行版系统上，**Ubuntu Tweak** 是必须有的。它是一个应用程序，使用它，任何人都能很容易的配置Ubuntu系统。它提供了很多有用的桌面和系统选项，这些都是默认的桌面环境没有提供的。使用Ubuntu Tweak，只需要一个简单的点击，就可以安装所有需要的应用程序，还可以改变默认的从左到右的窗口按钮排列方式等等。

**阅读[专访Ubuntu Tweak的作者周鼎][4]。**

**通过PPA安装Ubuntu Tweak**

**注意**： 稳定的 Ubuntu-Tweak PPA还没有准备好，但有一个来源于讨论组并可用的PPA可以安装Ubutun-Tweak（译注：现在已经有了正式的了）。

打开终端，输入如下命令：

    $ sudo add-apt-repository ppa:tualatrix/next
    $ sudo apt-get update 
    $ sudo apt-get install ubuntu-tweak

这篇文章里提到的大部分应用程序，都可以在Ubuntu Tweak中心找到，并且通过点击就可安装。

如果你想学习怎么样使用[Ubuntu Tweak，请阅读我们以前的帖子文章][5]。

## 3. 桌面环境 ##

**不喜欢Ubuntu 13.10默认的Unity，为什么不试试Cinnamon或者Gnome呢？**

Cinnamon是GNOME 3的一个分支，它提供了一个有经典菜单的底部面板，这对于想使用经典底部菜单的Ubuntu用户来说相当有用。Ubuntu 13.10的默认源库里已经提供了Cinnamon，因此输入下面的命令就能安装。

    sudo apt-get install cinnamon

如果你想安装最新版本的cinnamon，就增加如下步骤：

    sudo add-apt-repository ppa:gwendal-lebihan-dev/cinnamon-nightly
    sudo apt-get update
    sudo apt-get install cinnamon

注销当前登录会话，然后在登录提示窗口选择Cinnamon作为桌面会话。就可以进入Cinnamon的桌面环境。

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/10/Menu_011-1024x640.png)

**警告**： 最新版本的Cinnamon会破坏原来的Unity，这在Ubuntu 13.04版本和13.10版本上都发现了同样的问题。希望在 Ubuntu 13.10稳定版本发布时会修复这个bug。欲了解更多信息，请参阅此[链接][7]。

**在Ubuntu 13.10上安装GNOME 3**

要在Ubuntu 13.10上安装GNOME 3，输入如下命令：

    sudo apt-get install gnome-shell ubuntu-gnome-desktop

在安装期间，安装程序会让你选择登录显示管理器（LightDM是Unity桌面默认的标准，GDM是GNOME桌面默认的标准，任一个都可以）。

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/10/Menu_001.png)

## 4. 账户配置 ##

**配置UbuntuOne账户**

**UbuntuOne**可以让用户在线存储文件，然后在电脑和移动设备之间同步，也可以从云端获取音频和音乐到移动设备。如果你已经有一个帐号，你需要在顶部登陆，然后在您的电脑上设置一个文件夹，并开始同步你的数据，通讯录，照片等。

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/10/Ubuntu-One_005.png)

你也可以从左侧的unity启动器里运行**UbuntuOne**：

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/10/Selection_004.png)

**配置网上帐户**

你需要做的首要事情之一就是设置你的网上帐户（Facebook，twitter……）。要做到这一点，直接点击右上角**齿轮形状**的按钮，并选择**系统设置**。

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/10/Menu_007.png)

然后选择网上帐户（如下所示）。

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/10/System-Settings_008.png)

现在设置您的网上帐户，就可以在Ubuntu里面得到消息通知。

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/10/Online-Accounts_010.png)

## 5. 系统监控和Eye Candy工具##

**为Ubuntu 13.10安装Conky工具**

**[Conky] [8]**是一款免费的，轻量级的X窗口系统监控软件，能在您的桌面上显示任何的信息。有许多漂亮的主题可以选择，用来显示时钟、CPU使用率、内存使用率、交换空间信息，磁盘信息、网络信息或更多的系统信息。查看我们以前发表的关于在Ubuntu 12.04, 12.10,13.04或Ubuntu 13.10环境中[安装及配置conky的相关文章][9]。

**不喜欢默认的图标，想尝试一些很酷的图标？**

试试下面很酷的图标集。

需要更改默认的图标，以符合您的口味？[查看这个漂亮的Ubuntu的图标集][10] (包含PPA)。

## 6. 多媒体软件的选择 ##

###播放器###

**VLC 媒体播放器：**

在Linux平台上[VLC][11]是最好的媒体播放器，它几乎能播放所有的媒体文件，而且还具有其它多媒体播放器所没有的特性。如果你想知道VLC有些什么功能，请读读这篇文章：[VLC媒体播放器能做的25件事][12]！

通过Ubuntu软件中心或者在终端中使用下面的命令就能安装VLC：

    sudo apt-get install vlc

或者使用下面的PPA来安装最新的2.1.1版本。

    sudo add-apt-repository ppa:videolan/stable-daily
    sudo apt-get update
    sudo apt-get install vlc

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/10/About_014.png)

**XMBC：**

**[XBMC][13]**是一个屡获殊荣的免费、开源的（GPL）媒体播放器软件及数字媒体娱乐中心。XBMC可以运行在Linux、OSX、windows及原来的Xbox平台上。XBMC做为一个标准的计算机媒体播放器应用程序，功能十分强大，它已经被设计为您的[家庭影院电脑HTPC][40]的最佳伴侣。因为它支持几乎是无限的远程控制，并配有漂亮的界面和强大的皮肤引擎，坐在沙发上操作非常舒适，所以XBMC是您的家庭影院的理想解决方案。

打开终端，拷贝下面的命令执行：

    sudo apt-get install xbmc

###视频编辑###

**Openshot视频编辑器：**

我喜欢的视频编辑器是[Openshot][14]，Linux平台专用的最好软件。可以直接从Ubuntu软件中心进行安装，但想安装最新发行版本的话，你得把下面的源库添加上：

**注释**： 在写这篇文章的时候，13.10版本下，PPA还不可用。希望不久就会更新可用。

    sudo add-apt-repository ppa:openshot.developers/ppa
    sudo apt-get update
    sudo apt-get install openshot openshot-doc

也可以读读[采访乔纳森·托马斯][15]这文章。他是Openshot的主要开发者。

###视频编码器###

**Handbrake:**

查看我们以前的文章来了解这款叫做“Handbrake”的强大视频编码器软件。

[使用Handbrake对电影和视频编码][16]

## 7. 安装常用编解码器以便能播放DVD ##

也许安装几个常见的编解码器，可能会提升您的系统的可用性：

    sudo apt-get install gstreamer0.10-plugins-ugly gstreamer0.10-ffmpeg libxine1-ffmpeg gxine mencoder libdvdread4 totem-mozilla icedax tagtool easytag id3tool lame nautilus-script-audio-convert libmad0 mpg321 gstreamer1.0-libav

要播放加密的DVD，libdvdcss 2包是必不可少的。libdvdcss是一个简单的，专门设计来访问DVD的库，就像访问块设备一样轻松，而不用考虑是否需要解密。

    sudo /usr/share/doc/libdvdread4/./install-css.sh

## 8. 让浏览器支持Flash ##

**在32位或64位的Ubuntu系统上**： 为了能用浏览器（Firefox/Chrome）观看视频及浏览flash网站，你需要安装flash插件。打开**Ubuntu软件中心**搜索"**flash**",然后安装。

另外也可以输入下面的命令来安装flash插件。

    sudo apt-get install flashplugin-installer

## 9. BT软件 ##

**uTorrent：**

**uTorrent**是一款轻量级和高效能的BT客户端软件，它可以运行在Linux系统、windows系统和Mac系统上。uTorrent在Linux系统上的安装与在windows系统和Max系统上安装大不相同。在Linux中，uTorrent是做为网页服务端（web server）来运行的，而你可以使用浏览器来访问。为了能在浏览器上访问，你应该先开启他的服务。

查看我们以前的文章来了解更多的uTorrent信息。

[在Ubuntu/Debian/Linux Mint中怎样安装uTorrent客户端][17]

**Deluge：**

Deluge应用程序是一个全功能的BT客户端。它后端使用libtorrent库，用户界面（UI）使用PyGTK，并且在目前POSIX兼容的操作系统也可运行。它的目的是给像GNOME和Xfce等GTK桌面环境带来原生的、全功能客户端应用程序。官方的windows移植也可用。

打开终端，输入如下命令：

    sudo apt-get install deluge

## 10. 即时消息软件 ##

这里是为您的系统推荐的消息软件列表。不要所有的都安装。一个一个的装，找出最合你的一款，然后删除其它的。

**Pidgin**

[Pidgin][18]是最好的即时消息客户软件，有30个插件，你能和朋友进行语音或视频聊天。

要安装Pidgin，键入如下命令：

    $ sudo apt-get install pidgin

**aMSN**

[aMSN][19]是一款免费的windows Live Messenger的克隆版本软件。aMSN在外观和感觉上很像windows Live Messenger，并且支持windows Live Messenger的很多功能。

aMSN具有Windows Live Messenger没有的功能。用户可以设置报警器，能够查看把自己从别人的联系人列表中删除的用户的信息，能够一次打开多个个人介绍页面。它也具有可定制功能，在主页面上可以自定义主题及定义扩展。

要安装aMSN，在你的终端中键入如下命令：

    $ sudo apt-get install amsn

**Skype：**

如果你想安装Skype，查看我们以前的文章：[Ubuntu 13.04 ‘Raring Ringtail’中如何安装Skype][20]

**Jitsi:**

Jitsi是用Java编写的，开源多平台的音频/视频网络电话和即时通讯软件。它支持一些最流行的像SIP、Jabber/ XMPP协议（有 hence Facebook和Google Talk）、AIM、ICQ、MSN、雅虎通等即时通讯和电话协议。

至于详细的Jitsi介绍，请点击下面的连接来查看我们以前的文章。

[在Ubuntu中安装Jitsi即时通讯软件][21]

## 11. 游戏或模拟器 ##

**有了Playdeb游戏变得容易了：**

如果你是游戏发烧友，添加PlayDeb源到你的开机上就很有必要了。PlayDeb是一个Ubuntu的游戏源库。在getdeb.net网站上已经提供了一个简单的安装和更新格式标题，你只要通过简单的点击就能安装很多游戏。

[点击安装PlayDeb源库][22]

**Wine**

Wine可以在Linux、Mac、FreeeBSD和Solaris这些系统上运行windows系统上的应用程序，而不需要微软windows系统的支持。Wine一款自由软件,它正在不断发展，这使得其它平台也从中得到很多好处。

    sudo apt-get install wine

或者

请参考下面的说明： [WINE中怎么样安装和配置游戏][23]

## 12. 文件、文件夹共享 ##

**Samba:**

为了把我们**Raring Ringtail**系统上的文件和网络中的其它Linux机器或windows机器共享，你需要安装和配置Samba共享服务。具体怎么样在Ubuntu上配置Samba，请查看我们以前的帖子：[在Ubuntu 13.04 ‘Raring Ringtail上安装和配置Samba共享][24]。

**Gigola:**

Gigola是在Linux和Widows系统之间共享文件的另外一种选择。与Samba不同的是，我们可以使用Gigola命令在Linux到Linux或者Linux到Windows之间互相传送文件。

从下面的链接中学习更多的Gigola知识。

[使用Gigolo怎么样访问远程的Linux或Windows机器][25]

## 13. 附加功能及杂项 ##

###安装压缩包管理应用程序###

安装以下软件包将允许您处理几乎所有的文件及任何zip格式的文件。

    sudo apt-get install unace unrar zip unzip p7zip-full p7zip-rar sharutils rar uudeview mpack arj cabextract file-roller

###Y PPA Manager###

Y PPA Manager是一款图形用户界面应用工具程序。使用它能很容易的添加PPA、在所有[Launchpad PPAs][26]中搜索某个软件包，删除重复的PPA（只适用于以.分隔的列表文件）、备份PPA和其它PPA相关的任务。查看Launchpad页面，可以看到完整的功能列表。

    sudo add-apt-repository ppa:webupd8team/y-ppa-manager
    sudo apt-get update
    sudo apt-get install y-ppa-manager

Y-PPA-Manager既可以从Dash中打开也可以从菜单中打开。

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/10/Y-PPA-Manager_015.png)

###安装Java 7###

Java是一个快速，安全及可靠的编程和计算平台。有许多的应用程序和网站都是运行在Java基础上的，如果不安装Java，根本就没法运行。现在越来越多的应用都基于Java创建。要安装java，可以在终端上简单的输入如下命令。

    sudo apt-get install openjdk-7-jdk

如果你想安装oracle公司的java 7，试着按照下面的步骤来。

首先，在你终端上按如下所示运行命令删除OpenJDK：

    sudo apt-get purge openjdk*

现在添加如下的源，就可以安装Java 7了：

    sudo add-apt-repository ppa:webupd8team/java
    sudo apt-get update
    sudo apt-get install oracle-java7-installer

要删除Java 7,在终端运行上运行这条：

    sudo apt-get remove oracle-java7-installer

###FileZilla###

[Filezilla][27]是Linux平台上最好的ftp客服端软件之一。

通过命令行安装它：

    sudo apt-get install filezilla

###Dropbox###

Dropbox是一款免费的服务，可以把您的所有照片，文档和视频分发到任何地方。这意味着，你保存到Dropbox的文件会自动保存你所有的电脑，手机，甚至[Dropbox网站][28]。不管你是学生、专业人士、父母级人物或者祖父母级人物，用Dropbox与其它人分享也超级简单。

[下载Dropbox软件包][29]

###Oracle VirtualBox###

你果你想用虚拟机运行其它操作系统，就安装Virtualbox吧。

要安装的话，请[按照我们以前的帖子中的指示][30]。

###Cheese: 网络摄像软件###

Cheese使用您的摄像头拍照和录像，并支持非常花哨的特效，提供让您与他人分享的乐趣。要在你的Ubuntu桌面系统上安装cheese,键入如下命令：

	sudo apt-get install cheese

###digikam###

digiKam是一个高级的数码照片管理应用程序，适用于Linux，Windows和Mac OS X 系统。在Linux系统上，摄影师可以用它来查看、管理、编辑、增强、组织、做标签以及共享照片。

用命令行，你能很容易的安装：

    sudo apt-get install digikam

###Gimp###

日常生活中，不管你是需要对图像进行专业级别的编辑，还是业余级的编辑，GIMP都是能胜任的必需工具之一。

    sudo apt-get install gimp gimp-data gimp-plugin-registry gimp-data-extras

###安装Compiz###

使用如下命令来安装Compiz:

    sudo apt-get install compiz compizconfig-settings-manager compiz-plugins

## 14. 桌面特效 ##

想要使用很棒的壁纸给你的桌面增点趣味吗？那你就要使用下面的两款应用程序了。他们会让你的桌面壁纸每隔一段时间就换一张。

**Variety:**

Variety是一款Ubuntu的换壁纸应用程序。它功能齐全，还不大，并且很容易使用。它会从各种在线源，比如Flickr、Wallbase.cc、阳光世界地图（随着时间而变动的动态壁纸）、Wallpapers.net、NASA每日的天文图片、Desktoppr.co等等自动下载壁纸。它可以设定定期或按要求循环切换这些壁纸，还提供了一项很容易就能从大量壁纸中挑出精美壁纸的功能。

要在Ubuntu下安装，请参照我们以前的文章。

[在Ubuntu/Linux Mint系统上使用Variety来自动更换桌面壁纸][31]

**Wallch:**

Wallch是一款应用程序，它能在一个特定的时间内自动切换你的Ubuntu（Ubuntu的衍生版本）系统的桌面壁纸。它既支持Gnome桌面也支持Unity桌面，它也能停止/启动切换到下一张/上一张壁纸。Wallch也支持每半小时更新一次的动态地球壁纸，因些你可以把动态地球壁纸设置成你的桌面背景。

要在Ubuntu下安装，请参照我们以前的文章。

[用Wallch自动改变Ubuntu系统的壁纸][32]

## 15. 其它值得一试的应用软件 ##

**App Grid:**

App Grid是一款Ubuntu软件中心（Ubuntu Software Center）的轻量级的替代应用程序。它具有根据已经安装、待安装、类别、名字、等级等条件来筛选应用软件的功能。它具有专有许可发行权限，并且在Ubuntu 12.04、12.10、13.04和13.10都是可用的。

关于App Grid的更多详细介绍，请查看我们以前的文章，下面是相关连接。

[App Grid:Ubuntu Software Center的新替代软件][33]

**Boot UP Manager(BUM):**

Boot-Up Manager是一款基于Perl-Gtk2的应用程序，用它可以管理任何基于Ubuntu/Debian衍生系统的运行级别的配置脚本。使用这个程序，我们可以很容易地启动和停止服务及脚本，无需处理复杂的符号链接和权限。

关于BUM的更多详细介绍，请查看我们以前的文章，下面是相关连接。

[Ubuntu/Debian系统上用BUM (Boot-Up Manager)管理启动相关服务][34]

**TLP: 改善电池性能**

TLP是Linux下一款高级电源管理工具程序，它会自动的设置和调整当前的机器，以提高现有的电源管理，而不需要用户知道具体的技术细节。它是纯命令行工具，并没有图形用户界面（GUI），所以在几乎所有的笔记本电脑上都可以运行。

关于TLP的更多详细介绍，请查看我们以前的文章，下面是相关连接。

[在Linux中使用TLP来提高笔记本电脑电池的使用寿命][35]

**BleachBit: 清理你的系统**

 BleachBit删除不必要的文件，释放缓存，删除cookies，清除上网历史，粉碎临时文件，删除日志，并丢弃你不知道存放在哪的垃圾。这工具既可用于Windows系统，也可用于Linux系统，也支持如Firefox、 Internet Explorer、Adobe Flash、Google Chrome、Opera、Safari等应用程序的缓存清理。它不仅可以删除文件，还包含了一些高级功能，如粉碎文件，以防止恢复，擦除可用磁盘空间来隐藏由其他应用程序中删除文件的痕迹，清理火狐浏览器使其更快。 

关于BleachBit的更多详细介绍，请查看我们以前的文章，下面是相关连接。

[BleachBit清理你的系统][36]

也可以安装下面这些有用的软件。某些时候，它们对你很有帮助。

[Opera][37]  – 地球上最快的浏览器，甚至更快。但不是它所有的。在网络连接速度慢的时候，在你的下载页面使用Opera Turbo，会使下载速度加快两倍。

[Google Chrome][38] – Google的网络浏览器

[Google Earth][39] – 世界各地的城市旅行，潜入海洋深处，探索偏远的岛屿，甚至飞到遥远的星系。

现在你已经到达这篇文章的末尾了。到这里，相信你的Ubuntu 13.10桌面系统已经十分完善了。祝贺一下！！

--------------------------------------------------------------------------------

via: http://www.unixmen.com/top-things-installing-ubuntu-13-10/

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

译者：[runningwater](https://github.com/runningwater) 校对：[wxy](https://github.com/wxy)

[1]:http://linux.cn/article-2128-1.html
[2]:http://www.unixmen.com/2012003-howto-resolve-nosound-problem-on-ubuntu/
[3]:http://www.unixmen.com/resolve-slow-connexion-when-using-wifi-in-ubuntu-1104-natty-narwhal
[4]:http://www.unixmen.com/interview-with-ding-zhou-of-ubuntu-tweak/
[5]:http://www.unixmen.com/after-a-fresh-install-of-ubuntu-1010-maverick-meerkat-configuration-made-easy-with-ubuntu-tweak/
[6]:http://www.unixmen.com/lefebvre-clem-gives-new-cinnamon-de-for-the-good-old-gnome-2x-experience/
[7]:http://news.softpedia.com/news/Cinnamon-2-0-Corrupts-Unity-on-Ubuntu-13-10-390736.shtml
[8]:http://conky.sourceforge.net/
[9]:http://www.unixmen.com/configure-conky-lua-in-ubuntu-11-10-12-04-fedora-debian-and-linuxmint-howto-conky/
[10]:http://www.unixmen.com/nice-collection-of-iconsets-themes-for-your-linux-desktop-with-installation-instructions-ubuntu-ppa/
[11]:http://www.unixmen.com/042013-top-things-to-do-after-installing-ubuntu-13-04-raring-ringtail/www.videolan.org
[12]:http://www.unixmen.com/22-things-you-can-do-with-vlc/
[13]:http://www.unixmen.com/xbmc-11-0-eden-has-been-released-ppa-ubuntu/
[14]:http://www.openshotvideo.com/
[15]:http://www.unixmen.com/interview-with-jonathan-thomas-of-openshot/
[16]:http://www.unixmen.com/how-to-encode-moviesvideos-using-handbrake/
[17]:http://www.unixmen.com/how-to-install-utorrent-on-ubuntu-debian/
[18]:http://www.pidgin.im/
[19]:http://www.unixmen.com/042013-top-things-to-do-after-installing-ubuntu-13-04-raring-ringtail/www.amsn-project.net/
[20]:http://www.unixmen.com/howto-install-skype-in-ubuntu-12-04-precise-pangolin/
[21]:http://www.unixmen.com/top-things-installing-ubuntu-13-10/www.unixmen.com/install-jitsi-instant-messenger-ubuntu/
[22]:http://archive.getdeb.net/install_deb/playdeb_0.3-1%7Egetdeb1_all.deb
[23]:http://www.unixmen.com/install-and-configure-wine-to-play-latest-windows-games-in-linux-ubuntu-linuxmint-fedora/
[24]:http://www.unixmen.com/howto-install-and-configure-samba-share-in-ubuntu/
[25]:http://www.unixmen.com/how-to-access-remote-linux-and-windows-shares-with-gigolo/
[26]:https://launchpad.net/y-ppa-manager
[27]:http://www.filezilla-project.org/
[28]:http://www.dropbox.com/
[29]:https://www.dropbox.com/install?os=lnx
[30]:http://www.unixmen.com/virtualbox-4-1-12-has-been-released-ppa-ubuntu12-04-lts/
[31]:http://www.unixmen.com/automatically-change-the-desktop-wallpaper-using-variety-on-ubuntulinux-mint/
[32]:http://www.unixmen.com/change-ubuntu-systems-wallpaper-automatically-wallch/
[33]:http://www.unixmen.com/app-grid-a-new-alternative-for-ubuntu-software-center/
[34]:http://www.unixmen.com/manage-startup-services-with-bumboot-up-manager-on-ubuntudebian/
[35]:http://www.unixmen.com/how-to-improve-laptop-battery-life-and-usage-in-linux-using-tlp/
[36]:http://www.unixmen.com/clean-up-your-linux-systems-using-bleachbit/
[37]:http://www.opera.com/browser/
[38]:http://www.google.com/chrome/index.html?hl=en-GB&brand=CHMB&utm_campaign=nl&utm_source=nl-ha-emea-nl-bk&utm_medium=ha
[39]:http://www.unixmen.com/how-to-install-google-earth-in-linux/
[40]:http://baike.baidu.com/view/57872.htm
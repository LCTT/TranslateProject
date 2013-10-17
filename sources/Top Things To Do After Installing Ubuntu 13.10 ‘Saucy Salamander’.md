安装Ubuntu13.10 - Saucy Salamander(活泼的蝾螈)后的首要事情
================================================================================
将于**10月17日**发布的**Ubuntu 13.10 Saucy Salamander**，有着许多新的显着特点，较大的更新及明显的性能改进。这篇简短的操作手册（how-to）将会讨论在日常的使用中怎么样进一步提升Ubuntu 13.10的性能。

如果你已经装有Ubuntu以前的版本，想升级到最新的13.10的话，请参照着我们的指南一步一步操作。[升级到Ubuntu 13.10 Saucy Salamander][1]。

首先，在全新安装Ubuntu 13.10 Saucy后，第一步就是检查如下的几件事情。

**A. 它能正常的跑起来吗，如果不能，[查看我们以前发表的文章来解决相应的问题][2]。**

**B. wifi连接速度是否正常，如果太慢，[查看我们以前发表的文章来解决相应的问题][3]。**

## 1. 更新系统 ##

安装完Ubuntu 13.10 Saucy后，首要的事情就是更新或升级软件源库，确保你的系统中的所有软件都能更新到最新版本。

    $ sudo apt-get update && sudo apt-get upgrade

## 2. 安装Ubuntu Tweak软件 ##

在Ubuntu系统或它的衍生发行版系统上，**Ubuntu Tweak**是必须有的。它是一个应用程序，使用它，任何人都能很容易的配置Ubuntu系统。它提供了很多有用的桌面和系统选项，这些都是默认的桌面环境没有提供的。使用Ubuntu Tweak，只需要一个简单的点击，就可以安装所有需要的应用程序，还可以改变默认的从左到右的窗口按钮排列方式等等……。

**阅读[专访Ubuntu Tweak的作者周鼎][4]。**

**通过PPA安装Ubuntu Tweak**

**注意**： 稳定的 Ubuntu-Tweak PPA还没有准备好，但有一个来源于讨论组并可用的PPA可以安装Ubutun-Tweak。

打开终端，输入如下命令：

    $ sudo add-apt-repository ppa:tualatrix/next
    $ sudo apt-get update 
    $ sudo apt-get install ubuntu-tweak

这篇文章里提到的大部分应用程序，都可以在Ubuntu Tweak中心找到，并且通过点击就可安装。

如果你想学习怎么样使用[Ubuntu Tweak，请阅读我们以前的帖子文章][5]。

## 3. 桌面环境 ##

**不喜欢Ubuntu 13.10默认的Unity，为什么不试试Cinnamon或者Gnome呢？**

Cinnamon是GNOME 3的一个分支，它提供了一个有经典菜单的底部面板，这对于想使用经典底部菜单的Ubuntu用户来说相当有用。Ubuntu 13.10的默认源库里已经提供了Cinnamon，因此输入下面的命令就能安装。

    sudo apt-get install cinnamon（译者注：原文缺失？！）

如果你想安装最新版本的cinnamon，就增加如下步骤：

    sudo add-apt-repository ppa:gwendal-lebihan-dev/cinnamon-nightly
    sudo apt-get update
    sudo apt-get install cinnamon

注销当前登陆会话，然后在登陆提示窗口选择Cinnamon作为桌面会话。现在就可以进入Cinnamon的桌面环境。

**警告**： 最新版本的Cinnamon会破坏原来的Unity，这在Ubuntu 13.04版本和13.10版本上都发现了同样的问题。希望在 Ubuntu 13.10稳定版本发布前会修复这个bug。欲了解更多信息，请参阅此[链接][7]。

**在Ubuntu 13.10上安装GNOME 3**

要在Ubuntu 13.10上安装GNOME 3，输入如下命令：

    sudo apt-get install gnome-shell ubuntu-gnome-desktop

在安装期间，安装程序会让你选择登陆显示管理器（LightDM是Unity桌面默认的标准，GDM是GNOME桌面默认的标准，任一个都可以）。

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/10/Menu_001.png)

## 4. 账户配置 ##

**配置UbuntuOne账户**

**UbuntuOne**让用户在线存储文件，然后在电脑和移动设备之间同步，也可以从云端获取音频和音乐到移动设备。如果你已经有一个帐号，你需要在顶部登陆，然后在您的电脑上设置一个文件夹，并开始同步你的数据，通讯录，照片等。

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/10/Ubuntu-One_005.png)

你也可以从左为的unity启动器里运行**UbuntuOne**：

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/10/Selection_004.png)

**配置网上帐户**

你需要做的首要事情之一就是设置你的网上帐户（Facebook，twitter……）。要做到这一点，直接点击右上角**齿轮形状**的按钮，并选择**系统设置**。

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/10/Menu_007.png)

然后选择网上帐户（如下所示）。

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/10/System-Settings_008.png)

现在设置您的网上帐户，并在Ubuntu可以得到通知。

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/10/Online-Accounts_010.png)

## 5. 系统监控和外观糖果工具##

**为Ubuntu 13.10安装Conky工具**

**[Conky] [8]**是一款免费的，轻量级的X窗口系统监控软件，能在您的桌面上显示任何的信息。有许多漂亮的主题可以选择，用来显示时钟、CPU使用率、内存使用率、交换空间信息，磁盘信息、网络信息或更多的系统信息。查看我们以前发表的关于在Ubuntu 12.04, 12.10,13.04或Ubuntu 13.10环境中[安装及配置conky的相关文章][9]。

**不喜欢默认的图标，想尝试一些很酷的图标？**

试试下面很酷的图标集。

需要更改默认的图标，以符合您的口味？[查看这个漂亮的Ubuntu的图标集][10] (包含PPA)。

## 6. 多媒体软件选择 ##

- 播放器

**1-VLC 媒体播放器：**

在Linux平台上[VLC][11]是最好的媒体播放器，它几乎能播放所有的媒体文件，而且还具有其它多媒体播放器所没有的特性。如果你想知道VLC有些什么功能，请读读这篇文章：[VLC媒体播放器能做的25件事][12]！

通过Ubuntu软件中心或者在终端中使用下面的命令就能安装VLC：

    sudo apt-get install vlc

或者使用下面的PPA来安装最新的2.1.1版本。

    sudo add-apt-repository ppa:videolan/stable-daily
    sudo apt-get update
    sudo apt-get install vlc

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/10/About_014.png)

**2- XMBC：**

**[XBMC][13]**是一个屡获殊荣的免费和开源（GPL）媒体播放器软件及数字媒体娱乐中心。XBMC可以运行在Linux、OSX、windows及原来的Xbox平台上。XBMC做为一个标准的计算机媒体播放器应用程序，功能十分强大，它已经被设计为您的[HTPC][40]的最佳伴侣。因为它支持几乎是无限的远程控制，并配有漂亮的界面和强大的皮肤引擎，坐在沙发上操作非常舒适，所以XBMC是您的家庭影院的理想解决方案。

打开终端，拷贝下面的命令执行：

    sudo apt-get install xbmc

- 视频编辑

**Openshot视频编辑器：**

我喜欢的视频编辑器是[Openshot][14]，Linux平台专用的最好软件。可以直接从Ubuntu软件中心进行安装，但想安装最新发行版本的话，你得把下面的源库添加上：

**注释**： 在写这篇文章的时候，13.10版本下，PPA还不可用。希望不久就会更新可用。

    sudo add-apt-repository ppa:openshot.developers/ppa
    sudo apt-get update
    sudo apt-get install openshot openshot-doc

也可以读读[采访乔纳森·托马斯][15]这文章。他是Openshot的主要开发者。

- 视频编码器

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

**uTorrent**是一款轻量级和高效能的BT客户端软件，它可以运行在Linux系统、windows系统和Mac系统上。uTorrent在Linux系统上的安装与在windows系统和Max系统上安装大不相同。在Linux中，uTorrent是做为网页服务端（web server）来运行的，但你可以在浏览器中访问。为了能在浏览器上访问，你应该先开启他的服务。

查看我们以前的文章来了解更多的uTorrent信息。

[在Ubuntu/Debian/Linux Mint中怎样安装uTorrent客户端][17]

**Deluge：**

Deluge应用程序是一个全功能的BT客户端。它后端使用libtorrent库，用户界面（UI）使用PyGTK，并且在目前POSIX兼容的操作系统也可运行。它的目的是给像GNOME和Xfce等GTK桌面环境带来原生的、全功能客户端应用程序。官方的windows端口也开放可用。

打开终端，输入如下命令：

    sudo apt-get install deluge

## 10. 即使消息软件 ##

这里是为您的系统推荐的消息软件列表。不要所有的都安装。一个一个的装，找出最合你的一款，然后删除其它的。

[Pidgin][18]，最好的即时消息客户软件，有30个插件，你能和朋友进行语音或视频聊天。

要安装Pidgin，键入如下命令：

    $ sudo apt-get install pidgin

[aMSN][19]是一款免费的windows Live Messenger的克隆版本软件。aMSN在外观和感觉上很像windows Live Messenger，并且支持windows Live Messenger的很多功能。

aMSN具有Windows Live Messenger没有的功能。用户可以设置报警器，能够查看把自己从他们的联系人删除的用户的信息，能够一次打开多个人个介绍页面。它也具有可定制功能，在主页面上可以自定义主题及定义扩展。

要安装aMSN，在你的终端中键入如下命令：

    $ sudo apt-get install amsn

**Skype：**

如果你想安装Skype，查看我们以前的文章：[Ubuntu 13.04 ‘Raring Ringtail’中如何安装Skype][20]

**Jitsi:**

Jitsi是用Java编写的，开源多平台的音频/视频网络电话和即时通讯软件。它支持一些最流行的像SIP、Jabber/ XMPP协议（有 hence Facebook和Google Talk）、AIM、ICQ、MSN、雅虎通等即时通讯和电话协议。

For details about Jitsi please check our previous article in the following link.至于详细的Jitsi介绍，请点击下面的连接来查看我们以前的文章。

[在Ubuntu中安装Jitsi即时通讯软件][21]

## 11. 游戏或模拟器 ##

**有了Playdeb游戏变得容易了：**

如果你是游戏发烧友，添加PlayDeb源到你的开机上就很有必要了。PlayDeb是一个Ubuntu的游戏源库。在getdeb.net网站上已经提供了一个简单的安装和更新格式标题，你只要通过简单的点击就能安装很多游戏。

[点击安装PlayDeb源库][22]

**Wine**

Wine enables Linux, Mac, FreeBSD, and Solaris users to run Windows applications without a copy of Microsoft Windows. Wine is free software under constant development. Other platforms may benefit as well.

    sudo apt-get install wine

Or

Please follow instructions in our previous post : [How to install and configure games on WINE][23]

## 12. Sharing Files/Folders ##

**Samba:**

In order to share folders in **Raring Ringtail** with other Linux and windows machines in your network, you will need to install and configure Samba share, for instructions how to configure Samba in Ubuntu check our previous post : [Install and Configure Samba share in Ubuntu 13.04 ‘Raring Ringtail][24]’

**Gigola:**

Gigola is an another option to share files between Linux and Windows systems. Unlike Samba, we can use Gigola to send files between Linux-to-Linux and Linux-to-Windows systems.

Learn more about Gigola from the below link.

[How to Access Remote Linux and Windows Shares with Gigolo][25]

## 13. Extras & Miscellaneous ##

**- Install Archive Management Apps:**

Install the following packages will allow you to deal with almost all and any zip formated files.

    sudo apt-get install unace unrar zip unzip p7zip-full p7zip-rar sharutils rar uudeview mpack arj cabextract file-roller

**- Y PPA Manager:**

Y PPA Manager is a GUI tool to easily add PPAs, search a package in all [Launchpad PPAs][26], remove duplicate PPAs (only works with separate .list files), backup PPAs and other PPA-related tasks. Check out the Launchpad page for a complete features list.

    sudo add-apt-repository ppa:webupd8team/y-ppa-manager
    sudo apt-get update
    sudo apt-get install y-ppa-manager

Y-PPA-Manager can be launched either from Dash or Menu.

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/10/Y-PPA-Manager_015.png)

**Install Java 7**

Java is fast, secure, and reliable programming and computing platform. There are lots of applications and websites that will not work unless you have Java installed, and more are created every day. To install java simply run the following command from your terminal.

    sudo apt-get install openjdk-7-jdk

If you want to try oracle-java 7, try the following steps.

First you need to remove OpenJDK for this run the following command from your terminal:

    sudo apt-get purge openjdk*

Now you can install Java 7 by adding the following repository:

    sudo add-apt-repository ppa:webupd8team/java
    sudo apt-get update
    sudo apt-get install oracle-java7-installer

To remove Java 7, run this in terminal:

    sudo apt-get remove oracle-java7-installer

**FileZilla:**

[Filezilla][27] is one of the best ftp client for Linux.

Install it via command line:

    sudo apt-get install filezilla

**Dropbox:**

Dropbox is a free service that lets you bring all your photos, docs, and videos anywhere. This means that any file you save to your Dropbox will automatically save to all your computers, phones and even the [Dropbox website][28]. Dropbox also makes it super easy to share with others, whether you’re a student or professional, parent or grandparent.

[Download the Dropbox package][29]

**Oracle VirtualBox:**

If you want to run another OS in a virtual machine, install Virtualbox.

For installation, [follow the instructions in our previous post][30].

**Cheese: Web Cam Software**

Cheese uses your webcam to take photos and videos, applies fancy special effects and lets you share the fun with others. To install cheese on your Ubuntu desktop, enter the following command:

**sudo apt-get install cheese**

**digikam**

digiKam is an advanced digital photo management application for Linux, Windows, and Mac-OSX. It can be used by Photographers to view, manage, edit, enhance, organize, tag, and share photographs under Linux systems.

You can easily install it using command:

    sudo apt-get install digikam

**Gimp:**

Regardless of whether you need to edit images daily on a professional level or just a hobbyist, GIMP is an essential tool for all.

    sudo apt-get install gimp gimp-data gimp-plugin-registry gimp-data-extras

**Install Compiz**

To install Compiz use the following command:

    sudo apt-get install compiz compizconfig-settings-manager compiz-plugins

## 14. 桌面特效 ##

Want to spice-up your desktop with awesome wallpapers, well you can use the following two programs to change your desktop wallpapers in a particular interval.

**a- Variety:**

Variety is a wallpaper changer for Ubuntu which is feature-full, yet slim and very easy to use. It can automatically download wallpapers from various online sources such as Flickr, Wallbase.cc, World sunlight map (a live wallpaper that changes as the day progresses), Wallpapers.net, NASA Astronomy Picture of the Day, Desktoppr.co etc. It allows rotating them on a regular interval or on demand, and provides easy to use ways to separate the great images from the junk.

To install it under Ubuntu follow our previous post instructions.

[Automatically Change the Desktop Wallpaper Using Variety on Ubuntu/Linux Mint][31]

**b- Wallch:**

Wallch is an application that can be used to change your Ubuntu (Ubuntu derivatives) desktop wallpapers automatically at a particular period of time. It supports Gnome and Unity. It also let you to stop/start wallch, change to next/previous wallpaper. You can adjust/change the wallpaper changing interval. Wallch supports live Earth wallpapers which updates automatically every half an hour, therefore you can set the live Earth wallpapers as your desktop background.

To install it under Ubuntu follow our previous post instructions.

[Change Ubuntu Systems Wallpaper Automatically With Wallch][32]

## 15. Other worth trying applications ##

**a- App Grid:**

App Grid is a light weight alternative for Ubuntu Software Center. It allows you to filter applications by installed, pending, categories, name and rating. It is released under proprietary license and is available for Ubuntu 12.04, 12.10, 13.04 and 13.10.

For more details about App Grid, check our previous article in the following link.

[App Grid: A New Alternative For Ubuntu Software Center][33]

**b- Boot UP Manager(BUM):**

Boot-Up Manager is a Perl-Gtk2 application to manage runlevels configuration of any Ubuntu/Debian derivative systems. Using this program we can easily start and stop boot-up scripts, without the necessity to handle through complex symbolic links and permissions.

For more details about BUM, check our previous article in the following link.

[Manage Startup Services With BUM (Boot-Up Manager) On Ubuntu/Debian][34]

**c- TLP: Improve Battery performance**

TLP is an advanced power management tool for Linux that gives the settings and tweaks to enhance your existing power management automatically without the need to know every technical details. It is purely a command-line tool and doesn’t have a GUI. It should work on almost all laptops.

For more details about TLP, check our previous article in the following link.

[How to Improve Laptop Battery Life and Usage in Linux Using TLP][35]

**d- BleachBit: Clean up your system**

BleachBit deletes the unnecessary files, free up cache, delete cookies, clear internet history, shred temporary files, delete logs, and discard junk you didn’t know was there. This tool can be used in both Windows OS and Linux systems. And it will support the following applications such as Firefox, Internet Explorer, Adobe Flash, Google Chrome, Opera, Safari and more. It not only deletes the files, but it includes some advanced features such as shredding files to prevent recovery, wiping free disk space to hide traces of files deleted by other applications, and vacuuming Firefox to make it faster.

For more details about BleachBit, check our previous article in the following link.

[Clean up your systems using BleachBit][36]

Also install the following useful software’s if you like. This is gonna help you some time.

[Opera][37]  – The fastest browser on Earth is even faster. But that is not all. Use Opera Turbo to double your page-download speed on slow connections.

[Google Chrome][38] – Web browser from Google

[Google Earth][39] – Travel to cities across the globe, dive into the depths of the ocean, explore remote islands or even fly to faraway galaxies.

Now you’ve reached the end of the article. At this stage, you’ll have a perfect and full fledged Ubuntu 13.10 Desktop. Cheers!!

--------------------------------------------------------------------------------

via: http://www.unixmen.com/top-things-installing-ubuntu-13-10/

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

译者：[runningwater](https://github.com/runningwater) 校对：[校对者ID](https://github.com/校对者ID)

[1]:http://www.unixmen.com/upgrade-ubuntu-13-04-raring-ubuntu-13-10-saucy-salamander/
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
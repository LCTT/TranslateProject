安装Linux Mint 17后要做的20件事
================================================================================
### Linux Mint 17 Qiana Cinnamon ###

Linux Mint 17已经[发布][1]，定名为Qiana。Mint是Linux最佳发行版之一，它定位于桌面用户，关注可用性和简洁。它携带了风格迥异的桌面环境，如Mate以及Cinnamon，并基于不同的发行版，如Ubuntu或Debian。

在本文中，我们使用的是Linux Mint 17的cinnamon版本。要获取更多关于Cinnamon版本的信息（包括下载链接），可以访问 - http://linux.cn/article-3260-1.html

下载适合你系统的正确的iso，烧录成dvd，或者也可以制作成usb启动盘来启动。安装完毕，是时候来使用一些优化工具和基本应用程序来优化系统性能和体验，让你系统激情澎湃吧！

### 1. 更新系统 ###

第一件事情是重中之重，就是让你的系统保持时刻最新。赶紧在终端中运行以下命令吧。

    $ sudo apt-get update
    $ sudo apt-get upgrade

或者，你也可以使用更新管理器（mintUpdate）来干这事，你可以在菜单（Menu）> 管理（Administration）中找到它。

![linux mint 17 qiana](http://www.binarytides.com/blog/wp-content/uploads/2014/06/linux-mint-17-qiana.png)

### 2. 找回旧壁纸 ###

每个Linux Mint发行版都自带了一套最新的漂亮的壁纸。但是，你也可以安装先前版本中的壁纸。

    $ sudo apt-get install mint-backgrounds-*

### 3. 多安装些浏览器 ###

Linux Mint 17默认安装了firefox，你也可以获得更多的浏览器，如Chronium和Google Chrome。

Chronium浏览器可以在仓库中获取。

    $ sudo apt-get install chromium-browser

至于Google Chrome，请访问google.com/chrome下载deb包，并使用gdebi来安装。

    # 64 位
    $ wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
    $ sudo gdebi google-chrome-stable_current_amd64.deb
    
    # 32 位
    $ wget https://dl.google.com/linux/direct/google-chrome-stable_current_i386.deb
    $ sudo gdebi google-chrome-stable_current_i386.deb

### 4. 安装Flash Player ###

Mint上默认安装adobe flash插件包（adobe-flashplugin），因此，你可以在Firefox中畅玩flash游戏，也可以尽情享受网页版视频了。

Google Chrome现在使用了基于flash player的Pepper API，而且该插件也内建于Chrome中，因此，你也不需要为它额外做任何事情了。

然而对于Chronium，基于flash player的Pepper没有被囊括进来（因为它不是个自由组件），所以你需要手动安装了。

安装以下包来为Chronium安装pepper flash player。它会自动从Google Chrome浏览器中下载pepper flash player并加入到Chronium中。

    $ sudo apt-get install pepperflashplugin-nonfree

上面的命令应该帮你将flash player安装到Chronium里头了。万一下载失败，你可以使用下面的命令重新进行安装。

    $ sudo dpkg-reconfigure pepperflashplugin-nonfree

### 5. 安装多媒体解码 ###

受限的额外包可以帮你安装大多数基本的解码，可以让你播放像mp3这样的格式。它也会帮你安装微软字体。

    $ sudo apt-get install ubuntu-restricted-extras

要启用加密dvd的回放，请安装以下包。

    $ sudo apt-get install libdvdread4
    $ sudo /usr/share/doc/libdvdread4/install-css.sh

### 6. 安装专有驱动 ###

如果你有一张Nvidia或者ati的图形卡，或者broadcom的无线网卡，那么请安装厂商提供的专有驱动，这些驱动会为你带来最佳的硬件性能。

要安装Nvidia驱动，你可以参照先前的这篇文章

[如何在Linux Mint上安装最新的Nvidia驱动][3]

### 7. 安装Dropbox ###

Linux mint仓库已经提供了dropbox的客户端软件包，所以你不必满世界找了。

    $ sudo apt-get install dropbox python-gpgme

如果你还是比较喜欢从官方网站下载，那么翻墙可直达[https://www.dropbox.com/install?os=lnx][4]，请遵照说明下载用于Ubuntu的deb安装包。（LCTT译注：墙内用户还是忽视此条吧。）

Copy是另外一个云存储解决方案，它也有本地Linux客户端。详情可查阅[copy.com][5]，它也有[ppa仓库][6]。

### 8. Skype ###

Skype可以在Ubuntu canonical合作仓库中找到。

    $ sudo apt-get install skype

### 9. 安装rar和其它归档工具 ###

要想在Nemo这样的文件管理器中通过上下文菜单创建rar归档，请安装rar工具。安装rar的同时，也可安装其它几个包以增加对其它归档格式的支持。

    $ sudo apt-get install unace p7zip-rar sharutils rar arj lunzip lzip

### 10. 安装剪贴板管理器 ###

剪贴板管理器允许你维护和访问通过像Ctr+C这样的操作拷贝的项目历史，gnome下有很多的剪贴板管理器，像diodon，clipit，glipper，parcellite。

Diodon在cinnamon桌面上似乎存在一些问题，在历史列表增长时会出现滚动条。Clipit和Gipper工作得很好，你也可以安装

    $ sudo apt-get install glipper
    # 或者
    $ sudo apt-get install clipit

然后，你可以从应用程序菜单中启动它们，它们应该会在你每次登录时启动。

### 11. 优化桌面 ###

#### 1. 修复系统托盘上的日期格式 ####

在底部面板右边的时间小程序只显示了时间，它也可以设置显示日期。右击底部面板右边的日期-时间小程序，然后点击配置，选中标有“使用自定义日期格式”的选框，然后填入

    %B %e, %I:%M %p

这会以带有AM/PM的12小时格式显示月份名称、日期和时间。

#### 2. 安装主题、扩展、小程序、桌面组件 ####

为你的桌面搞一些好东西玩玩。你可以在桌面区域放置一些桌面组件，在面板上放些小程序，为桌面效果添加一些扩展，以及为桌面设计安装一些主题。

去系统设置吧，点击指定的图标，你可以看见一个可供选择的列表。点击“在线获取更多”标签来下载更多的好东西。

#### 3. 修改Firefox的搜索引擎 ####

你也许注意到，Firefox默认选择了Yahoo搜索引擎，而搜索引擎列表中并没有Google。点击“管理搜索引擎” > 获取更多搜索引擎，它会带你去[http://www.linuxmint.com/searchengines.php][7]。

向下拉动滚动条到商业搜索引擎部分，找到并点击Google图标。进入下一页后，再次点击搜索引擎列表，而这次你会看到“添加Google”选项，点击它就可以用上Google搜索了。（LCTT译注：墙内用户也请忽略此条。怒！）

### 12. 优化字体渲染 ###

Linux mint默认使用Dejavu Sans字体，它看起来真普通啊。你可以使用Droid和Noto字体获得好看得多视觉享受。请参照我们先前的教程，它会一步一步带你渐入佳境。[如何在Linux Mint上获得华丽好看的字体][8]

### 13. Guake下拉终端 ###

下拉终端让你可以通过点击单个键来访问终端，Guake就是这其中之一，它用于基于gtk的桌面。下拉终端按要求显示/隐藏，并保持运行，因此你无需从菜单或者启动器中打开终端了。这对于热衷于终端的人来说，这是一个必不可少的工具。

    $ sudo apt-get install guake

Guake需要配置，以便在每次登陆时启动。首先，找到guake命令的路径。

    $ which guake
    /usr/bin/guake

现在，把它添加到启动程序列表中。出门左拐，请往系统设置 > 启动程序，然后点击添加。在对话框中填写

> 名称 - Guake下拉终端
> 命令 - /usr/bin/guake

点击添加。现在Guake已经跑到你的运行程序列表中去了，并每次会自动启动。

### 14. Uget下载管理器 ###

Uget是一个简洁而健壮的跨平台下载管理器，在Linux上工作得很好。虽然它缺少分段下载文件功能，但是仍然是一个十分稳定的下载管理器。

    $ sudo apt-get install uget

### 15. Deluge BitTorrent客户端 ###

Linux Mint自带了Transmission，这是个简洁而高效的torrent客户端。如果正在寻找一个更有特色的torrent客户端，那么你可以试试deluge或者vuze（正式名称是azureus），还可以试试qbittorent。

    $ sudo apt-get install deluge-torrent

### 16. Hardinfo - 系统信息工具 ###

Hardinfo是一个十分便利的GUI工具，它可以用来报告大量完整的系统硬件信息。你可以通过它来集中查看处理器、内存、存储设备、网络配置、打印机、usb设备、声音/视频适配器等等信息。它具有测试和评估系统性能的功能。

    $ sudo apt-get install hardinfo

### 17. 安装MATE桌面环境 ###

除了Cinnamon，Linux Mint还自带了另一个流行的桌面环境MATE（Maatay）桌面。如果你想试试，那么就来安装吧。

    $ sudo apt-get install mint-meta-mate

现在你可以在登陆屏幕选择MATE会话了。

### 18. 让其它分区可写 ###

如果你有其它ext分区，比如想用来存储和备份文件，那么你需要让它们可写，以免每次都要使用root特权。

首先，使用gksudo在文件管理器里打开分区挂载目录

    $ gksudo nemo

导航到分区目录，右击去往属性 > 权限标签

赋予“目录访问” - 创建和删除文件权限给用户、组和其它。

赋予“文件访问” - 读和写权限给用户、组和其它。

对于NTFS分区，你不需要做此事。

### 19. 安装Conky ###

Conky是一个轻量级系统监控工具，它通过桌面图形组件显示系统各种资源的统计数据，如cpu、内存、网络等。它不是必须的，但是可以让你的桌面更加绚丽夺目。

    $ sudo apt-add-repository -y ppa:teejee2008/ppa
    $ sudo apt-get update
    $ sudo apt-get install conky-manager

从应用程序菜单启动Conky管理器，并添加组件到桌面。也可以选中开机启动选项来让Conky开机启动。

### 20. 安装一些游戏 ###

Linux确实有一些酷爽的游戏，很具娱乐性，而且是免费的。注意，某些游戏像supertuxkart和0ad要求专用的图形处理器以优化性能。

    # 0ad - 像帝国时代那样的策略游戏
    $ aptitude search 0ad
    
    # supertuxkart - 赛车游戏
    $ aptitude search supertuxkart
    
    # openarena
    $ aptitude search openarena

仓库中还有更多的游戏可供你安装，像Alien arena, secret maryo chronicles, supertux, frozen bubbles等等。

### 清除 ###

做完这一切后，请为系统进行一次大扫除，移除一些不必要的包。

    $ sudo apt-get autoremove

### 注 ###

#### 为Google Chrome/Chronium提供Java小程序支持 ####

默认情况下已经安装了"icedtea-plugin"，用以为firefox提供java小程序支持。 

然而，Chrome和Chronium却不再支持基于NPAPI的插件。因此java小程序，在没有获得基于Pepper api的java插件前，java小程序是不能在这些浏览器中工作的。要查看更多信息，请往[这里][9]。

#### 更多应用程序 ####

如果你正在为你的Mint盒子寻找更多的应用程序，那么这里列出了一部分更好的应用程序，所有这些都可以在软件管理器中安装。

* Opera - 网页浏览器
* Gnome Encfs Manager - 管理使用Encfs加密的文件和文件夹
* Smplayer - 多媒体播放器
* Rhythmbox, Clementine - 音乐播放器
* Openshot, Kdenlive - 视频编辑器
* Audacity - 音频编辑器
* Inkscape - 图形和图像编辑
* Gparted - 分区编辑器
* Gufw - 防火墙配置工具
* qBittorrent, Vuze - Torrent客户端
* Gwenview - 图像浏览
* Team viewer - 远程桌面
* Tv-maxe - 查看电视频道
* Grub Customizer - 修改GRUB启动菜单设置
* Linrunner TLP - 电源管理工具，对笔记本节电很有用
* Virtualbox - 虚拟化
* Kazam, recordMyDesktop - 桌面录像/演示
* Bleachbit - 通过删除旧的/临时文件释放磁盘空间
* Cheese - 使用网络摄像头拍照
* Shutter - 带有众多功能的屏幕截图工具

那么，请选择你喜欢的那些，并尽情享受Linux Mint吧！！

### 资源 ###

下载最新Linux Mint
[http://www.linuxmint.com/download.php][10]

社区教程
[http://community.linuxmint.com/tutorial][11]

Linux Mint论坛
[http://forums.linuxmint.com/][12]

--------------------------------------------------------------------------------

via: http://www.binarytides.com/better-linux-mint-17-cinnamon/

译者：[GOLinux](https://github.com/GOLinux) 校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://blog.linuxmint.com/?p=2626
[2]:http://blog.linuxmint.com/?p=2626
[3]:http://www.binarytides.com/install-nvidia-drivers-linux-mint-16/
[4]:http://www.dropbox.com/install?os=lnx
[5]:http://copy.com/?r=DSwtSd
[6]:http://launchpad.net/~paolorotolo/+archive/copy
[7]:http://www.linuxmint.com/searchengines.php
[8]:http://www.binarytides.com/optimize-fonts-linux-mint/
[9]:http://bugs.launchpad.net/ubuntu/+source/chromium-browser/+bug/1309508
[10]:http://www.linuxmint.com/download.php
[11]:http://community.linuxmint.com/tutorial
[12]:http://forums.linuxmint.com/

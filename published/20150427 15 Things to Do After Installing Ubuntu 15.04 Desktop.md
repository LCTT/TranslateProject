安装完Ubuntu 15.04桌面后要做的15件事
================================================================================
本教程适用于在自己的电脑上安装了　Ubuntu 15.04 “Vivid Vervet” 桌面的新手，这里会告诉你安装之后应该做哪些事情，来自定义你的系统和安装一些基本程序作为日常使用。

![Things to Do After Installing Ubuntu 15.04](http://www.tecmint.com/wp-content/uploads/2015/04/things-to-do-after-installing-ubuntu-15.04.jpeg)

*安装完Ubuntu 15.04桌面后要做的15件事*

### 1. 启用Ubuntu额外软件库并更新系统 ###

在刚装好Ubuntu之后你应该要关心的第一件事是启用Canonical的官方合作伙伴提供的Ubuntu额外软件库，并且通过最近一次的安全补丁和软件更新来保持系统是最新状态。

要完成这一步，依次从左边菜单中打开System Settings -> Software and Updates工具，并检查所有Ubuntu软件和其他软件库（Canonical 的合作伙伴所提供），点击关闭按钮并等待重新加载缓存源树。

![Software Updates](http://www.tecmint.com/wp-content/uploads/2015/04/Software-Updates.jpg)

*软件更新*

![Other Software (Canonical Partners)](http://www.tecmint.com/wp-content/uploads/2015/04/Other-Software.jpg)

*其它软件（Canonical 合作伙伴）*

为了快速而顺畅的更新，打开终端并输入以下命令来让系统使用新软件库：

    $ sudo apt-get update
    $ sudo apt-get upgrade

![Ubuntu Upgrade](http://www.tecmint.com/wp-content/uploads/2015/04/Ubuntu-Upgrade.jpg)

*Ubuntu 升级*

### 2. 安装额外驱动 ###

为了能让系统扫描并安装额外的硬件专有驱动，我们依然从System Settings打开Software and Updates工具，选择Additional Drivers标签并等待该工具扫描驱动。

如果有驱动匹配到了你的硬件，查看你想要安装的驱动并点击Apply按钮来安装它。如果专有驱动没有如预期的工作，用Revert按钮就能卸载它们或勾选Do not use the device后点击Apply按钮。

![Install Drivers in Ubuntu](http://www.tecmint.com/wp-content/uploads/2015/04/install-drivers.jpg)

*安装驱动*

### 3. 安装Synaptic和Gdebi工具 ###

除了Ubuntu Software Center之外，Synaptic也是一个apt的图形化工具，通过它你能管理、安装、卸载、搜索和升级软件库并配置软件包。同样的，Gdebi对本地的.deb 包也有类似功能。在终端上输入以下命令来安装这两个包：

    $ sudo apt-get install synaptic gdebi

![Install Synaptic and Gdebi](http://www.tecmint.com/wp-content/uploads/2015/04/install-synaptic-gdebi.jpg)

*安装 Synaptic 和 Gdebi*

![Synaptic Package Manager](http://www.tecmint.com/wp-content/uploads/2015/04/synaptic-package-manager.jpg)

*Synaptic 包管理器*

### 4. 更改系统外观和行为 ###

如果你想要更改桌面背景或图标大小，依次打开System Settings –> Appearance –> Look，并对桌面进行个性化设置。要把菜单移动到窗口标题栏，在Behavior标签中设置即可。

![System Appearances](http://www.tecmint.com/wp-content/uploads/2015/04/system-appearance.jpg)

*系统外观*

### 5. 提升系统安全性和隐私性 ###

![System Security Enhancement](http://www.tecmint.com/wp-content/uploads/2015/04/system-security-1.jpg)

*增强系统安全*

![System Security Options](http://www.tecmint.com/wp-content/uploads/2015/04/system-security-2.jpg)

*系统安全选项*

### 6. 禁用不需要开机自启动的应用程序 ###

要提高登录系统的速度，通过输入以下命令来显示被隐藏的开机启动应用程序。

    $ sudo sed -i  's/NoDisplay=true/NoDisplay=false/g' /etc/xdg/autostart/*.desktop

在Dash中搜索打开Startup Applications工具，并反选不需要在登录系统的过程中启动的程序。

![Disable Unwanted Applications](http://www.tecmint.com/wp-content/uploads/2015/04/disable-unwanted-applications.jpg)

*禁用不需要的应用程序*

### 7. 添加扩展多媒体支持 ###

默认情况下，Ubuntu对多媒体文件支持不是很好。为了能播放各种不同的多媒体格式或解析视频文件，可以安装以下多媒体应用程序：

- VLC
- Smplayer
- Audacious
- QMMP
- Mixxx
- XBMC
- Handbrake
- Openshot

用以下命令来一次性安装所有的这些应用程序：

    $ sudo apt-get install vlc smplayer audacious qmmp mixxx xbmc handbrake openshot

![Install Media Players](http://www.tecmint.com/wp-content/uploads/2015/04/install-media-players.jpg)

*安装媒体播放器*

![Media Player Playlist](http://www.tecmint.com/wp-content/uploads/2015/04/media-playllist.jpg)

*媒体播放器的播放列表*

除了多媒体播放器，安装ubuntu-restricted-extras和Java支持包也可以解码并支持其它受限制的多媒体格式。

    $ sudo apt-get install ubuntu-restricted-extras openjdk-8-jdk

![Install Ubuntu Extras](http://www.tecmint.com/wp-content/uploads/2015/04/install-ubuntu-extras.jpg)

*安装 Ubuntu Extras*

在终端上输入以下命令来启用DVD 回放和其它多媒体解码器：

    $ sudo apt-get install ffmpeg gstreamer0.10-plugins-bad lame libavcodec-extra
    $ sudo /usr/share/doc/libdvdread4/install-css.sh

![Enable Video Codes](http://www.tecmint.com/wp-content/uploads/2015/04/enable-video-playbacks.jpg)

*启用视频解码器*

### 8. 安装图像处理应用程序和安装媒体烧录软件 ###

如果你是一个摄影爱好者，想在Ubuntu上处理调整图像，或许需要安装一下图像处理程序：

- GIMP (一个 Adobe Photoshop 替代品)
- Darktable
- Rawtherapee
- Pinta
- Shotwell
- Inkscape (一个 Adobe Illustrator 替代品)
- Digikam
- Cheese

这些应用程序能从Ubuntu Software Center中安装，或者立刻在终端上使用以下命令：

    $ sudo apt-get install gimp gimp-plugin-registry gimp-data-extras darktable rawtherapee pinta shotwell inkscape

![Install Image Applications](http://www.tecmint.com/wp-content/uploads/2015/04/install-image-applications.jpg)

*安装图像处理应用程序*

![Rawtherapee Tool](http://www.tecmint.com/wp-content/uploads/2015/04/rawtherapee.jpg)

*Rawtherapee Tool*

如果要挂载ISO镜像或烧录一张CD或DVD，你可以选择并安装以下软件中的一款：

- Brasero Disk Burner
- K3b
- Xfburn
- Furius ISO Mount

    $ sudo apt-get install brasero
    $ sudo apt-get install k3b
    $ sudo apt-get install xfburn
    $ sudo apt-get install furiusisomount

![Install Media Burners](http://www.tecmint.com/wp-content/uploads/2015/04/install-media-burners.jpg)

*安装媒体烧录软件*

### 9. 安装压缩应用程序 ###

如果要处理大多数归档格式的文件(zip, tar.gz, zip, 7zip rar等等)，输入以下命令来安装这些包：

    $ sudo apt-get install unace unrar zip unzip p7zip-full p7zip-rar sharutils rar uudeview mpack arj cabextract file-roller

![Install Archive Applications](http://www.tecmint.com/wp-content/uploads/2015/04/install-archive-apps.jpg)

*安装压缩应用程序*

### 10. 安装聊天应用程序 ###

如果你想要和世界各地的人们聊天，这里有一份最流行的Linux聊天应用程序列表：

- Pidgin
- Skype
- Xchat
- Telegram
- aMSN
- Viber

你可以从Ubuntu Software Center中安装它们或使用以下命令：

    $ sudo apt-get install pidgin
    $ sudo apt-get install skype
    $ sudo apt-get install xchat
    $ sudo apt-get install amsn
    $ sudo add-apt-repository ppa:atareao/telegram -y
    $ sudo apt-get update
    $ sudo apt-get install telegram

![Install Chat Applications](http://www.tecmint.com/wp-content/uploads/2015/04/install-chat-apps.jpg)

*安装聊天应用程序*

想要在Ubuntu上安装Viber可以访问[Viber官方网站][1]下载Debian安装包到本地，并用Gdebi包管理工具来安装viber.deb应用程序(右击 –> 打开 -> GDebi Package Installer).

![Install Viber in Ubuntu](http://www.tecmint.com/wp-content/uploads/2015/04/install-viber.jpg)

*安装 Viber*

### 11. 安装种子软件 ###

在Ubuntu最流行的种子应用程序和P2P文件共享程序是：

- Deluge
- Transmission
- Qbittorrent
- LinuxDC++

想要在Ubuntu上安装你最喜欢的P2P文件共享应用程序，可以在终端上输入以下命令：

    $ sudo apt-get install deluge
    $ sudo apt-get install transmission
    $ sudo apt-get install qbittorrent
    $ sudo apt-get install linuxdcpp

![Install Torrent](http://www.tecmint.com/wp-content/uploads/2015/04/install-torrent.jpg)

*安装种子软件*

### 12. 安装Windows仿真器-Wine和游戏支持平台-Steam ###

Wine仿真器允许你在Linux上安装并运行Window应用程序。在另一方面，Steam是一款Valve开发的基于Linux系统的流行游戏平台。想要在你的机器上安装它们，可以输入以下命令或使用Ubuntu Software Center。

    $ sudo apt-get install steam wine winetricks

![Install Wine](http://www.tecmint.com/wp-content/uploads/2015/04/install-wine.jpg)

*安装 Wine*

### 13. 安装Cairo-Dock并启用桌面视觉效果 ###

Cairo-Dock是一款漂亮且灵巧的用于Linux桌面上的启动条，类似于Mac OS X dock。想要在Ubuntu上安装它，可以在终端上运行以下命令：

    $ sudo apt-get install cairo-dock cairo-dock-plug-ins 

![Install Cairo Dock](http://www.tecmint.com/wp-content/uploads/2015/04/install-cairo-dock.jpg)

*安装Cairo-Dock*

![Add Cairo Dock at Startup](http://www.tecmint.com/wp-content/uploads/2015/04/add-cairo-dock-startup.jpg)

*让 Cairo Dock 自动启动*

想要启用某一套桌面效果，例如Cube效果，可以使用以下命令来安装Compiz包：

    $ sudo apt-get install compiz compizconfig-settings-manager compiz-plugins-extra

想要激活桌面Cube效果，在Dash上查找ccsm来打开CompizConfig Settings Manager，找到General Options – > Desktop Size并设置Horizontal Virtual Size的值为4，Vertical Virtual Size的值为1。然后返回检查Desktop Cube框(禁用Desktop Wall)和Rotate Cube框(解决冲突 -> 禁止切换视图1)并Ctrl+Alt+鼠标左击来查看cube效果。

![Enable Compiz](http://www.tecmint.com/wp-content/uploads/2015/04/enable-compiz.jpg)

*启用Compiz*

![Compiz Settings](http://www.tecmint.com/wp-content/uploads/2015/04/compiz-settings.jpg)

*Compiz设置*

![Compiz Settings Addons](http://www.tecmint.com/wp-content/uploads/2015/04/compiz-settings-1.jpg)

*Compiz设置插件*

![Desktop Window Rotating](http://www.tecmint.com/wp-content/uploads/2015/04/desktop-cube.jpg)

*桌面窗口旋转*

### 14. 添加其它浏览器 ###

Ubuntu 15.04默认浏览器是Mozilla Firefox。想要安装其它浏览器比如Google Chrome或Opera，可以访问它们的官方网站，下载所提供的.deb包并用Gdebi Package Installer在你的系统上安装它们。

![Enable Browser Support](http://www.tecmint.com/wp-content/uploads/2015/04/enable-browser-support.jpg)

*启用浏览器支持*

![Opera Browser Support](http://www.tecmint.com/wp-content/uploads/2015/04/opera.jpg)

*Opera Browser*

想要安装Chromium开源浏览器请在终端上输入以下命令：

    $ sudo apt-get install chromium-browser

### 15. 安装Tweak工具 ###

想要用额外的应用程序来自定义Ubuntu吗？在终端上输入以下命令来安装Unity Tweak工具和Gnome Tweak工具：

    $ sudo apt-get install unity-tweak-tool gnome-tweak-tool

![Install Tweak Tool](http://www.tecmint.com/wp-content/uploads/2015/04/install-tweak-tool.jpg)

*安装Tweak Tool*

![Tweak Tool Settings](http://www.tecmint.com/wp-content/uploads/2015/04/tweak-settings.jpg)

*Tweak Tool 设置*

另一个有趣的tweak工具主要是Ubuntu Tweak包，可以通过访问官方网站来获取并安装： [http://ubuntu-tweak.com/][2]。

![Tweak Tool: System Information](http://www.tecmint.com/wp-content/uploads/2015/04/tweak-system-info.jpg)

*Tweak Tool: 系统信息*

在你安装好这一连串软件之后，你或许想要清理一下你的系统来释放一点硬盘上的空间，输入以下命令即可：

    $ sudo apt-get -y autoremove 
    $ sudo apt-get -y autoclean 
    $ sudo apt-get -y clean

这只是一些普通用户日常使用Ubuntu 15.04桌面是需要调整和安装的程序。想要了解更多高级的程序，特性和功能，请使用Ubuntu Software Center或查阅Ubuntu Wiki主页。

--------------------------------------------------------------------------------

via: http://www.tecmint.com/things-to-do-after-installing-ubuntu-15-04-desktop/

作者：[Matei Cezar][a]
译者：[ZTinoZ](https://github.com/ZTinoZ)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/cezarmatei/
[1]:http://www.viber.com/en/products/linux
[2]:http://ubuntu-tweak.com/

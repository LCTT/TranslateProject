75 个最常用的 Linux 应用程序（2018 年）
======

![](https://www.fossmint.com/wp-content/uploads/2018/07/Most-Used-Ubuntu-Applications.png)

对于许多应用程序来说，2018 年是非常好的一年，尤其是自由开源的应用程序。尽管各种 Linux 发行版都自带了很多默认的应用程序，但用户也可以自由地选择使用它们或者其它任何免费或付费替代方案。

下面汇总了[一系列的 Linux 应用程序][3]，这些应用程序都能够在 Linux 系统上安装，尽管还有很多其它选择。以下汇总中的任何应用程序都属于其类别中最常用的应用程序，如果你还没有用过，欢迎试用一下！

### 备份工具

#### Rsync

[Rsync][4] 是一个开源的、节约带宽的工具，它用于执行快速的增量文件传输，而且它也是一个免费工具。

```
$ rsync [OPTION...] SRC... [DEST]
```

想要了解更多示例和用法，可以参考《[10 个使用 Rsync 命令的实际例子][5]》。

#### Timeshift

[Timeshift][6] 能够通过增量快照来保护用户的系统数据，而且可以按照日期恢复指定的快照，类似于 Mac OS 中的 Time Machine 功能和 Windows 中的系统还原功能。

![](https://www.fossmint.com/wp-content/uploads/2018/07/Timeshift-Create-Linux-Mint-Snapshot.png)

### BT（BitTorrent） 客户端

![](https://www.fossmint.com/wp-content/uploads/2018/07/Linux-Torrent-Clients.png)

#### Deluge

[Deluge][7] 是一个漂亮的跨平台 BT 客户端，旨在优化 μTorrent 体验，并向用户免费提供服务。

使用以下命令在 Ubuntu 和 Debian 安装 Deluge。

```
$ sudo add-apt-repository ppa:deluge-team/ppa
$ sudo apt-get update
$ sudo apt-get install deluge
```

#### qBittorent

[qBittorent][8] 是一个开源的 BT 客户端，旨在提供类似 μTorrent 的免费替代方案。

使用以下命令在 Ubuntu 和 Debian 安装 qBittorent。

```
$ sudo add-apt-repository ppa:qbittorrent-team/qbittorrent-stable
$ sudo apt-get update
$ sudo apt-get install qbittorrent
```

#### Transmission

[Transmission][9] 是一个强大的 BT 客户端，它主要关注速度和易用性，一般在很多 Linux 发行版上都有预装。

使用以下命令在 Ubuntu 和 Debian 安装 Transmission。

```
$ sudo add-apt-repository ppa:transmissionbt/ppa
$ sudo apt-get update
$ sudo apt-get install transmission-gtk transmission-cli transmission-common transmission-daemon
```

### 云存储

![](https://www.fossmint.com/wp-content/uploads/2018/07/Linux-Cloud-Storage.png)

#### Dropbox

[Dropbox][10] 团队在今年早些时候给他们的云服务换了一个名字，也为客户提供了更好的性能和集成了更多应用程序。Dropbox 会向用户免费提供 2 GB 存储空间。

使用以下命令在 Ubuntu 和 Debian 安装 Dropbox。

```
$ cd ~ && wget -O - "https://www.dropbox.com/download?plat=lnx.x86" | tar xzf - [On 32-Bit]
$ cd ~ && wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf - [On 64-Bit]
$ ~/.dropbox-dist/dropboxd
```

#### Google Drive

[Google Drive][11] 是 Google 提供的云服务解决方案，这已经是一个广为人知的服务了。与 Dropbox 一样，可以通过它在所有联网的设备上同步文件。它免费提供了 15 GB 存储空间，包括Gmail、Google 图片、Google 地图等服务。

参考阅读：[5 个适用于 Linux 的 Google Drive 客户端][12]

#### Mega

[Mega][13] 也是一个出色的云存储解决方案，它的亮点除了高度的安全性之外，还有为用户免费提供高达 50 GB 的免费存储空间。它使用端到端加密，以确保用户的数据安全，所以如果忘记了恢复密钥，用户自己也无法访问到存储的数据。

参考阅读：[在 Ubuntu 下载 Mega 云存储客户端][14]

### 命令行编辑器

![](https://www.fossmint.com/wp-content/uploads/2018/07/Commandline-Editors.png)

#### Vim

[Vim][15] 是 vi 文本编辑器的开源克隆版本，它的主要目的是可以高度定制化并能够处理任何类型的文本。

使用以下命令在 Ubuntu 和 Debian 安装 Vim。

```
$ sudo add-apt-repository ppa:jonathonf/vim
$ sudo apt update
$ sudo apt install vim
```

#### Emacs

[Emacs][16] 是一个高度可配置的文本编辑器，最流行的一个分支 GNU Emacs 是用 Lisp 和 C 编写的，它的最大特点是可以自文档化、可扩展和可自定义。

使用以下命令在 Ubuntu 和 Debian 安装 Emacs。

```
$ sudo add-apt-repository ppa:kelleyk/emacs
$ sudo apt update
$ sudo apt install emacs25
```

#### Nano

[Nano][17] 是一款功能丰富的命令行文本编辑器，比较适合高级用户。它可以通过多个终端进行不同功能的操作。

使用以下命令在 Ubuntu 和 Debian 安装 Nano。

```
$ sudo add-apt-repository ppa:n-muench/programs-ppa
$ sudo apt-get update
$ sudo apt-get install nano
```

### 下载器

![](https://www.fossmint.com/wp-content/uploads/2018/07/Linux-Download-Managers.png)

#### Aria2

[Aria2][18] 是一个开源的、轻量级的、多软件源和多协议的命令行下载器，它支持 Metalink、torrent、HTTP/HTTPS、SFTP 等多种协议。

使用以下命令在 Ubuntu 和 Debian 安装 Aria2。

```
$ sudo apt-get install aria2
```

#### uGet

[uGet][19] 已经成为 Linux 各种发行版中排名第一的开源下载器，它可以处理任何下载任务，包括多连接、队列、类目等。

使用以下命令在 Ubuntu 和 Debian 安装 uGet。

```
$ sudo add-apt-repository ppa:plushuang-tw/uget-stable
$ sudo apt update
$ sudo apt install uget
```

#### XDM

[XDM][20]（Xtreme Download Manager）是一个使用 Java 编写的开源下载软件。和其它下载器一样，它可以结合队列、种子、浏览器使用，而且还带有视频采集器和智能调度器。

使用以下命令在 Ubuntu 和 Debian 安装 XDM。

```
$ sudo add-apt-repository ppa:noobslab/apps
$ sudo apt-get update
$ sudo apt-get install xdman
```

### 电子邮件客户端

![](https://www.fossmint.com/wp-content/uploads/2018/07/Linux-Email-Clients.png)

#### Thunderbird

[Thunderbird][21] 是最受欢迎的电子邮件客户端之一。它的优点包括免费、开源、可定制、功能丰富，而且最重要的是安装过程也很简便。

使用以下命令在 Ubuntu 和 Debian 安装 Thunderbird。

```
$ sudo add-apt-repository ppa:ubuntu-mozilla-security/ppa
$ sudo apt-get update
$ sudo apt-get install thunderbird
```

#### Geary

[Geary][22] 是一个基于 WebKitGTK+ 的开源电子邮件客户端。它是一个免费开源的功能丰富的软件，并被 GNOME 项目收录。

使用以下命令在 Ubuntu 和 Debian 安装 Geary。

```
$ sudo add-apt-repository ppa:geary-team/releases
$ sudo apt-get update
$ sudo apt-get install geary
```

#### Evolution

[Evolution][23] 是一个免费开源的电子邮件客户端，可以用于电子邮件、会议日程、备忘录和联系人的管理。

使用以下命令在 Ubuntu 和 Debian 安装 Evolution。

```
$ sudo add-apt-repository ppa:gnome3-team/gnome3-staging
$ sudo apt-get update
$ sudo apt-get install evolution
```

### 财务软件

![](https://www.fossmint.com/wp-content/uploads/2018/07/Linux-Accounting-Software.png)

#### GnuCash

[GnuCash][24] 是一款免费的跨平台开源软件，它适用于个人和中小型企业的财务任务。

使用以下命令在 Ubuntu 和 Debian 安装 GnuCash。

```
$ sudo sh -c 'echo "deb http://archive.getdeb.net/ubuntu $(lsb_release -sc)-getdeb apps" >> /etc/apt/sources.list.d/getdeb.list'
$ sudo apt-get update
$ sudo apt-get install gnucash
```

#### KMyMoney

[KMyMoney][25] 是一个财务管理软件，它可以提供商用或个人理财所需的大部分主要功能。

使用以下命令在 Ubuntu 和 Debian 安装 KmyMoney。

```
$ sudo add-apt-repository ppa:claydoh/kmymoney2-kde4
$ sudo apt-get update
$ sudo apt-get install kmymoney
```

### IDE

![](https://www.fossmint.com/wp-content/uploads/2018/07/Linux-IDE-Editors.png)

#### Eclipse IDE

[Eclipse][26] 是最广为使用的 Java IDE，它包括一个基本工作空间和一个用于自定义编程环境的强大的的插件配置系统。

关于 Eclipse IDE 的安装，可以参考 [如何在 Debian 和 Ubuntu 上安装 Eclipse IDE][27] 这一篇文章。

#### Netbeans IDE

[Netbeans][28] 是一个相当受用户欢迎的 IDE，它支持使用 Java、PHP、HTML 5、JavaScript、C/C++ 或其他语言编写移动应用，桌面软件和 web 应用。

关于 Netbeans IDE 的安装，可以参考 [如何在 Debian 和 Ubuntu 上安装 Netbeans IDE][29] 这一篇文章。

#### Brackets

[Brackets][30] 是由 Adobe 开发的高级文本编辑器，它带有可视化工具，支持预处理程序，以及用于 web 开发的以设计为中心的用户流程。对于熟悉它的用户，它可以发挥 IDE 的作用。

使用以下命令在 Ubuntu 和 Debian 安装 Brackets。

```
$ sudo add-apt-repository ppa:webupd8team/brackets
$ sudo apt-get update
$ sudo apt-get install brackets
```

#### Atom IDE

[Atom IDE][31] 是一个加强版的 Atom 编辑器，它添加了大量扩展和库以提高性能和增加功能。总之，它是各方面都变得更强大了的 Atom 。

使用以下命令在 Ubuntu 和 Debian 安装 Atom。

```
$ sudo apt-get install snapd
$ sudo snap install atom --classic
```

#### Light Table

[Light Table][32] 号称下一代的 IDE，它提供了数据流量统计和协作编程等的强大功能。

使用以下命令在 Ubuntu 和 Debian 安装 Light Table。

```
$ sudo add-apt-repository ppa:dr-akulavich/lighttable
$ sudo apt-get update
$ sudo apt-get install lighttable-installer
```

#### Visual Studio Code

[Visual Studio Code][33] 是由微软开发的代码编辑器，它包含了文本编辑器所需要的最先进的功能，包括语法高亮、自动完成、代码调试、性能统计和图表显示等功能。

参考阅读：[在Ubuntu 下载 Visual Studio Code][34]

### 即时通信工具

![](https://www.fossmint.com/wp-content/uploads/2018/07/Linux-IM-Clients.png)

#### Pidgin

[Pidgin][35] 是一个开源的即时通信工具，它几乎支持所有聊天平台，还支持额外扩展功能。

使用以下命令在 Ubuntu 和 Debian 安装 Pidgin。

```
$ sudo add-apt-repository ppa:jonathonf/backports
$ sudo apt-get update
$ sudo apt-get install pidgin
```

#### Skype

[Skype][36] 也是一个广为人知的软件了，任何感兴趣的用户都可以在 Linux 上使用。

使用以下命令在 Ubuntu 和 Debian 安装 Skype。

```
$ sudo apt install snapd
$ sudo snap install skype --classic
```

#### Empathy

[Empathy][37] 是一个支持多协议语音、视频聊天、文本和文件传输的即时通信工具。它还允许用户添加多个服务的帐户，并用其与所有服务的帐户进行交互。

使用以下命令在 Ubuntu 和 Debian 安装 Empathy。

```
$ sudo apt-get install empathy
```

### Linux 防病毒工具

#### ClamAV/ClamTk

[ClamAV][38] 是一个开源的跨平台命令行防病毒工具，用于检测木马、病毒和其他恶意代码。而 [ClamTk][39] 则是它的前端 GUI。

使用以下命令在 Ubuntu 和 Debian 安装 ClamAV 和 ClamTk。

```
$ sudo apt-get install clamav
$ sudo apt-get install clamtk
```

### Linux 桌面环境

#### Cinnamon

[Cinnamon][40] 是 GNOME 3 的自由开源衍生产品，它遵循传统的 <ruby>桌面比拟<rt>desktop metaphor</rt></ruby> 约定。

使用以下命令在 Ubuntu 和 Debian 安装 Cinnamon。

```
$ sudo add-apt-repository ppa:embrosyn/cinnamon
$ sudo apt update
$ sudo apt install cinnamon-desktop-environment lightdm
```

#### Mate

[Mate][41] 桌面环境是 GNOME 2 的衍生和延续，目的是在 Linux 上通过使用传统的桌面比拟提供有一个吸引力的 UI。

使用以下命令在 Ubuntu 和 Debian 安装 Mate。

```
$ sudo apt install tasksel
$ sudo apt update
$ sudo tasksel install ubuntu-mate-desktop
```

#### GNOME

[GNOME][42] 是由一些免费和开源应用程序组成的桌面环境，它可以运行在任何 Linux 发行版和大多数 BSD 衍生版本上。

使用以下命令在 Ubuntu 和 Debian 安装 Gnome。

```
$ sudo apt install tasksel
$ sudo apt update
$ sudo tasksel install ubuntu-desktop
```

#### KDE

[KDE][43] 由 KDE 社区开发，它为用户提供图形解决方案以控制操作系统并执行不同的计算任务。

使用以下命令在 Ubuntu 和 Debian 安装 KDE。

```
$ sudo apt install tasksel
$ sudo apt update
$ sudo tasksel install kubuntu-desktop
```

### Linux 维护工具

#### GNOME Tweak Tool

[GNOME Tweak Tool][44] 是用于自定义和调整 GNOME 3 和 GNOME Shell 设置的流行工具。

使用以下命令在 Ubuntu 和 Debian 安装 GNOME Tweak Tool。

```
$ sudo apt install gnome-tweak-tool
```

#### Stacer

[Stacer][45] 是一款用于监控和优化 Linux 系统的免费开源应用程序。

使用以下命令在 Ubuntu 和 Debian 安装 Stacer。

```
$ sudo add-apt-repository ppa:oguzhaninan/stacer
$ sudo apt-get update
$ sudo apt-get install stacer
```

#### BleachBit

[BleachBit][46] 是一个免费的磁盘空间清理器，它也可用作隐私管理器和系统优化器。

参考阅读：[在 Ubuntu 下载 BleachBit][47]

### Linux 终端工具

#### GNOME 终端

[GNOME 终端][48] 是 GNOME 的默认终端模拟器。

使用以下命令在 Ubuntu 和 Debian 安装 Gnome 终端。

```
$ sudo apt-get install gnome-terminal
```

#### Konsole

[Konsole][49] 是 KDE 的一个终端模拟器。

使用以下命令在 Ubuntu 和 Debian 安装 Konsole。

```
$ sudo apt-get install konsole
```

#### Terminator

[Terminator][50] 是一个功能丰富的终端程序，它基于 GNOME 终端，并且专注于整理终端功能。

使用以下命令在 Ubuntu 和 Debian 安装 Terminator。

```
$ sudo apt-get install terminator
```

#### Guake

[Guake][51] 是 GNOME 桌面环境下一个轻量级的可下拉式终端。

使用以下命令在 Ubuntu 和 Debian 安装 Guake。

```
$ sudo apt-get install guake
```

### 多媒体编辑工具

#### Ardour

[Ardour][52] 是一款漂亮的的<ruby>数字音频工作站<rt>Digital Audio Workstation</rt></ruby>，可以完成专业的录制、编辑和混音工作。

使用以下命令在 Ubuntu 和 Debian 安装 Ardour。

```
$ sudo add-apt-repository ppa:dobey/audiotools
$ sudo apt-get update
$ sudo apt-get install ardour
```

#### Audacity

[Audacity][53] 是最著名的音频编辑软件之一，它是一款跨平台的开源多轨音频编辑器。

使用以下命令在 Ubuntu 和 Debian 安装 Audacity。

```
$ sudo add-apt-repository ppa:ubuntuhandbook1/audacity
$ sudo apt-get update
$ sudo apt-get install audacity
```

#### GIMP

[GIMP][54] 是 Photoshop 的开源替代品中最受欢迎的。这是因为它有多种可自定义的选项、第三方插件以及活跃的用户社区。

使用以下命令在 Ubuntu 和 Debian 安装 Gimp。

```
$ sudo add-apt-repository ppa:otto-kesselgulasch/gimp
$ sudo apt update
$ sudo apt install gimp
```

#### Krita

[Krita][55] 是一款开源的绘画程序，它具有美观的 UI 和可靠的性能，也可以用作图像处理工具。

使用以下命令在 Ubuntu 和 Debian 安装 Krita。

```
$ sudo add-apt-repository ppa:kritalime/ppa
$ sudo apt update
$ sudo apt install krita
```

#### Lightworks

[Lightworks][56] 是一款功能强大、灵活美观的专业视频编辑工具。它拥有上百种配套的视觉效果功能，可以处理任何编辑任务，毕竟这个软件已经有长达 25 年的视频处理经验。

参考阅读：[在 Ubuntu 下载 Lightworks][57]

#### OpenShot

[OpenShot][58] 是一款屡获殊荣的免费开源视频编辑器，这主要得益于其出色的性能和强大的功能。

使用以下命令在 Ubuntu 和 Debian 安装 `Openshot。

```
$ sudo add-apt-repository ppa:openshot.developers/ppa
$ sudo apt update
$ sudo apt install openshot-qt
```

#### PiTiV

[Pitivi][59] 也是一个美观的视频编辑器，它有优美的代码库、优质的社区，还支持优秀的协作编辑功能。

使用以下命令在 Ubuntu 和 Debian 安装 PiTiV。

```
$ flatpak install --user https://flathub.org/repo/appstream/org.pitivi.Pitivi.flatpakref
$ flatpak install --user http://flatpak.pitivi.org/pitivi.flatpakref
$ flatpak run org.pitivi.Pitivi//stable
```

### 音乐播放器

#### Rhythmbox

[Rhythmbox][60] 支持海量种类的音乐，目前被认为是最可靠的音乐播放器，并由 Ubuntu 自带。

使用以下命令在 Ubuntu 和 Debian 安装 Rhythmbox。

```
$ sudo add-apt-repository ppa:fossfreedom/rhythmbox
$ sudo apt-get update
$ sudo apt-get install rhythmbox
```

#### Lollypop

[Lollypop][61] 是一款较为年轻的开源音乐播放器，它有很多高级选项，包括网络电台，滑动播放和派对模式。尽管功能繁多，它仍然尽量做到简单易管理。

使用以下命令在 Ubuntu 和 Debian 安装 Lollypop。

```
$ sudo add-apt-repository ppa:gnumdk/lollypop
$ sudo apt-get update
$ sudo apt-get install lollypop
```

#### Amarok

[Amarok][62] 是一款功能强大的音乐播放器，它有一个直观的 UI 和大量的高级功能，而且允许用户根据自己的偏好去发现新音乐。

使用以下命令在 Ubuntu 和 Debian 安装 Amarok。

```
$ sudo apt-get update
$ sudo apt-get install amarok

```

#### Clementine

[Clementine][63] 是一款 Amarok 风格的音乐播放器，因此和 Amarok 相似，也有直观的用户界面、先进的控制模块，以及让用户搜索和发现新音乐的功能。

使用以下命令在 Ubuntu 和 Debian 安装 Clementine。

```
$ sudo add-apt-repository ppa:me-davidsansome/clementine
$ sudo apt-get update
$ sudo apt-get install clementine
```

#### Cmus

[Cmus][64] 可以说是最高效的的命令行界面音乐播放器了，它具有快速可靠的特点，也支持使用扩展。

使用以下命令在 Ubuntu 和 Debian 安装 Cmus。

```
$ sudo add-apt-repository ppa:jmuc/cmus
$ sudo apt-get update
$ sudo apt-get install cmus
```

### 办公软件

#### Calligra 套件

[Calligra 套件][65]为用户提供了一套总共 8 个应用程序，涵盖办公、管理、图表等各个范畴。

使用以下命令在 Ubuntu 和 Debian 安装 Calligra 套件。

```
$ sudo apt-get install calligra
```

#### LibreOffice

[LibreOffice][66] 是开源社区中开发过程最活跃的办公套件，它以可靠性著称，也可以通过扩展来添加功能。

使用以下命令在 Ubuntu 和 Debian 安装 LibreOffice。

```
$ sudo add-apt-repository ppa:libreoffice/ppa
$ sudo apt update
$ sudo apt install libreoffice
```

#### WPS Office

[WPS Office][67] 是一款漂亮的办公套件，它有一个很具现代感的 UI。

参考阅读：[在 Ubuntu 安装 WPS Office][68]

### 屏幕截图工具

#### Shutter

[Shutter][69] 允许用户截取桌面的屏幕截图，然后使用一些效果进行编辑，还支持上传和在线共享。

使用以下命令在 Ubuntu 和 Debian 安装 Shutter。

```
$ sudo add-apt-repository -y ppa:shutter/ppa
$ sudo apt update
$ sudo apt install shutter
```

#### Kazam

[Kazam][70] 可以用于捕获屏幕截图，它的输出对于任何支持 VP8/WebM 和 PulseAudio 视频播放器都可用。

使用以下命令在 Ubuntu 和 Debian 安装 Kazam。

```
$ sudo add-apt-repository ppa:kazam-team/unstable-series
$ sudo apt update
$ sudo apt install kazam python3-cairo python3-xlib
```

#### Gnome Screenshot

[Gnome Screenshot][71] 过去曾经和 Gnome 一起捆绑，但现在已经独立出来。它以易于共享的格式进行截屏。

使用以下命令在 Ubuntu 和 Debian 安装 Gnome Screenshot。

```
$ sudo apt-get update
$ sudo apt-get install gnome-screenshot
```

### 录屏工具

#### SimpleScreenRecorder

[SimpleScreenRecorder][72] 面世时已经是录屏工具中的佼佼者，现在已成为 Linux 各个发行版中最有效、最易用的录屏工具之一。

使用以下命令在 Ubuntu 和 Debian 安装 SimpleScreenRecorder。

```
$ sudo add-apt-repository ppa:maarten-baert/simplescreenrecorder
$ sudo apt-get update
$ sudo apt-get install simplescreenrecorder
```

#### recordMyDesktop

[recordMyDesktop][73] 是一个开源的会话记录器，它也能记录桌面会话的音频。

使用以下命令在 Ubuntu 和 Debian 安装 recordMyDesktop。

```
$ sudo apt-get update
$ sudo apt-get install gtk-recordmydesktop
```

### 文本编辑器

#### Atom

[Atom][74] 是由 GitHub 开发和维护的可定制文本编辑器。它是开箱即用的，但也可以使用扩展和主题自定义 UI 来增强其功能。

使用以下命令在 Ubuntu 和 Debian 安装 Atom。

```
$ sudo apt-get install snapd
$ sudo snap install atom --classic
```

#### Sublime Text

[Sublime Text][75] 已经成为目前最棒的文本编辑器。它可定制、轻量灵活（即使打开了大量数据文件和加入了大量扩展），最重要的是可以永久免费使用。

使用以下命令在 Ubuntu 和 Debian 安装 Sublime Text。

```
$ sudo apt-get install snapd
$ sudo snap install sublime-text
```

#### Geany

[Geany][76] 是一个内存友好的文本编辑器，它具有基本的IDE功能，可以显示加载时间、扩展库函数等。

使用以下命令在 Ubuntu 和 Debian 安装 Geany。

```
$ sudo apt-get update
$ sudo apt-get install geany
```

#### Gedit

[Gedit][77] 以其简单著称，在很多 Linux 发行版都有预装，它具有文本编辑器都具有的优秀的功能。

使用以下命令在 Ubuntu 和 Debian 安装 Gedit。

```
$ sudo apt-get update
$ sudo apt-get install gedit
```

### 备忘录软件

#### Evernote

[Evernote][78] 是一款云上的笔记程序，它带有待办列表和提醒功能，能够与不同类型的笔记完美配合。

Evernote 在 Linux 上没有官方提供的软件，但可以参考 [Linux 上的 6 个 Evernote 替代客户端][79] 这篇文章使用其它第三方工具。

#### Everdo

[Everdo][78] 是一款美观，安全，易兼容的备忘软件，可以用于处理待办事项和其它笔记。如果你认为 Evernote 有所不足，相信 Everdo 会是一个好的替代。

参考阅读：[在 Ubuntu 下载 Everdo][80]

#### Taskwarrior

[Taskwarrior][81] 是一个用于管理个人任务的开源跨平台命令行应用，它的速度和无干扰的环境是它的两大特点。

使用以下命令在 Ubuntu 和 Debian 安装 Taskwarrior。

```
$ sudo apt-get update
$ sudo apt-get install taskwarrior
```

### 视频播放器

#### Banshee

[Banshee][82] 是一个开源的支持多格式的媒体播放器，于 2005 年开始开发并逐渐成长。

使用以下命令在 Ubuntu 和 Debian 安装 Banshee。

```
$ sudo add-apt-repository ppa:banshee-team/ppa
$ sudo apt-get update
$ sudo apt-get install banshee
```

#### VLC

[VLC][83] 是我最喜欢的视频播放器，它几乎可以播放任何格式的音频和视频，它还可以播放网络电台、录制桌面会话以及在线播放电影。

使用以下命令在 Ubuntu 和 Debian 安装 VLC。

```
$ sudo add-apt-repository ppa:videolan/stable-daily
$ sudo apt-get update
$ sudo apt-get install vlc
```

#### Kodi

[Kodi][84] 是世界上最着名的媒体播放器之一，它有一个成熟的媒体中心，可以播放本地和远程的多媒体文件。

使用以下命令在 Ubuntu 和 Debian 安装 Kodi。

```
$ sudo apt-get install software-properties-common
$ sudo add-apt-repository ppa:team-xbmc/ppa
$ sudo apt-get update
$ sudo apt-get install kodi
```

#### SMPlayer

[SMPlayer][85] 是 MPlayer 的 GUI 版本，所有流行的媒体格式它都能够处理，并且它还有从 YouTube 和 Chromcast 和下载字幕的功能。

使用以下命令在 Ubuntu 和 Debian 安装 SMPlayer。

```
$ sudo add-apt-repository ppa:rvm/smplayer
$ sudo apt-get update
$ sudo apt-get install smplayer
```

### 虚拟化工具

#### VirtualBox

[VirtualBox][86] 是一个用于操作系统虚拟化的开源应用程序，在服务器、台式机和嵌入式系统上都可以运行。

使用以下命令在 Ubuntu 和 Debian 安装 VirtualBox。

```
$ wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
$ wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add -
$ sudo apt-get update
$ sudo apt-get install virtualbox-5.2
$ virtualbox
```

#### VMWare

[VMware][87] 是一个为客户提供平台虚拟化和云计算服务的数字工作区，是第一个成功将 x86 架构系统虚拟化的工作站。 VMware 工作站的其中一个产品就允许用户在虚拟内存中运行多个操作系统。

参阅 [在 Ubuntu 上安装 VMWare Workstation Pro][88] 可以了解 VMWare 的安装。

### 浏览器

#### Chrome

[Google Chrome][89] 无疑是最受欢迎的浏览器。Chrome 以其速度、简洁、安全、美观而受人喜爱，它遵循了 Google 的界面设计风格，是 web 开发人员不可缺少的浏览器，同时它也是免费开源的。

使用以下命令在 Ubuntu 和 Debian 安装 Google Chrome。

```
$ wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
$ sudo sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
$ sudo apt-get update
$ sudo apt-get install google-chrome-stable
```

#### Firefox

[Firefox Quantum][90] 是一款漂亮、快速、完善并且可自定义的浏览器。它也是自由开源的，包含有开发人员所需要的工具，对于初学者也没有任何使用门槛。

使用以下命令在 Ubuntu 和 Debian 安装 Firefox Quantum。

```
$ sudo add-apt-repository ppa:mozillateam/firefox-next
$ sudo apt update && sudo apt upgrade
$ sudo apt install firefox
```

#### Vivaldi

[Vivaldi][91] 是一个基于 Chrome 的自由开源项目，旨在通过添加扩展来使 Chrome 的功能更加完善。色彩丰富的界面，性能良好、灵活性强是它的几大特点。

参考阅读：[在 Ubuntu 下载 Vivaldi][91]

以上就是我的推荐，你还有更好的软件向大家分享吗？欢迎评论。

--------------------------------------------------------------------------------

via: https://www.fossmint.com/most-used-linux-applications/

作者：[Martins D. Okoi][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[HankChow](https://github.com/HankChow)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.fossmint.com/author/dillivine/
[1]:https://plus.google.com/share?url=https://www.fossmint.com/most-used-linux-applications/ "Share on Google+"
[2]:https://www.linkedin.com/shareArticle?mini=true&url=https://www.fossmint.com/most-used-linux-applications/ "Share on LinkedIn"
[3]:https://www.fossmint.com/awesome-linux-software/
[4]:https://rsync.samba.org/
[5]:https://www.tecmint.com/rsync-local-remote-file-synchronization-commands/
[6]:https://github.com/teejee2008/timeshift
[7]:https://deluge-torrent.org/
[8]:https://www.qbittorrent.org/
[9]:https://transmissionbt.com/
[10]:https://www.dropbox.com/
[11]:https://www.google.com/drive/
[12]:https://www.fossmint.com/best-google-drive-clients-for-linux/
[13]:https://mega.nz/
[14]:https://mega.nz/sync!linux
[15]:https://www.vim.org/
[16]:https://www.gnu.org/s/emacs/
[17]:https://www.nano-editor.org/
[18]:https://aria2.github.io/
[19]:http://ugetdm.com/
[20]:http://xdman.sourceforge.net/
[21]:https://www.thunderbird.net/
[22]:https://github.com/GNOME/geary
[23]:https://github.com/GNOME/evolution
[24]:https://www.gnucash.org/
[25]:https://kmymoney.org/
[26]:https://www.eclipse.org/ide/
[27]:https://www.tecmint.com/install-eclipse-oxygen-ide-in-ubuntu-debian/
[28]:https://netbeans.org/
[29]:https://www.tecmint.com/install-netbeans-ide-in-ubuntu-debian-linux-mint/
[30]:http://brackets.io/
[31]:https://ide.atom.io/
[32]:http://lighttable.com/
[33]:https://code.visualstudio.com/
[34]:https://code.visualstudio.com/download
[35]:https://www.pidgin.im/
[36]:https://www.skype.com/
[37]:https://wiki.gnome.org/Apps/Empathy
[38]:https://www.clamav.net/
[39]:https://dave-theunsub.github.io/clamtk/
[40]:https://github.com/linuxmint/cinnamon-desktop
[41]:https://mate-desktop.org/
[42]:https://www.gnome.org/
[43]:https://www.kde.org/plasma-desktop
[44]:https://github.com/nzjrs/gnome-tweak-tool
[45]:https://github.com/oguzhaninan/Stacer
[46]:https://www.bleachbit.org/
[47]:https://www.bleachbit.org/download
[48]:https://github.com/GNOME/gnome-terminal
[49]:https://konsole.kde.org/
[50]:https://gnometerminator.blogspot.com/p/introduction.html
[51]:http://guake-project.org/
[52]:https://ardour.org/
[53]:https://www.audacityteam.org/
[54]:https://www.gimp.org/
[55]:https://krita.org/en/
[56]:https://www.lwks.com/
[57]:https://www.lwks.com/index.php?option=com_lwks&view=download&Itemid=206
[58]:https://www.openshot.org/
[59]:http://www.pitivi.org/
[60]:https://wiki.gnome.org/Apps/Rhythmbox
[61]:https://gnumdk.github.io/lollypop-web/
[62]:https://amarok.kde.org/en
[63]:https://www.clementine-player.org/
[64]:https://cmus.github.io/
[65]:https://www.calligra.org/tour/calligra-suite/
[66]:https://www.libreoffice.org/
[67]:https://www.wps.com/
[68]:http://wps-community.org/downloads
[69]:http://shutter-project.org/
[70]:https://launchpad.net/kazam
[71]:https://gitlab.gnome.org/GNOME/gnome-screenshot
[72]:http://www.maartenbaert.be/simplescreenrecorder/
[73]:http://recordmydesktop.sourceforge.net/about.php
[74]:https://atom.io/
[75]:https://www.sublimetext.com/
[76]:https://www.geany.org/
[77]:https://wiki.gnome.org/Apps/Gedit
[78]:https://everdo.net/
[79]:https://www.fossmint.com/evernote-alternatives-for-linux/
[80]:https://everdo.net/linux/
[81]:https://taskwarrior.org/
[82]:http://banshee.fm/
[83]:https://www.videolan.org/
[84]:https://kodi.tv/
[85]:https://www.smplayer.info/
[86]:https://www.virtualbox.org/wiki/VirtualBox
[87]:https://www.vmware.com/
[88]:https://www.tecmint.com/install-vmware-workstation-in-linux/
[89]:https://www.google.com/chrome/
[90]:https://www.mozilla.org/en-US/firefox/
[91]:https://vivaldi.com/


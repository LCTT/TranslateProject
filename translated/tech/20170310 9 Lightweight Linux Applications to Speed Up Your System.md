9 个提高系统运行速度的轻量级 Linux 应用
======
**简介:** [加速 Ubuntu ][1]有很多方法，众多办法之一是使用轻量级应用来替代一些常用应用程序。可以查看之前发布的一篇文章[ Linux 必备的应用程序][2]。我们将分享这些应用程序在 Ubuntu 或其他 Linux 发行版的轻量级替代方案。

![在 ubunt 使用轻量级应用程序替代方案][4]

## 9 个常用 Linux 应用程序的轻量级替代方案

你的 Linux 系统很慢吗？应用程序是不是很久才能打开？你最好的选择是使用[轻量级的 Linux 系统][5]。但是重装系统并非总是可行，不是吗?

所以如果你想坚持使用你现在用的 Linux 发行版，但是想要提高性能，你应该使用更轻量级应用来替代你一些常用的应用。这篇文章会列出各种 Linux 应用程序的轻量级替代方案。

由于我使用的是 Ubuntu，因此我只提供了基于 Ubuntu 的 Linux 发行版的安装说明。但是这些应用程序可以用于几乎所有其他 Linux 发行版。你只需去找这些轻量级应用在你的 Linux 发行版中的安装方法就可以了。

### 1. Midori: Web 浏览器

Midori 是与现代互联网环境具有良好兼容性的最轻量级网页浏览器之一。它是开源的，使用与 Google Chrome 最初构建的相同的渲染引擎引擎 - WebKit。并且超快速，最小化但高度可定制。

![Midori Browser][6]

Midori 浏览器有很多可以定制的扩展和选项。如果你有最高权限，使用这个浏览器也是一个不错的选择。如果在浏览网页的时候遇到了某些问题，请查看其网站上[常见问题][7]部分 -- 这包含了你可能遇到的常见问题及其解决方案。

[Midori][8]

#### 在基于 Ubuntu 的发行版上安装 Midori

在 Ubuntu 上，可通过官方源找到Midori 。运行以下指令即可安装它：

```
 sudo apt install midori
```


### 2. Trojita：电子邮件客户端

Trojita 是一款开源强大的 IMAP 电子邮件客户端。它速度快，资源效率高。我可以肯定地称它是 [Linux 最好的电子邮件客户端之一][9]。如果你只需在电子邮件客户端上提供 IMAP 支持，那么也许你不用再往更深一层去考虑了。

![Trojitá][10]

Trojita 使用各种技术 - 按需电子邮件加载，离线缓存，带宽节省模式等 -- 以实现其令人印象深刻的性能。

[Trojita][11]

#### 在基于 Ubuntu 的发行版上安装 Trojita

Trojita 目前没有针对 Ubuntu 的官方 PPA 。但这应该不成问题。您可以使用以下命令轻松安装它:

```
sudo sh -c "echo 'deb http://download.opensuse.org/repositories/home:/jkt-gentoo:/trojita/xUbuntu_16.04/ /' > /etc/apt/sources.list.d/trojita.list"
wget http://download.opensuse.org/repositories/home:jkt-gentoo:trojita/xUbuntu_16.04/Release.key
sudo apt-key add - < Release.key
sudo apt update
sudo apt install trojita
```

### 3. GDebi：包安装程序

有时您需要快速安装 DEB 软件包。Ubuntu 软件中心是一个消耗资源严重的应用程序，仅用于安装 .deb 文件并不明智。

Gdebi 无疑是一款可以完成同样目的的漂亮工具，而它只需最小化的图形界面。

![GDebi][12]

GDebi 是完全轻量级的，完美无缺地完成了它的工作。你甚至应该[让 Gdebi 成为 DEB 文件的默认安装程序][13]。

#### 在基于Ubuntu的发行版上安装GDebi

只需一行指令，你便可以在 Ubuntu 上安装 GDebi：

```
sudo apt install gdebi
```

### 4. App Grid：软件中心

如果您经常在 Ubuntu 上使用软件中心搜索，安装和管理应用程序，则 App Grid 是必备的应用程序。它是默认的 Ubuntu 软件中心最具视觉吸引力且速度最快的替代方案。

![App Grid][14]

App Grid 支持应用程序的评分，评论和屏幕截图。

[App Grid][15]

#### 在基于 Ubuntu 的发行版上安装 App Grid

App Grid 拥有 Ubuntu 的官方 PPA。使用以下指令安装 App Grid：

```
sudo add-apt-repository ppa:appgrid/stable
sudo apt update
sudo apt install appgrid
```

### 5. Yarock：音乐播放器

Yarock 是一个优雅的音乐播放器，拥有现代而最轻量级的用户界面。尽管在设计上是轻量级的，但 Yarock 有一个全面的高级功能列表。

![Yarock][16]

Yarock 的主要功能包括多种音乐收藏、评级、智能播放列表、多种后端选项、桌面通知、音乐剪辑、上下文获取等。

[Yarock][17]

### 在基于 Ubuntu 的发行版上安装 Yarock

您得通过PPA使用以下指令在 Ubuntu上 安装 Yarock：

```
sudo add-apt-repository ppa:nilarimogard/webupd8
sudo apt update
sudo apt install yarock
```

### 6. VLC：视频播放器

谁不需要视频播放器？谁还从未听说过 VLC？我想并不需要对它做任何介绍。

![VLC][18]

VLC 能满足你在 Ubuntu 上播放各种媒体文件的全部需求，而且他非常轻便。它甚至可以再非常旧的 PC 上完美运行。

[VLC][19]

#### 在基于 Ubuntu 的发行版上安装 VLC 

VLC 为 Ubuntu 提供官方PPA。可以输入以下命令来安装它：

```
sudo apt install vlc
```

### 7. PCManFM：文件管理器

PCManFM 是 LXDE 的标准文件管理器。与 LXDE 的其他应用程序一样，它也是轻量级的。如果您正在为文件管理器寻找更轻量级的替代品，可以尝试使用这个应用。

![PCManFM][20]

尽管来自 LXDE，PCManFM 也同样适用于其他桌面环境。

#### 在基于 Ubuntu 的发行版上安装 PCManFM

在 Ubuntu 上安装 PCManFM 只需要一条简单的指令：

```
sudo apt install pcmanfm
```

### 8. Mousepad：文本编辑器

在轻量级方面，没有什么可以击败像 nano、vim 等命令行文本编辑器。但是，如果你想要一个图形界面，你可以尝试一下 Mousepad -- 一个最轻量级的文本编辑器。它非常轻巧，速度非常快。带有简单的可定制的用户界面和多个主题。

![Mousepad][21]

Mousepad 支持语法高亮显示。所以，你也可以使用它作为基础的代码编辑器。

#### 在基于 Ubuntu 的发行版上安装 Mousepad

想要安装 Mousepad ，可以使用以下指令：

```
sudo apt install mousepad
```

### 9. GNOME Office：办公软件

许多人需要经常使用办公应用程序。通常，大多数办公应用程序体积庞大且资源匮乏。Gnome Office 在这方面非常轻便。Gnome Office 在技术上不是一个完整的办公套件。它由不同的独立应用程序组成，在这之中 AbiWord＆Gnumeric 脱颖而出。

**AbiWord** 是文字处理器。它比其他替代品轻巧并且快得多。但是这样做是有代价的 -- 你可能会失去宏、语法检查等一些功能。AdiWord 并不完美，但它可以满足你基本的需求。
![AbiWord][22]

**Gnumeric** 是电子表格编辑器。就像 AbiWord 一样，Gnumeric 也非常快速，提供了精确的计算功能。如果你正在寻找一个简单轻便的电子表格编辑器，Gnumeric 已经能满足你的需求了。

![Gnumeric][23]

下面列出一些其他 Gnome Office 应用程序。你可以在官方页面找到它们。

[Gnome Office][24]

#### 在基于 Ubuntu 的发行版上安装 AbiWord＆Gnumeric

要安装 AbiWord＆Gnumeric，只需在终端中输入以下指令：

```
sudo apt install abiword gnumeric
```

--------------------------------------------------------------------------------

via: https://itsfoss.com/lightweight-alternative-applications-ubuntu/

作者：[Munif Tanjim][a]
译者：[imquanquan](https://github.com/imquanquan)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://itsfoss.com/author/munif/
[1]:https://itsfoss.com/speed-up-ubuntu-1310/
[2]:https://itsfoss.com/essential-linux-applications/
[4]:https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2017/03/Lightweight-alternative-applications-for-Linux-800x450.jpg
[5]:https://itsfoss.com/lightweight-linux-beginners/
[6]:https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2017/03/Midori-800x497.png
[7]:http://midori-browser.org/faqs/
[8]:http://midori-browser.org/
[9]:https://itsfoss.com/best-email-clients-linux/
[10]:https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2017/03/Trojit%C3%A1-800x608.png
[11]:http://trojita.flaska.net/
[12]:https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2017/03/GDebi.png
[13]:https://itsfoss.com/gdebi-default-ubuntu-software-center/
[14]:https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2017/03/AppGrid-800x553.png
[15]:http://www.appgrid.org/
[16]:https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2017/03/Yarock-800x529.png
[17]:https://seb-apps.github.io/yarock/
[18]:https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2017/03/VLC-800x526.png
[19]:http://www.videolan.org/index.html
[20]:https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2017/03/PCManFM.png
[21]:https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2017/03/Mousepad.png
[22]:https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2017/03/AbiWord-800x626.png
[23]:https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2017/03/Gnumeric-800x470.png
[24]:https://gnome.org/gnome-office/

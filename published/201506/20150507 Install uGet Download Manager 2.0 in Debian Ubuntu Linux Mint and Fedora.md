在 Debian, Ubuntu, Linux Mint 及 Fedora 中安装 uGet 下载管理器 2.0
================================================================================
在经历了一段漫长的开发期后，并发布了超过 11 个开发版本，最终 uGet 项目小组高兴地宣布 uGet 的最新稳定版本 uGet 2.0 已经可以下载使用了。最新版本包含许多吸引人的特点，例如一个新的设定对话框，改进了 aria2 插件对 BitTorrent 和 Metalink 协议的支持，同时对位于横幅中的 uGet RSS 信息提供了更好的支持，其他特点包括：

- 新增一个 “检查更新” 按钮，提醒您有关新的发行版本的信息;
- 增添新的语言支持并升级了现有的语言;
- 新增一个 “信息横幅” ，可以让开发者轻松地向所有的用户提供有关 uGet 的信息;
- 增强了帮助菜单，包括文档、提交反馈和错误报告等内容的链接;
- 将 uGet 下载管理器集成到了 Linux 平台下的两个主要的浏览器 Firefox 和 Google Chrome 中；
- 改进了对 Firefox 插件 ‘FlashGot’ 的支持;

### 何为 uGet ###

uGet (先前名为 UrlGfe) 是一个开源，免费，且极其强大的基于 GTK 的多平台下载管理器应用程序，它用 C 语言写就，在 GPL 协议下发布。它提供了大量功能，如恢复先前的下载任务，支持多点下载，使用一个独立的配置来支持分类，剪贴板监视，下载队列，从 HTML 文件中导出 URL 地址，集成在 Firefox 中的 Flashgot 插件中，使用集成在 uGet 中的 aria2(一个命令行下载管理器) 来下载 torrent 和 metalink 文件。

我已经在下面罗列出了 uGet 下载管理器的所有关键特点，并附带了详细的解释。

#### uGet 下载管理器的关键特点 ####

- 下载队列: 将你的下载任务放入一个队列中。当某些下载任务完成后，将会自动开始下载队列中余下的文件；
- 恢复下载: 假如在某些情况下，你的网络中断了，不要担心，你可以从先前停止的地方继续下载或重新开始；
- 下载分类: 支持多种分类来管理下载；
- 剪贴板监视: 将要下载的文件类型复制到剪贴板中，便会自动弹出下载提示框以下载刚才复制的文件；
- 批量下载: 允许你轻松地一次性下载多个文件；
- 支持多种协议: 允许你轻松地使用 aria2 命令行插件通过 HTTP, HTTPS, FTP, BitTorrent 及 Metalink 等协议下载文件；
- 多连接: 使用 aria2 插件，每个下载同时支持多达 20 个连接；
- 支持 FTP 登录或 FTP 匿名登录: 同时支持使用用户名和密码来登录 FTP 或匿名 FTP ；
- 队列下载: 新增队列下载，现在你可以对你的所有下载进行安排调度；
- 通过 FlashGot 与 FireFox 集成: 与作为一个独立支持的 Firefox 插件的 FlashGot 集成，从而可以处理单个或大量的下载任务；
- CLI 界面或虚拟终端支持: 提供命令行或虚拟终端选项来下载文件；
- 自动创建目录: 假如你提供了一个先前并不存在的保存路径，uGet 将会自动创建这个目录；
- 下载历史管理: 跟踪记录已下载和已删除的下载任务的条目，每个列表支持 9999 个条目，比当前默认支持条目数目更早的条目将会被自动删除；
- 多语言支持: uGet 默认使用英语，但它可支持多达 23 种语言；
- Aria2 插件: uGet 集成了 Aria2 插件，来为你提供更友好的 GUI 界面；

如若你想了解更加完整的特点描述，请访问 uGet 官方的 [特点页面][1].

### 在 Debian, Ubuntu, Linux Mint 及 Fedora 中安装 uGet ###

uGet 开发者在 Linux 平台下的各种软件仓库中添加了 uGet 的最新版本，所以你可以在你使用的 Linux 发行版本下使用受支持的软件仓库来安装或升级 uGet 。

当前，一些 Linux 发行版本下的 uGet 可能不是最新的，但你可以到 [uGet 下载页面][2] 去了解你所用发行版本的支持状态，在那里选择你喜爱的发行版本来了解更多的信息。

#### 在 Debian 下 ####

在 Debian Jessie 和Sid 中，你可以使用官方软件仓库轻易地安装和升级可靠的 uGet 软件包。

    $ sudo apt-get update
    $ sudo apt-get install uget

#### 在 Ubuntu 和 Linux Mint 下 ####

在 Ubuntu 和 Linux Mint 下，你可以使用官方的 PPA `ppa:plushuang-tw/uget-stable` 安装和升级 uGet ，通过使用这个 PPA，你可以自动地与最新版本保持同步。

    $ sudo add-apt-repository ppa:plushuang-tw/uget-stable
    $ sudo apt-get update
    $ sudo apt-get install uget

#### 在 Fedora 下 ####

在 Fedora 20 – 21 下，最新版本的 uGet(2.0) 可以从官方软件仓库中获得可靠的软件包。

    $ sudo yum install uget

**注**: 在旧版本的 Debian, Ubuntu, Linux Mint 和 Fedora 下，用户也可以安装 uGet ， 但可获取的版本为 1.10.4 。假如你期待使用升级版本(例如 2.0 版本)，你需要升级你的系统并添加 uGet 的 PPA 以此来获取最新的稳定版本。

### 安装 aria2 插件 ###

[aria2][3] 是一个卓越的命令行下载管理应用，在 uGet 中它作为一个 aria2 插件，为 uGet 增添了更为强大的功能，如下载 toorent，metalinks 文件，支持多种协议和多来源下载等功能。

默认情况下，uGet 在当今大多数的 Linux 系统中使用 `curl` 来作为后端，但 aria2 插件将 curl 替换为 aria2 来作为 uGet 的后端。

aria2 是一个单独的软件包，需要独立安装。你可以在你的 Linux 发行版下，使用受支持的软件仓库来轻易地安装 aria2 的最新版本，或根据 [下载 aria2 页面][4] 来安装它，该页面详细解释了在各个发行版本中如何安装 aria2 。

#### 在 Debian, Ubuntu 和 Linux Mint 下 ####

利用下面的命令，使用 aria2 的个人软件仓库来安装最新版本的 aria2 ：

    $ sudo add-apt-repository ppa:t-tujikawa/ppa
    $ sudo apt-get update
    $ sudo apt-get install aria2

#### 在 Fedora 下 ####

Fedora 的官方软件仓库中已经添加了 aria2 软件包，所以你可以轻易地使用下面的 yum 命令来安装它：

    $ sudo yum install aria2

#### 开启 uGet ####

为了启动 uGet，从桌面菜单的搜索栏中键入 "uGet"。可参考如下的截图：

![开启 uGet 下载管理器](http://www.tecmint.com/wp-content/uploads/2014/03/Start-uGet.gif)

*开启 uGet 下载管理器*

![uGet 版本: 2.0](http://www.tecmint.com/wp-content/uploads/2014/03/uGet-Version.gif)

*uGet 版本: 2.0*

#### 在 uGet 中激活 aria2 插件 ####

为了激活 aria2 插件, 从 uGet 菜单接着到 `编辑 –> 设置 –> 插件` , 从下拉菜单中选择 "aria2"。

![为 uGet 启用 Aria2 插件](http://www.tecmint.com/wp-content/uploads/2014/03/Enable-Aria2-Plugin.gif)

*为 uGet 启用 Aria2 插件*

### uGet 2.0 截图赏析 ###

![使用 Aria2 下载文件](http://www.tecmint.com/wp-content/uploads/2014/03/Download-Files-Using-Aria2.gif)

*使用 Aria2 下载文件*

![使用 uGet 下载 Torrent 文件](http://www.tecmint.com/wp-content/uploads/2014/03/Download-Torrent-File.gif)

*使用 uGet 下载 Torrent 文件*

![使用 uGet 进行批量下载](http://www.tecmint.com/wp-content/uploads/2014/03/Batch-Download-Files.gif)

*使用 uGet 进行批量下载*

针对其他 Linux 发行版本和 Windows 平台的 RPM 包和 uGet 的源文件都可以在 uGet 的[下载页面][5] 下找到。

--------------------------------------------------------------------------------

via: http://www.tecmint.com/install-uget-download-manager-in-linux/

作者：[Ravi Saive][a]
译者：[FSSlc](https://github.com/FSSlc)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/admin/
[1]:http://uget.visuex.com/features
[2]:http://ugetdm.com/downloads
[3]:http://www.tecmint.com/install-aria2-a-multi-protocol-command-line-download-manager-in-rhel-centos-fedora/
[4]:http://ugetdm.com/downloads-aria2
[5]:http://ugetdm.com/downloads
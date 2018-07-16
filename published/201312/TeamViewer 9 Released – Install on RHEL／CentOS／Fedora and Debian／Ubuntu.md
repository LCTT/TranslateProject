TeamViewer 9发布－在Linux下安装运行
================================================================================
这篇指南介绍了怎么样在 **RedHat、 CentOS、 Fedora** 和 **Debian**、 **Ubuntu**、 **Linux Mint**、 **Xubuntu** 等这些系统中安装 **Teamviewer 9**。**Teamviewer** 是一款流行的应用软件，用于远程辅助、桌面共享、计算机之间互传文件、网络会议及在线会议等方面，并且它是一款专业应用程序。而且，个人用户可以免费使用。Teamviewer可以运行在 **Windows、Linux、Mac OS、Android** 系统以及 **iPhone** 设备上，它使用它自己集成的 **WINE** 环境来运行，所以我们用的时候不需单独[安装 WINE 程序][1]了。 **Teamviewer** 并不是原生的 **Linux** 应用程序。

最新的稳定版本 **TeamViewer 9** 近期已经发布了，有了些新的功能和性能的改进。在 **TeamViewer 9** 中增加的一些新功能特性，其要点如下：

### Windows、Linux 和 Mac 系统下的功能特性 ###

- 在不同的选项卡中打开多个链接
- 支持局域网唤醒
- 支持为 TeamViewer 帐户添加双因子身份验证
- 支持 Windows 8.1 和 Mac OS X Mavericks 系统
- 能保存自定义模块，如uickSupport、QuickJoin等等
- 集成了应用程序编程接口(API) 
- 更强的 Teamviewer 账户安全
- 通过桌面快捷方式快速连接
- 可视化通知信息
- 不同计算机间复制和粘贴文件和文本
- 不同计算机间的初始化文件传输
- 视频传输更快

### 在 RedHat、 CentOS、 Fedora 上安装 Teamviewer 9 ###

你可以在 [teamviewer_linux.rpm][2] 上下载到基于 Linux 发行版本的 rpm 包。

    # wget http://www.teamviewer.com/download/teamviewer_linux.rpm 

然后开始安装。进入你的下载包所在的目录，执行如下的 yum 命令来安装，它将会自动安装需要的依赖包。
    
    # yum install teamviewer_linux.rpm

如果出现公钥缺失错误，你可以用如下命令来下载，并导入之。

    # wget http://www.teamviewer.com/link/?url=354858
    # rpm --import TeamViewer_Linux_PubKey.asc

在导入公钥后，请再一次运行 “ **yum install** ” 命令来安装 Teamviewer rpm 包。

要启动运行 Teamviewer 应用，从终端中运行如下命令。

    # teamviewer

Teamviewer 应用程序正运行在我的 **Fedora 18** 系统上。

![Running TeamViewer in Fedora 18](http://www.tecmint.com/wp-content/uploads/2013/02/f-t3.jpg)

*Fedora 18 系统上运行的 TeamViewer*

### 在 Ubuntu, Linux Mint, Xubuntu 上安装 Teamviewer 9 ###

你可以在 [teamviewer linux .deb][3] 上下载到基于 **32-位** 系统或 **64-位** 系统的 teamviewer 安装包，或者你可以用如下所示的 **wget** 命令来下载安装包。

    ## 32 位系统 ##
    $ sudo wget http://www.teamviewer.com/download/teamviewer_linux.deb

    ## 64 位系统 ##
    $ sudo wget http://www.teamviewer.com/download/teamviewer_linux_x64.deb

一旦下载好，就可以进入你下载的 Teamviewer 包所在的目录，然后运行如下命令来安装。

    ## 32 位系统 ##
    $ sudo dpkg -i teamviewer_linux.deb

    ## 64 位系统 ##
    $ sudo dpkg -i teamviewer_linux_x64.deb

如果出现有缺失依赖包错误这种情况，请使用如下命令来安装这些依赖包。

    sudo apt-get install -f

一旦全部都安装成功，在 **Ubuntu** 系统中要启动 Teamviewer，打开 **Dash 主窗口**，输入 **teamviewer** ，然后点击出现的 **teamviewer** 图标，程序就启动运行了。

![Running TeamViewer in Ubuntu 13.10](http://www.tecmint.com/wp-content/uploads/2013/02/u-t1.png)

*Ubuntu 13.10 系统上运行的 TeamViewer*

Teamviewer 应用程序正运行在我的 **Ubuntu 13.10** 系统上。

![TeamViewer 9 Under Ubuntu 13.10](http://www.tecmint.com/wp-content/uploads/2013/02/u-t2.jpg)

*在 Ubuntu 13.10 下的 TeamViewer 9*

要在 **Linux Mint** 上启动，进入 **菜单 >> 网络 >> Teamviewer**， 并点击 **接受许可协议** 来启动运行 TeamViewer。

Teamviewer 应用程序正运行在我的 **Linux Mint 15** 系统上。

![Running TeamViewer in Linux Mint 15](http://www.tecmint.com/wp-content/uploads/2013/02/m-t5.png)

*Linux Mint 15 系统上运行的 TeamViewer*

--------------------------------------------------------------------------------

via: http://www.tecmint.com/how-to-install-teamviewer-on-linux-distributions/

译者：[runningwater](https://github.com/runningwater) 校对：[Caroline](https://github.com/carolinewuyan)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://www.tecmint.com/install-wine-in-rhel-centos-and-fedora/
[2]:http://www.teamviewer.com/download/teamviewer_linux.rpm
[3]:http://www.teamviewer.com/hi/download/linux.aspx

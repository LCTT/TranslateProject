在基于RedHat与Debian的系统上安装Wine 最新的开发版本
=========================

**Wine**,一个在Linux平台上非常受欢迎并且强大的开源应用，有了它，我们可以在Linux平台上完美运行Windows应用与游戏。

![Install Wine (Development Version) in Linux](http://www.tecmint.com/wp-content/uploads/2014/05/Install-Wine-Development-Version.png)

*在Linux上安装Wine（开发版本）*

WineHQ团队，近期宣布了一个新的开发版本**Wine1.7.29**。这个版本带来了诸多重要的特性，并且修复了**44**个bug。

Wine团队几乎每周都会发布新的开发版本，并且加入许多新特性以及修复漏洞。每个新版本都会支持新的应用与游戏（Windows），这使得Wine在那些想要在Linux下运行Windows应用的用户群体中很流行并且是不可缺少的。

根据变更日志，这个版本中添加了以下的关键特性：

- 在DirectWrite中加入增强的外形塑造与BiDi（译者：bi-directional language）镜像。
- 升级了一些页面错误处理方式。
- 增加了更多的C运行时函数。
- 修复了大量的bug。

在官方的  [变更日志][1]  中可以找到关于这个版本更多更深入的细节。

这篇文章指导你在基于**RedHat**与**Debian**的系统，如CentOS，Fedora，Ubuntu，Linux Mint以及其他的发行版中安装最新的开发版本**Wine 1.7.29**。

##在Linux中安装 Wine 1.7.29 开发版本##

遗憾的是，目前还没有官方的Wine仓库可以获取基于**RedHat**系统的版本，只能通过编译源码来安装。如果要这么做的话，我们先要安装一些开发包如gcc，flex，bison，libX11-devel freetype-devel　以及开发工具，等等。这些工具都是编译Wine源码所必须的。我们可以通过**YUM**命令来安装这些包。

##RedHat，Fedora，CentOS##

    # yum -y groupinstall 'Development Tools'
    # yum -y install flex bison libX11-devel freetype-devel

然后，使用如下命令下载Wine最新的开发版本（**1.7.29**）以及解压源码包。

    $ cd /tmp
    $ wget http://citylan.dl.sourceforge.net/project/wine/Source/wine-1.7.29.tar.bz2
    $ tar -xvf wine-1.7.29.tar.bz2 -C /tmp/

接下来，使用下列命令编译及安装Wine。

注：安装过程大概需要**15-20**分钟，这个时间由你的网络速度以及电脑硬件配置决定，在安装过程中需要**root**密码。

####32位系统####

    $cd wine-1.7.29/
    $./tools/wineinstall

####64位系统####

    $ cd wine-1.7.29/
    $ ./configure --enable-win64
    $ make
    # make install
  
###Ubuntu，Debian 与 Linux Mint###

在**Ubuntu**系统下，你可以使用官方的**PPA**方便的安装最新的Wine开发版本。打开一个终端并使用sudo权限执行下列命令。

    $ sudo add-apt-repository ppa:ubuntu-wine/ppa 
    $ sudo apt-get update
    $ sudo apt-get install wine 1.7 winetricks

**注**：在写这篇文章时，只能获取**1.7.26**，在官方的仓库中还没有更新到最新版本，但是当仓库更新到**1.7.29**后，使用上面的指令可以安装最新的版本。（译者：为毛我看了版本号是1.6.2......）

安装成功后，你可以安装或运行任何windows应用或游戏了，示例如下：

    $ wine notepad
    $ wine notepad.exe 
    $ wine c:\\windows\\notepad.exe

**注**：切记，这是一个开发版本，请勿在生产系统上安装它。建议这个版本仅作测试用。

如果你需要最新的稳定版本，可以参考下列文章，它介绍了如何安装最新的稳定版本。

- [Install Wine 1.6.2 (Stable) in RHEL, CentOS and Fedora][2]
- [Install Wine 1.6.2 (Stable) in Debian, Ubuntu and Mint][3]

###参考链接###

- [WineHQ Homepage][4]

-------------------------------------------------

via: http://www.tecmint.com/install-wine-in-linux/

作者：[Ravi Saive][a]
译者：[SPccman](https://github.com/SPccman)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/admin/
[1]:http://www.winehq.org/announce/1.7.29
[2]:http://www.tecmint.com/install-wine-in-rhel-centos-and-fedora/
[3]:http://www.tecmint.com/install-wine-on-ubuntu-and-linux-mint/
[4]:http://www.winehq.org/

如何在 Linux 上使用 x2go 设置远程桌面
================================================================================
由于一切都迁移到了云上，作为提高职员生产力的一种方式，虚拟远程桌面在工业中越来越流行。尤其对于那些需要在多个地方和设备之间不停漫游的人，远程桌面可以让他们和工作环境保持无缝连接。远程桌面对于雇主同样有吸引力，可以在工作环境中提高敏捷性和灵活性，由于硬件整合、桌面安全加固等原因降低 IT 花费。

在 Linux 世界中，理所当然设置远程桌面有很多选择，支持许多协议（例如 RDP、RFB、NX） 和服务器/客户端实现（例如 [TigerVNC][1]、RealVNC、FreeNX、x2go、X11vnc、TeamViewer 等等）。

这当中有个出色的产品叫做 [X2Go][2]，它是一个基于 NX（译者注：通过计算机网络显示远程桌面环境的一种技术，可参考 [Wiki][9]）的远程桌面服务器和客户端的开源(GPLv2)实现。在这个教程中，我会介绍 **如何为 Linux VPS 使用 X2Go 设置远程桌面环境**。

### X2Go 是什么？ ###

X2Go 的历史要追溯到 NoMachine 的 NX 技术。NX 远程桌面协议的设计目的是通过利用主动压缩和缓存解决低带宽和高延迟的网络连接问题。后来，NX 转为闭源，但 NX 库还是采用 GPL 协议。这导致出现了多种基于 NX 的远程桌面解决方案开源实现，X2Go 就是其中之一。

和其它解决方案例如 VNC 相比，X2Go 有哪些好处呢？ X2Go 继承了 NX 技术的所有高级功能，很自然能在慢速网络连接上良好工作。另外，由于它内置的基于 SSH 的加密技术，X2Go 保持了确保安全的良好业绩记录。不再需要[手动设置 SSH 隧道][4] 。X2Go 默认支持音频，这意味着远程桌面的音乐播放可以通过网络传送，并进入本地扬声器。在易用性方面，远程桌面上运行的应用程序可以在你的本地桌面中以一个独立窗口无缝呈现，会给你造成一种应用程序实际上在你本地桌面运行的错觉。正如你看到的，这些都是一些基于 VNC 的解决方案所缺少的[强大功能][5]。

### X2GO 的桌面环境兼容性 ###

和其它远程桌面服务器一样，X2Go 服务器也有一些[已知的兼容性问题][6]。像  KDE 3/4、Xfce、MATE 和 LXDE 是对 X2Go 服务器最友好的桌面环境。但是，用其它桌面管理器效果可能有所不同。例如，已知 GNOME 3 之后的版本、KDE 5、Unity 和 X2Go 并不兼容。如果你的远程主机的桌面管理器和 X2Go 兼容，你可以继续以下的教程。 

### 在 Linux 上安装 X2Go 服务器 ###

X2Go 由远程桌面服务器和客户端组件组成。让我们首先安装 X2Go 服务器。我假设你已经有一个和 X2Go 兼容的桌面管理器并且在远程主机上运行，我们会安装 X2Go 服务器到该远程主机。

注意系统启动后 X2Go 服务器组件没有需要单独启动的服务。你只需要保证开启了 SSH 服务并在正常运行。

#### Ubuntu 或 Linux Mint： ####

配置 X2Go PPA 库。对于 Ubuntu 14.04 以及更高版本，有可用的 X2Go PPA。

    $ sudo add-apt-repository ppa:x2go/stable
    $ sudo apt-get update
    $ sudo apt-get install x2goserver x2goserver-xsession

#### Debian (Wheezy)： ####

    $ sudo apt-key adv --recv-keys --keyserver keys.gnupg.net E1F958385BFE2B6E
    $ sudo sh -c "echo deb http://packages.x2go.org/debian wheezy main > /etc/apt/sources.list.d/x2go.list"
    $ sudo sh -c "echo deb-src http://packages.x2go.org/debian wheezy main >> /etc/apt/sources.list.d/x2go.list"
    $ sudo apt-get update
    $ sudo apt-get install x2goserver x2goserver-xsession

#### Fedora： ####

    $ sudo yum install x2goserver x2goserver-xsession

#### CentOS/RHEL： ####

首先启用 [EPEL 库][7] 然后运行： 

    $ sudo yum install x2goserver x2goserver-xsession 

### 在 Linux 上安装 X2Go 客户端 ###

在将会连接到远程桌面的本地主机上，安装以下命令安装 X2Go 客户端。

#### Ubuntu 或 Linux Mint： ####

配置 X2Go PPA 库。对于 Ubuntu 14.04 以及更高版本，有可用的 X2Go PPA。

    $ sudo add-apt-repository ppa:x2go/stable
    $ sudo apt-get update
    $ sudo apt-get install x2goclient

Debian (Wheezy)：

    $ sudo apt-key adv --recv-keys --keyserver keys.gnupg.net E1F958385BFE2B6E
    $ sudo sh -c "echo deb http://packages.x2go.org/debian wheezy main > /etc/apt/sources.list.d/x2go.list"
    $ sudo sh -c "echo deb-src http://packages.x2go.org/debian wheezy main >> /etc/apt/sources.list.d/x2go.list"
    $ sudo apt-get update
    $ sudo apt-get install x2goclient

#### Fedora： ####

    $ sudo yum install x2goclient

CentOS/RHEL：

首先启用 [EPEL 库][7] ，然后运行： 

    $ sudo yum install x2goclient 

### 用 X2Go 客户端连接到远程桌面 ###

现在可以连接到远程桌面了。在本地主机上，只需运行以下命令或者使用桌面启动器启动 X2Go 客户端。

    $ x2goclient

输入远程主机的 IP 地址和 SSH 用户名称。同时，指定会话类型（例如，远程主机的桌面管理器）。

![](https://farm9.staticflickr.com/8730/16365755693_75f3d544e9_b.jpg)

如果需要的话，你可以自定义其它东西（通过点击其它的标签），例如连接速度、压缩、屏幕分辨率等等。

![](https://farm9.staticflickr.com/8699/16984498482_665b975eca_b.jpg)

![](https://farm9.staticflickr.com/8694/16985838755_1b7df1eb78_b.jpg)

当你初始化一个远程桌面连接的时候，会要求你登录。输入你的 SSH 登录名和密码。

![](https://farm9.staticflickr.com/8754/16984498432_1c8068b817_b.jpg)

成功登陆后，你会看到远程桌面屏幕。

![](https://farm9.staticflickr.com/8752/16798126858_1ab083ba80_c.jpg)

如果你想测试 X2Go 的无缝窗口功能，选择 "Single application" 会话类型，然后指定远处主机上可执行文件的路径。在该例子中，我选择远程 KDE 主机上的 Dolphin 文件管理器。

![](https://farm8.staticflickr.com/7584/16798393920_128c3af9c5_b.jpg)

你成功连接后，你会在本地桌面上看到一个远程应用窗口，而不是完整的远程桌面屏幕。

![](https://farm9.staticflickr.com/8742/16365755713_7b90cf65f0_c.jpg)

### 总结 ###

在这篇教程中，我介绍了如何在 [Linux VPS][8] 实例上设置 X2Go 远程桌面。正如你所看到的，整个设置过程都非常简单（如果你使用一个合适的桌面环境的话）。尽管对于特定桌面仍有问题，X2Go 是一个安全、功能丰富、快速并且免费的远程桌面解决方案。

X2Go 的什么功能最吸引你？欢迎分享你的观点。

--------------------------------------------------------------------------------

via: http://xmodulo.com/x2go-remote-desktop-linux.html

作者：[Dan Nanni][a]
译者：[ictlyh](https://github.com/ictlyh)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://xmodulo.com/author/nanni
[1]:http://ask.xmodulo.com/centos-remote-desktop-vps.html
[2]:http://wiki.x2go.org/
[3]:http://xmodulo.com/go/digitalocean
[4]:http://xmodulo.com/how-to-set-up-vnc-over-ssh.html
[5]:http://wiki.x2go.org/doku.php/doc:newtox2go
[6]:http://wiki.x2go.org/doku.php/doc:de-compat
[7]:https://linux.cn/article-2324-1.html
[8]:http://xmodulo.com/go/digitalocean
[9]:https://en.wikipedia.org/wiki/NX_technology
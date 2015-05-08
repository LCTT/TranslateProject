如何在linux vps上使用x2go来建立远程桌面 
================================================================================

正如所有一切已经移到云端，在工业界作为一种提高雇员效率的方式，虚拟化的远程桌面变得越来越流行。尤其对需要经常漫游，横跨多个位置和设备的这些人，远程桌面允许他们无缝地保持连接到它们的工作环境。远程桌面对雇主来说也是有吸引力的，在工作环境中实现增加（灵敏度）敏捷性与灵活性，由于硬件的整合，桌面的安全强化等方面，实现了更低的IT花费。

在linux的世界中，当然不缺少启动远程桌面环境的选择，有很多协议(e.g., RDP, RFB, NX)和客服实现(e.g., TigerVNC, RealVNC, FreeNX, x2go, X11vnc, TeamViewer)可用。

从这些包中脱颖而出的有X2Go--一个开源实现(GPLv2)，基于NX的远程桌面服务器与客户端。在本指南中，我将要展示如何使用X2Go为linux vps建立远程桌面环境。


### X2Go是什么? ###

X2Go的历史可以追溯到NoMachine公司的NX技术。NX远程桌面协议设计用来处理低带宽和高延迟的网络连接。后来，当NX库许可证到期时，NX转向了闭源。这导致一些基于NX远程桌面方案的开源实现，其中之一就是X2Go。

和其它方案例如VNC相比，X2Go都有哪些可以摆到桌面上的收益呢？X2Go继承了所有NX技术的高级特性，因此很自然地在慢速网络连接之上工作的很好。除此之外，X2Go自夸是一个完美的记录跟踪，用它内置基于SSH的加密确保安全。不再需要手动建立一个SSH隧道。X2Go伴随着开箱即用的声音支持，它意味着在远程桌面的音乐回放通过网络被转发（经由脉冲音频），并注入本地扬声器。在可用性方面，你在远程桌面中运行的应用程序，能被无缝地在本地桌面上渲染为一个独立的窗口，给你一个应用程序就是运行在本地桌面的假象。正如你所看到的，这些是它强大特性中的一些，正是基于VNC方案所缺少的。


### X2Go的桌面环境兼容性 ###

正如其它远程桌面服务器一样，X2Go server也有已知的兼容性问题。像KDE3/4,Xfce,MATE和LXDE这样的桌面环境对X2Go server都比较友好。然而，你的里程会受到其它桌面管理器的影响。例如，最新版本的GNOME 3, KDE5，Unity与X2Go不兼容。假如你远程主机的桌面管理器兼容X2Go，请接着阅读指南的其余部分。


### 在linux上安装 X2Go 服务端 ###

X2Go 由远程桌面服务器和客户端组件组成。让我们开始X2Go server安装。我假设你已经在远程主机上启动并运行了一个X2Go兼容的桌面管理器，我将在这个机器上安装X2Go服务器。注意X2Go server组件没有一个在系统引导时而启动的独立服务。你只需要确保ssh服务启动并运行。


#### Ubuntu or Linux Mint: ####

Configure X2Go PPA repository. X2Go PPA is available for Ubuntu 14.04 and higher.

    $ sudo add-apt-repository ppa:x2go/stable
    $ sudo apt-get update
    $ sudo apt-get install x2goserver x2goserver-xsession

#### Debian (Wheezy): ####

    $ sudo apt-key adv --recv-keys --keyserver keys.gnupg.net E1F958385BFE2B6E
    $ sudo sh -c "echo deb http://packages.x2go.org/debian wheezy main > /etc/apt/sources.list.d/x2go.list"
    $ sudo sh -c "echo deb-src http://packages.x2go.org/debian wheezy main >> /etc/apt/sources.list.d/x2go.list"
    $ sudo apt-get update
    $ sudo apt-get install x2goserver x2goserver-xsession

#### Fedora: ####

    $ sudo yum install x2goserver x2goserver-xsession

#### CentOS/RHEL: ####

Enable [EPEL respository][7] first, and then run:

    $ sudo yum install x2goserver x2goserver-xsession 

### 在linux上安装X2Go 客户端 ###

在你将要连接到远程桌面的本地主机上，按如下步骤安装X2GO客户端。

#### Ubuntu or Linux Mint: ####

Configure X2Go PPA repository. X2Go PPA is available for Ubuntu 14.04 and higher.

    $ sudo add-apt-repository ppa:x2go/stable
    $ sudo apt-get update
    $ sudo apt-get install x2goclient

Debian (Wheezy):

    $ sudo apt-key adv --recv-keys --keyserver keys.gnupg.net E1F958385BFE2B6E
    $ sudo sh -c "echo deb http://packages.x2go.org/debian wheezy main > /etc/apt/sources.list.d/x2go.list"
    $ sudo sh -c "echo deb-src http://packages.x2go.org/debian wheezy main >> /etc/apt/sources.list.d/x2go.list"
    $ sudo apt-get update
    $ sudo apt-get install x2goclient

#### Fedora: ####

    $ sudo yum install x2goclient

CentOS/RHEL:

Enable EPEL respository first, and then run:

    $ sudo yum install x2goclient 

### 通过X2GO客户端连接到远程桌面 ###

现在是时候连接到你的远程桌面了。在本地主机上，简单地运行如下命令或使用桌面启动器来启动X2GO 客户端。

    $ x2goclient

输入远程主机的ip地址和ssh用户名。还有，指定session 类型（例如，远程主机的桌面管理器）。

![](https://farm9.staticflickr.com/8730/16365755693_75f3d544e9_b.jpg)

如果你需要，还可以自定义其它事情（通过点击其它标签），像连接速度，是否压缩，屏幕分辨率等等。

![](https://farm9.staticflickr.com/8699/16984498482_665b975eca_b.jpg)

![](https://farm9.staticflickr.com/8694/16985838755_1b7df1eb78_b.jpg)

当你初始化一个远程桌面连接时，你将被要求登录。输入你的ssh登录名与密码。

![](https://farm9.staticflickr.com/8754/16984498432_1c8068b817_b.jpg)

成功登录后，你将看到远程桌面屏幕。

![](https://farm9.staticflickr.com/8752/16798126858_1ab083ba80_c.jpg)

如果你想测试X2GO的无缝窗口特性，选择“Single application”作为一个session类型，并指定远程主机上可执行程序的路径。在这个例子中，我选择在远程KDE主机上的Dolphin 文件管理器。

![](https://farm8.staticflickr.com/7584/16798393920_128c3af9c5_b.jpg)

一旦你成功连接，你将看到一个远程应用程序窗口打开在你的本地桌面，而不是整个远程桌面屏幕。

![](https://farm9.staticflickr.com/8742/16365755713_7b90cf65f0_c.jpg)

### 结论 ###

在本指南中，我展示了在linux vps实例上如何建立X2Go远程桌面。正如你看到的，整个设置过程是非常痛苦的（如果你使用一个合适的桌面环境）。与此同时有一些特定桌面的特质，X2Go是一个安全，特性丰富，快速，自由的可靠的远程桌面方案。

X2Go还有什么特性是最吸引你?请分享你的观点。
--------------------------------------------------------------------------------

via: http://xmodulo.com/x2go-remote-desktop-linux.html

作者：[Dan Nanni][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://xmodulo.com/author/nanni
[1]:http://ask.xmodulo.com/centos-remote-desktop-vps.html
[2]:http://wiki.x2go.org/
[3]:http://xmodulo.com/go/digitalocean
[4]:http://xmodulo.com/how-to-set-up-vnc-over-ssh.html
[5]:http://wiki.x2go.org/doku.php/doc:newtox2go
[6]:http://wiki.x2go.org/doku.php/doc:de-compat
[7]:http://xmodulo.com/how-to-set-up-epel-repository-on-centos.html
[8]:http://xmodulo.com/go/digitalocean

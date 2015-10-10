在 Debian 中安装 OpenQRM 云计算平台
================================================================================

### 简介 ###

**openQRM**是一个基于 Web 的开源云计算和数据中心管理平台，可灵活地与企业数据中心的现存组件集成。

它支持下列虚拟技术：

- KVM
- XEN
- Citrix XenServer
- VMWare ESX
- LXC
- OpenVZ

openQRM 中的混合云连接器支持 **Amazon AWS**, **Eucalyptus** 或 **OpenStack** 等一系列的私有或公有云提供商，以此来按需扩展你的基础设施。它也可以自动地进行资源调配、 虚拟化、 存储和配置管理，且保证高可用性。集成的计费系统的自服务云门户可使终端用户按需请求新的服务器和应用堆栈。

openQRM 有两种不同风格的版本可获取：

- 企业版
- 社区版

你可以在[这里][1]查看这两个版本间的区别。

### 特点 ###

- 私有/混合的云计算平台
- 可管理物理或虚拟的服务器系统
- 集成了所有主流的开源或商业的存储技术
- 跨平台: Linux, Windows, OpenSolaris 和 BSD
- 支持 KVM, XEN, Citrix XenServer, VMWare ESX(i), lxc, OpenVZ 和 VirtualBox
- 支持使用额外的 Amazon AWS, Eucalyptus, Ubuntu UEC 等云资源来进行混合云设置
- 支持 P2V, P2P, V2P, V2V 迁移和高可用性
- 集成最好的开源管理工具 – 如 puppet, nagios/Icinga 或 collectd
- 有超过 50 个插件来支持扩展功能并与你的基础设施集成
- 针对终端用户的自服务门户
- 集成了计费系统

### 安装 ###

在这里我们将在 Debian 7.5 上安装 openQRM。你的服务器必须至少满足以下要求：

- 1 GB RAM
- 100 GB Hdd（硬盘驱动器）
- 可选: Bios 支持虚拟化（Intel CPUs 的 VT 或 AMD CPUs AMD-V）

首先，安装 `make` 软件包来编译 openQRM 源码包：

    sudo apt-get update
    sudo apt-get upgrade
    sudo apt-get install make

然后，逐次运行下面的命令来安装 openQRM。

从[这里][2]下载最新的可用版本：

    wget http://sourceforge.net/projects/openqrm/files/openQRM-Community-5.1/openqrm-community-5.1.tgz
    
    tar -xvzf openqrm-community-5.1.tgz
    
    cd openqrm-community-5.1/src/
    
    sudo make
    
    sudo make install
    
    sudo make start

安装期间，会要求你更新文件 `php.ini`

![~-openqrm-community-5.1-src_001](http://1102047360.rsc.cdn77.org/wp-content/uploads/2015/02/sk@server-openqrm-community-5.1-src_001.png)

输入 mysql root 用户密码。

![~-openqrm-community-5.1-src_002](http://1102047360.rsc.cdn77.org/wp-content/uploads/2015/02/sk@server-openqrm-community-5.1-src_002.png)

再次输入密码：

![~-openqrm-community-5.1-src_003](http://1102047360.rsc.cdn77.org/wp-content/uploads/2015/02/sk@server-openqrm-community-5.1-src_003.png)

选择邮件服务器配置类型：

![~-openqrm-community-5.1-src_004](http://1102047360.rsc.cdn77.org/wp-content/uploads/2015/02/sk@server-openqrm-community-5.1-src_004.png)

假如你不确定该如何选择，可选择 `Local only`。在我们的这个示例中，我选择了 **Local only** 选项。

![~-openqrm-community-5.1-src_005](http://1102047360.rsc.cdn77.org/wp-content/uploads/2015/02/sk@server-openqrm-community-5.1-src_005.png)

输入你的系统邮件名称，并最后输入 Nagios 管理员密码。

![~-openqrm-community-5.1-src_007](http://1102047360.rsc.cdn77.org/wp-content/uploads/2015/02/sk@server-openqrm-community-5.1-src_007.png)

根据你的网络连接状态，上面的命令可能将花费很长的时间来下载所有运行 openQRM 所需的软件包，请耐心等待。

最后你将得到 openQRM 配置 URL 地址以及相关的用户名和密码。

![~_002](http://1102047360.rsc.cdn77.org/wp-content/uploads/2015/02/sk@debian-_002.png)

### 配置 ###

在安装完 openQRM 后，打开你的 Web 浏览器并转到 URL: **http://ip-address/openqrm**

例如，在我的示例中为 http://192.168.1.100/openqrm 。

默认的用户名和密码是： **openqrm/openqrm** 。

![Mozilla Firefox_003](http://1102047360.rsc.cdn77.org/wp-content/uploads/2015/02/Mozilla-Firefox_003.png)

选择一个网卡来给 openQRM 管理网络使用。

![openQRM Server - Mozilla Firefox_004](http://1102047360.rsc.cdn77.org/wp-content/uploads/2015/02/openQRM-Server-Mozilla-Firefox_004.png)

选择一个数据库类型，在我们的示例中，我选择了 mysql。

![openQRM Server - Mozilla Firefox_006](http://1102047360.rsc.cdn77.org/wp-content/uploads/2015/02/openQRM-Server-Mozilla-Firefox_006.png)

现在，配置数据库连接并初始化 openQRM， 在这里，我使用 **openQRM** 作为数据库名称， **root** 作为用户的身份，并将 debian 作为数据库的密码。 请小心，你应该输入先前在安装 openQRM 时创建的 mysql root 用户密码。

![openQRM Server - Mozilla Firefox_012](http://1102047360.rsc.cdn77.org/wp-content/uploads/2015/02/openQRM-Server-Mozilla-Firefox_012.png)

祝贺你！ openQRM 已经安装并配置好了。

![openQRM Server - Mozilla Firefox_013](http://1102047360.rsc.cdn77.org/wp-content/uploads/2015/02/openQRM-Server-Mozilla-Firefox_013.png)

### 更新 openQRM ###

在任何时候可以使用下面的命令来更新 openQRM：

    cd openqrm/src/
    make update

到现在为止，我们做的只是在我们的 Debian 服务器中安装和配置 openQRM， 至于 创建、运行虚拟，管理存储，额外的系统集成和运行你自己的私有云等内容，我建议你阅读 [openQRM 管理员指南][3]。

就是这些了，欢呼吧！周末快乐！

--------------------------------------------------------------------------------

via: http://www.unixmen.com/install-openqrm-cloud-computing-platform-debian/

作者：[SK][a]
译者：[FSSlc](https://github.com/FSSlc)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.unixmen.com/author/sk/
[1]:http://www.openqrm-enterprise.com/products/edition-comparison.html
[2]:http://sourceforge.net/projects/openqrm/files/?source=navbar
[3]:http://www.openqrm-enterprise.com/fileadmin/Documents/Whitepaper/openQRM-Enterprise-Administrator-Guide-5.2.pdf
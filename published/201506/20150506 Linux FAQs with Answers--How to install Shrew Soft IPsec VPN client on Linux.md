Linux有问必答：Linux上如何安装Shrew Soft IPsec VPN
================================================================================

> **问题**：我需要连接到一个IPSec VPN网关，鉴于此，我尝试使用Shrew Soft VPN客户端，它是一个免费版本。我怎样才能安装Shrew Soft VPN客户端到[某个Linux发行版]?

市面上有许多商业VPN网关，同时附带有他们自己的专有VPN客户端软件。虽然也有许多开源的VPN服务器/客户端备选方案，但它们通常缺乏复杂的IPsec支持，比如互联网密钥交换（IKE），这是一个标准的IPsec协议，用于加固VPN密钥交换和验证安全。Shrew Soft VPN是一个免费的IPsec VPN客户端，它支持多种验证方法、密钥交换、加密以及防火墙穿透选项。

下面介绍如何安装Shrew Soft VPN客户端到Linux平台。

首先，从[官方站点][1]下载它的源代码。

### 安装Shrew VPN客户端到Debian, Ubuntu或者Linux Mint ###

Shrew Soft VPN客户端图形界面要求使用Qt 4.x。所以，作为依赖，你需要安装其开发文件。

    $ sudo apt-get install cmake libqt4-core libqt4-dev libqt4-gui libedit-dev libssl-dev checkinstall flex bison
    $ wget https://www.shrew.net/download/ike/ike-2.2.1-release.tbz2
    $ tar xvfvj ike-2.2.1-release.tbz2
    $ cd ike
    $ cmake -DCMAKE_INSTALL_PREFIX=/usr -DQTGUI=YES -DETCDIR=/etc -DNATT=YES .
    $ make
    $ sudo make install
    $ cd /etc/
    $ sudo mv iked.conf.sample iked.conf 

### 安装Shrew VPN客户端到CentOS, Fedora或者RHEL ###

与基于Debian的系统类似，在编译前你需要安装一堆依赖包，包括Qt4。

    $ sudo yum install qt-devel cmake gcc-c++ openssl-devel libedit-devel flex bison
    $ wget https://www.shrew.net/download/ike/ike-2.2.1-release.tbz2
    $ tar xvfvj ike-2.2.1-release.tbz2
    $ cd ike
    $ cmake -DCMAKE_INSTALL_PREFIX=/usr -DQTGUI=YES -DETCDIR=/etc -DNATT=YES .
    $ make
    $ sudo make install
    $ cd /etc/
    $ sudo mv iked.conf.sample iked.conf 

在基于Red Hat的系统中，最后一步需要用文本编辑器打开/etc/ld.so.conf文件，并添加以下行。

    $ sudo vi /etc/ld.so.conf

----------

    include /usr/lib/

重新加载运行时绑定的共享库文件，以容纳新安装的共享库：

    $ sudo ldconfig 

### 启动Shrew VPN客户端 ###

首先，启动IKE守护进程（iked）。该守护进作为VPN客户端程通过IKE协议与远程主机经由IPSec通信。

    $ sudo iked 

![](https://farm9.staticflickr.com/8685/17175688940_59c2db64c9_b.jpg)

现在，启动qikea，它是一个IPsec VPN客户端前端。该GUI应用允许你管理远程站点配置并初始化VPN连接。

![](https://farm8.staticflickr.com/7750/16742992713_eed7f97939_b.jpg)

要创建一个新的VPN配置，点击“添加”按钮，然后填入VPN站点配置。创建配置后，你可以通过点击配置来初始化VPN连接。

![](https://farm8.staticflickr.com/7725/17337297056_3d38dc2180_b.jpg)

### 故障排除 ###

1. 我在运行iked时碰到了如下错误。

    iked: error while loading shared libraries: libss_ike.so.2.2.1: cannot open shared object file: No such file or directory

要解决该问题，你需要更新动态链接器来容纳libss_ike库。对于此，请添加库文件的位置路径到/etc/ld.so.conf文件中，然后运行ldconfig命令。

    $ sudo ldconfig

验证libss_ike是否添加到了库路径：

    $ ldconfig -p | grep ike 

----------

    libss_ike.so.2.2.1 (libc6,x86-64) => /lib/libss_ike.so.2.2.1
	libss_ike.so (libc6,x86-64) => /lib/libss_ike.so

--------------------------------------------------------------------------------

via: http://ask.xmodulo.com/install-shrew-soft-ipsec-vpn-client-linux.html

作者：[Dan Nanni][a]
译者：[GOLinux](https://github.com/GOLinux)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://ask.xmodulo.com/author/nanni
[1]:https://www.shrew.net/download/ike

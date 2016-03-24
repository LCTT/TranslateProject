使用n2n配置二层点对点VPN
================================================================================
n2n是一个二层点对点虚拟专用网（VPN），它允许用户在网络层面而非应用层面开发典型的P2P应用功能。这就意味着，用户可以获得本地IP可见性（如，属于同一个n2n网络的两台PC可以互相ping通），以及不管他们现在身处哪个网络，只要有相同的网络IP地址就可以访问到。简言之，就像OpenVPN将SSL从应用（如，用于部署https协议）搬到了网络协议一样，n2n将P2P从应用搬到了网络层面。

### n2n主要功能 ###

n2n是一个基于P2P协议的加密的二层专用网。

加密使用开放协议部署在边缘节点，它使用用户定义的加密钥匙：你自己控制安全，而不用授权给公司，而Skype或Hamachi却是要的。

各个n2n用户可以同时属于多个网络（或者社区）。

它拥有在反向通信方向（如，从外部到内部）穿越NAT和防火墙的能力，因此可以到达n2n节点，即使运行在一个专用网中。防火墙不再是IP层面掌控通信的障碍。

n2n网络并不意味着它是独立的，它可以在n2n和非n2n网络间路由通信。

### n2n架构基于两个组件 ###

**超级节点**：它在启动时用于边缘节点或用于达到对称防火墙后面的节点。对于这些节点，该应用主要是一个目录暂存器和包路由器，而不是直接通信。

**边缘节点**：安装在用户PC的应用程序，它允许构建n2n网络。实际上，各个边缘节点创建一个tun/tap设备，该设备是n2n网络的进入点。

### 安装n2n到Ubuntu ###

打开终端并运行以下命令

    $ sudo apt-get install subversion build-essential libssl-dev
    $ svn co https://svn.ntop.org/svn/ntop/trunk/n2n
    $ cd n2n/n2n_v2
    $ make
    $ sudo make install

### 使用n2n配置P2P VPN ###

首先，我们需要配置一个超级节点和任意数量的边缘节点。

决定将超级节点放在哪个地方。假设你将它放到了主机a.b.c.d的xyw端口上。

决定使用何种密码加密来保证数据安全。假设你使用密码encryptme。

决定你想要使用的网络名称。假设你将它命名为mynetwork。注意，你可以使用超级节点/边缘节点来处理多个网络，不仅仅只有一个哦。

决定在边缘节点上使用什么IP地址。假设你使用10.1.2.0/24。

启动应用：

### 配置超级节点 ###

    supernode -l xyw

### 配置边缘节点 ###

在各个边缘节点，使用以下命令来连接到P2P VPN。

    sudo edge -a 10.1.2.1 -c mynetwork -k encryptme -l a.b.c.d:xyw

    sudo edge -a 10.1.2.2 -c mynetwork -k encryptme -l a.b.c.d:xyw

### 现在来测试你的n2n网络 ###

    edge node1> ping 10.1.2.2

    edge node2> ping 10.1.2.1

Windows n2n VPN客户端（N2N边缘图形界面）

你可以从[这里][1]下载N2N边缘图形界面。

N2N边缘图形界面是一个基本的安装器和用于点对点‘n2n VPN解决方案’的GUI配置界面。

![](http://www.ubuntugeek.com/wp-content/uploads/2014/10/client.jpg)

--------------------------------------------------------------------------------

via: http://www.ubuntugeek.com/configuring-layer-two-peer-to-peer-vpn-using-n2n.html

作者：[ruchi][a]
译者：[GOLinux](https://github.com/GOLinux)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.ubuntugeek.com/author/ubuntufix
[1]:http://sourceforge.net/projects/n2nedgegui/

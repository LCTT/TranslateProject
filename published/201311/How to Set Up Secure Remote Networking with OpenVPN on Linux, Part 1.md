Linux上如何通过 OpenVPN 建立安全的远程连接【上】
================================================================================

一直以来，我们在互联网上传输信息时，都谨慎地为这些信息加密，以防内容泄露出去，特别是在政府的干预下，为网络上每个字节都进行加密已经变得空前重要了。在这种情况下，OpenVPN 是保障网络信息安全的首选。今天我们就来学习一下如何架设 OpenVPN，使你可以在任何场所都能安全地访问家里的服务器。

VPN 小贴士：很多商业的 VPN 根本不值它们的售价，它们的安全性只比通过 SSL 保护的网站高一点点，原因是它们信任所有客户端。一个真正意义上的 VPN 用于在非可信网络上连接两个可信的终端。用户不能随便找一台 PC 机就能登录进 VPN，因为你的 VPN 如果能被一台受到病毒感染的 PC 登录进来，不管它们建立的连接有多么安全，都不是一件好事情。所以你必须在你的客户端和服务器端都要好好地配置一下 VPN 服务。

### OpenVPN 快速入门 ###

你需要两台不同子网下的计算机，比如同一网络内一台使用网线的 PC 和一台使用无线 的 PC（或者是 VitualBox 虚拟机上的多台Linux客户机），并且你要知道它们的 IP 地址。这里分别为这两台计算机命名为“Studio”和“Shop”，都给它们装上 OpenVPN。OpenVPN 支持大多数 Linux 发行版，所以你只要用你手头的安装包管理软件就行。本文的包管理器是 Debian、Ubuntu 以及它们的衍生版中使用的 apt-get，下面安装 OpenVPN：

    $ sudo apt-get install openvpn openvpn-blacklist 

上面的步骤安装了 OpenVPN 服务器和一个用于检查外泄密钥黑名单的程序。请务必安装这个黑名单检查器，因为有一次 Debian 发布了一个[有漏洞的 OpenSSL 软件][1]，这个软件里的随机码生成器会产生不可信任的密钥 —— 产生的这些密钥不是真正的随机数，它们可以被预测到。这件事发生在2008年，当时所有使用了这个软件的人都需要替换掉他们的弱密钥。即使5年过去了，我们还是建议使用这个黑名单检查器。

现在让我们测试下，先为两台 PC 创建一个不加密的通道。首先互 ping 一下确保它们能连通，然后让 OpenVPN 处于关闭状态（我们会在后面手动启动它）：

    $ ps ax|grep openvpn

如果 openvpn 这个后台进程存在，那就 kill 了它。这里假设“Studio”这台 PC 的 IP 是192.168.1.125，“Shop”的 IP 是192.168.2.125。

现在在“Studio”端开启一个未加密的连接到“Shop”端：

    $ sudo openvpn --remote 192.168.2.125 --dev tun0 --ifconfig 10.0.0.1 10.0.0.2

然后再开一个从“Shop”到“Studio”的连接：

    $ sudo openvpn --remote 192.168.1.125 --dev tun0 --ifconfig 10.0.0.2 10.0.0.1

连接成功的话你会看到类似下面的信息：

    Wed Oct 16 2013 ******* WARNING *******: all encryption and authentication 
    features disabled -- all data will be tunnelled as cleartext
    Wed Oct 16 2013 TUN/TAP device tun0 opened
    Wed Oct 16 2013 do_ifconfig, tt->ipv6=0, tt->did_ifconfig_ipv6_setup=0
    Wed Oct 16 2013 /sbin/ifconfig tun0 10.0.0.1 pointopoint 10.0.0.2 mtu 1500
    Wed Oct 16 2013 UDPv4 link local (bound): [undef]
    Wed Oct 16 2013 UDPv4 link remote: [AF_INET]192.168.2.125:1194
    Wed Oct 16 2013 Peer Connection Initiated with [AF_INET]192.168.2.125:1194
    Wed Oct 16 2013 Initialization Sequence Completed

看到“**Initialization Sequence Completed**”这句话时，说明你的操作成功了。这时你应该能够 ping 通两个隧道的 IP：ping 10.0.0.1 和 ping 10.0.0.2。当你建立隧道的时候，你无需在意你所在的网络，你可以为你的隧道指定任何 IP 地址。关闭隧道请按 Ctrl+c。

现在你可以利用这个隧道打开一个 SSH 会话了。图1显示了通过 VPN 隧道登录 SSH 的例子，这个图也显示了有趣的 Message of the Day（MOTD）图片，图片来自于博客《[在你的 Linux 系统上放一张奶牛的 MOTD 图片][2]》：

    $ ssh carla@10.0.0.2

![](http://www.linux.com/images/stories/41373/SSH-OpenVPN.jpg)

*图1：成功通过 VPN 隧道建立 SSH 会话，并显示了有趣的 MOTD 图片*

哼哼哈嘿，它运行得不错！

### 加密后的 VPN 隧道 ###

目前为止，我们玩得还不赖，但是没有使用加密技术，一切都毫无意义，所以我们需要建立一个简单的静态密钥配置文件。不像公钥基础设施（PKI），有着根认证中心、可撤消认证等安全措施，我们的加密机制没有那么强悍，但是对于仅仅想远程到家里的用户来说，已经足够了。OpenVPN 有提供创建静态密钥的命令，我们可以建立目录存储密钥、创建密钥，并将文件设为对属主只读模式：

    $ sudo mkdir /etc/openvpn/keys/
    $ sudo openvpn --genkey --secret /etc/openvpn/keys/static.key
    $ sudo chmod 0400 /etc/openvpn/keys/static.key

这是个明文密钥，你可以利用文本编辑器打开密钥文件读取到它，文件名可以随意，不一定非得叫“static.key”。将这个密钥拷到需要通信的两台电脑上，呵呵，这是对称加密，而不是公钥加密。

现在我们要在两台电脑上完成基本的配置。（在非类 Ubuntu 的系统中，OpenVPN 没有提供默认的配置文件，但是在 /usr/share/doc/openvpn/ 目录下会为你提供一个配置文件的样本。）在我的实验中，“Studio”是服务器端，“Shop”是一台笔记本电脑，用于登录到“Studio”中。我的服务器端的配置文件是 /etc/openvpn/studio.conf，它的配置信息如下：

    # config for Studio
    dev tun
    ifconfig 10.0.0.1 10.0.0.2
    secret /etc/openvpn/keys/static.key

将配置文件设为只有拥有者有读写权限：

    $ sudo chmod 0600 /etc/openvpn/studio.conf

客户端的配置文件内容类似，只是多了服务器端的 IP 地址：

    # config for Shop
    dev tun
    ifconfig 10.0.0.2 10.0.0.1
    secret /etc/openvpn/keys/static.key
    remote 192.168.1.125

注意 ifconfig 那行的 IP 地址的顺序，本地的 IP 要放在远程的 IP 之前。现在启动服务器端的 OpenVPN，指定服务器端配置文件，客户端操作雷同：

    $ sudo openvpn /etc/openvpn/studio.conf
    $ sudo openvpn /etc/openvpn/shop.conf

成功建立连接后，你还会看到“**Initialization Sequence Completed**”这句话，但你不会再看到这句 WARNING（这句话会在你建立了未加密的隧道时出现）：

    ******* WARNING *******: all encryption and authentication features disabled

### 防火墙和动态 IP 地址 ###

OpenVPN 本身是比较容易配置的，最麻烦的是处理防火墙和动态 IP 地址。防火墙种类众多，对于如何配置防火墙不拦截你的隧道，我把这个话题当作家庭作业留给你自己解决:P。OpenVPN 的端口是1194，你可以在防火墙上设置一个转发规则，用于将消息转发到你的目标服务器。

接下来处理另一件麻烦事：动态 IP 地址。[Dyn.com][3]可以提供一个廉价的方法，为你管理 ISP 分配给你的动态 IP，或者你也可以向你的 ISP 支付一笔费用，从而得到一个静态 IP。

至此，你可以宣告工作完成了，接下来的任务就是手动开启服务器端的 OpenVPN，让它一直运行在那里，等待你的登录。你可以将你的笔记本拿到外面，并随时随地随心所欲地连接到服务器。然而，关于 OpenVPN 的操作，我还有一些重要的知识点要讲，比如如何为 OpenVPN 设置开机启动，如何利用 Network Manager 自动建立连接，以及这篇 OpenVPN 教程中最重要的一块：如何访问你的远程服务器上的资源。请看下一篇。

--------------------------------------------------------------------------------

via: http://www.linux.com/learn/tutorials/743590-secure-remote-networking-with-openvpn-on-linux

译者：[bazz2](https://github.com/bazz2) 校对：[jasminepeng](https://github.com/jasminepeng)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://www.debian.org/security/2008/dsa-1571
[2]:http://www.linux.com/learn/tutorials/741573-put-a-talking-cow-in-your-linux-message-of-the-day
[3]:http://dyn.com/dns/

Linux 上的 MAC 地址欺骗
================================================================================
网卡生产商在每一张网卡（NIC）在出厂时都会在上面刻上一个48位的全球唯一标识符（GUID，例如08:4f:b5:05:56:a0），这串 GUID 就是网卡的 MAC 地址，用于确定一张网卡的身份。MAC 地址的高24位叫 OUI(Organizationally Unique Identifier 组织唯一标示符)，是为网卡设置 MAC 地址的组织的标识符，这样一来，不同组织设置的 MAC 地址就不会冲突了。（译注：实际生产中，并不是每个网络设备都有不同的MAC地址，有时候地址空间不足，生产商会给发往不同地区国家的产品中用相同的地址空间。）

虽然 MAC 地址由厂商指定，但用户可以改变它，这就是传说中的“MAC 地址欺骗”。本文将向大家展示**如何在 Linux 上玩 MAC 地址欺骗**。

### 为什么要玩 MAC 地址欺骗？ ###

想要理由？这里就给几个比较有技术含量的理由。 一些网络供应商会通过绑定你家路由器上的 MAC 地址来验证你的身份，这个时候如果你的路由器坏了，你怎么办？你可以暂时把你的电脑的 MAC 地址改成你家路由器的 MAC 地址，让你的 ISP 重新将你连入外网。（译注：有这种事情么？）

很多 DHCP 服务器会依赖 MAC 地址来分配 IP 地址。如果你想换一个分配给你的 IP 地址，你可以改改你的 MAC 地址。这样一来，你不必等着 DHCP 服务器给你重新分一个 IP 地址，而是马上就能得到一个新的。

除了技术原因外，这里也有一些比较正当的理由来说明你为什么需要改变你的 MAC 地址：为了隐私、为了安全，你要把你真正的 MAC 地址隐藏起来。不像处在 ISO 模型第三层的 IP 地址会经常变来变去，你的 MAC 地址可不会改变。在你说我多疑之前，请确定你知道[你的隐私][1]到底是什么东西。有一个入侵手段叫 [piggybacking][2]，黑客会在公共 WiFi 网络下伪装成你的 MAC 地址，并且在你不在场的时候伪装成你的身份进行黑客活动。

### 怎么临时性地改变 MAC 地址？ ###

你可以在 Linux 运行的时候改变 MAC 地址。需要注意的是当 MAC 地址转换的那一会时间，你的网络会掉线。当电脑重启时 MAC 地址又会变回原来的。下面介绍几种方法来改变你的 MAC 地址。

#### 方法一：iproute2 ####

    $ sudo ip link set dev eth0 down
    $ sudo ip link set dev eth0 address 00:00:00:00:00:01
    $ sudo ip link set dev eth0 up 

#### 方法二：macchanger ####

macchanger 这个命令可以让你把 MAC 地址改成不同生产厂商的序列号。

在 Debian，Ubuntu 或 Linux Mint 下安装 macchanger：

    $ sudo apt-get install macchanger 

在 Fedora 下安装 macchanger：

    $ sudo yum install macchanger 

在 CentOS 或 RHEL 下安装 macchanger：

    $ wget http://ftp.club.cc.cmu.edu/pub/gnu/macchanger/macchanger-1.6.0.tar.gz
    $ tar xvfvz macchanger-1.6.0.tar.gz
    $ cd macchanger-1.6.0 
    $ ./configure
    $ make
    $ sudo make install 

下面给出一些 macchanger 的高级使用例子。使用 macchanger 你不必再手动禁用、启用你的网卡。

仅仅改变 MAC 地址：

    $ sudo macchanger --mac=00:00:00:00:00:01 eth0 

在保证 OUI 一致的情况下为 MAC 设置一个随机地址：

    $ sudo macchanger -e eth0 

为 MAC 设置一个完全随机的地址：

    $ sudo macchanger -r eth0 

获取所有网卡的 MAC 地址，然后只列出指定的厂商（比如 Juniper）:

    $ macchanger -l | grep -i juniper 

![](https://c2.staticflickr.com/8/7409/12602895995_eeea1f7516.jpg)

显示一块网卡原来的 MAC 地址和伪装的 MAC 地址：

    $ macchanger -s eth0 

>     Current MAC:   56:95:ac:ee:6e:77 (unknown)
>     Permanent MAC: 00:0c:29:97:68:02 (Vmware, Inc.)

### 如何永久性地改变 MAC 地址？ ###

如果你想在系统重启后还保持伪装 MAC 地址，你需要编辑配置文件。比如你想改变 eth0 的 MAC 地址，按以下方法搞起：

#### 在 Fedora，CentOS 或 RHEL 下： ####

    $ sudo vi /etc/sysconfig/network-scripts/ifcfg-eth0 

>     DEVICE=eth0
>     MACADDR=00:00:00:00:00:01

或者你可以建一个开机启动的脚本放在 /etc/NetworkManager/dispatcher.d 目录下，前提是你使用 Network Manager 管理你的网络。这里假设你已经装了 macchanger，脚本内容如下：

    $ sudo vi /etc/NetworkManager/dispatcher.d/000-changemac 

>     #!/bin/bash
>  
>     case "$2" in
>         up)
>             macchanger --mac=00:00:00:00:00:01 "$1"
>             ;;
>     esac

    $ sudo chmod 755 /etc/NetworkManager/dispatcher.d/000-changemac 

#### 在 Debian，Ubuntu 或 Linux Mint 下： ####

新建一个开机启动脚本，放在 /etc/network/if-up.d/ 目录下：

    $ sudo vi /etc/network/if-up.d/changemac 

>     #!/bin/sh
>  
>     if [ "$IFACE" = eth0 ]; then
>       ip link set dev "$IFACE" address 00:00:00:00:00:01
>     fi

    $ sudo chmod 755 /etc/network/if-up.d/changemac 

--------------------------------------------------------------------------------

via: http://xmodulo.com/2014/02/spoof-mac-address-network-interface-linux.html

译者：[bazz2](https://github.com/bazz2) 校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://www.identityblog.com/?p=1131
[2]:http://en.wikipedia.org/wiki/Piggybacking_(Internet_access)

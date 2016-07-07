如何在 Linux 上从 NetworkManager 切换为 systemd-network
================================================================================
在 Linux 世界里，对 [systemd][1] 的采用一直是激烈争论的主题，它的支持者和反对者之间的战火仍然在燃烧。到了今天，大部分主流 Linux 发行版都已经采用了 systemd 作为默认的初始化（init）系统。

正如其作者所说，作为一个 “从未完成、从未完善、但一直追随技术进步” 的系统，systemd 已经不只是一个初始化进程，它被设计为一个更广泛的系统以及服务管理平台，这个平台是一个包含了不断增长的核心系统进程、库和工具的生态系统。

**systemd** 的其中一部分是 **systemd-networkd**，它负责 systemd 生态中的网络配置。使用 systemd-networkd，你可以为网络设备配置基础的 DHCP/静态 IP 网络。它还可以配置虚拟网络功能，例如网桥、隧道和 VLAN。systemd-networkd 目前还不能直接支持无线网络，但你可以使用 wpa_supplicant 服务配置无线适配器，然后把它和 **systemd-networkd** 联系起来。

在很多 Linux 发行版中，NetworkManager 仍然作为默认的网络配置管理器。和 NetworkManager 相比，**systemd-networkd** 仍处于积极的开发状态，还缺少一些功能。例如，它还不能像 NetworkManager 那样能让你的计算机在任何时候通过多种接口保持连接。它还没有为更高层面的脚本编程提供 ifup/ifdown 钩子函数。但是，systemd-networkd 和其它 systemd 组件（例如用于域名解析的 **resolved**、NTP 的**timesyncd**，用于命名的 udevd）结合的非常好。随着时间增长，**systemd-networkd**只会在 systemd 环境中扮演越来越重要的角色。

如果你对 **systemd-networkd** 的进步感到高兴，从 NetworkManager 切换到 systemd-networkd 是值得你考虑的一件事。如果你强烈反对 systemd，对 NetworkManager 或[基础网络服务][2]感到很满意，那也很好。

但对于那些想尝试 systemd-networkd 的人，可以继续看下去，在这篇指南中学会在 Linux 中怎么从 NetworkManager 切换到 systemd-networkd。

### 需求 ###

systemd 210 及其更高版本提供了 systemd-networkd。因此诸如 Debian 8 "Jessie" (systemd 215)、 Fedora 21 (systemd 217)、 Ubuntu 15.04 (systemd 219) 或更高版本的 Linux 发行版和 systemd-networkd 兼容。

对于其它发行版，在开始下一步之前先检查一下你的 systemd 版本。

    $ systemctl --version

### 从 NetworkManager 切换到 Systemd-networkd ###

从 NetworkManager 切换到 systemd-networkd 其实非常简答（反过来也一样）。

首先，按照下面这样先停用 NetworkManager 服务，然后启用 systemd-networkd。 

    $ sudo systemctl disable NetworkManager
    $ sudo systemctl enable systemd-networkd

你还要启用 **systemd-resolved** 服务，systemd-networkd用它来进行域名解析。该服务还实现了一个缓存式 DNS 服务器。

    $ sudo systemctl enable systemd-resolved
    $ sudo systemctl start systemd-resolved

当启动后，**systemd-resolved** 就会在 /run/systemd 目录下某个地方创建它自己的 resolv.conf。但是，把 DNS 解析信息存放在 /etc/resolv.conf 是更普遍的做法，很多应用程序也会依赖于 /etc/resolv.conf。因此为了兼容性，按照下面的方式创建一个到 /etc/resolv.conf 的符号链接。

    $ sudo rm /etc/resolv.conf
    $ sudo ln -s /run/systemd/resolve/resolv.conf /etc/resolv.conf

### 用 systemd-networkd 配置网络连接 ###

要用 systemd-networkd 配置网络服务，你必须指定带.network 扩展名的配置信息文本文件。这些网络配置文件保存到 /etc/systemd/network 并从这里加载。当有多个文件时，systemd-networkd 会按照字母顺序一个个加载并处理。

首先创建 /etc/systemd/network 目录。

    $ sudo mkdir /etc/systemd/network

#### DHCP 网络 ####

首先来配置 DHCP 网络。对于此，先要创建下面的配置文件。文件名可以任意，但记住文件是按照字母顺序处理的。

    $ sudo vi /etc/systemd/network/20-dhcp.network

----------

    [Match]
    Name=enp3*
    
    [Network]
    DHCP=yes

正如你上面看到的，每个网络配置文件包括了一个或多个 “sections”，每个 “section”都用 [XXX] 开头。每个 section 包括了一个或多个键值对。`[Match]` 部分决定这个配置文件配置哪个（些）网络设备。例如，这个文件匹配所有名称以 ens3 开头的网络设备（例如 enp3s0、 enp3s1、 enp3s2 等等）对于匹配的接口，然后启用 [Network] 部分指定的 DHCP 网络配置。

### 静态 IP 网络 ###

如果你想给网络设备分配一个静态 IP 地址，那就新建下面的配置文件。

    $ sudo vi /etc/systemd/network/10-static-enp3s0.network

----------

    [Match]
    Name=enp3s0
    
    [Network]
    Address=192.168.10.50/24
    Gateway=192.168.10.1
    DNS=8.8.8.8

正如你猜测的， enp3s0 接口地址会被指定为 192.168.10.50/24，默认网关是 192.168.10.1， DNS 服务器是 8.8.8.8。这里微妙的一点是，接口名 enp3s0 事实上也匹配了之前 DHCP 配置中定义的模式规则。但是，根据词汇顺序，文件 "10-static-enp3s0.network" 在 "20-dhcp.network" 之前被处理，对于 enp3s0 接口静态配置比 DHCP 配置有更高的优先级。 

一旦你完成了创建配置文件，重启 systemd-networkd 服务或者重启机器。

    $ sudo systemctl restart systemd-networkd

运行以下命令检查服务状态：

    $ systemctl status systemd-networkd
    $ systemctl status systemd-resolved

![](https://farm1.staticflickr.com/719/21010813392_76abe123ed_c.jpg)

### 用 systemd-networkd 配置虚拟网络设备 ###

**systemd-networkd** 同样允许你配置虚拟网络设备，例如网桥、VLAN、隧道、VXLAN、绑定等。你必须在用 .netdev 作为扩展名的文件中配置这些虚拟设备。

这里我展示了如何配置一个桥接接口。

#### Linux 网桥 ####

如果你想创建一个 Linux 网桥(br0) 并把物理接口(eth1) 添加到网桥，你可以新建下面的配置。

    $ sudo vi /etc/systemd/network/bridge-br0.netdev

----------

    [NetDev]
    Name=br0
    Kind=bridge

然后按照下面这样用 .network 文件配置网桥接口 br0 和从接口 eth1。

    $ sudo vi /etc/systemd/network/bridge-br0-slave.network

----------

    [Match]
    Name=eth1
    
    [Network]
    Bridge=br0

----------

    $ sudo vi /etc/systemd/network/bridge-br0.network

----------

    [Match]
    Name=br0
    
    [Network]
    Address=192.168.10.100/24
    Gateway=192.168.10.1
    DNS=8.8.8.8

最后，重启 systemd-networkd。

    $ sudo systemctl restart systemd-networkd

你可以用 [brctl 工具][3] 来验证是否创建好了网桥 br0。

### 总结 ###

当 systemd 誓言成为 Linux 的系统管理器时，有类似 systemd-networkd 的东西来管理网络配置也就不足为奇。但是在现阶段，systemd-networkd 看起来更适合于网络配置相对稳定的服务器环境。对于桌面/笔记本环境，它们有多种临时有线/无线接口，NetworkManager 仍然是比较好的选择。

对于想进一步了解 systemd-networkd 的人，可以参考官方[man 手册][4]了解完整的支持列表和关键点。

--------------------------------------------------------------------------------

via: http://xmodulo.com/switch-from-networkmanager-to-systemd-networkd.html

作者：[Dan Nanni][a]
译者：[ictlyh](http://mutouxiaogui.cn/blog)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://xmodulo.com/author/nanni
[1]:http://xmodulo.com/use-systemd-system-administration-debian.html
[2]:http://xmodulo.com/disable-network-manager-linux.html
[3]:http://xmodulo.com/how-to-configure-linux-bridge-interface.html
[4]:http://www.freedesktop.org/software/systemd/man/systemd.network.html

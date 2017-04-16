如何在 Ubuntu 以及 Debian 中安装 DHCP 服务器
============================================================

**动态主机配置协议（DHCP）** 是一种用于使主机能够从服务器自动分配 IP 地址和相关的网络配置的网络协议。

DHCP 服务器分配给 DHCP 客户端的 IP 地址处于“租用”状态，租用时间通常取决于客户端计算机要求连接的时间或 DHCP 服务器配置的时间。

#### DHCP 如何工作？

以下是 DHCP 实际工作原理的简要说明：

*   一旦客户端（配置为使用 DHCP 的机器）连接到网络后，它会向 DHCP 服务器发送 **DHCPDISCOVER** 数据包。
*   当 DHCP 服务器收到 **DHCPDISCOVER** 请求报文后会使用 **DHCPOFFER** 包进行回复。
*   然后客户端获取到 **DHCPOFFER** 数据包，并向服务器发送一个 **DHCPREQUEST** 包，表示它已准备好接收 **DHCPOFFER** 包中提供的网络配置信息。
*   最后，DHCP 服务器从客户端收到 **DHCPREQUEST** 报文后，发送 **DHCPACK** 报文，表示现在允许客户端使用分配给它的 IP 地址。

在本文中，我们将介绍如何在 Ubuntu/Debian Linux 中设置 DHCP 服务器，我们将使用 [sudo 命令][1]来运行所有命令，以获得 root 用户权限。

### 测试环境设置

在这步中我们会使用如下的测试环境。

- DHCP Server - Ubuntu 16.04 
- DHCP Clients - CentOS 7 and Fedora 25

### 步骤 1：在 Ubuntu 中安装 DHCP 服务器

1、 运行下面的命令来安装 DHCP 服务器包，也就是 **dhcp3-server**。

```
$ sudo apt install isc-dhcp-server
```

2、 安装完成后，编辑 `/etc/default/isc-dhcp-server` 使用 `INTERFACES` 选项定义 DHCPD 响应 DHCP 请求所使用的接口。

比如，如果你想让 DHCPD 守护进程监听 `eth0`，按如下设置：

```
INTERFACES="eth0"
```

同样记得为上面的接口[配置静态地址][2]。

### 步骤 2：在 Ubuntu 中配置 DHCP 服务器

3、 DHCP 配置的主文件是 `/etc/dhcp/dhcpd.conf`， 你必须填写会发送到客户端的所有网络信息。

并且 DHCP 配置中定义了两种不同的声明，它们是：

*   `parameters` - 指定如何执行任务、是否执行任务，还有指定要发送给 DHCP 客户端的网络配置选项。
*   `declarations` - 定义网络拓扑、指定客户端、为客户端提供地址，或将一组参数应用于一组声明。

4、 现在打开并修改主文件，定义 DHCP 服务器选项：

```
$ sudo vi /etc/dhcp/dhcpd.conf 
```

在文件顶部设置以下全局参数，它们将应用于下面的所有声明（请指定适用于你情况的值）：

```
option domain-name "tecmint.lan";
option domain-name-servers ns1.tecmint.lan, ns2.tecmint.lan;
default-lease-time 3600; 
max-lease-time 7200;
authoritative;
```

5、 现在定义一个子网，这里我们为 `192.168.10.0/24` 局域网设置 DHCP （请使用适用你情况的参数）：

```
subnet 192.168.10.0 netmask 255.255.255.0 {
option routers                  192.168.10.1;
option subnet-mask              255.255.255.0;
option domain-search            "tecmint.lan";
option domain-name-servers      192.168.10.1;
range   192.168.10.10   192.168.10.100;
range   192.168.10.110   192.168.10.200;
}
```

### 步骤 3：在 DHCP 客户端上配置静态地址

6、 要给特定的客户机分配一个固定的（静态）的 IP，你需要显式将这台机器的 MAC 地址以及静态分配的地址添加到下面这部分。

```
host centos-node {
hardware ethernet 00:f0:m4:6y:89:0g;
fixed-address 192.168.10.105;
}
host fedora-node {
hardware ethernet 00:4g:8h:13:8h:3a;
fixed-address 192.168.10.106;
}
```

保存并关闭文件。

7、 接下来，启动 DHCP 服务，并让它下次开机自启动，如下所示：

```
------------ SystemD ------------ 
$ sudo systemctl start isc-dhcp-server.service
$ sudo systemctl enable isc-dhcp-server.service
------------ SysVinit ------------ 
$ sudo service isc-dhcp-server.service start
$ sudo service isc-dhcp-server.service enable
```

8、 接下来不要忘记允许 DHCP 服务（DHCP 守护进程监听 67 UDP 端口）的防火墙权限：

```
$ sudo ufw allow  67/udp
$ sudo ufw reload
$ sudo ufw show
```

### 步骤 4：配置 DHCP 客户端

9、 此时，你可以将客户端计算机配置为自动从 DHCP 服务器接收 IP 地址。

登录到客户端并编辑以太网接口的配置文件（注意接口名称/号码）：

```
$ sudo vi /etc/network/interfaces
```

定义如下选项：

```
auto  eth0
iface eth0 inet dhcp
```

保存文件并退出。重启网络服务（或重启系统）：

```
------------ SystemD ------------ 
$ sudo systemctl restart networking
------------ SysVinit ------------ 
$ sudo service networking restart
```

另外你也可以使用 GUI 来在进行设置，如截图所示（在 Fedora 25 桌面中）设置将方式设为自动（DHCP）。

[
 ![Set DHCP Network in Fedora](http://www.tecmint.com/wp-content/uploads/2017/03/Set-DHCP-Network-in-Fedora.png) 
][3]

*在 Fedora 中设置 DHCP 网络*

此时，如果所有设置完成了，你的客户端应该可以自动从 DHCP 服务器接收 IP 地址了。

就是这样了！在本篇教程中，我们向你展示了如何在 Ubuntu/Debian 设置 DHCP 服务器。在反馈栏中分享你的想法。如果你正在使用基于 Fedora 的发行版，请阅读如何在 CentOS/RHEL 中设置 DHCP 服务器。

--------------------------------------------------------------------------------
作者简介：

Aaron Kili 是 Linux 和 F.O.S.S 爱好者，将来的 Linux SysAdmin 和 web 开发人员，目前是 TecMint 的内容创建者，他喜欢用电脑工作，并坚信分享知识。

--------------------------------------------------------------------------------

via: http://www.tecmint.com/install-dhcp-server-in-ubuntu-debian/

作者：[Aaron Kili][a]
译者：[geekpi](https://github.com/geekpi)
校对：[jasminepeng](https://github.com/jasminepeng)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/aaronkili/
[1]:https://linux.cn/tag-sudo.html
[2]:http://www.tecmint.com/set-add-static-ip-address-in-linux/
[3]:http://www.tecmint.com/wp-content/uploads/2017/03/Set-DHCP-Network-in-Fedora.png
[4]:http://www.tecmint.com/author/aaronkili/
[5]:http://www.tecmint.com/10-useful-free-linux-ebooks-for-newbies-and-administrators/
[6]:http://www.tecmint.com/free-linux-shell-scripting-books/

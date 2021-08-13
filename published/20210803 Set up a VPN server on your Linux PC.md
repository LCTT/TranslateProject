[#]: subject: (Set up a VPN server on your Linux PC)
[#]: via: (https://opensource.com/article/21/8/openvpn-server-linux)
[#]: author: (D. Greg Scott https://opensource.com/users/greg-scott)
[#]: collector: (lujun9972)
[#]: translator: (perfiffer)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13680-1.html)

如何在免费 WiFi 中保护隐私（一）
======

> 第一步是安装一个“虚拟专用网络”服务器。

![](https://img.linux.net.cn/data/attachment/album/202108/13/213142rclc5htyfahotfas.jpg)

你是否连接到了不受信任的网络，例如酒店或咖啡馆的 WiFi，而又需要通过智能手机和笔记本电脑安全浏览互联网？通过使用虚拟专用网络，你可以匿名访问不受信任的网络，就像你在专用网络上一样安全。

“虚拟专用网络” 是保护私人数据的绝佳工具。通过使用 “虚拟专用网络”，你可以在保持匿名的同时连接到互联网上的专用网络。

可选的 “虚拟专用网络” 服务有很多，[0penVPN][2] 依然是很多人在使用不受信任的网络时保护私人数据的第一选择。

0penVPN 在两点之间创建一个加密通道，防止第三方访问你的网络流量数据。通过设置你的 “虚拟专用网络” 服务，你可以成为你自己的 “虚拟专用网络” 服务商。许多流行的 “虚拟专用网络” 服务都使用 0penVPN，所以当你可以掌控自己的网络时，为什么还要将你的网络连接绑定到特定的提供商呢？ 

### 搭建 Linux 服务器

首先，在备用 PC 上安装一份 Linux。本例使用 Fedora，但是不论你使用的是什么 Linux 发行版，步骤基本是相同的。

从 [Fedora 项目][3] 网站下载最新的 Fedora ISO 副本。制作一个 USB 启动盘，将其插入到你的 PC 并启动，然后安装操作系统。如果你从未制作过可引导的 USB 启动盘，可以了解一下 [Fedora Media Writer][4]。如果你从未安装过 Linux，请阅读 [三步安装 Linux][5]。

### 设置网络

安装完成 Fedora 操作系统后，登录到控制台或者 SSH 会话。

更新到最新并重新启动：

```
$ sudo dnf update -y && reboot
```

重新登录并关闭防火墙：

```
systemctl disable firewalld.service
systemctl stop firewalld.service
```

你可能希望在此系统上为你的内部网络添加适当的防火墙规则。如果是这样，请在关闭所有防火墙规则后完成 0penVPN 的设置和调试，然后添加本地防火墙规则。想要了解更多，请参照 [在 Linux 上设置防火墙][6]。

### 设置 IP 地址

你需要在你的本地网络设置一个静态 IP 地址。下面的命令假设在一个名为 `ens3` 的设备上有一个名为 `ens3` 的<ruby>网络管理器<rt>Network Manager</rt></ruby>连接。你的设备和连接名称可能不同，你可以通过打开 SSH 会话或从控制台输入以下命令：

```
$ sudo nmcli connection show
NAME  UUID                                  TYPE      DEVICE
ens3  39ad55bd-adde-384a-bb09-7f8e83380875  ethernet  ens3
```

你需要确保远程用户能够找到你的 “虚拟专用网络” 服务器。有两种方法可以做到这一点。你可以手动设置它的 IP 地址，或者将大部分工作交给你的路由器去完成。

#### 手动配置一个 IP 地址

通过以下命令来设置静态 IP 地址、前缀、网关和 DNS 解析器，用来替换掉原有的 IP 地址：

```
$ sudo nmcli connection modify ens3 ipv4.addresses 10.10.10.97/24
$ sudo nmcli connection modify ens3 ipv4.gateway 10.10.10.1
$ sudo nmcli connection modify ens3 ipv4.dns 10.10.10.10
$ sudo nmcli connection modify ens3 ipv4.method manual
$ sudo nmcli connection modify ens3 connection.autoconnect yes
```

设置主机名：

```
$ sudo hostnamectl set-hostname OVPNserver2020
```

如果你运行了一个本地的 DNS 服务，你需要设置一个 DNS 条目，将主机名指向 “虚拟专用网络” 服务器的 IP 地址。

重启并确保系统的网络运行正常。

#### 在路由器中配置 IP 地址

在你的网络当中应该有一台路由器。你可能已经购买了它，或者从互联网服务提供商（ISP）那里获得了一台。无论哪种方式，你的路由器可能都有一个内置的 DHCP 服务，可以为连接到网络上的每台设备分配一个 IP 地址。你的新 “虚拟专用网络” 服务器也是属于网络的一台设备，因此你可能已经注意到它会自动分配一个 IP 地址。

这里的潜在问题是你的路由器不能保证每台设备都能在重新连接后获取到相同的 IP 地址。路由器确实尝试保持 IP 地址一致，但这会根据当时连接的设备数量而发生变化。

但是，几乎所有的路由器都会有一个界面，允许你为特定设备调停和保留 IP 地址。

![Router IP address settings][7]

路由器没有统一的界面，因此请在你的路由器接口中搜索 “DHCP” 或 “Static IP address” 选项。为你的服务器分配自己的预留 IP 地址，使其在网络中保持 IP 不变。

### 连接到服务器

默认情况下，你的路由器可能内置了防火墙。这通常很好，因为你不希望网络之外的人能够强行进入你的任何计算机。但是，你必须允许发往 “虚拟专用网络” 服务器的流量通过防火墙，否则你的 “虚拟专用网络” 将无法访问，这种情况下你的 “虚拟专用网络” 服务器将形同虚设。

你至少需要一个来自互联网服务提供商的公共静态 IP 地址。使用其静态 IP 地址设置路由器的公共端，然后将你的 0penVPN 服务器放在专用端，在你的网络中使用专用静态 IP 地址。 0penVPN 默认使用 UDP 1194 端口。配置你的路由器，将你的公网 “虚拟专用网络” IP 地址的 UDP 1194 端口转发到 0penVPN 服务器上的 UDP 1194 端口。如果你决定使用不同的 UDP 端口，请相应地调整端口号。

### 准备好，我们开始下一步

在本文中，你在服务器上安装并配置了一个操作系统，这已经成功了一半。在下一篇文章中，你将解决安装和配置 0penVPN 本身的问题。同时，请熟悉你的路由器并确保你可以从外部访问你的服务器。但是请务必在测试后关闭端口转发，直到你的 “虚拟专用网络” 服务启动并运行。

本文的部分内容改编自 D. Greg Scott 的博客，并经许可重新发布。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/8/openvpn-server-linux

作者：[D. Greg Scott][a]
选题：[lujun9972][b]
译者：[perfiffer](https://github.com/perfiffer)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/greg-scott
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/coffee_tea_laptop_computer_work_desk.png?itok=D5yMx_Dr (Person drinking a hot drink at the computer)
[2]: https://openvpn.net/
[3]: http://getfedora.org
[4]: https://opensource.com/article/20/10/fedora-media-writer
[5]: https://opensource.com/article/21/2/linux-installation
[6]: https://www.redhat.com/sysadmin/secure-linux-network-firewall-cmd
[7]: https://opensource.com/sites/default/files/uploads/reserved-ip.jpg (Router IP address settings)
[8]: https://creativecommons.org/licenses/by-sa/4.0/
[9]: https://opensource.com/article/20/9/firewall
[10]: https://www.dgregscott.com/how-to-build-a-vpn-in-four-easy-steps-without-spending-one-penny/

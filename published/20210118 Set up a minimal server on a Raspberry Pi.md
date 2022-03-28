[#]: collector: (lujun9972)
[#]: translator: (hwlife)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-14405-1.html)
[#]: subject: (Set up a minimal server on a Raspberry Pi)
[#]: via: (https://opensource.com/article/21/1/minimal-server-raspberry-pi)
[#]: author: (Alan Formy-Duval https://opensource.com/users/alanfdoss)

在树莓派上创建一个最小化的服务器
======

> 不要急着丢弃那台旧树莓派，这个详细步骤的指南展示了我怎样用最小化设置来充分利用我珍贵的树莓派系统资源。

![](https://img.linux.net.cn/data/attachment/album/202203/28/161221byrmba9ayvvmbbkx.jpg)

最近，我的 [树莓派][2] 上的 microSD 储存卡不工作了。它已经作为服务器持续使用将近两年了，这为我提供了一个开始探索和修正问题的好机会。在初始化安装完成以后，它开始出现一些磁盘方面的问题，并且官方的树莓派操作系统发布了一个有重大意义的更新（并从 Raspbian 更名为<ruby>树莓派操作系统<rt>Raspberr Pi OS</rt></ruby>）。所以我买了一个新的储存卡并开始重装。

尽管树莓派 3B 不是最新的硬件，但对于运行多样化服务的最小化的服务器还是足够的。我认为我之前的安装使用了完整的安装镜像，包括了图形用户界面和许多其他的软件包是没有必要的。

这个详细步骤的指南展示了我怎样用最小化设置来充分利用我珍贵的树莓派系统资源。

### 开始

首先，要为树莓派创建一个新的系统驱动器。这需要两样东西：系统镜像文件和一张 microSD 储存卡。

#### 下载树莓派系统镜像文件

虽然有好几种操作系统可供选择，但我坚持选择树莓派官方支持的系统。

第一步是从 [树莓派操作系统][3] 官方网站上下载最新的系统镜像文件到计算机，然后后写入储存卡。他们提供了三个不同的镜像，我选择了精简版。它是最小化的操作系统，只包含基本系统必要的文件，所以它占用最少的磁盘空间和系统内存。（当我下载系统的时候，发布日期是 2020 年 8 月 20 日，但是它现在肯定已经更新了。我觉得不会有什么巨大不同，但是我建议读一下发行说明。）

#### 将树莓派系统镜像写到储存卡

第二步是写下载的系统镜像到储存卡。我的卡之前用过，当我把它插入我的 Linux 桌面计算机之后，它自动加载了两个存在的分区。在我卸载这两个分区前，我不能写入镜像。

要这样做，我必须得用下面的 `lsblk` 命令来确定它们的路径，经确定，该设备路径为 `/dev/mmcblk0`：

```
# lsblk -p
```

我用 `umount` 命令卸载了这两个分区：

```
# umount /dev/mmcblk0p2
# umount /dev/mmcblk0p1
```

一旦分区被卸载，就可以将镜像文件写入到储存卡了。尽管有许多图形化的写入工具，我还是习惯是用古老的 `dd` 命令：

```
# dd bs=4M if=/home/alan/Downloads/raspios/2020-08-20-raspios-buster-armhf-lite.img of=/dev/mmcblk0 status=progress conv=fsync
```

#### 启动树莓派

你只需要一个显示器、键盘、电源适配器来使用树莓派。我还有一个以太网网线用于网络连接，相比无线网络，我更喜欢通过网线来连接一个专用的服务器。

插入储存卡并打开树莓派的电源。一旦成功启动，用默认的缺省密码来进行登录：用户名 `pi`，密码`raspberry`。

### 系统设置

按照以下步骤尽可能最小化设置磁盘空间、内存使用等。我建议尽可能的花时间研究每个配置，使之尽量正确。通常有几种应用配置的方法，有些配置文件和选项可能会被丢弃，所以要查看产品文档确保你没有应用过时的配置。

#### 运行 raspi-config

树莓派系统的主设置程序叫做 `raspi-config`。登录以后立即运行它：

```
# raspi-config
```

![Raspberry Pi config main window][4]

它出现了一个扩展根文件系统的选项，可以利用储存卡上所有可利用的空间。选择这个选项之后，重启并重新登录。

用 `df` 命令来验证储存卡的总容量是否被完全使用：

```
# df -h
```

如果你需要设置其他选项，请再次运行 `raspi-config`。它们中的一些选项可以根据你的偏好和配置进行变化。仔细检查所有这些选项，确定没有任何遗漏。为了获得最佳性能，我建议做以下调整。（我跳过了一些我们没有做任何变化的选项。）

  * <ruby>系统选项<rt>System options</rt></ruby>：在此你可以设置主机名，最好使用完全限定的域名（FQDN）。你也能在这里更改你的密码，这始终是强烈建议的。
  * <ruby>接口选项<rt>Interface options</rt></ruby>：开启 SSH 服务。
  * <ruby>性能选项<rt>Performance options</rt></ruby>：将 GPU 内存减少到最低值（16MB）。
  * <ruby>本地化选项<rt>Localization options</rt></ruby>：选择你的时区、位置、键盘类型。
  * <ruby>高级选项<rt>Advanced options</rt></ruby>：这个选项包括扩展根文件系统的选项。如果你在上面没扩展，一定要在这里做。这样你可以访问储存卡上的所有可用空间。
  * <ruby>更新<rt>Update</rt></ruby>：进入更新选项会立即检查 `raspi-config` 工具是否有更新。如果更新可用，它将被下载并应用，`raspi-config` 将在几秒钟后重启。

一旦你在 `raspi-config` 中完成这些配置，选择“<ruby>完成<rt>Finish</rt></ruby>”退出该工具。

#### 手动配置

我还建议几个其他更改，它们全都要求编辑某种配置文件来手动更改设置。

##### 设置静态 IP 地址

一般来说，最好用静态 IP 地址设置服务器。通过 `ip` 命令来验证网络接口，并设置 IP 地址和你的缺省网关（路由器）和域名服务（DNS）地址：

```
# ip link
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN mode DEFAULT group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
2: eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast state UP mode DEFAULT group default qlen 1000
    link/ether b8:27:eb:48:3f:46 brd ff:ff:ff:ff:ff:ff
```

你还需要知道你的缺省网关和一个及以上的 DNS 服务器地址。将这些信息添加到 `/etc/dhcpcd.conf` 配置文件中（我强烈建议更改之前对这个文件做一个备份）：

```
# cd /etc
# cp -a dhcpcd.conf dhcpcd.conf.original
```

按照以下来编辑文件：

```
# vi dhcpcd.conf

# static IP configuration:
interface eth0
static ip_address=192.168.1.5/24
static routers=192.168.1.1
static domain_name_servers=192.168.1.3 192.168.1.4
```

##### 关闭 IPv6 协议

除非你有特别需要使用 IPv6，否则你可能倾向于禁用它。为此，你可以创建两个新文件，其中包括一个单行指令，指示 Linux 内核不要使用 IPv6。

首先，创建 `/etc/sysctl.d/disable-ipv6.conf` 文件，其中包含一行指令：

```
# cd /etc/sysctl.d
# echo "net.ipv6.conf.all.disable_ipv6 = 1" > disable-ipv6.conf
```

然后创建 `/etc/modprobe.d/blacklist-ipv6.conf` 文件包含一行指令：

```
# cd /etc/modprobe.d
# echo "blacklist ipv6" > blacklist-ipv6.conf
```

##### 关闭 Wi-Fi、蓝牙和音频

我的服务器的具体用途并不需要蓝牙和音频，同时，它用以太网连接，并不使用无线（Wi-Fi）。除非你计划用它们，否则按照以下步骤来关闭它们。

对 `/boot/config.txt` 这个文件做以下更改（再次强调，我建议为这个文件做个备份）：

```
# cd /boot
# cp -a config.txt config.txt.original
```

加入以下两个指令到文件底部来禁用蓝牙和 Wi-Fi：

  * `dtoverlay=disable-bt`
  * `dtoverlay=disable-wifi`

这些 `echo` 命令就可以完成：

```
# cd /boot
# echo "dtoverlay=disable-bt" >> config.txt
# echo "dtoverlay=disable-wifi" >> config.txt
```

要关闭音频，更改 `dtparam=audio` 的参数为 `off`。你可以用一个简短的命令 `sed` 来完成：

```
# sed -i '/dtparam=audio/c dtparam=audio=off' config.txt
```


最后一步是禁用 Wi-Fi 服务，用 `systemctl mask` 命令来操作：

```
systemctl mask wpa_supplicant.service
```

如果你不需要其他服务的话，也可以禁用它们：

* 禁用调制解调器服务：`systemctl disable hciuart`
* 禁用 Avahi 守护进程：`systemctl disable avahi-daemon.service`

### 最后一步

检查你的内存使用量：

```
# free -h
```
我震惊了：我的系统只用了 30MB 的内存。

创建个人账户：建议为登录这台服务器的个人创建用户账户。你能分配他们到 `sudo` 组允许他们运行管理命令。举个例子，创建一个用户名为 George 的一个账户。

```
# adduser george
# usermod -a -G adm,sudo,users george 
```

进行更新：这是一个重要的步骤。应用更新来获取树莓派操作系统的最新修复。

```
# apt update
# apt full-upgrade
```

重启：重启你的新服务器是一个好主意: 

```
# systemctl reboot
```

安装 Cockpit：你可以在树莓派系统上安装著名的 Linux Web 控制台 [Cockpit][5]，它提供了一个基于 HTML 界面来远程管理和监控你的服务器。我最近写了一篇 [Cockpit 入门][6] 的文章。用这个命令来安装它

```
# apt install cockpit
```

现在我的树莓派服务器已经准备好托管服务器了，我能用它来做 [网页服务器][7]、[VPN 服务器][8]、 [Minetest][9] 等游戏服务器，或者就像我做的基于 [Pi-Hole 的广告屏蔽器][10] 。

### 保持旧硬件的活力

不论你有什么硬件，仔细地精简并控制你的操作系统和软件包，可以使你的系统资源使用量保持在低水平，以便你获得最大收益。这还可以通过减少试图利用漏洞的潜在恶意行为者可用的服务和软件包数量，提高了安全性。

因此，在你丢弃旧硬件之前，考虑一下能够继续使用的各种可能性。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/1/minimal-server-raspberry-pi

作者：[Alan Formy-Duval][a]
选题：[lujun9972][b]
译者：[hwlife](https://github.com/hwlife)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/alanfdoss
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/RaspberryPi.SUNY_.jpg?itok=uS_-VUcb (Raspberry Pi board Model B)
[2]: https://opensource.com/resources/raspberry-pi
[3]: https://www.raspberrypi.org/software/operating-systems
[4]: https://opensource.com/sites/default/files/uploads/raspi-config-main.png (Raspberry Pi config main window)
[5]: https://cockpit-project.org/
[6]: https://opensource.com/article/20/11/cockpit-server-management
[7]: https://opensource.com/article/17/3/building-personal-web-server-raspberry-pi-3
[8]: https://opensource.com/article/19/6/raspberry-pi-vpn-server
[9]: https://github.com/minetest
[10]: https://opensource.com/article/18/2/block-ads-raspberry-pi

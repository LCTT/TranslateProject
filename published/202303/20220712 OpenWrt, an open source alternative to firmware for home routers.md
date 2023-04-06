[#]: subject: "OpenWrt, an open source alternative to firmware for home routers"
[#]: via: "https://opensource.com/article/22/7/openwrt-open-source-firmware"
[#]: author: "Stephan Avenwedde https://opensource.com/users/hansic99"
[#]: collector: "lkxed"
[#]: translator: "wxy"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-15671-1.html"

OpenWrt：一个开源的家用路由器固件替代品
======

![][0]

> OpenWrt 是一个基于 Linux 的开源操作系统，主要针对嵌入式网络设备。

如果你在家里阅读这篇文章，你可能是用一个 LTE/5G/DSL/WIFI 路由器联网的。这种设备通常负责在你的本地设备（智能手机、PC、电视等）之间路由数据包，并通过内置的调制解调器提供对 WWW 的访问。你家里的路由器很可能有一个基于网页的界面，用于配置该设备。这种界面往往过于简单，因为它们是为普通用户制作的。

如果你想要更多的配置选项，但又不想花钱买一个专业的设备，你应该看看其他的固件，如 [OpenWrt][2]。

### OpenWrt 的特点

OpenWrt 是一个基于 Linux 的、针对嵌入式网络设备的开源操作系统。它主要用于替代各种家用路由器上的原始固件。OpenWrt 具备一个好的路由器应该具备的所有有用功能，如 DNS 服务器（[dnsmasq][3]），WiFi 接入点（AP）和客户端功能，用于调制解调器功能的 PPP 协议，而且，与标准固件不同，这一切都是可以完全配置的。

#### LuCI 网页界面

OpenWrt 可以通过命令行（SSH）或使用 GUI 配置界面（[LuCI][4]）进行远程配置。LuCI 是一个用 [Lua][5] 编写的轻量级、可扩展的网页 GUI，它可以精确地配置你的设备。除了配置，LuCI 还提供了很多额外的信息，如实时图表、系统日志和网络诊断。

![LuCI 网页界面][6]

LuCI 有一些可选的扩展，以增加更多的配置选择。

#### 可写文件系统

它的另一个亮点是可写文件系统。原有的固件通常是只读的，而 OpenWrt 配备了一个可写的文件系统，这要归功于一个巧妙的解决方案，它将 OverlayFS 与 SquashFS/JFFS2 文件系统相结合，允许安装软件包以增强功能。在 [OpenWrt 文档][8] 中可以找到更多关于文件系统架构的信息。

#### 扩展

OpenWrt 有一个相关的软件包管理器，[opkg][9]，它允许安装额外的服务，比如 FTP 服务器、DLNA 媒体服务器、OpenVPN 服务器、用于实现文件共享的 Samba 服务器、控制电话的 Asterisk 等等。当然，有些扩展需要适当的底层硬件资源。

### 动机

你可能想知道为什么要冒着对你的设备造成不可修复的损害和失去保修的风险，而尝试更换路由器制造商的固件。如果你的设备以你想要的方式工作，那么你可能不应该。永远不要碰一个正在运行的系统！但是，如果你想增强功能，或者你的设备缺乏配置选项，那么你应该看看 OpenWrt 是否可以成为一种补救措施。

在我的例子中，我想要一个旅行用的路由器，当我在露营地的时候，我可以把它放在一个合适的位置，以便让其它设备与这个本地 WiFi 接入点（AP）保持良好连接。该路由器将作为一个普通的客户端连接到互联网，并广播它的 WiFi 接入点让我的其它设备连接到它。这样我就可以配置我的所有设备与这个路由器的接入点连接，当我在其他地方时我只需要改变路由器的客户端连接。此外，在一些露营地，你只能得到一个单一设备的访问代码，我可以通过这种设置来加强。

作为我的旅行路由器，我选择 TP-Link TL-WR902AC 的原因如下：

* 很小
* 两根 WiFi 天线
* 5V 电源（USB）
* 低功耗
* 成本效益高（你以 30 美元左右的价格得到它）

为了了解它的尺寸，这里是它在树莓派 4 旁边的样子：

![TP-Link TL-WR902AC 在树莓派旁边][10] 

尽管这个路由器带来了我所需要的所有硬件功能，但我很快发现，默认的固件并不能让我按照我想要的方式配置它。该路由器主要是作为一个 WiFi 接入点，它可以复制现有的 WiFi 网络或通过板载以太网接口将自己连接到网络。默认的固件对于这些使用情况是非常有限的。

（LCTT 译注：此型号国内没有销售，它的特点之一是可以通过插入 3G/4G USB 网卡连接到互联网，但由于它不在国内销售，所以没有支持哪种国内 3G/4G USB 网卡的说明，我 [查下来](https://www.tp-link.com/lk/support/3g-comp-list/tl-wr902ac/?location=1963) 似乎华为的 E3372h-320 是可用的。有相关实践的同学可以分享一下经验。

国内销售的其它类似型号只能通过以太网口或 WiFi 连接到互联网，这种情况下，如果只能通过 3G/4G 连接互联网，那需要另外买一个随身 WiFi /移动路由器。）

幸运的是，该路由器能够运行 OpenWrt，所以我决定用它来替换原来的固件。

### 安装

当你的 LTE/5G/DSL/WiFi 路由器符合 [最低要求][12] 时，很有可能在它上面运行 OpenWrt。下一步，你要查看 [硬件表][13]，检查你的设备是否被列为兼容，以及你要选择哪个固件包。OpenWrt 的 [TP-Link TL-WR902AC][14] 的页面还包括安装说明，其中描述了如何刷入内部存储器。

刷入固件的过程在不同的设备之间可能会有所不同，所以我就不详细介绍了。简而言之，我必须通过将设备连接到一个具有特定 IP 地址的网络接口上的 TFTP 服务器，重命名 OpenWrt 固件文件，然后按复位按钮启动设备。

### 配置

一旦刷入成功，你的设备现在应该用新的固件启动了。现在启动可能需要更长的时间，因为与默认固件相比，OpenWrt 具有更多的功能。

为了开始配置，需要在你的 PC 和路由器之间建立一个直接的以太网连接，OpenWrt 在此充当了一个 DHCP 服务器，并将你的 PC 的以太网适配器配置为一个 DHCP 客户端。

在 Fedora Linux 上，要激活你的网络适配器的 DHCP 客户端模式，首先你必须通过运行找出连接的 UUID：

```
$ nmcli connection show
NAME          UUID         TYPE      DEVICE 
Wired Conn 1  7a96b...27a  ethernet  ens33
virbr0        360a0...673  bridge   virbr0
testwifi      2e865...ee8  wifi     --
virbr0        bd487...227  bridge   --
Wired Conn 2  16b23...7ba  ethernet --
```

选择你要修改的连接的 UUID，然后运行：

```
$ nmcli connection modify <UUID> ipv4.method auto
```

你可以在 [Fedora 联网维基][15] 中找到更多关于这些命令的信息。

在你连接到路由器后，打开一个网页浏览器并导航到 [http://openwrt/][16]。现在你应该看到 LuCI 的登录管理器：

![LuCI 登录][17]

使用 `root` 作为用户名，并将密码留空。

### 配置 WiFi 和路由

要配置你的 WiFi 天线，请点击 “<ruby>网络<rt>Network</rt></ruby>” 菜单并选择 “<ruby>无线<rt>Wireless</rt></ruby>”。

![LuCI 无线配置][19]

在我的设备上，上面的天线 `radio0` 工作在 2.4GHz 模式，并连接到名为 `MOBILE-INTERNET` 的本地接入点。下面的天线 `radio1` 工作在 5GHz，有一个相关的接入点，SSID 为 `OpenWrt_AV`。通过点击 “<ruby>编辑<rt>Edit</rt></ruby>” 按钮，你可以打开设备配置，以决定该设备属于 LAN 还是 WWAN 网络。在我的例子中，接入点 `OpenWrt_AV` 属于 LAN 网络，客户端连接 `MOBILE-INTERNET` 属于 WWAN 网络。

![LuCI 配置屏幕][21]

配置的网络在 “<ruby>接口<rt>Interfaces</rt></ruby>” 面板的 “<ruby>网络<rt>Network</rt></ruby>” 下列出。

![设备列表][23]

为了获得我想要的功能，网络流量必须在 LAN 和 WWAN 网络之间进行路由。路由可以在 “<ruby>网络<rt>Network</rt></ruby>” 面板的 “<ruby>防火墙<rt>Firewall</rt></ruby>” 部分进行配置。我没有在这里做任何改动，因为在默认情况下，网络之间的流量是被路由的，而传入的数据包（从 WWAN 到 LAN）必须通过防火墙。

![防火墙设置][28]

因此，你需要知道的是一个接口是属于 LAN 还是 (W)WAN。这个概念使它相对容易配置，特别是对初学者来说。你可以在 [OpenWrt 联网基础][25] 指南中找到更多信息。

### 专属门户

公共 WiFi 接入点通常受到 [专属门户][26] 的保护，你必须输入一个访问代码或类似的代码。通常情况下，当你第一次连接到接入点并试图打开一个任意的网页时，这种门户就会出现。这种机制是由接入点的 DNS 服务器实现的。

默认情况下，OpenWrt 激活了一个安全功能，可以防止连接的客户端受到 [DNS 重新绑定攻击][27]。OpenWrt 的重新绑定保护也阻止了专属门户网站被转发到客户端，所以你必须禁用重新绑定保护，以便你可以到达专属门户网站。这个选项在 “<ruby>网络<rt>Network</rt></ruby>” 菜单的 “<ruby>DHCP 和 DNS<rt>DHCP and DNS</rt></ruby>” 面板中。

### 尝试 OpenWrt

由于升级到 OpenWrt，我得到了一个基于商品硬件的灵活的旅行路由器。OpenWrt 使你的路由器具有完全的可配置性和可扩展性，而且由于其制作精良的网页 GUI，它也适合初学者使用。甚至有一些 [精选路由器][30] 在出厂时已经安装了 OpenWrt。你还可以用很多 [可用的软件包][31] 来增强你的路由器的功能。例如，我正在使用 [vsftp][32] FTP 服务器，在连接的 U 盘上托管一些电影和电视剧。看看该 [项目主页][33]，在那里你可以找到许多切换到 OpenWrt 的理由。

图片来自： Stephan Avenwedde，[CC BY-SA 4.0][7]

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/7/openwrt-open-source-firmware

作者：[Stephan Avenwedde][a]
选题：[lkxed][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/hansic99
[b]: https://github.com/lkxed
[1]: https://opensource.com/sites/default/files/lead-images/OSDC_Internet_Cables_520x292_0614_RD.png
[2]: https://openwrt.org
[3]: https://thekelleys.org.uk/dnsmasq/doc.html
[4]: https://openwrt.org/docs/guide-user/luci/start
[5]: https://opensource.com/article/20/2/lua-cheat-sheet
[6]: https://opensource.com/sites/default/files/2022-07/openwrt_luci_overview_c_0.png
[7]: https://creativecommons.org/licenses/by-sa/4.0/legalcode
[8]: https://openwrt.org/docs/techref/flash.layout
[9]: https://openwrt.org/docs/guide-user/additional-software/opkg
[10]: https://opensource.com/sites/default/files/2022-07/OpenWrt_Comparison_RaspberryPi.jpg
[12]: https://openwrt.org/supported_devices
[13]: https://openwrt.org/toh/start
[14]: https://openwrt.org/toh/tp-link/tl-wr902ac_v3
[15]: https://fedoraproject.org/wiki/Networking/CLI
[16]: http://openwrt/
[17]: https://opensource.com/sites/default/files/2022-07/openwrt_luci_login_manager.png
[19]: https://opensource.com/sites/default/files/2022-07/openwrt_luci_wireless_section_c.webp
[21]: https://opensource.com/sites/default/files/2022-07/openwrt_luci_wifi_device_configuration.webp
[23]: https://opensource.com/sites/default/files/2022-07/openwrt_luci_network_devices_0.webp
[25]: https://openwrt.org/docs/guide-user/base-system/basic-networking
[26]: https://en.wikipedia.org/wiki/Captive_portal
[27]: https://en.wikipedia.org/wiki/DNS_rebinding
[28]: https://opensource.com/sites/default/files/2022-07/openwrt_luci_firewall_settings.webp
[30]: https://opensource.com/article/22/1/turris-omnia-open-source-router
[31]: https://openwrt.org/packages/table/start
[32]: https://openwrt.org/docs/guide-user/services/nas/ftp.overview
[33]: https://openwrt.org/reasons_to_use_openwrt
[0]: https://img.linux.net.cn/data/attachment/album/202303/29/105431e78pqv0n8x6aqm0l.jpg
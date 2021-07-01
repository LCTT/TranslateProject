[#]: subject: (Use open source tools to set up a private VPN)
[#]: via: (https://opensource.com/article/21/5/open-source-private-vpn)
[#]: author: (Lukas Janėnas https://opensource.com/users/lukasjan)
[#]: collector: (lujun9972)
[#]: translator: (stevenzdg988)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13539-1.html)

使用开源工具创建私有的虚拟专用网络
======

> 使用 OpenWRT 和 Wireguard 在路由器上创建自己的虚拟专用网络。

![](https://img.linux.net.cn/data/attachment/album/202107/01/101629ym69mwpmcmetdp99.jpg)

通过计算机网络从一个地方到另一个地方可能是一件棘手的事情。除了知道正确的地址和打开正确的端口之外，还有安全问题。 对于 Linux，SSH 是一种流行的默认方式，虽然你可以使用 SSH 做很多事情，但它仍然“只是”一个安全外壳（实际上，这就是 SSH 的含义）。用于加密流量的更广泛的协议是“虚拟专用网络”，它创建了一个独特的两点之间的虚拟的专用网络。有了它，你可以登录到另一个网络上的计算机并使用它的所有服务（文件共享、打印机等等），就像你坐在同一个房间里一样，并且全部的数据都是从点到点加密的。

通常，为了使虚拟专用网络连接成为可能，进入每个网络的网关必须接受虚拟专用网络流量，并且必须侦听目标网络上的某些计算机的虚拟专用网络流量。然而，你可以运行自己的带有虚拟专用网络服务器的路由器固件，使你能够连接到目标网络，而无需担心转发端口或考虑内部拓扑。我最喜欢的固件是 OpenWrt，在本文中我将演示如何设置它，以及如何启用虚拟专用网络。

### 什么是 OpenWrt？

[OpenWrt][2] 是一个使用 Linux 面向嵌入式设备的开源项目。它已经存在超过 15 年，拥有庞大而活跃的社区。

使用 OpenWrt 的方法有很多种，但它的主要用途是在路由器中。它提供了一个具有包管理功能的完全可写的文件系统，并且由于它是开源的，你可以查看和修改代码并为生态系统做出贡献。如果你想对路由器进行更多控制，这就是你想要使用的系统。

OpenWrt 支持很多路由器，包括 [思科][3]、[华硕][4]、[MikroTik][5]、[Teltonika Networks][6]、[D-Link][7]、[TP-link][8]、[Buffalo][9]、[Ubiquiti][10] 等知名品牌和 [许多其他品牌][11]。

### Wireguard 是什么？

[Wireguard][12] 是开源的虚拟专用网络软件，它比 OpenVPN 等其他选项更快、更简单且更安全。它使用最先进的密码学：用于对称加密的 ChaCha20；用于密钥协商的 Curve 25519（使用椭圆曲线），和用于散列的 BLAKE2。这些算法的设计方式在嵌入式系统上是高效的。Wireguard 也可用于各种操作系统 [平台][13]。

### 先决条件

对于这个项目，你需要：

   * [Teltonika RUT955][14] 或支持 OpenWrt 的其他路由器
   * 一个公网 IP 地址，用于从外部网络连接到虚拟专用网络
   * 一部安卓手机

### 安装 OpenWrt

首先，下载路由器的 OpenWrt 镜像。使用 [固件选择器][15] 检查 OpenWrt 是否支持你的路由器并下载固件。输入你的路由器型号，将显示选项：

![OpenWRT 固件选择器][16]

使用搜索框右侧的下拉输入选择要下载的固件版本。

下载出厂镜像。

![下载出厂镜像][18]

许多路由器允许你从 Web 界面刷入未经授权的固件，但 Teltonika Networks 不允许。要将 OpenWrt 固件刷入这样的路由器，你需要使用引导加载器。为此，请按照下列步骤操作：

  1. 拔掉路由器的电源线。
  2. 按住重置按钮。
  3. 插入路由器的电源线。
  4. 插入电源线后，继续按住重置按钮 5 到 8 秒。
  5. 将计算机的 IP 地址设置为 `192.168.1.15`，将网络掩码设置为 `255.255.255.0`。
  6. 使用以太网电缆通过 LAN 端口连接路由器和计算机。
  7. 打开网页浏览器并输入 `192.168.1.1:/index.html`。
  8. 上传并刷写固件。

刷机过程可能占用三分钟。之后，你应该可以通过在浏览器中输入 `192.168.1.1` 来访问路由器的 Web 界面。 默认情况下没有设置密码

![OpenWrt 授权][19]

### 配置网络连接

网络连接是必要条件。如果你的 Internet 服务提供商（ISP） 使用 DHCP 自动分配你的 IP 地址，你只需将以太网电缆插入路由器的 WAN 端口。

如果你需要手动分配 IP 地址，导航至  “Network → Interfaces”。选择 “Edit” 编辑你的 WAN 接口。从 “Protocol” 字段中，选择 “Static address”，然后选择 “Switch protocol”。

![手动分配 IP 地址][20]

在 “IPv4 address” 字段中，输入你的路由器地址。设置 “IPv4 netmask” 以匹配你的网络子网；输入你将用于连接到网络的 “IPv4 gateway” 地址； 并在 “Use custom DNS servers” 字段中输入 DNS 服务器的地址。保存配置。

就是这样！你已成功配置 WAN 接口以获得网络连接。

### 安装必要的包

默认情况下，该固件不包含很多包，但 OpenWrt 有一个包管理器和可选安装的软件包。导航到 “System → Software” 并通过选择 “Update list...” 更新你的包管理器。

![OpenWrt 包管理器][21]

在“Filter”输入中，键入 “Wireguard”，等待系统找到所有包含该关键字的包。找到并安装名为 “luci-app-wireguard” 的包。

![luci-app-wireguard 包][22]

该软件包包括一个用于配置 Wireguard 的 Web 界面，并安装 Wireguard 所必需的所有依赖项。

如果你在安装 Wireguard 软件包之前收到一个软件包丢失的警告并且在存储库中找不到，请忽略它并继续。

接下来，找到并安装名为 “luci-app-ttyd” 的包。这将用于稍后访问终端。

安装这些软件包后，重新启动路由器以使更改生效。

### 配置 Wireguard 接口

接下来，创建 Wireguard 接口。导航到 “Network → Interfaces” 并选择左下角的 “Add new interface...”。在弹出窗口中，输入你想要的接口名称，从下拉列表中选择 “WireguardVPN”，然后选择右下角的 “Create interface”。

![创建 Wireguard 接口][23]

在新弹出的窗口中，选择 “Generate Key” 为 Wireguard 接口生成私钥。在 “Listen Port” 字段中，输入所需的端口。我将使用默认的 Wireguard 端口，“51820”。在 “IP Addresses” 字段中，分配将用于 Wireguard 接口的 IP 地址。在这个例子中，我使用了 `10.0.0.1/24`。数字 “24” 表明我的子网的大小。

![创建 Wireguard 接口][24]

保存配置并重启接口。

导航到 “Services → Terminal”，登录到 shell，然后输入命令 `wg show`。你将看到有关 Wiregaurd 接口的一些信息，包括其公钥。复制公钥——稍后你将需要它来创建对等点。

![Wireguard 公钥][25]

### 配置防火墙

导航到 “Network → Firewall” 并选择 “Traffic Rules” 选项卡。在页面底部，选择 “Add”。在弹出窗口的 “Name” 字段中，为你的规则命名，例如 “Allow-wg”。接下来，将 “Destination zone” 从 “Lan” 更改为 “Device”，并将 “Destination port” 设置为 “51820”。

![Wireguard 防火墙设置][26]

保存配置。

### 手机上配置 Wireguard

从 Google Play 在你的手机上安装 [Wireguard 应用程序][27]。安装后，打开应用程序并从头开始创建一个新接口。在 “Name” 字段中，输入要用于接口的名称。在 “Private key” 字段中，按右侧的双向箭头图标生成密钥对。你将需要上面的公钥来在你的手机和路由器之间创建一个对等点。在 “Addresses” 字段中，分配你将用于通过虚拟专用网络访问电话的 IP 地址。我将使用 `10.0.0.2/24`。在 “Listen port” 中，输入端口；我将再次使用默认端口。

![在 Android 上设置虚拟专用网络接口][28]

保存配置。

要向配置中添加对等点，请选择 “Add peer”。在 “Public key” 字段中，输入路由器的 Wireguard 公钥。在 “Endpoint” 字段中，输入路由器的公共 IP 地址和端口，以冒号分隔，例如 `12.34.56.78:51820`。在 “Allowed IP” 字段中，输入要通过 Wireguard 接口访问的 IP 地址。 （你可以输入路由器的虚拟专用网络接口 IP 地址和 LAN 接口地址。）IP 地址必须用逗号分隔。你还可以定义子网的大小。

![在 Android 上添加虚拟专用网络对等点][29]

保存配置。

配置中还剩下最后一步：在路由器上添加一个对等点。

### 在路由器上添加一个对等点

导航到 “Network → Interfaces” 并选择你的 Wireguard 接口。转到 “Peers” 选项卡并选择 “Add peer”。在 “Description” 字段中，输入对等方的名称。在 “Public Key” 字段中输入手机的 Wireguard 接口公钥，在 “Allowed IPs” 字段中输入手机的 Wireguard 接口 IP 地址。选中 “Route Allowed IPs” 复选框。

![在路由器上添加一个对等点][30]

保存配置并重启接口。

### 测试配置

在手机上打开 Web 浏览器。在 URL 栏中，输入 IP 地址 `10.0.0.1` 或 `192.168.1.1`。你应该能够访问路由器的网站。

![从 Android 登录 虚拟专用网络][31]

### 你自己的虚拟专用网络 

这些天有很多虚拟专用网络服务商在做广告，但是拥有和控制自己的基础设施还有很多话要说，尤其是当该基础设施仅用于提高安全性时。无需依赖其他人为你提供安全的数据连接。使用 OpenWrt 和 Wireguard，你可以拥有自己的开源虚拟专用网络解决方案。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/5/open-source-private-vpn

作者：[Lukas Janėnas][a]
选题：[lujun9972][b]
译者：[stevenzdg988](https://github.com/stevenzdg988)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/lukasjan
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/vpn_scrabble_networking.jpg?itok=pdsUHw5N (scrabble letters used to spell "V")
[2]: https://openwrt.org/
[3]: https://www.cisco.com/c/en/us/products/routers/index.html
[4]: https://www.asus.com/Networking-IoT-Servers/WiFi-Routers/All-series/
[5]: https://mikrotik.com/
[6]: https://teltonika-networks.com/
[7]: https://www.dlink.com/en/consumer
[8]: https://www.tp-link.com/us/
[9]: https://www.buffalotech.com/products/category/wireless-networking
[10]: https://www.ui.com/
[11]: https://openwrt.org/toh/views/toh_fwdownload
[12]: https://www.wireguard.com/
[13]: https://www.wireguard.com/install/
[14]: https://teltonika-networks.com/product/rut955/
[15]: https://firmware-selector.openwrt.org/
[16]: https://opensource.com/sites/default/files/uploads/openwrt_firmware-selector.png (OpenWRT firmware selector)
[17]: https://creativecommons.org/licenses/by-sa/4.0/
[18]: https://opensource.com/sites/default/files/uploads/downloadfactoryimage.png (Downloading the Factory Image)
[19]: https://opensource.com/sites/default/files/uploads/openwrt_authorization.png (OpenWrt authorization)
[20]: https://opensource.com/sites/default/files/uploads/openwrt_staticaddress.png (Assigning IP address manually)
[21]: https://opensource.com/sites/default/files/uploads/openwrt_update-lists.png (OpenWrt package manager)
[22]: https://opensource.com/sites/default/files/uploads/wireguard-package.png (luci-app-wireguard package)
[23]: https://opensource.com/sites/default/files/uploads/wireguard_createinterface.png (Creating Wireguard interface)
[24]: https://opensource.com/sites/default/files/uploads/wireguard_createinterface2.png (Creating Wireguard interface)
[25]: https://opensource.com/sites/default/files/uploads/wireguard_publickey.png (Wireguard public key)
[26]: https://opensource.com/sites/default/files/uploads/wireguard-firewallsetup.png (Wireguard firewall setup)
[27]: https://play.google.com/store/apps/details?id=com.wireguard.android&hl=lt&gl=US
[28]: https://opensource.com/sites/default/files/uploads/vpn_inferfacesetup.png (Setting up V interface on Android)
[29]: https://opensource.com/sites/default/files/uploads/addpeeronphone.png (Adding a V peer on an Android)
[30]: https://opensource.com/sites/default/files/uploads/addpeeronrouter.png (Adding a peer on the router)
[31]: https://opensource.com/sites/default/files/uploads/android-vpn-login.png (Logging into the V from Android)

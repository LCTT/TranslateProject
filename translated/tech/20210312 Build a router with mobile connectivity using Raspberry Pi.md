[#]: subject: (Build a router with mobile connectivity using Raspberry Pi)
[#]: via: (https://opensource.com/article/21/3/router-raspberry-pi)
[#]: author: (Lukas Janėnas https://opensource.com/users/lukasjan)
[#]: collector: (lujun9972)
[#]: translator: (hwlife)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

使用树莓派建立一个带有移动网络连接功能的路由器
======
在你的网络路由器上使用 OpenWRT获得更多控制功能。
![Mesh networking connected dots][1]

树莓派是一个小型单板电脑，尽管只有信用卡大小，但是能做许多事情。事实上，这个小电脑几乎可以成为你想让它成为的任何东西。你只需要打开你的想象力。

树莓派爱好者已经做了许多不同的项目，从单个程序到复杂的自动化项目和类似气象站或者甚至智能家居设备的解决方案。这篇文章将展示怎样使用 OpenWRT 项目将你的树莓派变成带有 LTE 移动网络连接功能的路由器。


### 关于 OpenWRT 和 LTE

[OpenWRT][2] 是一个利用 Linux 内核为嵌入式设备开发的开源项目，它已经存在超过15年了，有着大量和活跃的社区。

有许多使用 OpenWRT 的方法，但是它的主要目的还是用在路由器上。它提供了一个带有包管理功能的完全可写的文件系统，并且因为它的的开源属性，你可以查看和修改代码并且可以贡献到开源生态。如果你喜欢对你的路由器获得更多的控制，这就是你想要的系统。

长期演进技术 (LTE) 是一个基于 GSM/EGDE 和 UMTS/HSPA 技术的无线宽带通信标准。我使用的 LTE 调制解调器是一个能够添加 3G 或 4G (LTE) 蜂窝连接到树莓派电脑的　USB　设备。

![Teltonika TRM240 modem][3]

(Lukas Janenas, [CC BY-SA 4.0][4])

### 安装前的准备

对这个项目来说，你需要：

  * 一个带有电源线的树莓派
  * 一台运行　Linux　的电脑
  * 一张至少 16GB 的 SD 储存卡
  * 以太网线
  * LTE 调制解调器 (我使用的是 Teltonika [TRM240][5])
  * A SIM card for mobile connectivity 一张移动网络的 SIM 卡



### 安装 OpenWRT

首先，下载最新的 [兼容树莓派的 OpenWRT 的发布版本][6]. 在 OpenWRT 官网，你可以看到 4 个镜像：两个 **ext4** 文件系统的和两个 **squashfs** 文件系统的。我使用 **ext4** 文件系统。你可以下载 **factory** 或者  **sysupgrade** 镜像，这两个都运行良好。

![OpenWRT image files][7]

(Lukas Janenas, [CC BY-SA 4.0][4])

一旦你下载了镜像，你按照 [以下的说明][8] 需要解压并安装它到 SD 卡上。这将会花些时间安装固件，需要些耐心。一旦安装完成，在你的 SD 卡上将会有两个分区。一个是用来放 bootloader ，另一个是 OpenWRT 系统。


### 启动系统

要启动你的新系统，插入 SD 卡到树莓派，用以太网线把树莓派和你的路由器 (或者交换机) 相连，然后点亮。

如果你有使用树莓派的经验，你可能通过终端使用 SSH 访问过它，或者通过显示器和键盘连接到树莓派。 OpenWRT 工作有一点点不同。你与这个系统交互是通过网络浏览器，所以你必须能够通过网络来访问你的树莓派。

缺省状态下，树莓派使用的 IP 地址是：192.168.1.1 。用来配置树莓派的计算机必须和树莓派在同一个子网中。如果你的网络没有使用 192.168.1.x 地址，或者你不能确定，在 GNOME 打开 **Settings** ，导航到网络设置，选择  **Manual** ，然后键入以下的 IP 地址和子网掩码：

  * **IP address:** 192.168.1.15
  * **Netmask:** 255.255.255.0



![IP addresses][9]

(Lukas Janenas, [CC BY-SA 4.0][4])

在你的电脑上打开一个浏览器然后导航到 192.168.1.1 。这将打开一个授权网页，你可以登录到你的树莓派。

![OpenWRT login page][10]

(Lukas Janenas, [CC BY-SA 4.0][4])

首次登录不需要密码，所以直接点击  **Login** 按钮继续。


### 设置网络连接

树莓派只有一个以太网口，而普通路由器有两个：一个是 WAN (有线区域网络) 口，另一个是 LAN (本地区域网络)。
你有两个选择：

  1. 使用你的以太网口接入互联网
  2. 使用 WIFI 接入互联网



**使用以太网连接:**

你应该决定使用以太网，导航到 **网络 → 接口**。在这个设置页面，按下蓝色的 **Edit** 按钮，将 **LAN** 接口与之关联。

![LAN interface][11]

(Lukas Janenas, [CC BY-SA 4.0][4])

一个弹窗应该出现，在这个窗口中，你需要键入与你将要连接树莓派的路由器子网匹配的 IP 地址。修改子网掩码，如果需要的话，与树莓派将要连接的路由器的 IP 地址。

![Enter IP in the LAN interface][12]

(Lukas Janenas, [CC BY-SA 4.0][4])

保存设置，然后通过以太网连接你的树莓派到路由器。你可以现在用这个新的 IP 地址访问到树莓派。

当你在把树莓派投入生产环境使用之前，确保为你的 OpenWRT 设置一个密码！


**使用 WiFi 连接**

如果你想通过 WiFi 连接树莓派到互联网，导航到 **网络 → 无线** 。在 **无线** 菜单里，按下蓝色的  **扫描** 按钮查找你的家庭网络。


![Scan the network][13]

(Lukas Janenas, [CC BY-SA 4.0][4])

在弹出的窗口中，找到你的 WiFi 网络然后连接它。不要忘记 **保存并应用** 设置。

在这 **网络 → 接口** 部分，你应该看到了一个新的接口。 

![New interface][14]

(Lukas Janenas, [CC BY-SA 4.0][4])

当你在把树莓派投入生产环境使用之前，确保为你的 OpenWRT 设置一个密码！

### 安装必要的软件包

默认状态下，路由器并没有许多软件包。OpenWRT 提供了带有一系列你需要安装的一个包管理器。导航到 **系统 → 软件** 然后通过按下标有 "**更新列表…**" 的按钮来更新你的包管理器。

![Updating packages][15]

(Lukas Janenas, [CC BY-SA 4.0][4])

你将会看到许多软件包；你需要安装一下这些：

  * usb-modeswitch
  * kmod-mii
  * kmod-usb-net
  * kmod-usb-wdm
  * kmod-usb-serial
  * kmod-usb-serial-option
  * kmod-usb-serial-wwan (是否可以不安装)



另外，[下载这个调制解调器管理软件包]然后在弹出的窗口中按下标有 **上传软件包…** 的按钮来安装它。重启树莓派让安装包生效。

### 设置移动网接口

所有这些软件包被安装完之后，你可以设置移动网接口。在连接调制解调器到树莓派之前，先阅读以下 [调制解调器说明书][17] 。然后连接你的移动调制解调器到树莓派，然后等待一会直到调制解调器启动。

导航到 **网络 → 接口**。在页面底部，按下 **添加一个新接口** 按钮。在弹出的窗口中，给你的接口命令 (比如 **移动网** ) 然后从下拉列表中选择**调制解调器管理** 。

![Add a new mobile interface][18]

(Lukas Janenas, [CC BY-SA 4.0][4])

按下一个标有 **创建接口** 的按钮。你应该看到弹出一个新窗口。这是设置接口的一个主窗口。在这个窗口中，选择你的调制解调器然后键入像接入点名称 (APN) 或是 PIN 码之类的信息。


![Configuring the interface][19]

(Lukas Janenas, [CC BY-SA 4.0][4])


**注意:** 如果在列表中没有调制解调器设备出现，尝试重启树莓派或者安装  kmod-usb-net-qmi-wwan 软件包 。

当你已经配置完你的接口，按下 **保存** 然后 **保存并应用**。给系统一些生效的时间。如果一切正常，你应该看到像这样的一些东西。

![Configured interface][20]

(Lukas Janenas, [CC BY-SA 4.0][4])

如果你想通过接口查看你的网络连接，你可以使用 SSH 连接到你的树莓派 shell。在终端里，键入：


```
`ssh root@192.168.1.1`
```

缺省 IP 地址是 192.168.1.1：如果你要修改它，然后用这个 IP 地址连接。当连接的状态时，在终端里执行命令：


```
`ping -I ppp0 google.com`
```

如果一切正常运行，那么你应该从 Google 的服务器接收到 pings 。

![Terminal interface][21]

(Lukas Janenas, [CC BY-SA 4.0][4])

**ppp0** 是为你创建的移动网接口的默认接口名称。你可以通过使用 **ifconfig** 命令检查你的接口。它只显示活动的接口。

### 设置防火墙

要让移动网接口运行，你需要为 **移动网** 接口和 **lan** 接口引导流量到正确的接口。

导航到 **网络 → 防火墙**。在页面的底部，你应该看到一个叫做 **区域** 的部分。

![Firewall zones][22]

(Lukas Janenas, [CC BY-SA 4.0][4])

设置防火墙最简单的方法就是调整 **wan** 区域。在 **已覆盖的网络** 选项里按下 **编辑** 按钮，选择你的 **移动网** 接口，然后 **保存并应用** 你的设置。如果你不想用 WiFi 连接你的树莓派，你可以从 **已覆盖的网络** 里删除 **wwan** 接口，或者关闭 WiFi 连接。 

![Firewall zone settings][23]

(Lukas Janenas, [CC BY-SA 4.0][4])

如果你想为每个接口设置一个独立区域，只需创建一个新区域然后分配必要的接口即可。举个例子，你可能想有一个移动网区域，这个区域覆盖移动网接口并且通过它来转发 LAN 接口流量。按下 **添加** 按钮，然后给你的区域 **命名**， 检查 **伪装** 复选框，选中 **已覆盖的网络** ，然后选择可以转发它们流量的区域。

![Firewall zone settings][24]

(Lukas Janenas, [CC BY-SA 4.0][4])

然后 **保存并应用** 这些修改。现在你有一个新的区域。 

### 设置一个接入点

最后一步是为你的设备接入互联网设置一个网络接入点。要设置一个接入点，导航到 **网络 → 无线** 。你将会看到一个 WiFi 设备接口，一个关闭的以 **OpenWRT** 命名的接入点，这个连接通过 WiFi来连接到互联网 (如果你先前没有关闭或者删除它)。在这个 **关闭** 的接口上，按下 **编辑** 按钮，然后 **开启** 接口。

![Enabling wireless network][25]

(Lukas Janenas, [CC BY-SA 4.0][4])

如果你想，你可以通过编辑 **ESSID** 选项来修改接口名称。你也可以选择它要关联的网络。默认状态下，它将会与 **lan** 口关联。

![Configuring the interface][26]

(Lukas Janenas, [CC BY-SA 4.0][4])

要为这个接口添加密码，选择 **无线安全**选项，选择 **WPA2-PSK** 加密方式然后在 **Key** 选项字段键入接口的密码。

![Setting a password][27]

(Lukas Janenas, [CC BY-SA 4.0][4])

然后 **保存并应用** 设置。如果设置正确的话，当用你的设备扫码可用接入点的话，你应该看到你分配了名称的新接入点。

### 额外的软件包

如果你愿意，你可以通过网络接口为你的路由器下载额外的软件包。只需到 **系统 → 软件** 然后安装你想从列表或者互联网上下载的软件包并上传它。如果你在列表中没有看到任何软件包，按下 **更新列表…** 按钮。

你也可以添加其他有软件包的仓库更好的利用 OpenWRT 。软件包和它们的网络接口分开安装。软件包名称是以 **luci-** 开始的是网络接口软件包。

![Packages with luci- prefix][28]

(Lukas Janenas, [CC BY-SA 4.0][4])

### 试试看

这就是我的树莓派路由设置的过程。

![Raspberry Pi router][29]

(Lukas Janenas, [CC BY-SA 4.0][4])

从树莓派建立一个路由器不是很困难。缺点是树莓派只有一个以太网接口。你可以用一个  USB-to-Ethernet 适配器来增加更多的网口。不要忘记在接口的网站上设置网口。

OpenWRT 支持大量移动调制解调器，你可以用管理调制解调器的通用工具 modemmanager 为它们设置移动网接口。

你使用你的树莓派作为路由器了吗？在下方评论让我们进展如何。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/3/router-raspberry-pi

作者：[Lukas Janėnas][a]
选题：[lujun9972][b]
译者：[hwlife](https://github.com/hwlilfe)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/lukasjan
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/mesh_networking_dots_connected.png?itok=ovINTRR3 (Mesh networking connected dots)
[2]: https://openwrt.org/
[3]: https://opensource.com/sites/default/files/uploads/lte_modem.png (Teltonika TRM240 modem)
[4]: https://creativecommons.org/licenses/by-sa/4.0/
[5]: https://teltonika-networks.com/product/trm240/
[6]: https://downloads.openwrt.org/releases/19.07.7/targets/brcm2708/bcm2710/
[7]: https://opensource.com/sites/default/files/uploads/imagefiles.png (OpenWRT image files)
[8]: https://opensource.com/article/17/3/how-write-sd-cards-raspberry-pi
[9]: https://opensource.com/sites/default/files/uploads/ipaddresses.png (IP addresses)
[10]: https://opensource.com/sites/default/files/uploads/openwrt-login.png (OpenWRT login page)
[11]: https://opensource.com/sites/default/files/uploads/lan-interface.png (LAN interface)
[12]: https://opensource.com/sites/default/files/uploads/lan-interface-ip.png (Enter IP in the LAN interface)
[13]: https://opensource.com/sites/default/files/uploads/scannetwork.png (Scan the network)
[14]: https://opensource.com/sites/default/files/uploads/newinterface.png (New interface)
[15]: https://opensource.com/sites/default/files/uploads/updatesoftwarelist.png (Updating packages)
[16]: https://downloads.openwrt.org/releases/packages-21.02/aarch64_cortex-a53/luci/luci-proto-modemmanager_git-21.007.43644-ab7e45c_all.ipk
[17]: https://wiki.teltonika-networks.com/view/TRM240_SIM_Card
[18]: https://opensource.com/sites/default/files/uploads/addnewinterface.png (Add a new mobile interface)
[19]: https://opensource.com/sites/default/files/uploads/configureinterface.png (Configuring the interface)
[20]: https://opensource.com/sites/default/files/uploads/configuredinterface.png (Configured interface)
[21]: https://opensource.com/sites/default/files/uploads/terminal.png (Terminal interface)
[22]: https://opensource.com/sites/default/files/uploads/firewallzones.png (Firewall zones)
[23]: https://opensource.com/sites/default/files/uploads/firewallzonesettings.png (Firewall zone settings)
[24]: https://opensource.com/sites/default/files/uploads/firewallzonepriv.png (Firewall zone settings)
[25]: https://opensource.com/sites/default/files/uploads/enablewirelessnetwork.png (Enabling wireless network)
[26]: https://opensource.com/sites/default/files/uploads/interfaceconfig.png (Configuring the interface)
[27]: https://opensource.com/sites/default/files/uploads/interfacepassword.png (Setting a password)
[28]: https://opensource.com/sites/default/files/uploads/luci-packages.png (Packages with luci- prefix)
[29]: https://opensource.com/sites/default/files/uploads/raspberrypirouter.jpg (Raspberry Pi router)

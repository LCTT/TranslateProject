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


### Configure network connection

The Raspberry Pi has only one Ethernet port, while normal routers have a couple of them: one for WAN (wired area network) and the other for LAN (local area network). You have two options:

  1. Use your Ethernet port for network connectivity
  2. Use WiFi for network connectivity



**使用以太网:**

你应该决定使用以太网，导航到 **网络 → 接口**。在这个设置页面，按下蓝色的 **Edit** 按钮，将 **LAN** 接口与之关联。

![LAN interface][11]

(Lukas Janenas, [CC BY-SA 4.0][4])

A pop-up window should appear. In that window, you need to enter the IP address to match the subnet of the router to which you will connect the Raspberry Pi. Change the Netmask, if needed, and enter the IP address of the router the Raspberry Pi will connect to.

![Enter IP in the LAN interface][12]

(Lukas Janenas, [CC BY-SA 4.0][4])

Save this configuration and connect your Pi to the router over Ethernet. You can now reach the Raspberry Pi with this new IP address.

Be sure to set a password for your OpenWRT router before you put it into production use!

**To use WiFi**

If you would like to connect the Raspberry Pi to the internet through WiFi, navigate to **Network → Wireless**. In the **Wireless** menu, press the blue **Scan** button to locate your home network.

![Scan the network][13]

(Lukas Janenas, [CC BY-SA 4.0][4])

In the pop-up window, find your WiFi network and connect to it. Don't forget to **Save and Apply** the configuration.

In the **Network → Interfaces** section, you should see a new interface.

![New interface][14]

(Lukas Janenas, [CC BY-SA 4.0][4])

Be sure to set a password for your OpenWRT router before you put it into production use!

### Install the necessary packages

By default, the router doesn't have a lot of packages. OpenWRT offers a package manager with a selection of packages you need to install. Navigate to **System → Software** and update your package manager by pressing the button labeled "**Update lists…**".

![Updating packages][15]

(Lukas Janenas, [CC BY-SA 4.0][4])

You will see a lot of packages; you need to install these:

  * usb-modeswitch
  * kmod-mii
  * kmod-usb-net
  * kmod-usb-wdm
  * kmod-usb-serial
  * kmod-usb-serial-option
  * kmod-usb-serial-wwan (if it's not installed)



Additionally, [download this modemmanager package][16] and install it by pressing the button labeled **Upload Package…** in the pop-up window. Reboot the Raspberry Pi for the packages to take effect.

### Set up the mobile interface

After all those packages are installed, you can set up the mobile interface. Before connecting the modem to the Raspberry Pi read, the [modem instructions][17] to set it up. Then connect your mobile modem to the Raspberry Pi and wait a little until the modem boots up.

Navigate to **Network → Interface**. At the bottom of the page, press the **Add new interface…** button. In the pop-up window, give your interface a name (e.g., **mobile**) and select **ModemManager** from the drop-down list.

![Add a new mobile interface][18]

(Lukas Janenas, [CC BY-SA 4.0][4])

Press the button labeled **Create Interface**. You should see a new pop-up window. This is the main window for configuring the interface. In this window, select your modem and enter any other information like an Access Point Name (APN) or a PIN.

![Configuring the interface][19]

(Lukas Janenas, [CC BY-SA 4.0][4])

**Note:** If no modem devices appear in the list, try rebooting your Raspberry Pi or installing the kmod-usb-net-qmi-wwan package.

When you are done configuring your interface, press **Save** and then **Save and Apply**. Give some time for the system to take effect. If everything went well, you should see something like this.

![Configured interface][20]

(Lukas Janenas, [CC BY-SA 4.0][4])

If you want to check your internet connection over this interface, you can use ssh to connect to your Raspberry Pi shell. In the terminal, enter:


```
`ssh root@192.168.1.1`
```

The default IP address is 192.168.1.1; if you changed it, then use that IP address to connect. When connected, execute this command in the terminal:


```
`ping -I ppp0 google.com`
```

If everything is working, then you should receive pings back from Google's servers.

![Terminal interface][21]

(Lukas Janenas, [CC BY-SA 4.0][4])

**ppp0** is the default interface name for the mobile interface you created. You can check your interfaces using **ifconfig**. It shows active interfaces only.

### Set up the firewall

To get the mobile interface working, you need to configure a firewall for the **mobile** interface and the **lan** interface to direct traffic to the correct interface.

Navigate to **Network → Firewall**. At the bottom of the page, you should see a section called **Zones**.

![Firewall zones][22]

(Lukas Janenas, [CC BY-SA 4.0][4])

The simplest way to configure the firewall is to adjust the **wan** zone. Press the **Edit** button and in the **Covered networks** option, select your **mobile** interface, and **Save and Apply** your configuration. If you don't want to use WiFi to connect to the internet, you can remove **wwan** from the **Covered networks** or disable the WiFi connection.

![Firewall zone settings][23]

(Lukas Janenas, [CC BY-SA 4.0][4])

If you want to set up individual zones for each interface, just create a new zone and assign the necessary interfaces. For example, you may want to have a mobile zone that covers the mobile interface and is used to forward LAN interface traffic through it. Press the **Add** button, then **Name** your zone, check the **Masquerading** check box, select **Covered Networks**, and choose which zones can forward their traffic.

![Firewall zone settings][24]

(Lukas Janenas, [CC BY-SA 4.0][4])

Then **Save and Apply** the changes. Now you have a new zone.

### Set up an Access Point

The last step is to configure a network with an Access Point for your devices to connect to the internet. To set up an Access Point, navigate to **Network → Wireless**. You will see a WiFi device interface, a disabled Access Point named **OpenWRT**, and a connection that is used to connect to the internet over WiFi (if you didn't disable or delete it earlier). On the **Disable** interface, press the **Edit** button, then **Enable** the interface.

![Enabling wireless network][25]

(Lukas Janenas, [CC BY-SA 4.0][4])

If you want, you can change the interface name by editing the **ESSID** option. You can also select which network it will be associated with. By default, it with be associated with the **lan** interface.

![Configuring the interface][26]

(Lukas Janenas, [CC BY-SA 4.0][4])

To add a password for this interface, select the **Wireless Security** tab. In the tab, select the encryption **WPA2-PSK** and enter the password for the interface in the **Key** option field.

![Setting a password][27]

(Lukas Janenas, [CC BY-SA 4.0][4])

Then **Save and Apply** the configuration. If the configuration was set correctly, when scanning available Access Points with your device, you should see a new Access Point with the name you assigned.

### Additional packages

If you want, you can download additional packages for your router through the web interface. Just go to **System → Software** and install the package you want from the list or download it from the internet and upload it. If you don't see any packages in the list, press the **Update lists…** button.

You can also add other repositories that have packages that are good to use with OpenWRT. Packages and their web interfaces are installed separately. The packages that start with the prefix **luci-** are web interface packages.

![Packages with luci- prefix][28]

(Lukas Janenas, [CC BY-SA 4.0][4])

### Give it a try

This is what my Raspberry Pi router setup looks like.

![Raspberry Pi router][29]

(Lukas Janenas, [CC BY-SA 4.0][4])

It not difficult to build a router from a Raspberry Pi. The downside is that a Raspberry Pi has only one Ethernet port. You can add more ports with a USB-to-Ethernet adapter. Don't forget to configure the port on the interface's website.

OpenWRT supports a large number of mobile modems, and you can configure the mobile interface for any of them with the modemmanager, which is a universal tool to manage modems.

Have you used your Raspberry Pi as a router? Let us know how it went in the comments.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/3/router-raspberry-pi

作者：[Lukas Janėnas][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
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

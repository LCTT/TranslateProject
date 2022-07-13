[#]: subject: "OpenWrt, an open source alternative to firmware for home routers"
[#]: via: "https://opensource.com/article/22/7/openwrt-open-source-firmware"
[#]: author: "Stephan Avenwedde https://opensource.com/users/hansic99"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

OpenWrt, an open source alternative to firmware for home routers
======
OpenWrt is a Linux-based, open source operating system targeting embedded network devices.

If you're reading this article from home, you are probably connected with a LTE/5G/DSL/WIFI router. Such devices are usually responsible to route packets between your local devices (smartphone, PC, TV, and so on) and provide access to the world wide web through a built-in modem. Your router at home has most likely a web-based interface for configuration purposes. Such interfaces are often oversimplified as they are made for casual users.

If you want more configuration options, but don't want to spend for a professional device you should take a look at an alternative firmware such as [OpenWrt][2].

### OpenWrt features

OpenWrt is a Linux-based, open source operating system targeting embedded network devices. It is mainly used as a replacement for the original firmware on home routers of all kinds. OpenWrt comes with all the useful features a good router should have like a DNS server ([dnsmasq][3]), Wifi access point and client functionality, PPP protocol for modem functionality and, unlike with the standard firmware, everything is fully configurable.

### LuCI Web Interface

OpenWrt can be configured remotely by command line (SSH) or using [LuCI][4], a GUI configuration interface. LuCI is a lightweight, extensible web GUI written in [Lua][5], which enables an exact configuration of your device. Besides configuration, LuCI provides a lot of additional information like real time graphs, system logs, and network diagnostics.

![LuCI web interface][6]

Image by: Stephan Avenwedde, [CC BY-SA][7]

There are some optional extensions available for LuCI to add even further configuration choices.

### Writeable file system

Another highlight is the writeable filesystem. While the stock firmware is usually read-only, OpenWrt comes with a writeable filesystem thanks to a clever solution that combines OverlayFS with SquashFS and JFFS2 filesystems to allow installation of packages to enhance functionality. Find more information about the file system architecture in the [OpenWrt documentation][8].

### Extensions

OpenWrt has an associated package manager, [opkg][9], which allows to install additional services. Some examples are an FTP server, a DLNA media server, an OpenVPN server, a Samba server to enable file sharing, or Asterisk (software to control telephone calls). Of course, some extensions require appropriate resources of the underlying hardware.

### Motivation

You might wonder why you should try to replace a router manufacture's firmware, risking irreparable damage to your device and loss of warranty. If your device works the way you want, then you probably shouldn’t. Never touch a running system! But if you want to enhance functionality, or if your device is lacking configuration options, then you should check whether OpenWrt could be a remedy.

In my case, I wanted a travel router which I can place on an appropriate position when I’m on a campsite in order to get a good connection to the local Wifi access point. The router should connect itself as an ordinary client and broadcasts it’s own access point for my devices. This allows me to configure all my devices to connect with the routers access points and I only have to change the routers client connection when I’m somewhere else. Moreover, on some campsites you only get an access code for one single device, which I can enhance with this setup.

As my travel router, I choose the TP-Link TL-WR902AC for the following reasons:

* Small
* Two Wifi antennas
* 5V power supply (USB)
* Low power consumption
* Cost effective (you get it for around $30)

To get an idea of the size, here it is next to a Raspberry Pi4:

![TP-Link TL-WR902AC next to a Raspberry Pi][10]

Image by: Stephan Avenwedde, [CC BY-SA 4.0][11]

Even though the router brings all hardware capabilities I demand, I relatively quickly found out that the default firmware don’t let me configure it the way I wanted. The router is mainly intended as an Wifi access point, which repeats an existing Wifi network or connects itself to the web over the onboard Ethernet interface. The default firmware is very limited for these use cases.

Fortunately, the router is capable of running OpenWrt, so I decided to replace the original firmware with it.

### Installation

When your LTE/5G/DSL/WIFI router meets the [minimum requirements][12], chances are high that it's possible to run OpenWrt on it. As the next step, you look in the [hardware table][13] and check whether your devices is listed as compatible, and which firmware package you have to choose. The page for the [TP-Link TL-WR902AC][14] also includes the installation instructions which describe how to flash the internal memory.

The process of flashing the firmware can vary between different devices, so I won’t go into detail on this. In a nutshell, I had to connect the device over  a TFTP server on a network interface with a certain IP address, rename the OpenWrt firmware file and then boot up the device considering pressing the reset button.

### Configuration

Once flashing was successfully, your device should now boot up with the new firmware. It may take a bit longer now to boot up as OpenWrt comes with much more features compared to the default firmware.

OpenWrt acts as a DHCP server, so in order to begin with configuration, make a direct Ethernet connection between your PC and the router, and configure your PC’s Ethernet adapter as a DHCP client.

On Fedora Linux, to activate the DHCP client mode for your network adapter, first you have to find out the connection UUID by running:

```
$ nmcli connection show
NAME          UUID         TYPE      DEVICE 
Wired Conn 1  7a96b...27a  ethernet  ens33
virbr0        360a0...673  bridge   virbr0
testwifi      2e865...ee8  wifi     --
virbr0        bd487...227  bridge   --
Wired Conn 2  16b23...7ba  ethernet --
```

Pick the UUID for the connection you want to modify and then run:

```
$ nmcli connection modify <UUID> ipv4.method auto
```

You can find more information about these commands in the [Fedora Networking Wiki][15].

After you have a connection to your router, open a web browser and navigate to [http://openwrt/][16]. You should now see LuCI’s login manager:

![LuCI login][17]

Use **root** as the username, and leave the password field blank.

### Configuring Wifi and routing

To configure your Wifi antennas, click on the **Network** menu and select **Wireless**.

![LuCI wireless configuration][19]

On my device, the antenna **radio0** on top operates in 2.4 GHz mode and is connected to the local access point called *MOBILE-INTERNET*. The antenna **radio1** below operates at 5 GHz and has an associated access point with the SSID *OpenWrt_AV*. With a click of the **Edit**button, you can open the device configuration to decide whether the device belongs to the *LAN* or WWAN network. In my case, the access point *OpenWrt_AV* belongs to the LAN network and the client connection *MOBILE-INTERNET* belongs to the WWAN network.

![LuCI configuration screen][21]

Configured networks are listed under **Network**, in the **Interfaces** panel.

![Device list][23]

In order to get the functionality I want, network traffic must be routed between the LAN and the WWAN network. The routing can be configured in the **Firewall** section of the **Network** panel. I didn’t change anything here because, by default, the traffic is routed between the networks, and incoming packets (from WWAN to LAN) have to pass the firewall.

So all you need to know is whether an interface belongs to LAN or (W)WAN. This concept makes it relatively easy to configure, especially for beginners. You can find more information in [OpenWrt’s basic networking][25] guide.

### Captive portals

Public Wifi access points are often protected by a [captive portal][26] where you have to enter an access code or similar. Usually, such portals show up when you are first connected to the access point and try to open an arbitrary web page. This mechanism is realized by the access point's DNS server.

By default, OpenWrt has a security feature activated that prevents connected clients from a [DNS rebinding attack][27]. OpenWrt’s rebind protection also prevents captive portals from being forwarded to clients, so you must disable rebind protection so you can reach captive portals. This option is in the **DHCP and DNS** panel of the **Network** menu.

![Firewall settings][28]

### Try OpenWrt

Thanks to an upgrade to OpenWrt, I got a flexible travel router based on commodity hardware. OpenWrt makes your router fully configurable and extensible and, thanks to the well-made web GUI, it's also appropriate for beginners. There are even a few [select routers][30] that ship with OpenWrt already installed. You are also able to enhance your router's functionality with lots of [available packages][31]. For example, I’m using the [vsftp][32] FTP server to host some movies and TV series on a connected USB stick. Take a look at the [projects homepage][33], where you can find many reasons to switch to OpenWrt.

Image by: Stephan Avenwedde, [CC BY-SA 4.0][7]

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/7/openwrt-open-source-firmware

作者：[Stephan Avenwedde][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

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

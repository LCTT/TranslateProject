[#]: subject: (Use open source tools to set up a private VPN)
[#]: via: (https://opensource.com/article/21/5/open-source-private-vpn)
[#]: author: (Lukas Janėnas https://opensource.com/users/lukasjan)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Use open source tools to set up a private VPN
======
Use OpenWRT and Wireguard to create your own virtual private network on
your router.
![scrabble letters used to spell "VPN"][1]

Getting from one place to another over a computer network can be a tricky thing. Aside from knowing the right address and opening the right ports, there's the question of security. For Linux, SSH is a popular default, and while there's a lot you can do with SSH it's still "just" a secure shell (that's what SSH stands for, in fact.) A broader protocol for encrypted traffic is VPN, which creates a unique, virtual private network between two points. With it, you can log in to a computer on another network and use all of its services (file shares, printers, and so on) just as if you were physically sitting in the same room, and every bit of data is encrypted from point to point.

Normally, in order to make a VPN connection possible, the gateways into each network must accept VPN traffic, and some computer on your target network must be listening for VPN traffic. However, it's possible to run your own router firmware that runs a VPN server, enabling you to connect to your target network without having to worry about forwarding ports or thinking at all about internal topography. My favorite firmware is OpenWrt, and in this article I demonstrate how to set it up, and how to enable VPN on it.

### What is OpenWrt?

[OpenWrt][2] is an open source project that uses Linux to target embedded devices. It's been around for more than 15 years and has a large and active community.

There are many ways to use OpenWrt, but its main purpose is in routers. It provides a fully writable filesystem with package management, and because it is open source, you can see and modify the code and contribute to the ecosystem. If you would like to have more control over your router, this is the system you want to use.

OpenWrt supports many routers, including famous brands such as [Cisco][3], [ASUS][4], [MikroTik][5], [Teltonika Networks][6], [D-Link][7], [TP-link][8], [Buffalo][9], [Ubiquiti][10], and [many others][11].

### What is Wireguard?

[Wireguard][12] is open source virtual private network (VPN) software that is much faster, simpler, and more secure than other options such as OpenVPN. It uses state-of-the-art cryptography: ChaCha20 for symmetric cryptography; Curve 25519 (which uses elliptic curves) for key agreement; and BLAKE2 for hashing. These algorithms are designed in a way that is efficient on embedded systems. WIreguard is also available on a wide variety of operating system [platforms][13].

### Prerequisites

For this project, you will need:

  * [Teltonika RUT955][14] or another router supported by OpenWrt
  * A public IP address to connect to your VPN from outside your network
  * An Android phone



### Install OpenWrt

To get started, download the OpenWrt image for your router. Use the [firmware selector][15] to check if OpenWrt supports your router and download the firmware. Enter your router's model, and it will show your options:

![OpenWRT firmware selector][16]

(Lukas Janenas, [CC BY-SA 4.0][17])

Select the firmware version you want to download by using the drop-down input on the right side of the search box.

Download the factory image.

![Downloading the Factory Image][18]

(Lukas Janenas, [CC BY-SA 4.0][17])

Many routers allow you to flash unauthorized firmware from the web interface, but Teltonika Networks does not. To flash the OpenWrt firmware to a router like this, you need to use the bootloader. To do so, follow these steps:

  1. Unplug the router's power cable.
  2. Press and hold the Reset button.
  3. Plug in the router's power cable.
  4. Continue holding the reset button for 5 to 8 seconds after you plug the power cable in.
  5. Set computer's IP address to `192.168.1.15` and the netmask to `255.255.255.0`.
  6. Connect the router and your computer with an Ethernet cable over a LAN port.
  7. Open a web browser and enter `192.168.1.1:/index.html`.
  8. Upload and flash the firmware.



The flashing process can take up to three minutes. Afterward, you should be able to reach the router's web interface by entering `192.168.1.1` in a browser. There is no password set by default.

![OpenWrt authorization][19]

(Lukas Janenas, [CC BY-SA 4.0][17])

### Configure network connectivity

Network connectivity is a requirement. If your Internet service provider (ISP) assigns your IP address automatically using DHCP, you just need to plug your Ethernet cable into the WAN port of your router.

If you need to assign the IP address manually, navigate to **Network → Interfaces**. Select **Edit** to edit your WAN interface. From the **Protocol** field, select **Static address**, and select **Switch protocol**.

![Assigning IP address manually][20]

(Lukas Janenas, [CC BY-SA 4.0][17])

In the **IPv4 address** field, enter your router's address. Set **IPv4 netmask** to match your network subnet; enter the **IPv4 gateway** address you will use to connect to the network; and enter the DNS server's address in the **Use custom DNS servers** field. Save the configuration.

That's it! You have successfully configured your WAN interface to get network connectivity.

### Install the necessary packages

The firmware doesn't include many packages by default, but OpenWrt has a package manager with a selection of packages you can install. Navigate to **System → Software** and update your package manager by selecting **Update lists…**

![OpenWrt package manager][21]

(Lukas Janenas, [CC BY-SA 4.0][17])

In the Filter input, type **Wireguard**, and wait until the system finds all the packages that include this keyword. Find and install the package named **luci-app-wireguard**.

![luci-app-wireguard package][22]

(Lukas Janenas, [CC BY-SA 4.0][17])

This package includes a web interface to configure Wireguard and installs all the dependencies necessary for Wireguard to work.

If you get a warning that a package is missing and can't be found in the repositories before installing the Wireguard package, just ignore it and proceed.

Next, find and install the package named **luci-app-ttyd**. This will be used to access the terminal later.

After these packages are installed, reboot your router for the changes to take effect.

### Configure the Wireguard interface

Next, create the Wireguard interface. Navigate to **Network → Interfaces** and select **Add new interface…** on the bottom-left. In the pop-up window, enter your desired name for the interface, choose **Wireguard VPN** from the drop-down list, and select **Create interface** on the lower-right.

![Creating Wireguard interface][23]

(Lukas Janenas, [CC BY-SA 4.0][17])

In the new pop-up window, select **Generate Key** to generate a private key for the Wireguard interface. In the **Listen Port** field, enter your desired port. I will use the default Wireguard port, **51820**. In the **IP Addresses** field, assign the IP address which will be used for the Wireguard interface. In this example, I use `10.0.0.1/24`. The number **24** indicates the size of my subnet.

![Creating Wireguard interface][24]

(Lukas Janenas, [CC BY-SA 4.0][17])

Save the configuration and restart the interface.

Navigate to **Services → Terminal**, log into the shell, and enter the command `wg show`. You will see some information about your Wiregaurd interface, including its public key. Copy down the public key—you will need it to create peers later.

![Wireguard public key][25]

(Lukas Janenas, [CC BY-SA 4.0][17])

### Configure the firewall

Navigate to **Network → Firewall** and select the **Traffic Rules** tab. On the bottom of the page, select **Add**. In the **Name** field of the pop-up window, give your rule a name, e.g., **Allow-wg**. Next, change the **Destination zone** from **Lan** to **Device**, and set the **Destination port** to 51820.

![Wireguard firewall setup][26]

(Lukas Janenas, [CC BY-SA 4.0][17])

Save the configuration.

### Configure Wireguard on an Android phone

Install the [Wireguard app][27] on your phone from Google Play. Once it's installed, open the app and create a new interface from scratch. In the **Name** field, enter the name you want to use for your interface. In the **Private key** field, press the double-arrow icon on the right to generate a key pair. You will need the public key from above to create a peer between your phone and router. In the **Addresses** field, assign the IP address you will use to reach the phone over VPN. I will use `10.0.0.2/24`. In **Listen port**, enter a port; I will again use the default port.

![Setting up VPN interface on Android][28]

(Lukas Janenas, [CC BY-SA 4.0][17])

Save the configuration.

To add a peer to the configuration, select **Add peer**. In the **Public key** field, enter your router's Wireguard public key. In the **Endpoint** field, enter your router's public IP address and port separated by a colon, e.g., `12.34.56.78:51820`. In the **Allowed IP**s field, enter the IP addresses you want to reach through the Wireguard interface. (You can enter your router's VPN interface IP address and LAN interface address.) The IP addresses must be separated by commas. You can also define the size of the subnet.

![Adding a VPN peer on an Android][29]

(Lukas Janenas, [CC BY-SA 4.0][17])

Save the configuration.

There's one last step left in the configuration: adding a peer on the router.

### Add a peer on the router

Navigate to **Network → Interfaces** and select your Wireguard interface. Go to the **Peers** tab and select **Add peer**. In the **Description** field, enter the peer's name. In the **Public Key** field, enter your phone's Wireguard interface public key, and in the **Allowed IPs** field, enter your phone's Wireguard interface IP address. Check the **Route Allowed IPs** checkbox.

![Adding a peer on the router][30]

(Lukas Janenas, [CC BY-SA 4.0][17])

Save the configuration and restart the interface.

### Test the configuration

Open a web browser on your phone. In the URL bar, enter the IP address `10.0.0.1` or `192.168.1.1`. You should be able to reach your router's website.

![Logging into the VPN from Android][31]

(Lukas Janenas, [CC BY-SA 4.0][17])

### Your very own VPN

There are lots of VPN services being advertised these days, but there's a lot to be said for owning and controlling your own infrastructure, especially when that infrastructure only exists to boost security. There's no need to rely on somebody else to provide you with a secure connection to your data. Using OpenWrt and Wireguard, you can have your own open source VPN solution.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/5/open-source-private-vpn

作者：[Lukas Janėnas][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/lukasjan
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/vpn_scrabble_networking.jpg?itok=pdsUHw5N (scrabble letters used to spell "VPN")
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
[28]: https://opensource.com/sites/default/files/uploads/vpn_inferfacesetup.png (Setting up VPN interface on Android)
[29]: https://opensource.com/sites/default/files/uploads/addpeeronphone.png (Adding a VPN peer on an Android)
[30]: https://opensource.com/sites/default/files/uploads/addpeeronrouter.png (Adding a peer on the router)
[31]: https://opensource.com/sites/default/files/uploads/android-vpn-login.png (Logging into the VPN from Android)

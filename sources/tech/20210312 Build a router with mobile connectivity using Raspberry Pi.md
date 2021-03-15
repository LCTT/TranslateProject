[#]: subject: (Build a router with mobile connectivity using Raspberry Pi)
[#]: via: (https://opensource.com/article/21/3/router-raspberry-pi)
[#]: author: (Lukas Janėnas https://opensource.com/users/lukasjan)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Build a router with mobile connectivity using Raspberry Pi
======
Use OpenWRT to get more control over your network's router.
![Mesh networking connected dots][1]

The Raspberry Pi is a small, single-board computer that, despite being the size of a credit card, is capable of doing a lot of things. In reality, this little computer can be almost anything you want to be. You just need to open up your imagination.

Raspberry Pi enthusiasts have made many different projects, from simple programs to complex automation projects and solutions like weather stations or even smart-home devices. This article will show how to turn your Raspberry Pi into a router with LTE mobile connectivity using the OpenWRT project.

### About OpenWRT and LTE

[OpenWRT][2] is an open source project that uses Linux to target embedded devices. It's been around for more than 15 years and has a large and active community.

There are many ways to use OpenWRT, but its main purpose is in routers. It provides a fully writable filesystem with package management, and because it is open source, you can see and modify the code and contribute to the ecosystem. If you would like to have more control over your router, this is the system you want to use.

Long-term evolution (LTE) is a standard for wireless broadband communication based on the GSM/EDGE and UMTS/HSPA technologies. The LTE modem I'm using is a USB device that can add 3G or 4G (LTE) cellular connectivity to a Raspberry Pi computer.

![Teltonika TRM240 modem][3]

(Lukas Janenas, [CC BY-SA 4.0][4])

### Prerequisites

For this project, you will need:

  * A Raspberry Pi with a power cable
  * A computer, preferably running Linux
  * A microSD card with at least 16GB
  * An Ethernet cable
  * An LTE modem (I am using a Teltonika [TRM240][5])
  * A SIM card for mobile connectivity



### Install OpenWRT

To get started, download the latest [Raspberry Pi-compatible release of OpenWRT][6]. On the OpenWRT site, you see four images: two with **ext4** and two with **squashfs** filesystems. I use the **ext4** filesystem. You can download either the **factory** or **sysupgrade** image; both work great.

![OpenWRT image files][7]

(Lukas Janenas, [CC BY-SA 4.0][4])

Once you download the image, you need to extract it and install it on the SD card by [following these instructions][8]. It can take some time to install the firmware, so be patient. Once it's finished, there will be two partitions on your microSD card. One is used for the bootloader and the other one for the OpenWRT system.

### Boot up the system

To boot up your new system, insert the microSD card into the Raspberry Pi, connect the Pi to your router (or a switch) with an Ethernet cable, and power it on.

If you're experienced with the Raspberry Pi, you may be used to accessing it through a terminal over SSH, or just by connecting it to a monitor and keyboard. OpenWRT works a little differently. You interact with this software through a web browser, so you must be able to access your Pi over your network.

By default, the Raspberry Pi uses this IP address: 192.168.1.1. The computer you use to configure the Pi must be on the same subnet as the Pi. If your network doesn't use 192.168.1.x addresses, or if you're unsure, open **Settings** in GNOME, navigate to network settings, select **Manual**, and enter the following IP address and Netmask:

  * **IP address:** 192.168.1.15
  * **Netmask:** 255.255.255.0



![IP addresses][9]

(Lukas Janenas, [CC BY-SA 4.0][4])

Open a web browser on your computer and navigate to 192.168.1.1. This opens an authentication page so you can log in to your Pi.

![OpenWRT login page][10]

(Lukas Janenas, [CC BY-SA 4.0][4])

No password is required yet, so just click the **Login** button to continue.

### Configure network connection

The Raspberry Pi has only one Ethernet port, while normal routers have a couple of them: one for WAN (wired area network) and the other for LAN (local area network). You have two options:

  1. Use your Ethernet port for network connectivity
  2. Use WiFi for network connectivity



**To use Ethernet:**

Should you decide to use Ethernet, navigate to **Network → Interfaces**. On the configuration page, press the blue **Edit** button that is associated with the **LAN** interface.

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

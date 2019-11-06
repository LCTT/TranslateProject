[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Cloning a MAC address to bypass a captive portal)
[#]: via: (https://fedoramagazine.org/cloning-a-mac-address-to-bypass-a-captive-portal/)
[#]: author: (Esteban Wilson https://fedoramagazine.org/author/swilson/)

Cloning a MAC address to bypass a captive portal
======

![][1]

If you ever attach to a WiFi system outside your home or office, you often see a portal page. This page may ask you to accept terms of service or some other agreement to get access. But what happens when you can’t connect through this kind of portal? This article shows you how to use NetworkManager on Fedora to deal with some failure cases so you can still access the internet.

### How captive portals work

Captive portals are web pages offered when a new device is connected to a network. When the user first accesses the Internet, the portal captures all web page requests and redirects them to a single portal page.

The page then asks the user to take some action, typically agreeing to a usage policy. Once the user agrees, they may authenticate to a RADIUS or other type of authentication system. In simple terms, the captive portal registers and authorizes a device based on the device’s MAC address and end user acceptance of terms. (The MAC address is [a hardware-based value][2] attached to any network interface, like a WiFi chip or card.)

Sometimes a device doesn’t load the captive portal to authenticate and authorize the device to use the location’s WiFi access. Examples of this situation include mobile devices and gaming consoles (Switch, Playstation, etc.). They usually won’t launch a captive portal page when connecting to the Internet. You may see this situation when connecting to hotel or public WiFi access points.

You can use NetworkManager on Fedora to resolve these issues, though. Fedora will let you temporarily clone the connecting device’s MAC address and authenticate to the captive portal on the device’s behalf. You’ll need the MAC address of the device you want to connect. Typically this is printed somewhere on the device and labeled. It’s a six-byte hexadecimal value, so it might look like _4A:1A:4C:B0:38:1F_. You can also usually find it through the device’s built-in menus.

### Cloning with NetworkManager

First, open _**nm-connection-editor**_, or open the WiFI settings via the Settings applet. You can then use NetworkManager to clone as follows:

  * For Ethernet – Select the connected Ethernet connection. Then select the _Ethernet_ tab. Note or copy the current MAC address. Enter the MAC address of the console or other device in the _Cloned MAC address_ field.
  * For WiFi – Select the WiFi profile name. Then select the WiFi tab. Note or copy the current MAC address. Enter the MAC address of the console or other device in the _Cloned MAC address_ field.



### **Bringing up the desired device**

Once the Fedora system connects with the Ethernet or WiFi profile, the cloned MAC address is used to request an IP address, and the captive portal loads. Enter the credentials needed and/or select the user agreement. The MAC address will then get authorized.

Now, disconnect the WiFi or Ethernet profile, and change the Fedora system’s MAC address back to its original value. Then boot up the console or other device. The device should now be able to access the Internet, because its network interface has been authorized via your Fedora system.

This isn’t all that NetworkManager can do, though. For instance, check out this article on [randomizing your system’s hardware address][3] for better privacy.

> [Randomize your MAC address using NetworkManager][3]

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/cloning-a-mac-address-to-bypass-a-captive-portal/

作者：[Esteban Wilson][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/swilson/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2019/10/clone-mac-nm-816x345.jpg
[2]: https://en.wikipedia.org/wiki/MAC_address
[3]: https://fedoramagazine.org/randomize-mac-address-nm/

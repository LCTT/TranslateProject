[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Managing your attached hardware on Linux with systemd-udevd)
[#]: via: (https://opensource.com/article/20/2/linux-systemd-udevd)
[#]: author: (David Clinton https://opensource.com/users/dbclinton)

Managing your attached hardware on Linux with systemd-udevd
======
Manipulate how your Linux system handles physical devices with udev.
![collection of hardware on blue backround][1]

Linux does a great job automatically recognizing, loading, and exposing attached hardware devices from countless vendors. In fact, it was this feature that, many years ago, convinced me to insist that my employer convert its entire infrastructure to Linux. The pain point was the way a certain company in Redmond couldn't load drivers for the integrated network card on our Compaq desktops while Linux did it effortlessly.

In the years since then, Linux's library of recognized devices has grown enormously along with the sophistication of the process. And the star of that show is [udev][2]. Udev's job is to listen for events from the Linux kernel involving changes to the state of a device. It could be a new USB device that's plugged in or pulled out, or it might be a wireless mouse going offline as it's drowned in spilled coffee.

Udev's job is to handle all changes of state by, for instance, assigning the names or permissions through which devices are accessed. A record of those changes can be accessed through [dmesg][3]. Since dmesg typically spits out thousands of entries, it's smart to filter the results. The example below shows how Linux identifies my WiFi interface. It shows the chipset my wireless device uses (**ath9k**), the original name it was assigned early in the process (**wlan0**), and the big, ugly permanent name it's currently using (**wlxec086b1ef0b3**):


```
$ dmesg | grep wlan
[    5.396874] ath9k_htc 1-3:1.0 wlxec086b1ef0b3: renamed from wlan0
```

In this article, I'll discuss why anyone might want to use a name like that. Along the way, I'll explore the anatomy of udev configuration files and then show how to make changes to udev settings, including how to edit the way the system names devices. This article is based on a module from my new course, [Linux System Optimization][4].

### Understanding the udev configuration system

On systemd machines, udev operations are managed by the **systemd-udevd** daemon. You can check the status of the udev daemon the regular systemd way using **systemctl status systemd-udevd**.

Technically, udev works by trying to match each system event it receives against sets of rules found in either the **/lib/udev/rules.d/** or **/etc/udev/rules.d/** directories. Rules files include match keys and assignment keys. The set of available match keys includes **action**, **name**, and **subsystem**. This means that if a device with a specified name that's part of a specified subsystem is detected, then it will be assigned a preset configuration.

Then, the "assignment" key/value pairs are used to apply the desired configuration. You could, for instance, assign a new name to the device, associate it with a filesystem symlink, or restrict access to a particular owner or group. Here's an excerpt from such a rule from my workstation:


```
$ cat /lib/udev/rules.d/73-usb-net-by-mac.rules
# Use MAC based names for network interfaces which are directly or indirectly
# on USB and have an universally administered (stable) MAC address (second bit
# is 0). Don't do this when ifnames is disabled via kernel command line or
# customizing/disabling 99-default.link (or previously 80-net-setup-link.rules).

IMPORT{cmdline}="net.ifnames"
ENV{net.ifnames}=="0", GOTO="usb_net_by_mac_end"

ACTION=="add", SUBSYSTEM=="net", SUBSYSTEMS=="usb", NAME=="", \
    ATTR{address}=="?[014589cd]:*", \
    TEST!="/etc/udev/rules.d/80-net-setup-link.rules", \
    TEST!="/etc/systemd/network/99-default.link", \
    IMPORT{builtin}="net_id", NAME="$env{ID_NET_NAME_MAC}"
```

The **add** action tells udev to fire up whenever a new device is plugged in that is part of the networking subsystem _and_ is a USB device. In addition, if I understand it correctly, the rule will apply only when the device has a MAC address consisting of characters within a certain range and, in addition, only if the **80-net-setup-link.rules** and **99-default.link** files do _not_ exist.

Assuming all these conditions are met, the interface ID will be changed to match the device's MAC address. Remember the previous dmesg entry showing how my interface name was changed from **wlan0** to that nasty **wlxec086b1ef0b3** name? That was a result of this rule's execution. How do I know? Because **ec:08:6b:1e:f0:b3** is the device's MAC address (minus the colons):


```
$ ifconfig -a
wlxec086b1ef0b3: flags=4163&lt;UP,BROADCAST,RUNNING,MULTICAST&gt;  mtu 1500
        inet 192.168.0.103  netmask 255.255.255.0  broadcast 192.168.0.255
        inet6 fe80::7484:3120:c6a3:e3d1  prefixlen 64  scopeid 0x20&lt;link&gt;
        ether ec:08:6b:1e:f0:b3  txqueuelen 1000  (Ethernet)
        RX packets 682098  bytes 714517869 (714.5 MB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 472448  bytes 201773965 (201.7 MB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0
```

This udev rule exists by default within Linux. I didn't have to write it myself. But why bother—especially seeing how difficult it is to work with such an interface designation? Take a second look at the comments included with the rule:


```
# Use MAC based names for network interfaces which are directly or indirectly
# on USB and have an universally administered (stable) MAC address (second bit
# is 0). Don't do this when ifnames is disabled via kernel command line or
# customizing/disabling 99-default.link (or previously 80-net-setup-link.rules).
```

Note how this rule is designed specifically for USB-based network interfaces. Unlike PCI network interface cards (NICs), USB devices are likely to be removed and replaced from time to time. This means that there's no guarantee that their ID won't change. They could be **wlan0** one day and **wlan3** the next. To avoid confusing the applications, assign devices absolute IDs—like the one given to my USB interface.

### Manipulating udev settings

For my next trick, I'm going to grab the MAC address and current ID for the Ethernet network interface on a [VirtualBox][5] virtual machine and then use that information to create a new udev rule that will change the interface ID. Why? Well, perhaps I'm planning to work with the device from the command line, and having to type that long name can be annoying. Here's how that will work.

Before I can change my ID, I'll need to disable [Netplan][6]'s current network configuration. That'll force Linux to pay attention to the new configuration. Here's my current network interface configuration file in the **/etc/netplan/** directory:


```
$ less /etc/netplan/50-cloud-init.yaml
# This file is generated from information provided by
# the datasource.  Changes to it will not persist across an instance.
# To disable cloud-init's network configuration capabilities, write a file
# /etc/cloud/cloud.cfg.d/99-disable-network-config.cfg with the following:
# network: {config: disabled}
network:
    ethernets:
        enp0s3:
            addresses: []
            dhcp4: true
    version: 2
```

The **50-cloud-init.yaml** file contains a very basic interface definition. But it also includes some important information about disabling the configuration in the comments. To do so, I'll move to the **/etc/cloud/cloud.cfg.d** directory and create a new file called **99-disable-network-config.cfg** and add the **network: {config: disabled}** string.

While I haven't tested this method on distros other than Ubuntu, it should work on any flavor of Linux with systemd (which is nearly all of them). Whatever you're using, you'll get a good look at writing udev config files and testing them.

Next, I need to gather some system information. Running the **ip** command reports that my Ethernet interface is called **enp0s3** and its MAC address is **08:00:27:1d:28:10**:


```
$ ip a
2: enp0s3: &lt;BROADCAST,MULTICAST,UP,LOWER_UP&gt; mtu 1500 qdisc fq_codel state UP group default qlen 1000
    link/ether 08:00:27:1d:28:10 brd ff:ff:ff:ff:ff:ff
    inet 192.168.0.115/24 brd 192.168.0.255 scope global dynamic enp0s3
```

Now, I'll create a new file called **peristent-net.rules** in the **/etc/udev/rules.d** directory. I'm going to give the file a name that starts with a low number, 10:


```
$ cat /etc/udev/rules.d/10-persistent-network.rules
ACTION=="add", SUBSYSTEM=="net",ATTR{address}=="08:00:27:1d:28:10",NAME="eth3"
```

The lower the number, the earlier Linux will execute the file, and I want this one to go early. The file contains code that will give the name **eth3** to a network device when it's added—as long as its address matches **08:00:27:1d:28:10**, which is my interface's MAC address. 

Once I save the file and reboot the machine, my new interface name should be in play. I may need to log in directly to my virtual machine and use **dhclient** to manually get Linux to request an IP address on this newly named network. Opening SSH sessions might be impossible without doing that first:


```
`$ sudo dhclient eth3`
```

Done. So you're now able to force udev to make your computer refer to a NIC the way you want. But more importantly, you've got the tools to figure out how to manage _any_ misbehaving device.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/2/linux-systemd-udevd

作者：[David Clinton][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/dbclinton
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/osdc_BUS_Apple_520.png?itok=ZJu-hBV1 (collection of hardware on blue backround)
[2]: https://en.wikipedia.org/wiki/Udev
[3]: https://en.wikipedia.org/wiki/Dmesg
[4]: https://pluralsight.pxf.io/RqrJb
[5]: https://www.virtualbox.org/
[6]: https://netplan.io/

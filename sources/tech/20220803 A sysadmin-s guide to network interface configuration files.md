[#]: subject: "A sysadmin's guide to network interface configuration files"
[#]: via: "https://opensource.com/article/22/8/network-configuration-files"
[#]: author: "David Both https://opensource.com/users/dboth"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

A sysadmin's guide to network interface configuration files
======
Simplify the complex world of interface configuration files with this handy tutorial.

![Why the operating system matters even more in 2017][1]

Image by: Internet Archive Book Images. Modified by Opensource.com. CC BY-SA 4.0

In the first article of this series, [Get started with NetworkManager on Linux][2], I looked at what NetworkManager does and some of the tools it provides for viewing network connections and devices. I discussed using the `nmcli` command to view the status of network devices and connections on a host. I also mentioned that NetworkManager does not need interface configuration files for most hosts. However, it can create its own INI-style connection configuration files, and it recognizes the older and now deprecated network interface configuration files.

This article explores three questions:

* Why do I not use interface configuration files?
* Why do I use interface configuration files?
* Why do I use the old network interface configuration files?

Sound confusing? Read on.

### My network philosophy

I talk about philosophy a lot. I even wrote a book, [The Linux Philosophy for SysAdmins][3], which has tenets that apply to the design and structure of computers, operating systems, and networks. I won't bore you with all the details, but there are some things to consider when designing–or redesigning–a network.

As a "Lazy SysAdmin," I like to "Find the Simplicity"–yes, those are two of the tenets–and create an elegant network design. This is not just about the physical design and layout of the network components and wiring, although the best, most elegant, and easiest networks to work on are well laid out physically and look good. However, this discussion is about the logical structure of the network.

### Why I don't use interface configuration files?

I don't use interface configuration files on my network mostly because each host is dynamically configured at boot time using the [Dynamic Host Configuration Protocol (DHCP) server][4]. This allows centralized configuration and management of a few computers up to hundreds or even thousands of systems. The bottom line is that all the configuration data necessary for each host is stored in the DHCP configuration file, `/etc/dhcp/dhcpd.conf`, where it is centrally managed.

I impose simplicity on my network by using tools that provide central management for most of the connected hosts–all except for hosts that work as routers and provide server services. The idea is that using DHCP to provide all of the network configuration data needed by most of the network hosts simplifies my job and allows me to be the "Lazy SysAdmin." Suppose something changes on the network, such as the IP address to the default gateway or the primary name server? Changing that information in a single location, the `dhcpd.conf` file, is much less work than changing a static configuration on ten or a thousand hosts.

NetworkManager does not need local configuration files when DHCP provides the network configuration information. By default, all Fedora and Red Hat hosts obtain their network configuration from a DHCP server. This makes installing new hosts on a network easy and simple. All you need is a DHCP server.

For most networks with a single host, such as in a home office with one or two laptops and a few other devices, the wireless router provided by the ISP contains the DHCP server required to offer a complete set of configuration data to all your devices. The router's DHCP server provides the network configuration data even if you use the 4-port wired switch on the back of most wireless routers to connect a wired desktop computer.

### Why I do use interface configuration files?

Most of my network hosts don't need static network configurations and use DHCP.

However, there are two hosts on which I do use static network configuration: My network server–the one that runs the DHCP server–and the Linux host I use for my network/firewall. These two hosts are best configured using static setups that don't depend upon external configurations.

Think about this for a minute. If the DHCP server must have an IP address to send network configuration information, including an IP address, to itself… Well, that just won't work—sort of the network equivalent of the chicken and egg situation.

DHCP clients request network configuration using a broadcast on the network, and the server responds to that request using the MAC address of the requesting client. The DHCP server cannot also be a DHCP client, so this just won't work.

Even if using the DHCP server to set its own IP address–and other network configuration attributes–could be made to work, all of the recommendations I see on the Internet suggest that it would be a really terrible idea and that no good administrator would even consider doing such a thing.

The Linux host I use for a router and firewall has four network interfaces, three of which are currently active, and one on the motherboard, which is defective. It also has a set of forwarding and routing rules that must always be consistent. This configuration is best dealt with using static network settings.

For example, one interface on my router connects to the WAN side of my wireless router. The wireless router provides an internal DHCP server for hosts connected to its LAN and WiFi side but depends upon either static or DHCP configuration on the WAN side. So I configure both the WAN side of the wireless router and the NIC that connects it to my Linux router using a static setup.

Another interface on that Linux router connects to the outside world via a static IP address provided by my ISP. If I set that interface to be configured by DHCP, the ISP's router would serve it one of the remaining other IP addresses in the eight-address block I have been assigned.

Any type of static network configuration, as opposed to DHCP, requires network configuration files.

### Why I still use the old style ifcfg-<interface-name> files

The answer to this is really simple. I just have not gotten around to making the switch. These files are located in the `/etc/sysconfig/network-scripts` directory, and–fortunately for me–NetworkManager will still search for and use these if it has none of its own network connection files. There won't be any network connection files because they do not get created automatically, and I have not needed to create them.

I intend to make the switch in Part 3 of this series and bring my network up to current configuration practices. For now, however, it is still a good idea to know about the old-style network configuration files because there are still a lot of them around.

### What I have now

I'll review the current state of the network on my router. Aside from the local loop (`lo` )–which is always present on Unix and Linux hosts–this host currently has three active network interface cards (NICs). Due to the problems with the on-board NIC described in Part 1 of this series, I deactivated it in UEFI/BIOS of this host so that it no longer shows up. I have also [disabled IPv6][5] on my network as I don't need it.

The following is the `nmcli` command showing the state of the NICs on my router/firewall host:

```
[root@wally ~]# nmcli
np4s0: connected to enp4s0
        "Realtek RTL8111/8168/8411"
        ethernet (r8169), 84:16:F9:04:44:03, hw, mtu 1500
        ip4 default
        inet4 45.20.209.41/29
        route4 45.20.209.40/29 metric 102
        route4 default via 45.20.209.46 metric 102
 
enp1s0: connected to enp1s0
        "Realtek RTL8111/8168/8411"
        ethernet (r8169), 84:16:F9:03:E9:89, hw, mtu 1500
        inet4 192.168.10.1/24
        route4 192.168.10.0/24 metric 101
 
enp2s0: connected to enp2s0
        "Realtek RTL8111/8168/8411"
        ethernet (r8169), 84:16:F9:03:FD:85, hw, mtu 1500
        inet4 192.168.0.254/24
        route4 192.168.0.0/24 metric 100
 
lo: unmanaged
        "lo"
        loopback (unknown), 00:00:00:00:00:00, sw, mtu 65536
 
DNS configuration:
        servers: 192.168.0.52 8.8.8.8 8.8.4.4
        interface: enp4s0
 
        servers: 192.168.0.52 8.8.8.8
        interface: enp2s0
 
        servers: 192.168.0.52 8.8.8.8
        interface: enp1s0
```

Each of these NICs has an interface configuration file in the `/etc/sysconfig/network-scripts/` directory. This is because they were originally installed at a time when NetworkManager—or the earlier network service—created those files automatically during installation. Since NetworkManager continues to recognize these files, there is no pressing need for me to do anything different.

### Interface configuration file naming

Fortunately, most of you missed out on some of the fun all us old-time sysadmins used to have when adding, removing, or just moving the NIC hardware in hosts with multiple NICs. It seemed like all of the NICs would get renamed whenever anything changed. That meant I would need to determine which name each NIC was given and modify the interface configuration files to match the correct names.

There are now very consistent NIC naming conventions based on the NIC's logical position on the PCIe or USB data busses. This convention was created around 2009 to eliminate those problems.

#### How it works–sort of

The `udev` device manager detects when a new device has been added to the system, such as a new NIC, and creates a rule to identify and name it if one does not already exist. During the early part of the startup phase, the Linux kernel uses `udev` to identify connected devices, including network interface controllers. At this stage, the devices are still known by their traditional names of **ethX**. Shortly after that, `systemd` renames the devices according to a series of hierarchical naming schemes.

I used my firewall system as an example of a system with multiple network connections. You can also do this on your own Linux hosts.

```
[root@wally ~]# dmesg | grep eth
[    2.081738] r8169 0000:01:00.0 eth0: RTL8168e/8111e, 84:16:f9:03:e9:89, XID 2c2, IRQ 126
[    2.081830] r8169 0000:01:00.0 eth0: jumbo features [frames: 9194 bytes, tx checksumming: ko]
[    2.089218] r8169 0000:02:00.0 eth1: RTL8168e/8111e, 84:16:f9:03:fd:85, XID 2c2, IRQ 127
[    2.089303] r8169 0000:02:00.0 eth1: jumbo features [frames: 9194 bytes, tx checksumming: ko]
[    2.094383] r8169 0000:04:00.0 eth2: RTL8168e/8111e, 84:16:f9:04:44:03, XID 2c2, IRQ 128
[    2.094467] r8169 0000:04:00.0 eth2: jumbo features [frames: 9194 bytes, tx checksumming: ko]
[    2.142068] r8169 0000:01:00.0 enp1s0: renamed from eth0
[    2.152128] r8169 0000:04:00.0 enp4s0: renamed from eth2
[    2.161346] r8169 0000:02:00.0 enp2s0: renamed from eth1

[root@wally ~]#
```

This example shows that a little over two seconds into the Linux startup sequence, the **ethX** network devices were located, and less than a second later, they were renamed **enpXs0**.

All current releases of RHEL, CentOS, and Fedora use the newest NIC naming conventions. Most other distros also use this naming convention.

The NIC naming convention for these distributions is described in detail in the RHEL 7 document, "Networking Guide," with an explanation of how the names are derived. Using the NetworkManager tools to manage networking is covered in the RHEL 8 document, "Configuring and Managing Networking."

The following is an excerpt from Chapter 11 of the RHEL 7 "Networking Guide":

* Scheme 1: Names incorporating Firmware or BIOS provided index numbers for on-board devices (example: eno1), are applied if that information from the firmware or BIOS is applicable and available, else falling back to scheme 2.
* Scheme 2: Names incorporating Firmware or BIOS provided PCI Express hotplug slot index numbers (example: ens1) are applied if that information from the firmware or BIOS is applicable and available, else falling back to scheme 3.
* Scheme 3: Names incorporating physical location of the connector of the hardware (example: enp2s0), are applied if applicable, else falling directly back to scheme 5 in all other cases.
* Scheme 4: Names incorporating interface's MAC address (example: enx78e7d1ea46da), is not used by default, but is available if the user chooses.
* Scheme 5: The traditional unpredictable kernel naming scheme, is used if all other methods fail (example: eth0).

The primary function of the revised naming schemes is to provide a consistent set of NIC names so that installing a new NIC or even just a reboot would not cause the NIC names to change. This by itself is well worth the changes. I have had plenty of opportunities to fight with the apparently random renaming of multiple **ethX** devices on a single host. That was much less fun than learning the revised naming schemes.

### Understanding interface configuration files

These interface configuration files are easy to create and modify. The following configuration files on my firewall/router host are all located in the `/etc/sysconfig/network-scripts` directory. This directory previously contained all of the scripts used to manage the network connections, but NetworkManager has made them obsolete. Only the deprecated interface configuration files might remain in this directory.

```
-rw-r--r-- 1 root root 381 Jan 11 
2021 ifcfg-enp1s0
-rw-r--r-- 1 root root 507 Jul 27 
2020 ifcfg-enp2s0
-rw-r--r-- 1 root root 924 Mar 31 14:24 ifcfg-enp4s0
```

This is the configuration file for the interface that connects the firewall host to my home network, as you can see from the comment:

```
[root@wally network-scripts]# cat ifcfg-enp2s0
# Interface configuration file for enp2s0 / 192.168.0.254
# This interface is for the internal network
# Correct as of 20220711
HWADDR=84:16:f9:03:fd:85
NAME="enp2s0"
TYPE=Ethernet
ONBOOT=yes
BOOTPROTO=static
IPADDR=192.168.0.254
PREFIX=24
DNS1=192.168.0.52
DNS2=8.8.8.8
DEFROUTE=no
PEERDNS=yes
PEERROUTES=no
IPV4_FAILURE_FATAL=no
```

This file is for a fairly simple static configuration that provides the IP address, the CIDR prefix, and two DNS server IP addresses. No default route (gateway) IP address is specified as that is configured in one of the other interface configuration files.

The code block below shows the interface configuration file for the connection from my Linux router to the ISP's router. It uses one of the static IP addresses provided to me by my ISP.

```
##############################################################################
# Interface configuration file for enp4s0 / 45.20.209.41
# This NIC was installed to circumvent problems with motherboard NIC, eno1.
------------------------------------------------------------------------------
# This interface is for the WAN - the AT&T fiber optic external network
# Correct as of 20220711
##############################################################################
TYPE= "Ethernet"
BOOTPROTO="static"
NM_CONTROLLED= "yes"
DEFROUTE= "yes"
NAME=enp4s0
UUID="fa2117dd-6c7a-44e0-9c9d-9c662716a352"
ONBOOT= "yes"
HWADDR=84:16:f9:04:44:03
IPADDR=45.20.209.41
PREFIX=29
GATEWAY=45.20.209.46
DNS1=192.168.0.52
DNS2=8.8.8.8
DNS3=8.8.4.4
PEERDNS=no
IPv6INIT=no
IPv6_AUTOCONF=no
IPv6_DEFROUTE=no
```

Since I don't use IPv6 and have disabled it, I could delete the IPv6 statement in both files.

#### Network configuration variables

The table below lists the most common network configuration variables, along with some brief explanations for each. Many IPv6 options are functionally equivalent to the similarly named IPv4 ones. Local configuration variable settings override those provided by a DHCP server. You can use DHCP for configuring a host but use an interface configuration file to override one or more of the DHCP configuration variables.

| Configuration variable | Description | 
| :- | :- |
| TYPE | Type of network such as Ethernet or token ring. | 
| PROXY_METHOD | Proxy configuration method. "none" means no proxy is in use. | 
| BROWSER_ONLY | Whether a proxy configuration is for browsers only. | 
| BOOTPROTO | Options are dhcp, bootp, none, and static. The "none" option implies DHCP. | 
| DEFROUTE | This interface is the default route for this host to the outside world. | 
| IPv4_FAILURE_FATAL | If this is set to "no" failure to obtain an IPv4 connection will not affect any attempt to make an IPv6 connection. | 
| NAME | The interface name, such as enp0s3. This should match the interface name in the interface configuration file name. | 
| UUID | A Universally Unique Identifier for the interface. It is created with a hash of the interface name. The HWADDR is an older means of bonding the file to the hardware interface, and I have found that the UUID can be commented out or deleted without issues. | 
| DEVICE | The name of the interface to which this configuration file is bound. | 
| ONBOOT | If yes, this starts the interface at boot (really startup time). If set to no, the interface is not started until a user logs in at the GUI or manually starts the interface. | 
| HWADDR | The MAC address of the interface. This is one of the more important fields in the file as it is used to bond the file to the correct hardware interface. The UUID is a more recent addition and can also be used, but the HWADDR was first and is more widely used. | 
| DNS1, DNS2 | Up to two name servers may be specified. | 
| USERCTL | Specifies whether non-privileged users may start and stop this interface. Options are yes/no. | 
| IPADDR | The IP Address assigned to this NIC. | 
| BROADCAST | The broadcast address for this network such as 10.0.2.255. | 
| NETMASK | The netmask for this subnet such as 255.255.255.0. Use either NETMASK or PREFIX but not both. | 
| PREFIX | The CIDR prefix for the network such as 24. Use either NETMASK or PREFIX but not both. | 
| NETWORK | The network ID for this subnet such as 10.0.2.0. | 
| SEARCH | The DNS domain name to search when doing lookups on unqualified hostnames such as using studentvm1 instead of studentvm1.example.com. | 
| GATEWAY | The network router or default gateway for this subnet, such as 10.0.2.1. | 
| PEERDNS | The yes value indicates that /etc/resolv.conf is to be modified by inserting the DNS server entries specified by DNS1 and DNS2 options in this file. No means do not alter the resolv.conf file. Yes is the default when DHCP is specified in the BOOTPROTO line. | 
| IPv6INIT | Whether to initialize IPv6 or not. The default is yes. | 
| IPv6_AUTOCONF | Yes means use DHCP for configuration of IPv6 on this interface. | 
| IPv6_DEFROUTE | This interface is the IPv6 default route for this host to the outside world. | 
| IPv6_FAILURE_FATAL | If this is set to "no" failure to obtain an IPv6 connection will not affect any attempt to make an IPv4 connection. | 
| IPv6_ADDR_GEN_MODE | Configure IPv6 Stable Privacy addressing. |

There are many more configuration variables than are listed here, but these are the ones that are most frequently used.

### Final thoughts

There are still plenty of Linux hosts around that use the interface configuration files described in this article. Despite being deprecated, NetworkManager still recognizes these files and can use them to configure network interfaces. However, most modern Linux systems use NetworkManager, so no configuration files are needed unless they serve a special use case, like a server or a router.

I have a few hosts that require more than just the standard NetworkManager configuration. For me, it has just not been a priority to change from the old interface configuration files to the current connection configuration files used by NetworkManager. To prevent future problems with my network, I need to switch to the NetworkManager network connection files. The next article in this series will describe how I make that switch.

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/8/network-configuration-files

作者：[David Both][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/dboth
[b]: https://github.com/lkxed
[1]: https://opensource.com/sites/default/files/lead-images/yearbook-haff-rx-linux-file-lead_0.png
[2]: https://opensource.com/article/22/4/networkmanager-linux
[3]: http://www.both.org/?p=855
[4]: https://opensource.com/article/22/7/configure-dhcp-server
[5]: https://opensource.com/article/22/8/disable-ipv6

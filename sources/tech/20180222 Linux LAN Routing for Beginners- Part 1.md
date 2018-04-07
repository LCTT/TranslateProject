Linux LAN Routing for Beginners: Part 1
============================================================


![Linux routing](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/traffic_warder.jpeg?itok=hZxS_PB4 "Linux routing")
Carla Schroder offers an overview of hardware and operating systems, plus IPv4 addressing basics, in this tutorial.[Creative Commons Attribution][1][Wikimedia Commons: Public Domain][2]

Once upon a time we learned about [IPv6 routing][4]. Now we're going to dig into the basics of IPv4 routing with Linux. We'll start with an overview of hardware and operating systems, and IPv4 addressing basics, and next week we'll setup and test routing.

### LAN Router Hardware

Linux is a real networking operating system, and always has been, with network functionality built-in from the beginning. Building a LAN router is simple compared to building a gateway router that connects your LAN to the Internet. You don't have to hassle with security or firewall rules, which are still complicated by having to deal with NAT, network address translation, an affliction of IPv4\. Why do we not drop IPv4 and migrate to IPv6? The life of the network administrator would be ever so much simpler.

But I digress. Ideally, your Linux router is a small machine with at least two network interfaces. Linux Gizmos has a great roundup of single-board computers here: [Catalog of 98 open-spec, hacker friendly SBCs][5]. You could use an old laptop or desktop PC. You could use a compact computer, like the ZaReason Zini or the System76 Meerkat, though these are a little pricey at nearly $600\. But they are stout and reliable, and you're not wasting money on a Windows license.

The Raspberry Pi 3 Model B is great for lower-demand routing. It has a single 10/100 Ethernet port, onboard 2.4GHz 802.11n wireless, and four USB ports, so you can plug in more USB network interfaces. USB 2.0 and the slower onboard network interfaces make the Pi a bit of a network bottleneck, but you can't beat the price ($35 without storage or power supply). It supports a couple dozen Linux flavors, so chances are you can have your favorite. The Debian-based Raspbian is my personal favorite.

### Operating System

You might as well stuff the smallest version of your favorite Linux on your chosen hardware thingy, because the specialized router operating systems such as OpenWRT, Tomato, DD-WRT, Smoothwall, Pfsense, and so on all have their own non-standard interfaces. In my admirable opinion this is an unnecessary complication that gets in the way rather than helping. Use the standard Linux tools and learn them once.

The Debian net install image is about 300MB and supports multiple architectures, including ARM, i386, amd64, and armhf. Ubuntu's server net installation image is under 50MB, giving you even more control over what packages you install. Fedora, Mageia, and openSUSE all offer compact net install images. If you need inspiration browse [Distrowatch][6].

### What Routers Do

Why do we even need network routers? A router connects different networks. Without routing every network space is isolated, all sad and alone with no one to talk to but the same boring old nodes. Suppose you have a 192.168.1.0/24 and a 192.168.2.0/24 network. Your two networks cannot talk to each other without a router connecting them. These are Class C private networks with 254 usable addresses each. Use ipcalc to get nice visual information about them:

```
$ ipcalc 192.168.1.0/24
Address:   192.168.1.0          11000000.10101000.00000001\. 00000000
Netmask:   255.255.255.0 = 24   11111111.11111111.11111111\. 00000000
Wildcard:  0.0.0.255            00000000.00000000.00000000\. 11111111
=>
Network:   192.168.1.0/24       11000000.10101000.00000001\. 00000000
HostMin:   192.168.1.1          11000000.10101000.00000001\. 00000001
HostMax:   192.168.1.254        11000000.10101000.00000001\. 11111110
Broadcast: 192.168.1.255        11000000.10101000.00000001\. 11111111
Hosts/Net: 254                   Class C, Private Internet
```

I like that ipcalc's binary output makes a visual representation of how the netmask works. The first three octets are the network address, and the fourth octet is the host address, so when you are assigning host addresses you "mask" out the network portion and use the leftover. Your two networks have different network addresses, and that is why they cannot communicate without a router in between them.

Each octet is 256 bytes, but that does not give you 256 host addresses because the first and last values, 0 and 255, are reserved. 0 is the network identifier, and 255 is the broadcast address, so that leaves 254 host addresses. ipcalc helpfully spells all of this out.

This does not mean that you never have a host address that ends in 0 or 255\. Suppose you have a 16-bit prefix:

```
$ ipcalc 192.168.0.0/16
Address:   192.168.0.0          11000000.10101000\. 00000000.00000000
Netmask:   255.255.0.0 = 16     11111111.11111111\. 00000000.00000000
Wildcard:  0.0.255.255          00000000.00000000\. 11111111.11111111
=>
Network:   192.168.0.0/16       11000000.10101000\. 00000000.00000000
HostMin:   192.168.0.1          11000000.10101000\. 00000000.00000001
HostMax:   192.168.255.254      11000000.10101000\. 11111111.11111110
Broadcast: 192.168.255.255      11000000.10101000\. 11111111.11111111
Hosts/Net: 65534                 Class C, Private Internet
```

ipcalc lists your first and last host addresses, 192.168.0.1 and 192.168.255.254\. You may have host addresses that end in 0 and 255, for example 192.168.1.0 and 192.168.0.255, because those fall in between the HostMin and HostMax.

The same principles apply regardless of your address blocks, whether they are private or public, and don't be shy about using ipcalc to help you understand.

### CIDR

CIDR (Classless Inter-Domain Routing) was created to extend IPv4 by providing variable-length subnet masking. CIDR allows finer slicing-and-dicing of your network space. Let ipcalc demonstrate:

```
$ ipcalc 192.168.1.0/22
Address:   192.168.1.0          11000000.10101000.000000 01.00000000
Netmask:   255.255.252.0 = 22   11111111.11111111.111111 00.00000000
Wildcard:  0.0.3.255            00000000.00000000.000000 11.11111111
=>
Network:   192.168.0.0/22       11000000.10101000.000000 00.00000000
HostMin:   192.168.0.1          11000000.10101000.000000 00.00000001
HostMax:   192.168.3.254        11000000.10101000.000000 11.11111110
Broadcast: 192.168.3.255        11000000.10101000.000000 11.11111111
Hosts/Net: 1022                  Class C, Private Internet
```

The netmask is not limited to whole octets, but rather crosses the boundary between the third and fourth octets, and the subnet portion ranges from 0 to 3, and not from 0 to 255\. The number of available hosts is not a multiple of 8 as it is when the netmask is defined by whole octets.

Your homework is to review CIDR and how the IPv4 address space is allocated between public, private, and reserved blocks, as this is essential to understanding routing. Setting up routes is not complicated as long as you have a good knowledge of addressing.

Start with [Understanding IP Addressing and CIDR Charts][7], [IPv4 Private Address Space and Filtering][8], and [IANA IPv4 Address Space Registry][9]. Then come back next week to learn how to create and manage routes.

--------------------------------------------------------------------------------

via: https://www.linux.com/learn/intro-to-linux/2018/2/linux-lan-routing-beginners-part-1

作者：[CARLA SCHRODER ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linux.com/users/cschroder
[1]:https://www.linux.com/licenses/category/creative-commons-attribution
[2]:https://commons.wikimedia.org/wiki/File:Traffic_warder.jpeg
[3]:https://www.linux.com/files/images/trafficwarderjpeg
[4]:https://www.linux.com/learn/intro-to-linux/2017/7/practical-networking-linux-admins-ipv6-routing
[5]:http://linuxgizmos.com/catalog-of-98-open-spec-hacker-friendly-sbcs/#catalog
[6]:http://distrowatch.org/
[7]:https://www.ripe.net/about-us/press-centre/understanding-ip-addressing
[8]:https://www.arin.net/knowledge/address_filters.html
[9]:https://www.iana.org/assignments/ipv4-address-space/ipv4-address-space.xhtml

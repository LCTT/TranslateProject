Linux LAN Routing for Beginners: Part 2
======

![](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/dortmund-hbf-1259559_1920.jpg?itok=mdkNQRkS)

Last week [we reviewed IPv4 addressing][1] and using the network admin's indispensible ipcalc tool: Now we're going to make some nice LAN routers.

VirtualBox and KVM are wonderful for testing routing, and the examples in this article are all performed in KVM. If you prefer to use physical hardware, then you need three computers: one to act as the router, and the other two to represent two different networks. You also need two Ethernet switches and cabling.

The examples assume a wired Ethernet LAN, and we shall pretend there are some bridged wireless access points for a realistic scenario, although we're not going to do anything with them. (I have not yet tried all-WiFi routing and have had mixed success with connecting a mobile broadband device to an Ethernet LAN, so look for those in a future installment.)

### Network Segments

The simplest network segment is two computers in the same address space connected to the same switch. These two computers do not need a router to communicate with each other. A useful term is _broadcast domain_ , which describes a group of hosts that are all in the same network. They may be all connected to a single Ethernet switch, or multiple switches. A broadcast domain may include two different networks connected by an Ethernet bridge, which makes the two networks behave as a single network. Wireless access points are typically bridged to a wired Ethernetwork.

A broadcast domain can talk to a different broadcast domain only when they are connected by a network router.

### Simple Network

The following example commands are not persistent, and your changes will vanish with a restart.

A broadcast domain needs a router to talk to other broadcast domains. Let's illustrate this with two computers and the `ip` command. Our two computers are 192.168.110.125 and 192.168.110.126, and they are plugged into the same Ethernet switch. In VirtualBox or KVM, you automatically create a virtual switch when you configure a new network, so when you assign a network to a virtual machine it's like plugging it into a switch. Use `ip addr show` to see your addresses and network interface names. The two hosts can ping each other.

Now add an address in a different network to one of the hosts:
```
# ip addr add 192.168.120.125/24 dev ens3

```

You have to specify the network interface name, which in the example is ens3. It is not required to add the network prefix, in this case /24, but it never hurts to be explicit. Check your work with `ip`. The example output is trimmed for clarity:
```
$ ip addr show
ens3:
 inet 192.168.110.125/24 brd 192.168.110.255 scope global dynamic ens3
 valid_lft 875sec preferred_lft 875sec
 inet 192.168.120.125/24 scope global ens3
 valid_lft forever preferred_lft forever

```

The host at 192.168.120.125 can ping itself (`ping 192.168.120.125`), and that is a good basic test to verify that your configuration is working correctly, but the second computer can't ping that address.

Now we need to do bit of network juggling. Start by adding a third host to act as the router. This needs two virtual network interfaces and a second virtual network. In real life you want your router to have static IP addresses, but for now we'll let the KVM DHCP server do the work of assigning addresses, so you only need these two virtual networks:

  * First network: 192.168.110.0/24
  * Second network: 192.168.120.0/24



Then your router must be configured to forward packets. Packet forwarding should be disabled by default, which you can check with `sysctl`:
```
$ sysctl net.ipv4.ip_forward
net.ipv4.ip_forward = 0

```

The zero means it is disabled. Enable it with this command:
```
# echo 1 > /proc/sys/net/ipv4/ip_forward

```

Then configure one of your other hosts to play the part of the second network by assigning the 192.168.120.0/24 virtual network to it in place of the 192.168.110.0/24 network, and then reboot the two "network" hosts, but not the router. (Or restart networking; I'm old and lazy and don't care what weird commands are required to restart services when I can just reboot.) The addressing should look something like this:

  * Host 1: 192.168.110.125
  * Host 2: 192.168.120.135
  * Router: 192.168.110.126 and 192.168.120.136



Now go on a ping frenzy, and ping everyone from everyone. There are some quirks with virtual machines and the various Linux distributions that produce inconsistent results, so some pings will succeed and some will not. Not succeeding is good, because it means you get to practice creating a static route. First, view the existing routing tables. The first example is from Host 1, and the second is from the router:
```
$ ip route show
default via 192.168.110.1 dev ens3 proto static metric 100
192.168.110.0/24 dev ens3 proto kernel scope link src 192.168.110.164 metric 100

$ ip route show
default via 192.168.110.1 dev ens3 proto static metric 100
default via 192.168.120.1 dev ens3 proto static metric 101
169.254.0.0/16 dev ens3 scope link metric 1000
192.168.110.0/24 dev ens3 proto kernel scope link
 src 192.168.110.126 metric 100
192.168.120.0/24 dev ens9 proto kernel scope link
 src 192.168.120.136 metric 100

```

This shows us that the default routes are the ones assigned by KVM. The 169.* address is the automatic link local address, and we can ignore it. Then we see two more routes, the two that belong to our router. You can have multiple routes, and this example shows how to add a non-default route to Host 1:
```
# ip route add 192.168.120.0/24 via 192.168.110.126 dev ens3

```

This means Host 1 can access the 192.168.110.0/24 network via the router interface 192.168.110.126. See how it works? Host 1 and the router need to be in the same address space to connect, then the router forwards to the other network.

This command deletes a route:
```
# ip route del 192.168.120.0/24

```

In real life, you're not going to be setting up routes manually like this, but rather using a router daemon and advertising your router via DHCP but understanding the fundamentals is key. Come back next week to learn how to set up a nice easy router daemon that does the work for you.

Learn more about Linux through the free ["Introduction to Linux" ][2]course from The Linux Foundation and edX.

--------------------------------------------------------------------------------

via: https://www.linux.com/learn/intro-to-linux/2018/3/linux-lan-routing-beginners-part-2

作者：[CARLA SCHRODER][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linux.com/users/cschroder
[1]:https://www.linux.com/learn/intro-to-linux/2018/2/linux-lan-routing-beginners-part-1
[2]:https://training.linuxfoundation.org/linux-courses/system-administration-training/introduction-to-linux

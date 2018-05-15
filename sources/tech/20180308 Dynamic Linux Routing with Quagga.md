Translating by qhwdw
Dynamic Linux Routing with Quagga
============================================================


![network](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/network_visualization.png?itok=P3Ve7eO1 "network")
Learn how to use the Quagga suite of routing protocols to manage dynamic routing.[Creative Commons Attribution][1][Wikimedia Commons: Martin Grandjean][2]

So far in this series, we have learned the intricacies of IPv4 addressing in [Linux LAN Routing for Beginners: Part 1][4] and how to create static routes manually in [Linux LAN Routing for Beginners: Part 2][5].

Now we're going to use [Quagga][6] to manage dynamic routing for us, just set it and forget it. Quagga is a suite of routing protocols: OSPFv2, OSPFv3, RIP v1 and v2, RIPng, and BGP-4, which are all managed by the zebra daemon.

OSPF means Open Shortest Path First. OSPF is an interior gateway protocol (IGP); it is for LANs and LANs connected over the Internet. Every OSPF router in your network contains the topology for the whole network, and calculates the best paths through the network. OSPF automatically multicasts any network changes that it detects. You can divide up your network into areas to keep routing tables manageable; the routers in each area only need to know the next hop out of their areas rather than the entire routing table for your network.

RIP, Routing Information Protocol, is an older protocol. RIP routers periodically multicast their entire routing tables to the network, rather than just the changes as OSPF does. RIP measure routes by hops, and sees any destination over 15 hops as unreachable. RIP is simple to set up, but OSPF is a better choice for speed, efficiency, and scalability.

BGP-4 is the Border Gateway Protocol version 4\. This is an exterior gateway protocol (EGP) for routing Internet traffic. You won't use BGP unless you are an Internet service provider.

### Preparing for OSPF

In our little KVM test lab, there are two virtual machines representing two different networks, and one VM acting as the router. Create two networks: net1 is 192.168.110.0/24 and net2 is 192.168.120.0/24\. It's all right to enable DHCP because you are going to go into your three virtual machines and give each of them static addresses. Host 1 is on net1, Host 2 is on net2, and Router is on both networks. Give Host 1 a gateway of 192.168.110.126, and Host 2 gets 192.168.120.136.

*   Host 1: 192.168.110.125

*   Host 2: 192.168.120.135

*   Router: 192.168.110.126 and 192.168.120.136

Install Quagga on your router, which on most Linuxes is the quagga package. On Debian there is a separate documentation package, quagga-doc. Uncomment this line in `/etc/sysctl.conf` to enable packet forwarding:

```
net.ipv4.ip_forward=1
```

Then run the `sysctl -p` command to load the change.

### Configuring Quagga

Look in your Quagga package for example configuration files, such as `/usr/share/doc/quagga/examples/ospfd.conf.sample`. Configuration files should be in `/etc/quagga`, unless your particular Linux flavor does something creative with them. Most Linuxes ship with just two files in this directory, `vtysh.conf` and `zebra.conf`. These provide minimal defaults to enable the daemons to run. zebra always has to run first, and again, unless your distro has done something strange, it should start automatically when you start ospfd. Debian/Ubuntu is a special case, which we will get to in a moment.

Each router daemon gets its own configuration file, so we must create `/etc/quagga/ospfd.conf`, and populate it with these lines:

```
!/etc/quagga/ospfd.conf
hostname router1
log file /var/log/quagga/ospfd.log
router ospf
 ospf router-id 192.168.110.15
 network 192.168.110.0/0 area 0.0.0.0
 network 192.168.120.0/0 area 0.0.0.0
access-list localhost permit 127.0.0.1/32
access-list localhost deny any
line vty
  access-class localhost
```

You may use either the exclamation point or hash marks to comment out lines. Let's take a quick walk through these options.

*   **hostname** is whatever you want. This isn't a normal Linux hostname, but the name you see when you log in with `vtysh` or `telnet`.

*   **log file** is whatever file you want to use for the logs.

*   **router** specifies the routing protocol.

*   **ospf router-id** is any 32-bit number. An IP address of the router is good enough.

*   **network** defines the networks your router advertises.

*   The **access-list** entries restrict `vtysh`, the Quagga command shell, to the local machine, and deny remote administration.

### Debian/Ubuntu

Debian, Ubuntu, and possibly other Debian derivatives require one more step before you can launch the daemon. Edit `/etc/quagga/daemons` so that all lines say `no` except `zebra`=yes and `ospfd=yes`.

Then, to launch `ospfd` on Debian launch Quagga:

```
# systemctl start quagga
```

On most other Linuxes, including Fedora and openSUSE, start `ospfd`:

```
# systemctl start ospfd
```

Now Host 1 and Host 2 should ping each other, and the router.

That was a lot of words to describe a fairly simple setup. In real life the router will connect to two switches and provide a gateway for all the computers attached to those switches. You could add more network interfaces to your router to provide routing for more networks, or connect directly to another router, or to a LAN backbone that connects to other routers.

You probably don't want to hassle with configuring network interfaces manually. The easy way is to advertise your router with your DHCP server. If you use Dnsmasq then you get DHCP and DNS all in one.

There are many more configuration options, such as encrypted password protection. See the official documentation at [Quagga Routing Suite][7].

--------------------------------------------------------------------------------

via: https://www.linux.com/learn/intro-to-linux/2018/3/dynamic-linux-routing-quagga

作者：[CARLA SCHRODER ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linux.com/users/cschroder
[1]:https://www.linux.com/licenses/category/creative-commons-attribution
[2]:https://commons.wikimedia.org/wiki/File:Network_Visualization.png
[3]:https://www.linux.com/files/images/networkvisualizationpng
[4]:https://www.linux.com/learn/intro-to-linux/2018/2/linux-lan-routing-beginners-part-1
[5]:https://www.linux.com/learn/intro-to-linux/2018/3/linux-lan-routing-beginners-part-2
[6]:https://www.quagga.net/
[7]:https://www.quagga.net/

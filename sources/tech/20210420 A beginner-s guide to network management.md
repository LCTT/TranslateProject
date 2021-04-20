[#]: subject: (A beginner's guide to network management)
[#]: via: (https://opensource.com/article/21/4/network-management)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

A beginner's guide to network management
======
Learn how networks work and some tricks to optimize network performance
with open source.
![Tips and gears turning][1]

Most people connect to at least two networks every day. After you turn on a computer or mobile device, it connects to a local WiFi network, which in turn provides access to the interconnected network of networks that is "the internet" (a combination of the words _inter_connected _net_works).

But how do networks actually work? How does your device know how to find the internet, a shared printer, or a file share? How do these things know how to respond to your device? What tricks do system administrators use to optimize the performance of a network?

Open source is firmly embedded into networking technology, so resources on networking are freely available to anyone who wants to learn more. This article covers the basics of network management using open source.

### What is a network?

A network of computers is a collection of two or more computers that can communicate with one another. For networking to work, one machine on a network must be able to find another, and communication must be able to get from one machine to another. To resolve this requirement, two different systems were developed and defined: TCP and IP.

#### TCP for transport

For computers to communicate, there must be a means of transport for messages between them. When humans talk, the sounds of our voices are made possible by sound waves moving through air. Computers communicate with digital signals carried over Ethernet cables, radio waves, or microwaves. The specifications for this are formally defined as the [TCP protocol][2].

#### IP for addressing

For computers to address one another, they must have some means for identification. When humans address one another, we use names and pronouns. When computers address each other, they use IP addresses, such as `192.168.0.1`, which can be mapped to names, such as Laptop and Desktop or Tux or Penguin. The specifications for this are formally defined as the [IP protocol][3].

### Set up a minimal configuration

The simplest network is a two-computer network using a specially wired Ethernet cable called a **crossover cable**. A crossover cable connects and transmits signals coming from one computer to the appropriate receptors on another computer. There are also crossover adapters that convert a standard Ethernet into a crossover cable.

![Crossover cable][4]

(Seth Kenlon, [CC BY-SA 4.0][5])

With no router between the computers, all network management must be done manually on each machine, making this a good introductory exercise for networking basics.

With a crossover cable, you can connect two computers together. Because the two computers are connected directly with no network controller to offer guidance, neither computer does anything to create or join a network. Normally, this task would be prompted by a switch and a DHCP server or a router, but in this simple network setup, you are the ultimate authority.

To create a network, you first must assign an IP address to each computer. The block reserved for self-assigned IP addresses starts with `169.254`, and it's a useful convention for reminding yourself that this is a closed-loop system.

#### Find a network interface

First, you must know what network interfaces you're working with. The Ethernet port is usually designated with the term `eth` plus a number starting with `0`, but some devices are reported with different terms. You can discover the interfaces on a computer with the `ip` command:


```
$ ip address show
1: lo: &lt;LOOPBACK,UP,LOWER_UP&gt; mtu 65536 ...
    link/loopback 00:00:00:00:00:00 brd ...
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
    inet6 ::1/128 scope host
       valid_lft forever preferred_lft forever
2: eth0: &lt;BROADCAST,MULTICAST,UP,LOWER_UP&gt; ...
    link/ether dc:a6:32:be:a3:e1 brd ...
3: wlan0: &lt;BROADCAST,MULTICAST&gt; ...
    link/ether dc:a6:32:be:a3:e2 brd ...
```

In this case, `eth0` turns out to be the correct interface name. However, in some cases, you'll see `en0` or `enp0s1` or something similar, so it's important to always verify a device name before using it.

#### Assign an IP address

Normally, an IP address is obtained from a router, which broadcasts offers for addresses over the network. When a computer gets connected to a network, it requests an address. The router registers which device on the network, identified by its Media Access Control (MAC) address (this has nothing to do with Apple Mac computers) has been assigned which address. That's how computers know how to find one another across a network.

In this simple network, however, there is no router handing out IP addresses or registering devices, so you must create an IP address. To assign an IP address to a computer, use the `ip` command:


```
`$ sudo ip address add 169.254.0.1 dev eth0`
```

And again on the other computer, this time incrementing the IP address by 1:


```
`$ sudo ip address add 169.254.0.2 dev eth0`
```

Now each computer has a means of transport (the crossover cable) and a way to be found on the network (a unique IP address). But this network still lacks one important element: The computers still don't know they're a member of a network.

#### Set up a route

Another task that's usually managed by a router is setting up the paths network traffic must take to get from one place to another. This is called a _routing table_, and you can think of it as a very basic city map for your network.

Currently, no routing table exists on your network. You can view your non-existent routing table with the `route` command:


```
$ route
Kernel IP routing table
Destination | Gateway | Genmask | Flags|Metric|Ref | Use | Iface
$
```

Alternatively, you can view it with the `ip` command:


```
$ ip route
$
```

You can add a route with the `ip` command:


```
$ sudo ip route \
add 169.254.0.0/24 \
dev eth0 \
proto static
```

This command adds a route to the address range (starting from `169.254.0.0` and ending at `169.254.0.255`) to the `eth0` interface. It sets the routing protocol to `static` to indicate that you, the administrator, created the route as an intentional override for any dynamic routing.

Verify your routing table with the `route` command:


```
$ route
Kernel IP routing table
Destination | Gateway | Genmask       | ... | Iface
link-local  | 0.0.0.0 | 255.255.255.0 | ... | eth0
```

Or use the `ip` command for a different view:


```
$ ip route
169.254.0.0/24 dev eth0 proto static scope link
```

#### Ping your neighbor

Now that your network has established a method of transport, a means of addressing, and a network route, you can reach hosts outside your computer. The simplest message to send another computer is a `ping`, which is conveniently also the name of the command that generates the message:


```
$ ping -c1 169.254.0.2
64 bytes from 169.254.0.2: icmp_seq=1 ttl=64 time=0.233 ms

\--- 169.254.0.2 ping statistics ---
1 packets transmitted, 1 received, 0% packet loss, time 0ms
rtt min/avg/max/mdev = 0.244/0.244/0.244/0.000 ms
```

You can also view the neighbors you've interacted with:


```
$ ip neighbour
169.254.0.2 dev eth0 lladdr e8:6a:64:ac:ef:7c STALE
```

### Grow your network with a switch

There aren't many needs for two-node networks. Special hardware, called a network **switch**, was developed to solve this problem. A network switch allows you to attach several Ethernet cables to it, and it distributes messages indiscriminately from the computer sending it to all computers listening on the switch. All computers ignore the message except for the one with an IP address that matches the intended recipient. This makes for a relatively noisy network, but it's an easy way to physically connect a group of computers.

A physical switch for physical cables isn't practical or desired on most modern home networks, so a WiFi access point is used instead. A WiFi access point serves the same function as a switch: it allows many computers to connect to it and pass messages between them.

Access to the Internet is not just an expectation; it's usually the reason home networks exist at all. A switch or WiFi access point without access to the Internet isn't very useful, but to connect your network to another network, you need a router.

### Add a router

In practice, local networks connect many devices, and the number is growing as more devices become network-aware. Connect a network to the Internet (a network itself), and that number goes up by orders of magnitude.

It's impractical to manually configure a network, so common tasks are assigned to specific nodes on the network, and each computer runs a **daemon** (a job that runs silently in the background) to populate network settings received from authoritative servers on the network. On a home network, these jobs are often consolidated into one small embedded device, often provided by your Internet service provider (ISP), called a **router** (people sometimes incorrectly call it a modem). In a large network, each task is usually assigned to a separate dedicated server to ensure focus and resiliency. These include:

  * DHCP server to assign and track IP addresses to devices joining the network
  * [DNS server][6] to convert registered domain names like [redhat.com][7] to IP addresses like `209.132.183.105`)
  * [Firewall][8] to protect your network from unwanted incoming traffic or forbidden outgoing traffic
  * Router to efficiently direct traffic on the network, serve as a gateway to other networks (such as the Internet), and perform network address translation (NAT)



You probably have a router on your network now, and it probably manages all these tasks and possibly more. You can run[ your own open source router][9], thanks to projects like VyOS. For such a project, you should use a dedicated computer with at least two network interface controllers (NICs): one to connect to your ISP and another to connect to a switch or, more likely, a WiFi access point.

### Scale your knowledge

Regardless of how many devices are on your network or how many other networks your network connects to, the principles remain the same as with your two-node network. You need a mode of transport, a scheme for addressing, and knowledge of how to reach the network.

### Networking cheat sheet

Understanding how a network operates is vital for managing a network. You can't troubleshoot issues unless you understand the results of your tests, and you can't run tests unless you know what commands interact with your network infrastructure. For an overview of important networking commands and what kind of information you can extract with them, [download our updated networking cheat sheet][10].

Learn more about software defined networking, network functions virtualization, OpenDaylight,...

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/4/network-management

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/gears_devops_learn_troubleshooting_lightbulb_tips_520.png?itok=HcN38NOk (Tips and gears turning)
[2]: https://tools.ietf.org/html/rfc793
[3]: https://tools.ietf.org/html/rfc791
[4]: https://opensource.com/sites/default/files/uploads/crossover.jpg (Crossover cable)
[5]: https://creativecommons.org/licenses/by-sa/4.0/
[6]: https://opensource.com/article/17/4/build-your-own-name-server
[7]: http://redhat.com
[8]: https://www.redhat.com/sysadmin/secure-linux-network-firewall-cmd
[9]: https://opensource.com/article/20/1/open-source-networking
[10]: https://opensource.com/downloads/cheat-sheet-networking

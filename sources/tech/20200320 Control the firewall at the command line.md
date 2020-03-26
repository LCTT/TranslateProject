[#]: collector: (lujun9972)
[#]: translator: (tinyeyeser )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Control the firewall at the command line)
[#]: via: (https://fedoramagazine.org/control-the-firewall-at-the-command-line/)
[#]: author: (Paul W. Frields https://fedoramagazine.org/author/pfrields/)

Control the firewall at the command line
======

![][1]

A network _firewall_ is more or less what it sounds like: a protective barrier that prevents unwanted network transmissions. They are most frequently used to prevent outsiders from contacting or using network services on a system. For instance, if you’re running a laptop at school or in a coffee shop, you probably don’t want strangers poking around on it.

Every Fedora system has a firewall built in. It’s part of the network functions in the Linux kernel inside. This article shows you how to change its settings using _firewall-cmd_.

### Network basics

This article can’t teach you [everything][2] about computer networks. But a few basics suffice to get you started.

Any computer on a network has an _IP address_. Think of this just like a mailing address that allows correct routing of data. Each computer also has a set of _ports_, numbered 0-65535. These are not physical ports; instead, you can think of them as a set of connection points at the address.

In many cases, the port is a [standard number][3] or range depending on the application expected to answer. For instance, a web server typically reserves port 80 for non-secure HTTP communications, and/or 443 for secure HTTPS. The port numbers under 1024 are reserved for system and well-known purposes, ports 1024-49151 are registered, and ports 49152 and above are usually ephemeral (used only for a short time).

Each of the two most common protocols for Internet data transfer, [TCP][4] and [UDP][5], have this set of ports. TCP is used when it’s important that all data be received and, if it arrives out of order, reassembled in the right order. UDP is used for more time-sensitive services that can withstand losing some data.

An application running on the system, such as a web server, reserves one or more ports (as seen above, 80 and 443 for example). Then during network communication, a host establishes a connection between a source address and port, and the destination address and port.

A network firewall can block or permit transmissions of network data based on rules like address, port, or other criteria. The _firewall-cmd_ utility lets you interact with the rule set to view or change how the firewall works.

### Firewall zones

To verify the firewall is running, use this command with [sudo][6]. (In fairness, you can run _firewall-cmd_ without the _sudo_ command in environments where [PolicyKit][7] is running.)

```
$ sudo firewall-cmd --state
running
```

The firewalld service supports any number of _zones_. Each zone can have its own settings and rules for protection. In addition, each network interface can be placed in any zone individually The default zone for an external facing interface (like the wifi or wired network card) on a Fedora Workstation is the _FedoraWorkstation_ zone.

To see what zones are active, use the _–get-active-zones_ flag. On this system, there are two network interfaces, a wired Ethernet card _wlp2s0_ and a virtualization (libvirt) bridge interface _virbr0_:

```
$ sudo firewall-cmd --get-active-zones
FedoraWorkstation
  interfaces: wlp2s0
libvirt
  interfaces: virbr0
```

To see the default zone, or all the defined zones:

```
$ sudo firewall-cmd --get-default-zone
FedoraWorkstation
$ sudo firewall-cmd --get-zones
FedoraServer FedoraWorkstation block dmz drop external home internal libvirt public trusted work
```

To see the services the firewall is allowing other systems to access in the default zone, use the _–list-services_ flag. Here is an example from a customized system; you may see something different.

```
$ sudo firewall-cmd --list-services
dhcpv6-client mdns samba-client ssh
```

This system has four services exposed. Each of these has a well-known port number. The firewall recognizes them by name. For instance, the _ssh_ service is associated with port 22.

To see other port settings for the firewall in the current zone, use the _–list-ports_ flag. By the way, you can always declare the zone you want to check:

```
$ sudo firewall-cmd --list-ports --zone=FedoraWorkstation
1025-65535/udp 1025-65535/tcp
```

This shows that ports 1025 and above (both UDP and TCP) are open by default.

### Changing zones, ports, and services

The above setting is a design decision.* It ensures novice users can use network facing applications they install. If you know what you’re doing and want a more protective default, you can move the interface to the _FedoraServer_ zone, which prohibits any ports not explicitly allowed. _(**Warning:** if you’re using the host via the network, you may break your connection — meaning you’ll have to go to that box physically to make further changes!)_

```
$ sudo firewall-cmd --change-interface=<ifname> --zone=FedoraServer
success
```

* _This article is not the place to discuss that decision, which went through many rounds of review and debate in the Fedora community. You are welcome to change settings as needed._

If you want to open a well-known port that belongs to a service, you can add that service to the default zone (or use _–zone_ to adjust a different zone). You can add more than one at once. This example opens up the well-known ports for your web server for both HTTP and HTTPS traffic, on ports 80 and 443:

```
$ sudo firewall-cmd --add-service=http --add-service=https
success
```

Not all services are defined, but many are. To see the whole list, use the _–get-services_ flag.

If you want to add specific ports, you can do that by number and protocol as well. (You can also combine _–add-service_ and _–add-port_ flags, as many as necessary.) This example opens up the UDP service for a network boot service:

```
$ sudo firewall-cmd --add-port=67/udp
success
```

**Important:** If you want your changes to be effective after you reboot your system or restart the firewalld service, you **must** add the _–permanent_ flag to your commands. The examples here only change the firewall until one of those events next happens.

These are just some of the many functions of the _firewall-cmd_ utility and the firewalld service. There is much more information on firewalld at the project’s [home page][8] that’s worth reading and trying out.

* * *

_Photo by [Jakob Braun][9] on [Unsplash][10]._

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/control-the-firewall-at-the-command-line/

作者：[Paul W. Frields][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/pfrields/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2020/03/firewall-cmd-816x345.jpg
[2]: https://en.wikipedia.org/wiki/Portal:Internet
[3]: https://en.wikipedia.org/wiki/List_of_TCP_and_UDP_port_numbers
[4]: https://en.wikipedia.org/wiki/Transmission_Control_Protocol
[5]: https://en.wikipedia.org/wiki/User_Datagram_Protocol
[6]: https://fedoramagazine.org/howto-use-sudo/
[7]: https://en.wikipedia.org/wiki/Polkit
[8]: https://firewalld.org/
[9]: https://unsplash.com/@jakobustrop?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[10]: https://unsplash.com/s/photos/brick-wall?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText

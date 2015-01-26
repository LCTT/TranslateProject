iptraf: A TCP/UDP Network Monitoring Utility
================================================================================
[iptraf][1] is an ncurses-based IP LAN monitor that generates various network statistics including TCP info, UDP counts, ICMP and OSPF information, Ethernet load info, node stats, IP checksum errors, and others.

Its ncurses-based user interface also saves users from remembering command line switches.

### Features ###

- An IP traffic monitor that shows information on the IP traffic passing over your network. Includes TCP flag information, packet and byte counts, ICMP details, OSPF packet types.
- General and detailed interface statistics showing IP, TCP, UDP, ICMP, non-IP and other IP packet counts, IP checksum errors, interface activity, packet size counts.
- A TCP and UDP service monitor showing counts of incoming and outgoing packets for common TCP and UDP application ports
- A LAN statistics module that discovers active hosts and shows statistics showing the data activity on them
- TCP, UDP, and other protocol display filters, allowing you to view only traffic you’re interested in.
- Logging
- Supports Ethernet, FDDI, ISDN, SLIP, PPP, and loopback interface types.
- Utilizes the built-in raw socket interface of the Linux kernel, allowing it to be used over a wide range of supported network cards.
- Full-screen, menu-driven operation.

To install

### Ubuntu and it’s derivatives ###

    sudo apt-get install iptraf

### Arch Linux and Its derivatives ###

    sudo pacman -S iptra

### Fedora and its derivatives ###

    sudo yum install iptraf

### Usage ###

If the **iptraf** command is issued without any command-line options, the program comes up in interactive mode, with the various facilities accessed through the main menu.

![](http://180016988.r.cdn77.net/wp-content/uploads/2015/01/iptraf_1.png)

Menu for easy navigation.

![](http://180016988.r.cdn77.net/wp-content/uploads/2015/01/iptraf_2.png)

Selecting interfaces to monitor.

![](http://180016988.r.cdn77.net/wp-content/uploads/2015/01/iptraf_3.png)

Traffic from interface **ppp0**

![](http://180016988.r.cdn77.net/wp-content/uploads/2015/01/iptraf_4.png)

Enjoy!

--------------------------------------------------------------------------------

via: http://www.unixmen.com/iptraf-tcpudp-network-monitoring-utility/

作者：[Enock Seth Nyamador][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.unixmen.com/author/seth/
[1]:http://iptraf.seul.org/about.html
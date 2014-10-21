Linux TCP/IP networking: net-tools vs. iproute2
================================================================================
Many sysadmins still manage and troubleshoot various network configurations by using a combination of ifconfig, route, arp and netstat command-line tools, collectively known as net-tools. Originally rooted in the BSD TCP/IP toolkit, the net-tools was developed to configure network functionality of older Linux kernels. Its development in the Linux community so far has ceased since 2001. Some Linux distros such as Arch Linux and CentOS/RHEL 7 have already deprecated net-tools in favor of iproute2.

iproute2, which is another family of network configuration tools, emerged to replace the functionality of net-tools. While net-tools accesses and changes kernel network configurations via procfs (/proc) and ioctl system call, iproute2 communicates with the kernel via netlink socket interface. The /proc interface is known to be more heavyweight than netlink interface. Putting performance aside, the user interface of iproute2 is more intuitive than that of net-tools. For example, network resources (e.g., link, IP address, route, tunnel, etc.) are aptly defined with "object" abstraction, and you can manage different objects using consistant syntax. Most importantly, iproute2 has been under [active development][1] so far.

If you are still using net-tools, it is time to switch to iproute2, especially if you want to catch up with the latest and greatest networking features of the latest Linux kernel. Chances are that there are many things you can do with iproute2, but cannot with net-tools.

For those who want to make the switch, here is a round-up of net-tools vs. iproute2 comparison.

### Show All Connected Network Interfaces ###

The following commands show a list of all available network interfaces (whether or not they are active).

With **net-tools**:

    $ ifconfig -a 

With **iproute2**:

    $ ip link show 

![](https://farm4.staticflickr.com/3852/15134851045_53a5135283_z.jpg)

### Activate or Deactivate a Network Interface ###

To activate/deactivate a particular network interface, use these commands.

With **net-tools**:

    $ sudo ifconfig eth1 up
    $ sudo ifconfig eth1 down 

With **iproute2**:

    $ sudo ip link set down eth1
    $ sudo ip link set up eth1 

### Assign IPv4 address(es) to a Network Interface ###

Use these commands to configure IPv4 addresses of a network interface.

With **net-tools**:

    $ sudo ifconfig eth1 10.0.0.1/24 

With **iproute2**:

    $ sudo ip addr add 10.0.0.1/24 dev eth1 

Note that with iproute2, you can assign multiple IP addresses to an interface, which you cannot do with ifconfig. A workaround for this with ifconfig is to use [IP aliases][2].

    $ sudo ip addr add 10.0.0.1/24 broadcast 10.0.0.255 dev eth1
    $ sudo ip addr add 10.0.0.2/24 broadcast 10.0.0.255 dev eth1
    $ sudo ip addr add 10.0.0.3/24 broadcast 10.0.0.255 dev eth1

### Remove an IPv4 address from a Network Interface ###

As far as IP address removal is concerned, there is no proper way to remove an IPv4 address from a network interface with net-tools, other than assigning 0 to the interface. iproute2 can properly handle this.

With **net-tools**:

    $ sudo ifconfig eth1 0 

With **iproute2**:

    $ sudo ip addr del 10.0.0.1/24 dev eth1 

### Show IPv4 Address(es) of a Network Interface ###

Checking IPv4 addresses of a particular network interface can be done as follows.

With **net-tools**:

    $ ifconfig eth1 

With **iproute2**:

    $ ip addr show dev eth1 

Again, if there are multiple IP addresses assigned to an interface, iproute2 shows all of them, while net-tools shows only one IP address.

![](https://farm6.staticflickr.com/5552/15134470952_f478190693_z.jpg)

### Assign an IPv6 address to a Network Interface ###

Use these commands to add IPv6 address(es) to a network interface. Both net-tools and iproute2 allow you to add multiple IPv6 addresses to an interface.

With **net-tools**:

    $ sudo ifconfig eth1 inet6 add 2002:0db5:0:f102::1/64
    $ sudo ifconfig eth1 inet6 add 2003:0db5:0:f102::1/64

With **iproute2**:

    $ sudo ip -6 addr add 2002:0db5:0:f102::1/64 dev eth1
    $ sudo ip -6 addr add 2003:0db5:0:f102::1/64 dev eth1

### Show IPv6 address(es) of a Network Interface ###

Displaying IPv6 addresses of a particular network interface can be done as follows. Both net-tools and iproute2 can show all assigned IPv6 addresses.

With **net-tools**:

    $ ifconfig eth1 

With **iproute2**:

    $ ip -6 addr show dev eth1 

![](https://farm4.staticflickr.com/3906/15111848536_f6cb7ddb4f_z.jpg)

### Remove an IPv6 address from a Network Interface ###

Use these commands to remove any unnecessary IPv6 address from an interface.

With **net-tools**:

    $ sudo ifconfig eth1 inet6 del 2002:0db5:0:f102::1/64

With **iproute2**:

    $ sudo ip -6 addr del 2002:0db5:0:f102::1/64 dev eth1

### Change the MAC Address of a Network Interface ###

To [spoof the MAC address][3] of a network interface, use the commands below. Note that before changing the MAC address, you need to deactivate the interface first.

With **net-tools**:

    $ sudo ifconfig eth1 hw ether 08:00:27:75:2a:66 

With **iproute2**:

    $ sudo ip link set dev eth1 address 08:00:27:75:2a:67

### View the IP Routing Table ###

net-tools has two options for showing the kernel's IP routing table: route or netstat. With iproute2, use ip route command.

With **net-tools**:

    $ route -n

----------

    $ netstat -rn 

With **iproute2**:

    $ ip route show 

![](https://farm6.staticflickr.com/5585/14948293867_c018df8efd_z.jpg)

### Add or Modify a Default Route ###

Here are the commands to add or modify a default route in the kernel's IP routing table. Note that with net-tools, modifying a default route can be achieved by adding a new default route, and then removing an old default route. With iproute2, use ip route replace command.

With **net-tools**:

    $ sudo route add default gw 192.168.1.2 eth0
    $ sudo route del default gw 192.168.1.1 eth0 

With **iproute2**:

    $ sudo ip route add default via 192.168.1.2 dev eth0
    $ sudo ip route replace default via 192.168.1.2 dev eth0

### Add or Remove a Static Route ###

A static routing can be added or removed with the following commands.

With **net-tools**:

    $ sudo route add -net 172.16.32.0/24 gw 192.168.1.1 dev eth0
    $ sudo route del -net 172.16.32.0/24 

With **iproute2**:

    $ sudo ip route add 172.16.32.0/24 via 192.168.1.1 dev eth0
    $ sudo ip route del 172.16.32.0/24 

### View Socket Statistics ###

Here are the commands to check socket statistics (e.g., active/listening TCP/UDP sockets).

With **net-tools**:

    $ netstat
    $ netstat -l 

With **iproute2**:

    $ ss
    $ ss -l 

![](https://farm4.staticflickr.com/3843/14948157419_564982b0e6_z.jpg)

### View the ARP Table ###

You can display the kernel's ARP table with these commands.

With **net-tools**:

    $ arp -an 

With **iproute2**:

    $ ip neigh 

![](https://farm4.staticflickr.com/3908/14948193370_1c5256e8e1_z.jpg)

### Add or Remove a Static ARP Entry ###

Adding or removing a [static ARP entry][4] in the local ARP table is done as follows.

With **net-tools**:

    $ sudo arp -s 192.168.1.100 00:0c:29:c0:5a:ef
    $ sudo arp -d 192.168.1.100 

With **iproute2**:

    $ sudo ip neigh add 192.168.1.100 lladdr 00:0c:29:c0:5a:ef dev eth0
    $ sudo ip neigh del 192.168.1.100 dev eth0 

### Add, Remove or View Multicast Addresses ###

To configure or view multicast addresses on a network interface, use the commands below.

With **net-tools**:

    $ sudo ipmaddr add 33:44:00:00:00:01 dev eth0
    $ sudo ipmaddr del 33:44:00:00:00:01 dev eth0
    $ ipmaddr show dev eth0
    $ netstat -g 

With **iproute2**:

    $ sudo ip maddr add 33:44:00:00:00:01 dev eth0
    $ sudo ip maddr del 33:44:00:00:00:01 dev eth0
    $ ip maddr list dev eth0 

--------------------------------------------------------------------------------

via: http://xmodulo.com/2014/09/linux-tcpip-networking-net-tools-iproute2.html

作者：[Dan Nanni][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://xmodulo.com/author/nanni
[1]:https://www.kernel.org/pub/linux/utils/net/iproute2/
[2]:http://xmodulo.com/2013/02/how-to-assign-multiple-ip-addresses-to-one-network-interface-on-centos.html
[3]:http://xmodulo.com/2014/02/spoof-mac-address-network-interface-linux.html
[4]:http://xmodulo.com/2013/02/how-to-add-or-remove-static-arp-entry-on-linux.html

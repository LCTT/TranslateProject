[KayGuoWhu Translating ]
Start Practising Linux ip command and Avoid the Habit of Using ifconfig
================================================================================
The linux **ip** command is similar to **ifconfig**, but more powerful and is intended to be a replacement for it. With ip you have the advantage of performing several network administration tasks with only one command. ifconfig is one of the deprecated command within net-tools that has not been maintained for many years. The functionalities of many commands is retained with more features under iproute2 suite.

![Net tools vs Iproute2](http://linoxide.com/wp-content/uploads/2014/05/Linux-Nettools-vs-Iproute2.png)

To install ip download the **iproute2 suite utility** [here][1], however most Linux distributions will come with the iproute2 tools pre-installed.

You can also use use git to download the source code:

    $ git clone https://kernel.googlesource.com/pub/scm/linux/kernel/git/shemminger/iproute2.git

![iproute2 git clone](http://linoxide.com/wp-content/uploads/2014/04/iproute2-git-clone.png)

### Setting and Deleting an Ip Address ###

To set an IP address for your computer, the command ip can be used as follows:

    $ sudo ip addr add 192.168.0.193/24 dev wlan0

Note that the IP address has a prefix, for example /24. This is used in classless inter-domain routing (CIDR) to show the subnet mask used. In this case the subnet mask is 255.255.255.0.

After you have set the IP address confirm with show, whether the the changes have taken effect.

    $ ip addr show wlan0

![set ip address](http://linoxide.com/wp-content/uploads/2014/04/set-ip-address.png)

You can also use the same procedure to delete an IP address by just replacing add with del.

    $ sudo ip addr del 192.168.0.193/24 dev wlan0

![delete ip address](http://linoxide.com/wp-content/uploads/2014/04/delete-ip-address.png)

### Show Routing Table Entry ###

The route object of ip command also helps you to see the route packets will take in your network as set in your routing table. The first entry is the default route which you can change as you prefer.

In this example there are several routes. These are a result of having a several devices connected through different network interface. These include WIFI, Ethernet and a point to point link.

    $ ip route show

![ip route show](http://linoxide.com/wp-content/uploads/2014/04/ip-route-show.png)

Suppose now that you have an IP address which you need to know the route packets will take. You can use route option as follows:

    $ ip route get 10.42.0.47

![ip route get](http://linoxide.com/wp-content/uploads/2014/04/ip-route-get.png)

### Changing The Default Route ###

To change the default route, the ip command can be used as follows:

    $ sudo ip route add default via 192.168.0.196

![default route](http://linoxide.com/wp-content/uploads/2014/04/default-route.png)

### Show Network Statistics ###

The ip command can also be used to show the statistics of the various network interfaces. To do this you can use the ip command with the option -s and then specify the network device.

    $ ip -s link

![ip statistics all interfaces](http://linoxide.com/wp-content/uploads/2014/04/ip-statistics-all-interfaces.png)

When you need to get information about a particular network interface, add the option **ls** followed by the name of the network interface. The option **-s** when used more than once gives you more information about that particular interface. This can be very useful especially when trouble shooting errors in network connectivity.

    $ ip -s -s link ls p2p1

![ip link statistics](http://linoxide.com/wp-content/uploads/2014/04/ip-link-statistics-.png)

### ARP Entries ###

Address Resolution Protocol (ARP) is used to translate an IP address to its corresponding physical address, commonly known as MAC address. With ip command you can view the MAC address of the devices connected in your LAN by using the option neigh or neighbour.

    $ ip neighbour

![ip neighbour](http://linoxide.com/wp-content/uploads/2014/04/ip-neighbour.png)

### Monitor Netlink Messages ###

It is also possible to view netlink messages with ip command. The monitor option allows you to see the state of your network devices. For instance a computer on your LAN could be categorized as REACHABLE or STALE depending on its status. The command can be used as follows:

    $ ip monitor all

![ip monitor all](http://linoxide.com/wp-content/uploads/2014/04/ip-monitor-all.png)

### Activate and Deactivate Network Interface ###

To activate an particular interface you can use the ip command with options up and down, almost similar to how ifconfig is used.

In this example you can see the routing table entry when the ppp0 interface is activated and after it is deactivated and activated once again. The interface can be wlan0 or eth0. Change ppp0 to whatever interface is available in your case.

    $ sudo ip link set ppp0 down

    $ sudo ip link set ppp0 up

![ip link set up and down](http://linoxide.com/wp-content/uploads/2014/04/ip-link-set-up-and-down.png)

### Getting Help ###

In case you get stuck and do not know how a particular option works you can use the help option. The man page does not give a lot of information on how to use the ip options and this is where help comes to the rescue.

For example, to know more about the route option:

    $ ip route help

![ip route help](http://linoxide.com/wp-content/uploads/2014/04/ip-route-help.png)

### Conclusion ###

The command ip is a must have tool for network administrators and all Linux users alike. It is time to move from ifconfig, especially when you are writing scripts.

--------------------------------------------------------------------------------

via: http://linoxide.com/linux-command/use-ip-command-linux/

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://www.linuxgrill.com/anonymous/iproute2/NEW-OSDL/
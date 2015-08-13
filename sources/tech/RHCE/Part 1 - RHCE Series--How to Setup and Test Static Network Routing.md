Translating by ictlyh
Part 1 - RHCE Series: How to Setup and Test Static Network Routing 
================================================================================
RHCE (Red Hat Certified Engineer) is a certification from Red Hat company, which gives an open source operating system and software to the enterprise community, It also gives training, support and consulting services for the companies.

![RHCE Exam Preparation Guide](http://www.tecmint.com/wp-content/uploads/2015/07/RHCE-Exam-Series-by-TecMint.jpg)

RHCE Exam Preparation Guide

This RHCE (Red Hat Certified Engineer) is a performance-based exam (codename EX300), who possesses the additional skills, knowledge, and abilities required of a senior system administrator responsible for Red Hat Enterprise Linux (RHEL) systems.

**Important**: [Red Hat Certified System Administrator][1] (RHCSA) certification is required to earn RHCE certification.

Following are the exam objectives based on the Red Hat Enterprise Linux 7 version of the exam, which will going to cover in this RHCE series:

- Part 1: How to Setup and Test Static Routing in RHEL 7
- Part 2: How to Perform Packet Filtering, Network Address Translation and Set Kernel Runtime Parameters
- Part 3: How to Produce and Deliver System Activity Reports Using Linux Toolsets
- Part 4: Automate System Maintenance Tasks Using Shell Scripts
- Part 5: How to Configure Local and Remote System Logging
- Part 6: How to Configure a Samba Server and a NFS Server
- Part 7: Setting Up Complete SMTP Server for Mailing
- Part 8: Setting Up HTTPS and TLS on RHEL 7
- Part 9: Setting Up Network Time Protocol
- Part 10: How to Configure a Cache-Only DNS Server

To view fees and register for an exam in your country, check the [RHCE Certification][2] page.

In this Part 1 of the RHCE series and the next, we will present basic, yet typical, cases where the principles of static routing, packet filtering, and network address translation come into play.

![Setup Static Network Routing in RHEL](http://www.tecmint.com/wp-content/uploads/2015/07/Setup-Static-Network-Routing-in-RHEL-7.jpg)

RHCE: Setup and Test Network Static Routing – Part 1

Please note that we will not cover them in depth, but rather organize these contents in such a way that will be helpful to take the first steps and build from there.

### Static Routing in Red Hat Enterprise Linux 7 ###

One of the wonders of modern networking is the vast availability of devices that can connect groups of computers, whether in relatively small numbers and confined to a single room or several machines in the same building, city, country, or across continents.

However, in order to effectively accomplish this in any situation, network packets need to be routed, or in other words, the path they follow from source to destination must be ruled somehow.

Static routing is the process of specifying a route for network packets other than the default, which is provided by a network device known as the default gateway. Unless specified otherwise through static routing, network packets are directed to the default gateway; with static routing, other paths are defined based on predefined criteria, such as the packet destination.

Let us define the following scenario for this tutorial. We have a Red Hat Enterprise Linux 7 box connecting to router #1 [192.168.0.1] to access the Internet and machines in 192.168.0.0/24.

A second router (router #2) has two network interface cards: enp0s3 is also connected to router #1 to access the Internet and to communicate with the RHEL 7 box and other machines in the same network, whereas the other (enp0s8) is used to grant access to the 10.0.0.0/24 network where internal services reside, such as a web and / or database server.

This scenario is illustrated in the diagram below:

![Static Routing Network Diagram](http://www.tecmint.com/wp-content/uploads/2015/07/Static-Routing-Network-Diagram.png)

Static Routing Network Diagram

In this article we will focus exclusively on setting up the routing table on our RHEL 7 box to make sure that it can both access the Internet through router #1 and the internal network via router #2.

In RHEL 7, you will use the [ip command][3] to configure and show devices and routing using the command line. These changes can take effect immediately on a running system but since they are not persistent across reboots, we will use ifcfg-enp0sX and route-enp0sX files inside /etc/sysconfig/network-scripts to save our configuration permanently.

To begin, let’s print our current routing table:

    # ip route show

![Check Routing Table in Linux](http://www.tecmint.com/wp-content/uploads/2015/07/Check-Current-Routing-Table.png)

Check Current Routing Table

From the output above, we can see the following facts:

- The default gateway’s IP address is 192.168.0.1 and can be accessed via the enp0s3 NIC.
- When the system booted up, it enabled the zeroconf route to 169.254.0.0/16 (just in case). In few words, if a machine is set to obtain an IP address through DHCP but fails to do so for some reason, it is automatically assigned an address in this network. Bottom line is, this route will allow us to communicate, also via enp0s3, with other machines who have failed to obtain an IP address from a DHCP server.
- Last, but not least, we can communicate with other boxes inside the 192.168.0.0/24 network through enp0s3, whose IP address is 192.168.0.18.

These are the typical tasks that you would have to perform in such a setting. Unless specified otherwise, the following tasks should be performed in router #2:

Make sure all NICs have been properly installed:

    # ip link show

If one of them is down, bring it up:

    # ip link set dev enp0s8 up

and assign an IP address in the 10.0.0.0/24 network to it:

    # ip addr add 10.0.0.17 dev enp0s8

Oops! We made a mistake in the IP address. We will have to remove the one we assigned earlier and then add the right one (10.0.0.18):

    # ip addr del 10.0.0.17 dev enp0s8
    # ip addr add 10.0.0.18 dev enp0s8

Now, please note that you can only add a route to a destination network through a gateway that is itself already reachable. For that reason, we need to assign an IP address within the 192.168.0.0/24 range to enp0s3 so that our RHEL 7 box can communicate with it:

    # ip addr add 192.168.0.19 dev enp0s3

Finally, we will need to enable packet forwarding:

    # echo "1" > /proc/sys/net/ipv4/ip_forward

and stop / disable (just for the time being – until we cover packet filtering in the next article) the firewall:

    # systemctl stop firewalld
    # systemctl disable firewalld

Back in our RHEL 7 box (192.168.0.18), let’s configure a route to 10.0.0.0/24 through 192.168.0.19 (enp0s3 in router #2):

    # ip route add 10.0.0.0/24 via 192.168.0.19

After that, the routing table looks as follows:

    # ip route show

![Show Network Routing Table](http://www.tecmint.com/wp-content/uploads/2015/07/Show-Network-Routing.png)

Confirm Network Routing Table

Likewise, add the corresponding route in the machine(s) you’re trying to reach in 10.0.0.0/24:

    # ip route add 192.168.0.0/24 via 10.0.0.18

You can test for basic connectivity using ping:

In the RHEL 7 box, run

    # ping -c 4 10.0.0.20

where 10.0.0.20 is the IP address of a web server in the 10.0.0.0/24 network.

In the web server (10.0.0.20), run

    # ping -c 192.168.0.18

where 192.168.0.18 is, as you will recall, the IP address of our RHEL 7 machine.

Alternatively, we can use [tcpdump][4] (you may need to install it with yum install tcpdump) to check the 2-way communication over TCP between our RHEL 7 box and the web server at 10.0.0.20.

To do so, let’s start the logging in the first machine with:

    # tcpdump -qnnvvv -i enp0s3 host 10.0.0.20

and from another terminal in the same system let’s telnet to port 80 in the web server (assuming Apache is listening on that port; otherwise, indicate the right port in the following command):

    # telnet 10.0.0.20 80

The tcpdump log should look as follows:

![Check Network Communication between Servers](http://www.tecmint.com/wp-content/uploads/2015/07/Tcpdump-logs.png)

Check Network Communication between Servers

Where the connection has been properly initialized, as we can tell by looking at the 2-way communication between our RHEL 7 box (192.168.0.18) and the web server (10.0.0.20).

Please remember that these changes will go away when you restart the system. If you want to make them persistent, you will need to edit (or create, if they don’t already exist) the following files, in the same systems where we performed the above commands.

Though not strictly necessary for our test case, you should know that /etc/sysconfig/network contains system-wide network parameters. A typical /etc/sysconfig/network looks as follows:

    # Enable networking on this system?
    NETWORKING=yes
    # Hostname. Should match the value in /etc/hostname
    HOSTNAME=yourhostnamehere
    # Default gateway
    GATEWAY=XXX.XXX.XXX.XXX
    # Device used to connect to default gateway. Replace X with the appropriate number.
    GATEWAYDEV=enp0sX

When it comes to setting specific variables and values for each NIC (as we did for router #2), you will have to edit /etc/sysconfig/network-scripts/ifcfg-enp0s3 and /etc/sysconfig/network-scripts/ifcfg-enp0s8.

Following our case,

    TYPE=Ethernet
    BOOTPROTO=static
    IPADDR=192.168.0.19
    NETMASK=255.255.255.0
    GATEWAY=192.168.0.1
    NAME=enp0s3
    ONBOOT=yes

and

    TYPE=Ethernet
    BOOTPROTO=static
    IPADDR=10.0.0.18
    NETMASK=255.255.255.0
    GATEWAY=10.0.0.1
    NAME=enp0s8
    ONBOOT=yes

for enp0s3 and enp0s8, respectively.

As for routing in our client machine (192.168.0.18), we will need to edit /etc/sysconfig/network-scripts/route-enp0s3:

    10.0.0.0/24 via 192.168.0.19 dev enp0s3

Now reboot your system and you should see that route in your table.

### Summary ###

In this article we have covered the essentials of static routing in Red Hat Enterprise Linux 7. Although scenarios may vary, the case presented here illustrates the required principles and the procedures to perform this task. Before wrapping up, I would like to suggest you to take a look at [Chapter 4][5] of the Securing and Optimizing Linux section in The Linux Documentation Project site for further details on the topics covered here.

Free ebook on Securing & Optimizing Linux: The Hacking Solution (v.3.0) – This 800+ eBook contains comprehensive collection of Linux security tips and how to use them safely and easily to configure Linux-based applications and services.

![Linux Security and Optimization Book](http://www.tecmint.com/wp-content/uploads/2015/07/Linux-Security-Optimization-Book.gif)

Linux Security and Optimization Book

[Download Now][6]

In the next article we will talk about packet filtering and network address translation to sum up the networking basic skills needed for the RHCE certification.

As always, we look forward to hearing from you, so feel free to leave your questions, comments, and suggestions using the form below.

--------------------------------------------------------------------------------

via: http://www.tecmint.com/how-to-setup-and-configure-static-network-routing-in-rhel/

作者：[Gabriel Cánepa][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/gacanepa/
[1]:http://www.tecmint.com/rhcsa-exam-reviewing-essential-commands-system-documentation/
[2]:https://www.redhat.com/en/services/certification/rhce
[3]:http://www.tecmint.com/ip-command-examples/
[4]:http://www.tecmint.com/12-tcpdump-commands-a-network-sniffer-tool/
[5]:http://www.tldp.org/LDP/solrhe/Securing-Optimizing-Linux-RH-Edition-v1.3/net-manage.html
[6]:http://tecmint.tradepub.com/free/w_opeb01/prgm.cgi
Translating by ictlyh
Part 2 - How to Perform Packet Filtering, Network Address Translation and Set Kernel Runtime Parameters
================================================================================
As promised in Part 1 (“[Setup Static Network Routing][1]”), in this article (Part 2 of RHCE series) we will begin by introducing the principles of packet filtering and network address translation (NAT) in Red Hat Enterprise Linux 7, before diving into setting runtime kernel parameters to modify the behavior of a running kernel if certain conditions change or needs arise.

![Network Packet Filtering in RHEL](http://www.tecmint.com/wp-content/uploads/2015/07/Network-Packet-Filtering-in-RHEL.jpg)

RHCE: Network Packet Filtering – Part 2

### Network Packet Filtering in RHEL 7 ###

When we talk about packet filtering, we refer to a process performed by a firewall in which it reads the header of each data packet that attempts to pass through it. Then, it filters the packet by taking the required action based on rules that have been previously defined by the system administrator.

As you probably know, beginning with RHEL 7, the default service that manages firewall rules is [firewalld][2]. Like iptables, it talks to the netfilter module in the Linux kernel in order to examine and manipulate network packets. Unlike iptables, updates can take effect immediately without interrupting active connections – you don’t even have to restart the service.

Another advantage of firewalld is that it allows us to define rules based on pre-configured service names (more on that in a minute).

In Part 1, we used the following scenario:

![Static Routing Network Diagram](http://www.tecmint.com/wp-content/uploads/2015/07/Static-Routing-Network-Diagram.png)

Static Routing Network Diagram

However, you will recall that we disabled the firewall on router #2 to simplify the example since we had not covered packet filtering yet. Let’s see now how we can enable incoming packets destined for a specific service or port in the destination.

First, let’s add a permanent rule to allow inbound traffic in enp0s3 (192.168.0.19) to enp0s8 (10.0.0.18):

    # firewall-cmd --permanent --direct --add-rule ipv4 filter FORWARD 0 -i enp0s3 -o enp0s8 -j ACCEPT

The above command will save the rule to /etc/firewalld/direct.xml:

    # cat /etc/firewalld/direct.xml

![Check Firewalld Saved Rules in CentOS 7](http://www.tecmint.com/wp-content/uploads/2015/07/Check-Firewalld-Save-Rules.png)

Check Firewalld Saved Rules

Then enable the rule for it to take effect immediately:

    # firewall-cmd --direct --add-rule ipv4 filter FORWARD 0 -i enp0s3 -o enp0s8 -j ACCEPT

Now you can telnet to the web server from the RHEL 7 box and run [tcpdump][3] again to monitor the TCP traffic between the two machines, this time with the firewall in router #2 enabled.

    # telnet 10.0.0.20 80
    # tcpdump -qnnvvv -i enp0s3 host 10.0.0.20

What if you want to only allow incoming connections to the web server (port 80) from 192.168.0.18 and block connections from other sources in the 192.168.0.0/24 network?

In the web server’s firewall, add the following rules:

    # firewall-cmd --add-rich-rule 'rule family="ipv4" source address="192.168.0.18/24" service name="http" accept'
    # firewall-cmd --add-rich-rule 'rule family="ipv4" source address="192.168.0.18/24" service name="http" accept' --permanent
    # firewall-cmd --add-rich-rule 'rule family="ipv4" source address="192.168.0.0/24" service name="http" drop'
    # firewall-cmd --add-rich-rule 'rule family="ipv4" source address="192.168.0.0/24" service name="http" drop' --permanent

Now you can make HTTP requests to the web server, from 192.168.0.18 and from some other machine in 192.168.0.0/24. In the first case the connection should complete successfully, whereas in the second it will eventually timeout.

To do so, any of the following commands will do the trick:

    # telnet 10.0.0.20 80
    # wget 10.0.0.20

I strongly advise you to check out the [Firewalld Rich Language][4] documentation in the Fedora Project Wiki for further details on rich rules.

### Network Address Translation in RHEL 7 ###

Network Address Translation (NAT) is the process where a group of computers (it can also be just one of them) in a private network are assigned an unique public IP address. As result, they are still uniquely identified by their own private IP address inside the network but to the outside they all “seem” the same.

In addition, NAT makes it possible that computers inside a network sends requests to outside resources (like the Internet) and have the corresponding responses be sent back to the source system only.

Let’s now consider the following scenario:

![Network Address Translation in RHEL](http://www.tecmint.com/wp-content/uploads/2015/07/Network-Address-Translation-Diagram.png)

Network Address Translation

In router #2, we will move the enp0s3 interface to the external zone, and enp0s8 to the internal zone, where masquerading, or NAT, is enabled by default:

    # firewall-cmd --list-all --zone=external
    # firewall-cmd --change-interface=enp0s3 --zone=external
    # firewall-cmd --change-interface=enp0s3 --zone=external --permanent
    # firewall-cmd --change-interface=enp0s8 --zone=internal
    # firewall-cmd --change-interface=enp0s8 --zone=internal --permanent

For our current setup, the internal zone – along with everything that is enabled in it will be the default zone:

    # firewall-cmd --set-default-zone=internal

Next, let’s reload firewall rules and keep state information:

    # firewall-cmd --reload

Finally, let’s add router #2 as default gateway in the web server:

    # ip route add default via 10.0.0.18

You can now verify that you can ping router #1 and an external site (tecmint.com, for example) from the web server:

    # ping -c 2 192.168.0.1
    # ping -c 2 tecmint.com

![Verify Network Routing](http://www.tecmint.com/wp-content/uploads/2015/07/Verify-Network-Routing.png)

Verify Network Routing

### Setting Kernel Runtime Parameters in RHEL 7 ###

In Linux, you are allowed to change, enable, and disable the kernel runtime parameters, and RHEL is no exception. The /proc/sys interface (sysctl) lets you set runtime parameters on-the-fly to modify the system’s behavior without much hassle when operating conditions change.

To do so, the echo shell built-in is used to write to files inside /proc/sys/<category>, where <category> is most likely one of the following directories:

- dev: parameters for specific devices connected to the machine.
- fs: filesystem configuration (quotas and inodes, for example).
- kernel: kernel-specific configuration.
- net: network configuration.
- vm: use of the kernel’s virtual memory.

To display the list of all the currently available values, run

    # sysctl -a | less

In Part 1, we changed the value of the net.ipv4.ip_forward parameter by doing

    # echo 1 > /proc/sys/net/ipv4/ip_forward

in order to allow a Linux machine to act as router.

Another runtime parameter that you may want to set is kernel.sysrq, which enables the Sysrq key in your keyboard to instruct the system to perform gracefully some low-level functions, such as rebooting the system if it has frozen for some reason:

    # echo 1 > /proc/sys/kernel/sysrq

To display the value of a specific parameter, use sysctl as follows:

    # sysctl <parameter.name>

For example,

    # sysctl net.ipv4.ip_forward
    # sysctl kernel.sysrq

Some parameters, such as the ones mentioned above, require only one value, whereas others (for example, fs.inode-state) require multiple values:

![Check Kernel Parameters in Linux](http://www.tecmint.com/wp-content/uploads/2015/07/Check-Kernel-Parameters.png)

Check Kernel Parameters

In either case, you need to read the kernel’s documentation before making any changes.

Please note that these settings will go away when the system is rebooted. To make these changes permanent, we will need to add .conf files inside the /etc/sysctl.d as follows:

    # echo "net.ipv4.ip_forward = 1" > /etc/sysctl.d/10-forward.conf

(where the number 10 indicates the order of processing relative to other files in the same directory).

and enable the changes with

    # sysctl -p /etc/sysctl.d/10-forward.conf

### Summary ###

In this tutorial we have explained the basics of packet filtering, network address translation, and setting kernel runtime parameters on a running system and persistently across reboots. I hope you have found this information useful, and as always, we look forward to hearing from you!
Don’t hesitate to share with us your questions, comments, or suggestions using the form below.

--------------------------------------------------------------------------------

via: http://www.tecmint.com/perform-packet-filtering-network-address-translation-and-set-kernel-runtime-parameters-in-rhel/

作者：[Gabriel Cánepa][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/gacanepa/
[1]:http://www.tecmint.com/how-to-setup-and-configure-static-network-routing-in-rhel/
[2]:http://www.tecmint.com/firewalld-rules-for-centos-7/
[3]:http://www.tecmint.com/12-tcpdump-commands-a-network-sniffer-tool/
[4]:https://fedoraproject.org/wiki/Features/FirewalldRichLanguage
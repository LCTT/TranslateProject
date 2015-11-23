Assign Multiple IP Addresses To One Interface On Ubuntu 15.10
================================================================================
Some times you might want to use more than one IP address for your network interface card. What will you do in such cases? Buy an extra network card and assign new IP? No, It’s not necessary(at least in the small networks). We can now assign multiple IP addresses to one interface on Ubuntu systems. Curious to know how? Well, Follow me, It is not that difficult.

This method will work on Debian and it’s derivatives too.

### Add additional IP addresses temporarily ###

First, let us find the IP address of the network card. In my Ubuntu 15.10 server, I use only one network card.

Run the following command to find out the IP address:

    sudo ip addr

**Sample output:**

    1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default 
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
    valid_lft forever preferred_lft forever
    inet6 ::1/128 scope host 
    valid_lft forever preferred_lft forever
    2: enp0s3: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast state UP group default qlen 1000
    link/ether 08:00:27:2a:03:4b brd ff:ff:ff:ff:ff:ff
    inet 192.168.1.103/24 brd 192.168.1.255 scope global enp0s3
    valid_lft forever preferred_lft forever
    inet6 fe80::a00:27ff:fe2a:34e/64 scope link 
    valid_lft forever preferred_lft forever

Or

    sudo ifconfig

**Sample output:**

    enp0s3 Link encap:Ethernet HWaddr 08:00:27:2a:03:4b 
    inet addr:192.168.1.103 Bcast:192.168.1.255 Mask:255.255.255.0
    inet6 addr: fe80::a00:27ff:fe2a:34e/64 Scope:Link
    UP BROADCAST RUNNING MULTICAST MTU:1500 Metric:1
    RX packets:186 errors:0 dropped:0 overruns:0 frame:0
    TX packets:70 errors:0 dropped:0 overruns:0 carrier:0
    collisions:0 txqueuelen:1000 
    RX bytes:21872 (21.8 KB) TX bytes:9666 (9.6 KB)
    lo Link encap:Local Loopback 
    inet addr:127.0.0.1 Mask:255.0.0.0
    inet6 addr: ::1/128 Scope:Host
    UP LOOPBACK RUNNING MTU:65536 Metric:1
    RX packets:217 errors:0 dropped:0 overruns:0 frame:0
    TX packets:217 errors:0 dropped:0 overruns:0 carrier:0
    collisions:0 txqueuelen:0 
    RX bytes:38793 (38.7 KB) TX bytes:38793 (38.7 KB)

As you see in the above output, my network card name is **enp0s3**, and its IP address is **192.168.1.103**.

Now let us add an additional IP address, for example **192.168.1.104**, to the Interface card.

Open your Terminal and run the following command to add additional IP.

    sudo ip addr add 192.168.1.104/24 dev enp0s3

Now, let us check if the IP is added using command:

    sudo ip address show enp0s3

**Sample output:**

    2: enp0s3: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast state UP group default qlen 1000
    link/ether 08:00:27:2a:03:4e brd ff:ff:ff:ff:ff:ff
    inet 192.168.1.103/24 brd 192.168.1.255 scope global enp0s3
    valid_lft forever preferred_lft forever
    inet 192.168.1.104/24 scope global secondary enp0s3
    valid_lft forever preferred_lft forever
    inet6 fe80::a00:27ff:fe2a:34e/64 scope link 
    valid_lft forever preferred_lft forever

Similarly, you can add as many IP addresses as you want.

Let us ping the IP address to verify it.

    sudo ping 192.168.1.104

**Sample output:**

    PING 192.168.1.104 (192.168.1.104) 56(84) bytes of data.
    64 bytes from 192.168.1.104: icmp_seq=1 ttl=64 time=0.901 ms
    64 bytes from 192.168.1.104: icmp_seq=2 ttl=64 time=0.571 ms
    64 bytes from 192.168.1.104: icmp_seq=3 ttl=64 time=0.521 ms
    64 bytes from 192.168.1.104: icmp_seq=4 ttl=64 time=0.524 ms

Yeah, It’s working!!

To remove the IP, just run:

    sudo ip addr del 192.168.1.104/24 dev enp0s3

Let us check if it is removed.

    sudo ip address show enp0s3

**Sample output:**

    2: enp0s3: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast state UP group default qlen 1000
    link/ether 08:00:27:2a:03:4e brd ff:ff:ff:ff:ff:ff
    inet 192.168.1.103/24 brd 192.168.1.255 scope global enp0s3
    valid_lft forever preferred_lft forever
    inet6 fe80::a00:27ff:fe2a:34e/64 scope link 
    valid_lft forever preferred_lft forever

See, It’s gone!!

Well, as you may know, the changes will lost after you reboot your system. How do I make it permanent? That’s easy too.

### Add additional IP addresses permanently ###

The network card configuration file of your Ubuntu system is **/etc/network/interfaces**.

Let us check the details of the above file.

    sudo cat /etc/network/interfaces

**Sample output:**

    # This file describes the network interfaces available on your system
    # and how to activate them. For more information, see interfaces(5).
    source /etc/network/interfaces.d/*
    # The loopback network interface
    auto lo
    iface lo inet loopback
    # The primary network interface
    auto enp0s3
    iface enp0s3 inet dhcp

As you see in the above output, the Interface is DHCP enabled.

Okay, now we will assign an additional address, for example **192.168.1.104/24**.

Edit file **/etc/network/interfaces**:

    sudo nano /etc/network/interfaces

Add additional IP address as shown in the black letters.

    # This file describes the network interfaces available on your system
    # and how to activate them. For more information, see interfaces(5).
    source /etc/network/interfaces.d/*
    # The loopback network interface
    auto lo
    iface lo inet loopback
    # The primary network interface
    auto enp0s3
    iface enp0s3 inet dhcp
    iface enp0s3 inet static
     address 192.168.1.104/24

Save and close the file.

Run the following file to take effect the changes without rebooting.

    sudo ifdown enp0s3 && sudo ifup enp0s3

**Sample output:**

    Killed old client process
    Internet Systems Consortium DHCP Client 4.3.1
    Copyright 2004-2014 Internet Systems Consortium.
    All rights reserved.
    For info, please visit https://www.isc.org/software/dhcp/
    Listening on LPF/enp0s3/08:00:27:2a:03:4e
    Sending on LPF/enp0s3/08:00:27:2a:03:4e
    Sending on Socket/fallback
    DHCPRELEASE on enp0s3 to 192.168.1.1 port 67 (xid=0x225f35)
    Internet Systems Consortium DHCP Client 4.3.1
    Copyright 2004-2014 Internet Systems Consortium.
    All rights reserved.
    For info, please visit https://www.isc.org/software/dhcp/
    Listening on LPF/enp0s3/08:00:27:2a:03:4e
    Sending on LPF/enp0s3/08:00:27:2a:03:4e
    Sending on Socket/fallback
    DHCPDISCOVER on enp0s3 to 255.255.255.255 port 67 interval 3 (xid=0xdfb94764)
    DHCPREQUEST of 192.168.1.103 on enp0s3 to 255.255.255.255 port 67 (xid=0x6447b9df)
    DHCPOFFER of 192.168.1.103 from 192.168.1.1
    DHCPACK of 192.168.1.103 from 192.168.1.1
    bound to 192.168.1.103 -- renewal in 35146 seconds.

**Note**: It is **very important** to run the above two commands into **one** line if you are remoting into the server because the first one will drop your connection. Given in this way the ssh-session will survive.

Now, let us check if IP is added using command:

    sudo ip address show enp0s3

**Sample output:**

    2: enp0s3: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast state UP group default qlen 1000
    link/ether 08:00:27:2a:03:4e brd ff:ff:ff:ff:ff:ff
    inet 192.168.1.103/24 brd 192.168.1.255 scope global enp0s3
    valid_lft forever preferred_lft forever
    inet 192.168.1.104/24 brd 192.168.1.255 scope global secondary enp0s3
    valid_lft forever preferred_lft forever
    inet6 fe80::a00:27ff:fe2a:34e/64 scope link 
    valid_lft forever preferred_lft forever

Cool! Additional IP has been added.

Well then let us ping the IP address to verify.

    sudo ping 192.168.1.104

**Sample output:**

    PING 192.168.1.104 (192.168.1.104) 56(84) bytes of data.
    64 bytes from 192.168.1.104: icmp_seq=1 ttl=64 time=0.137 ms
    64 bytes from 192.168.1.104: icmp_seq=2 ttl=64 time=0.050 ms
    64 bytes from 192.168.1.104: icmp_seq=3 ttl=64 time=0.054 ms
    64 bytes from 192.168.1.104: icmp_seq=4 ttl=64 time=0.067 ms

Voila! It’s working. That’s it.

Want to know how to add additional IP addresses on CentOS/RHEL/Scientific Linux/Fedora systems, check the following link.

- [Assign Multiple IP Addresses To Single Network Interface Card On CentOS 7][1]

Happy weekend!

--------------------------------------------------------------------------------

via: http://www.unixmen.com/assign-multiple-ip-addresses-to-one-interface-on-ubuntu-15-10/

作者：[SK][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.unixmen.com/author/sk/
[1]:http://www.unixmen.com/linux-basics-assign-multiple-ip-addresses-single-network-interface-card-centos-7/
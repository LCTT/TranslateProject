Translating by GOLinux ...
‘Ifconfig’ Command Not Found In CentOS 7 Minimal Installation – A Quick Tip To Fix It
================================================================================
![](http://180016988.r.cdn77.net/wp-content/uploads/2014/08/centos7-790x493.jpg)

As we all know, “**ifconfig**” command is used to configure a network interfaces in GNU/Linux systems. It displays the details of a network interface card like IP address, MAC Address, and the status of a network interface card etc. But, this command is obsolete, and is not found in the minimal versions of RHEL 7 and its clones like CentOS 7, Oracle Linux 7, and Scientific Linux 7.

### How do I find IP and other details of a network interface In CentOS Minimal server? ###

CentOS 7 minimal systems, use the commands “**ip addr**” and “**ip link**” to find the details of a network interface card. To know the statistics use “**ip -s link**”.

To view the details of the network interface cards, enter the following commands:

    ip addr

Sample output:

    1: lo: <LOOPBACK,UP,LOWER_UP> mtu 16436 qdisc noqueue state UNKNOWN 
        link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
        inet 127.0.0.1/8 scope host lo
        inet6 ::1/128 scope host 
           valid_lft forever preferred_lft forever
    2: venet0: <BROADCAST,POINTOPOINT,NOARP,UP,LOWER_UP> mtu 1500 qdisc noqueue state UNKNOWN 
        link/void 
        inet 127.0.0.1/32 scope host venet0
        inet 192.168.1.101/32 brd 192.168.1.101 scope global venet0:0

To view the statistics of your network interfaces, enter the command:

    ip link

Sample output:

    1: lo: <LOOPBACK,UP,LOWER_UP> mtu 16436 qdisc noqueue state UNKNOWN mode DEFAULT 
        link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    2: venet0: <BROADCAST,POINTOPOINT,NOARP,UP,LOWER_UP> mtu 1500 qdisc noqueue state UNKNOWN mode DEFAULT 
        link/void

OR

    ip -s link

Sample output:

    1: lo: <LOOPBACK,UP,LOWER_UP> mtu 16436 qdisc noqueue state UNKNOWN mode DEFAULT 
        link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
        RX: bytes  packets  errors  dropped overrun mcast   
        0          0        0       0       0       0      
        TX: bytes  packets  errors  dropped carrier collsns 
        0          0        0       0       0       0      
    2: venet0: <BROADCAST,POINTOPOINT,NOARP,UP,LOWER_UP> mtu 1500 qdisc noqueue state UNKNOWN mode DEFAULT 
        link/void 
        RX: bytes  packets  errors  dropped overrun mcast   
        8515667    6667     0       0       0       0      
        TX: bytes  packets  errors  dropped carrier collsns 
        300403     4249     0       0       0       0

### How do I enable and use “ifconfig” Command in CentOS 7 minimal servers? ###

If you don’t know where to find the ifconfig command, follow the simple steps provided below. First let us find out which packages will provide ifconfig command. To do that , enter the following command:

    yum provides ifconfig

Sample Output:

    Loaded plugins: fastestmirror
    Loading mirror speeds from cached hostfile
     * base: centos.aol.in
     * extras: centos.aol.in
     * updates: centos.aol.in
    net-tools-2.0-0.17.20131004git.el7.x86_64 : Basic networking tools
    Repo        : @base
    Matched from:
    Filename    : /usr/sbin/ifconfig

Or you can use the following command too.

    yum whatprovides ifconfig

Here, “provides” or “whatprovides” switches are used to find out which package provides some feature or file.

As you see in the above output, the **net-tools** package provides the ifconfig command. So, let us install net-tools package to use ifconfig command.

    yum install net-tools

Now, you’ll be able to use the command **ifconfig** as usual.

    ifconfig -a

Sample output:

    lo: flags=73<UP,LOOPBACK,RUNNING>  mtu 16436
            inet 127.0.0.1  netmask 255.0.0.0
            inet6 ::1  prefixlen 128  scopeid 0x10<host>
            loop  txqueuelen 0  (Local Loopback)
            RX packets 0  bytes 0 (0.0 B)
            RX errors 0  dropped 0  overruns 0  frame 0
            TX packets 0  bytes 0 (0.0 B)
            TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0
    
    venet0: flags=211<UP,BROADCAST,POINTOPOINT,RUNNING,NOARP>  mtu 1500
            inet 127.0.0.1  netmask 255.255.255.255  broadcast 0.0.0.0  destination 127.0.0.1
            unspec 00-00-00-00-00-00-00-00-00-00-00-00-00-00-00-00  txqueuelen 0  (UNSPEC)
            RX packets 7073  bytes 8549159 (8.1 MiB)
            RX errors 0  dropped 0  overruns 0  frame 0
            TX packets 4611  bytes 359201 (350.7 KiB)
            TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0
    
    venet0:0: flags=211<UP,BROADCAST,POINTOPOINT,RUNNING,NOARP>  mtu 1500
            inet 192.168.1.101  netmask 255.255.255.255  broadcast 192.168.1.101  destination 192.168.1.101
            unspec 00-00-00-00-00-00-00-00-00-00-00-00-00-00-00-00  txqueuelen 0  (UNSPEC)

Enjoy!

--------------------------------------------------------------------------------

via: http://www.unixmen.com/ifconfig-command-found-centos-7-minimal-installation-quick-tip-fix/

作者：[Senthilkumar][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.unixmen.com/author/sk/

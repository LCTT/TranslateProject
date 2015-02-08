Translating---geekpi

Linux Basics: Assign Multiple IP Addresses To Single Network Interface Card On CentOS 7
================================================================================
Some times you might want to use more than one IP address for your network interface card. What are you going to do? Buy an extra network card and assign new IP? No, It’s not necessary(atleast in the small networks). We can now assign multiple ip addresses to single network interface card in CentOS / RHEL 7 systems. Curious to know how? Well, Follow me, It is not that difficult.

First, let us find the IP address of the network card. In my CentOS 7 server, I use only one network card.

Run the following command with root user privileges:

    ip addr

Sample output:

    1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN 
        link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
        inet 127.0.0.1/8 scope host lo
           valid_lft forever preferred_lft forever
        inet6 ::1/128 scope host 
           valid_lft forever preferred_lft forever
    2: enp0s3: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast state UP qlen 1000
        link/ether 08:00:27:80:63:19 brd ff:ff:ff:ff:ff:ff
        inet 192.168.1.150/24 brd 192.168.1.255 scope global enp0s3
           valid_lft forever preferred_lft forever

As you see in the above output, my network card name is enp0s3, and its IP address is 192.168.1.150.

Well, as you may know, the the network card configuration files of your system is stored under **/etc/sysconfig/network-scripts/** directory. Each cards details will be stored in different names, for example **ifcfg-enp0s3**.

Let us see the details of **ifcfg-enp0s3**.

    cat /etc/sysconfig/network-scripts/ifcfg-enp0s3

Sample output:

    TYPE="Ethernet"
    BOOTPROTO="none"
    DEFROUTE="yes"
    IPV4_FAILURE_FATAL="no"
    IPV6INIT="yes"
    IPV6_AUTOCONF="yes"
    IPV6_DEFROUTE="yes"
    IPV6_FAILURE_FATAL="no"
    NAME="enp0s3"
    UUID="e9f9caef-cb9e-4a19-aace-767c6ee6f849"
    ONBOOT="yes"
    HWADDR="08:00:27:80:63:19"
    IPADDR0="192.168.1.150"
    PREFIX0="24"
    GATEWAY0="192.168.1.1"
    DNS1="192.168.1.1"
    IPV6_PEERDNS="yes"
    IPV6_PEERROUTES="yes"

Okay, now we will assign multiple addresses in the same subnet.

Edit file **/etc/sysconfig/network-scripts/ifcfg-enp0s3**:

    vi /etc/sysconfig/network-scripts/ifcfg-enp0s3

Add extra IP addresses one by one as shown below.

    TYPE="Ethernet"
    BOOTPROTO="none"
    DEFROUTE="yes"
    IPV4_FAILURE_FATAL="no"
    IPV6INIT="yes"
    IPV6_AUTOCONF="yes"
    IPV6_DEFROUTE="yes"
    IPV6_FAILURE_FATAL="no"
    NAME="enp0s3"
    UUID="933cdc9b-b383-4ddd-b219-5a72c69c9cf0"
    ONBOOT="yes"
    HWADDR="08:00:27:3F:AB:68"
    IPADDR0="192.168.1.150"
    IPADDR1="192.168.1.151"
    IPADDR2="192.168.1.152"
    PREFIX0="24"
    GATEWAY0="192.168.1.1"
    DNS1="192.168.1.1"
    IPV6_PEERDNS="yes"
    IPV6_PEERROUTES="yes"

As you see above, I have added two more IP addresses: **IPADDR1=”192.168.1.151″ & IPADDR2=”192.168.1.152″**

Like wise, you can add as many a IP addresses you want.

Finally, save and close the file. Restart network service to take effect the changes.

    systemctl restart network

Now, let us check the IP addresses have been added or not.

    ip addr

Sample output:

    : lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN 
        link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
        inet 127.0.0.1/8 scope host lo
           valid_lft forever preferred_lft forever
        inet6 ::1/128 scope host 
           valid_lft forever preferred_lft forever
    2: enp0s3: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast state UP qlen 1000
        link/ether 08:00:27:3f:ab:68 brd ff:ff:ff:ff:ff:ff
        inet 192.168.1.150/24 brd 192.168.1.255 scope global enp0s3
           valid_lft forever preferred_lft forever
        inet 192.168.1.151/24 brd 192.168.1.255 scope global secondary enp0s3
           valid_lft forever preferred_lft forever
        inet 192.168.1.152/24 brd 192.168.1.255 scope global secondary enp0s3
           valid_lft forever preferred_lft forever
        inet6 fe80::a00:27ff:fe3f:ab68/64 scope link 
           valid_lft forever preferred_lft forever

As you see above, the single network interface card has three IP addresses.

Let us ping the newly added IP addresses:

    ping -c 4 192.168.1.151

Sample output:

    PING 192.168.1.151 (192.168.1.151) 56(84) bytes of data.
    64 bytes from 192.168.1.151: icmp_seq=1 ttl=64 time=0.048 ms
    64 bytes from 192.168.1.151: icmp_seq=2 ttl=64 time=0.075 ms
    64 bytes from 192.168.1.151: icmp_seq=3 ttl=64 time=0.077 ms
    64 bytes from 192.168.1.151: icmp_seq=4 ttl=64 time=0.077 ms
    
    --- 192.168.1.151 ping statistics ---
    4 packets transmitted, 4 received, 0% packet loss, time 2999ms
    rtt min/avg/max/mdev = 0.048/0.069/0.077/0.013 ms

----------

    ping -c 4 192.168.1.152

Sample output:

    PING 192.168.1.152 (192.168.1.152) 56(84) bytes of data.
    64 bytes from 192.168.1.152: icmp_seq=1 ttl=64 time=0.034 ms
    64 bytes from 192.168.1.152: icmp_seq=2 ttl=64 time=0.075 ms
    64 bytes from 192.168.1.152: icmp_seq=3 ttl=64 time=0.073 ms
    64 bytes from 192.168.1.152: icmp_seq=4 ttl=64 time=0.075 ms
    
    --- 192.168.1.152 ping statistics ---
    4 packets transmitted, 4 received, 0% packet loss, time 2999ms
    rtt min/avg/max/mdev = 0.034/0.064/0.075/0.018 ms

If you want to use **different subnet**, then you can change the **PREFIX0=24** line to different subnet, such as **PREFIX1=16**.

For example, I am going to add Class A IP address(**ex.10.0.0.1**) to my network card.

    TYPE="Ethernet"
    BOOTPROTO="none"
    DEFROUTE="yes"
    IPV4_FAILURE_FATAL="no"
    IPV6INIT="yes"
    IPV6_AUTOCONF="yes"
    IPV6_DEFROUTE="yes"
    IPV6_FAILURE_FATAL="no"
    NAME="enp0s3"
    UUID="933cdc9b-b383-4ddd-b219-5a72c69c9cf0"
    ONBOOT="yes"
    HWADDR="08:00:27:3F:AB:68"
    IPADDR0="192.168.1.150"
    IPADDR1="192.168.1.151"
    IPADDR2="192.168.1.152"
    IPADDR3="10.0.0.1"
    PREFIX0="24"
    PREFIX1=16
    GATEWAY0="192.168.1.1"
    DNS1="192.168.1.1"
    IPV6_PEERDNS="yes"
    IPV6_PEERROUTES="yes"

Do you notice that I have added a Class A type address(10.0.0.1) and prefix=16.

Save and close the file. Restart network service,

Then, ping the new added IP:

    ping -c 4 10.0.0.1

Sample output:

    PING 10.0.0.1 (10.0.0.1) 56(84) bytes of data.
    64 bytes from 10.0.0.1: icmp_seq=1 ttl=64 time=0.097 ms
    64 bytes from 10.0.0.1: icmp_seq=2 ttl=64 time=0.073 ms
    64 bytes from 10.0.0.1: icmp_seq=3 ttl=64 time=0.074 ms
    64 bytes from 10.0.0.1: icmp_seq=4 ttl=64 time=0.075 ms
    
    --- 10.0.0.1 ping statistics ---
    4 packets transmitted, 4 received, 0% packet loss, time 3000ms
    rtt min/avg/max/mdev = 0.073/0.079/0.097/0.014 ms

Similarly, you can add different Gateways too.

That’s it.

--------------------------------------------------------------------------------

via: http://www.unixmen.com/linux-basics-assign-multiple-ip-addresses-single-network-interface-card-centos-7/

作者：[SK][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.unixmen.com/author/sk/

[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Troubleshooting hardware problems in Linux)
[#]: via: (https://opensource.com/article/18/12/troubleshooting-hardware-problems-linux)
[#]: author: (Daniel Oh https://opensource.com/users/daniel-oh)

Troubleshooting hardware problems in Linux
======
Learn what's causing your Linux hardware to malfunction so you can get it back up and running quickly.
![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/rh_003499_01_other11x_cc.png?itok=I_kCDYj0)

[Linux servers][1] run mission-critical business applications in many different types of infrastructures including physical machines, virtualization, private cloud, public cloud, and hybrid cloud. It's important for Linux sysadmins to understand how to manage Linux hardware infrastructure—including software-defined functionalities related to [networking][2], storage, Linux containers, and multiple tools on Linux servers.

It can take some time to troubleshoot and solve hardware-related issues on Linux. Even highly experienced sysadmins sometimes spend hours working to solve mysterious hardware and software discrepancies.

The following tips should make it quicker and easier to troubleshoot hardware in Linux. Many different things can cause problems with Linux hardware; before you start trying to diagnose them, it's smart to learn about the most common issues and where you're most likely to find them.

### Quick-diagnosing devices, modules, and drivers

The first step in troubleshooting usually is to display a list of the hardware installed on your Linux server. You can obtain detailed information on the hardware using **ls** commands such as **[lspci][3]** , **[lsblk][4]** , **[lscpu][5]** , and **[lsscsi][6]**. For example, here is output of the **lsblk** command:

```
# lsblk
NAME    MAJ:MIN RM SIZE RO TYPE MOUNTPOINT
xvda    202:0    0  50G  0 disk
├─xvda1 202:1    0   1M  0 part
└─xvda2 202:2    0  50G  0 part /
xvdb    202:16   0  20G  0 disk
└─xvdb1 202:17   0  20G  0 part
```

If the **ls** commands don't reveal any errors, use init processes (e.g., **systemd** ) to see how the Linux server is working. **systemd** is the most popular init process for bootstrapping user spaces and controlling multiple system processes. For example, here is output of the **systemctl status** command:

```
# systemctl status
● bastion.f347.internal
    State: running
     Jobs: 0 queued
   Failed: 0 units
    Since: Wed 2018-11-28 01:29:05 UTC; 2 days ago
   CGroup: /
           ├─1 /usr/lib/systemd/systemd --switched-root --system --deserialize 21
           ├─kubepods.slice
           │ ├─kubepods-pod3881728a_f2af_11e8_af77_06af52f87498.slice
           │ │ ├─docker-88b27385f4bae77bba834fbd60a61d19026bae13d18eb147783ae27819c34967.scope
           │ │ │ └─23860 /opt/bridge/bin/bridge --public-dir=/opt/bridge/static --config=/var/console-config/console-c
           │ │ └─docker-a4433f0d523c7e5bc772ee4db1861e4fa56c4e63a2d48f6bc831458c2ce9fd2d.scope
           │ │   └─23639 /usr/bin/pod
....
```

### Digging into multiple loggings

**Dmesg** allows you to figure out errors and warnings in the kernel's latest messages. For example, here is output of the **dmesg | more** command:

```
# dmesg | more
....
[ 1539.027419] IPv6: ADDRCONF(NETDEV_UP): eth0: link is not ready
[ 1539.042726] IPv6: ADDRCONF(NETDEV_UP): veth61f37018: link is not ready
[ 1539.048706] IPv6: ADDRCONF(NETDEV_CHANGE): veth61f37018: link becomes ready
[ 1539.055034] IPv6: ADDRCONF(NETDEV_CHANGE): eth0: link becomes ready
[ 1539.098550] device veth61f37018 entered promiscuous mode
[ 1541.450207] device veth61f37018 left promiscuous mode
[ 1542.493266] SELinux: mount invalid.  Same superblock, different security settings for (dev mqueue, type mqueue)
[ 9965.292788] SELinux: mount invalid.  Same superblock, different security settings for (dev mqueue, type mqueue)
[ 9965.449401] IPv6: ADDRCONF(NETDEV_UP): eth0: link is not ready
[ 9965.462738] IPv6: ADDRCONF(NETDEV_UP): vetheacc333c: link is not ready
[ 9965.468942] IPv6: ADDRCONF(NETDEV_CHANGE): vetheacc333c: link becomes ready
....
```

You can also look at all Linux system logs in the **/var/log/messages** file, which is where you'll find errors related to specific issues. It's worthwhile to monitor the messages via the **tail** command in real time when you make modifications to your hardware, such as mounting an extra disk or adding an Ethernet network interface. For example, here is output of the **tail -f /var/log/messages** command:

```
# tail -f /var/log/messages
Dec  1 13:20:33 bastion dnsmasq[30201]: using nameserver 127.0.0.1#53 for domain in-addr.arpa
Dec  1 13:20:33 bastion dnsmasq[30201]: using nameserver 127.0.0.1#53 for domain cluster.local
Dec  1 13:21:03 bastion dnsmasq[30201]: setting upstream servers from DBus
Dec  1 13:21:03 bastion dnsmasq[30201]: using nameserver 192.199.0.2#53
Dec  1 13:21:03 bastion dnsmasq[30201]: using nameserver 127.0.0.1#53 for domain in-addr.arpa
Dec  1 13:21:03 bastion dnsmasq[30201]: using nameserver 127.0.0.1#53 for domain cluster.local
Dec  1 13:21:33 bastion dnsmasq[30201]: setting upstream servers from DBus
Dec  1 13:21:33 bastion dnsmasq[30201]: using nameserver 192.199.0.2#53
Dec  1 13:21:33 bastion dnsmasq[30201]: using nameserver 127.0.0.1#53 for domain in-addr.arpa
Dec  1 13:21:33 bastion dnsmasq[30201]: using nameserver 127.0.0.1#53 for domain cluster.local
```

### Analyzing networking functions

You may have hundreds of thousands of cloud-native applications to serve business services in a complex networking environment; these may include virtualization, multiple cloud, and hybrid cloud. This means you should analyze whether networking connectivity is working correctly as part of your troubleshooting. Useful commands to figure out networking functions in the Linux server include **ip addr** , **traceroute** , **nslookup** , **dig** , and **ping** , among others. For example, here is output of the **ip addr show** command:

```
# ip addr show
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
    inet6 ::1/128 scope host
       valid_lft forever preferred_lft forever
2: eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 9001 qdisc mq state UP group default qlen 1000
    link/ether 06:af:52:f8:74:98 brd ff:ff:ff:ff:ff:ff
    inet 192.199.0.169/24 brd 192.199.0.255 scope global noprefixroute dynamic eth0
       valid_lft 3096sec preferred_lft 3096sec
    inet6 fe80::4af:52ff:fef8:7498/64 scope link
       valid_lft forever preferred_lft forever
3: docker0: <NO-CARRIER,BROADCAST,MULTICAST,UP> mtu 1500 qdisc noqueue state DOWN group default
    link/ether 02:42:67:fb:1a:a2 brd ff:ff:ff:ff:ff:ff
    inet 172.17.0.1/16 scope global docker0
       valid_lft forever preferred_lft forever
    inet6 fe80::42:67ff:fefb:1aa2/64 scope link
       valid_lft forever preferred_lft forever
....
```

### In conclusion

Troubleshooting Linux hardware requires considerable knowledge, including how to use powerful command-line tools and figure out system loggings. You should also know how to diagnose the kernel space, which is where you can find the root cause of many hardware problems. Keep in mind that hardware issues in Linux may come from many different sources, including devices, modules, drivers, BIOS, networking, and even plain old hardware malfunctions.

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/12/troubleshooting-hardware-problems-linux

作者：[Daniel Oh][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/daniel-oh
[b]: https://github.com/lujun9972
[1]: https://opensource.com/article/18/5/what-linux-server
[2]: https://opensource.com/article/18/11/intro-software-defined-networking
[3]: https://linux.die.net/man/8/lspci
[4]: https://linux.die.net/man/8/lsblk
[5]: https://linux.die.net/man/1/lscpu
[6]: https://linux.die.net/man/8/lsscsi

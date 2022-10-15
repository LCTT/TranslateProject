[#]: subject: "How To Find Default Gateway IP Address In Linux And Unix From Commandline"
[#]: via: "https://ostechnix.com/find-default-gateway-linux/"
[#]: author: "sk https://ostechnix.com/author/sk/"
[#]: collector: "lkxed"
[#]: translator: "MjSeven"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

How To Find Default Gateway IP Address In Linux And Unix From Commandline
======
5 Ways To Find Gateway Or Router IP Address In Linux

A **gateway** is a node or a router that allows two or more hosts with different IP addresses to communicate with each other when connected to the same router. Without gateway, devices connected on the same router won’t be able to communicate with each other. To put this another way, the gateway acts as an access point to pass network data from a local network to a remote network. In this guide, we will see all the possible ways to **find default gateway in Linux** and **Unix** from commandline.

#### Contents

1. Find Default Gateway In Linux  2. 1. Find Default Gateway Using ip Command  3. 2. Display Default Gateway IP Address Using route Command  4. 3. View Gateway IP Address Using netstat Command  5. 4. Print Default Gateway IP Address Or Router IP Address Using routel Command  6. 5. Find Gateway From Ethernet Configuration Files
7. Conclusion

### Find Default Gateway In Linux

There are various commandline tools are available to view the gateway IP address in Linux. The most commonly used tools are: **ip**, **ss**, and **netcat**. We will see how check the default gateway using each tool with examples.

#### 1. Find Default Gateway Using ip Command

The **ip** command is used to show and manipulate routing, network devices, interfaces and tunnels in Linux.

To find the default gateway or Router IP address, simply run:

```
$ ip route
```

Or,

```
$ ip r
```

Or,

```
$ ip route show
```

**Sample output:**

```
default via 192.168.1.101 dev eth0 proto static metric 100 
172.17.0.0/16 dev docker0 proto kernel scope link src 172.17.0.1 linkdown 
192.168.1.0/24 dev eth0 proto kernel scope link src 192.168.1.20 metric 100
```

Did you see the line **"default via 192.168.1.101"** in the above output? This is the default gateway. So my default gateway is **192.168.1.101**.

You can use **-4** with `ip route` command to **display the IPv4 gateway** only:

```
$ ip -4 route
```

And, use `-6` to **display the IPv6 gateway** only:

```
$ ip -6 route
```

As you noticed in the output, the IP address and the subnet details are also shown. If you want to display ONLY the default gateway and exclude all other details from the output, you can use `awk` command with `ip route` like below.

To find the default gateway IP address using `ip route` and `grep`, run:

To print Gateway IP address with `ip route` and `awk` commands, run:

```
$ ip route | awk '/^default/{print $3}'
```

Or,

```
$ ip route show default | awk '{print $3}'
```

This will list only the gateway.

**Sample output:**

```
192.168.1.101
```

![Find Default Gateway Using ip Command][1]

You can also use **[grep][2]** command with `ip route` to filter the default gateway.

```
$ ip route | grep default
default via 192.168.1.101 dev eth0 proto static metric 100
```

The `ip route` is the recommended command to find the default gateway IP address in latest Linux distributions. However, some of you may still be using the legacy tools like **route** and `netstat`. Old habits die hard, right? The following sections explains how to determine the gateway in Linux using `route` and `netstat` commands.

#### 2. Display Default Gateway IP Address Using route Command

The **route** command is used to show and manipulate routing table in older Linux distributions, for example RHEL 6, CentOS 6.

If you're using those older Linux distributions, you can use the `route` command to display the default gateway.

Please note that the `route` tool is deprecated and replaced with `ip route` command in the latest Linux distributions. If you still want to use `route` for any reason, you need to install it.

First, we need to check which package provides `route` command. To do so, run the following command on your RHEL-based system:

```
$ dnf provides route
```

**Sample output:**

```
net-tools-2.0-0.52.20160912git.el8.x86_64 : Basic networking tools
Repo        : @System
Matched from:
Filename    : /usr/sbin/route

net-tools-2.0-0.52.20160912git.el8.x86_64 : Basic networking tools
Repo        : baseos
Matched from:
Filename    : /usr/sbin/route
```

As you can see in the above output, the net-tools package provides the `route` command. So, let us install it using command:

```
$ sudo dnf install net-tools
```

Now, run `route` command with `-n` flag to display the gateway IP address or router IP address in your Linux system:

```
$ route -n
```

**Sample output:**

```
Kernel IP routing table
Destination     Gateway         Genmask         Flags Metric Ref    Use Iface
0.0.0.0         192.168.1.101   0.0.0.0         UG    100    0        0 eth0
172.17.0.0      0.0.0.0         255.255.0.0     U     0      0        0 docker0
192.168.1.0     0.0.0.0         255.255.255.0   U     100    0        0 eth0
```

![Display Default Gateway IP Address Using route Command][3]

As you see in the above output, the gateway IP address is 192.168.1.101. You will also see the two letters **"UG"** under Flags section. The letter **"U"** indicates the interface is **UP** and **G** stands for Gateway.

#### 3. View Gateway IP Address Using netstat Command

**Netstat** prints information about the Linux networking subsystem. Using netstat tool, we can print network connections, routing tables, interface statistics, masquerade connections, and multicast memberships in Linux and Unix systems.

Netstat is part of net-tools package, so make sure you've installed it in your Linux system. The following commands install net-tools package in RHEL-based systems:

```
$ sudo dnf install net-tools
```

To print the default gateway IP address using `netstat` command, run:

```
$ netstat -rn
```

**Sample output:**

```
Kernel IP routing table
Destination     Gateway         Genmask         Flags   MSS Window  irtt Iface
0.0.0.0         192.168.1.101   0.0.0.0         UG        0 0          0 eth0
172.17.0.0      0.0.0.0         255.255.0.0     U         0 0          0 docker0
192.168.1.0     0.0.0.0         255.255.255.0   U         0 0          0 eth0
```

![View Gateway IP Address Using netstat Command][4]

The `netstat` command's output is same as `route` command's output. As per the above output, the gateway IP address is 192.168.1.101 and the UG stands the NIC associated to gateway is UP and G indicates Gateway,

Please note that `netstat` is also deprecated and it is recommended to use **"ss"** command instead of netstat.

#### 4. Print Default Gateway IP Address Or Router IP Address Using routel Command

The **routel** is a script to list routes with pretty output format. The routel script will list routes in a format that some might consider easier to interpret then the `ip route` list equivalent.

The routel script is also the part of net-tools package.

To print the default gateway or router IP address, run routel script without any flags like below:

```
$ routel
```

**Sample output:**

```
target            gateway          source    proto    scope    dev tbl
        default      192.168.1.101                   static            eth0 
    172.17.0.0/ 16                      172.17.0.1   kernel     linkdocker0 
   192.168.1.0/ 24                    192.168.1.20   kernel     link   eth0 
     127.0.0.0/ 8            local       127.0.0.1   kernel     host     lo local
      127.0.0.1              local       127.0.0.1   kernel     host     lo local
127.255.255.255          broadcast       127.0.0.1   kernel     link     lo local
     172.17.0.1              local      172.17.0.1   kernel     hostdocker0 local
 172.17.255.255          broadcast      172.17.0.1   kernel     linkdocker0 local
   192.168.1.20              local    192.168.1.20   kernel     host   eth0 local
  192.168.1.255          broadcast    192.168.1.20   kernel     link   eth0 local
            ::1                                      kernel              lo 
            ::/ 96     unreachable                                       lo 
::ffff:0.0.0.0/ 96     unreachable                                       lo 
    2002:a00::/ 24     unreachable                                       lo 
   2002:7f00::/ 24     unreachable                                       lo 
   2002:a9fe::/ 32     unreachable                                       lo 
   2002:ac10::/ 28     unreachable                                       lo 
   2002:c0a8::/ 32     unreachable                                       lo 
   2002:e000::/ 19     unreachable                                       lo 
   3ffe:ffff::/ 32     unreachable                                       lo 
        fe80::/ 64                                   kernel            eth0 
            ::1              local                   kernel              lo local
fe80::d085:cff:fec7:c1c3              local                   kernel            eth0 local
```

![Print Default Gateway IP Address Or Router IP Address Using routel Command][5]

To print only the default gateway, run routel with `grep` like below:

```
$ routel | grep default
        default      192.168.1.101                   static            eth0
```

#### 5. Find Gateway From Ethernet Configuration Files

If you have **[configured static IP address in your Linux or Unix][6]** system, you can view the default gateway or router IP address by looking at the network configuration files.

In RPM-based systems like Fedora, RHEL, CentOS, AlmaLinux and Rocky Linux, the network interface card (shortly **NIC**) configuration are stored under **/etc/sysconfig/network-scripts/** directory.

Find the name of the network card:

```
# ip link show
```

**Sample output:**

```
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN mode DEFAULT group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
2: eth0@if5: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue state UP mode DEFAULT group default qlen 1000
    link/ether d2:85:0c:c7:c1:c3 brd ff:ff:ff:ff:ff:ff link-netnsid 0
```

The network card name is **eth0**. So let us open the network card configuration of this NIC card file:

```
# cat /etc/sysconfig/network-scripts/ifcfg-eth0
```

**Sample output:**

```
DEVICE=eth0
ONBOOT=yes
UUID=eb6b6a7c-37f5-11ed-a59a-a0e70bdf3dfb
BOOTPROTO=none
IPADDR=192.168.1.20
NETMASK=255.255.255.0
GATEWAY=192.168.1.101
DNS1=8.8.8.8
```

As you see above, the gateway IP is `192.168.1.101`.

In Debian, Ubuntu and its derivatives, all network configuration files are stored under **/etc/network/** directory.

```
$ cat /etc/network/interfaces
```

**Sample output:**

```
auto ens18
iface ens18 inet static
        address 192.168.1.150
        netmask 255.255.255.0
        gateway 192.168.1.101
        dns-nameservers 8.8.8.8
```

Please note that this method should work only if the IP address is configured manually. For DHCP-enabled network, you need to follow the previous 4 methods.

### Conclusion

In this guide, we listed 5 different ways to find default gateway in Linux and Unix operating systems. We also have included sample commands to display the gateway/router IP address in each method. Hope this helps.

--------------------------------------------------------------------------------

via: https://ostechnix.com/find-default-gateway-linux/

作者：[sk][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://ostechnix.com/author/sk/
[b]: https://github.com/lkxed
[1]: https://ostechnix.com/wp-content/uploads/2022/09/Find-Default-Gateway-Using-ip-Command.png
[2]: https://ostechnix.com/the-grep-command-tutorial-with-examples-for-beginners/
[3]: https://ostechnix.com/wp-content/uploads/2022/09/Display-Default-Gateway-IP-Address-Using-route-Command.png
[4]: https://ostechnix.com/wp-content/uploads/2022/09/View-Gateway-IP-Address-Using-netstat-Command.png
[5]: https://ostechnix.com/wp-content/uploads/2022/09/Print-Default-Gateway-IP-Address-Or-Router-IP-Address-Using-routel-Command.png
[6]: https://ostechnix.com/configure-static-ip-address-linux-unix/

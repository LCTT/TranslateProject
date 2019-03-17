[#]: collector: (lujun9972)
[#]: translator: (FSSlc)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How To Find Available Network Interfaces On Linux)
[#]: via: (https://www.ostechnix.com/how-to-find-available-network-interfaces-on-linux/)
[#]: author: (SK https://www.ostechnix.com/author/sk/)

How To Find Available Network Interfaces On Linux
======

![](https://www.ostechnix.com/wp-content/uploads/2019/02/network-interface-720x340.jpeg)

One of the common task we do after installing a Linux system is network configuration. Of course, you can configure network interfaces during the installation time. But, some of you might prefer to do it after installation or change the existing settings. As you know already, you must first know how many interfaces are available on the system in-order to configure network settings from command line. This brief tutorial addresses all the possible ways to find available network interfaces on Linux and Unix operating systems.

### Find Available Network Interfaces On Linux

We can find the available network cards in couple ways.

**Method 1 – Using ‘ifconfig’ Command:**

The most commonly used method to find the network interface details is using **‘ifconfig’** command. I believe some of Linux users might still use this.

```
$ ifconfig -a
```

Sample output:

```
enp5s0: flags=4098<BROADCAST,MULTICAST> mtu 1500
ether 24:b6:fd:37:8b:29 txqueuelen 1000 (Ethernet)
RX packets 0 bytes 0 (0.0 B)
RX errors 0 dropped 0 overruns 0 frame 0
TX packets 0 bytes 0 (0.0 B)
TX errors 0 dropped 0 overruns 0 carrier 0 collisions 0

lo: flags=73<UP,LOOPBACK,RUNNING> mtu 65536
inet 127.0.0.1 netmask 255.0.0.0
inet6 ::1 prefixlen 128 scopeid 0x10<host>
loop txqueuelen 1000 (Local Loopback)
RX packets 171420 bytes 303980988 (289.8 MiB)
RX errors 0 dropped 0 overruns 0 frame 0
TX packets 171420 bytes 303980988 (289.8 MiB)
TX errors 0 dropped 0 overruns 0 carrier 0 collisions 0

wlp9s0: flags=4163<UP,BROADCAST,RUNNING,MULTICAST> mtu 1500
inet 192.168.225.37 netmask 255.255.255.0 broadcast 192.168.225.255
inet6 2409:4072:6183:c604:c218:85ff:fe50:474f prefixlen 64 scopeid 0x0<global>
inet6 fe80::c218:85ff:fe50:474f prefixlen 64 scopeid 0x20<link>
ether c0:18:85:50:47:4f txqueuelen 1000 (Ethernet)
RX packets 564574 bytes 628671925 (599.5 MiB)
RX errors 0 dropped 0 overruns 0 frame 0
TX packets 299706 bytes 60535732 (57.7 MiB)
TX errors 0 dropped 0 overruns 0 carrier 0 collisions 0
```

As you see in the above output, I have two network interfaces namely **enp5s0** (on board wired ethernet adapter) and **wlp9s0** (wireless network adapter) on my Linux box. Here, **lo** is loopback interface, which is used to access all network services locally. It has an ip address of 127.0.0.1.

We can also use the same ‘ifconfig’ command in many UNIX variants, for example **FreeBSD** , to list available network cards.

**Method 2 – Using ‘ip’ Command:**

The ‘ifconfig’ command is deprecated in the latest Linux versions. So you can use **‘ip’** command to display the network interfaces as shown below.

```
$ ip link show
```

Sample output:

```
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN mode DEFAULT group default qlen 1000
 link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
2: enp5s0: <BROADCAST,MULTICAST> mtu 1500 qdisc noop state DOWN mode DEFAULT group default qlen 1000
 link/ether 24:b6:fd:37:8b:29 brd ff:ff:ff:ff:ff:ff
3: wlp9s0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue state UP mode DORMANT group default qlen 1000
 link/ether c0:18:85:50:47:4f brd ff:ff:ff:ff:ff:ff
```

![](https://www.ostechnix.com/wp-content/uploads/2019/02/ip-command.png)

You can also use the following commands as well.

```
$ ip addr

$ ip -s link
```

Did you notice that these command also shows the connected state of the network interfaces? If you closely look at the above output, you will notice that my Ethernet card is not connected with network cable (see the word **“DOWN”** in the above output). And wireless network card is connected (See the word **“UP”** ). For more details, check our previous guide to [**find the connected state of network interfaces on Linux**][1].

These two commands (ifconfig and ip) are just enough to find the available network cards on your Linux systems.

However, there are few other methods available to list network interfaces on Linux. Here you go.

**Method 3:**

The Linux Kernel saves the network interface details inside **/sys/class/net** directory. You can verify the list of available interfaces by looking into this directory.

```
$ ls /sys/class/net
```

Output:

```
enp5s0 lo wlp9s0
```

**Method 4:**

In Linux operating systems, **/proc/net/dev** file contains statistics about network interfaces.

To view the available network cards, just view its contents using command:

```
$ cat /proc/net/dev
```

Output:

```
Inter-| Receive | Transmit
face |bytes packets errs drop fifo frame compressed multicast|bytes packets errs drop fifo colls carrier compressed
wlp9s0: 629189631 566078 0 0 0 0 0 0 60822472 300922 0 0 0 0 0 0
enp5s0: 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
lo: 303980988 171420 0 0 0 0 0 0 303980988 171420 0 0 0 0 0 0
```

**Method 5: Using ‘netstat’ command**

The **netstat** command displays various details such as network connections, routing tables, interface statistics, masquerade connections, and multicast memberships.

```
$ netstat -i
```

**Sample output:**

```
Kernel Interface table
Iface MTU RX-OK RX-ERR RX-DRP RX-OVR TX-OK TX-ERR TX-DRP TX-OVR Flg
lo 65536 171420 0 0 0 171420 0 0 0 LRU
wlp9s0 1500 565625 0 0 0 300543 0 0 0 BMRU
```

Please be mindful that netstat is obsolete. The Replacement for “netstat -i” is “ip -s link”. Also note that this method will list only the active interfaces, not all available interfaces.

**Method 6: Using ‘nmcli’ command**

The nmcli is nmcli is a command-line tool for controlling NetworkManager and reporting network status. It is used to create, display, edit, delete, activate, and deactivate network connections and display network status.

If you have Linux system with Network Manager installed, you can list the available network interfaces using nmcli tool using the following commands:

```
$ nmcli device status
```

Or,

```
$ nmcli connection show
```

You know now how to find the available network interfaces on Linux. Next, check the following guides to know how to configure IP address on Linux.

[How To Configure Static IP Address In Linux And Unix][2]

[How To Configure IP Address In Ubuntu 18.04 LTS][3]

[How To Configure Static And Dynamic IP Address In Arch Linux][4]

[How To Assign Multiple IP Addresses To Single Network Card In Linux][5]

If you know any other quick ways to do it, please share them in the comment section below. I will check and update the guide with your inputs.

And, that’s all. More good stuffs to come. Stay tuned!

Cheers!



--------------------------------------------------------------------------------

via: https://www.ostechnix.com/how-to-find-available-network-interfaces-on-linux/

作者：[SK][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.ostechnix.com/author/sk/
[b]: https://github.com/lujun9972
[1]: https://www.ostechnix.com/how-to-find-out-the-connected-state-of-a-network-cable-in-linux/
[2]: https://www.ostechnix.com/configure-static-ip-address-linux-unix/
[3]: https://www.ostechnix.com/how-to-configure-ip-address-in-ubuntu-18-04-lts/
[4]: https://www.ostechnix.com/configure-static-dynamic-ip-address-arch-linux/
[5]: https://www.ostechnix.com/how-to-assign-multiple-ip-addresses-to-single-network-card-in-linux/

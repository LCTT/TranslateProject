[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Why you need to drop ifconfig for ip)
[#]: via: (https://opensource.com/article/21/1/ifconfig-ip-linux)
[#]: author: (Rajan Bhardwaj https://opensource.com/users/rajabhar)

Why you need to drop ifconfig for ip
======
Start using the modern method for configuring a Linux network interface.
![Tips and gears turning][1]

For a long time, the `ifconfig` command was the default method for configuring a network interface. It served Linux users well, but networking is complex, and the commands to configure it must be robust. The `ip` command is the new default networking command for modern systems, and in this article, I'll show you how to use it.

The `ip` command is functionally organized on two layers of the [OSI networking stack][2]: Layer 2 (data link layer) and Layer 3 (network or IP layer). It does all the work in the old `net-tools` package.

### Installing ip

The `ip` command is included in the `iproute2util` package. It's probably already included in your Linux distribution. If it's not, you can install it from your distro's software repository.

### Comparing ipconfig and ip usage

The `ip` and `ipconfic` commands can be used to configure a network interface, but they do things differently. I'll compare how to do common tasks with the old (`ipconfig`) and new (`ip`) commands.

#### View network interface and IP address

If you want to see the IP address of a host or view network interface information, the old `ifconfig` command, with no arguments, provides a good summary:


```
$ ifconfig
                                                                                                
eth0: flags=4099&lt;UP,BROADCAST,MULTICAST&gt;  mtu 1500                                                                 
       ether bc:ee:7b:5e:7d:d8  txqueuelen 1000  (Ethernet)                                                       
       RX packets 0  bytes 0 (0.0 B)
       RX errors 0  dropped 0  overruns 0  frame 0
       TX packets 0  bytes 0 (0.0 B)
       TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

lo: flags=73&lt;UP,LOOPBACK,RUNNING&gt;  mtu 65536
       inet 127.0.0.1  netmask 255.0.0.0
       inet6 ::1  prefixlen 128  scopeid 0x10&lt;host&gt;
       loop  txqueuelen 1000  (Local Loopback)
       RX packets 41  bytes 5551 (5.4 KiB)
       RX errors 0  dropped 0  overruns 0  frame 0
       TX packets 41  bytes 5551 (5.4 KiB)
       TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

wlan0: flags=4163&lt;UP,BROADCAST,RUNNING,MULTICAST&gt;  mtu 1500
       inet 10.1.1.6  netmask 255.255.255.224  broadcast 10.1.1.31
       inet6 fdb4:f58e:49f:4900:d46d:146b:b16:7212  prefixlen 64  scopeid 0x0&lt;global&gt;
       inet6 fe80::8eb3:4bc0:7cbb:59e8  prefixlen 64  scopeid 0x20&lt;link&gt;
       ether 08:71:90:81:1e:b5  txqueuelen 1000  (Ethernet)
       RX packets 569459  bytes 779147444 (743.0 MiB)
       RX errors 0  dropped 0  overruns 0  frame 0
       TX packets 302882  bytes 38131213 (36.3 MiB)
       TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0
```

The new `ip` command provides similar results, but the command is `ip address show`, or just `ip a` for short:


```
$ ip a

1: lo: &lt;LOOPBACK,UP,LOWER_UP&gt; mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
   link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
   inet 127.0.0.1/8 scope host lo
      valid_lft forever preferred_lft forever
   inet6 ::1/128 scope host  
      valid_lft forever preferred_lft forever
2: eth0: &lt;NO-CARRIER,BROADCAST,MULTICAST,UP&gt; mtu 1500 qdisc pfifo_fast state DOWN group default qlen 1000
   link/ether bc:ee:7b:5e:7d:d8 brd ff:ff:ff:ff:ff:ff
3: wlan0: &lt;BROADCAST,MULTICAST,UP,LOWER_UP&gt; mtu 1500 qdisc noqueue state UP group default qlen 1000
   link/ether 08:71:90:81:1e:b5 brd ff:ff:ff:ff:ff:ff
   inet 10.1.1.6/27 brd 10.1.1.31 scope global dynamic wlan0
      valid_lft 83490sec preferred_lft 83490sec
   inet6 fdb4:f58e:49f:4900:d46d:146b:b16:7212/64 scope global noprefixroute dynamic  
      valid_lft 6909sec preferred_lft 3309sec
   inet6 fe80::8eb3:4bc0:7cbb:59e8/64 scope link  
      valid_lft forever preferred_lft forever
```

#### Add IP address

To add an IP address to an interface with `ifconfig`, the command is:


```
`$ ifconfig eth0 add 192.9.203.21`
```

The command is similar for `ip`:


```
`$ ip address add 192.9.203.21 dev eth0`
```

Subcommands in `ip` can be shortened, so this command is equally valid:


```
`$ ip addr add 192.9.203.21 dev eth0`
```

You can make it even shorter:


```
`$ ip a add 192.9.203.21 dev eth0`
```

#### Remove an IP address

The inverse of adding an IP address is to remove one.

With `ifconfig`, the syntax is:


```
`$ ifconfig eth0 del 192.9.203.21`
```

The `ip` command syntax is:


```
`$ ip a del 192.9.203.21 dev eth0`
```

#### Enable or disable multicast

Enabling (or disabling) [multicast][3] on an interface with `ifconfig` happens with the `multicast` argument:


```
`# ifconfig eth0 multicast`
```

With `ip`, use the `set` subcommand with the device (`dev`) and a Boolean or toggle `multicast` option:


```
`# ip link set dev eth0 multicast on`
```

#### Enable or disable a network

Every sysadmin is familiar with the old "turn it off and then on again" trick to fix a problem. In terms of networking interfaces, that translates to bringing a network up or down.

The `ifconfig` command does this with the `up` or `down` keywords:


```
`# ifconfig eth0 up`
```

Or you could use a dedicated command:


```
`# ifup eth0`
```

The `ip` command uses the `set` subcommand to set the interface to an `up` or `down` state:


```
`# ip link set eth0 up`
```

#### Enable or disable the Address Resolution Protocol (ARP)

With `ifconfig`, you enable ARP by declaring it:


```
`# ifconfig eth0 arp`
```

With `ip`, you _set_ the `arp` property as `on` or `off`:


```
`# ip link set dev eth0 arp on`
```

### Pros and cons of ip and ipconfig

The `ip` command is more versatile and technically more efficient than `ifconfig` because it uses `Netlink` sockets rather than `ioctl` system calls.

The `ip` command may appear more verbose and more complex than `ifconfig`, but that's one reason it's more versatile. Once you start using it, you'll get a feel for its internal logic (for instance, using `set` instead of a seemingly arbitrary mix of declarations or settings).

Ultimately, `ifconfig` is outdated (for instance, it lacks full support for network namespaces), and `ip` is designed for the modern network. Try it out, learn it, use it. You'll be glad you did!

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/1/ifconfig-ip-linux

作者：[Rajan Bhardwaj][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/rajabhar
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/gears_devops_learn_troubleshooting_lightbulb_tips_520.png?itok=HcN38NOk (Tips and gears turning)
[2]: https://en.wikipedia.org/wiki/OSI_model
[3]: https://en.wikipedia.org/wiki/Multicast

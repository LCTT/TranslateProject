translating by lujun9972
12 ip Command Examples for Linux Users
======
For years & years we have been using ' **ifconfig** ' command to perform network related tasks like checking network interfaces or configuring them. But 'ifconfig' is no longer being maintained & has been deprecated on the recent versions of Linux. 'ifconfig' command has been replaced with ' **ip** ' command.

'ip' command is somewhat similar to 'ifconfig' command but it's much more powerful with much more functionalities attached to it. 'ip' command is able to perform several tasks which were not possible to perform with 'ifconfig' command.

[![IP-command-examples-Linux][1]![IP-command-examples-Linux][2]][3]

In this tutorial, we are going to discuss 12 most common uses for 'ip' command, so let's get going,

#### Example 1: Checking network information for interfaces ( LAN Cards )

To check the network information like IP address, Subnet etc for the interfaces, use 'ip addr show' command
```
[linuxtechi@localhost]$ ip addr show

or

[linuxtechi@localhost]$ ip a s
```

This will show network information related to all interfaces available on our system, but if we want to view same information for single interface, command is
```
[linuxtechi@localhost]$ ip addr show enp0s3
```

where enp0s3 is the name of the interface.

[![IP-addr-show-commant-output][1]![IP-addr-show-commant-output][4]][5]

#### Example 2: Enabling & disabling a network interface

To enable a disable network interface, 'ip' command used is
```
[linuxtechi@localhost]$ sudo ip link set enp0s3 up
```

& to disable the network interface we will use 'down' trigger,
```
[linuxtechi@localhost]$ sudo ip link set enp0s3 down
```

#### Example 3: Assigning IP address & other network information to an interface

To assign IP address to interface, we will use
```
[linuxtechi@localhost]$ sudo ip addr add 192.168.0.50/255.255.255.0 dev enp0s3
```

We can also set broadcast address to interface with 'ip' command. By default no broadcast address is set, so to set a broadcast address command is
```
[linuxtechi@localhost]$ sudo  ip addr add broadcast 192.168.0.255 dev enp0s3
```

We can also set standard broadcast address along with IP address by using the following command,
```
[linuxtechi@localhost]$  sudo ip addr add 192.168.0.10/24 brd + dev enp0s3
```

As shown in the above example, we can also use 'brd' in place on 'broadcast' to set broadcast ip address.

#### Example 4: Removing IP address from interface

If we want to flush or remove the assigned IP from interface, then the beneath ip command
```
[linuxtechi@localhost]$ sudo ip addr del 192.168.0.10/24 dev enp0s3
```

#### Example 5: Adding an Alias for an  interface (enp0s3)

To add an alias i.e. assign more than one IP to an interface, execute below command
```
[linuxtechi@localhost]$  sudo ip addr add 192.168.0.20/24 dev enp0s3 label enp0s3:1
```

[![ip-command-add-alias-linux][1]![ip-command-add-alias-linux][6]][7]

#### Example 6: Checking route or default gateway information

Checking routing information shows us the route a packet will take to reach the destination. To check the network routing information, execute the following command,
```
[linuxtechi@localhost]$  ip route show
```

[![ip-route-command-output][1]![ip-route-command-output][8]][9]

In the output we will see the routing information for packets for all the network interfaces. We can also get the routing information to a particular ip using,
```
[linuxtechi@localhost]$ sudo ip route get 192.168.0.1
```

#### Example 7: Adding a static route

If we want to change the default route taken by packets, we can do so with IP command. To assign a default gateway, use following 'ip route' command
```
[linuxtechi@localhost]$ sudo ip route add default via 192.168.0.150/24
```

So now all network packets will travel via 192.168.0.150 as opposed to old default route. For changing the default route for a single interface & to make change route further, execute
```
[linuxtechi@localhost]$ sudo ip route add 172.16.32.32 via 192.168.0.150/24 dev enp0s3
```

#### Example 8: Removing a static route

To remove the a previously changes default route, open terminal & run,
```
[linuxtechi@localhost]$  sudo ip route del 192.168.0.150/24
```

**Note:-** Changes made to default route using the above mentioned commands are only temporary  & all changes will be lost after a system has been restarted. To make a persistence route change, we need to modify / create route-enp0s3 file . Add the following line to it, demonstration is shown below
```
[linuxtechi@localhost]$  sudo vi /etc/sysconfig/network-scripts/route-enp0s3

172.16.32.32 via 192.168.0.150/24 dev enp0s3
```

Save and Exit the file.

If you are using Ubuntu or debian based OS, than the location of the file is ' **/etc/network/interfaces** ' and add the line "ip route add 172.16.32.32 via 192.168.0.150/24 dev enp0s3" to the bottom of the file.

#### Example 9: Checking all ARP entries

ARP, short for ' **Address Resolution Protocol** ' , is used to convert an IP address to physical address (also known as MAC address) & all the IP and their corresponding MAC details are stored in a table known as ARP cache.

To view entries in ARP cache i.e. MAC addresses of the devices connected in LAN, the IP command used is
```
[linuxtechi@localhost]$  ip neigh
```

[![ip-neigh-command-linux][1]![ip-neigh-command-linux][10]][11]

#### Example 10: Modifying ARP entries

To delete an ARP entry, the command used is
```
[linuxtechi@localhost]$ sudo ip neigh del 192.168.0.106 dev enp0s3
```

or if we want to add a new entry to ARP cache, the command is
```
[linuxtechi@localhost]$ sudo ip neigh add 192.168.0.150 lladdr 33:1g:75:37:r3:84 dev enp0s3 nud perm
```

where **nud** means **neighbour state** , it can be

  * **perm** - permanent & can only be removed by administrator,
  * **noarp** - entry is valid but can be removed after lifetime expires,
  * **stale** - entry is valid but suspicious,
  * **reachable** - entry is valid until timeout expires.



#### Example 11: Checking network statistics

With 'ip' command we can also view the network statistics like bytes and packets transferred, errors or dropped packets etc for all the network interfaces. To view network statistics, use ' **ip -s link** ' command
```
[linuxtechi@localhost]$ ip -s link
```

[![ip-s-command-linux][1]![ip-s-command-linux][12]][13]

#### Example 12: How to get help

If you want to find a option which is not listed in above examples, then you can look for help. In Fact you can use help for all the commands. To list all available options that can be used with 'ip' command, use
```
[linuxtechi@localhost]$ ip help
```

Remember that 'ip' command is very important command for Linux admins and it should be learned and mastered to configure network with ease. That's it for now, please do provide your suggestions & leave your queries in the comment box below.

--------------------------------------------------------------------------------

via: https://www.linuxtechi.com/ip-command-examples-for-linux-users/

作者：[Pradeep Kumar][a]
译者：[lujun9972](https://github.com/lujun9972)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linuxtechi.com/author/pradeep/
[1]:https://www.linuxtechi.com/wp-content/plugins/lazy-load/images/1x1.trans.gif
[2]:https://www.linuxtechi.com/wp-content/uploads/2017/09/IP-command-examples-Linux.jpg
[3]:https://www.linuxtechi.com/wp-content/uploads/2017/09/IP-command-examples-Linux.jpg ()
[4]:https://www.linuxtechi.com/wp-content/uploads/2017/09/IP-addr-show-commant-output.jpg
[5]:https://www.linuxtechi.com/wp-content/uploads/2017/09/IP-addr-show-commant-output.jpg ()
[6]:https://www.linuxtechi.com/wp-content/uploads/2017/09/ip-command-add-alias-linux.jpg
[7]:https://www.linuxtechi.com/wp-content/uploads/2017/09/ip-command-add-alias-linux.jpg ()
[8]:https://www.linuxtechi.com/wp-content/uploads/2017/09/ip-route-command-output.jpg
[9]:https://www.linuxtechi.com/wp-content/uploads/2017/09/ip-route-command-output.jpg ()
[10]:https://www.linuxtechi.com/wp-content/uploads/2017/09/ip-neigh-command-linux.jpg
[11]:https://www.linuxtechi.com/wp-content/uploads/2017/09/ip-neigh-command-linux.jpg ()
[12]:https://www.linuxtechi.com/wp-content/uploads/2017/09/ip-s-command-linux.jpg
[13]:https://www.linuxtechi.com/wp-content/uploads/2017/09/ip-s-command-linux.jpg ()

[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Four Methods To Check The Default Gateway Or Router IP Address In Linux?)
[#]: via: (https://www.2daygeek.com/check-find-default-gateway-or-router-ip-address-in-linux/)
[#]: author: (Magesh Maruthamuthu https://www.2daygeek.com/author/magesh/)

Four Methods To Check The Default Gateway Or Router IP Address In Linux?
======

Your default gateway is the IP address of your router that you should aware of that.

Typically this is automatically detected by your operating system during installation, if not then you may need to change it.

If your system not able to ping self then probable it could be a gateway issue and you have to fix it.

This might happen if you have multiple network adapters or routers on the network.

A gateway is a router that acts as an access point to passes network data from one networks to another networks.

The below articles will help you to gather some other information which is similar to this topic.

  * **[9 Methods To Check Your Public IP Address In Linux Command Line][1]**
  * **[How To Enable (UP) And Disable (DOWN) A Network Interface Port (NIC) In Linux?][2]**



This can be done using below Four commands.

  * **`route Command:`** route command is used to show and manipulate the IP routing table.
  * **`ip Command:`** IP command is similar to ifconfig, which is very familiar for assigning Static IP Address, Route  & Default Gateway, etc.,.
  * **`netstat Command:`** netstat (“network statistics”) is a command-line tool that displays network connections related information (both incoming and outgoing) such as routing tables, masquerade connections, multicast memberships and a number of network interface
  * **`routel Command:`** routel command is used to list routes with pretty output format.



### 1) How To Check The Default Gateway Or Router IP Address In Linux Using route Command?

route command is used to show and manipulate the IP routing table.

Its primary use is to set up static routes to specific hosts or networks via an interface once the interface was configured.

When the add or del options are used, route modifies the routing tables. Without these options, route displays the current contents of the routing tables.

```
# route
or
# route -n

Kernel IP routing table
Destination     Gateway         Genmask         Flags Metric Ref    Use Iface
default         www.routerlogin 0.0.0.0         UG    600    0        0 wlp8s0
192.168.1.0     0.0.0.0         255.255.255.0   U     600    0        0 wlp8s0
```

### 2) How To Check The Default Gateway Or Router IP Address In Linux Using ip Command?

**[IP command][3]** is similar to ifconfig, which is very familiar for assigning Static IP Address, Route  & Default Gateway, etc.,.

ifconfig command was deprecated due to no maintenance since so many years, even though it is still available on most Linux distributions.

ifconfig command has been replaced by IP command which is very powerful and performing several network administration tasks with one command.

IP command utility bundled with iproute2 package. By default iproute2 utility pre-installed all the major Linux distribution.

If no, you can install it by issuing iproute2 on your terminal with help of package manager.

```
# ip r
or
# ip route
or
# ip route show

default via 192.168.1.1 dev wlp8s0 proto dhcp metric 600
192.168.1.0/24 dev wlp8s0 proto kernel scope link src 192.168.1.6 metric 600
```

### 3) How To Check The Default Gateway Or Router IP Address In Linux Using netstat Command?

netstat stands for Network Statistics, is a command-line tool that displays network connections related information (both incoming and outgoing) such as routing tables, masquerade connections, multicast memberships and a number of network interface.

It lists out all the tcp, udp socket connections and the unix socket connections.

It is used for diagnosing network problems in the network and to determine the amount of traffic on the network as a performance measurement.

```
# netstat -r

Kernel IP routing table
Destination     Gateway         Genmask         Flags   MSS Window  irtt Iface
default         www.routerlogin 0.0.0.0         UG        0 0          0 wlp8s0
192.168.1.0     0.0.0.0         255.255.255.0   U         0 0          0 wlp8s0
```

### 4) How To Check The Default Gateway Or Router IP Address In Linux Using routel Command?

It used to list routes with pretty output format. These programs are a set of helper scripts you can use instead of raw iproute2 commands.

The routel script will list routes in a format that some might consider easier to interpret then the ip route list equivalent.

The routef script does not take any arguments and will simply flush the routing table down the drain. Beware! This means deleting all routes which will make your network unusable!

```
# routel
         target            gateway          source    proto    scope    dev tbl
        default        192.168.1.1                     dhcp          wlp8s0
   192.168.1.0/ 24                     192.168.1.6   kernel     link wlp8s0
      127.0.0.0          broadcast       127.0.0.1   kernel     link     lo local
     127.0.0.0/ 8            local       127.0.0.1   kernel     host     lo local
      127.0.0.1              local       127.0.0.1   kernel     host     lo local
127.255.255.255          broadcast       127.0.0.1   kernel     link     lo local
    192.168.1.0          broadcast     192.168.1.6   kernel     link wlp8s0 local
    192.168.1.6              local     192.168.1.6   kernel     host wlp8s0 local
  192.168.1.255          broadcast     192.168.1.6   kernel     link wlp8s0 local
            ::1                                      kernel              lo
        fe80::/ 64                                   kernel          wlp8s0
            ::1              local                   kernel              lo local
fe80::ad00:2f7e:d882:5add              local                   kernel          wlp8s0 local
        ff00::/ 8                                                    wlp8s0 local
```

If you would like to print only default gateway then use the following format.

```
# routel | grep default
        default        192.168.1.1                     dhcp          wlp8s0
```

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/check-find-default-gateway-or-router-ip-address-in-linux/

作者：[Magesh Maruthamuthu][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/magesh/
[b]: https://github.com/lujun9972
[1]: https://www.2daygeek.com/check-find-server-public-ip-address-linux/
[2]: https://www.2daygeek.com/enable-disable-up-down-nic-network-interface-port-linux-using-ifconfig-ifdown-ifup-ip-nmcli-nmtui/
[3]: https://www.2daygeek.com/ip-command-configure-network-interface-usage-linux/

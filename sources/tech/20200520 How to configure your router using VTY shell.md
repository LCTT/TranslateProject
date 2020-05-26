[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to configure your router using VTY shell)
[#]: via: (https://opensource.com/article/20/5/vty-shell)
[#]: author: (M Umer https://opensource.com/users/noisybotnet)

How to configure your router using VTY shell
======
Free range routing gives you options for implementing multiple
protocols. This guide will get you started.
![Multi-colored and directional network computer cables][1]

Recently, I wrote an article explaining how we can implement Open Shortest Path First (OSPF) using the [Quagga][2] routing suite. There are multiple software suites that can be used instead of Quagga to implement different routing protocols. One such option is free range routing (FRR).

### FRR

[FRR][3] is a routing software suite, which has been derived from Quagga and is distributed under GNU GPL2 license. Like Quagga, it provides implementations of all major routing protocols such as OSPF, Routing Information Protocol (RIP), Border Gateway Protocol (BGP), and Intermediate system-to-intermediate system (IS-IS) for Unix-like platforms.

Several companies, such as Big Switch Networks, Cumulus, Open Source Routing, and 6wind, who were behind the development of Quagga, created FRR to improve on Quagga's well-established foundations.

#### Architecture

FRR is a suite of daemons that work together to build the routing table. Each major protocol is implemented in its own daemon, and these daemons talk to the core and protocol-independent daemon Zebra, which provides kernel routing table updates, interface lookups, and redistribution of routes between different routing protocols. Each protocol-specific daemon is responsible for running the relevant protocol and building the routing table based on the information exchanged.

![FRR architecture][4]

### VTY shell

[VTYSH][5] is an integrated shell for the FRR routing engine. It amalgamates all the CLI commands defined in each of the daemons and presents them to the user in a single shell. It provides a Cisco-like modal CLI, and many of the commands are similar to Cisco IOS commands. There are different modes to the CLI, and certain commands are only available within a specific mode.

### Setup

In this tutorial, we'll be implementing the routing information protocol (RIP) to configure dynamic routing using FRR. We can do this in two ways—either by editing the protocol daemon configuration file in an editor or by using the VTY shell. We'll be using the VTY shell in this example. Our setup includes two CentOS 7.7 hosts, named Alpha and Beta. Both hosts have two network interfaces and share access to the 192.168.122.0/24 network. We'll be advertising routes for 10.12.11.0/24 and 10.10.10.0/24 networks.

**For Host Alpha:**

  * eth0 IP: 192.168.122.100/24
  * Gateway: 192.168.122.1
  * eth1 IP: 10.10.10.12/24



**For Host Beta:**

  * eth0 IP: 192.168.122.50/24
  * Gateway: 192.168.122.1
  * eth1 IP: 10.12.11.12/24



#### Installation of package

First, we need to install the FRR package on both hosts; this can be done by following the instructions in the [official FRR documentation][6].

#### Enable IP forwarding

For routing, we need to enable IP forwarding on both hosts since that will performed by the Linux kernel.


```
sysctl -w net.ipv4.conf.all.forwarding = 1

sysctl -w net.ipv6.conf.all.forwarding = 1
sysctl -p
```

#### Enabling the RIPD daemon

Once installed, all the configuration files will be stored in the **/etc/frr** directory. The daemons must be explicitly enabled by editing the **/etc/frr/daemons** file. This file determines which daemons are activated when the FRR service is started. To enable a particular daemon, simply change the corresponding "no" to "yes." A subsequent service restart should start the daemon.

![FRR daemon restart][7]

#### Firewall configuration

Since RIP protocol uses UDP as its transport protocol and is assigned port 520, we need to allow this port in `firewalld` configuration.


```
firewall-cmd --add-port=520/udp –permanent

firewalld-cmd -reload
```

We can now start the FRR service using:


```
`systemctl start frr`
```

#### Configuration using VTY

Now, we need to configure RIP using the VTY shell.

On Host Alpha:


```
[root@alpha ~]# vtysh

Hello, this is FRRouting (version 7.2RPKI).
Copyright 1996-2005 Kunihiro Ishiguro, et al.

alpha# configure terminal
alpha(config)# router rip
alpha(config-router)# network 192.168.122.0/24
alpha(config-router)# network 10.10.10.0/24
alpha(config-router)# route 10.10.10.5/24
alpha(config-router)# do write
Note: this version of vtysh never writes vtysh.conf
Building Configuration...
Configuration saved to /etc/frr/ripd.conf
Configuration saved to /etc/frr/staticd.conf
alpha(config-router)# do write memory
Note: this version of vtysh never writes vtysh.conf
Building Configuration...
Configuration saved to /etc/frr/ripd.conf
Configuration saved to /etc/frr/staticd.conf
alpha(config-router)# exit
```

Similarly, on Host Beta:


```
[root@beta ~]# vtysh

Hello, this is FRRouting (version 7.2RPKI).
Copyright 1996-2005 Kunihiro Ishiguro, et al.

beta# configure terminal
beta(config)# router rip
beta(config-router)# network 192.168.122.0/24
beta(config-router)# network 10.12.11.0/24
beta(config-router)# do write
Note: this version of vtysh never writes vtysh.conf
Building Configuration...
Configuration saved to /etc/frr/zebra.conf
Configuration saved to /etc/frr/ripd.conf
Configuration saved to /etc/frr/staticd.conf
beta(config-router)# do write memory
Note: this version of vtysh never writes vtysh.conf
Building Configuration...
Configuration saved to /etc/frr/zebra.conf
Configuration saved to /etc/frr/ripd.conf
Configuration saved to /etc/frr/staticd.conf
beta(config-router)# exit
```

Once done, check the routes on both hosts as follows:


```
[root@alpha ~]# ip route show
default via 192.168.122.1 dev eth0 proto static metric 100
10.10.10.0/24 dev eth1 proto kernel scope link src 10.10.10.12 metric 101
10.12.11.0/24 via 192.168.122.50 dev eth0 proto 189 metric 20
192.168.122.0/24 dev eth0 proto kernel scope link src 192.168.122.100 metric 100
```

We can see that the routing table on Alpha contains an entry of 10.12.11.0/24 via 192.168.122.50, which was offered through RIP. Similarly, on Beta, the table contains an entry of network 10.10.10.0/24 via 192.168.122.100.


```
[root@beta ~]# ip route show
default via 192.168.122.1 dev eth0 proto static metric 100
10.10.10.0/24 via 192.168.122.100 dev eth0 proto 189 metric 20
10.12.11.0/24 dev eth1 proto kernel scope link src 10.12.11.12 metric 101
192.168.122.0/24 dev eth0 proto kernel scope link src 192.168.122.50 metric 100
```

### Conclusion

As you can see, the setup and configuration are relatively simple. To add complexity, we can add more network interfaces to the router to provide routing for more networks. The configurations can be made by editing the configuration files in an editor, but using VTY shell provides us a frontend to all FRR daemons in a single, combined session.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/5/vty-shell

作者：[M Umer][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/noisybotnet
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/connections_wires_sysadmin_cable.png?itok=d5WqHmnJ (Multi-colored and directional network computer cables)
[2]: https://opensource.com/article/20/4/quagga-linux
[3]: https://en.wikipedia.org/wiki/FRRouting
[4]: https://opensource.com/sites/default/files/uploads/frr_architecture.png (FRR architecture)
[5]: http://docs.frrouting.org/projects/dev-guide/en/latest/vtysh.html
[6]: http://docs.frrouting.org/projects/dev-guide/en/latest/building-frr-for-centos7.html
[7]: https://opensource.com/sites/default/files/uploads/frr_daemon_restart.png (FRR daemon restart)

How To Setup Bridge (br0) Network on Ubuntu Linux 14.04 and 16.04 LTS
=======================================================================

> am a new Ubuntu Linux 16.04 LTS user. How do I setup a network bridge on the host server powered by Ubuntu 14.04 LTS or 16.04 LTS operating system?

![](http://s0.cyberciti.org/images/category/old/ubuntu-logo.jpg)

A Bridged networking is nothing but a simple technique to connect to the outside network through the physical interface. It is useful for LXC/KVM/Xen/Containers virtualization and other virtual interfaces. The virtual interfaces appear as regular hosts to the rest of the network. In this tutorial I will explain how to configure a Linux bridge with bridge-utils (brctl) command line utility on Ubuntu server.

### Our sample bridged networking

![](http://s0.cyberciti.org/uploads/faq/2016/07/my-br0-br1-setup.jpg)
>Fig.01: Sample Ubuntu Bridged Networking Setup For Kvm/Xen/LXC Containers (br0)

In this example eth0 and eth1 is the physical network interface. eth0 connected to the LAN and eth1 is attached to the upstream ISP router/Internet.

### Install bridge-utils

Type the following [apt-get command][1] to install the bridge-utils:

```
$ sudo apt-get install bridge-utils
```

OR

````
$ sudo apt install bridge-utils
```

Sample outputs:

![](http://s0.cyberciti.org/uploads/faq/2016/07/ubuntu-install-bridge-utils.jpg)
>Fig.02: Ubuntu Linux install bridge-utils package

### Creating a network bridge on the Ubuntu server

Edit `/etc/network/interfaces` using a text editor such as nano or vi, enter:

```
$ sudo cp /etc/network/interfaces /etc/network/interfaces.bakup-1-july-2016
$ sudo vi /etc/network/interfaces
```

Let us setup eth1 and map it to br1, enter (delete or comment out all eth1 entries):

```
# br1 setup with static wan IPv4 with ISP router as gateway
auto br1
iface br1 inet static
        address 208.43.222.51
        network 255.255.255.248
        netmask 255.255.255.0
        broadcast 208.43.222.55
        gateway 208.43.222.49
        bridge_ports eth1
        bridge_stp off
        bridge_fd 0
        bridge_maxwait 0
```

To setup eth0 and map it to br0, enter (delete or comment out all eth1 entries):

```
auto br0
iface br0 inet static
        address 10.18.44.26
        netmask 255.255.255.192
        broadcast 10.18.44.63
        dns-nameservers 10.0.80.11 10.0.80.12
        # set static route for LAN
	post-up route add -net 10.0.0.0 netmask 255.0.0.0 gw 10.18.44.1
	post-up route add -net 161.26.0.0 netmask 255.255.0.0 gw 10.18.44.1
        bridge_ports eth0
        bridge_stp off
        bridge_fd 0
        bridge_maxwait 0
```

### A note about br0 and DHCP

DHCP config options:

```
auto br0
iface br0 inet dhcp
        bridge_ports eth0
        bridge_stp off
        bridge_fd 0
        bridge_maxwait 0
```

Save and close the file.

### Restart the server or networking service

You need to reboot the server or type the following command to restart the networking service (this may not work on SSH based session):

```
$ sudo systemctl restart networking
```

If you are using Ubuntu 14.04 LTS or older not systemd based system, enter:

```
$ sudo /etc/init.d/restart networking
```

### Verify connectivity

Use the ping/ip commands to verify that both LAN and WAN interfaces are reachable:
```
# See br0 and br1
ip a show
# See routing info
ip r
# ping public site
ping -c 2 cyberciti.biz
# ping lan server
ping -c 2 10.0.80.12
```

Sample outputs:

![](http://s0.cyberciti.org/uploads/faq/2016/07/br0-br1-eth0-eth1-configured-on-ubuntu.jpg)
>Fig.03: Verify Bridging Ethernet Connections

Now, you can configure XEN/KVM/LXC containers to use br0 and br1 to reach directly to the internet or private lan. No need to setup special routing or iptables SNAT rules.


--------------------------------------------------------------------------------

via: http://www.cyberciti.biz/faq/how-to-create-bridge-interface-ubuntu-linux/

作者：[VIVEK GITE][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://twitter.com/nixcraft
[1]:　http://www.cyberciti.biz/tips/linux-debian-package-management-cheat-sheet.html


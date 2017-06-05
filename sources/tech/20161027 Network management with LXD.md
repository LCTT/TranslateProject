# Network management with LXD (2.3+)

 ![LXD logo](https://linuxcontainers.org/static/img/containers.png) 

### Introduction


When LXD 2.0 shipped with Ubuntu 16.04, LXD networking was pretty simple. You could either use that “lxdbr0” bridge that “lxd init” would have you configure, provide your own or just use an existing physical interface for your containers.

While this certainly worked, it was a bit confusing because most of that bridge configuration happened outside of LXD in the Ubuntu packaging. Those scripts could only support a single bridge and none of this was exposed over the API, making remote configuration a bit of a pain.

That was all until LXD 2.3 when LXD finally grew its own network management API and command line tools to match. This post is an attempt at an overview of those new capabilities.

### Basic networking

Right out of the box, LXD 2.3 comes with no network defined at all. “lxd init” will offer to set one up for you and attach it to all new containers by default, but let’s do it by hand to see what’s going on under the hood.

To create a new network with a random IPv4 and IPv6 subnet and NAT enabled, just run:

```
stgraber@castiana:~$ lxc network create testbr0
Network testbr0 created
```

You can then look at its config with:

```
stgraber@castiana:~$ lxc network show testbr0
name: testbr0
config:
 ipv4.address: 10.150.19.1/24
 ipv4.nat: "true"
 ipv6.address: fd42:474b:622d:259d::1/64
 ipv6.nat: "true"
managed: true
type: bridge
usedby: []
```

If you don’t want those auto-configured subnets, you can go with:

```
stgraber@castiana:~$ lxc network create testbr0 ipv6.address=none ipv4.address=10.0.3.1/24 ipv4.nat=true
Network testbr0 created
```

Which will result in:

```
stgraber@castiana:~$ lxc network show testbr0
name: testbr0
config:
 ipv4.address: 10.0.3.1/24
 ipv4.nat: "true"
 ipv6.address: none
managed: true
type: bridge
usedby: []
```

Having a network created and running won’t do you much good if your containers aren’t using it.
To have your newly created network attached to all containers, you can simply do:

```
stgraber@castiana:~$ lxc network attach-profile testbr0 default eth0
```

To attach a network to a single existing container, you can do:

```
stgraber@castiana:~$ lxc network attach my-container default eth0
```

Now, lets say you have openvswitch installed on that machine and want to convert that bridge to an OVS bridge, just change the driver property:

```
stgraber@castiana:~$ lxc network set testbr0 bridge.driver openvswitch
```

If you want to do a bunch of changes all at once, “lxc network edit” will let you edit the network configuration interactively in your text editor.

### Static leases and port security

One of the nice thing with having LXD manage the DHCP server for you is that it makes managing DHCP leases much simpler. All you need is a container-specific nic device and the right property set.

```
root@yak:~# lxc init ubuntu:16.04 c1
Creating c1
root@yak:~# lxc network attach testbr0 c1 eth0
root@yak:~# lxc config device set c1 eth0 ipv4.address 10.0.3.123
root@yak:~# lxc start c1
root@yak:~# lxc list c1
+------+---------+-------------------+------+------------+-----------+
| NAME |  STATE  |        IPV4       | IPV6 |    TYPE    | SNAPSHOTS |
+------+---------+-------------------+------+------------+-----------+
|  c1  | RUNNING | 10.0.3.123 (eth0) |      | PERSISTENT | 0         |
+------+---------+-------------------+------+------------+-----------+
```

And same goes for IPv6 but with the “ipv6.address” property instead.

Similarly, if you want to prevent your container from ever changing its MAC address or forwarding traffic for any other MAC address (such as nesting), you can enable port security with:

```
root@yak:~# lxc config device set c1 eth0 security.mac_filtering true
```

### DNS

LXD runs a DNS server on the bridge. On top of letting you set the DNS domain for the bridge (“dns.domain” network property), it also supports 3 different operating modes (“dns.mode”):

*   “managed” will have one DNS record per container, matching its name and known IP addresses. The container cannot alter this record through DHCP.
*   “dynamic” allows the containers to self-register in the DNS through DHCP. So whatever hostname the container sends during the DHCP negotiation ends up in DNS.
*   “none” is for a simple recursive DNS server without any kind of local DNS records.

The default mode is “managed” and is typically the safest and most convenient as it provides DNS records for containers but doesn’t let them spoof each other’s records by sending fake hostnames over DHCP.

### Using tunnels

On top of all that, LXD also supports connecting to other hosts using GRE or VXLAN tunnels.

A LXD network can have any number of tunnels attached to it, making it easy to create networks spanning multiple hosts. This is mostly useful for development, test and demo uses, with production environment usually preferring VLANs for that kind of segmentation.

So say, you want a basic “testbr0” network running with IPv4 and IPv6 on host “edfu” and want to spawn containers using it on host “djanet”. The easiest way to do that is by using a multicast VXLAN tunnel. This type of tunnels only works when both hosts are on the same physical segment.

```
root@edfu:~# lxc network create testbr0 tunnel.lan.protocol=vxlan
Network testbr0 created
root@edfu:~# lxc network attach-profile testbr0 default eth0
```

This defines a “testbr0” bridge on host “edfu” and sets up a multicast VXLAN tunnel on it for other hosts to join it. In this setup, “edfu” will be the one acting as a router for that network, providing DHCP, DNS, … the other hosts will just be forwarding traffic over the tunnel.

```
root@djanet:~# lxc network create testbr0 ipv4.address=none ipv6.address=none tunnel.lan.protocol=vxlan
Network testbr0 created
root@djanet:~# lxc network attach-profile testbr0 default eth0
```

Now you can start containers on either host and see them getting IP from the same address pool and communicate directly with each other through the tunnel.

As mentioned earlier, this uses multicast, which usually won’t do you much good when crossing routers. For those cases, you can use VXLAN in unicast mode or a good old GRE tunnel.

To join another host using GRE, first configure the main host with:

```
root@edfu:~# lxc network set testbr0 tunnel.nuturo.protocol gre
root@edfu:~# lxc network set testbr0 tunnel.nuturo.local 172.17.16.2
root@edfu:~# lxc network set testbr0 tunnel.nuturo.remote 172.17.16.9
```

And then the “client” host with:

```
root@nuturo:~# lxc network create testbr0 ipv4.address=none ipv6.address=none tunnel.edfu.protocol=gre tunnel.edfu.local=172.17.16.9 tunnel.edfu.remote=172.17.16.2
Network testbr0 created
root@nuturo:~# lxc network attach-profile testbr0 default eth0
```

If you’d rather use vxlan, just do:

```
root@edfu:~# lxc network set testbr0 tunnel.edfu.id 10
root@edfu:~# lxc network set testbr0 tunnel.edfu.protocol vxlan
```

And:

```
root@nuturo:~# lxc network set testbr0 tunnel.edfu.id 10
root@nuturo:~# lxc network set testbr0 tunnel.edfu.protocol vxlan
```

The tunnel id is required here to avoid conflicting with the already configured multicast vxlan tunnel.

And that’s how you make cross-host networking easily with recent LXD!

### Conclusion

LXD now makes it very easy to define anything from a simple single-host network to a very complex cross-host network for thousands of containers. It also makes it very simple to define a new network just for a few containers or add a second device to a container, connecting it to a separate private network.

While this post goes through most of the different features we support, there are quite a few more knobs that can be used to fine tune the LXD network experience.
A full list can be found here: [https://github.com/lxc/lxd/blob/master/doc/configuration.md][2]

# Extra information

The main LXD website is at: [https://linuxcontainers.org/lxd
][3]Development happens on Github at: [https://github.com/lxc/lxd][4]
Mailing-list support happens on: [https://lists.linuxcontainers.org][5]
IRC support happens in: #lxcontainers on irc.freenode.net
Try LXD online: [https://linuxcontainers.org/lxd/try-it][6]

--------------------------------------------------------------------------------

via: https://www.stgraber.org/2016/10/27/network-management-with-lxd-2-3/

作者：[Stéphane Graber][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.stgraber.org/author/stgraber/
[1]:https://www.stgraber.org/author/stgraber/
[2]:https://github.com/lxc/lxd/blob/master/doc/configuration.md#network-configuration
[3]:https://linuxcontainers.org/lxd
[4]:https://github.com/lxc/lxd
[5]:https://lists.linuxcontainers.org/
[6]:https://linuxcontainers.org/lxd/try-it
[7]:https://www.stgraber.org/2016/10/27/network-management-with-lxd-2-3/

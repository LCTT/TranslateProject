[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to Use VLAN tagged NIC (Ethernet Card) on CentOS and RHEL Servers)
[#]: via: (https://www.linuxtechi.com/vlan-tagged-nic-ethernet-card-centos-rhel-servers/)
[#]: author: (Pradeep Kumar https://www.linuxtechi.com/author/pradeep/)

How to Use VLAN tagged NIC (Ethernet Card) on CentOS and RHEL Servers
======

There are some scenarios where we want to assign multiple IPs from different **VLAN** on the same Ethernet card (nic) on Linux servers ( **CentOS** / **RHEL** ). This can be done by enabling VLAN tagged interface. But for this to happen first we must make sure multiple VLANs are attached to port on switch or in other words we can say we should configure trunk port by adding multiple VLANs on switch.

<https://www.linuxtechi.com/wp-content/uploads/2019/06/VLAN-Tagged-NIC-Linux-Server.jpg>

Let’s assume we have a Linux Server, there we have two Ethernet cards (enp0s3 & enp0s8), first NIC ( **enp0s3** ) will be used for data traffic and second NIC ( **enp0s8** ) will be used for control / management traffic. For Data traffic I will using multiple VLANs (or will assign multiple IPs from different VLANs on data traffic ethernet card).

I am assuming the port from switch which is connected to my server data NIC is configured as trunk port by mapping the multiple VLANs to it.

Following are the VLANs which is mapped to data traffic Ethernet Card (NIC):

  * VLAN ID (200), VLAN N/W = 172.168.10.0/24
  * VLAN ID (300), VLAN N/W = 172.168.20.0/24



To use VLAN tagged interface on CentOS 7 / RHEL 7 / CentOS 8 /RHEL 8 systems, [kernel module][1] **8021q** must be loaded.

Use the following command to load the kernel module “8021q”

```
[root@linuxtechi ~]# lsmod | grep -i 8021q
[root@linuxtechi ~]# modprobe --first-time 8021q
[root@linuxtechi ~]# lsmod | grep -i 8021q
8021q                  29022  0
garp                   14384  1 8021q
mrp                    18542  1 8021q
[root@linuxtechi ~]#
```

Use below modinfo command to display information about kernel module “8021q”

```
[root@linuxtechi ~]# modinfo 8021q
filename:       /lib/modules/3.10.0-327.el7.x86_64/kernel/net/8021q/8021q.ko
version:        1.8
license:        GPL
alias:          rtnl-link-vlan
rhelversion:    7.2
srcversion:     2E63BD725D9DC11C7DA6190
depends:        mrp,garp
intree:         Y
vermagic:       3.10.0-327.el7.x86_64 SMP mod_unload modversions
signer:         CentOS Linux kernel signing key
sig_key:        79:AD:88:6A:11:3C:A0:22:35:26:33:6C:0F:82:5B:8A:94:29:6A:B3
sig_hashalgo:   sha256
[root@linuxtechi ~]#
```

Now tagged (or mapped) the VLANs 200 and 300 to NIC enp0s3 using the [ip command][2]

```
[root@linuxtechi ~]# ip link add link enp0s3 name enp0s3.200 type vlan id 200
```

Bring up the interface using below ip command:

```
[root@linuxtechi ~]# ip link set dev enp0s3.200 up
```

Similarly mapped the VLAN 300 to NIC enp0s3

```
[root@linuxtechi ~]# ip link add link enp0s3 name enp0s3.300 type vlan id 300
[root@linuxtechi ~]# ip link set dev enp0s3.300 up
[root@linuxtechi ~]#
```

Now view the tagged interface status using ip command:

[![tagged-interface-ip-command][3]][4]

Now we can assign the IP address to tagged interface from their respective VLANs using beneath ip command,

```
[root@linuxtechi ~]# ip addr add 172.168.10.51/24 dev enp0s3.200
[root@linuxtechi ~]# ip addr add 172.168.20.51/24 dev enp0s3.300
```

Use below ip command to see whether IP is assigned to tagged interface or not.

![ip-address-tagged-nic][5]

All the above changes via ip commands will not be persistent across the reboot. These tagged interfaces will not be available after reboot and after network service restart

So, to make tagged interfaces persistent across the reboot then use interface **ifcfg files**

Edit interface (enp0s3) file “ **/etc/sysconfig/network-scripts/ifcfg-enp0s3** ” and add the following content,

Note: Replace the interface name that suits to your env,

```
[root@linuxtechi ~]# vi /etc/sysconfig/network-scripts/ifcfg-enp0s3
TYPE=Ethernet
DEVICE=enp0s3
BOOTPROTO=none
ONBOOT=yes
```

Save & exit the file

Create tagged interface file for VLAN id 200 as “ **/etc/sysconfig/network-scripts/ifcfg-enp0s3.200** ” and add the following contents to it.

```
[root@linuxtechi ~]# vi /etc/sysconfig/network-scripts/ifcfg-enp0s3.200
DEVICE=enp0s3.200
BOOTPROTO=none
ONBOOT=yes
IPADDR=172.168.10.51
PREFIX=24
NETWORK=172.168.10.0
VLAN=yes
```

Save & exit the file

Similarly create interface file for VLAN id 300 as “/etc/sysconfig/network-scripts/ifcfg-enp0s3.300” and add the following contents to it

```
[root@linuxtechi ~]# vi /etc/sysconfig/network-scripts/ifcfg-enp0s3.300
DEVICE=enp0s3.300
BOOTPROTO=none
ONBOOT=yes
IPADDR=172.168.20.51
PREFIX=24
NETWORK=172.168.20.0
VLAN=yes
```

Save and exit file and then restart network services using the beneath command,

```
[root@linuxtechi ~]# systemctl restart network
[root@linuxtechi ~]#
```

Now verify whether tagged interface are configured and up & running using the ip command,

![tagged-interface-status-ip-command-linux-server][6]

That’s all from this article, I hope you got an idea how to configure and enable VLAN tagged interface on CentOS 7 / 8 and RHEL 7 /8 Severs. Please do share your feedback and comments.

--------------------------------------------------------------------------------

via: https://www.linuxtechi.com/vlan-tagged-nic-ethernet-card-centos-rhel-servers/

作者：[Pradeep Kumar][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.linuxtechi.com/author/pradeep/
[b]: https://github.com/lujun9972
[1]: https://www.linuxtechi.com/how-to-manage-kernel-modules-in-linux/
[2]: https://www.linuxtechi.com/ip-command-examples-for-linux-users/
[3]: https://www.linuxtechi.com/wp-content/uploads/2019/06/tagged-interface-ip-command-1024x444.jpg
[4]: https://www.linuxtechi.com/wp-content/uploads/2019/06/tagged-interface-ip-command.jpg
[5]: https://www.linuxtechi.com/wp-content/uploads/2019/06/ip-address-tagged-nic-1024x343.jpg
[6]: https://www.linuxtechi.com/wp-content/uploads/2019/06/tagged-interface-status-ip-command-linux-server-1024x656.jpg

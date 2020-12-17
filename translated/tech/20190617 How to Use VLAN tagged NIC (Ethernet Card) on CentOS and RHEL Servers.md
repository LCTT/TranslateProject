[#]: collector: (lujun9972)
[#]: translator: (quinbyjoe)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to Use VLAN tagged NIC (Ethernet Card) on CentOS and RHEL Servers)
[#]: via: (https://www.linuxtechi.com/vlan-tagged-nic-ethernet-card-centos-rhel-servers/)
[#]: author: (Pradeep Kumar https://www.linuxtechi.com/author/pradeep/)

如何在CentOS和RHEL系统的服务器中使用带VLAN标记的以太网卡
======

在某些方案中，我们希望在Linux服务器( **CentOS** / **RHEL** )上的同一以太网卡（NIC）分配来自不同VLAN的多个IP。这个可以通过使用VLAN标记的接口实现。但是要实现这个问题，我们必须确保多个VLAN连接到交换机的端口上，也就是说我们应该在交换机上添加多个VLAN来配置聚合端口（译者注：一般有聚合端口Trunk port，接入端口Access port，混合端口Hybird port三种）。

![tagged-interface-status-ip-command-linux-server][7]

假设我们有一个Linux服务器，我们在这里有两张以太网卡 (enp0s3 和 enp0s8)，第一张网卡( **enp0s3** )将被用于数据传输，而第二张网卡( **enp0s8** )将被用于控制/流量管理。我将使用多个VLAN用于数据传输（或在数据流量网卡上从不同的VLAN中分配多个IP）。

我假设连接到我服务器的数据网卡的端口，是通过映射多个VLAN去配置为聚合端口。

下面是映射到数据传输网卡(NIC)的VLAN：

  * VLAN ID (200), VLAN N/W = 172.168.10.0/24
  * VLAN ID (300), VLAN N/W = 172.168.20.0/24


要在CentOS 7 / RHEL 7 / CentOS 8 / RHEL 8系统中使用VLAN标记的接口，必须加载[内核模块][1] **8021q** 。

加载内核模块“8021q”可以使用下面的命令：
```
[root@linuxtechi ~]# lsmod | grep -i 8021q
[root@linuxtechi ~]# modprobe --first-time 8021q
[root@linuxtechi ~]# lsmod | grep -i 8021q
8021q                  29022  0
garp                   14384  1 8021q
mrp                    18542  1 8021q
[root@linuxtechi ~]#
```

可以使用modinfo命令显示内核模块“8021q”的详细信息：
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

现在使用[ip 命令][2]给enp0s3网卡加上200和300的VLAN标签（或映射）。

译者注：先给enp0s3网卡映射上200的VLAN标签。
```
[root@linuxtechi ~]# ip link add link enp0s3 name enp0s3.200 type vlan id 200
```

使用下面的ip命令打开接口：
```
[root@linuxtechi ~]# ip link set dev enp0s3.200 up
```

同理给enp0s3网卡映射上300的VLAN标签：
```
[root@linuxtechi ~]# ip link add link enp0s3 name enp0s3.300 type vlan id 300
[root@linuxtechi ~]# ip link set dev enp0s3.300 up
[root@linuxtechi ~]#
```

现在使用ip命令查看标记后的接口状态：
[![tagged-interface-ip-command][3]][4]

现在我们可以使用下面的ip命令从它们各自的VLAN为已经标记的接口分配IP地址：
```
[root@linuxtechi ~]# ip addr add 172.168.10.51/24 dev enp0s3.200
[root@linuxtechi ~]# ip addr add 172.168.20.51/24 dev enp0s3.300
```

使用下面的ip命令查看是否为已标记的接口分配到IP:
![ip-address-tagged-nic][5]

重启之后上面所有通过ip命令的更改都不会持续（译者注：修改后可保存至配置文件或数据库中，如果未进行保存处理，则只有当前环境生效，重启后配置失效）。系统重启和网络服务重启（译者注：service network restart，或down和up命令）之后这些标记的接口将不可用。

因此，要使标记的接口在重启后保持不变，需要使用接口的**ifcfg files** 。

编辑接口(enp0s3)文件“ **/etc/sysconfig/network-scripts/ifcfg-enp0s3** ”，并且增加下面的内容，

**作者提醒**：替换为您环境中的接口名称。

```
[root@linuxtechi ~]# vi /etc/sysconfig/network-scripts/ifcfg-enp0s3
TYPE=Ethernet
DEVICE=enp0s3
BOOTPROTO=none
ONBOOT=yes
```

保存和退出文件。


为id是200的VLAN创建接口文件“ **/etc/sysconfig/network-scripts/ifcfg-enp0s3.200** ”，且增加下面的内容。

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

保存并退出此文件。

同理为id是300的VLAN创建接口文件“ **/etc/sysconfig/network-scripts/ifcfg-enp0s3.300** ”，且增加下面的内容。

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

保存并退出文件，这时候使用下面的命令重启网络服务，

```
[root@linuxtechi ~]# systemctl restart network
[root@linuxtechi ~]#
```

现在使用下面的ip命令检验标记的接口是否已配置和启动，并且正在运行中，

![tagged-interface-status-ip-command-linux-server][6]

以上就是本文的全部内容，我希望您已经得到了在CentOS 7 / 8 and RHEL 7 /8 服务器上如何去配置和使能带VLAN标签的接口方法。请分享您的反馈和意见。

--------------------------------------------------------------------------------

参考: https://www.linuxtechi.com/vlan-tagged-nic-ethernet-card-centos-rhel-servers/

作者：[Pradeep Kumar][a]
选题：[lujun9972][b]
译者：[quinbyjoe](https://github.com/quinbyjoe)
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
[7]: https://www.linuxtechi.com/wp-content/uploads/2019/06/VLAN-Tagged-NIC-Linux-Server.jpg
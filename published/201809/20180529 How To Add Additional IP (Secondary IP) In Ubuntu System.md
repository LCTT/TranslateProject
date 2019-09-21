如何在 Ubuntu 系统中添加一个辅助 IP 地址
======

Linux 管理员应该意识到这一点，因为这是一项例行任务。很多人想知道为什么我们需要在服务器中添加多个 IP 地址，以及为什么我们需要将它添加到单块网卡中？我说的对吗？

你可能也会有类似的问题：在 Linux 中如何为单块网卡分配多个 IP 地址？在本文中，你可以得到答案。

当我们对一个新服务器进行设置时，理想情况下它将有一个 IP 地址，即服务器主 IP 地址，它与服务器主机名对应。

我们不应在服务器主 IP 地址上托管任何应用程序，这是不可取的。如果要在服务器上托管任何应用程序，我们应该为此添加辅助 IP。

这是业界的最佳实践，它允许用户安装 SSL 证书。大多数系统都配有单块网卡，这足以添加额外的 IP 地址。

**建议阅读：**

- [在 Linux 命令行中 9 种方法检查公共 IP 地址][1]
- [在 Linux 终端中 3 种简单的方式来检查 DNS（域名服务器）记录][2]
- [在 Linux 上使用 Dig 命令检查 DNS（域名服务器）记录][3]
- [在 Linux 上使用 Nslookup 命令检查 DNS（域名服务器）记录][4]
- [在 Linux 上使用 Host 命令检查 DNS（域名服务器）记录][5]

我们可以在同一个接口上添加 IP 地址，或者在同一设备上创建子接口，然后在其中添加 IP。默认情况下，一直到 Ubuntu 14.04 LTS，接口给名称为 `ethX (eth0)`，但是从 Ubuntu 15.10 之后网络接口名称已从 `ethX` 更改为 `enXXXXX`（对于服务器是 ens33，桌面版是 enp0s3）。

在本文中，我们将教你如何在 Ubuntu 上执行此操作，并且衍生到其它发行版（to 校正：这句自己加的）。

**注意：**别在 DNS 详细信息后添加 IP 地址。如果是这样，DNS 将无法正常工作。

### 如何在 Ubuntu 14.04 LTS 中添加临时辅助 IP 地址

在系统中添加 IP 地址之前，运行以下任一命令即可验证服务器主 IP 地址：

```
# ifconfig
或
# ip addr

# ip addr

eth0      Link encap:Ethernet  HWaddr 08:00:27:98:b7:36 
          inet addr:192.168.56.150  Bcast:192.168.56.255  Mask:255.255.255.0
          inet6 addr: fe80::a00:27ff:fe98:b736/64 Scope:Link
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:4 errors:0 dropped:0 overruns:0 frame:0
          TX packets:105 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000
          RX bytes:902 (902.0 B)  TX bytes:16423 (16.4 KB)

eth1      Link encap:Ethernet  HWaddr 08:00:27:6a:cf:d3 
          inet addr:10.0.3.15  Bcast:10.0.3.255  Mask:255.255.255.0
          inet6 addr: fe80::a00:27ff:fe6a:cfd3/64 Scope:Link
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:80 errors:0 dropped:0 overruns:0 frame:0
          TX packets:146 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000
          RX bytes:8698 (8.6 KB)  TX bytes:17047 (17.0 KB)

lo        Link encap:Local Loopback 
          inet addr:127.0.0.1  Mask:255.0.0.0
          inet6 addr: ::1/128 Scope:Host
          UP LOOPBACK RUNNING  MTU:65536  Metric:1
          RX packets:25 errors:0 dropped:0 overruns:0 frame:0
          TX packets:25 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1
          RX bytes:1730 (1.7 KB)  TX bytes:1730 (1.7 KB)
```

如我所见，服务器主 IP 地址是 `192.168.56.150`，我将下一个 IP `192.168.56.151` 作为辅助 IP，使用以下方法完成：

```
# ip addr add 192.168.56.151/24 broadcast 192.168.56.255 dev eth0 label eth0:1
```

输入以下命令以检查新添加的 IP 地址。如果你重新启动服务器，那么新添加的 IP 地址会消失，因为我们的 IP 是临时添加的。

```
# ip addr
1: lo:  mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
    inet6 ::1/128 scope host
       valid_lft forever preferred_lft forever
2: eth0:  mtu 1500 qdisc pfifo_fast state UP group default qlen 1000
    link/ether 08:00:27:98:b7:36 brd ff:ff:ff:ff:ff:ff
    inet 192.168.56.150/24 brd 192.168.56.255 scope global eth0
       valid_lft forever preferred_lft forever
    inet 192.168.56.151/24 brd 192.168.56.255 scope global secondary eth0:1
       valid_lft forever preferred_lft forever
    inet6 fe80::a00:27ff:fe98:b736/64 scope link
       valid_lft forever preferred_lft forever
3: eth1:  mtu 1500 qdisc pfifo_fast state UP group default qlen 1000
    link/ether 08:00:27:6a:cf:d3 brd ff:ff:ff:ff:ff:ff
    inet 10.0.3.15/24 brd 10.0.3.255 scope global eth1
       valid_lft forever preferred_lft forever
    inet6 fe80::a00:27ff:fe6a:cfd3/64 scope link
       valid_lft forever preferred_lft forever
```

### 如何在 Ubuntu 14.04 LTS 中添加永久辅助 IP 地址

要在 Ubuntu 系统上添加永久辅助 IP 地址，只需编辑 `/etc/network/interfaces` 文件并添加所需的 IP 详细信息。

```
# vi /etc/network/interfaces
```

```
# vi /etc/network/interfaces

# The loopback network interface
auto lo
iface lo inet loopback

# The primary network interface
auto eth0
iface eth0 inet static
        address 192.168.56.150
        netmask 255.255.255.0
        network 192.168.56.0
        broadcast 192.168.56.255
        gateway 192.168.56.1

auto eth0:1
iface eth0:1 inet static
        address 192.168.56.151
        netmask 255.255.255.0
```

保存并关闭文件，然后重启网络接口服务。

```
# service networking restart
或
# ifdown eth0:1 && ifup eth0:1
```

验证新添加的 IP 地址：

```
# ifconfig
eth0      Link encap:Ethernet  HWaddr 08:00:27:98:b7:36 
          inet addr:192.168.56.150  Bcast:192.168.56.255  Mask:255.255.255.0
          inet6 addr: fe80::a00:27ff:fe98:b736/64 Scope:Link
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:5 errors:0 dropped:0 overruns:0 frame:0
          TX packets:84 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000
          RX bytes:962 (962.0 B)  TX bytes:11905 (11.9 KB)

eth0:1    Link encap:Ethernet  HWaddr 08:00:27:98:b7:36 
          inet addr:192.168.56.151  Bcast:192.168.56.255  Mask:255.255.255.0
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1

eth1      Link encap:Ethernet  HWaddr 08:00:27:6a:cf:d3 
          inet addr:10.0.3.15  Bcast:10.0.3.255  Mask:255.255.255.0
          inet6 addr: fe80::a00:27ff:fe6a:cfd3/64 Scope:Link
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:4924 errors:0 dropped:0 overruns:0 frame:0
          TX packets:3185 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000
          RX bytes:4037636 (4.0 MB)  TX bytes:422516 (422.5 KB)

lo        Link encap:Local Loopback 
          inet addr:127.0.0.1  Mask:255.0.0.0
          inet6 addr: ::1/128 Scope:Host
          UP LOOPBACK RUNNING  MTU:65536  Metric:1
          RX packets:0 errors:0 dropped:0 overruns:0 frame:0
          TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1
          RX bytes:0 (0.0 B)  TX bytes:0 (0.0 B)
```

### 如何在 Ubuntu 16.04 LTS 中临时添加辅助 IP 地址

正如本文开头所述，网络接口名称从 Ubuntu 15.10 就开始从 ‘ethX’ 更改为 ‘enXXXX’ (enp0s3)，所以，替换你的接口名称。

在执行此操作之前，先检查系统上的 IP 信息：

```
# ifconfig
或
# ip addr

enp0s3: flags=4163  mtu 1500
        inet 192.168.56.201  netmask 255.255.255.0  broadcast 192.168.56.255
        inet6 fe80::a00:27ff:fe97:132e  prefixlen 64  scopeid 0x20
        ether 08:00:27:97:13:2e  txqueuelen 1000  (Ethernet)
        RX packets 7  bytes 420 (420.0 B)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 294  bytes 24747 (24.7 KB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

enp0s8: flags=4163  mtu 1500
        inet 10.0.3.15  netmask 255.255.255.0  broadcast 10.0.3.255
        inet6 fe80::344b:6259:4dbe:eabb  prefixlen 64  scopeid 0x20
        ether 08:00:27:12:e8:c1  txqueuelen 1000  (Ethernet)
        RX packets 1  bytes 590 (590.0 B)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 97  bytes 10209 (10.2 KB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

lo: flags=73  mtu 65536
        inet 127.0.0.1  netmask 255.0.0.0
        inet6 ::1  prefixlen 128  scopeid 0x10
        loop  txqueuelen 1000  (Local Loopback)
        RX packets 325  bytes 24046 (24.0 KB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 325  bytes 24046 (24.0 KB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0
```

如我所见，服务器主 IP 地址是 `192.168.56.201`，所以，我将下一个 IP `192.168.56.202` 作为辅助 IP，使用以下命令完成。

```
# ip addr add 192.168.56.202/24 broadcast 192.168.56.255 dev enp0s3
```

运行以下命令来检查是否已分配了新的 IP。当你重启机器时，它会消失。

```
# ip addr
1: lo:  mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
    inet6 ::1/128 scope host
       valid_lft forever preferred_lft forever
2: enp0s3:  mtu 1500 qdisc pfifo_fast state UP group default qlen 1000
    link/ether 08:00:27:97:13:2e brd ff:ff:ff:ff:ff:ff
    inet 192.168.56.201/24 brd 192.168.56.255 scope global enp0s3
       valid_lft forever preferred_lft forever
    inet 192.168.56.202/24 brd 192.168.56.255 scope global secondary enp0s3
       valid_lft forever preferred_lft forever
    inet6 fe80::a00:27ff:fe97:132e/64 scope link
       valid_lft forever preferred_lft forever
3: enp0s8:  mtu 1500 qdisc pfifo_fast state UP group default qlen 1000
    link/ether 08:00:27:12:e8:c1 brd ff:ff:ff:ff:ff:ff
    inet 10.0.3.15/24 brd 10.0.3.255 scope global dynamic enp0s8
       valid_lft 86353sec preferred_lft 86353sec
    inet6 fe80::344b:6259:4dbe:eabb/64 scope link
       valid_lft forever preferred_lft forever
```

### 如何在 Ubuntu 16.04 LTS 中添加永久辅助 IP 地址

要在 Ubuntu 系统上添加永久辅助 IP 地址，只需编辑 `/etc/network/interfaces` 文件并添加所需 IP 的详细信息。

我们不应该在 `dns-nameservers` 行之后添加辅助 IP 地址，因为它不会起作用，应该以下面的格式添加 IP 详情。

此外，我们不需要添加子接口（我们之前在 Ubuntu 14.04 LTS 中的做法）：

```
# vi /etc/network/interfaces

# interfaces(5) file used by ifup(8) and ifdown(8)
auto lo
iface lo inet loopback

# The primary network interface
auto enp0s3
iface enp0s3 inet static
address 192.168.56.201
netmask 255.255.255.0

iface enp0s3 inet static
address 192.168.56.202
netmask 255.255.255.0

gateway 192.168.56.1
network 192.168.56.0
broadcast 192.168.56.255
dns-nameservers 8.8.8.8 8.8.4.4
dns-search      2daygeek.local  
```

保存并关闭文件，然后重启网络接口服务：

```
# systemctl restart networking
或
# ifdown enp0s3 && ifup enp0s3
```

运行以下命令来检查是否已经分配了新的 IP：

```
# ip addr
1: lo:  mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
    inet6 ::1/128 scope host
       valid_lft forever preferred_lft forever
2: enp0s3:  mtu 1500 qdisc pfifo_fast state UP group default qlen 1000
    link/ether 08:00:27:97:13:2e brd ff:ff:ff:ff:ff:ff
    inet 192.168.56.201/24 brd 192.168.56.255 scope global enp0s3
       valid_lft forever preferred_lft forever
    inet 192.168.56.202/24 brd 192.168.56.255 scope global secondary enp0s3
       valid_lft forever preferred_lft forever
    inet6 fe80::a00:27ff:fe97:132e/64 scope link
       valid_lft forever preferred_lft forever
3: enp0s8:  mtu 1500 qdisc pfifo_fast state UP group default qlen 1000
    link/ether 08:00:27:12:e8:c1 brd ff:ff:ff:ff:ff:ff
    inet 10.0.3.15/24 brd 10.0.3.255 scope global dynamic enp0s8
       valid_lft 86353sec preferred_lft 86353sec
    inet6 fe80::344b:6259:4dbe:eabb/64 scope link
       valid_lft forever preferred_lft forever
```

让我来 ping 一下新 IP 地址：

```
# ping 192.168.56.202 -c 4
PING 192.168.56.202 (192.168.56.202) 56(84) bytes of data.
64 bytes from 192.168.56.202: icmp_seq=1 ttl=64 time=0.019 ms
64 bytes from 192.168.56.202: icmp_seq=2 ttl=64 time=0.087 ms
64 bytes from 192.168.56.202: icmp_seq=3 ttl=64 time=0.034 ms
64 bytes from 192.168.56.202: icmp_seq=4 ttl=64 time=0.042 ms

--- 192.168.56.202 ping statistics ---
4 packets transmitted, 4 received, 0% packet loss, time 3068ms
rtt min/avg/max/mdev = 0.019/0.045/0.087/0.026 ms
```

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/how-to-add-additional-ip-secondary-ip-in-ubuntu-debian-system/

作者：[Prakash Subramanian][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[MjSeven](https://github.com/MjSeven)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.2daygeek.com/author/prakash/
[1]:https://www.2daygeek.com/check-find-server-public-ip-address-linux/
[2]:https://www.2daygeek.com/check-find-dns-records-of-domain-in-linux-terminal/
[3]:https://www.2daygeek.com/dig-command-check-find-dns-records-lookup-linux/
[4]:https://www.2daygeek.com/nslookup-command-check-find-dns-records-lookup-linux/
[5]:https://www.2daygeek.com/host-command-check-find-dns-records-lookup-linux/

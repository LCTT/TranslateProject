How To Add Additional IP (Secondary IP) In Ubuntu System
======
Linux admin should be aware of this because it’s a routine task. Many of you wondering why we need to add more than one IP address in server? why we need add this to single network card? am i right?

Also you can have a question like, how to assign multiple IP addresses to single network card in linux. In this article you can get an answer for this.

When we setup a new server, ideally it will have one IP address, which is server main IP address and linked with server hostname.

We should not host any application in server main IP address, which is not advisable. If you want to host any application on server, we should add additional IP or Secondary IP for that.

This is the best practices in industry, this allows users to install SSL certificate. Most of the system comes with single network card, which is more than enough to add additional IP address.

**Suggested Read :**
**(#)** [9 Methods To Check Your Public IP Address In Linux Command Line][1]
**(#)** [3 Easy Ways To Check DNS (Domain Name Server) Records In Linux Terminal][2]
**(#)** [Check DNS (Domain Name Server) Records On Linux Using Dig Command][3]
**(#)** [Check DNS (Domain Name Server) Records On Linux Using Nslookup Command][4]
**(#)** [Check DNS (Domain Name Server) Records On Linux Using Host Command][5]

We can add IP address in the same interface or create sub interface on the same device then add IP in that. By default interface name comes `ethX (eth0)` till Ubuntu 14.04 LTS but from Ubuntu 15.10 network interfaces names have been changed from `ethX` to `enXXXXX` (For server ens33 & For desktop enp0s3).

In this article we will teach you how to perform this on Ubuntu and it is derivative.

**`Make a note:`** You should not add IP address entry after DNS details. If so, DNS wont work.

### How To Add Secondary IP Address Temporarily In Ubuntu 14.04 LTS

Before adding IP address in system. Just verify the server main IP address by running any of the below commands.
```
# ifconfig

or

# ip addr

eth0 Link encap:Ethernet HWaddr 08:00:27:98:b7:36
 inet addr:192.168.56.150 Bcast:192.168.56.255 Mask:255.255.255.0
 inet6 addr: fe80::a00:27ff:fe98:b736/64 Scope:Link
 UP BROADCAST RUNNING MULTICAST MTU:1500 Metric:1
 RX packets:4 errors:0 dropped:0 overruns:0 frame:0
 TX packets:105 errors:0 dropped:0 overruns:0 carrier:0
 collisions:0 txqueuelen:1000
 RX bytes:902 (902.0 B) TX bytes:16423 (16.4 KB)

eth1 Link encap:Ethernet HWaddr 08:00:27:6a:cf:d3
 inet addr:10.0.3.15 Bcast:10.0.3.255 Mask:255.255.255.0
 inet6 addr: fe80::a00:27ff:fe6a:cfd3/64 Scope:Link
 UP BROADCAST RUNNING MULTICAST MTU:1500 Metric:1
 RX packets:80 errors:0 dropped:0 overruns:0 frame:0
 TX packets:146 errors:0 dropped:0 overruns:0 carrier:0
 collisions:0 txqueuelen:1000
 RX bytes:8698 (8.6 KB) TX bytes:17047 (17.0 KB)

lo Link encap:Local Loopback
 inet addr:127.0.0.1 Mask:255.0.0.0
 inet6 addr: ::1/128 Scope:Host
 UP LOOPBACK RUNNING MTU:65536 Metric:1
 RX packets:25 errors:0 dropped:0 overruns:0 frame:0
 TX packets:25 errors:0 dropped:0 overruns:0 carrier:0
 collisions:0 txqueuelen:1
 RX bytes:1730 (1.7 KB) TX bytes:1730 (1.7 KB)

```

As i can see, the server main IP address is `192.168.56.150` so, i’m going to assign next IP `192.168.56.151` as a secondary IP. This can be done using below method.
```
# ip addr add 192.168.56.151/24 broadcast 192.168.56.255 dev eth0 label eth0:1

```

Fire the following command to check newly added IP address. If you reboot the server then the newly added IP address go off because we have added this temporarily.
```
# ip addr
1: lo: mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1
 link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
 inet 127.0.0.1/8 scope host lo
 valid_lft forever preferred_lft forever
 inet6 ::1/128 scope host
 valid_lft forever preferred_lft forever
2: eth0: mtu 1500 qdisc pfifo_fast state UP group default qlen 1000
 link/ether 08:00:27:98:b7:36 brd ff:ff:ff:ff:ff:ff
 inet 192.168.56.150/24 brd 192.168.56.255 scope global eth0
 valid_lft forever preferred_lft forever
 inet 192.168.56.151/24 brd 192.168.56.255 scope global secondary eth0:1
 valid_lft forever preferred_lft forever
 inet6 fe80::a00:27ff:fe98:b736/64 scope link
 valid_lft forever preferred_lft forever
3: eth1: mtu 1500 qdisc pfifo_fast state UP group default qlen 1000
 link/ether 08:00:27:6a:cf:d3 brd ff:ff:ff:ff:ff:ff
 inet 10.0.3.15/24 brd 10.0.3.255 scope global eth1
 valid_lft forever preferred_lft forever
 inet6 fe80::a00:27ff:fe6a:cfd3/64 scope link
 valid_lft forever preferred_lft forever

```

### How To Add Secondary IP Address Permanently In Ubuntu 14.04 LTS

To add secondary IP address permanently on Ubuntu system, just edit `/etc/network/interfaces` file and add the requires IP details.
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

Save and close the file then restart the network interface
```
# service networking restart
or
# ifdown eth0:1 && ifup eth0:1

```

Verify the newly added IP address.
```
# ifconfig
eth0 Link encap:Ethernet HWaddr 08:00:27:98:b7:36
 inet addr:192.168.56.150 Bcast:192.168.56.255 Mask:255.255.255.0
 inet6 addr: fe80::a00:27ff:fe98:b736/64 Scope:Link
 UP BROADCAST RUNNING MULTICAST MTU:1500 Metric:1
 RX packets:5 errors:0 dropped:0 overruns:0 frame:0
 TX packets:84 errors:0 dropped:0 overruns:0 carrier:0
 collisions:0 txqueuelen:1000
 RX bytes:962 (962.0 B) TX bytes:11905 (11.9 KB)

eth0:1 Link encap:Ethernet HWaddr 08:00:27:98:b7:36
 inet addr:192.168.56.151 Bcast:192.168.56.255 Mask:255.255.255.0
 UP BROADCAST RUNNING MULTICAST MTU:1500 Metric:1

eth1 Link encap:Ethernet HWaddr 08:00:27:6a:cf:d3
 inet addr:10.0.3.15 Bcast:10.0.3.255 Mask:255.255.255.0
 inet6 addr: fe80::a00:27ff:fe6a:cfd3/64 Scope:Link
 UP BROADCAST RUNNING MULTICAST MTU:1500 Metric:1
 RX packets:4924 errors:0 dropped:0 overruns:0 frame:0
 TX packets:3185 errors:0 dropped:0 overruns:0 carrier:0
 collisions:0 txqueuelen:1000
 RX bytes:4037636 (4.0 MB) TX bytes:422516 (422.5 KB)

lo Link encap:Local Loopback
 inet addr:127.0.0.1 Mask:255.0.0.0
 inet6 addr: ::1/128 Scope:Host
 UP LOOPBACK RUNNING MTU:65536 Metric:1
 RX packets:0 errors:0 dropped:0 overruns:0 frame:0
 TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
 collisions:0 txqueuelen:1
 RX bytes:0 (0.0 B) TX bytes:0 (0.0 B)

```

### How To Add Secondary IP Address Temporarily In Ubuntu 16.04 LTS

As discussed in the beginning of the article, network interfaces names have been changed
from ‘ethX’ to ‘enXXXX’ (enp0s3) since Ubuntu 15.10 so, replace your interface name instead of us.

Let me check the IP information on my system before performing this.
```
# ifconfig
or
# ip addr

enp0s3: flags=4163 mtu 1500
 inet 192.168.56.201 netmask 255.255.255.0 broadcast 192.168.56.255
 inet6 fe80::a00:27ff:fe97:132e prefixlen 64 scopeid 0x20
 ether 08:00:27:97:13:2e txqueuelen 1000 (Ethernet)
 RX packets 7 bytes 420 (420.0 B)
 RX errors 0 dropped 0 overruns 0 frame 0
 TX packets 294 bytes 24747 (24.7 KB)
 TX errors 0 dropped 0 overruns 0 carrier 0 collisions 0

enp0s8: flags=4163 mtu 1500
 inet 10.0.3.15 netmask 255.255.255.0 broadcast 10.0.3.255
 inet6 fe80::344b:6259:4dbe:eabb prefixlen 64 scopeid 0x20
 ether 08:00:27:12:e8:c1 txqueuelen 1000 (Ethernet)
 RX packets 1 bytes 590 (590.0 B)
 RX errors 0 dropped 0 overruns 0 frame 0
 TX packets 97 bytes 10209 (10.2 KB)
 TX errors 0 dropped 0 overruns 0 carrier 0 collisions 0

lo: flags=73 mtu 65536
 inet 127.0.0.1 netmask 255.0.0.0
 inet6 ::1 prefixlen 128 scopeid 0x10
 loop txqueuelen 1000 (Local Loopback)
 RX packets 325 bytes 24046 (24.0 KB)
 RX errors 0 dropped 0 overruns 0 frame 0
 TX packets 325 bytes 24046 (24.0 KB)
 TX errors 0 dropped 0 overruns 0 carrier 0 collisions 0

```

As i can see, the server main IP address is `192.168.56.201` so, i’m going to assign next IP `192.168.56.202` as a secondary IP. This can be done using below command.
```
# ip addr add 192.168.56.202/24 broadcast 192.168.56.255 dev enp0s3

```

Run the below command to check if the new IP has been assigned or not. This will go off when you reboot the machine.
```
# ip addr
1: lo: mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
 link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
 inet 127.0.0.1/8 scope host lo
 valid_lft forever preferred_lft forever
 inet6 ::1/128 scope host
 valid_lft forever preferred_lft forever
2: enp0s3: mtu 1500 qdisc pfifo_fast state UP group default qlen 1000
 link/ether 08:00:27:97:13:2e brd ff:ff:ff:ff:ff:ff
 inet 192.168.56.201/24 brd 192.168.56.255 scope global enp0s3
 valid_lft forever preferred_lft forever
 inet 192.168.56.202/24 brd 192.168.56.255 scope global secondary enp0s3
 valid_lft forever preferred_lft forever
 inet6 fe80::a00:27ff:fe97:132e/64 scope link
 valid_lft forever preferred_lft forever
3: enp0s8: mtu 1500 qdisc pfifo_fast state UP group default qlen 1000
 link/ether 08:00:27:12:e8:c1 brd ff:ff:ff:ff:ff:ff
 inet 10.0.3.15/24 brd 10.0.3.255 scope global dynamic enp0s8
 valid_lft 86353sec preferred_lft 86353sec
 inet6 fe80::344b:6259:4dbe:eabb/64 scope link
 valid_lft forever preferred_lft forever

```

### How To Add Secondary IP Address Permanently In Ubuntu 16.04 LTS

To add secondary IP address permanently on Ubuntu system, just edit `/etc/network/interfaces` file and add the requires IP details.

We should not add secondary IP address after dns-nameservers because it wont work and add the IP details in the below format.

Moreover we don’t need to add sub interface (how we did previously in Ubuntu 14.04 LTS).
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
dns-search 2daygeek.local

```

Save and close the file then restart the network interface
```
# systemctl restart networking
or
# ifdown enp0s3 && ifup enp0s3

```

Run the below command to check if the new IP has been assigned or not.
```
# ip addr
1: lo: mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
 link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
 inet 127.0.0.1/8 scope host lo
 valid_lft forever preferred_lft forever
 inet6 ::1/128 scope host
 valid_lft forever preferred_lft forever
2: enp0s3: mtu 1500 qdisc pfifo_fast state UP group default qlen 1000
 link/ether 08:00:27:97:13:2e brd ff:ff:ff:ff:ff:ff
 inet 192.168.56.201/24 brd 192.168.56.255 scope global enp0s3
 valid_lft forever preferred_lft forever
 inet 192.168.56.202/24 brd 192.168.56.255 scope global secondary enp0s3
 valid_lft forever preferred_lft forever
 inet6 fe80::a00:27ff:fe97:132e/64 scope link
 valid_lft forever preferred_lft forever
3: enp0s8: mtu 1500 qdisc pfifo_fast state UP group default qlen 1000
 link/ether 08:00:27:12:e8:c1 brd ff:ff:ff:ff:ff:ff
 inet 10.0.3.15/24 brd 10.0.3.255 scope global dynamic enp0s8
 valid_lft 86353sec preferred_lft 86353sec
 inet6 fe80::344b:6259:4dbe:eabb/64 scope link
 valid_lft forever preferred_lft forever

```

Also, let me ping the new IP address.
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
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.2daygeek.com/author/prakash/
[1]:https://www.2daygeek.com/check-find-server-public-ip-address-linux/
[2]:https://www.2daygeek.com/check-find-dns-records-of-domain-in-linux-terminal/
[3]:https://www.2daygeek.com/dig-command-check-find-dns-records-lookup-linux/
[4]:https://www.2daygeek.com/nslookup-command-check-find-dns-records-lookup-linux/
[5]:https://www.2daygeek.com/host-command-check-find-dns-records-lookup-linux/

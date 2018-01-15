IPv6 Auto-Configuration in Linux
======

![](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/banner_5.png?itok=3kN83IjL)

In [Testing IPv6 Networking in KVM: Part 1][1], we learned about unique local addresses (ULAs). In this article, we will learn how to set up automatic IP address configuration for ULAs.

### When to Use Unique Local Addresses

Unique local addresses use the fd00::/8 address block, and are similar to our old friends the IPv4 private address classes: 10.0.0.0/8, 172.16.0.0/12, and 192.168.0.0/16. But they are not intended as a direct replacement. IPv4 private address classes and network address translation (NAT) were created to alleviate the shortage of IPv4 addresses, a clever hack that prolonged the life of IPv4 for years after it should have been replaced. IPv6 supports NAT, but I can't think of a good reason to use it. IPv6 isn't just bigger IPv4; it is different and needs different thinking.

So what's the point of ULAs, especially when we have link-local addresses (fe80::/10) and don't even need to configure them? There are two important differences. One, link-local addresses are not routable, so you can't cross subnets. Two, you control ULAs; choose your own addresses, make subnets, and they are routable.

Another benefit of ULAs is you don't need an allocation of global unicast IPv6 addresses just for mucking around on your LAN. If you have an allocation from a service provider then you don't need ULAs. You can mix global unicast addresses and ULAs on the same network, but I can't think of a good reason to have both, and for darned sure you don't want to use network address translation (NAT) to make ULAs publicly accessible. That, in my peerless opinion, is daft.

ULAs are for private networks only and should be blocked from leaving your network, and not allowed to roam the Internet. Which should be simple, just block the whole fd00::/8 range on your border devices.

### Address Auto-Configuration

ULAs are not automatic like link-local addresses, but setting up auto-configuration is easy as pie with radvd, the router advertisement daemon. Before you change anything, run `ifconfig` or `ip addr show` to see your existing IP addresses.

You should install radvd on a dedicated router for production use, but for testing you can install it on any Linux PC on your network. In my little KVM test lab, I installed it on Ubuntu, `apt-get install radvd`. It should not start after installation, because there is no configuration file:
```
$ sudo systemctl status radvd
● radvd.service - LSB: Router Advertising Daemon
 Loaded: loaded (/etc/init.d/radvd; bad; vendor preset: enabled)
 Active: active (exited) since Mon 2017-12-11 20:08:25 PST; 4min 59s ago
 Docs: man:systemd-sysv-generator(8)

Dec 11 20:08:25 ubunut1 systemd[1]: Starting LSB: Router Advertising Daemon...
Dec 11 20:08:25 ubunut1 radvd[3541]: Starting radvd:
Dec 11 20:08:25 ubunut1 radvd[3541]: * /etc/radvd.conf does not exist or is empty.
Dec 11 20:08:25 ubunut1 radvd[3541]: * See /usr/share/doc/radvd/README.Debian
Dec 11 20:08:25 ubunut1 radvd[3541]: * radvd will *not* be started.
Dec 11 20:08:25 ubunut1 systemd[1]: Started LSB: Router Advertising Daemon.

```

It's a little confusing with all the start and not started messages, but radvd is not running, which you can verify with good old `ps|grep radvd`. So we need to create `/etc/radvd.conf`. Copy this example, replacing the network interface name on the first line with your interface name:
```
interface ens7 {
 AdvSendAdvert on;
 MinRtrAdvInterval 3;
 MaxRtrAdvInterval 10;
 prefix fd7d:844d:3e17:f3ae::/64
 {
 AdvOnLink on;
 AdvAutonomous on;
 };

};

```

The prefix defines your network address, which is the first 64 bits of the address. The first two characters must be `fd`, then you define the remainder of the prefix, and leave the last 64 bits empty as radvd will assign the last 64 bits. The next 16 bits after the prefix define the subnet, and the remaining bits define the host address. Your subnet size must always be /64. RFC 4193 requires that addresses be randomly generated; see [Testing IPv6 Networking in KVM: Part 1][1] for more information on creating and managing ULAs.

### IPv6 Forwarding

IPv6 forwarding must be enabled. This command enables it until restart:
```
$ sudo sysctl -w net.ipv6.conf.all.forwarding=1

```

Uncomment or add this line to `/etc/sysctl.conf` to make it permanent:
```
net.ipv6.conf.all.forwarding = 1
```

Start the radvd daemon:
```
$ sudo systemctl stop radvd
$ sudo systemctl start radvd

```

This example reflects a quirk I ran into on my Ubuntu test system; I always have to stop radvd, no matter what state it is in, and then start it to apply any changes.

You won't see any output on a successful start, and often not on a failure either, so run `sudo systemctl radvd status`. If there are errors, systemctl will tell you. The most common errors are syntax errors in `/etc/radvd.conf`.

A cool thing I learned after complaining on Twitter: when you run ` journalctl -xe --no-pager` to debug systemctl errors, your output lines will wrap, and then you can actually read your error messages.

Now check your hosts to see their new auto-assigned addresses:
```
$ ifconfig
ens7 Link encap:Ethernet HWaddr 52:54:00:57:71:50
 [...]
 inet6 addr: fd7d:844d:3e17:f3ae:9808:98d5:bea9:14d9/64 Scope:Global
 [...]

```

And there it is! Come back next week to learn how to manage DNS for ULAs, so you can use proper hostnames instead of those giant IPv6 addresses.

Learn more about Linux through the free ["Introduction to Linux" ][2]course from The Linux Foundation and edX.

--------------------------------------------------------------------------------

via: https://www.linux.com/learn/intro-to-linux/2017/12/ipv6-auto-configuration-linux

作者：[Carla Schroder][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linux.com/users/cschroder
[1]:https://www.linux.com/learn/intro-to-linux/2017/11/testing-ipv6-networking-kvm-part-1
[2]:https://training.linuxfoundation.org/linux-courses/system-administration-training/introduction-to-linux

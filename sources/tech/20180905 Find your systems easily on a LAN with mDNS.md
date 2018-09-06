Find your systems easily on a LAN with mDNS
======

![](https://fedoramagazine.org/wp-content/uploads/2018/09/mDNS-816x345.jpg)

Multicast DNS, or mDNS, lets systems broadcast queries on a local network to find other resources by name. Fedora users often own multiple Linux systems on a router without sophisticated name services. In that case, mDNS lets you talk to your multiple systems by name — without touching the router in most cases. You also don’t have to keep files like /etc/hosts in sync on all the local systems. This article shows you how to set it up.

mDNS is a zero-configuration networking service that’s been around for quite a while. Fedora ships Avahi, a zero-configuration stack that includes mDNS, as part of Workstation. (mDNS is also part of Bonjour, found on Mac OS.)

This article assumes you have two systems running supported versions of Fedora (27 or 28). Their host names are meant to be castor and pollux.

### Installing packages

Make sure the nss-mdns and avahi packages are installed on your system. You might have a different version, which is fine:
```
$ rpm -q nss-mdns avahi
nss-mdns-0.14.1-1.fc28.x86_64
avahi-0.7-13.fc28.x86_64

```

Fedora Workstation provides both of these packages by default. If not present, install them:
```
$ sudo dnf install nss-mdns avahi

```

Make sure the avahi-daemon.service unit is enabled and running. Again, this is the default on Fedora Workstation.
```
$ sudo systemctl enable --now avahi-daemon.service

```

Although optional, you might also want to install the avahi-tools package. This package includes a number of handy utilities for checking how well the zero-configuration services on your system are working. Use this sudo command:
```
$ sudo dnf install avahi-tools

```

The /etc/nsswitch.conf file controls which services your system uses to resolve services, and in what order. You should see a line like this in that file:
```
hosts: files mdns4_minimal [NOTFOUND=return] dns myhostname

```

Notice the commands mdns4_minimal [NOTFOUND=return]. They tell your system to use the multicast DNS resolver to resolve a hostname to an IP address. Even if that service works, the remaining services are tried if the name doesn’t resolve.

If you don’t see a configuration similar to this, you can edit it (as the root user). However, the nss-mdns package handles this for you. Remove and reinstall that package to fix the file, if you’re uncomfortable editing it yourself.

Follow the steps above for **both systems**.

### Setting host name and testing

Now that you’ve done the common configuration work, set up each host’s name in one of these ways:

  1. If you’re using Fedora Workstation, [you can use this procedure][1].

  2. If not, use hostnamectl to do the honors. Do this for the first box:
```
$ hostnamectl set-hostname castor

```

  3. You can also edit the /etc/avahi/avahi-daemon.conf file, remove the comment on the host-name setting line, and set the name there. By default, though, Avahi uses the system provided host name, so you **shouldn’t** need this method.

Next, restart the Avahi daemon so it picks up changes:
```
$ sudo systemctl restart avahi-daemon.service

```

Then set your other box properly:
```
$ hostnamectl set-hostname pollux
$ sudo systemctl restart avahi-daemon.service

```

As long as your network router is not disallowing mDNS traffic, you should now be able to login to castor and ping the other box. You should use the default .local domain name so resolution works correctly:
```
$ ping pollux.local
PING pollux.local (192.168.0.1) 56(84) bytes of data.
64 bytes from 192.168.0.1 (192.168.0.1): icmp_seq=1 ttl=64 time=3.17 ms
64 bytes from 192.168.0.1 (192.168.0.1): icmp_seq=2 ttl=64 time=1.24 ms
...

```

The same trick should also work from pollux if you ping castor.local. It’s much more convenient now to access your systems around the network!

Moreover, don’t be surprised if your router advertises services. Modern WiFi and wired routers often provide these services to make life easier for consumers.

This process works for most systems. However, if you run into trouble, use avahi-browse and other tools from the avahi-tools package to see what services are available.


--------------------------------------------------------------------------------

via: https://fedoramagazine.org/find-systems-easily-lan-mdns/

作者：[Paul W. Frields][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/pfrields/
[1]: https://fedoramagazine.org/set-hostname-fedora/

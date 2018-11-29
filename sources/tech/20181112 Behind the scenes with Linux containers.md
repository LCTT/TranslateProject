Behind the scenes with Linux containers
======
Become a better container troubleshooter by using LXC to understand how they work.
![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/rh_003499_01_linux11x_cc.png?itok=XMDOouJR)

Can you have Linux containers without [Docker][1]? Without [OpenShift][2]? Without [Kubernetes][3]?

Yes, you can. Years before Docker made containers a household term (if you live in a data center, that is), the [LXC][4] project developed the concept of running a kind of virtual operating system, sharing the same kernel, but contained within defined groups of processes.

Docker built on LXC, and today there are plenty of platforms that leverage the work of LXC both directly and indirectly. Most of these platforms make creating and maintaining containers sublimely simple, and for large deployments, it makes sense to use such specialized services. However, not everyone's managing a large deployment or has access to big services to learn about containerization. The good news is that you can create, use, and learn containers with nothing more than a PC running Linux and this article. This article will help you understand containers by looking at LXC, how it works, why it works, and how to troubleshoot when something goes wrong.

### Sidestepping the simplicity

If you're looking for a quick-start guide to LXC, refer to the excellent [Linux Containers][5] website.

### Installing LXC

If it's not already installed, you can install [LXC][6] with your package manager.

On Fedora or similar, enter:

```
$ sudo dnf install lxc lxc-templates lxc-doc
```

On Debian, Ubuntu, and similar, enter:

```
$ sudo apt install lxc
```

### Creating a network bridge

Most containers assume a network will be available, and most container tools expect the user to be able to create virtual network devices. The most basic unit required for containers is the network bridge, which is more or less the software equivalent of a network switch. A network switch is a little like a smart Y-adapter used to split a headphone jack so two people can hear the same thing with separate headsets, except instead of an audio signal, a network switch bridges network data.

You can create your own software network bridge so your host computer and your container OS can both send and receive different network data over a single network device (either your Ethernet port or your wireless card). This is an important concept that often gets lost once you graduate from manually generating containers, because no matter the size of your deployment, it's highly unlikely you have a dedicated physical network card for each container you run. It's vital to understand that containers talk to virtual network devices, so you know where to start troubleshooting if a container loses its network connection.

To create a network bridge on your machine, you must have the appropriate permissions. For this article, use the **sudo** command to operate with root privileges. (However, LXC docs provide a configuration to grant users permission to do this without using **sudo**.)

```
$ sudo ip link add br0 type bridge
```

Verify that the imaginary network interface has been created:

```
$ sudo ip addr show br0
7: br0: <BROADCAST,MULTICAST> mtu 1500 qdisc
   noop state DOWN group default qlen 1000
   link/ether 26:fa:21:5f:cf:99 brd ff:ff:ff:ff:ff:ff
```

Since **br0** is seen as a network interface, it requires its own IP address. Choose a valid local IP address that doesn't conflict with any existing IP address on your network and assign it to the **br0** device:

```
$ sudo ip addr add 192.168.168.168 dev br0
```

And finally, ensure that **br0** is up and running:

```
$ sudo ip link set br0 up
```

### Setting the container config

The config file for an LXC container can be as complex as it needs to be to define a container's place in your network and the host system, but for this example the config is simple. Create a file in your favorite text editor and define a name for the container and the network's required settings:

```
lxc.utsname = opensourcedotcom
lxc.network.type = veth
lxc.network.flags = up
lxc.network.link = br0
lxc.network.hwaddr = 4a:49:43:49:79:bd
lxc.network.ipv4 = 192.168.168.1/24
lxc.network.ipv6 = 2003:db8:1:0:214:1234:fe0b:3596
```

Save this file in your home directory as **mycontainer.conf**.

The **lxc.utsname** is arbitrary. You can call your container whatever you like; it's the name you'll use when starting and stopping it.

The network type is set to **veth** , which is a kind of virtual Ethernet patch cable. The idea is that the **veth** connection goes from the container to the bridge device, which is defined by the **lxc.network.link** property, set to **br0**. The IP address for the container is in the same network as the bridge device but unique to avoid collisions.

With the exception of the **veth** network type and the **up** network flag, you invent all the values in the config file. The list of properties is available from **man lxc.container.conf**. (If it's missing on your system, check your package manager for separate LXC documentation packages.) There are several example config files in **/usr/share/doc/lxc/examples** , which you should review later.

### Launching a container shell

At this point, you're two-thirds of the way to an operable container: you have the network infrastructure, and you've installed the imaginary network cards in an imaginary PC. All you need now is to install an operating system.

However, even at this stage, you can see LXC at work by launching a shell within a container space.

```
$ sudo lxc-execute --name basic \
--rcfile ~/mycontainer.conf /bin/bash \
--logfile mycontainer.log
#
```

In this very bare container, look at your network configuration. It should look familiar, yet unique, to you.

```
# /usr/sbin/ip addr show
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state [...]
link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
inet 127.0.0.1/8 scope host lo
[...]
22: eth0@if23: <BROADCAST,MULTICAST,UP,LOWER_UP> [...] qlen 1000
link/ether 4a:49:43:49:79:bd brd ff:ff:ff:ff:ff:ff link-netnsid 0
inet 192.168.168.167/24 brd 192.168.168.255 scope global eth0
   valid_lft forever preferred_lft forever
inet6 2003:db8:1:0:214:1234:fe0b:3596/64 scope global
   valid_lft forever preferred_lft forever
[...]
```

Your container is aware of its fake network infrastructure and of a familiar-yet-unique kernel.

```
# uname -av
Linux opensourcedotcom 4.18.13-100.fc27.x86_64 #1 SMP Wed Oct 10 18:34:01 UTC 2018 x86_64 x86_64 x86_64 GNU/Linux
```

Use the **exit** command to leave the container:

```
# exit
```

### Installing the container operating system

Building out a fully containerized environment is a lot more complex than the networking and config steps, so you can borrow a container template from LXC. If you don't have any templates, look for a separate LXC template package in your software repository.

The default LXC templates are available in **/usr/share/lxc/templates**.

```
$ ls -m /usr/share/lxc/templates/
lxc-alpine, lxc-altlinux, lxc-archlinux, lxc-busybox, lxc-centos, lxc-cirros, lxc-debian, lxc-download, lxc-fedora, lxc-gentoo, lxc-openmandriva, lxc-opensuse, lxc-oracle, lxc-plamo, lxc-slackware, lxc-sparclinux, lxc-sshd, lxc-ubuntu, lxc-ubuntu-cloud
```

Pick your favorite, then create the container. This example uses Slackware.

```
$ sudo lxc-create --name slackware --template slackware
```

Watching a template being executed is almost as educational as building one from scratch; it's very verbose, and you can see that **lxc-create** sets the  "root" of the container to **/var/lib/lxc/slackware/rootfs** and several packages are being downloaded and installed to that directory.

Reading through the template files gives you an even better idea of what's involved: LXC sets up a minimal device tree, common spool files, a file systems table (fstab), init files, and so on. It also prevents some services that make no sense in a container (like udev for hardware detection) from starting. Since the templates cover a wide spectrum of typical Linux configurations, if you intend to design your own, it's wise to base your work on a template closest to what you want to set up; otherwise, you're sure to make errors of omission (if nothing else) that the LXC project has already stumbled over and accounted for.

Once you've installed the minimal operating system environment, you can start your container.

```
$ sudo lxc-start --name slackware \
--rcfile ~/mycontainer.conf
```

You have started the container, but you have not attached to it. (Unlike the previous basic example, you're not just running a shell this time, but a containerized operating system.) Attach to it by name.

```
$ sudo lxc-attach --name slackware
#
```

Check that the IP address of your environment matches the one in your config file.

```
# /usr/sbin/ip addr SHOW | grep eth
34: eth0@if35: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 [...] 1000
link/ether 4a:49:43:49:79:bd brd ff:ff:ff:ff:ff:ff link-netnsid 0
inet 192.168.168.167/24 brd 192.168.168.255 scope global eth0
```

Exit the container, and shut it down.

```
# exit
$ sudo lxc-stop slackware
```

### Running real-world containers with LXC

In real life, LXC makes it easy to create and run safe and secure containers. Containers have come a long way since the introduction of LXC in 2008, so use its developers' expertise to your advantage.

While the LXC instructions on [linuxcontainers.org][5] make the process simple, this tour of the manual side of things should help you understand what's going on behind the scenes.

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/11/behind-scenes-linux-containers

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/resources/what-docker
[2]: https://opensource.com/sitewide-search?search_api_views_fulltext=openshift
[3]: https://opensource.com/resources/what-is-kubernetes
[4]: https://linuxcontainers.org
[5]: https://linuxcontainers.org/lxc/getting-started
[6]: https://github.com/lxc/lxc

Translating By LHRchina


Ubuntu Core in LXD containers
============================================================


### Share or save

![LXD logo](https://linuxcontainers.org/static/img/containers.png)

### What’s Ubuntu Core?

Ubuntu Core is a version of Ubuntu that’s fully transactional and entirely based on snap packages.

Most of the system is read-only. All installed applications come from snap packages and all updates are done using transactions. Meaning that should anything go wrong at any point during a package or system update, the system will be able to revert to the previous state and report the failure.

The current release of Ubuntu Core is called series 16 and was released in November 2016.

Note that on Ubuntu Core systems, only snap packages using confinement can be installed (no “classic” snaps) and that a good number of snaps will not fully work in this environment or will require some manual intervention (creating user and groups, …). Ubuntu Core gets improved on a weekly basis as new releases of snapd and the “core” snap are put out.

### Requirements

As far as LXD is concerned, Ubuntu Core is just another Linux distribution. That being said, snapd does require unprivileged FUSE mounts and AppArmor namespacing and stacking, so you will need the following:

*   An up to date Ubuntu system using the official Ubuntu kernel

*   An up to date version of LXD

### Creating an Ubuntu Core container

The Ubuntu Core images are currently published on the community image server.
You can launch a new container with:

```
stgraber@dakara:~$ lxc launch images:ubuntu-core/16 ubuntu-core
Creating ubuntu-core
Starting ubuntu-core
```

The container will take a few seconds to start, first executing a first stage loader that determines what read-only image to use and setup the writable layers. You don’t want to interrupt the container in that stage and “lxc exec” will likely just fail as pretty much nothing is available at that point.

Seconds later, “lxc list” will show the container IP address, indicating that it’s booted into Ubuntu Core:

```
stgraber@dakara:~$ lxc list
+-------------+---------+----------------------+----------------------------------------------+------------+-----------+
|     NAME    |  STATE  |          IPV4        |                      IPV6                    |    TYPE    | SNAPSHOTS |
+-------------+---------+----------------------+----------------------------------------------+------------+-----------+
| ubuntu-core | RUNNING | 10.90.151.104 (eth0) | 2001:470:b368:b2b5:216:3eff:fee1:296f (eth0) | PERSISTENT | 0         |
+-------------+---------+----------------------+----------------------------------------------+------------+-----------+
```

You can then interact with that container the same way you would any other:

```
stgraber@dakara:~$ lxc exec ubuntu-core bash
root@ubuntu-core:~# snap list
Name       Version     Rev  Developer  Notes
core       16.04.1     394  canonical  -
pc         16.04-0.8   9    canonical  -
pc-kernel  4.4.0-45-4  37   canonical  -
root@ubuntu-core:~#
```

### Updating the container

If you’ve been tracking the development of Ubuntu Core, you’ll know that those versions above are pretty old. That’s because the disk images that are used as the source for the Ubuntu Core LXD images are only refreshed every few months. Ubuntu Core systems will automatically update once a day and then automatically reboot to boot onto the new version (and revert if this fails).

If you want to immediately force an update, you can do it with:

```
stgraber@dakara:~$ lxc exec ubuntu-core bash
root@ubuntu-core:~# snap refresh
pc-kernel (stable) 4.4.0-53-1 from 'canonical' upgraded
core (stable) 16.04.1 from 'canonical' upgraded
root@ubuntu-core:~# snap version
snap 2.17
snapd 2.17
series 16
root@ubuntu-core:~#
```

And then reboot the system and check the snapd version again:

```
root@ubuntu-core:~# reboot
root@ubuntu-core:~# 

stgraber@dakara:~$ lxc exec ubuntu-core bash
root@ubuntu-core:~# snap version
snap 2.21
snapd 2.21
series 16
root@ubuntu-core:~#
```

You can get an history of all snapd interactions with

```
stgraber@dakara:~$ lxc exec ubuntu-core snap changes
ID  Status  Spawn                 Ready                 Summary
1   Done    2017-01-31T05:14:38Z  2017-01-31T05:14:44Z  Initialize system state
2   Done    2017-01-31T05:14:40Z  2017-01-31T05:14:45Z  Initialize device
3   Done    2017-01-31T05:21:30Z  2017-01-31T05:22:45Z  Refresh all snaps in the system
```

### Installing some snaps

Let’s start with the simplest snaps of all, the good old Hello World:

```
stgraber@dakara:~$ lxc exec ubuntu-core bash
root@ubuntu-core:~# snap install hello-world
hello-world 6.3 from 'canonical' installed
root@ubuntu-core:~# hello-world
Hello World!
```

And then move on to something a bit more useful:

```
stgraber@dakara:~$ lxc exec ubuntu-core bash
root@ubuntu-core:~# snap install nextcloud
nextcloud 11.0.1snap2 from 'nextcloud' installed
```

Then hit your container over HTTP and you’ll get to your newly deployed Nextcloud instance.

If you feel like testing the latest LXD straight from git, you can do so with:

```
stgraber@dakara:~$ lxc config set ubuntu-core security.nesting true
stgraber@dakara:~$ lxc exec ubuntu-core bash
root@ubuntu-core:~# snap install lxd --edge
lxd (edge) git-c6006fb from 'canonical' installed
root@ubuntu-core:~# lxd init
Name of the storage backend to use (dir or zfs) [default=dir]: 

We detected that you are running inside an unprivileged container.
This means that unless you manually configured your host otherwise,
you will not have enough uid and gid to allocate to your containers.

LXD can re-use your container's own allocation to avoid the problem.
Doing so makes your nested containers slightly less safe as they could
in theory attack their parent container and gain more privileges than
they otherwise would.

Would you like to have your containers share their parent's allocation (yes/no) [default=yes]? 
Would you like LXD to be available over the network (yes/no) [default=no]? 
Would you like stale cached images to be updated automatically (yes/no) [default=yes]? 
Would you like to create a new network bridge (yes/no) [default=yes]? 
What should the new bridge be called [default=lxdbr0]? 
What IPv4 address should be used (CIDR subnet notation, “auto” or “none”) [default=auto]? 
What IPv6 address should be used (CIDR subnet notation, “auto” or “none”) [default=auto]? 
LXD has been successfully configured.
```

And because container inception never gets old, lets run Ubuntu Core 16 inside Ubuntu Core 16:

```
root@ubuntu-core:~# lxc launch images:ubuntu-core/16 nested-core
Creating nested-core
Starting nested-core 
root@ubuntu-core:~# lxc list
+-------------+---------+---------------------+-----------------------------------------------+------------+-----------+
|    NAME     |  STATE  |         IPV4        |                       IPV6                    |    TYPE    | SNAPSHOTS |
+-------------+---------+---------------------+-----------------------------------------------+------------+-----------+
| nested-core | RUNNING | 10.71.135.21 (eth0) | fd42:2861:5aad:3842:216:3eff:feaf:e6bd (eth0) | PERSISTENT | 0         |
+-------------+---------+---------------------+-----------------------------------------------+------------+-----------+
```

### Conclusion

If you ever wanted to try Ubuntu Core, this is a great way to do it. It’s also a great tool for snap authors to make sure their snap is fully self-contained and will work in all environments.

Ubuntu Core is a great fit for environments where you want to ensure that your system is always up to date and is entirely reproducible. This does come with a number of constraints that may or may not work for you.

And lastly, a word of warning. Those images are considered as good enough for testing, but aren’t officially supported at this point. We are working towards getting fully supported Ubuntu Core LXD images on the official Ubuntu image server in the near future.

### Extra information

The main LXD website is at: [https://linuxcontainers.org/lxd][2] Development happens on Github at: [https://github.com/lxc/lxd][3]
Mailing-list support happens on: [https://lists.linuxcontainers.org][4]
IRC support happens in: #lxcontainers on irc.freenode.net
Try LXD online: [https://linuxcontainers.org/lxd/try-it][5]

--------------------------------------------------------------------------------

via: https://insights.ubuntu.com/2017/02/27/ubuntu-core-in-lxd-containers/

作者：[Stéphane Graber  ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://insights.ubuntu.com/author/stgraber/
[1]:https://insights.ubuntu.com/author/stgraber/
[2]:https://linuxcontainers.org/lxd
[3]:https://github.com/lxc/lxd
[4]:https://lists.linuxcontainers.org/
[5]:https://linuxcontainers.org/lxd/try-it

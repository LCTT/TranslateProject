Part 9 - LXD 2.0: Live migration
=================================

This is the ninth blog post [in this series about LXD 2.0][0].

![](https://linuxcontainers.org/static/img/containers.png)

### Introduction

One of the very exciting feature of LXD 2.0, albeit experimental, is the support for container checkpoint and restore.

Simply put, checkpoint/restore means that the running container state can be serialized down to disk and then restored, either on the same host as a stateful snapshot of the container or on another host which equates to live migration.

### Requirements

To have access to container live migration and stateful snapshots, you need the following:

- A very recent Linux kernel, 4.4 or higher.
- CRIU 2.0, possibly with some cherry-picked commits depending on your exact kernel configuration.
- Run LXD directly on the host. It’s not possible to use those features with container nesting.
- For migration, the target machine must at least implement the instruction set of the source, the target kernel must at least offer the same syscalls as the source and any kernel filesystem which was mounted on the source must also be mountable on the target.

All the needed dependencies are provided by Ubuntu 16.04 LTS, in which case, all you need to do is install CRIU itself:

```
apt install criu
```

### Using the thing

#### Stateful snapshots

A normal container snapshot looks like:

```
stgraber@dakara:~$ lxc snapshot c1 first
stgraber@dakara:~$ lxc info c1 | grep first
 first (taken at 2016/04/25 19:35 UTC) (stateless)
 ```
 
A stateful snapshot instead looks like:

```
stgraber@dakara:~$ lxc snapshot c1 second --stateful
stgraber@dakara:~$ lxc info c1 | grep second
 second (taken at 2016/04/25 19:36 UTC) (stateful)
 ```
 
This means that all the container runtime state was serialized to disk and included as part of the snapshot. Restoring one such snapshot is done as you would a stateless one:

```
stgraber@dakara:~$ lxc restore c1 second
stgraber@dakara:~$
```

#### Stateful stop/start

Say you want to reboot your server for a kernel update or similar maintenance. Rather than have to wait for all the containers to start from scratch after reboot, you can do:

```
stgraber@dakara:~$ lxc stop c1 --stateful
```

The container state will be written to disk and then picked up the next time you start it.

You can even look at what the state looks like:

```
root@dakara:~# tree /var/lib/lxd/containers/c1/rootfs/state/
/var/lib/lxd/containers/c1/rootfs/state/
├── cgroup.img
├── core-101.img
├── core-102.img
├── core-107.img
├── core-108.img
├── core-109.img
├── core-113.img
├── core-114.img
├── core-122.img
├── core-125.img
├── core-126.img
├── core-127.img
├── core-183.img
├── core-1.img
├── core-245.img
├── core-246.img
├── core-50.img
├── core-52.img
├── core-95.img
├── core-96.img
├── core-97.img
├── core-98.img
├── dump.log
├── eventfd.img
├── eventpoll.img
├── fdinfo-10.img
├── fdinfo-11.img
├── fdinfo-12.img
├── fdinfo-13.img
├── fdinfo-14.img
├── fdinfo-2.img
├── fdinfo-3.img
├── fdinfo-4.img
├── fdinfo-5.img
├── fdinfo-6.img
├── fdinfo-7.img
├── fdinfo-8.img
├── fdinfo-9.img
├── fifo-data.img
├── fifo.img
├── filelocks.img
├── fs-101.img
├── fs-113.img
├── fs-122.img
├── fs-183.img
├── fs-1.img
├── fs-245.img
├── fs-246.img
├── fs-50.img
├── fs-52.img
├── fs-95.img
├── fs-96.img
├── fs-97.img
├── fs-98.img
├── ids-101.img
├── ids-113.img
├── ids-122.img
├── ids-183.img
├── ids-1.img
├── ids-245.img
├── ids-246.img
├── ids-50.img
├── ids-52.img
├── ids-95.img
├── ids-96.img
├── ids-97.img
├── ids-98.img
├── ifaddr-9.img
├── inetsk.img
├── inotify.img
├── inventory.img
├── ip6tables-9.img
├── ipcns-var-10.img
├── iptables-9.img
├── mm-101.img
├── mm-113.img
├── mm-122.img
├── mm-183.img
├── mm-1.img
├── mm-245.img
├── mm-246.img
├── mm-50.img
├── mm-52.img
├── mm-95.img
├── mm-96.img
├── mm-97.img
├── mm-98.img
├── mountpoints-12.img
├── netdev-9.img
├── netlinksk.img
├── netns-9.img
├── netns-ct-9.img
├── netns-exp-9.img
├── packetsk.img
├── pagemap-101.img
├── pagemap-113.img
├── pagemap-122.img
├── pagemap-183.img
├── pagemap-1.img
├── pagemap-245.img
├── pagemap-246.img
├── pagemap-50.img
├── pagemap-52.img
├── pagemap-95.img
├── pagemap-96.img
├── pagemap-97.img
├── pagemap-98.img
├── pages-10.img
├── pages-11.img
├── pages-12.img
├── pages-13.img
├── pages-1.img
├── pages-2.img
├── pages-3.img
├── pages-4.img
├── pages-5.img
├── pages-6.img
├── pages-7.img
├── pages-8.img
├── pages-9.img
├── pipes-data.img
├── pipes.img
├── pstree.img
├── reg-files.img
├── remap-fpath.img
├── route6-9.img
├── route-9.img
├── rule-9.img
├── seccomp.img
├── sigacts-101.img
├── sigacts-113.img
├── sigacts-122.img
├── sigacts-183.img
├── sigacts-1.img
├── sigacts-245.img
├── sigacts-246.img
├── sigacts-50.img
├── sigacts-52.img
├── sigacts-95.img
├── sigacts-96.img
├── sigacts-97.img
├── sigacts-98.img
├── signalfd.img
├── stats-dump
├── timerfd.img
├── tmpfs-dev-104.tar.gz.img
├── tmpfs-dev-109.tar.gz.img
├── tmpfs-dev-110.tar.gz.img
├── tmpfs-dev-112.tar.gz.img
├── tmpfs-dev-114.tar.gz.img
├── tty.info
├── unixsk.img
├── userns-13.img
└── utsns-11.img

0 directories, 154 files
```

Restoring the container can be done with a simple:

```
stgraber@dakara:~$ lxc start c1
```

### Live migration

Live migration is basically the same as the stateful stop/start above, except that the container directory and configuration happens to be moved to another machine too.

```
stgraber@dakara:~$ lxc list c1
+------+---------+-----------------------+----------------------------------------------+------------+-----------+
| NAME |  STATE  |          IPV4         |                     IPV6                     |    TYPE    | SNAPSHOTS |
+------+---------+-----------------------+----------------------------------------------+------------+-----------+
| c1   | RUNNING | 10.178.150.197 (eth0) | 2001:470:b368:4242:216:3eff:fe19:27b0 (eth0) | PERSISTENT | 2         |
+------+---------+-----------------------+----------------------------------------------+------------+-----------+

stgraber@dakara:~$ lxc list s-tollana:
+------+-------+------+------+------+-----------+
| NAME | STATE | IPV4 | IPV6 | TYPE | SNAPSHOTS |
+------+-------+------+------+------+-----------+

stgraber@dakara:~$ lxc move c1 s-tollana:

stgraber@dakara:~$ lxc list c1
+------+-------+------+------+------+-----------+
| NAME | STATE | IPV4 | IPV6 | TYPE | SNAPSHOTS |
+------+-------+------+------+------+-----------+

stgraber@dakara:~$ lxc list s-tollana:
+------+---------+-----------------------+----------------------------------------------+------------+-----------+
| NAME |  STATE  |          IPV4         |                     IPV6                     |    TYPE    | SNAPSHOTS |
+------+---------+-----------------------+----------------------------------------------+------------+-----------+
| c1   | RUNNING | 10.178.150.197 (eth0) | 2001:470:b368:4242:216:3eff:fe19:27b0 (eth0) | PERSISTENT | 2         |
+------+---------+-----------------------+----------------------------------------------+------------+-----------+
```

### Limitations

As I said before, checkpoint/restore of containers is still pretty new and we’re still very much working on this feature, fixing issues as we are made aware of them. We do need more people trying this feature and sending us feedback, I would however not recommend using this in production just yet.

The current list of issues we’re tracking is [available on Launchpad][1].

We expect a basic Ubuntu container with a few services to work properly with CRIU in Ubuntu 16.04. However more complex containers, using device passthrough, complex network services or special storage configurations are likely to fail.

Whenever possible, CRIU will fail at dump time, rather than at restore time. In such cases, the source container will keep running, the snapshot or migration will simply fail and a log file will be generated for debugging.

In rare cases, CRIU fails to restore the container, in which case the source container will still be around but will be stopped and will have to be manually restarted.

### Sending bug reports

We’re tracking bugs related to checkpoint/restore against the CRIU Ubuntu package on Launchpad. Most of the work to fix those bugs will then happen upstream either on CRIU itself or the Linux kernel, but it’s easier for us to track things this way.

To file a new bug report, head here.

Please make sure to include:

The command you ran and the error message as displayed to you

- Output of “lxc info” (*)
- Output of “lxc info <container name>”
- Output of “lxc config show –expanded <container name>”
- Output of “dmesg” (*)
- Output of “/proc/self/mountinfo” (*)
- Output of “lxc exec <container name> — cat /proc/self/mountinfo”
- Output of “uname -a” (*)
- The content of /var/log/lxd.log (*)
- The content of /etc/default/lxd-bridge (*)
- A tarball of /var/log/lxd/<container name>/ (*)

If reporting a migration bug as opposed to a stateful snapshot or stateful stop bug, please include the data for both the source and target for any of the above which has been marked with a (*).

### Extra information

The CRIU website can be found at: <https://criu.org>

The main LXD website is at: <https://linuxcontainers.org/lxd>

Development happens on Github at: <https://github.com/lxc/lxd>

Mailing-list support happens on: <https://lists.linuxcontainers.org>

IRC support happens in: #lxcontainers on irc.freenode.net


--------------------------------------------------------------------------------

via: https://www.stgraber.org/2016/03/19/lxd-2-0-your-first-lxd-container-312/

作者：[Stéphane Graber][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.stgraber.org/author/stgraber/
[0]: https://www.stgraber.org/2016/03/11/lxd-2-0-blog-post-series-012/
[1]: https://bugs.launchpad.net/ubuntu/+source/criu/+bugs
[3]: https://launchpad.net/ubuntu/+source/criu/+filebug?no-redirect

Part 4 - LXD 2.0: Resource control
======================================

This is the fourth blog post [in this series about LXD 2.0][0].

As there are a lot of commands involved with managing LXD containers, this post is rather long. If you’d instead prefer a quick step-by-step tour of those same commands, you can [try our online demo instead][1]!

![](https://linuxcontainers.org/static/img/containers.png)

### Available resource limits

LXD offers a variety of resource limits. Some of those are tied to the container itself, like memory quotas, CPU limits and I/O priorities. Some are tied to a particular device instead, like I/O bandwidth or disk usage limits.

As with all LXD configuration, resource limits can be dynamically changed while the container is running. Some may fail to apply, for example if setting a memory value smaller than the current memory usage, but LXD will try anyway and report back on failure.

All limits can also be inherited through profiles in which case each affected container will be constrained by that limit. That is, if you set limits.memory=256MB in the default profile, every container using the default profile (typically all of them) will have a memory limit of 256MB.

We don’t support resource limits pooling where a limit would be shared by a group of containers, there is simply no good way to implement something like that with the existing kernel APIs.

#### Disk

This is perhaps the most requested and obvious one. Simply setting a size limit on the container’s filesystem and have it enforced against the container.

And that’s exactly what LXD lets you do!
Unfortunately this is far more complicated than it sounds. Linux doesn’t have path-based quotas, instead most filesystems only have user and group quotas which are of little use to containers.

This means that right now LXD only supports disk limits if you’re using the ZFS or btrfs storage backend. It may be possible to implement this feature for LVM too but this depends on the filesystem being used with it and gets tricky when combined with live updates as not all filesystems allow online growth and pretty much none of them allow online shrink.

#### CPU

When it comes to CPU limits, we support 4 different things:

* Just give me X CPUs

  In this mode, you let LXD pick a bunch of cores for you and then load-balance things as more containers and CPUs go online/offline.
  
  The container only sees that number of CPU.
* Give me a specific set of CPUs (say, core 1, 3 and 5)

  Similar to the first mode except that no load-balancing is happening, you’re stuck with those cores no matter how busy they may be.
* Give me 20% of whatever you have

  In this mode, you get to see all the CPUs but the scheduler will restrict you to 20% of the CPU time but only when under load! So if the system isn’t busy, your container can have as much fun as it wants. When containers next to it start using the CPU, then it gets capped.
* Out of every measured 200ms, give me 50ms (and no more than that)

  This mode is similar to the previous one in that you get to see all the CPUs but this time, you can only use as much CPU time as you set in the limit, no matter how idle the system may be. On a system without over-commit this lets you slice your CPU very neatly and guarantees constant performance to those containers.

It’s also possible to combine one of the first two with one of the last two, that is, request a set of CPUs and then further restrict how much CPU time you get on those.

On top of that, we also have a generic priority knob which is used to tell the scheduler who wins when you’re under load and two containers are fighting for the same resource.

#### Memory

Memory sounds pretty simple, just give me X MB of RAM!

And it absolutely can be that simple. We support that kind of limits as well as percentage based requests, just give me 10% of whatever the host has!

Then we support some extra stuff on top. For example, you can choose to turn swap on and off on a per-container basis and if it’s on, set a priority so you can choose what container will have their memory swapped out to disk first!

Oh and memory limits are “hard” by default. That is, when you run out of memory, the kernel out of memory killer will start having some fun with your processes.

Alternatively you can set the enforcement policy to “soft”, in which case you’ll be allowed to use as much memory as you want so long as nothing else is. As soon as something else wants that memory, you won’t be able to allocate anything until you’re back under your limit or until the host has memory to spare again.

#### Network I/O

Network I/O is probably our simplest looking limit, trust me, the implementation really isn’t simple though!

We support two things. The first is a basic bit/s limits on network interfaces. You can set a limit of ingress and egress or just set the “max” limit which then applies to both. This is only supported for “bridged” and “p2p” type interfaces.

The second thing is a global network I/O priority which only applies when the network interface you’re trying to talk through is saturated.

#### Block I/O

I kept the weirdest for last. It may look straightforward and feel like that to the user but there are a bunch of cases where it won’t exactly do what you think it should.

What we support here is basically identical to what I described in Network I/O.

You can set IOps or byte/s read and write limits directly on a disk device entry and there is a global block I/O priority which tells the I/O scheduler who to prefer.

The weirdness comes from how and where those limits are applied. Unfortunately the underlying feature we use to implement those uses full block devices. That means we can’t set per-partition I/O limits let alone per-path.

It also means that when using ZFS or btrfs which can use multiple block devices to back a given path (with or without RAID), we effectively don’t know what block device is providing a given path.

This means that it’s entirely possible, in fact likely, that a container may have multiple disk entries (bind-mounts or straight mounts) which are coming from the same underlying disk.

And that’s where things get weird. To make things work, LXD has logic to guess what block devices back a given path, this does include interrogating the ZFS and btrfs tools and even figures things out recursively when it finds a loop mounted file backing a filesystem.

That logic while not perfect, usually yields a set of block devices that should have a limit applied. LXD then records that and moves on to the next path. When it’s done looking at all the paths, it gets to the very weird part. It averages the limits you’ve set for every affected block devices and then applies those.

That means that “in average” you’ll be getting the right speed in the container, but it also means that you can’t have a “/fast” and a “/slow” directory both coming from the same physical disk and with differing speed limits. LXD will let you set it up but in the end, they’ll both give you the average of the two values.

### How does it all work?

Most of the limits described above are applied through the Linux kernel Cgroups API. That’s with the exception of the network limits which are applied through good old “tc”.

LXD at startup time detects what cgroups are enabled in your kernel and will only apply the limits which your kernel support. Should you be missing some cgroups, a warning will also be printed by the daemon which will then get logged by your init system.

On Ubuntu 16.04, everything is enabled by default with the exception of swap memory accounting which requires you pass the “swapaccount=1” kernel boot parameter.

### Applying some limits

All the limits described above are applied directly to the container or to one of its profiles. Container-wide limits are applied with:

```
lxc config set CONTAINER KEY VALUE
```

or for a profile:

```
lxc profile set PROFILE KEY VALUE
```

while device-specific ones are applied with:

```
lxc config device set CONTAINER DEVICE KEY VALUE
```

or for a profile:

```
lxc profile device set PROFILE DEVICE KEY VALUE
```

The complete list of valid configuration keys, device types and device keys can be [found here][1].

#### CPU

To just limit a container to any 2 CPUs, do:

```
lxc config set my-container limits.cpu 2
```

To pin to specific CPU cores, say the second and fourth:

```
lxc config set my-container limits.cpu 1,3
```

More complex pinning ranges like this works too:

```
lxc config set my-container limits.cpu 0-3,7-11
```

The limits are applied live, as can be seen in this example:

```
stgraber@dakara:~$ lxc exec zerotier -- cat /proc/cpuinfo | grep ^proces
processor : 0
processor : 1
processor : 2
processor : 3
stgraber@dakara:~$ lxc config set zerotier limits.cpu 2
stgraber@dakara:~$ lxc exec zerotier -- cat /proc/cpuinfo | grep ^proces
processor : 0
processor : 1
```

Note that to avoid utterly confusing userspace, lxcfs arranges the /proc/cpuinfo entries so that there are no gaps.

As with just about everything in LXD, those settings can also be applied in profiles:

```
stgraber@dakara:~$ lxc exec snappy -- cat /proc/cpuinfo | grep ^proces
processor : 0
processor : 1
processor : 2
processor : 3
stgraber@dakara:~$ lxc profile set default limits.cpu 3
stgraber@dakara:~$ lxc exec snappy -- cat /proc/cpuinfo | grep ^proces
processor : 0
processor : 1
processor : 2
```

To limit the CPU time of a container to 10% of the total, set the CPU allowance:

```
lxc config set my-container limits.cpu.allowance 10%
```

Or to give it a fixed slice of CPU time:

```
lxc config set my-container limits.cpu.allowance 25ms/200ms
```

And lastly, to reduce the priority of a container to a minimum:

```
lxc config set my-container limits.cpu.priority 0
```

#### Memory

To apply a straightforward memory limit run:

```
lxc config set my-container limits.memory 256MB
```

(The supported suffixes are kB, MB, GB, TB, PB and EB)

To turn swap off for the container (defaults to enabled):

```
lxc config set my-container limits.memory.swap false
```

To tell the kernel to swap this container’s memory first:

```
lxc config set my-container limits.memory.swap.priority 0
```

And finally if you don’t want hard memory limit enforcement:

```
lxc config set my-container limits.memory.enforce soft
```

#### Disk and block I/O

Unlike CPU and memory, disk and I/O limits are applied to the actual device entry, so you either need to edit the original device or mask it with a more specific one.

To set a disk limit (requires btrfs or ZFS):

```
lxc config device set my-container root size 20GB
```

For example:

```
stgraber@dakara:~$ lxc exec zerotier -- df -h /
Filesystem                        Size Used Avail Use% Mounted on
encrypted/lxd/containers/zerotier 179G 542M  178G   1% /
stgraber@dakara:~$ lxc config device set zerotier root size 20GB
stgraber@dakara:~$ lxc exec zerotier -- df -h /
Filesystem                       Size  Used Avail Use% Mounted on
encrypted/lxd/containers/zerotier 20G  542M   20G   3% /
```

To restrict speed you can do the following:

```
lxc config device set my-container root limits.read 30MB
lxc config device set my-container root.limits.write 10MB
```

Or to restrict IOps instead:

```
lxc config device set my-container root limits.read 20Iops
lxc config device set my-container root limits.write 10Iops
```

And lastly, if you’re on a busy system with over-commit, you may want to also do:

```
lxc config set my-container limits.disk.priority 10
```

To increase the I/O priority for that container to the maximum.

#### Network I/O

Network I/O is basically identical to block I/O as far the knobs available.

For example:

```
stgraber@dakara:~$ lxc exec zerotier -- wget http://speedtest.newark.linode.com/100MB-newark.bin -O /dev/null
--2016-03-26 22:17:34-- http://speedtest.newark.linode.com/100MB-newark.bin
Resolving speedtest.newark.linode.com (speedtest.newark.linode.com)... 50.116.57.237, 2600:3c03::4b
Connecting to speedtest.newark.linode.com (speedtest.newark.linode.com)|50.116.57.237|:80... connected.
HTTP request sent, awaiting response... 200 OK
Length: 104857600 (100M) [application/octet-stream]
Saving to: '/dev/null'

/dev/null 100%[===================>] 100.00M 58.7MB/s in 1.7s 

2016-03-26 22:17:36 (58.7 MB/s) - '/dev/null' saved [104857600/104857600]

stgraber@dakara:~$ lxc profile device set default eth0 limits.ingress 100Mbit
stgraber@dakara:~$ lxc profile device set default eth0 limits.egress 100Mbit
stgraber@dakara:~$ lxc exec zerotier -- wget http://speedtest.newark.linode.com/100MB-newark.bin -O /dev/null
--2016-03-26 22:17:47-- http://speedtest.newark.linode.com/100MB-newark.bin
Resolving speedtest.newark.linode.com (speedtest.newark.linode.com)... 50.116.57.237, 2600:3c03::4b
Connecting to speedtest.newark.linode.com (speedtest.newark.linode.com)|50.116.57.237|:80... connected.
HTTP request sent, awaiting response... 200 OK
Length: 104857600 (100M) [application/octet-stream]
Saving to: '/dev/null'

/dev/null 100%[===================>] 100.00M 11.4MB/s in 8.8s 

2016-03-26 22:17:56 (11.4 MB/s) - '/dev/null' saved [104857600/104857600]
```

And that’s how you throttle an otherwise nice gigabit connection to a mere 100Mbit/s one!

And as with block I/O, you can set an overall network priority with:

```
lxc config set my-container limits.network.priority 5
```

### Getting the current resource usage

The [LXD API][2] exports quite a bit of information on current container resource usage, you can get:

* Memory: current, peak, current swap and peak swap
* Disk: current disk usage
* Network: bytes and packets received and transferred for every interface

And now if you’re running a very recent LXD (only in git at the time of this writing), you can also get all of those in “lxc info”:

```
stgraber@dakara:~$ lxc info zerotier
Name: zerotier
Architecture: x86_64
Created: 2016/02/20 20:01 UTC
Status: Running
Type: persistent
Profiles: default
Pid: 29258
Ips:
 eth0: inet 172.17.0.101
 eth0: inet6 2607:f2c0:f00f:2700:216:3eff:feec:65a8
 eth0: inet6 fe80::216:3eff:feec:65a8
 lo: inet 127.0.0.1
 lo: inet6 ::1
 lxcbr0: inet 10.0.3.1
 lxcbr0: inet6 fe80::f0bd:55ff:feee:97a2
 zt0: inet 29.17.181.59
 zt0: inet6 fd80:56c2:e21c:0:199:9379:e711:b3e1
 zt0: inet6 fe80::79:e7ff:fe0d:5123
Resources:
 Processes: 33
 Disk usage:
  root: 808.07MB
 Memory usage:
  Memory (current): 106.79MB
  Memory (peak): 195.51MB
  Swap (current): 124.00kB
  Swap (peak): 124.00kB
 Network usage:
  lxcbr0:
   Bytes received: 0 bytes
   Bytes sent: 570 bytes
   Packets received: 0
   Packets sent: 0
  zt0:
   Bytes received: 1.10MB
   Bytes sent: 806 bytes
   Packets received: 10957
   Packets sent: 10957
  eth0:
   Bytes received: 99.35MB
   Bytes sent: 5.88MB
   Packets received: 64481
   Packets sent: 64481
  lo:
   Bytes received: 9.57kB
   Bytes sent: 9.57kB
   Packets received: 81
   Packets sent: 81
Snapshots:
 zerotier/blah (taken at 2016/03/08 23:55 UTC) (stateless)
```
 
### Conclusion

The LXD team spent quite a few months iterating over the language we’re using for those limits. It’s meant to be as simple as it can get while remaining very powerful and specific when you want it to.

Live application of those limits and inheritance through profiles makes it a very powerful tool to live manage the load on your servers without impacting the running services.

### Extra information

The main LXD website is at: <https://linuxcontainers.org/lxd>
Development happens on Github at: <https://github.com/lxc/lxd>
Mailing-list support happens on: <https://lists.linuxcontainers.org>
IRC support happens in: #lxcontainers on irc.freenode.net

And if you don’t want or can’t install LXD on your own machine, you can always [try it online instead][3]!


--------------------------------------------------------------------------------

via: https://www.stgraber.org/2016/03/26/lxd-2-0-resource-control-412/

作者：[Stéphane Graber][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.stgraber.org/author/stgraber/
[0]: https://www.stgraber.org/2016/03/11/lxd-2-0-blog-post-series-012/
[1]: https://github.com/lxc/lxd/blob/master/doc/configuration.md
[2]: https://github.com/lxc/lxd/blob/master/doc/rest-api.md
[3]: https://linuxcontainers.org/lxd/try-it

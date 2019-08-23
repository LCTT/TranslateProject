[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (A guided tour of Linux file system types)
[#]: via: (https://www.networkworld.com/article/3432990/a-guided-tour-of-linux-file-system-types.html)
[#]: author: (Sandra Henry-Stocker https://www.networkworld.com/author/Sandra-Henry_Stocker/)

A guided tour of Linux file system types
======
Linux file systems have evolved over the years, and here's a look at file system types
![Andreas Lehner / Flickr \(CC BY 2.0\)][1]

While it may not be obvious to the casual user, Linux file systems have evolved significantly over the last decade or so to make them more resistant to corruption and performance problems.

Most Linux systems today use a file system type called **ext4**. The “ext” part stands for “extended” and the 4 indicates that this is the 4th generation of this file system type. Features added over time include the ability to provide increasingly larger file systems (currently as large as 1,000,000 TiB) and much larger files (up to 16 TiB), more resistance to system crashes and less fragmentation (scattering single files as chunks in multiple locations) which improves performance.

The **ext4** file system type also came with other improvements to performance, scalability and capacity. Metadata and journal checksums were implemented for reliability. Timestamps now track changes down to nanoseconds for better file time-stamping (e.g., file creation and last updates). And, with two additional bits in the timestamp field, the year 2038 problem (when the digitally stored date/time fields will roll over from maximum to zero) has been put off for more than 400 years (to 2446).

### File system types

To determine the type of file system on a Linux system, use the **df** command. The **T** option in the command shown below provides the file system type. The **h** makes the disk sizes “human-readable”; in other words, adjusting the reported units (such as M and G) in a way that makes the most sense to the people reading them.

```
$ df -hT | head -10
Filesystem     Type      Size  Used Avail Use% Mounted on
udev           devtmpfs  2.9G     0  2.9G   0% /dev
tmpfs          tmpfs     596M  1.5M  595M   1% /run
/dev/sda1      ext4      110G   50G   55G  48% /
/dev/sdb2      ext4      457G  642M  434G   1% /apps
tmpfs          tmpfs     3.0G     0  3.0G   0% /dev/shm
tmpfs          tmpfs     5.0M  4.0K  5.0M   1% /run/lock
tmpfs          tmpfs     3.0G     0  3.0G   0% /sys/fs/cgroup
/dev/loop0     squashfs   89M   89M     0 100% /snap/core/7270
/dev/loop2     squashfs  142M  142M     0 100% /snap/hexchat/42
```

Notice that the **/** (root) and **/apps** file systems are both **ext4** file systems while **/dev** is a **devtmpfs** file system – one with automated device nodes populated by the kernel. Some of the other file systems shown are **tmpfs** – temporary file systems that reside in memory and/or swap partitions and **squashfs** – file systems that are read-only compressed file systems and are used for snap packages.

There's also proc file systems that stores information on running processes.

```
$ df -T /proc
Filesystem     Type 1K-blocks  Used Available Use% Mounted on
proc           proc         0     0         0    - /proc
```

There are a number of other file system types that you might encounter as you're moving around the overall file system. When you've moved into a directory, for example, and want to ask about the related file system, you can run a command like this:

```
$ cd /dev/mqueue; df -T .
Filesystem     Type   1K-blocks  Used Available Use% Mounted on
mqueue         mqueue         0     0         0    - /dev/mqueue
$ cd /sys; df -T .
Filesystem     Type  1K-blocks  Used Available Use% Mounted on
sysfs          sysfs         0     0         0    - /sys
$ cd /sys/kernel/security; df -T .
Filesystem     Type       1K-blocks  Used Available Use% Mounted on
securityfs     securityfs         0     0         0    - /sys/kernel/security
```

As with other Linux commands, the . in these commands refers to the current location in the overall file system.

These and other unique file-system types provide some special functions. For example, securityfs provides file system support for security modules.

Linux file systems need to be resistant to corruption, have the ability to survive system crashes and provide fast and reliable performance. The improvements provided by the generations of **ext** file systems and the new generation on purpose-specific file system types have made Linux systems easier to manage and more reliable.

Join the Network World communities on [Facebook][2] and [LinkedIn][3] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3432990/a-guided-tour-of-linux-file-system-types.html

作者：[Sandra Henry-Stocker][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Sandra-Henry_Stocker/
[b]: https://github.com/lujun9972
[1]: https://images.idgesg.net/images/article/2019/08/guided-tour-on-the-flaker_people-in-horse-drawn-carriage_germany-by-andreas-lehner-flickr-100808681-large.jpg
[2]: https://www.facebook.com/NetworkWorld/
[3]: https://www.linkedin.com/company/network-world

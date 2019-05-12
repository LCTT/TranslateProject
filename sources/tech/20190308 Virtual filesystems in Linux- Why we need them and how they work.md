[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Virtual filesystems in Linux: Why we need them and how they work)
[#]: via: (https://opensource.com/article/19/3/virtual-filesystems-linux)
[#]: author: (Alison Chariken )

Linux 中的虚拟文件系统
======

> 虚拟文件系统是一种神奇的抽象，它使得 “一切皆文件” 哲学在 Linux 中成为了可能。

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/documents_papers_file_storage_work.png?itok=YlXpAqAJ)

什么是文件系统？根据早期的 Linux 贡献者和作家 [Robert Love][1] 所说，“文件系统是一个遵循特定结构的数据的分层存储。” 不过，这种描述也同样适用于 VFAT（虚拟文件分配表）、Git 和[Cassandra][2]（一种 [NoSQL 数据库][3]）。那么如何区别文件系统呢？

### 文件系统基础概念

Linux 内核要求文件系统必须是实体，它还必须在持久对象上实现 `open()`、`read()` 和 `write()` 方法，并且这些实体需要有与之关联的名字。从 [面向对象编程][4] 的角度来看，内核将通用文件系统视为一个抽象接口，这三大函数是“虚拟”的，没有默认定义。因此，内核的默认文件系统实现被称为虚拟文件系统（VFS）。

![][5] 

如果我们能够 `open()`、`read()` 和 `write()`，它就是一个文件，如这个主控台会话所示。

VFS 是著名的类 Unix 系统中 “一切皆文件” 的基础。让我们看一下它有多奇怪，上面的小演示体现了字符设备 `/dev/console` 实际的工作。该图显示了一个在虚拟电传打字（tty）上的交互式 Bash 会话。将一个字符串发送到虚拟控制台设备会使其显示在虚拟屏幕上。而 VFS 甚至还有其它更奇怪的属性。例如，它[可以在其中寻址][6]。

熟悉的文件系统如 ext4、NFS 和 /proc 在名为 [file_operations] [7] 的 C 语言数据结构中都提供了三大函数的定义。此外，特定的文件系统会以熟悉的面向对象的方式扩展和覆盖了 VFS 功能。正如 Robert Love 指出的那样，VFS 的抽象使 Linux 用户可以轻松地将文件复制到（复制自）外部操作系统或抽象实体（如管道），而无需担心其内部数据格式。在用户空间，通过系统调用，进程可以使用一个文件系统的 `read(）`方法从文件复制到内核的数据结构中，然后使用另一种文件系统的 `write()` 方法输出数据。

属于 VFS 基本类型的函数定义本身可以在内核源代码的 [fs/*.c 文件][8] 中找到，而 `fs/` 的子目录中包含了特定的文件系统。内核还包含了类似文件系统的实体，例如 cgroup、`/dev` 和 tmpfs，它们在引导过程的早期需要，因此定义在内核的 `init/` 子目录中。请注意，cgroup、`/dev` 和 tmpfs 不会调用 `file_operations` 的三大函数，而是直接读取和写入内存。

下图大致说明了用户空间如何访问通常挂载在 Linux 系统上的各种类型的文件系统。未显示的是像管道、dmesg 和 POSIX 时钟这样的结构，它们也实现了 `struct file_operations`，并且因此其访问要通过 VFS 层。

![How userspace accesses various types of filesystems][9]

VFS 是系统调用和特定 `file_operations` 的实现（如 ext4 和 procfs）之间的“垫片层”。然后，`file_operations` 函数可以与特定于设备的驱动程序或内存访问器进行通信。tmpfs、devtmpfs 和 cgroup 不使用 `file_operations` 而是直接访问内存。

VFS 的存在促进了代码重用，因为与文件系统相关的基本方法不需要由每种文件系统类型重新实现。代码重用是一种被广泛接受的软件工程最佳实践！唉，如果重用的代码[引入了严重的错误][10]，那么继承常用方法的所有实现都会受到影响。

### /tmp：一个小提示

找出系统中存在的 VFS 的简单方法是键入 `mount | grep -v sd | grep -v :/`，在大多数计算机上，它将列出所有未驻留在磁盘上也不是 NFS 的已挂载文件系统。其中一个列出的 VFS 挂载肯定是 `/ tmp`，对吧？

![Man with shocked expression][11]

*每个人都知道把 /tmp 放在物理存储设备上简直是疯了！图片：<https://tinyurl.com/ybomxyfo>*

为什么把 `/tmp` 留在存储设备上是不可取的？因为 `/tmp` 中的文件是临时的（！），并且存储设备比内存慢，所以创建了 tmpfs 这种文件系统。此外，比起内存，物理设备频繁写入更容易磨损。最后，`/tmp` 中的文件可能包含敏感信息，因此在每次重新启动时让它们消失是一项功能。

不幸的是，默认情况下，某些 Linux 发行版的安装脚本仍会在存储设备上创建 /tmp。如果你的系统出现这种情况，请不要绝望。按照一直优秀的 [Arch Wiki][12] 上的简单说明来解决问题就行，记住分配给 tmpfs 的内存不能用于其他目的。换句话说，带有巨大 tmpfs 并且其中包含大文件的系统可能会耗尽内存并崩溃。另一个提示：编辑 `/etc/fstab` 文件时，请务必以换行符结束，否则系统将无法启动。（猜猜我怎么知道。）

### /proc 和 /sys

除了 `/tmp` 之外，大多数 Linux 用户最熟悉的 VFS 是 `/proc` 和 `/sys`。（`/dev` 依赖于共享内存，没有 `file_operations`）。为什么有两种？让我们来看看更多细节。

procfs 提供了内核的瞬时状态及其为用户空间控制的进程的快照。在 `/proc` 中，内核发布有关其提供的工具的信息，如中断、虚拟内存和调度程序。此外，`/proc/sys` 是存放可以通过 [sysctl 命令][13]配置的设置的地方，可供用户空间访问。单个进程的状态和统计信息在 `/proc/<PID>` 目录中报告。

![Console][14]

*/proc/meminfo 是一个空文件，但仍包含有价值的信息。*

`/proc` 文件的行为说明了 VFS 可以与磁盘上的文件系统不同。一方面，`/proc/meminfo` 包含命令 `free` 提供的信息。另一方面，它还是空的！怎么会这样？这种情况让人联想起康奈尔大学物理学家 N. David Mermin 在 1985 年写的一篇名为“[没有人看见月亮的情况吗？][15]现实和量子理论。”事实是当进程从 `/proc` 请求内存时内核再收集有关内存的统计信息，并且当没有人在查看时，`/proc` 中的文件实际上没有任何内容。正如 [Mermin 所说][16]，“这是一个基本的量子学说，一般来说，测量不会揭示被测属性的预先存在的价值。”（关于月球的问题的答案留作练习。）

![Full moon][17]

*当没有进程访问它们时，/proc 中的文件为空。（[来源][18]）*

procfs 的空文件是有道理的，因为那里可用的信息是动态的。sysfs 的情况不同。让我们比较一下 `/proc` 与 `/sys` 中不为空的文件数量。

![](https://opensource.com/sites/default/files/uploads/virtualfilesystems_6-filesize.png)

procfs 只有一个，即导出的内核配置，这是一个例外，因为每次启动只需要生成一次。另一方面，`/sys` 有许多较大的文件，其中大多数包含一页内存。通常，sysfs 文件只包含一个数字或字符串，与通过读取 `/proc/meminfo` 等文件生成的信息表格形成鲜明对比。

sysfs 的目的是将内核称为“kobjects”的可读写属性公开给用户空间。kobjects 的唯一目的是引用计数：当删除对 kobject 的最后一个引用时，系统将回收与之关联的资源。然而，`/sys` 构成了内核著名的“[到用户空间的稳定 ABI][19]”，它的大部分内容[在任何情况下都没有人会“破坏”][20]。这并不意味着 sysfs 中的文件是静态，这与易失性对象的引用计数相反。

内核的稳定 ABI 反而限制了 `/sys` 中可能出现的内容，而不是任何给定时刻实际存在的内容。列出 sysfs 中文件的权限可以了解如何设置或读取设备、模块、文件系统等的可配置、可调参数。Logic 强调 procfs 也是内核稳定 ABI 的一部分的结论，尽管内核的[文档][19]没有明确说明。

![Console][21]

*sysfs 中的文件恰好描述了实体的每个属性，并且可以是可读的、可写的或两者兼而有之。文件中的“0”表示 SSD 不可移动的存储设备。*

### Snooping on VFS with eBPF and bcc tools

The easiest way to learn how the kernel manages sysfs files is to watch it in action, and the simplest way to watch on ARM64 or x86_64 is to use eBPF. eBPF (extended Berkeley Packet Filter) consists of a [virtual machine running inside the kernel][22] that privileged users can query from the command line. Kernel source tells the reader what the kernel can do; running eBPF tools on a booted system shows instead what the kernel actually does.

Happily, getting started with eBPF is pretty easy via the [bcc][23] tools, which are available as [packages from major Linux distros][24] and have been [amply documented][25] by Brendan Gregg. The bcc tools are Python scripts with small embedded snippets of C, meaning anyone who is comfortable with either language can readily modify them. At this count, [there are 80 Python scripts in bcc/tools][26], making it highly likely that a system administrator or developer will find an existing one relevant to her/his needs.

To get a very crude idea about what work VFSes are performing on a running system, try the simple [vfscount][27] or [vfsstat][28], which show that dozens of calls to vfs_open() and its friends occur every second.

![Console - vfsstat.py][29]
vfsstat.py is a Python script with an embedded C snippet that simply counts VFS function calls.

For a less trivial example, let's watch what happens in sysfs when a USB stick is inserted on a running system.

![Console when USB is inserted][30]
Watch with eBPF what happens in /sys when a USB stick is inserted, with simple and complex examples.

In the first simple example above, the [trace.py][31] bcc tools script prints out a message whenever the sysfs_create_files() command runs. We see that sysfs_create_files() was started by a kworker thread in response to the USB stick insertion, but what file was created? The second example illustrates the full power of eBPF. Here, trace.py is printing the kernel backtrace (-K option) plus the name of the file created by sysfs_create_files(). The snippet inside the single quotes is some C source code, including an easily recognizable format string, that the provided Python script [induces a LLVM just-in-time compiler][32] to compile and execute inside an in-kernel virtual machine. The full sysfs_create_files() function signature must be reproduced in the second command so that the format string can refer to one of the parameters. Making mistakes in this C snippet results in recognizable C-compiler errors. For example, if the **-I** parameter is omitted, the result is "Failed to compile BPF text." Developers who are conversant with either C or Python will find the bcc tools easy to extend and modify.

When the USB stick is inserted, the kernel backtrace appears showing that PID 7711 is a kworker thread that created a file called "events" in sysfs. A corresponding invocation with sysfs_remove_files() shows that removal of the USB stick results in removal of the events file, in keeping with the idea of reference counting. Watching sysfs_create_link() with eBPF during USB stick insertion (not shown) reveals that no fewer than 48 symbolic links are created.

What is the purpose of the events file anyway? Using [cscope][33] to find the function [__device_add_disk()][34] reveals that it calls disk_add_events(), and either "media_change" or "eject_request" may be written to the events file. Here, the kernel's block layer is informing userspace about the appearance and disappearance of the "disk." Consider how quickly informative this method of investigating how USB stick insertion works is compared to trying to figure out the process solely from the source.

### Read-only root filesystems make embedded devices possible

Assuredly, no one shuts down a server or desktop system by pulling out the power plug. Why? Because mounted filesystems on the physical storage devices may have pending writes, and the data structures that record their state may become out of sync with what is written on the storage. When that happens, system owners will have to wait at next boot for the [fsck filesystem-recovery tool][35] to run and, in the worst case, will actually lose data.

Yet, aficionados will have heard that many IoT and embedded devices like routers, thermostats, and automobiles now run Linux. Many of these devices almost entirely lack a user interface, and there's no way to "unboot" them cleanly. Consider jump-starting a car with a dead battery where the power to the [Linux-running head unit][36] goes up and down repeatedly. How is it that the system boots without a long fsck when the engine finally starts running? The answer is that embedded devices rely on [a read-only root fileystem][37] (ro-rootfs for short).

![Photograph of a console][38]
ro-rootfs are why embedded systems don't frequently need to fsck. Credit (with permission): <https://tinyurl.com/yxoauoub>

A ro-rootfs offers many advantages that are less obvious than incorruptibility. One is that malware cannot write to /usr or /lib if no Linux process can write there. Another is that a largely immutable filesystem is critical for field support of remote devices, as support personnel possess local systems that are nominally identical to those in the field. Perhaps the most important (but also most subtle) advantage is that ro-rootfs forces developers to decide during a project's design phase which system objects will be immutable. Dealing with ro-rootfs may often be inconvenient or even painful, as [const variables in programming languages][39] often are, but the benefits easily repay the extra overhead.

Creating a read-only rootfs does require some additional amount of effort for embedded developers, and that's where VFS comes in. Linux needs files in /var to be writable, and in addition, many popular applications that embedded systems run will try to create configuration dot-files in $HOME. One solution for configuration files in the home directory is typically to pregenerate them and build them into the rootfs. For /var, one approach is to mount it on a separate writable partition while / itself is mounted as read-only. Using bind or overlay mounts is another popular alternative.

### Bind and overlay mounts and their use by containers

Running **[man mount][40]** is the best place to learn about bind and overlay mounts, which give embedded developers and system administrators the power to create a filesystem in one path location and then provide it to applications at a second one. For embedded systems, the implication is that it's possible to store the files in /var on an unwritable flash device but overlay- or bind-mount a path in a tmpfs onto the /var path at boot so that applications can scrawl there to their heart's delight. At next power-on, the changes in /var will be gone. Overlay mounts provide a union between the tmpfs and the underlying filesystem and allow apparent modification to an existing file in a ro-rootfs, while bind mounts can make new empty tmpfs directories show up as writable at ro-rootfs paths. While overlayfs is a proper filesystem type, bind mounts are implemented by the [VFS namespace facility][41].

Based on the description of overlay and bind mounts, no one will be surprised that [Linux containers][42] make heavy use of them. Let's spy on what happens when we employ [systemd-nspawn][43] to start up a container by running bcc's mountsnoop tool:

![Console - system-nspawn invocation][44]
The system-nspawn invocation fires up the container while mountsnoop.py runs.

And let's see what happened:

![Console - Running mountsnoop][45]
Running mountsnoop during the container "boot" reveals that the container runtime relies heavily on bind mounts. (Only the beginning of the lengthy output is displayed)

Here, systemd-nspawn is providing selected files in the host's procfs and sysfs to the container at paths in its rootfs. Besides the MS_BIND flag that sets bind-mounting, some of the other flags that the "mount" system call invokes determine the relationship between changes in the host namespace and in the container. For example, the bind-mount can either propagate changes in /proc and /sys to the container, or hide them, depending on the invocation.

### Summary

Understanding Linux internals can seem an impossible task, as the kernel itself contains a gigantic amount of code, leaving aside Linux userspace applications and the system-call interface in C libraries like glibc. One way to make progress is to read the source code of one kernel subsystem with an emphasis on understanding the userspace-facing system calls and headers plus major kernel internal interfaces, exemplified here by the file_operations table. The file operations are what makes "everything is a file" actually work, so getting a handle on them is particularly satisfying. The kernel C source files in the top-level fs/ directory constitute its implementation of virtual filesystems, which are the shim layer that enables broad and relatively straightforward interoperability of popular filesystems and storage devices. Bind and overlay mounts via Linux namespaces are the VFS magic that makes containers and read-only root filesystems possible. In combination with a study of source code, the eBPF kernel facility and its bcc interface makes probing the kernel simpler than ever before.

Much thanks to [Akkana Peck][46] and [Michael Eager][47] for comments and corrections.

Alison Chaiken will present [Virtual filesystems: why we need them and how they work][48] at the 17th annual Southern California Linux Expo ([SCaLE 17x][49]) March 7-10 in Pasadena, Calif.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/3/virtual-filesystems-linux

作者：[Alison Chariken][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/chaiken
[b]: https://github.com/lujun9972
[1]: https://www.pearson.com/us/higher-education/program/Love-Linux-Kernel-Development-3rd-Edition/PGM202532.html
[2]: http://cassandra.apache.org/
[3]: https://en.wikipedia.org/wiki/NoSQL
[4]: http://lwn.net/Articles/444910/
[5]: https://opensource.com/sites/default/files/uploads/virtualfilesystems_1-console.png (Console)
[6]: https://lwn.net/Articles/22355/
[7]: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/include/linux/fs.h
[8]: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/fs
[9]: https://opensource.com/sites/default/files/uploads/virtualfilesystems_2-shim-layer.png (How userspace accesses various types of filesystems)
[10]: https://lwn.net/Articles/774114/
[11]: https://opensource.com/sites/default/files/uploads/virtualfilesystems_3-crazy.jpg (Man with shocked expression)
[12]: https://wiki.archlinux.org/index.php/Tmpfs
[13]: http://man7.org/linux/man-pages/man8/sysctl.8.html
[14]: https://opensource.com/sites/default/files/uploads/virtualfilesystems_4-proc-meminfo.png (Console)
[15]: http://www-f1.ijs.si/~ramsak/km1/mermin.moon.pdf
[16]: https://en.wikiquote.org/wiki/David_Mermin
[17]: https://opensource.com/sites/default/files/uploads/virtualfilesystems_5-moon.jpg (Full moon)
[18]: https://commons.wikimedia.org/wiki/Moon#/media/File:Full_Moon_Luc_Viatour.jpg
[19]: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/ABI/stable
[20]: https://lkml.org/lkml/2012/12/23/75
[21]: https://opensource.com/sites/default/files/uploads/virtualfilesystems_7-sysfs.png (Console)
[22]: https://events.linuxfoundation.org/sites/events/files/slides/bpf_collabsummit_2015feb20.pdf
[23]: https://github.com/iovisor/bcc
[24]: https://github.com/iovisor/bcc/blob/master/INSTALL.md
[25]: http://brendangregg.com/ebpf.html
[26]: https://github.com/iovisor/bcc/tree/master/tools
[27]: https://github.com/iovisor/bcc/blob/master/tools/vfscount_example.txt
[28]: https://github.com/iovisor/bcc/blob/master/tools/vfsstat.py
[29]: https://opensource.com/sites/default/files/uploads/virtualfilesystems_8-vfsstat.png (Console - vfsstat.py)
[30]: https://opensource.com/sites/default/files/uploads/virtualfilesystems_9-ebpf.png (Console when USB is inserted)
[31]: https://github.com/iovisor/bcc/blob/master/tools/trace_example.txt
[32]: https://events.static.linuxfound.org/sites/events/files/slides/bpf_collabsummit_2015feb20.pdf
[33]: http://northstar-www.dartmouth.edu/doc/solaris-forte/manuals/c/user_guide/cscope.html
[34]: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/block/genhd.c#n665
[35]: http://www.man7.org/linux/man-pages/man8/fsck.8.html
[36]: https://wiki.automotivelinux.org/_media/eg-rhsa/agl_referencehardwarespec_v0.1.0_20171018.pdf
[37]: https://elinux.org/images/1/1f/Read-only_rootfs.pdf
[38]: https://opensource.com/sites/default/files/uploads/virtualfilesystems_10-code.jpg (Photograph of a console)
[39]: https://www.meetup.com/ACCU-Bay-Area/events/drpmvfytlbqb/
[40]: http://man7.org/linux/man-pages/man8/mount.8.html
[41]: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/filesystems/sharedsubtree.txt
[42]: https://coreos.com/os/docs/latest/kernel-modules.html
[43]: https://www.freedesktop.org/software/systemd/man/systemd-nspawn.html
[44]: https://opensource.com/sites/default/files/uploads/virtualfilesystems_11-system-nspawn.png (Console - system-nspawn invocation)
[45]: https://opensource.com/sites/default/files/uploads/virtualfilesystems_12-mountsnoop.png (Console - Running mountsnoop)
[46]: http://shallowsky.com/
[47]: http://eagercon.com/
[48]: https://www.socallinuxexpo.org/scale/17x/presentations/virtual-filesystems-why-we-need-them-and-how-they-work
[49]: https://www.socallinuxexpo.org/

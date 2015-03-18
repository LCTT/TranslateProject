The future of Linux storage
================================================================================
> **Summary**:Linux software developers are working hard on expanding Linux's file and storage options.

BOSTON - At the [Linux Foundation's][1] new [Vault][2] show, it's all about file systems and storage. You might think that there's nothing new to say about either topic, but you'd be wrong.

![](http://zdnet2.cbsistatic.com/hub/i/r/2015/03/12/c8f92cc2-b963-4238-80a0-d785ec93698c/resize/770x578/08d93a8a393d3f50b2a56e6b0e7a0ca9/btrfs-1.jpg)
Linux file systems, such as Btrfs, and storage support options are constantly evolving. -- Facebook 

Storage technology has come a long way from the days of, as Linus Torvalds put it, "[nasty platters of spinning rust][3]" and Linux has had to keep up. In recent years, for example, [flash memory has arrived as enterprise server primary storage][4] and [persistent memory][5] is bringing us storage that works at DRAM speeds. At the same time, Big Data, cloud computing, and containers are all bringing new use cases to Linux.

To deal with this, Linux developers are both expanding their existing file and storage programs and working on new ones.

### Btrfs ###

For instance, Chris Mason, a Facebook software engineer and one of the [Btrfs][6] (pronounced Butter FS) maintainers, explained how Facebook uses this file system. Btrfs has many advantages as a file system such as the ability to handle both numerous small files and single files as large as 16 exabytes; baked in RAID; built-in file-system compression; and integrated multi-storage device support.

Facebook, of course, runs on Linux. To be exact, Facebook runs the 3.10 and 3.18 Linux kernels on an internal distribution, which is based on [CentOS][7]. For Facebook, the real win is that Btrfs is stable and fast under the endless input/output operations per second (IOPS) pounding from Facebook's constantly updating users.

That's the good news. The bad news is that Btrfs is still much too slow for traditional DBMSs such as MySQL. For those, Facebook uses [XFS][8]. To co-ordinate the two file systems, Facebook uses [Gluster][9], the open-source distributed file system. 

Facebook, which works hand-in-glove with the upstream Btrfs Linux kernel developers, is working on improving Btrfs's DBMS speed. Mason, and his companions, are doing this by using Btrfs with the [RocksDB][10] database. This is a persistent key-value store for fast storage, which can be used as the foundation for a client-server database.

Btrfs also still has some bugs. For example, if you're foolish enough to fill a disk almost to bursting, Btrfs will stop you from writing to storage before the disk is completely stuffed. For some projects, such as [CoreOS][12], the enterprise Linux that relies on containers, that's a showstopper. [CoreOS has since switched to using xt4 and overlayfs][11]. 

The Btrfs crew is also working on data deduplication. In this, when a file system has more than one identical file, you automatically delete the duplicate. As Mason said, "Not everyone needs this, but if you need it, you really need it!" 

Btrfs isn't the only file system that's both very important and getting worked on. John Spray, a senior software engineer at [Red Hat][13], talked about the distributed [Ceph][14] file system. 

### Ceph FS ###

Ceph provides a distributed object store and file system which, in turn, relies on a resilient and scalable storage model (RADOS) using clusters of commodity hardware. Along with the RADOS block device (RBD), and the RADOS object gateway (RGW), Ceph provides a [POSIX][15] file-system interface -- Ceph FS. While RBD and RGW have been in use for production workloads for some time, efforts to make Ceph FS ready for production are now underway.

[Red Hat, after acquiring Inktank][16], Ceph's parent company, in 2014 has been working hard on making CephFS production ready. For better or worse, Spray said, "Some people are already using it in production; we're terrified of this. It's really not ready yet." Still, Spray added, that this "is a mixed blessing because while it's a bit scary, we get really useful feedback and testing from those users."

That's because while Ceph object stores scale out well, Ceph FS, as a POSIX compliant file-system, are hard to scale out. For example, as a distributed file system, Ceph FS has to deal with multiple writes from multiple clients. This can lead to all or nothing situations where one client can write and others must wait. This can result in file-locking situations that are more complicated than those in ordinary file systems.

Still, Ceph FS is worth doing, Spray said, "since POSIX file-systems are an operating system lingua franca." That's not to say that Ceph FS doesn't work. "It's not horribly broken. It works. What's missing is the repair and monitoring tools."

Red Hat is currently hard at work on getting [fsck][17] and journal repair tools, snapshot hardening, better client access control, and cloud and container integration. For now, though, Ceph FS is a file system that only the very brave, or foolish, should use in production.

### File and storage odds and ends ###

As for larger issues of file-systems and storage, Jeff Layton, senior software engineer at [Primary Data][18], explained that there are efforts under way to to create "tests for catastrophic power failure, without actually pulling the plug." These tests will soon be integrated with [xfstests][19], the gold standard for Linux file-system testing.

Rik van Riel, a Red Hat principal software engineer, spoke about the problem of dealing with persistent memory products. You can treat them as storage or as memory. But, you can't currently take snapshots for backups if you use them as memory. The real problem: van Riel is certain that people will try to use persistent memory as both, which will lead to such as situations as "Without back up, how do you deal with a 200GB persistent memory database?" Adding insult to injury, logging systems don't currently work with persistent memory.

What's the right answer? Linux doesn't have one yet, but programmers are working on it.

So, while Linux has many file systems and can use any kind of storage out there that can hold a byte, there's still a lot of work to be done. Technology never stands still. Linux, which runs on everything from devices to desktops to servers to clouds to supercomputers, has to keep up with storage advances no matter where they appear. 

--------------------------------------------------------------------------------

via: http://www.zdnet.com/article/linux-storage-futures/

作者：[Steven J. Vaughan-Nichols][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.zdnet.com/meet-the-team/us/sjvn/
[1]:http://www.linuxfoundation.org/
[2]:http://events.linuxfoundation.org/events/vault
[3]:http://www.wired.com/2012/10/linus-torvalds-hard-disks/
[4]:http://www.zdnet.com/article/sandisk-launches-infiniflash-aims-to-bring-flash-array-costs-down/
[5]:http://events.linuxfoundation.org/sites/events/files/eeus13_wheeler.pdf
[6]:https://btrfs.wiki.kernel.org/index.php/Main_Page
[7]:http://www.centos.org/
[8]:http://oss.sgi.com/projects/xfs/
[9]:http://www.gluster.org/
[10]:http://rocksdb.org/
[11]:http://lwn.net/Articles/627232/
[12]:https://coreos.com/
[13]:http://www.redhat.com/
[14]:http://ceph.com/
[15]:http://pubs.opengroup.org/onlinepubs/9699919799/
[16]:http://www.zdnet.com/article/red-hat-acquires-inktank-for-175m/
[17]:http://linux.die.net/man/8/fsck
[18]:http://primarydata.com/
[19]:http://oss.sgi.com/cgi-bin/gitweb.cgi?p=xfs/cmds/xfstests.git;a=summary
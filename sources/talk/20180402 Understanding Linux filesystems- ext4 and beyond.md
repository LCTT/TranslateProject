Translating by jessie-pang

Understanding Linux filesystems: ext4 and beyond
======

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/rh_003499_01_linux11x_cc.png?itok=XMDOouJR)

The majority of modern Linux distributions default to the ext4 filesystem, just as previous Linux distributions defaulted to ext3, ext2, and—if you go back far enough—ext.

If you're new to Linux—or to filesystems—you might wonder what ext4 brings to the table that ext3 didn't. You might also wonder whether ext4 is still in active development at all, given the flurries of news coverage of alternate filesystems such as btrfs, xfs, and zfs.

We can't cover everything about filesystems in a single article, but we'll try to bring you up to speed on the history of Linux's default filesystem, where it stands, and what to look forward to.

I drew heavily on Wikipedia's various ext filesystem articles, kernel.org's wiki entries on ext4, and my own experiences while preparing this overview.

### A brief history of ext

#### MINIX filesystem

Before there was ext, there was the MINIX filesystem. If you're not up on your Linux history, MINIX was a very small Unix-like operating system for IBM PC/AT microcomputers. Andrew Tannenbaum developed it for teaching purposes and released its source code (in print form!) in 1987.

![](https://opensource.com/sites/default/files/styles/panopoly_image_original/public/u128651/ibm_pc_at.jpg?itok=Tfk3hQYB)

Although you could peruse MINIX's source, it was not actually free and open source software (FOSS). The publishers of Tannebaum's book required a $69 license fee to operate MINIX, which was included in the cost of the book. Still, this was incredibly inexpensive for the time, and MINIX adoption took off rapidly, soon exceeding Tannenbaum's original intent of using it simply to teach the coding of operating systems. By and throughout the 1990s, you could find MINIX installations thriving in universities worldwide—and a young Linus Torvalds used MINIX to develop the original Linux kernel, first announced in 1991, and released under the GPL in December 1992.

But wait, this is a filesystem article, right? Yes, and MINIX had its own filesystem, which early versions of Linux also relied on. Like MINIX, it could uncharitably be described as a "toy" example of its kind—the MINIX filesystem could handle filenames only up to 14 characters and address only 64MB of storage. In 1991, the typical hard drive was already 40-140MB in size. Linux clearly needed a better filesystem!

#### ext

While Linus hacked away on the fledgling Linux kernel, Rémy Card worked on the first ext filesystem. First implemented in 1992—only a year after the initial announcement of Linux itself!—ext solved the worst of the MINIX filesystem's problems.

1992's ext used the new virtual filesystem (VFS) abstraction layer in the Linux kernel. Unlike the MINIX filesystem before it, ext could address up to 2GB of storage and handle 255-character filenames.

But ext didn't have a long reign, largely due to its primitive timestamping (only one timestamp per file, rather than the three separate stamps for inode creation, file access, and file modification we're familiar with today). A mere year later, ext2 ate its lunch.

#### ext2

Rémy clearly realized ext's limitations pretty quickly, since he designed ext2 as its replacement a year later. While ext still had its roots in "toy" operating systems, ext2 was designed from the start as a commercial-grade filesystem, along the same principles as BSD's Berkeley Fast File System.

Ext2 offered maximum filesizes in the gigabytes and filesystem sizes in the terabytes, placing it firmly in the big leagues for the 1990s. It was quickly and widely adopted, both in the Linux kernel and eventually in MINIX, as well as by third-party modules making it available for MacOS and Windows.

There were still problems to solve, though: ext2 filesystems, like most filesystems of the 1990s, were prone to catastrophic corruption if the system crashed or lost power while data was being written to disk. They also suffered from significant performance losses due to fragmentation (the storage of a single file in multiple places, physically scattered around a rotating disk) as time went on.

Despite these problems, ext2 is still used in some isolated cases today—most commonly, as a format for portable USB thumb drives.

#### ext3

In 1998, six years after ext2's adoption, Stephen Tweedie announced he was working on significantly improving it. This became ext3, which was adopted into mainline Linux with kernel version 2.4.15, in November 2001.


![Packard Bell computer][2]

Mid-1990s Packard Bell computer, [Spacekid][3], [CC0][4]

Ext2 had done very well by Linux distributions for the most part, but—like FAT, FAT32, HFS, and other filesystems of the time—it was prone to catastrophic corruption during power loss. If you lose power while writing data to the filesystem, it can be left in what's called an inconsistent state—one in which things have been left half-done and half-undone. This can result in loss or corruption of vast swaths of files unrelated to the one being saved or even unmountability of the entire filesystem.

Ext3, and other filesystems of the late 1990s, such as Microsoft's NTFS, uses journaling to solve this problem. The journal is a special allocation on disk where writes are stored in transactions; if the transaction finishes writing to disk, its data in the journal is committed to the filesystem itself. If the system crashes before that operation is committed, the newly rebooted system recognizes it as an incomplete transaction and rolls it back as though it had never taken place. This means that the file being worked on may still be lost, but the filesystem itself remains consistent, and all other data is safe. Three levels of journaling are available in the Linux kernel implementation of ext3: **journal** , **ordered** , and **writeback**.

  * **Journal** is the lowest risk mode, writing both data and metadata to the journal before committing it to the filesystem. This ensures consistency of the file being written to, as well as the filesystem as a whole, but can significantly decrease performance.
  * **Ordered** is the default mode in most Linux distributions; ordered mode writes metadata to the journal but commits data directly to the filesystem. As the name implies, the order of operations here is rigid: First, metadata is committed to the journal; second, data is written to the filesystem, and only then is the associated metadata in the journal flushed to the filesystem itself. This ensures that, in the event of a crash, the metadata associated with incomplete writes is still in the journal, and the filesystem can sanitize those incomplete writes while rolling back the journal. In ordered mode, a crash may result in corruption of the file or files being actively written to during the crash, but the filesystem itself—and files not actively being written to—are guaranteed safe.
  * **Writeback** is the third—and least safe—journaling mode. In writeback mode, like ordered mode, metadata is journaled, but data is not. Unlike ordered mode, metadata and data alike may be written in whatever order makes sense for best performance. This can offer significant increases in performance, but it's much less safe. Although writeback mode still offers a guarantee of safety to the filesystem itself, files that were written to during or before the crash are vulnerable to loss or corruption.



Like ext2 before it, ext3 uses 16-bit internal addressing. This means that with a blocksize of 4K, the largest filesize it can handle is 2 TiB in a maximum filesystem size of 16 TiB.

#### ext4

Theodore Ts'o (who by then was ext3's principal developer) announced ext4 in 2006, and it was added to mainline Linux two years later, in kernel version 2.6.28. Ts'o describes ext4 as a stopgap technology which significantly extends ext3 but is still reliant on old technology. He expects it to be supplanted eventually by a true next-generation filesystem.

![](https://opensource.com/sites/default/files/styles/panopoly_image_original/public/u128651/dell_precision_380_workstation.jpeg?itok=3EjYXY2i)

Ext4 is functionally very similar to ext3, but brings large filesystem support, improved resistance to fragmentation, higher performance, and improved timestamps.

### Ext4 vs ext3

Ext3 and ext4 have some very specific differences, which I'll focus on here.

#### Backwards compatibility

Ext4 was specifically designed to be as backward-compatible as possible with ext3. This not only allows ext3 filesystems to be upgraded in place to ext4; it also permits the ext4 driver to automatically mount ext3 filesystems in ext3 mode, making it unnecessary to maintain the two codebases separately.

#### Large filesystems

Ext3 filesystems used 32-bit addressing, limiting them to 2 TiB files and 16 TiB filesystems (assuming a 4 KiB blocksize; some ext3 filesystems use smaller blocksizes and are thus limited even further).

Ext4 uses 48-bit internal addressing, making it theoretically possible to allocate files up to 16 TiB on filesystems up to 1,000,000 TiB (1 EiB). Early implementations of ext4 were still limited to 16 TiB filesystems by some userland utilities, but as of 2011, e2fsprogs has directly supported the creation of >16TiB ext4 filesystems. As one example, Red Hat Enterprise Linux contractually supports ext4 filesystems only up to 50 TiB and recommends ext4 volumes no larger than 100 TiB.

#### Allocation improvements

Ext4 introduces a lot of improvements in the ways storage blocks are allocated before writing them to disk, which can significantly increase both read and write performance.

##### Extents

An extent is a range of contiguous physical blocks (up to 128 MiB, assuming a 4 KiB block size) that can be reserved and addressed at once. Utilizing extents decreases the number of inodes required by a given file and significantly decreases fragmentation and increases performance when writing large files.

##### Multiblock allocation

Ext3 called its block allocator once for each new block allocated. This could easily result in heavy fragmentation when multiple writers are open concurrently. However, ext4 uses delayed allocation, which allows it to coalesce writes and make better decisions about how to allocate blocks for the writes it has not yet committed.

##### Persistent pre-allocation

When pre-allocating disk space for a file, most file systems must write zeroes to the blocks for that file on creation. Ext4 allows the use of `fallocate()` instead, which guarantees the availability of the space (and attempts to find contiguous space for it) without first needing to write to it. This significantly increases performance in both writes and future reads of the written data for streaming and database applications.

##### Delayed allocation

This is a chewy—and contentious—feature. Delayed allocation allows ext4 to wait to allocate the actual blocks it will write data to until it's ready to commit that data to disk. (By contrast, ext3 would allocate blocks immediately, even while the data was still flowing into a write cache.)

Delaying allocation of blocks as data accumulates in cache allows the filesystem to make saner choices about how to allocate those blocks, reducing fragmentation (write and, later, read) and increasing performance significantly. Unfortunately, it increases the potential for data loss in programs that have not been specifically written to call `fsync()` when the programmer wants to ensure data has been flushed entirely to disk.

Let's say a program rewrites a file entirely:

`fd=open("file" ,O_TRUNC); write(fd, data); close(fd);`

With legacy filesystems, `close(fd);` is sufficient to guarantee that the contents of `file` will be flushed to disk. Even though the write is not, strictly speaking, transactional, there's very little risk of losing the data if a crash occurs after the file is closed.

If the write does not succeed (due to errors in the program, errors on the disk, power loss, etc.), both the original version and the newer version of the file may be lost or corrupted. If other processes access the file as it is being written, they will see a corrupted version. And if other processes have the file open and do not expect its contents to change—e.g., a shared library mapped into multiple running programs—they may crash.

To avoid these issues, some programmers avoid using `O_TRUNC` at all. Instead, they might write to a new file, close it, then rename it over the old one:

`fd=open("newfile"); write(fd, data); close(fd); rename("newfile", "file");`

Under filesystems without delayed allocation, this is sufficient to avoid the potential corruption and crash problems outlined above: Since `rename()` is an atomic operation, it won't be interrupted by a crash; and running programs will continue to reference the old, now unlinked version of `file` for as long as they have an open filehandle to it. But because ext4's delayed allocation can cause writes to be delayed and re-ordered, the `rename("newfile","file")` may be carried out before the contents of `newfile` are actually written to disk, which opens the problem of parallel processes getting bad versions of `file` all over again.

To mitigate this, the Linux kernel (since version 2.6.30) attempts to detect these common code cases and force the files in question to be allocated immediately. This reduces, but does not prevent, the potential for data loss—and it doesn't help at all with new files. If you're a developer, please take note: The only way to guarantee data is written to disk immediately is to call `fsync()` appropriately.

#### Unlimited subdirectories

Ext3 was limited to a total of 32,000 subdirectories; ext4 allows an unlimited number. Beginning with kernel 2.6.23, ext4 uses HTree indices to mitigate performance loss with huge numbers of subdirectories.

#### Journal checksumming

Ext3 did not checksum its journals, which presented problems for disk or controller devices with caches of their own, outside the kernel's direct control. If a controller or a disk with its own cache did writes out of order, it could break ext3's journaling transaction order, potentially corrupting files being written to during (or for some time preceding) a crash.

In theory, this problem is resolved by the use of write barriers—when mounting the filesystem, you set `barrier=1` in the mount options, and the device will then honor `fsync()` calls all the way down to the metal. In practice, it's been discovered that storage devices and controllers frequently do not honor write barriers—improving performance (and benchmarks, where they're compared to their competitors) but opening up the possibility of data corruption that should have been prevented.

Checksumming the journal allows the filesystem to realize that some of its entries are invalid or out-of-order on the first mount after a crash. This thereby avoids the mistake of rolling back partial or out-of-order journal entries and further damaging the filesystem—even if the storage devices lie and don't honor barriers.

#### Fast filesystem checks

Under ext3, the entire filesystem—including deleted and empty files—required checking when `fsck` is invoked. By contrast, ext4 marks unallocated blocks and sections of the inode table as such, allowing `fsck` to skip them entirely. This greatly reduces the time to run `fsck` on most filesystems and has been implemented since kernel 2.6.24.

#### Improved timestamps

Ext3 offered timestamps granular to one second. While sufficient for most uses, mission-critical applications are frequently looking for much, much tighter time control. Ext4 makes itself available to those enterprise, scientific, and mission-critical applications by offering timestamps in the nanoseconds.

Ext3 filesystems also did not provide sufficient bits to store dates beyond January 18, 2038. Ext4 adds an additional two bits here, extending [the Unix epoch][5] another 408 years. If you're reading this in 2446 AD, you have hopefully already moved onto a better filesystem—but it'll make me posthumously very, very happy if you're still measuring the time since UTC 00:00, January 1, 1970.

#### Online defragmentation

Neither ext2 nor ext3 directly supported online defragmentation—that is, defragging the filesystem while mounted. Ext2 had an included utility, **e2defrag** , that did what the name implies—but it needed to be run offline while the filesystem was not mounted. (This is, obviously, especially problematic for a root filesystem.) The situation was even worse in ext3—although ext3 was much less likely to suffer from severe fragmentation than ext2 was, running **e2defrag** against an ext3 filesystem could result in catastrophic corruption and data loss.

Although ext3 was originally deemed "unaffected by fragmentation," processes that employ massively parallel write processes to the same file (e.g., BitTorrent) made it clear that this wasn't entirely the case. Several userspace hacks and workarounds, such as [Shake][6], addressed this in one way or another—but they were slower and in various ways less satisfactory than a true, filesystem-aware, kernel-level defrag process.

Ext4 addresses this problem head on with **e4defrag** , an online, kernel-mode, filesystem-aware, block-and-extent-level defragmentation utility.

### Ongoing ext4 development

Ext4 is, as the Monty Python plague victim once said, "not quite dead yet!" Although [its principal developer regards it][7] as a mere stopgap along the way to a truly [next-generation filesystem][8], none of the likely candidates will be ready (due to either technical or licensing problems) for deployment as a root filesystem for some time yet.

There are still a few key features being developed into future versions of ext4, including metadata checksumming, first-class quota support, and large allocation blocks.

#### Metadata checksumming

Since ext4 has redundant superblocks, checksumming the metadata within them offers the filesystem a way to figure out for itself whether the primary superblock is corrupt and needs to use an alternate. It is possible to recover from a corrupt superblock without checksumming—but the user would first need to realize that it was corrupt, and then try manually mounting the filesystem using an alternate. Since mounting a filesystem read-write with a corrupt primary superblock can, in some cases, cause further damage, this isn't a sufficient solution, even with a sufficiently experienced user!

Compared to the extremely robust per-block checksumming offered by next-gen filesystems such as btrfs or zfs, ext4's metadata checksumming is a pretty weak feature. But it's much better than nothing.

Although it sounds like a no-brainer—yes, checksum ALL THE THINGS!—there are some significant challenges to bolting checksums into a filesystem after the fact; see [the design document][9] for the gritty details.

#### First-class quota support

Wait, quotas?! We've had those since the ext2 days! Yes, but they've always been an afterthought, and they've always kinda sucked. It's probably not worth going into the hairy details here, but the [design document][10] lays out the ways quotas will be moved from userspace into the kernel and more correctly and performantly enforced.

#### Large allocation blocks

As time goes by, those pesky storage systems keep getting bigger and bigger. With some solid-state drives already using 8K hardware blocksizes, ext4's current limitation to 4K blocks gets more and more limiting. Larger storage blocks can decrease fragmentation and increase performance significantly, at the cost of increased "slack" space (the space left over when you only need part of a block to store a file or the last piece of a file).

You can view the hairy details in the [design document][11].

### Practical limitations of ext4

Ext4 is a robust, stable filesystem, and it's what most people should probably be using as a root filesystem in 2018. But it can't handle everything. Let's talk briefly about some of the things you shouldn't expect from ext4—now or probably in the future.

Although ext4 can address up to 1 EiB—equivalent to 1,000,000 TiB—of data, you really, really shouldn't try to do so. There are problems of scale above and beyond merely being able to remember the addresses of a lot more blocks, and ext4 does not now (and likely will not ever) scale very well beyond 50-100 TiB of data.

Ext4 also doesn't do enough to guarantee the integrity of your data. As big an advancement as journaling was back in the ext3 days, it does not cover a lot of the common causes of data corruption. If data is [corrupted][12] while already on disk—by faulty hardware, impact of cosmic rays (yes, really), or simple degradation of data over time—ext4 has no way of either detecting or repairing such corruption.

Building on the last two items, ext4 is only a pure filesystem, and not a storage volume manager. This means that even if you've got multiple disks—and therefore parity or redundancy, which you could theoretically recover corrupt data from—ext4 has no way of knowing that or using it to your benefit. While it's theoretically possible to separate a filesystem and storage volume management system in discrete layers without losing automatic corruption detection and repair features, that isn't how current storage systems are designed, and it would present significant challenges to new designs.

### Alternate filesystems

Before we get started, a word of warning: Be very careful with any alternate filesystem which isn't built into and directly supported as a part of your distribution's mainline kernel!

Even if a filesystem is safe, using it as the root filesystem can be absolutely terrifying if something hiccups during a kernel upgrade. If you aren't extremely comfortable with the idea of booting from alternate media and poking manually and patiently at kernel modules, grub configs, and DKMS from a chroot... don't go off the reservation with the root filesystem on a system that matters to you.

There may well be good reasons to use a filesystem your distro doesn't directly support—but if you do, I strongly recommend you mount it after the system is up and usable. (For example, you might have an ext4 root filesystem, but store most of your data on a zfs or btrfs pool.)

#### XFS

XFS is about as mainline as a non-ext filesystem gets under Linux. It's a 64-bit, journaling filesystem that has been built into the Linux kernel since 2001 and offers high performance for large filesystems and high degrees of concurrency (i.e., a really large number of processes all writing to the filesystem at once).

XFS became the default filesystem for Red Hat Enterprise Linux, as of RHEL 7. It still has a few disadvantages for home or small business users—most notably, it's a real pain to resize an existing XFS filesystem, to the point it usually makes more sense to create another one and copy your data over.

While XFS is stable and performant, there's not enough of a concrete end-use difference between it and ext4 to recommend its use anywhere that it isn't the default (e.g., RHEL7) unless it addresses a specific problem you're having with ext4, such as >50 TiB capacity filesystems.

XFS is not in any way a "next-generation" filesystem in the ways that ZFS, btrfs, or even WAFL (a proprietary SAN filesystem) are. Like ext4, it should most likely be considered a stopgap along the way towards [something better][8].

#### ZFS

ZFS was developed by Sun Microsystems and named after the zettabyte—equivalent to 1 trillion gigabytes—as it could theoretically address storage systems that large.

A true next-generation filesystem, ZFS offers volume management (the ability to address multiple individual storage devices in a single filesystem), block-level cryptographic checksumming (allowing detection of data corruption with an extremely high accuracy rate), [automatic corruption repair][12] (where redundant or parity storage is available), rapid [asynchronous incremental replication][13], inline compression, and more. [A lot more][14].

The biggest problem with ZFS, from a Linux user's perspective, is the licensing. ZFS was licensed CDDL, which is a semi-permissive license that conflicts with the GPL. There is a lot of controversy over the implications of using ZFS with the Linux kernel, with opinions ranging from "it's a GPL violation" to "it's a CDDL violation" to "it's perfectly fine, it just hasn't been tested in court." Most notably, Canonical has included ZFS code inline in its default kernels since 2016 without legal challenge so far.

At this time, even as a very avid ZFS user myself, I would not recommend ZFS as a root Linux filesystem. If you want to leverage the benefits of ZFS on Linux, set up a small root filesystem on ext4, then put ZFS on your remaining storage, and put data, applications, whatever you like on it—but keep root on ext4, until your distribution explicitly supports a zfs root.

#### btrfs

Btrfs—short for B-Tree Filesystem, and usually pronounced "butter"—was announced by Chris Mason in 2007 during his tenure at Oracle. Btrfs aims at most of the same goals as ZFS, offering multiple device management, per-block checksumming, asynchronous replication, inline compression, and [more][8].

As of 2018, btrfs is reasonably stable and usable as a standard single-disk filesystem but should probably not be relied on as a volume manager. It suffers from significant performance problems compared to ext4, XFS, or ZFS in many common use cases, and its next-generation features—replication, multiple-disk topologies, and snapshot management—can be pretty buggy, with results ranging from catastrophically reduced performance to actual data loss.

The ongoing status of btrfs is controversial; SUSE Enterprise Linux adopted it as its default filesystem in 2015, whereas Red Hat announced it would no longer support btrfs beginning with RHEL 7.4 in 2017. It is probably worth noting that production, supported deployments of btrfs use it as a single-disk filesystem, not as a multiple-disk volume manager a la ZFS—even Synology, which uses btrfs on its storage appliances, but layers it atop conventional Linux kernel RAID (mdraid) to manage the disks.

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/4/ext4-filesystem

作者：[Jim Salter][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/jim-salter
[1]:https://opensource.com/file/391546
[2]:https://opensource.com/sites/default/files/styles/panopoly_image_original/public/u128651/packard_bell_pc.jpg?itok=VI8dzcwp (Packard Bell computer)
[3]:https://commons.wikimedia.org/wiki/File:Old_packard_bell_pc.jpg
[4]:https://creativecommons.org/publicdomain/zero/1.0/deed.en
[5]:https://en.wikipedia.org/wiki/Unix_time
[6]:https://vleu.net/shake/
[7]:http://www.linux-mag.com/id/7272/
[8]:https://arstechnica.com/information-technology/2014/01/bitrot-and-atomic-cows-inside-next-gen-filesystems/
[9]:https://ext4.wiki.kernel.org/index.php/Ext4_Metadata_Checksums
[10]:https://ext4.wiki.kernel.org/index.php/Design_For_1st_Class_Quota_in_Ext4
[11]:https://ext4.wiki.kernel.org/index.php/Design_for_Large_Allocation_Blocks
[12]:https://en.wikipedia.org/wiki/Data_degradation#Visual_example_of_data_degradation
[13]:https://arstechnica.com/information-technology/2015/12/rsync-net-zfs-replication-to-the-cloud-is-finally-here-and-its-fast/
[14]:https://arstechnica.com/information-technology/2014/02/ars-walkthrough-using-the-zfs-next-gen-filesystem-on-linux/

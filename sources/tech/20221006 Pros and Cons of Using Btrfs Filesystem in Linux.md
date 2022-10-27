[#]: subject: "Pros and Cons of Using Btrfs Filesystem in Linux"
[#]: via: "https://itsfoss.com/btrfs/"
[#]: author: "Anuj Sharma https://itsfoss.com/author/anuj/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Pros and Cons of Using Btrfs Filesystem in Linux
======
Whenever you install Linux, you get to choose a file system, especially when you are manually partitioning your disk.

The most common option is Ext4, which is used as default in many desktop Linux distributions. But, after Fedora took the plunge to use Btrfs as its default file system, many desktop Linux users switched to Btrfs.

If you are one of them who want to switch to Btrfs, let me help you by listing the Pros and Cons of Btrfs as a file system. This will help you to decide whether to switch or not.

### What is Btrfs?

For starters, Btrfs is a modern copy-on-write file system for Linux with advanced features for fault tolerance, repair and easy administration. Btrfs uses [copy-on-write][1] for all files, which means if a file is modified/written to the storage, the file is not replaced but a copy of the file is created. This mechanism helps to create snapshots with minimum size as the unmodified files need not be copied for creating the snapshot.

Btrfs is licensed under the GPL and is open source.

### Advantages of Btrfs over Ext4

Let’s talk about the advantages Btrfs boasts over the traditional and more popular ext4 filesystem.

#### Snapshots

This is the most desired feature of Btrfs. As I have mentioned earlier, snapshots are created with minimal size due to the use of copy-on-write.

These snapshots can be used to restore the state of our system to a particular one without using more storage. Switching to a Btrfs snapshot is very quick.

This makes system recovery seamless which is desired by Linux users especially the ones using [rolling release distros][2] (which support newer packages making the system unstable).

![Btrfs Assistant showing a list of snapshots][3]

As you see, whenever I remove or install a package, a snapshot is created. This way, I can restore the system to a previous state if something goes wrong. These snapshots are also available at boot time.

[Btrfs Assistant][4] can be used for the same. If I restore my system to the highlighted snapshot (in the image above), it will restore my system to the state before I installed VLC Media Player.

Alternatively, if you are not able to login into your system, then a project called [grub-btrfs][5] can be used to boot into snapshots directly from [GRUB bootloader][6] as you can see in the screenshot below.

![GRUB menu with snapshots listed][7]

#### Compression

Btrfs also supports data compression, reducing the file size so you can store more data in less space. This also increases the lifespan of flash-based media storage devices (e.g., SSD, eMMC) as less data is written to disk.

It also increases performance for a process which do not load many files from your HDD. However, if a process needs to access more files from the HDD it can cause some slow down as decompression is done to access files.

#### Subvolumes

Subvolumes behave like a partition but are not the real disk partition. They can be compared to something like Volumes used in LVM (Logical Volume Manager).

Subvolumes make resizing quick and flexible as compared to real partitions. Interestingly, a Btrfs snapshot is also a subvolume that shares its data with another subvolume.

For example, to get a list of subvolumes, you can enter the following command and it also lists the snapshots as subvolumes.

```
sudo btrfs subvolumes list -p /
```

![Btrfs Subvolumes’ list in GNOME Terminal][8]

The best use case of subvolumes is creating root and home as separate subvolumes which will allocate space automatically as per requirement. This eliminates the dilemma of choosing root and home partition sizes while installing Linux.

Having the Home directory on a separate subvolume has another advantage. The system snapshots will get quite large if you have the Home directory included in the snapshot.

This is also true for Windows System Restore as it also does not take backup all the files. Only system files are included to keep storage requirements for the restore points to a minimum.

As you can see in the screenshot below listing the Subvolumes in Btrfs Assistant.

![Btrfs Assistant showing list of subvolumes][9]

### Disadvantages of Btrfs

Nothing in this world has only positives. Btrfs is no exception.

You have seen what it does better than Ext4. Let’s have a look at things it is not good at.

#### RAID

RAID (Redundant Array of Independent Disks) is a storage technology that combines multiple disk drive components into a logical unit. It is beneficial in servers mainly for the performance and data loss prevention it provides.

Btrfs supports RAID however RAID 5 and RAID 6 modes are deemed unstable as of now. As RAID 5 is one of the best choices for RAID, it can deter the adoption of Btrfs on servers.

#### Fragmentation

File fragmentation might not be an issue for SSDs but there are many people still using rotational drives. This will hamper performance over time in those cases, also defragmenting a file will create a separate copy of that file.

Therefore, the size of the snapshot also increases due to defragmentation. You can deduplicate the file but that creates more hassle for the user.

You will be surprised to know XFS or Ext4 do not require defragmentation.

#### Encryption

Unlike Ext4, Btrfs does not support encryption on the file system level. However, you can use third-party methods to encrypt a Btrfs filesystem.

#### Corruption recovery

File system check is not possible on a mounted Btrfs file system but can be used to check or repair an unmounted Btrfs filesystem. However, this may not able to repair filesystem errors (even minor ones).

This is due to heavy development being done on the Btrfs file system check tool.

### Conclusion

Btrfs may seem like a work in progress and you can check out the [stability status][10] from the official site anytime. However, it is under heavy, active development and is improving at a greater pace which gets me excited.

My recommendation is that if you have an SSD and use a rolling release distribution then go for it for the seamless recovery using snapshots. Otherwise, use the good old Ext4 for stability and performance.

Please do not take my word for it as this article is just my opinion and the pros and cons listed may not be the same for all the use cases.

I hope I was able to clear some air around using Btrfs of Linux. If you notice any technical errors, do let me know in the comment section.

Of course, a few points might be debatable. Feel free to express it in the comments.

--------------------------------------------------------------------------------

via: https://itsfoss.com/btrfs/

作者：[Anuj Sharma][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/anuj/
[b]: https://github.com/lkxed
[1]: https://en.wikipedia.org/wiki/copy-on-write
[2]: https://itsfoss.com/best-rolling-release-distros/
[3]: https://itsfoss.com/wp-content/uploads/2022/09/btrfs-assistant-snapshot-list.png
[4]: https://gitlab.com/btrfs-assistant/btrfs-assistant
[5]: https://github.com/Antynea/grub-btrfs
[6]: https://itsfoss.com/what-is-grub/
[7]: https://itsfoss.com/wp-content/uploads/2022/09/grub-btrfs-snapshot-list.png
[8]: https://itsfoss.com/wp-content/uploads/2022/09/btrfs-subvolume-list-in-terminal.png
[9]: https://itsfoss.com/wp-content/uploads/2022/09/btrfs-assistant-subvolumes-list.png
[10]: https://btrfs.wiki.kernel.org/index.php/Status

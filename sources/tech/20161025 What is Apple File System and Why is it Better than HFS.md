# What is Apple File System and Why is it Better than HFS+?

![](https://maketecheasier-2d0f.kxcdn.com/assets/uploads/2016/09/apple-file-system-hero-icon.jpg "What is Apple File System and Why is it Better than HFS+?s")

If you’ve been following the news from Apple’s latest release of macOS, you might have noticed some mention of Apple File System, or APFS. This is one of those wonky topics that don’t get a lot of attention. Yet, it’s the core structure underlying a user’s experience with the operating system. APFS won’t be finalized until 2017, but you can get a taste in the developer preview now available on Sierra.

### Differences and Improvements

To review quickly, a file system is the basic structure an operating system uses to store and retrieve data. Different file systems take different approaches to this task. As computers have become faster, newer file systems have taken advantage of the boost to offer new features and adapt to modern storage needs.

HFS+, the file system that ships with new Macs today, is eighteen years old. HFS, its progenitor, is older than the Tom Cruise bromance flick “Top Gun.” It’s sort of like an old Toyota. It still works (maybe surprisingly well), but it’s not winning any medals.

APFS isn’t so much an upgrade to HFS+ as it is a quantum leap forward … to the present. Though it’s a major upgrade for Apple users, it seems mostly like Apple is catching up to other systems, rather than overtaking them. Nevertheless, the update isn’t a day too soon.

### Cloning and Data Integrity

![apfs-cloning](https://maketecheasier-2d0f.kxcdn.com/assets/uploads/2016/10/apfs-cloning.png "apfs-cloning")

APFS uses a scheme called copy-on-write to make instant clones of duplicated files. Under HFS+ when a user duplicates a file, every single bit is copied. APFS instead creates a clone by manipulating metadata and allocating disk space. However, no bits are copied until the cloned file is modified. As the clone diverges from the original copy, those changes (and only those changes) are saved.

Copy-on-write also improves data integrity. Under other systems if your volume unmounts with overwrite operations pending, you might find part of your file system out of sync with the rest. Copy-on-write avoids the problem by writing changes to free disk space instead of overwriting old files. Until the write operation successfully completes, the old file is the canonical version. Only when the new file is successfully copied is the old file purged.

### System Snapshots

![apfs-snapshots](https://maketecheasier-2d0f.kxcdn.com/assets/uploads/2016/10/apfs-snapshots.png "apfs-snapshots")

Snapshots are a major upgrade and are brought to you in part by copy-on-write architecture. A snapshot is a read-only mountable image of a file system at a point in time. As the file system changes, only modified bits are saved. This can make backup simpler and more reliable. Considering the ungainly disappointment of hard links that Time Machine has become, this could be a major upgrade.

### I/O Quality of Service

You may have seen the term Quality of Service (QoS) in your router’s setup instructions. QoS prioritizes bandwidth usage to avoid slowing down priority tasks. On your router it employs user-defined rules to give selected tasks the most bandwidth. Reportedly, Apple’s QoS would prioritize user operations such as active windows. Background tasks like Time Machine backups would get demoted. So, maybe less beach balls?

### Native Encryption

![apfs-encryption-1](https://maketecheasier-2d0f.kxcdn.com/assets/uploads/2016/10/apfs-encryption-1.jpg "apfs-encryption-1")

In a post-Snowden world, encryption is all the rage. And more and more Apple is emphasizing the security of its systems. Built-in, strong encryption comes as no surprise. With APFS, Apple is incorporating a more nuanced encryption scheme than its current, whole-disk-or-nothing approach. Users can use a single key to encrypt all their data or use multiple encryption keys to lock individual files and folders separately. Of course, you could also encrypt nothing, you devil-may-care rascal.

### SSD & Flash Optimization

![apfs-ssd-storage](https://maketecheasier-2d0f.kxcdn.com/assets/uploads/2016/10/apfs-ssd-storage.jpg "apfs-ssd-storage")

Flash storage optimization has been listed as a headline feature of APFS, but the implementation isn’t thrilling. Rather than taking advantage of their unusual degree of system integration, Apple has instead shifted some of the functions typically handled by the SSD’s chips to the OS. It’s more like the file system is aware of SSDs rather than optimized for them.

### Dynamic Partition Resizing

![apfs-partition-resizing](https://maketecheasier-2d0f.kxcdn.com/assets/uploads/2016/10/apfs-partition-resizing.jpg "apfs-partition-resizing")

Logical partitions on an APFS drive can dynamically resize themselves. Users need only specify the number of desired partitions. The file system then works out disk allocation on the fly. Each partition only occupies disk space that it’s using to store files. The rest of the disk space is up for grabs by any partition. It’s neat, but it’s a lot more like meta-folders than anything else.

### Conclusion

Does this matter? For devs and power users this is awesome. For casual Mac users there shouldn’t be much outward difference. And while the upgrade is great, there are still some missing pieces. Native compression is notably absent, as is checksumming on user data. Of course, anything could change by 2017, so watch this space.

--------------------------------------------------------------------------------

via: https://www.maketecheasier.com/apple-file-system-better-than-hfs/?utm_medium=feed&utm_source=feedpress.me&utm_campaign=Feed%3A+maketecheasier

作者： [Alexander Fox][a]

译者：[译者ID](https://github.com/译者ID)

校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.maketecheasier.com/author/alexfox-2-2-2/
[1]:https://www.maketecheasier.com/apple-file-system-better-than-hfs/#respond
[3]:https://www.maketecheasier.com/schedule-windows-empty-recycle-bin/
[4]:https://www.maketecheasier.com/manage-automatic-wordpress-updates/
[5]:mailto:?subject=What%20is%20Apple%20File%20System%20and%20Why%20is%20it%20Better%20than%20HFS+?&body=https%3A%2F%2Fwww.maketecheasier.com%2Fapple-file-system-better-than-hfs%2F
[6]:http://twitter.com/share?url=https%3A%2F%2Fwww.maketecheasier.com%2Fapple-file-system-better-than-hfs%2F&text=What+is+Apple+File+System+and+Why+is+it+Better+than+HFS%2B%3F
[7]:http://www.facebook.com/sharer.php?u=https%3A%2F%2Fwww.maketecheasier.com%2Fapple-file-system-better-than-hfs%2F
[8]:https://www.maketecheasier.com/category/mac-tips/

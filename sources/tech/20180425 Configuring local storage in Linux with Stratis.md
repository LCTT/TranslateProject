Configuring local storage in Linux with Stratis
======

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/bus-storage.png?itok=95-zvHYl)
Configuring local storage is something desktop Linux users do very infrequently—maybe only once, during installation. Linux storage tech moves slowly, and many storage tools used 20 years ago are still used regularly today. But some things have improved since then. Why aren't people taking advantage of these new capabilities?

This article is about Stratis, a new project that aims to bring storage advances to all Linux users, from the simple laptop single SSD to a hundred-disk array. Linux has the capabilities, but its lack of an easy-to-use solution has hindered widespread adoption. Stratis's goal is to make Linux's advanced storage features accessible.

### Simple, reliable access to advanced storage features

Stratis aims to make three things easier: initial configuration of storage; making later changes; and using advanced storage features like snapshots, thin provisioning, and even tiering.

### Stratis: a volume-managing filesystem

Stratis is a volume-managing filesystem (VMF) like [ZFS][1] and [Btrfs][2] . It starts with the central idea of a storage "pool," an idea common to VMFs and also standalone volume managers such as [LVM][3] . This pool is created from one or more local disks (or partitions), and volumes are created from the pool. Their exact layout is not specified by the user, unlike traditional disk partitioning using [fdisk][4] or [GParted][5]

VMFs take it a step further and integrate the filesystem layer. The user no longer picks a filesystem to put on the volume. The filesystem and volume are merged into a single thing—a conceptual tree of files (which ZFS calls a dataset, Btrfs a subvolume, and Stratis a filesystem) whose data resides in the pool but that has no size limit except for the pool's total size.

Another way of looking at this: Just as a filesystem abstracts the actual location of storage blocks that make up a single file within the filesystem, a VMF abstracts the actual storage blocks of a filesystem within the pool.

The pool enables other useful features. Some of these, like filesystem snapshots, occur naturally from the typical implementation of a VMF, where multiple filesystems can share physical data blocks within the pool. Others, like redundancy, tiering, and integrity, make sense because the pool is a central place to manage these features for all the filesystems on the system.

The result is that a VMF is simpler to set up and manage and easier to enable for advanced storage features than independent volume manager and filesystem layers.

### What makes Stratis different from ZFS or Btrfs?

Stratis is a new project, which gives it the benefit of learning from previous projects. What Stratis learned from ZFS, Btrfs, and LVM will be covered in depth in [Part 2][6], but to summarize, the differences in Stratis come from seeing what worked and what didn't work for others, from changes in how people use and automate computers, and changes in the underlying hardware.

First, Stratis focuses on being easy and safe to use. This is important for the individual user, who may go for long stretches of time between interactions with Stratis. If these interactions are unfriendly, especially if there's a possibility of losing data, most people will stick with the basics instead of using new features.

Second, APIs and DevOps-style automation are much more important today than they were even a few years ago. Stratis supports automation by providing a first-class API, so people and software tools alike can use Stratis directly.

Third, SSDs have greatly expanded in capacity as well as market share. Earlier filesystems went to great lengths to optimize for rotational media's slow access times, but flash-based media makes these efforts less important. Even if a pool's data is too big to use SSDs economically for the entire pool, an SSD caching tier is still an option and can give excellent results. Assuming good performance because of SSDs lets Stratis focus its pool design on flexibility and reliability.

Finally, Stratis has a very different implementation model from ZFS and Btrfs (I'll this discuss further in [Part 2][6]). This means some things are easier for Stratis, while other things are harder. It also increases Stratis's pace of development.

### Learn more

To learn more about Stratis, check out [Part 2][6] of this series. You'll also find a detailed [design document][7] on the [Stratis website][8].

### Get involved

To develop, test, or offer feedback on Stratis, subscribe to our [mailing list][9].

Development is on [GitHub][10] for both the [daemon][11] (written in [Rust][12]) and the [command-line tool][13] (written in [Python][14]).

Join us on the [Freenode][15] IRC network on channel #stratis-storage.

Andy Grover will be speaking at LinuxFest Northwest this year. See [program highlights][16] or [register to attend][17].

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/4/stratis-easy-use-local-storage-management-linux

作者：[Andy Grover][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/agrover
[1]:https://en.wikipedia.org/wiki/ZFS
[2]:https://en.wikipedia.org/wiki/Btrfs
[3]:https://en.wikipedia.org/wiki/Logical_Volume_Manager_(Linux)
[4]:https://en.wikipedia.org/wiki/Fdisk
[5]:https://gparted.org/
[6]:https://opensource.com/article/18/4/stratis-lessons-learned
[7]:https://stratis-storage.github.io/StratisSoftwareDesign.pdf
[8]:https://stratis-storage.github.io/
[9]:https://lists.fedoraproject.org/admin/lists/stratis-devel.lists.fedorahosted.org/
[10]:https://github.com/stratis-storage/
[11]:https://github.com/stratis-storage/stratisd
[12]:https://www.rust-lang.org/
[13]:https://github.com/stratis-storage/stratis-cli
[14]:https://www.python.org/
[15]:https://freenode.net/
[16]:https://www.linuxfestnorthwest.org/conferences/lfnw18
[17]:https://www.linuxfestnorthwest.org/conferences/lfnw18/register/new

[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Incremental backups with Btrfs snapshots)
[#]: via: (https://fedoramagazine.org/btrfs-snapshots-backup-incremental/)
[#]: author: (Alessio https://fedoramagazine.org/author/alciregi/)

Incremental backups with Btrfs snapshots
======

![][1]

Snapshots are an interesting feature of Btrfs. A snapshot is a copy of a subvolume. Taking a snapshot is immediate. However, taking a snapshot is not like performing a _rsync_ or a _cp_, and a snapshot doesn’t occupy space as soon as it is created.

Editors note: From the [BTRFS Wiki][2] – A snapshot is simply a subvolume that shares its data (and metadata) with some other subvolume, using Btrfs’s COW capabilities.

Occupied space will increase alongside the data changes in the original subvolume or in the snapshot itself, if it is writeable. Added/modified files, and deleted files in the subvolume still reside in the snapshots. This is a convenient way to perform backups.

### Using snapshots for backups

A snapshot resides on the same disk where the subvolume is located. You can browse it like a regular directory and recover a copy of a file as it was when the snapshot was performed. By the way, a snapshot on the same disk of the snapshotted subvolume is not an ideal backup strategy: if the hard disk broke, snapshots will be lost as well. An interesting feature of snapshots is the ability to send them to another location. The snapshot can be sent to an external hard drive or to a remote system via SSH (the destination filesystems need to be formatted as Btrfs as well). To do this, the commands _btrfs send_ and _btrfs receive_ are used.

### Taking a snapshot

In order to use the _send_ and the _receive_ commands, it is important to create the snapshot as read-only, and snapshots are writeable by default.

The following command will take a snapshot of the _/home_ subvolume. Note the _-r_ flag for readonly.

sudo btrfs subvolume snapshot -r /home /.snapshots/home-day1

Instead of day1, the snapshot name can be the current date, like _home-$(date +%Y%m%d)_. Snapshots look like regular subdirectories. You can place them wherever you like. The directory _/.snapshots_ could be a good choice to keep them neat and to avoid confusion.

Editors note: Snapshots will not take recursive snapshots of themselves. If you create a snapshot of a subvolume, every subvolume or snapshot that the subvolume contains is mapped to an empty directory of the same name inside the snapshot.

### Backup using btrfs send

In this example the destination Btrfs volume in the USB drive is mounted as _/run/media/user/mydisk/bk_ . The command to send the snapshot to the destination is:

sudo btrfs send /.snapshots/home-day1 | sudo btrfs receive /run/media/user/mydisk/bk

This is called initial bootstrapping, and it corresponds to a full backup. This task will take some time, depending on the size of the _/home_ directory. Obviously, subsequent incremental sends will take a shorter time.

### Incremental backup

Another useful feature of snapshots is the ability to perform the send task in an incremental way. Let’s take another snapshot.

sudo btrfs subvolume snapshot -r /home /.snapshots/home-day2

In order to perform the send task incrementally, you need to specify the previous snapshot as a base and this snapshot has to exist in the source and in the destination. Please note the _-p_ option.

sudo btrfs send -p /.snapshot/home-day1 /.snapshot/home-day2 | sudo btrfs receive /run/media/user/mydisk/bk

And again (the day after):

sudo btrfs subvolume snapshot -r /home /.snapshots/home-day3

sudo btrfs send -p /.snapshot/home-day2 /.snapshot/home-day3 | sudo btrfs receive /run/media/user/mydisk/bk

### Cleanup

Once the operation is complete, you can keep the snapshot. But if you perform these operations on a daily basis, you could end up with a lot of them. This could lead to confusion and potentially a lot of used space on your disks. So it is a good advice to delete some snapshots if you think you don’t need them anymore.

Keep in mind that in order to perform an incremental send you need at least the last snapshot. This snapshot must be present in the source and in the destination.

sudo btrfs subvolume delete /.snapshot/home-day1

sudo btrfs subvolume delete /.snapshot/home-day2

sudo btrfs subvolume delete /run/media/user/mydisk/bk/home-day1

sudo btrfs subvolume delete /run/media/user/mydisk/bk/home-day2

Note: the day 3 snapshot was preserved in the source and in the destination. In this way, tomorrow (day 4), you can perform a new incremental _btrfs send_.

As some final advice, if the USB drive has a bunch of space, you could consider maintaining multiple snapshots in the destination, while in the source disk you would keep only the last one.

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/btrfs-snapshots-backup-incremental/

作者：[Alessio][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/alciregi/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2020/08/butterfs-816x346.png
[2]: https://btrfs.wiki.kernel.org/index.php/SysadminGuide#Snapshots

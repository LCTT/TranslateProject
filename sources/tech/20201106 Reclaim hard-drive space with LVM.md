[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Reclaim hard-drive space with LVM)
[#]: via: (https://fedoramagazine.org/reclaim-hard-drive-space-with-lvm/)
[#]: author: (Troy Curtis Jr https://fedoramagazine.org/author/troycurtisjr/)

Reclaim hard-drive space with LVM
======

![Hard drive image][1]

Photo by Frank R @ Unsplash.com

LVM is a tool for logical volume management which includes allocating disks, striping, mirroring and resizing logical volumes. It is commonly used on Fedora installations (prior to BTRFS as default it was LVM+Ext4). But have you ever started up your system to find out that Gnome just said the home volume is almost out of space! Luckily, there is likely some space sitting around in another volume, unused and ready to re-alocate. Here’s how to reclaim hard-drive space with LVM.

The key to easily re-alocate space between volumes is the [Logical Volume Manager (LVM)][2]. Fedora 32 and before use LVM to divide disk space by default. This technology is similar to standard hard-drive partitions, but LVM is a lot more flexible. LVM enables not only flexible volume size management, but also advanced capabilities such as read-write snapshots, striping or mirroring data across multiple drives, using a high-speed drive as a cache for a slower drive, and much more. All of these advanced options can get a bit overwhelming, but resizing a volume is straight-forward.

### LVM basics

The _volume group_ serves as the main container in the LVM system. By default Fedora only defines a single volume group, but there can be as many as needed. Actual hard-drive and hard-drive partitions are added to the _volume group_ as _physical volumes_. _Physical volumes_ add available free space to the _volume group_. A typical Fedora install has one formatted boot partition, and the rest of the drive is a partition configured as an LVM _physical volume_.

Out of this pool of available space, the _volume group_ allocates one or more _logical volumes_. These volumes are similar to hard-drive partitions, but without the limitation of contiguous space on the disk. LVM _logical volumes_ can even span multiple devices! Just like hard-drive partitions, _logical volumes_ have a defined size and can contain any filesystem which can then be mounted to specific directories.

### What’s needed

Confirm the system uses LVM with the _gnome-disks_ application, and make sure there is free space available in some other volume. Without space to reclaim from another volume, this guide isn’t useful. A [Fedora live CD/USB][3] is also needed. Any file system that needs to shrink must be unmounted. Running from a live image allows all the volumes on the hard-disk to remain unmounted, even important directories like _/_ and _/home_.

![Use gnome-disks to verify free space][4]

### A word of warning

No data should be lost by following this guide, but it does muck around with some very low-level and powerful commands. One mistake could destroy all data on the hard-drive. So backup all the data on the disk first!

### Resizing LVM volumes

To begin, boot the Fedora live image and select _Try Fedora_ at the dialog. Next, use the _Run Command_ to launch the _blivet-gui_ application (accessible by pressing _Alt-F2_, typing _blivet-gui_, then pressing _enter_). Select the volume group on the left under _LVM_. The logical volumes are on the right.

![Explore logical volumes in blivet-gui][5]

The logical volume labels consist of both the volume group name and the logical volume name. In the example, the volume group is “fedora_localhost-live” and there are “home”, “root”, and “swap” logical volumes allocated. To find the full volume, select each one, click on the _gear_ icon, and choose _resize_. The slider in the resize dialog indicates the allowable sizes for the volume. The minimum value on the left is the space already in use within the file system, so this is the minimum possible volume size (without deleting data). The maximum value on the right is the greatest size the volume can have based on available free space in the _volume group_.

![Resize dialog in blivet-gui][6]

A grayed out _resize_ option means the volume is full and there is no free space in the volume group. It’s time to change that! Look through all of the volumes to find one with plenty of extra space, like in the screenshot above. Move the slider to the left to set the new size. Free up enough space to be useful for the full volume, but still leave plenty of space for future data growth. Otherwise, this volume will be the next to fill up.

Click _resize_ and note that a new item appears in the volume listing: _free space_. Now select the full volume that started this whole endeavor, and move the slider all the way to the right. Press _resize_ and marvel at the new improved volume layout. However, nothing has changed on the hard drive yet. Click on the _check-mark_ to commit the changes to disk.

![Review changes in blivet-gui][7]

Review the summary of the changes, and if everything looks right, click _Ok_ to proceed. Wait for _blivet-gui_ to finish. Now reboot back into the main Fedora install and enjoy all the new space in the previously full volume.

### Planning for the future

It is challenging to know how much space any particular volume will need in the future. Instead of immediately allocating all available free space, consider leaving it free in the volume group. In fact, Fedora Server reserves space in the volume group by default. Extending a volume is possible while it is online and in use. No live image or reboot needed. When a volume is almost full, easily extend the volume using part of the available free space and keep working. Unfortunately the default disk manager, _gnome-disks_, does not support LVM volume resizing, so install _[blivet-gui][8]_ for a graphical management tool. Alternately, there is a simple terminal command to extend a volume:

```
lvresize -r -L +1G /dev/fedora_localhost-live/root
```

### Wrap-up

Reclaiming hard-drive space with LVM just scratches the surface of LVM capabilities. Most people, especially on the desktop, probably don’t need the more advanced features. However, LVM is there when the need arises, though it can get a bit complex to implement. [BTRFS][9] is the default filesystem, without LVM, starting with [Fedora 33][10]. BTRFS can be easier to manage while still flexible enough for most common usages. Check out the recent [Fedora Magazine articles on BTRFS][11] to learn more.

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/reclaim-hard-drive-space-with-lvm/

作者：[Troy Curtis Jr][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/troycurtisjr/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2020/11/lvm-resize-816x345.jpg
[2]: http://sourceware.org/lvm2/
[3]: https://getfedora.org/en/workstation/download/
[4]: https://fedoramagazine.org/wp-content/uploads/2020/11/gnome-disks.png
[5]: https://fedoramagazine.org/wp-content/uploads/2020/11/blivet-overview.png
[6]: https://fedoramagazine.org/wp-content/uploads/2020/11/blivet-resize-1024x525.png
[7]: https://fedoramagazine.org/wp-content/uploads/2020/11/blivet-summary-1024x525.png
[8]: https://fedoraproject.org/wiki/Blivet-gui
[9]: https://fedoramagazine.org/btrfs-coming-to-fedora-33/
[10]: https://fedoramagazine.org/whats-new-fedora-33-workstation/
[11]: https://fedoramagazine.org/btrfs-snapshots-backup-incremental/

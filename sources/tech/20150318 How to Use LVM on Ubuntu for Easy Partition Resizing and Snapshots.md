How to Use LVM on Ubuntu for Easy Partition Resizing and Snapshots
================================================================================
![](http://cdn5.howtogeek.com/wp-content/uploads/2015/03/ximg_55035707bbd74.png.pagespeed.ic.9_yebxUF1C.png)

Ubuntu’s installer offers an easy “Use LVM” checkbox. The description says it enables Logical Volume Management so you can take snapshots and more easily resize your hard disk partitions — here’s how to do that.

LVM is a technology that’s similar to [RAID arrays][1] or [Storage Spaces on Windows][2] in some ways. While this technology is particularly useful on servers, it can be used on desktop PCs, too.

### Should You Use LVM With Your New Ubuntu Installation? ###

The first question is whether you even want to use LVM with your Ubuntu installation. Ubuntu makes this easy to enable with a quick click, but this option isn’t enabled by default. As the installer says, this allows you to resize partitions, create snapshots, merge multiple disks into a single logical volume, and so on — all while the system is running. Unlike with typical partitions, you don’t have to shut down your system, boot from a live CD or USB drive, and [resize your partitions while they aren’t in use][3].

To be perfectly honest, the average Ubuntu desktop user probably won’t realize whether they’re using LVM or not. But, if you want to do more advanced things later, LVM can help. LVM is potentially more complex, which could cause problems if you need to recover your data later — especially if you’re not that experienced with it. There shouldn’t be a noticeable performance penalty here — LVM is implemented right down in the Linux kernel.

![](http://cdn5.howtogeek.com/wp-content/uploads/2015/03/ximg_55035cbada6ae.png.pagespeed.ic.cnqyiKfCvi.png)

### Logical Volume Management Explained ###

We’re previously [explained what LVM is][4]. In a nutshell, it provides a layer of abstraction between your physical disks and the partitions presented to your operating system. For example, your computer might have two hard drives inside it, each 1 TB in size. You’d have to have at least two partitions on these disks, and each of these partitions would be 1 TB in size.

LVM provides a layer of abstraction over this. Instead of the traditional partition on a disk, LVM would treat the disks as two separate “physical volumes” after you initialize them. You could then create “logical volumes” based on these physical volumes. For example, you could combine those two 1 TB disks into a single 2 TB partition. Your operating system would just see a 2 TB volume, and LVM would deal with everything in the background. A group of physical volumes and logical volumes is known as a “volume group.” A typical system will just have a single volume group.

This layer of abstraction makes it possibly to easily resize partitions, combine multiple disks into a single volume, and even take “snapshots” of a partition’s file system while it’s running, all without unmounting it.

Note that merging multiple disks into a single volume can be a bad idea if you’re not creating backups. It’s like with RAID 0 — if you combine two 1 TB volumes into a single 2 TB volume, you could lose important data on the volume if just one of your hard disks fails. Backups are crucial if you go this route.

### Graphical Utilities for Managing Your LVM Volumes ###

Traditionally, [LVM volumes are managed with Linux terminal commands][5].These will work for you on Ubuntu, but there’s an easier, graphical method anyone can take advantage of. If you’re a Linux user used to using GParted or a similar partition manager, don’t bother — GParted doesn’t have support for LVM disks.

Instead, you can use the Disks utility included along with Ubuntu for this. This utility is also known as GNOME Disk Utility, or Palimpsest. Launch it by clicking the icon on the dash, searching for Disks, and pressing Enter. Unlike GParted, the Disks utility will display your LVM partitions under “Other Devices,” so you can format them and adjust other options if you need to. This utility will also work from a live CD or USB drive, too.

![](http://cdn5.howtogeek.com/wp-content/uploads/2015/03/ximg_550361b3772f7.png.pagespeed.ic.nZWwLJUywR.png)

Unfortunately, the Disks utility doesn’t include support for taking advantage of LVM’s most powerful features. There’s no options for managing your volume groups, extending partitions, or taking snapshots. You could do that from the terminal, but you don’t have to. Instead, you can open the Ubuntu Software Center, search for LVM, and install the Logical Volume Management tool. You could also just run the **sudo apt-get install system-config-lvm** command in a terminal window. After it’s installed, you can open the Logical Volume Management utility from the dash.

This graphical configuration tool was made by Red Hat. It’s a bit dated, but it’s the only graphical way to do this stuff without resorting to terminal commands.

Let’s say you wanted to add a new physical volume to your volume group. You’d open the tool, select the new disk under Uninitialized Entries, and click the “Initialize Entry” button. You’d then find the new physical volume under Unallocated Volumes, and you could use the “Add to existing Volume Group” button to add it to the “ubuntu-vg” volume group Ubuntu created during the installation process.

![](http://cdn5.howtogeek.com/wp-content/uploads/2015/03/ximg_550363106789c.png.pagespeed.ic.drVInt3Weq.png)

The volume group view shows you a visual overview of your physical volumes and logical volumes. Here, we have two physical partitions across two separate hard drives. We have a swap partition and a root partition, just as Ubuntu sets up its partitioning scheme by default. Because we’ve added a second physical partition from another drive, there’s now a good chunk of unused space.

![](http://cdn5.howtogeek.com/wp-content/uploads/2015/03/ximg_550363f631c19.png.pagespeed.ic.54E_Owcq8y.png)

To expand a logical partition into the physical space, you could select it under Logical View, click Edit Properties, and modify the size to grow the partition. You could also shrink it from here.

![](http://cdn5.howtogeek.com/wp-content/uploads/2015/03/ximg_55036893712d3.png.pagespeed.ic.ce7y_Mt0uF.png)

The other options in system-config-lvm allow you to set up snapshots and mirroring. You probably won’t need these features on a typical desktop, but they’re available graphically here. Remember, you can also [do all of this with terminal commands][6].

--------------------------------------------------------------------------------

via: http://www.howtogeek.com/211937/how-to-use-lvm-on-ubuntu-for-easy-partition-resizing-and-snapshots/

译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://www.howtogeek.com/162676/how-to-use-multiple-disks-intelligently-an-introduction-to-raid/
[2]:http://www.howtogeek.com/109380/how-to-use-windows-8s-storage-spaces-to-mirror-combine-drives/
[3]:http://www.howtogeek.com/114503/how-to-resize-your-ubuntu-partitions/
[4]:http://www.howtogeek.com/howto/40702/how-to-manage-and-use-lvm-logical-volume-management-in-ubuntu/
[5]:http://www.howtogeek.com/howto/40702/how-to-manage-and-use-lvm-logical-volume-management-in-ubuntu/
[6]:http://www.howtogeek.com/howto/40702/how-to-manage-and-use-lvm-logical-volume-management-in-ubuntu/
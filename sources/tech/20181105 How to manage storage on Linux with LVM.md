How to manage storage on Linux with LVM
======
Create, expand, and encrypt storage pools as needed with the Linux LVM utilities.
![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/bus-storage.png?itok=95-zvHYl)

Logical Volume Manager ([LVM][1]) is a software-based RAID-like system that lets you create "pools" of storage and add hard drive space to those pools as needed. There are lots of reasons to use it, especially in a data center or any place where storage requirements change over time. Many Linux distributions use it by default for desktop installations, though, because users find the flexibility convenient and there are some built-in encryption features that the LVM structure simplifies.

However, if you aren't used to seeing an LVM volume when booting off of a Live CD for data rescue or migration purposes, LVM can be confusing because the **mount** command can't mount LVM volumes. For that, you need LVM tools installed. The chances are great that your distribution has LVM utils available—if they aren't already installed.

This tutorial explains how to create and deal with LVM volumes.

### Create an LVM pool

This article assumes you have a working knowledge of how to interact with hard drives on Linux. If you need more information on the basics before continuing, read my [introduction to hard drives on Linux][2]

Usually, you don't have to set up LVM at all. When you install Linux, it often defaults to creating a virtual "pool" of storage and adding your machine's hard drive(s) to that pool. However, manually creating an LVM storage pool is a great way to learn what happens behind the scenes.

You can practice with two spare thumb drives of any size, or two hard drives, or a virtual machine with two imaginary drives defined.

First, format the imaginary drive **/dev/sdx** so that you have a fresh drive ready to use for this demo.

```
# echo "warning, this ERASES everything on this drive."
warning, this ERASES everything on this drive.
# dd if=/dev/zero of=/dev/sdx count=8196
# parted /dev/sdx print | grep Disk
Disk /dev/sdx: 100GB
# parted /dev/sdx mklabel gpt
# parted /dev/sdx mkpart primary 1s 100%
```

This LVM command creates a storage pool. A pool can consist of one or more drives, and right now it consists of one. This example storage pool is named **billiards** , but you can call it anything.

```
# vgcreate billiards /dev/sdx1
```

Now you have a big, nebulous pool of storage space. Time to hand it out. To create two logical volumes (you can think of them as virtual drives), one called **vol0** and the other called **vol1** , enter the following:

```
# lvcreate billiards 49G --name vol0
# lvcreate billiards 49G --name vol1
```

Now you have two volumes carved out of one storage pool, but neither of them has a filesystem yet. To create a filesystem on each volume, you must bring the **billiards** volume group online.

```
# vgchange --activate y billiards
```

Now make the file systems. The **-L** option provides a label for the drive, which is displayed when the drive is mounted on your desktop. The path to the volume is a little different than the usual device paths you're used to because these are virtual devices in an LVM storage pool.

```
# mkfs.ext4 -L finance /dev/billiards/vol0
# mkfs.ext4 -L production /dev/billiards/vol1
```

You can mount these new volumes on your desktop or from a terminal.

```
# mkdir -p /mnt/vol0 /mnt/vol1
# mount /dev/billiards/vol0 /mnt/vol0
# mount /dev/billiards/vol1 /mnt/vol1
```

### Add space to your pool

So far, LVM has provided nothing more than partitioning a drive normally provides: two distinct sections of drive space on a single physical drive (in this example, 49GB and 49GB on a 100GB drive). Imagine now that the finance department needs more space. Traditionally, you'd have to restructure. Maybe you'd move the finance department data to a new, dedicated physical drive, or maybe you'd add a drive and then use an ugly symlink hack to provide users easy access to their additional storage space. With LVM, however, all you have to do is expand the storage pool.

You can add space to your pool by formatting another drive and using it to create more additional space.

First, create a partition on the new drive you're adding to the pool.

```
# part /dev/sdy mkpart primary 1s 100%
```

Then use the **vgextend** command to mark the new drive as part of the pool.

```
# vgextend billiards /dev/sdy1
```

Finally, dedicate some portion of the newly available storage pool to the appropriate logical volume.

```
# lvextend -L +49G /dev/billiards/vol0
```

Of course, the expansion doesn't have to be so linear. Imagine that the production department suddenly needs 100TB of additional space. With LVM, you can add as many physical drives as needed, adding each one and using **vgextend** to create a 100TB storage pool, then using **lvextend** to  "stretch" the production department's storage space across 100TB of available space.

### Use utils to understand your storage structure

Once you start using LVM in earnest, the landscape of storage can get overwhelming. There are two commands to gather information about the structure of your storage infrastructure.

First, there is **vgdisplay** , which displays information about your volume groups (you can think of these as LVM's big, high-level virtual drives).

```
# vgdisplay
  --- Volume group ---
  VG Name               billiards
  System ID            
  Format                lvm2
  Metadata Areas        1
  Metadata Sequence No  4
  VG Access             read/write
  VG Status             resizable
  MAX LV                0
  Cur LV                3
  Open LV               3
  Max PV                0
  Cur PV                1
  Act PV                1
  VG Size               <237.47 GiB
  PE Size               4.00 MiB
  Total PE              60792
  Alloc PE / Size       60792 / <237.47 GiB
  Free  PE / Size       0 / 0  
  VG UUID               j5RlhN-Co4Q-7d99-eM3K-G77R-eDJO-nMR9Yg
```

The second is **lvdisplay** , which displays information about your logical volumes (you can think of these as user-facing drives).

```
# lvdisplay
  --- Logical volume ---
  LV Path                /dev/billiards/finance
  LV Name                finance
  VG Name                billiards
  LV UUID                qPgRhr-s0rS-YJHK-0Cl3-5MME-87OJ-vjjYRT
  LV Write Access        read/write
  LV Creation host, time localhost, 2018-12-16 07:31:01 +1300
  LV Status              available
  # open                 1
  LV Size                149.68 GiB
  Current LE             46511
  Segments               1
  Allocation             inherit
  Read ahead sectors     auto
  - currently set to     256
  Block device           253:3

[...]
```

### Use LVM in a rescue environment

The "problem" with LVM is that it wraps partitions in a way that is unfamiliar to many administrative users who are used to traditional drive partitioning. Under normal circumstances, LVM drives are activated and mounted fairly invisibly during the boot process or desktop LVM integration. It's not something you typically have to think about. It only becomes problematic when you find yourself in recovery mode after something goes wrong with your system.

If you need to mount a volume that's "hidden" within the structure of LVM, you must make sure that the LVM toolchain is installed. If you have access to your **/usr/sbin** directory, you probably have access to all of your usual LVM commands. But if you've booted into a minimal shell or a rescue environment, you may not have those tools. A good rescue environment has LVM installed, so if you're in a minimal shell, find a rescue system that does. If you're using a rescue disc and it doesn't have LVM installed, either install it manually or find a rescue disc that already has it.

For the sake of repetition and clarity, here's how to mount an LVM volume.

```
# vgchange --activate y
2 logical volume(s) in volume group "billiards" now active
# mkdir /mnt/finance
# mount /dev/billiards/finance /mnt/finance
```

### Integrate LVM with LUKS encryption

Many Linux distributions use LVM by default when installing the operating system. This permits storage extension later, but it also integrates nicely with disk encryption provided by the Linux Unified Key Setup ([LUKS][3]) encryption toolchain.

Encryption is pretty important, and there are two ways to encrypt things: you can encrypt on a per-file basis with a tool like GnuPG, or you can encrypt an entire partition. On Linux, encrypting a partition is easy with LUKS, which, being completely integrated into Linux by way of kernel modules, permits drives to be mounted for seamless reading and writing.

Encrypting your entire main drive usually happens as an option during installation. You select to encrypt your entire drive or just your home partition when prompted, and from that point on you're using LUKS. It's mostly invisible to you, aside from a password prompt during boot.

If your distribution doesn't offer this option during installation, or if you just want to encrypt a drive or partition manually, you can do that.

You can follow this example by using a spare drive; I used a small 4GB thumb drive.

First, plug the drive into your computer. Make sure it's safe to erase the drive and [use lsblk][2] to locate the drive on your system.

If the drive isn't already partitioned, partition it now. If you don't know how to partition a drive, check out the link above for instructions.

Now you can set up the encryption. First, format the partition with the **cryptsetup** command.

```
# cryptsetup luksFormat /dev/sdx1
```

Note that you're encrypting the partition, not the physical drive itself. You'll see a warning that LUKS is going to erase your drive; you must accept it to continue. You'll be prompted to create a passphrase, so do that. Don't forget that passphrase. Without it, you will never be able to get into that drive again!

You've encrypted the thumb drive's partition, but there's no filesystem on the drive yet. Of course, you can't write a filesystem to the drive while you're locked out of it, so open the drive with LUKS first. You can provide a human-friendly name for your drive; for this example, I used **mySafeDrive**.

```
# cryptsetup luksOpen /dev/sdx1 mySafeDrive
```

Enter your passphrase to open the drive.

Look in **/dev/mapper** and you'll see that you've mounted the volume along with any other LVM volumes you might have, meaning you now have access to that drive. The custom name (e.g., mySafeDrive) is a symlink to an auto-generated designator in **/dev/mapper**. You can use either path when operating on this drive.

```
# ls -l /dev/mapper/mySafeDrive
lrwxrwxrwx. 1 root root 7 Oct 24 03:58 /dev/mapper/mySafeDrive -> ../dm-4
```

Create your filesystem.

```
# mkfs.ext4 -o Linux -L mySafeExt4Drive /dev/mapper/mySafeDrive
```

Now do an **ls -lh** on **/dev/mapper** and you'll see that mySafeDrive is actually a symlink to some other dev; probably **/dev/dm0** or similar. That's the filesystem you can mount:

```
# mount /dev/mapper/mySafeExt4Drive /mnt/hd
```

Now the filesystem on the encrypted drive is mounted. You can read and write files as you'd expect with any drive.

### Use encrypted drives with the desktop

LUKS is built into the kernel, so your Linux system is fully aware of how to handle it. Detach the drive, plug it back in, and mount it from your desktop. In KDE's Dolphin file manager, you'll be prompted for a password before the drive is decrypted and mounted.

![](https://opensource.com/sites/default/files/uploads/lvm_luksprompt_1.jpeg)

Using LVM and LUKS is easy, and it provides flexibility for you as a user and an admin. Being tightly integrated into Linux itself, it's well-supported and a great way to add a layer of security to your data. Try it today!

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/11/manage-storage-lvm

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://en.wikipedia.org/wiki/Logical_Volume_Manager_(Linux)
[2]: https://opensource.com/article/18/10/partition-and-format-drive-linux
[3]: https://en.wikipedia.org/wiki/Linux_Unified_Key_Setup

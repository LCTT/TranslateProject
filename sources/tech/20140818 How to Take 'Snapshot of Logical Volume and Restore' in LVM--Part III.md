Translating by GOLinux ...
How to Take ‘Snapshot of Logical Volume and Restore’ in LVM – Part III
================================================================================
**LVM Snapshots** are space efficient pointing time copies of lvm volumes. It works only with lvm and consume the space only when changes are made to the source logical volume to snapshot volume. If source volume has a huge changes made to sum of 1GB the same changes will be made to the snapshot volume. Its best to always have a small size of changes for space efficient. Incase the snapshot runs out of storage, we can use lvextend to grow. And if we need to shrink the snapshot we can use lvreduce.

![Take Snapshot in LVM](http://www.tecmint.com/wp-content/uploads/2014/08/Take-Snapshot-in-LVM.jpg)
Take Snapshot in LVM

If we have accidentally deleted any file after creating a Snapshot we don’t have to worry because the snapshot have the original file which we have deleted. It is possible if the file was there when the snapshot was created. Don’t alter the snapshot volume, keep as it while snapshot used to do a fast recovery.

Snapshots can’t be use for backup option. Backups are Primary Copy of some data’s, so we cant use snapshot as a backup option.

#### Requirements ####

注：此两篇文章如果发布后可换成发布后链接，原文在前几天更新中

- [Create Disk Storage with LVM in Linux – PART 1][1]
- [How to Extend/Reduce LVM’s in Linux – Part II][2]

### My Server Setup ###

- Operating System – CentOS 6.5 with LVM Installation
- Server IP – 192.168.0.200

#### Step 1: Creating LVM Snapshot ####

First, check for free space in volume group to create a new snapshot using following ‘**vgs**‘ command.

    # vgs
    # lvs

![Check LVM Disk Space](http://www.tecmint.com/wp-content/uploads/2014/08/Check-LVM-Disk-Space.jpg)
Check LVM Disk Space

You see, there is 8GB of free space left in above **vgs** output. So, let’s create a snapshot for one of my volume named **tecmint_datas**. For demonstration purpose, I am going to create only 1GB snapshot volume using following commands.

    # lvcreate -L 1GB -s -n tecmint_datas_snap /dev/vg_tecmint_extra/tecmint_datas        

OR

    # lvcreate --size 1G --snapshot --name tecmint_datas_snap /dev/vg_tecmint_extra/tecmint_datas

Both the above commands does the same thing:

- **-s** – Creates Snapshot
- **-n** – Name for snapshot

![Create LVM Snapshot](http://www.tecmint.com/wp-content/uploads/2014/08/Create-LVM-Snapshot.jpg)
Create LVM Snapshot

Here, is the explanation of each point highlighted above.

- Size of snapshot Iam creating here.
- Creates snapshot.
- Creates name for the snapshot.
- New snapshots name.
- Volume which we are going to create a snapshot.

If you want to remove a snapshot, you can use ‘**lvremove**‘ command.

# lvremove /dev/vg_tecmint_extra/tecmint_datas_snap

![Remove LVM Snapshot](http://www.tecmint.com/wp-content/uploads/2014/08/Remove-LVM-Snapshot.jpg)
Remove LVM Snapshot

Now, list the newly created snapshot using following command.

    # lvs

![Verify LVM Snapshot](http://www.tecmint.com/wp-content/uploads/2014/08/Verify-LVM-Snapshot.jpg)
Verify LVM Snapshot

You see above, a snapshot was created successfully. I have marked with an arrow where snapshots origin from where its created, Its **tecmint_datas**. Yes, because we have created a snapshot for **tecmint_datas l-volume**.

![Check LVM Snapshot Space](http://www.tecmint.com/wp-content/uploads/2014/08/Check-LVM-Snapshot-Space.jpg)
Check LVM Snapshot Space

Let’s add some new files into **tecmint_datas**. Now volume has some data’s around 650MB and our snapshot size is 1GB. So there is enough space to backup our changes in snap volume. Here we can see, what is the status of our snapshot using below command.

    # lvs

![Check Snapshot Status](http://www.tecmint.com/wp-content/uploads/2014/08/Check-Snapshot-Status.jpg)
Check Snapshot Status

You see, **51%** of snapshot volume was used now, no issue for more modification in your files. For more detailed information use command.

    # lvdisplay vg_tecmint_extra/tecmint_data_snap

![View Snapshot Information](http://www.tecmint.com/wp-content/uploads/2014/08/Snapshot-Information.jpg)
View Snapshot Information

Again, here is the clear explanation of each point highlighted in the above picture.

- Name of Snapshot Logical Volume.
- Volume group name currently under use.
- Snapshot volume in read and write mode, we can even mount the volume and use it.
- Time when the snapshot was created. This is very important because snapshot will look for every changes after this time.
- This snapshot belongs to tecmint_datas logical volume.
- Logical volume is online and available to use.
- Size of Source volume which we took snapshot.
- Cow-table size = copy on Write, that means whatever changes was made to the tecmint_data volume will be written to this snapshot.
- Currently snapshot size used, our tecmint_datas was 10G but our snapshot size was 1GB that means our file is around 650 MB. So what its now in 51% if the file grow to 2GB size in tecmint_datas size will increase more than snapshot allocated size, sure we will be in trouble with snapshot. That means we need to extend the size of logical volume (snapshot volume).
- Gives the size of chunk for snapshot.

Now, let’s copy more than 1GB of files in **tecmint_datas**, let’s see what will happen. If you do, you will get error message saying ‘**Input/output error**‘, it means out of space in snapshot.

![Add Files to Snapshot](http://www.tecmint.com/wp-content/uploads/2014/08/Add-Files-to-Snapshot.jpg)
Add Files to Snapshot

If the logical volume become full it will get dropped automatically and we can’t use it any more, even if we extend the size of snapshot volume. It is the best idea to have the same size of Source while creating a snapshot, **tecmint_datas** size was 10G, if I create a snapshot size of 10GB it will never over flow like above because it has enough space to take snap of your volume.

#### Step 2: Extend Snapshot in LVM ####

If we need to extend the snapshot size before overflow we can do it using.

    # lvextend -L +1G /dev/vg_tecmint_extra/tecmint_data_snap

Now there was totally 2GB size for snapshot.

![Extend LVM Snapshot](http://www.tecmint.com/wp-content/uploads/2014/08/Extend-LVM-Snapshot.jpg)
Extend LVM Snapshot

Next, verify the new size and COW table using following command.

    # lvdisplay /dev/vg_tecmint_extra/tecmint_data_snap

To know the size of snap volume and usage **%**.

    # lvs

![Check Size of Snapshot](http://www.tecmint.com/wp-content/uploads/2014/08/Check-Size-of-Snapshot.jpg)
Check Size of Snapshot

But if, you have snapshot volume with the same size of Source volume we don’t need to worry about these issues.

#### Step 3: Restoring Snapshot or Merging ####

To restore the snapshot, we need to un-mount the file system first.

    # unmount /mnt/tecmint_datas/

![Un-mount File System](http://www.tecmint.com/wp-content/uploads/2014/08/Unmount-File-System.jpg)
Un-mount File System

Just check for the mount point whether its unmounted or not.

    # df -h

![Check File System Mount Points](http://www.tecmint.com/wp-content/uploads/2014/08/Check-Mount-Points.jpg)
Check File System Mount Points

Here our mount has been unmounted, so we can continue to restore the snapshot. To restore the snap using command **lvconvert**.

    # lvconvert --merge /dev/vg_tecmint_extra/tecmint_data_snap

![Restore LVM Snapshot](http://www.tecmint.com/wp-content/uploads/2014/08/Restore-Snapshot.jpg)
Restore LVM Snapshot

After the merge is completed, snapshot volume will be removed automatically. Now we can see the space of our partition using **df** command.

    # df -Th

![Check Size of Snapshot](http://www.tecmint.com/wp-content/uploads/2014/08/Check-Snapshot-Space.jpg)

After the snapshot volume removed automatically. You can see the size of logical volume.

    # lvs

![Check Size of Logical Volume](http://www.tecmint.com/wp-content/uploads/2014/08/Check-Size-of-LV.jpg)
Check Size of Logical Volume

**Important**: To Extend the Snapshots automatically, we can do it using some modification in conf file. For manual we can extend using lvextend.

Open the lvm configuration file using your choice of editor.

    # vim /etc/lvm/lvm.conf

Search for word autoextend. By Default the value will be similar to below.

![LVM Configuration](http://www.tecmint.com/wp-content/uploads/2014/08/LVM-Configuration.jpg)
LVM Configuration

Change the **100** to **75** here, if so auto extend threshold is **75** and auto extend percent is 20, it will expand the size more by **20 Percent**

If the snapshot volume reach **75%** it will automatically expand the size of snap volume by **20%** more. Thus,we can expand automatically. Save and exit the file using **wq!**.

This will save snapshot from overflow drop. This will also help you to save more time. LVM is the only Partition method in which we can expand more and have many features as thin Provisioning, Striping, Virtual volume and more Using thin-pool, let us see them in the next topic.

--------------------------------------------------------------------------------

via: http://www.tecmint.com/take-snapshot-of-logical-volume-and-restore-in-lvm/

作者：[Babin Lonston][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/babinlonston/
[1]:http://www.tecmint.com/create-lvm-storage-in-linux/
[2]:http://www.tecmint.com/extend-and-reduce-lvms-in-linux/

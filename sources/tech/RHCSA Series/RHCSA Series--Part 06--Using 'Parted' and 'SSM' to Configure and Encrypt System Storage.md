RHCSA Series: Using ‘Parted’ and ‘SSM’ to Configure and Encrypt System Storage – Part 6
================================================================================
In this article we will discuss how to set up and configure local system storage in Red Hat Enterprise Linux 7 using classic tools and introducing the System Storage Manager (also known as SSM), which greatly simplifies this task.

![Configure and Encrypt System Storage](http://www.tecmint.com/wp-content/uploads/2015/04/Configure-and-Encrypt-System-Storage.png)

RHCSA: Configure and Encrypt System Storage – Part 6

Please note that we will present this topic in this article but will continue its description and usage on the next one (Part 7) due to vastness of the subject.

### Creating and Modifying Partitions in RHEL 7 ###

In RHEL 7, parted is the default utility to work with partitions, and will allow you to:

- Display the current partition table
- Manipulate (increase or decrease the size of) existing partitions
- Create partitions using free space or additional physical storage devices

It is recommended that before attempting the creation of a new partition or the modification of an existing one, you should ensure that none of the partitions on the device are in use (`umount /dev/partition`), and if you’re using part of the device as swap you need to disable it (`swapoff -v /dev/partition`) during the process.

The easiest way to do this is to boot RHEL in rescue mode using an installation media such as a RHEL 7 installation DVD or USB (Troubleshooting → Rescue a Red Hat Enterprise Linux system) and Select Skip when you’re prompted to choose an option to mount the existing Linux installation, and you will be presented with a command prompt where you can start typing the same commands as shown as follows during the creation of an ordinary partition in a physical device that is not being used.

![RHEL 7 Rescue Mode](http://www.tecmint.com/wp-content/uploads/2015/04/RHEL-7-Rescue-Mode.png)

RHEL 7 Rescue Mode

To start parted, simply type.

    # parted /dev/sdb

Where `/dev/sdb` is the device where you will create the new partition; next, type print to display the current drive’s partition table:

![Creat New Partition](http://www.tecmint.com/wp-content/uploads/2015/04/Create-New-Partition.png)

Creat New Partition

As you can see, in this example we are using a virtual drive of 5 GB. We will now proceed to create a 4 GB primary partition and then format it with the xfs filesystem, which is the default in RHEL 7.

You can choose from a variety of file systems. You will need to manually create the partition with mkpart and then format it with mkfs.fstype as usual because mkpart does not support many modern filesystems out-of-the-box.

In the following example we will set a label for the device and then create a primary partition `(p)` on `/dev/sdb`, which starts at the 0% percentage of the device and ends at 4000 MB (4 GB):

![Set Partition Name in Linux](http://www.tecmint.com/wp-content/uploads/2015/04/Label-Partition.png)

Label Partition Name

Next, we will format the partition as xfs and print the partition table again to verify that changes were applied:

    # mkfs.xfs /dev/sdb1
    # parted /dev/sdb print

![Format Partition in Linux](http://www.tecmint.com/wp-content/uploads/2015/04/Format-Partition-in-Linux.png)

Format Partition as XFS Filesystem

For older filesystems, you could use the resize command in parted to resize a partition. Unfortunately, this only applies to ext2, fat16, fat32, hfs, linux-swap, and reiserfs (if libreiserfs is installed).

Thus, the only way to resize a partition is by deleting it and creating it again (so make sure you have a good backup of your data!). No wonder the default partitioning scheme in RHEL 7 is based on LVM.

To remove a partition with parted:

    # parted /dev/sdb print
    # parted /dev/sdb rm 1

![Remove Partition in Linux](http://www.tecmint.com/wp-content/uploads/2015/04/Remove-Partition-in-Linux.png)

Remove or Delete Partition

### The Logical Volume Manager (LVM) ###

Once a disk has been partitioned, it can be difficult or risky to change the partition sizes. For that reason, if we plan on resizing the partitions on our system, we should consider the possibility of using LVM instead of the classic partitioning system, where several physical devices can form a volume group that will host a defined number of logical volumes, which can be expanded or reduced without any hassle.

In simple terms, you may find the following diagram useful to remember the basic architecture of LVM.

![Basic Architecture of LVM](http://www.tecmint.com/wp-content/uploads/2015/04/LVM-Diagram.png)

Basic Architecture of LVM

#### Creating Physical Volumes, Volume Group and Logical Volumes ####

Follow these steps in order to set up LVM using classic volume management tools. Since you can expand this topic reading the [LVM series on this site][1], I will only outline the basic steps to set up LVM, and then compare them to implementing the same functionality with SSM.

**Note**: That we will use the whole disks `/dev/sdb` and `/dev/sdc` as PVs (Physical Volumes) but it’s entirely up to you if you want to do the same.

**1. Create partitions `/dev/sdb1` and `/dev/sdc1` using 100% of the available disk space in /dev/sdb and /dev/sdc:**

    # parted /dev/sdb print
    # parted /dev/sdc print

![Create New Partitions](http://www.tecmint.com/wp-content/uploads/2015/04/Create-New-Partitions.png)

Create New Partitions

**2. Create 2 physical volumes on top of /dev/sdb1 and /dev/sdc1, respectively.**

    # pvcreate /dev/sdb1
    # pvcreate /dev/sdc1

![Create Two Physical Volumes](http://www.tecmint.com/wp-content/uploads/2015/04/Create-Physical-Volumes.png)

Create Two Physical Volumes

Remember that you can use pvdisplay /dev/sd{b,c}1 to show information about the newly created PVs.

**3. Create a VG on top of the PV that you created in the previous step:**

    # vgcreate tecmint_vg /dev/sd{b,c}1

![Create Volume Group in Linux](http://www.tecmint.com/wp-content/uploads/2015/04/Create-Volume-Group.png)

Create Volume Group

Remember that you can use vgdisplay tecmint_vg to show information about the newly created VG.

**4. Create three logical volumes on top of VG tecmint_vg, as follows:**

    # lvcreate -L 3G -n vol01_docs tecmint_vg		[vol01_docs → 3 GB]
    # lvcreate -L 1G -n vol02_logs tecmint_vg		[vol02_logs → 1 GB]
    # lvcreate -l 100%FREE -n vol03_homes tecmint_vg	[vol03_homes → 6 GB]	

![Create Logical Volumes in LVM](http://www.tecmint.com/wp-content/uploads/2015/04/Create-Logical-Volumes.png)

Create Logical Volumes

Remember that you can use lvdisplay tecmint_vg to show information about the newly created LVs on top of VG tecmint_vg.

**5. Format each of the logical volumes with xfs (do NOT use xfs if you’re planning on shrinking volumes later!):**

    # mkfs.xfs /dev/tecmint_vg/vol01_docs
    # mkfs.xfs /dev/tecmint_vg/vol02_logs
    # mkfs.xfs /dev/tecmint_vg/vol03_homes

**6. Finally, mount them:**

    # mount /dev/tecmint_vg/vol01_docs /mnt/docs
    # mount /dev/tecmint_vg/vol02_logs /mnt/logs
    # mount /dev/tecmint_vg/vol03_homes /mnt/homes

#### Removing Logical Volumes, Volume Group and Physical Volumes ####

**7. Now we will reverse the LVM implementation and remove the LVs, the VG, and the PVs:**

    # lvremove /dev/tecmint_vg/vol01_docs
    # lvremove /dev/tecmint_vg/vol02_logs
    # lvremove /dev/tecmint_vg/vol03_homes
    # vgremove /dev/tecmint_vg
    # pvremove /dev/sd{b,c}1

**8. Now let’s install SSM and we will see how to perform the above in ONLY 1 STEP!**

    # yum update && yum install system-storage-manager

We will use the same names and sizes as before:

    # ssm create -s 3G -n vol01_docs -p tecmint_vg --fstype ext4 /mnt/docs /dev/sd{b,c}1
    # ssm create -s 1G -n vol02_logs -p tecmint_vg --fstype ext4 /mnt/logs /dev/sd{b,c}1
    # ssm create -n vol03_homes -p tecmint_vg --fstype ext4 /mnt/homes /dev/sd{b,c}1

Yes! SSM will let you:

- initialize block devices as physical volumes
- create a volume group
- create logical volumes
- format LVs, and
- mount them using only one command

**9. We can now display the information about PVs, VGs, or LVs, respectively, as follows:**

    # ssm list dev
    # ssm list pool
    # ssm list vol

![Check Information of PVs, VGs, or LVs](http://www.tecmint.com/wp-content/uploads/2015/04/Display-LVM-Information.png)

Check Information of PVs, VGs, or LVs

**10. As we already know, one of the distinguishing features of LVM is the possibility to resize (expand or decrease) logical volumes without downtime.**

Say we are running out of space in vol02_logs but have plenty of space in vol03_homes. We will resize vol03_homes to 4 GB and expand vol02_logs to use the remaining space:

    # ssm resize -s 4G /dev/tecmint_vg/vol03_homes

Run ssm list pool again and take note of the free space in tecmint_vg:

![Check Volume Size](http://www.tecmint.com/wp-content/uploads/2015/04/Check-LVM-Free-Space.png)

Check Volume Size

Then do:

    # ssm resize -s+1.99 /dev/tecmint_vg/vol02_logs

**Note**: that the plus sign after the -s flag indicates that the specified value should be added to the present value.

**11. Removing logical volumes and volume groups is much easier with ssm as well. A simple,**

    # ssm remove tecmint_vg

will return a prompt asking you to confirm the deletion of the VG and the LVs it contains:

![Remove Logical Volume and Volume Group](http://www.tecmint.com/wp-content/uploads/2015/04/Remove-LV-VG.png)

Remove Logical Volume and Volume Group

### Managing Encrypted Volumes ###

SSM also provides system administrators with the capability of managing encryption for new or existing volumes. You will need the cryptsetup package installed first:

    # yum update && yum install cryptsetup

Then issue the following command to create an encrypted volume. You will be prompted to enter a passphrase to maximize security:

    # ssm create -s 3G -n vol01_docs -p tecmint_vg --fstype ext4 --encrypt luks /mnt/docs /dev/sd{b,c}1
    # ssm create -s 1G -n vol02_logs -p tecmint_vg --fstype ext4 --encrypt luks /mnt/logs /dev/sd{b,c}1
    # ssm create -n vol03_homes -p tecmint_vg --fstype ext4 --encrypt luks /mnt/homes /dev/sd{b,c}1

Our next task consists in adding the corresponding entries in /etc/fstab in order for those logical volumes to be available on boot. Rather than using the device identifier (/dev/something).

We will use each LV’s UUID (so that our devices will still be uniquely identified should we add other logical volumes or devices), which we can find out with the blkid utility:

    # blkid -o value UUID /dev/tecmint_vg/vol01_docs
    # blkid -o value UUID /dev/tecmint_vg/vol02_logs
    # blkid -o value UUID /dev/tecmint_vg/vol03_homes

In our case:

![Find Logical Volume UUID](http://www.tecmint.com/wp-content/uploads/2015/04/Logical-Volume-UUID.png)

Find Logical Volume UUID

Next, create the /etc/crypttab file with the following contents (change the UUIDs for the ones that apply to your setup):

    docs UUID=ba77d113-f849-4ddf-8048-13860399fca8 none
    logs UUID=58f89c5a-f694-4443-83d6-2e83878e30e4 none
    homes UUID=92245af6-3f38-4e07-8dd8-787f4690d7ac none

And insert the following entries in /etc/fstab. Note that device_name (/dev/mapper/device_name) is the mapper identifier that appears in the first column of /etc/crypttab.

    # Logical volume vol01_docs:
    /dev/mapper/docs    	/mnt/docs   	ext4	defaults    	0   	2
    # Logical volume vol02_logs
    /dev/mapper/logs    	/mnt/logs   	ext4	defaults    	0   	2
    # Logical volume vol03_homes
    /dev/mapper/homes    	/mnt/homes   	ext4	defaults    	0   	2

Now reboot (systemctl reboot) and you will be prompted to enter the passphrase for each LV. Afterwards you can confirm that the mount operation was successful by checking the corresponding mount points:

![Verify Logical Volume Mount Points](http://www.tecmint.com/wp-content/uploads/2015/04/Verify-LV-Mount-Points.png)

Verify Logical Volume Mount Points

### Conclusion ###

In this tutorial we have started to explore how to set up and configure system storage using classic volume management tools and SSM, which also integrates filesystem and encryption capabilities in one package. This makes SSM an invaluable tool for any sysadmin.

Let us know if you have any questions or comments – feel free to use the form below to get in touch with us!

--------------------------------------------------------------------------------

via: http://www.tecmint.com/rhcsa-exam-create-format-resize-delete-and-encrypt-partitions-in-linux/

作者：[Gabriel Cánepa][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/gacanepa/
[1]:http://www.tecmint.com/create-lvm-storage-in-linux/
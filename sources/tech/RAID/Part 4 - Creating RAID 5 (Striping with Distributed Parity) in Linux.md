struggling 翻译中
Creating RAID 5 (Striping with Distributed Parity) in Linux – Part 4
================================================================================
In RAID 5, data strips across multiple drives with distributed parity. The striping with distributed parity means it will split the parity information and stripe data over the multiple disks, which will have good data redundancy.

![Setup Raid 5 in CentOS](http://www.tecmint.com/wp-content/uploads/2014/11/setup-raid-5-in-linux.jpg)

Setup Raid 5 in Linux

For RAID Level it should have at least three hard drives or more. RAID 5 are being used in the large scale production environment where it’s cost effective and provide performance as well as redundancy.

#### What is Parity? ####

Parity is a simplest common method of detecting errors in data storage. Parity stores information in each disks, Let’s say we have 4 disks, in 4 disks one disk space will be split to all disks to store the parity information’s. If any one of the disks fails still we can get the data by rebuilding from parity information after replacing the failed disk.

#### Pros and Cons of RAID 5 ####

- Gives better performance
- Support Redundancy and Fault tolerance.
- Support hot spare options.
- Will loose a single disk capacity for using parity information.
- No data loss if a single disk fails. We can rebuilt from parity after replacing the failed disk.
- Suits for transaction oriented environment as the reading will be faster.
- Due to parity overhead, writing will be slow.
- Rebuild takes long time.

#### Requirements ####

Minimum 3 hard drives are required to create Raid 5, but you can add more disks, only if you’ve a dedicated hardware raid controller with multi ports. Here, we are using software RAID and ‘mdadm‘ package to create raid.

mdadm is a package which allow us to configure and manage RAID devices in Linux. By default there is no configuration file is available for RAID, we must save the configuration file after creating and configuring RAID setup in separate file called mdadm.conf.

Before moving further, I suggest you to go through the following articles for understanding the basics of RAID in Linux.

- [Basic Concepts of RAID in Linux – Part 1][1]
- [Creating RAID 0 (Stripe) in Linux – Part 2][2]
- [Setting up RAID 1 (Mirroring) in Linux – Part 3][3]

#### My Server Setup ####

    Operating System :	CentOS 6.5 Final
    IP Address	 :	192.168.0.227
    Hostname	 :	rd5.tecmintlocal.com
    Disk 1 [20GB]	 :	/dev/sdb
    Disk 2 [20GB]	 :	/dev/sdc
    Disk 3 [20GB]	 :	/dev/sdd

This article is a Part 4 of a 9-tutorial RAID series, here we are going to setup a software RAID 5 with distributed parity in Linux systems or servers using three 20GB disks named /dev/sdb, /dev/sdc and /dev/sdd.

### Step 1: Installing mdadm and Verify Drives ###

1. As we said earlier, that we’re using CentOS 6.5 Final release for this raid setup, but same steps can be followed for RAID setup in any Linux based distributions.

    # lsb_release -a
    # ifconfig | grep inet

![Setup Raid 5 in CentOS](http://www.tecmint.com/wp-content/uploads/2014/11/CentOS-6.5-Summary.png)

CentOS 6.5 Summary

2. If you’re following our raid series, we assume that you’ve already installed ‘mdadm‘ package, if not, use the following command according to your Linux distribution to install the package.

    # yum install mdadm		[on RedHat systems]
    # apt-get install mdadm 	[on Debain systems]

3. After the ‘mdadm‘ package installation, let’s list the three 20GB disks which we have added in our system using ‘fdisk‘ command.

    # fdisk -l | grep sd

![Install mdadm Tool in CentOS](http://www.tecmint.com/wp-content/uploads/2014/11/Install-mdadm-Tool.png)

Install mdadm Tool

4. Now it’s time to examine the attached three drives for any existing RAID blocks on these drives using following command.

    # mdadm -E /dev/sd[b-d]
    # mdadm --examine /dev/sdb /dev/sdc /dev/sdd

![Examine Drives For Raid](http://www.tecmint.com/wp-content/uploads/2014/11/Examine-Drives-For-Raid.png)

Examine Drives For Raid

**Note**: From the above image illustrated that there is no any super-block detected yet. So, there is no RAID defined in all three drives. Let us start to create one now.

### Step 2: Partitioning the Disks for RAID ###

5. First and foremost, we have to partition the disks (/dev/sdb, /dev/sdc and /dev/sdd) before adding to a RAID, So let us define the partition using ‘fdisk’ command, before forwarding to the next steps.

    # fdisk /dev/sdb
    # fdisk /dev/sdc
    # fdisk /dev/sdd

#### Create /dev/sdb Partition ####

Please follow the below instructions to create partition on /dev/sdb drive.

- Press ‘n‘ for creating new partition.
- Then choose ‘P‘ for Primary partition. Here we are choosing Primary because there is no partitions defined yet.
- Then choose ‘1‘ to be the first partition. By default it will be 1.
- Here for cylinder size we don’t have to choose the specified size because we need the whole partition for RAID so just Press Enter two times to choose the default full size.
- Next press ‘p‘ to print the created partition.
- Change the Type, If we need to know the every available types Press ‘L‘.
- Here, we are selecting ‘fd‘ as my type is RAID.
- Next press ‘p‘ to print the defined partition.
- Then again use ‘p‘ to print the changes what we have made.
- Use ‘w‘ to write the changes.

![Create sdb Partition](http://www.tecmint.com/wp-content/uploads/2014/11/Create-sdb-Partition1.png)

Create sdb Partition

**Note**: We have to follow the steps mentioned above to create partitions for sdc & sdd drives too.

#### Create /dev/sdc Partition ####

Now partition the sdc and sdd drives by following the steps given in the screenshot or you can follow above steps.

    # fdisk /dev/sdc

![Create sdc Partition](http://www.tecmint.com/wp-content/uploads/2014/11/Create-sdc-Partition1.png)

Create sdc Partition

#### Create /dev/sdd Partition ####

    # fdisk /dev/sdd

![Create sdd Partition](http://www.tecmint.com/wp-content/uploads/2014/11/Create-sdd-Partition1.png)

Create sdd Partition

6. After creating partitions, check for changes in all three drives sdb, sdc, & sdd.

    # mdadm --examine /dev/sdb /dev/sdc /dev/sdd
    
    or
    
    # mdadm -E /dev/sd[b-c]

![Check Partition Changes](http://www.tecmint.com/wp-content/uploads/2014/11/Check-Changes-on-Partitions.png)

Check Partition Changes

**Note**: In the above pic. depict the type is fd i.e. for RAID.

7. Now Check for the RAID blocks in newly created partitions. If no super-blocks detected, than we can move forward to create a new RAID 5 setup on these drives.

![Check Raid on Partition](http://www.tecmint.com/wp-content/uploads/2014/11/Check-Raid-on-Partitions.png)

Check Raid on Partition

### Step 3: Creating md device md0 ###

8. Now create a Raid device ‘md0‘ (i.e. /dev/md0) and include raid level on all newly created partitions (sdb1, sdc1 and sdd1) using below command.

    # mdadm --create /dev/md0 --level=5 --raid-devices=3 /dev/sdb1 /dev/sdc1 /dev/sdd1
    
    or
    
    # mdadm -C /dev/md0 -l=5 -n=3 /dev/sd[b-d]1

9. After creating raid device, check and verify the RAID, devices included and RAID Level from the mdstat output.

    # cat /proc/mdstat

![Verify Raid Device](http://www.tecmint.com/wp-content/uploads/2014/11/Verify-Raid-Device.png)

Verify Raid Device

If you want to monitor the current building process, you can use ‘watch‘ command, just pass through the ‘cat /proc/mdstat‘ with watch command which will refresh screen every 1 second.

    # watch -n1 cat /proc/mdstat

![Monitor Raid Process](http://www.tecmint.com/wp-content/uploads/2014/11/Monitor-Raid-Process.png)

Monitor Raid 5 Process

![Raid 5 Process Summary](http://www.tecmint.com/wp-content/uploads/2014/11/Raid-Process-Summary.png)

Raid 5 Process Summary

10. After creation of raid, Verify the raid devices using the following command.

    # mdadm -E /dev/sd[b-d]1

![Verify Raid Level](http://www.tecmint.com/wp-content/uploads/2014/11/Verify-Raid-Level.png)

Verify Raid Level

**Note**: The Output of the above command will be little long as it prints the information of all three drives.

11. Next, verify the RAID array to assume that the devices which we’ve included in the RAID level are running and started to re-sync.

    # mdadm --detail /dev/md0

![Verify Raid Array](http://www.tecmint.com/wp-content/uploads/2014/11/Verify-Raid-Array.png)

Verify Raid Array

### Step 4: Creating file system for md0 ###

12. Create a file system for ‘md0‘ device using ext4 before mounting.

    # mkfs.ext4 /dev/md0

![Create md0 Filesystem](http://www.tecmint.com/wp-content/uploads/2014/11/Create-md0-Filesystem.png)

Create md0 Filesystem

13. Now create a directory under ‘/mnt‘ then mount the created filesystem under /mnt/raid5 and check the files under mount point, you will see lost+found directory.

    # mkdir /mnt/raid5
    # mount /dev/md0 /mnt/raid5/
    # ls -l /mnt/raid5/

14. Create few files under mount point /mnt/raid5 and append some text in any one of the file to verify the content.

    # touch /mnt/raid5/raid5_tecmint_{1..5}
    # ls -l /mnt/raid5/
    # echo "tecmint raid setups" > /mnt/raid5/raid5_tecmint_1
    # cat /mnt/raid5/raid5_tecmint_1
    # cat /proc/mdstat

![Mount Raid 5 Device](http://www.tecmint.com/wp-content/uploads/2014/11/Mount-Raid-Device.png)

Mount Raid Device

15. We need to add entry in fstab, else will not display our mount point after system reboot. To add an entry, we should edit the fstab file and append the following line as shown below. The mount point will differ according to your environment.

    # vim /etc/fstab
    
    /dev/md0                /mnt/raid5              ext4    defaults        0 0

![Raid 5 Automount](http://www.tecmint.com/wp-content/uploads/2014/11/Raid-Device-Automount.png)

Raid 5 Automount

16. Next, run ‘mount -av‘ command to check whether any errors in fstab entry.

    # mount -av

![Check Fstab Errors](http://www.tecmint.com/wp-content/uploads/2014/11/Check-Fstab-Errors.png)

Check Fstab Errors

### Step 5: Save Raid 5 Configuration ###

17. As mentioned earlier in requirement section, by default RAID don’t have a config file. We have to save it manually. If this step is not followed RAID device will not be in md0, it will be in some other random number.

So, we must have to save the configuration before system reboot. If the configuration is saved it will be loaded to the kernel during the system reboot and RAID will also gets loaded.

    # mdadm --detail --scan --verbose >> /etc/mdadm.conf

![Save Raid 5 Configuration](http://www.tecmint.com/wp-content/uploads/2014/11/Save-Raid-5-Configuration.png)

Save Raid 5 Configuration

Note: Saving the configuration will keep the RAID level stable in md0 device.

### Step 6: Adding Spare Drives ###

18. What the use of adding a spare drive? its very useful if we have a spare drive, if any one of the disk fails in our array, this spare drive will get active and rebuild the process and sync the data from other disk, so we can see a redundancy here.

For more instructions on how to add spare drive and check Raid 5 fault tolerance, read #Step 6 and #Step 7 in the following article.

- [Add Spare Drive to Raid 5 Setup][4]

### Conclusion ###

Here, in this article, we have seen how to setup a RAID 5 using three number of disks. Later in my upcoming articles, we will see how to troubleshoot when a disk fails in RAID 5 and how to replace for recovery.

--------------------------------------------------------------------------------

via: http://www.tecmint.com/create-raid-5-in-linux/

作者：[Babin Lonston][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/babinlonston/
[1]:http://www.tecmint.com/understanding-raid-setup-in-linux/
[2]:http://www.tecmint.com/create-raid0-in-linux/
[3]:http://www.tecmint.com/create-raid1-in-linux/
[4]:http://www.tecmint.com/create-raid-6-in-linux/
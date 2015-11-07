Part 6 - LFCS: Assembling Partitions as RAID Devices – Creating & Managing System Backups
================================================================================
Recently, the Linux Foundation launched the LFCS (Linux Foundation Certified Sysadmin) certification, a shiny chance for system administrators everywhere to demonstrate, through a performance-based exam, that they are capable of performing overall operational support on Linux systems: system support, first-level diagnosing and monitoring, plus issue escalation, when required, to other support teams.

![Linux Foundation Certified Sysadmin – Part 6](http://www.tecmint.com/wp-content/uploads/2014/10/lfcs-Part-6.png)

Linux Foundation Certified Sysadmin – Part 6

The following video provides an introduction to The Linux Foundation Certification Program.

注：youtube 视频
<iframe width="720" height="405" frameborder="0" allowfullscreen="allowfullscreen" src="//www.youtube.com/embed/Y29qZ71Kicg"></iframe>

This post is Part 6 of a 10-tutorial series, here in this part, we will explain How to Assemble Partitions as RAID Devices – Creating & Managing System Backups, that are required for the LFCS certification exam.

### Understanding RAID ###

The technology known as Redundant Array of Independent Disks (RAID) is a storage solution that combines multiple hard disks into a single logical unit to provide redundancy of data and/or improve performance in read / write operations to disk.

However, the actual fault-tolerance and disk I/O performance lean on how the hard disks are set up to form the disk array. Depending on the available devices and the fault tolerance / performance needs, different RAID levels are defined. You can refer to the RAID series here in Tecmint.com for a more detailed explanation on each RAID level.

- RAID Guide: [What is RAID, Concepts of RAID and RAID Levels Explained][1]

Our tool of choice for creating, assembling, managing, and monitoring our software RAIDs is called mdadm (short for multiple disks admin).

    ---------------- Debian and Derivatives ----------------
    # aptitude update && aptitude install mdadm

----------

    ---------------- Red Hat and CentOS based Systems ----------------
    # yum update && yum install mdadm

----------

    ---------------- On openSUSE ----------------
    # zypper refresh && zypper install mdadm #

#### Assembling Partitions as RAID Devices ####

The process of assembling existing partitions as RAID devices consists of the following steps.

**1. Create the array using mdadm**

If one of the partitions has been formatted previously, or has been a part of another RAID array previously, you will be prompted to confirm the creation of the new array. Assuming you have taken the necessary precautions to avoid losing important data that may have resided in them, you can safely type y and press Enter.

    # mdadm --create --verbose /dev/md0 --level=stripe --raid-devices=2 /dev/sdb1 /dev/sdc1

![Creating RAID Array](http://www.tecmint.com/wp-content/uploads/2014/10/Creating-RAID-Array.png)

Creating RAID Array

**2. Check the array creation status**

After creating RAID array, you an check the status of the array using the following commands.

    # cat /proc/mdstat
    or
    # mdadm --detail /dev/md0	[More detailed summary]

![Check RAID Array Status](http://www.tecmint.com/wp-content/uploads/2014/10/Check-RAID-Array-Status.png)

Check RAID Array Status

**3. Format the RAID Device**

Format the device with a filesystem as per your needs / requirements, as explained in [Part 4][2] of this series.

**4. Monitor RAID Array Service**

Instruct the monitoring service to “keep an eye” on the array. Add the output of mdadm –detail –scan to /etc/mdadm/mdadm.conf (Debian and derivatives) or /etc/mdadm.conf (CentOS / openSUSE), like so.

    # mdadm --detail --scan

![Monitor RAID Array](http://www.tecmint.com/wp-content/uploads/2014/10/Monitor-RAID-Array.png)

Monitor RAID Array

    # mdadm --assemble --scan 	[Assemble the array]

To ensure the service starts on system boot, run the following commands as root.

**Debian and Derivatives**

Debian and derivatives, though it should start running on boot by default.

    # update-rc.d mdadm defaults

Edit the /etc/default/mdadm file and add the following line.

    AUTOSTART=true

**On CentOS and openSUSE (systemd-based)**

    # systemctl start mdmonitor
    # systemctl enable mdmonitor

**On CentOS and openSUSE (SysVinit-based)**

    # service mdmonitor start
    # chkconfig mdmonitor on

**5. Check RAID Disk Failure**

In RAID levels that support redundancy, replace failed drives when needed. When a device in the disk array becomes faulty, a rebuild automatically starts only if there was a spare device added when we first created the array.

![Check RAID Faulty Disk](http://www.tecmint.com/wp-content/uploads/2014/10/Check-RAID-Faulty-Disk.png)

Check RAID Faulty Disk

Otherwise, we need to manually attach an extra physical drive to our system and run.

    # mdadm /dev/md0 --add /dev/sdX1

Where /dev/md0 is the array that experienced the issue and /dev/sdX1 is the new device.

**6. Disassemble a working array**

You may have to do this if you need to create a new array using the devices – (Optional Step).

    # mdadm --stop /dev/md0 				#  Stop the array
    # mdadm --remove /dev/md0 			# Remove the RAID device
    # mdadm --zero-superblock /dev/sdX1 	# Overwrite the existing md superblock with zeroes

**7. Set up mail alerts**

You can configure a valid email address or system account to send alerts to (make sure you have this line in mdadm.conf). – (Optional Step)

    MAILADDR root

In this case, all alerts that the RAID monitoring daemon collects will be sent to the local root account’s mail box. One of such alerts looks like the following.

**Note**: This event is related to the example in STEP 5, where a device was marked as faulty and the spare device was automatically built into the array by mdadm. Thus, we “ran out” of healthy spare devices and we got the alert.

![RAID Monitoring Alerts](http://www.tecmint.com/wp-content/uploads/2014/10/RAID-Monitoring-Alerts.png)

RAID Monitoring Alerts

#### Understanding RAID Levels ####

**RAID 0**

The total array size is n times the size of the smallest partition, where n is the number of independent disks in the array (you will need at least two drives). Run the following command to assemble a RAID 0 array using partitions /dev/sdb1 and /dev/sdc1.

    # mdadm --create --verbose /dev/md0 --level=stripe --raid-devices=2 /dev/sdb1 /dev/sdc1

Common uses: Setups that support real-time applications where performance is more important than fault-tolerance.

**RAID 1 (aka Mirroring)**

The total array size equals the size of the smallest partition (you will need at least two drives). Run the following command to assemble a RAID 1 array using partitions /dev/sdb1 and /dev/sdc1.

    # mdadm --create --verbose /dev/md0 --level=1 --raid-devices=2 /dev/sdb1 /dev/sdc1

Common uses: Installation of the operating system or important subdirectories, such as /home.

**RAID 5 (aka drives with Parity)**

The total array size will be (n – 1) times the size of the smallest partition. The “lost” space in (n-1) is used for parity (redundancy) calculation (you will need at least three drives).

Note that you can specify a spare device (/dev/sde1 in this case) to replace a faulty part when an issue occurs. Run the following command to assemble a RAID 5 array using partitions /dev/sdb1, /dev/sdc1, /dev/sdd1, and /dev/sde1 as spare.

    # mdadm --create --verbose /dev/md0 --level=5 --raid-devices=3 /dev/sdb1 /dev/sdc1 /dev/sdd1 --spare-devices=1 /dev/sde1

Common uses: Web and file servers.

**RAID 6 (aka drives with double Parity**

The total array size will be (n*s)-2*s, where n is the number of independent disks in the array and s is the size of the smallest disk. Note that you can specify a spare device (/dev/sdf1 in this case) to replace a faulty part when an issue occurs.

Run the following command to assemble a RAID 6 array using partitions /dev/sdb1, /dev/sdc1, /dev/sdd1, /dev/sde1, and /dev/sdf1 as spare.

    # mdadm --create --verbose /dev/md0 --level=6 --raid-devices=4 /dev/sdb1 /dev/sdc1 /dev/sdd1 /dev/sde --spare-devices=1 /dev/sdf1

Common uses: File and backup servers with large capacity and high availability requirements.

**RAID 1+0 (aka stripe of mirrors)**

The total array size is computed based on the formulas for RAID 0 and RAID 1, since RAID 1+0 is a combination of both. First, calculate the size of each mirror and then the size of the stripe.

Note that you can specify a spare device (/dev/sdf1 in this case) to replace a faulty part when an issue occurs. Run the following command to assemble a RAID 1+0 array using partitions /dev/sdb1, /dev/sdc1, /dev/sdd1, /dev/sde1, and /dev/sdf1 as spare.

    # mdadm --create --verbose /dev/md0 --level=10 --raid-devices=4 /dev/sd[b-e]1 --spare-devices=1 /dev/sdf1

Common uses: Database and application servers that require fast I/O operations.

#### Creating and Managing System Backups ####

It never hurts to remember that RAID with all its bounties IS NOT A REPLACEMENT FOR BACKUPS! Write it 1000 times on the chalkboard if you need to, but make sure you keep that idea in mind at all times. Before we begin, we must note that there is no one-size-fits-all solution for system backups, but here are some things that you do need to take into account while planning a backup strategy.

- What do you use your system for? (Desktop or server? If the latter case applies, what are the most critical services – whose configuration would be a real pain to lose?)
- How often do you need to take backups of your system?
- What is the data (e.g. files / directories / database dumps) that you want to backup? You may also want to consider if you really need to backup huge files (such as audio or video files).
- Where (meaning physical place and media) will those backups be stored?

**Backing Up Your Data**

Method 1: Backup entire drives with dd command. You can either back up an entire hard disk or a partition by creating an exact image at any point in time. Note that this works best when the device is offline, meaning it’s not mounted and there are no processes accessing it for I/O operations.

The downside of this backup approach is that the image will have the same size as the disk or partition, even when the actual data occupies a small percentage of it. For example, if you want to image a partition of 20 GB that is only 10% full, the image file will still be 20 GB in size. In other words, it’s not only the actual data that gets backed up, but the entire partition itself. You may consider using this method if you need exact backups of your devices.

**Creating an image file out of an existing device**

    # dd if=/dev/sda of=/system_images/sda.img
    OR
    --------------------- Alternatively, you can compress the image file ---------------------
    # dd if=/dev/sda | gzip -c > /system_images/sda.img.gz

**Restoring the backup from the image file**

    # dd if=/system_images/sda.img of=/dev/sda
    OR

    --------------------- Depending on your choice while creating the image  ---------------------
    gzip -dc /system_images/sda.img.gz | dd of=/dev/sda

Method 2: Backup certain files / directories with tar command – already covered in [Part 3][3] of this series. You may consider using this method if you need to keep copies of specific files and directories (configuration files, users’ home directories, and so on).

Method 3: Synchronize files with rsync command. Rsync is a versatile remote (and local) file-copying tool. If you need to backup and synchronize your files to/from network drives, rsync is a go.

Whether you’re synchronizing two local directories or local < — > remote directories mounted on the local filesystem, the basic syntax is the same.
Synchronizing two local directories or local < — > remote directories mounted on the local filesystem

    # rsync -av source_directory destination directory

Where, -a recurse into subdirectories (if they exist), preserve symbolic links, timestamps, permissions, and original owner / group and -v verbose.

![rsync Synchronizing Files](http://www.tecmint.com/wp-content/uploads/2014/10/rsync-synchronizing-Files.png)

rsync Synchronizing Files

In addition, if you want to increase the security of the data transfer over the wire, you can use ssh over rsync.

**Synchronizing local → remote directories over ssh**

    # rsync -avzhe ssh backups root@remote_host:/remote_directory/

This example will synchronize the backups directory on the local host with the contents of /root/remote_directory on the remote host.

Where the -h option shows file sizes in human-readable format, and the -e flag is used to indicate a ssh connection.

![rsync Synchronize Remote Files](http://www.tecmint.com/wp-content/uploads/2014/10/rsync-synchronize-Remote-Files.png)

rsync Synchronize Remote Files

Synchronizing remote → local directories over ssh.

In this case, switch the source and destination directories from the previous example.

    # rsync -avzhe ssh root@remote_host:/remote_directory/ backups

Please note that these are only 3 examples (most frequent cases you’re likely to run into) of the use of rsync. For more examples and usages of rsync commands can be found at the following article.

- Read Also: [10 rsync Commands to Sync Files in Linux][4]

### Summary ###

As a sysadmin, you need to ensure that your systems perform as good as possible. If you’re well prepared, and if the integrity of your data is well supported by a storage technology such as RAID and regular system backups, you’ll be safe.

If you have questions, comments, or further ideas on how this article can be improved, feel free to speak out below. In addition, please consider sharing this series through your social network profiles.

--------------------------------------------------------------------------------

via: http://www.tecmint.com/creating-and-managing-raid-backups-in-linux/

作者：[Gabriel Cánepa][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/gacanepa/
[1]:http://www.tecmint.com/understanding-raid-setup-in-linux/
[2]:http://www.tecmint.com/create-partitions-and-filesystems-in-linux/
[3]:http://www.tecmint.com/compress-files-and-finding-files-in-linux/
[4]:http://www.tecmint.com/rsync-local-remote-file-synchronization-commands/
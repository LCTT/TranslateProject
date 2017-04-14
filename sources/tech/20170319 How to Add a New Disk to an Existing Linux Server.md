How to Add a New Disk to an Existing Linux Server
============================================================


As system administrators, we would have got requirements wherein we need to configure raw hard disks to the existing servers as part of upgrading server capacity or sometimes disk replacement in case of disk failure.

In this article, I will take you through the steps by which we can add the new raw hard disk to an existing Linux server such as RHEL/CentOS or Debian/Ubuntu.

**Suggested Read:** [How to Add a New Disk Larger Than 2TB to An Existing Linux][1]

Important: Please note that the purpose of this article is to show only how to create a new partition and doesn’t include partition extension or any other switches.

I am using [fdisk utility][2] to do this configuration.

I have added a hard disk of 20GB capacity to be mounted as a `/data` partition.

fdisk is a command line utility to view and manage hard disks and partitions on Linux systems.

```
# fdisk -l
```

This will list the current partitions and configurations.

[
 ![Find Linux Partition Details](http://www.tecmint.com/wp-content/uploads/2017/03/Find-Linux-Partition-Details.png) 
][3]

Find Linux Partition Details

After attaching the hard disk of 20GB capacity, the `fdisk -l` will give the below output.

```
# fdisk -l
```
[
 ![Find New Partition Details](http://www.tecmint.com/wp-content/uploads/2017/03/Find-New-Partition-Details.png) 
][4]

Find New Partition Details

New disk added is shown as `/dev/xvdc`. If we are adding physical disk it will show as `/dev/sda` based of the disk type. Here I used a virtual disk.

To partition a particular hard disk, for example /dev/xvdc.

```
# fdisk /dev/xvdc
```

Commonly used fdisk commands.

*   `n` – Create partition
*   `p` – print partition table
*   `d` – delete a partition
*   `q` – exit without saving the changes
*   `w` – write the changes and exit.

Here since we are creating a partition use `n` option.

[
 ![Create New Partition in Linux](http://www.tecmint.com/wp-content/uploads/2017/03/Create-New-Partition-in-Linux.png) 
][5]

Create New Partition in Linux

Create either primary/extended partitions. By default we can have upto 4 primary partitions.

[
 ![Create Primary Partition](http://www.tecmint.com/wp-content/uploads/2017/03/Create-Primary-Partition.png) 
][6]

Create Primary Partition

Give the partition number as desired. Recommended to go for the default value `1`.

[
 ![Assign a Partition Number](http://www.tecmint.com/wp-content/uploads/2017/03/Assign-a-Partition-Number.png) 
][7]

Assign a Partition Number

Give the value of the first sector. If it is a new disk, always select default value. If you are creating a second partition on the same disk, we need to add `1` to the last sector of the previous partition.

[
 ![Assign Sector to Partition](http://www.tecmint.com/wp-content/uploads/2017/03/Assign-Sector-to-Partition.png) 
][8]

Assign Sector to Partition

Give the value of the last sector or the partition size. Always recommended to give the size of the partition. Always prefix `+` to avoid value out of range error.

[
 ![Assign Partition Size](http://www.tecmint.com/wp-content/uploads/2017/03/Assign-Partition-Size.png) 
][9]

Assign Partition Size

Save the changes and exit.

[
 ![Save Partition Changes](http://www.tecmint.com/wp-content/uploads/2017/03/Save-Partition-Changes.png) 
][10]

Save Partition Changes

Now format the disk with mkfs command.

```
# mkfs.ext4 /dev/xvdc1
```
[
 ![Format New Partition](http://www.tecmint.com/wp-content/uploads/2017/03/Format-New-Partition.png) 
][11]

Format New Partition

Once formatting has been completed, now mount the partition as shown below.

```
# mount /dev/xvdc1 /data
```

Make an entry in /etc/fstab file for permanent mount at boot time.

```
/dev/xvdc1	/data	ext4	defaults     0   0
```

##### Conclusion

Now you know how to partition a raw disk using [fdisk command][12] and mount the same.

We need to be extra cautious while working with the partitions especially when you are editing the configured disks. Please share your feedback and suggestions.

--------------------------------------------------------------------------------

作者简介：

I work on various platforms including IBM-AIX, Solaris, HP-UX, and storage technologies ONTAP and OneFS and have hands on experience on Oracle Database.

-----------------------

via: http://www.tecmint.com/add-new-disk-to-an-existing-linux/

作者：[Lakshmi Dhandapani][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/lakshmi/
[1]:http://www.tecmint.com/add-disk-larger-than-2tb-to-an-existing-linux/
[2]:http://www.tecmint.com/fdisk-commands-to-manage-linux-disk-partitions/
[3]:http://www.tecmint.com/wp-content/uploads/2017/03/Find-Linux-Partition-Details.png
[4]:http://www.tecmint.com/wp-content/uploads/2017/03/Find-New-Partition-Details.png
[5]:http://www.tecmint.com/wp-content/uploads/2017/03/Create-New-Partition-in-Linux.png
[6]:http://www.tecmint.com/wp-content/uploads/2017/03/Create-Primary-Partition.png
[7]:http://www.tecmint.com/wp-content/uploads/2017/03/Assign-a-Partition-Number.png
[8]:http://www.tecmint.com/wp-content/uploads/2017/03/Assign-Sector-to-Partition.png
[9]:http://www.tecmint.com/wp-content/uploads/2017/03/Assign-Partition-Size.png
[10]:http://www.tecmint.com/wp-content/uploads/2017/03/Save-Partition-Changes.png
[11]:http://www.tecmint.com/wp-content/uploads/2017/03/Format-New-Partition.png
[12]:http://www.tecmint.com/fdisk-commands-to-manage-linux-disk-partitions/
[13]:http://www.tecmint.com/author/lakshmi/
[14]:http://www.tecmint.com/10-useful-free-linux-ebooks-for-newbies-and-administrators/
[15]:http://www.tecmint.com/free-linux-shell-scripting-books/

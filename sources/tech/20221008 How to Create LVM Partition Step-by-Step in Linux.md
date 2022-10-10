[#]: subject: "How to Create LVM Partition Step-by-Step in Linux"
[#]: via: "https://www.linuxtechi.com/how-to-create-lvm-partition-in-linux/"
[#]: author: "James Kiarie https://www.linuxtechi.com/author/james/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

How to Create LVM Partition Step-by-Step in Linux
======
In this guide, we will cover how to create lvm partition step-by-step in Linux.

LVM stands for Logical Volume Management, it is the recommended way to manage disk or storage on Linux systems specially for servers. One of the main advantages of LVM partition is that we can extend its size online without any downtime. LVM partition can also be reduced but it is not recommended.

For the demo purpose, I have attached 15GB disk to my Ubuntu 22.04 system, we will create LVM partition on this disk from the command line.

##### Prerequisites

* Raw disk attached to Linux system
* Local User with Sudo rights
* Pre-Installed  lvm2 package

Without further ado, let’s deep dive into the steps.

### Step 1) Identify new attached raw disk

Login to your system, open the terminal and run following dmesg command,

```
$ sudo dmesg | grep -i sd
```

In the output, look for new disk attached of size 15GB,

![dmesg-command-new-attached-disk-linux][1]

Alternate way to identify new attached raw disk is via fdisk command,

```
$ sudo fdisk -l | grep -i /dev/sd
```

Output,

![fdisk-command-output-new-disk][2]

From output above, it is confirmed that new attached disk is ‘/dev/sdb’

### Step 2) Create PV (Physical Volume)

Before start creating pv on disk /dev/sdb, make sure lvm2 package is installed. In case it is not installed, then run following command,

```
$ sudo apt install lvm2     // On Ubuntu / Debian
$ sudo dnf install lvm2    // on RHEL / CentOS
```

Run following pvcreate command to create pv on disk /dev/sdb,

```
$ sudo pvcreate /dev/sdb
  Physical volume "/dev/sdb" successfully created.
$
```

To verify pv status run,

```
$ sudo pvs /dev/sdb
Or
$ sudo pvdisplay /dev/sdb
```

![pvdisplay-command-output-linux][3]

### Step 3) Create VG (Volume Group)

To create a volume group, we will use vgcreate command. Creating VG means adding pv to the volume group.

Syntax :

```
$ sudo vgcreare <vg_name>  <pv>
```

In our case, command would be,

```
$ sudo vgcreate volgrp01 /dev/sdb
  Volume group "volgrp01" successfully created
$
```

Run following commands to verify the status of vg (volgrp01)

```
$ sudo vgs volgrp01
Or
$ sudo vgdisplay volgrp01
```

Output of above commands,

![vgs-command-output-linux][4]

Above output confirms that volume group (volgrp01) of size 15 GiB is created successful and size of one physical extend (PE) is 4 MB. PE size can be changed while creating vg.

### Step 4) Create LV (Logical Volume)


Lvcreate command is used to create LV from the VG. Syntax of lvcreate command would look like below,

```
$ sudo lvcreate -L <Size-of-LV> -n <LV-Name>   <VG-Name>
```

In our case, following command will be used to create lv of size 14 GB

```
$ sudo lvcreate -L 14G -n lv01 volgrp01
  Logical volume "lv01" created.
$
```

Validate the status of lv, run

```
$ sudo lvs /dev/volgrp01/lv01
or
$ sudo lvdisplay /dev/volgrp01/lv01
```

Output,

![lvs-command-output-linux][5]

Output above shows that LV (lv01) has been created successfully of size 14 GiB.

### Step 5) Format LVM Partition

Use mkfs command to format the lvm partition. In our case lvm partition is /dev/volgrp01/lv01

Note:  We can format the partition either ext4 or xfs, so choose the file system type according to your setup and requirement.

Run following command to format LVM partition as ext4 file system.

```
$ sudo mkfs.ext4 /dev/volgrp01/lv01
```

![mkfs-ext4-filesystem-lvm][6]

Execute beneath command to format the lvm partition with xfs file system,

```
$ sudo mkfs.xfs /dev/volgrp01/lv01
```

To use above formatted partition, we must mount it on some folder. So, let’s create a folder /mnt/data

```
$ sudo mkdir /mnt/data
```

Now run mount command to mount it on /mnt/data folder,

```
$ sudo mount /dev/volgrp01/lv01 /mnt/data/
$ df -Th /mnt/data/
Filesystem                Type  Size  Used Avail Use% Mounted on
/dev/mapper/volgrp01-lv01 ext4   14G   24K   13G   1% /mnt/data
$
```

Try to create some dummy file, run following commands,

```
$ cd /mnt/data/
$ echo "testing lvm partition" | sudo tee  dummy.txt
$ cat dummy.txt
testing lvm partition
$
$ sudo rm -f  dummy.txt
```

Perfect, above commands output confirm that we can access lvm partition.

To mount above lvm partition permanently, add its entries in fstab file using following echo command,

```
$ echo '/dev/volgrp01/lv01  /mnt/data  ext4  defaults 0 0' | sudo  tee -a /etc/fstab
$ sudo mount -a
```

That’s all from this guide, thanks for the reading. Kindly do post your queries and feedback in below comments section.

--------------------------------------------------------------------------------

via: https://www.linuxtechi.com/how-to-create-lvm-partition-in-linux/

作者：[James Kiarie][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.linuxtechi.com/author/james/
[b]: https://github.com/lkxed
[1]: https://www.linuxtechi.com/wp-content/uploads/2022/10/dmesg-command-new-attached-disk-linux.png
[2]: https://www.linuxtechi.com/wp-content/uploads/2022/10/fdisk-command-output-new-disk.png
[3]: https://www.linuxtechi.com/wp-content/uploads/2022/10/pvdisplay-command-output-linux.png
[4]: https://www.linuxtechi.com/wp-content/uploads/2022/10/vgs-command-output-linux.png
[5]: https://www.linuxtechi.com/wp-content/uploads/2022/10/lvs-command-output-linux.png
[6]: https://www.linuxtechi.com/wp-content/uploads/2022/10/mkfs-ext4-filesystem-lvm.png

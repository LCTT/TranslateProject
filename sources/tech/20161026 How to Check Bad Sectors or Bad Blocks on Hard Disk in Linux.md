alim0x translating

How to Check Bad Sectors or Bad Blocks on Hard Disk in Linux
===

Let us start by defining a bad sector/block, it’s a section on a disk drive or flash memory that can not be read from or written to anymore, as a result of a fixed [physical damage on the disk][7] surface or failed flash memory transistors.

As bad sectors continue to accumulate, they can undesirably or destructively affect your disk drive or flash memory capacity or even lead to a possible hardware failure.

It is also important to note that the presence of bad blocks should alert you to start thinking of getting a new disk drive or simply mark the bad blocks as unusable.

Therefore, in this article, we will go through the necessary steps that can enable you determine the presence or absence of bad sectors on your Linux disk drive or flash memory using certain [disk scanning utilities][6].

That said, below are the methods:

### Check Bad Sectors in Linux Disks Using badblocks Tool

A badblocks program enables users to scan a device for bad sectors or blocks. The device can be a hard disk or an external disk drive, represented by a file such as /dev/sdc.

Firstly, use the [fdisk command][5] with superuser privileges to display information about all your disk drives or flash memory plus their partitions:

```
$ sudo fdisk -l

```

[![List Linux Filesystem Partitions](http://www.tecmint.com/wp-content/uploads/2016/10/List-Linux-Filesystem-Partitions.png)][4]

List Linux Filesystem Partitions

Then scan your Linux disk drive to check for bad sectors/blocks by typing:

```
$ sudo badblocks -v /dev/sda10 > badsectors.txt

```

[![Scan Hard Disk Bad Sectors in Linux](http://www.tecmint.com/wp-content/uploads/2016/10/Scan-Hard-Disk-Bad-Sectors-in-Linux.png)][3]

Scan Hard Disk Bad Sectors in Linux

In the command above, badblocks is scanning device /dev/sda10 (remember to specify your actual device) with the `-v` enabling it to display details of the operation. In addition, the results of the operation are stored in the file badsectors.txt by means of output redirection.

In case you discover any bad sectors on your disk drive, unmount the disk and instruct the operating system not to write to the reported sectors as follows.

You will need to employ e2fsck (for ext2/ext3/ext4 file systems) or fsck command with the badsectors.txt file and the device file as in the command below.

The `-l` option tells the command to add the block numbers listed in the file specified by filename (badsectors.txt) to the list of bad blocks.

```
------------ Specifically for ext2/ext3/ext4 file-systems ------------ 
$ sudo e2fsck -l badsectors.txt /dev/sda10

OR

------------ For other file-systems ------------ 
$ sudo fsck -l badsectors.txt /dev/sda10

```

### Scan Bad Sectors on Linux Disk Using Smartmontools

This method is more reliable and efficient for modern disks (ATA/SATA and SCSI/SAS hard drives and solid-state drives) which ship in with a S.M.A.R.T (Self-Monitoring, Analysis and Reporting Technology) system that helps detect, report and possibly log their health status, so that you can figure out any impending hardware failures.

You can install smartmontools by running the command below:

```
------------ On Debian/Ubuntu based systems ------------ 
$ sudo apt-get install smartmontools

------------ On RHEL/CentOS based systems ------------ 
$ sudo yum install smartmontools

```

Once the installation is complete, use smartctl which controls the S.M.A.R.T system integrated into a disk. You can look through its man page or help page as follows:

```
$ man smartctl
$ smartctl -h

```

Now execute the smartctrl command and name your specific device as an argument as in the following command, the flag `-H` or `--health` is included to display the SMART overall health self-assessment test result.

```
$ sudo smartctl -H /dev/sda10

```

[![Check Linux Hard Disk Health](http://www.tecmint.com/wp-content/uploads/2016/10/Check-Linux-Hard-Disk-Health.png)][2]

Check Linux Hard Disk Health

The result above indicates that your hard disk is healthy, and may not experience hardware failures any soon.

For an overview of disk information, use the `-a` or `--all` option to print out all SMART information concerning a disk and `-x` or `--xall` which displays all SMART and non-SMART information about a disk.

In this tutorial, we covered a very important topic concerning [disk drive health diagnostics][1], you can reach us via the feedback section below to share your thoughts or ask any questions and remember to always stay connected to Tecmint.

--------------------------------------------------------------------------------

via: http://www.tecmint.com/check-linux-hard-disk-bad-sectors-bad-blocks/


作者：[Aaron Kili][a]

译者：[译者ID](https://github.com/译者ID)

校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: http://www.tecmint.com/author/aaronkili/
[1]:http://www.tecmint.com/defragment-linux-system-partitions-and-directories/
[2]:http://www.tecmint.com/wp-content/uploads/2016/10/Check-Linux-Hard-Disk-Health.png
[3]:http://www.tecmint.com/wp-content/uploads/2016/10/Scan-Hard-Disk-Bad-Sectors-in-Linux.png
[4]:http://www.tecmint.com/wp-content/uploads/2016/10/List-Linux-Filesystem-Partitions.png
[5]:http://www.tecmint.com/fdisk-commands-to-manage-linux-disk-partitions/
[6]:http://www.tecmint.com/ncdu-a-ncurses-based-disk-usage-analyzer-and-tracker/
[7]:http://www.tecmint.com/defragment-linux-system-partitions-and-directories/

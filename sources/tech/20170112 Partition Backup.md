Partition Backup
============

Many times you may have data on a partition, especially on a Universal Serial Bus (USB) drive. It may be necessary at times to make a copy of a drive or a single partition on it. Raspberry Pi users definitely have this need for the bootable SD Cards. Owners of other small form computers can also find this useful. Sometimes it is best to make a backup quickly if a device seems to be failing.

To perform the examples in this article you will need a utility called 'dcfldd'.

**The dcfldd Utility**

The utility is an enhancement of the 'dd' utility from the 'coreutils' package. The 'dcfldd' was made by Nicholas Harbour while he worked at the Department of Defense Computer Forensics Lab (DCFL). The name is then based off where he worked – 'dcfldd'.

For systems still using the CoreUtils 8.23 or less there isn't an option to easily see the progress of the copy being performed. Sometimes it seems as if nothing is happening and you are tempted to stop the copy.

**NOTE:** If you have the ‘dd’ version 8.24 or later then you need not use ‘dcfldd’ and simply replace any ‘dcfldd’ with ‘dd’. All other parameters will work.

On a Debian system simply use your Package Manager and search for 'dcfldd'. You can also open a Terminal and use the command:

_sudo apt-get install dcfldd_

For a Red Hat system try the following:

_cd /tmp
wget dl.fedoraproject.org/pub/epel/6/i386/dcfldd-1.3.4.1-4.el6.i686.rpm
sudo yum install dcfldd-1.3.4.1-4.el6.i686.rpm
dcfldd --version_

**NOTE:** The above installs the 32-bit version. For the 64-bit version use the following commands:

_cd /tmp
wget dl.fedoraproject.org/pub/epel/6/x86_64/dcfldd-1.3.4.1-4.el6.x86_64.rpm
sudo yum install dcfldd-1.3.4.1-4.el6.x86_64.rpm
dcfldd --version_

The last statement of each set of commands will list the version of the 'dcfldd' and show you that the command file has been downloaded.

**NOTE: **Be sure you execute the ‘dd’ or ‘dcfldd’ as root.

Now that you have the command installed you can continue on with using it to backup and restore partitions.

**Backup Partitions**

When backing up a drive it is possible to back up the whole drive or a single partition. If the drive has multiple partitions then each can be backed up separately.

Before we get too far in performing a backup let's look at the difference of a drive and partition. Let's assume we have an SD Card which is formatted as one large drive. The SD Card contains only one partition. If the space is split to allow the SD Card to be seen as two drives, then it has two partitions. If a program like GParted were opened for an SD Card, as shown in Figure 1, you can see it has two partitions.

**FIGURE 1**

The drive is /dev/sdc and contains both partitions /dev/sdc1 and /dev/sdc2.

Let's take, for instance, an SD Card from a Raspberry Pi. The SD Card is 8 GB in size and has two partitions (as shown in Figure 1). The first partition contains BerryBoot which is a boot loader. The second partition contains Kali. There is no space available to install a second Operating System (OS). A second SD Card is to be used which is 16 GB in size, but to copy it to the second SD Card the first one must be backed up.

To back up the first SD Card we will back up the drive which is /dev/sdc. The command to perform the backup is as follows:

_dcfldd if=/dev/sdc of=/tmp/SD-Card-Backup.img_

The backup is made of the Input File (if) and the output file (of) is set to the folder '/tmp' and a file called 'SD-Card-Backup.img'.

The 'dd' and 'dcfldd' both read and write the files one byte at a time. Technically with the above command it reads and writes a default of 512 bytes at a time. Keep in mind that the copy is an exact copy – bit for bit and byte for byte.

The default of 512 bytes can be changed with the parameter for Block Size - 'bs='. For instance, to read/write 1 megabyte at a time the parameter 'bs=1M'. There can be some discrepancy in the abbreviations used as follows:

*   b – 512 bytes
*   KB – 1000 bytes
*   K – 1024 bytes
*   MB – 1000x1000 bytes
*   M – 1024x1024 bytes
*   GB – 1000x1000x1000 bytes
*   G – 1024x1024x1024 bytes

You can specify the read blocks and write blocks separately. To specify the read amount use ‘ibs=’. To specify the write amount then use ‘obs=’.

I performed a test to backup a 120 MB partition using three different Block Sizes. The first was the default of 512 bytes and it took 7 seconds. The second was a Block Size of 1024 K and took 2 seconds. The third had a Block Size of 2048 K and took 3 seconds. The times will vary depending on the system, various other hardware implementations, but in general larger block sizes than the defaults can be a little faster.

Once you have a backup made you will need to know how to restore the data to a drive.

**Restore Partitions**

Now that we have a backup at some point we can assume the data may become corrupted or need to be restored for some reason.

The command is the same as the backup except that the source and target are reversed. In the above example the command would be changed to:

_dcfldd of=/dev/sdc if=/tmp/SD-Card-Backup.img_

Here, the image file is being used as the input file (if) and the drive (sdc) is used as the output file (of).

**NOTE:** Do remember that the output device will be overwritten and all data on it will be lost. It is usually best to remove all partitions from the SD Card with GParted before restoring data.

If you have a use for multiple SD Cards, such as having multiple Raspberry Pi boards, you can write to multiple cards at once. To do this you need to know the card’s ID on the system. For example, let’s say we want to copy the image ‘BerryBoot.img’ to two SD Cards. The SD Cards are at /dev/sdc and /dev/sdd. The command will be set to read/write in 1 MB Blocks while showing the progress. The command would be:

_dcfldd if=BerryBoot.img bs=1M status=progress | tee >(dcfldd of=/dev/sdc) | dcfldd of=/dev/sdd_

In this command the first dcfldd uses the input file and sets the Block Size to 1 MB. The status is set to show the progress. The input is then piped (|) to the command ‘tee’. The ‘tee’ is used to split the input to multiple places. The first output is to the command ‘(dcfldd of=/dev/sdc)’. The command is in parenthesis and will be performed as a command. The last pipe (|) is needed, otherwise the ‘tee’ command will send the information to the ‘stdout’ (screen) as well. So the final output is to the command ‘_dcfldd of=/dev/sdd’_. If you had a third card, or even more, simply add another redirector and command such as ‘_>(dcfldd of=/dev/sde_’.

**NOTE:** Do remember that the final command must be after a pipe (|).

Data being written must be verified at times to be sure the data is correct.

**Verify Data**

Once an image is made or a backup restored you can verify the data being written. To verify data you will use a different program called ‘_diff_’.

To use ‘diff’ you will need to designate the location of the image file and the physical media where it was copied from or written to on the system. The ‘_diff_’ command can be used after the backup was made or after the image was restored.

The command has two parameters. The first is the physical media and the second is the image file name.

From the example of ‘_dcfldd of=/dev/sdc if=/tmp/SD-Card-Backup.img’_ the ‘_diff_’ command would be:

_diff /dev/sdc /tmp/SD-Card-Backup.img_

If any differences are found between the image and the physical device you will be alerted. If no messages are given then the data has been verified as identical.

Making sure the data is identical is key to verifying the integrity of the backup or restore. One main problem to watch for when performing a Backup is image size.

**Splitting The Image**

Let’s assume you want to back up a 16GB SD Card. The image will then be approximately the same size. What if you can only back it up to a FAT32 partition? The maximum file size limit is 4 GB on FAT32.

What must be done is that the file will have to be split into 4 GB pieces. The splitting of the image file can be done while it is being written by piping (|) the data to the ‘_split_’ command.

The backup is performed in the same way, but the command will include the pipe and split command. The example backup command is ‘_dcfldd if=/dev/sdc of=/tmp/SD-Card-Backup.img_’ and the new command for splitting the file is as follows:

_dcfldd if=/dev/sdc | split -b 4000MB - /tmp/SD-Card-Backup.img_

**NOTE:** The size suffix means the same as for the ‘_dd_’ and ‘_dcfldd_’ command. The dash by itself in the ‘_split_’ command is used to fill the input file which is being piped from the the ‘_dcfldd_’ command.

The files will be saved as ‘_SD-Card-Backup.imgaa_’ and ‘_SD-Card-Backup.imgab_’ and so on. If you are worried about the file size being too close to the 4 GB limit, then try 3500MB.

Restoring the files back to the drive is simple. You use the command ‘_ca_’ to join them and then write the output using ‘_dcfldd_’ as follows:

_cat /tmp/SD-Card-Backup.img* | dcfldd of=/dev/sdc_

You can include any desired parameters to the command for the ‘_dcfldd_’ portion.

I hope you understand and can perform any needed backup and restoration of data as you need for SD Cards and the like.

--------------------------------------------------------------------------------

via: https://www.linuxforum.com/threads/partition-backup.3638/

作者：[Jarret][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linuxforum.com/members/jarret.268/

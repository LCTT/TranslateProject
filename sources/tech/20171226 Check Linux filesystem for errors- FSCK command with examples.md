translating by lujun9972
Check Linux filesystem for errors: FSCK command with examples
======
FSCK is a very important Linux/Unix utility, it is used to check & repair the errors in the file system. It is similar to 'chkdsk' utility in Windows operating systems. It is available for Linux, MacOS, FreeBSD operating systems.

FSCK stands for File System Consistency Check & most of the times, it runs at boot time but can also be started manually by super user, if need arises.

It can be used with 3 modes of operation,

 **1-** Check for errors  & let the user decide what should be done with each error,

 **2-** Check for errors  & make repairs automatically, or,

 **3-** Check for errors  & display the error but does not perform any repairs.

 **(Recommended Read:[Learn to use TCPDUMP command with examples][1])**

### Syntax for using FSCK

We can use the FSCK command manually with the following syntax,

 **$ fsck options drives**

The options that can be used with fsck command are,

 **-p ** Automatic repair (no questions)

 **-n** Make no changes to the filesystem

 **-y ** Assume  "yes" to all questions

 **-c** Check for bad blocks and add them to the badblock list

 **-f ** Force checking even if filesystem is marked clean

 **-v ** Be verbose

 **-b ** superblock Use alternative superblock

 **-B** blocksize Force blocksize when looking for superblock

 **-j ** external_journal Set location of the external journal

 **-l ** bad_blocks_file Add to badblocks list

 **-L ** bad_blocks_file Set badblocks list

We can use any of the following options, depending on the operation we need to perform. Let's discuss some of the options of fsck command with examples.

### Fsck command with examples

 **Note:-** Before we discuss any examples, please read this. We should not be using FSCK on mounted drives, as there will be high chances that fsck on mounted drive wll damage the drive permanently. So before performing fsck, we must un-mount the drive with the following command,

 **$ umount drivename**

For example,

 **$ umount /dev/sdb1**

You can check the partition number with the following command,

 **$ fdisk -l**

Also while running the fsck, we might get some error codes. Below mentioned is the list of error codes that we might get along with their meanings,

 **0** - No errors
**1** - Filesystem errors corrected
**2** - System should be rebooted
**4** - Filesystem errors left uncorrected
**8** - Operational error
**16** - Usage or syntax error
**32** - Fsck canceled by user request
**128** - Shared-library error

Now let's discuss usage of fdisk command with examples,

### Perform an error check on a single partition

To perform a file check on a single partition, run the following command from the terminal,

 **$ umount /dev/sdb1**

 **$ fsck /dev/sdb1**

### Check filesystem for errors & repair them automatically

Run the fsck command with 'a' option to perform consistency check & to repair them automatically, execute the following command. We can also use 'y' option in place of option 'a'.

 **$ fsck -a /dev/sdb1**

### Check filesystem for errors but don't repait them

In case we only need to see the error that are occurring on our file system & dont need to repair them, than we should run fsck with option 'n',

 **$ fsck -n /dev/sdb1**

### Perform an error check on all partitions

To perform a filesystem check for all partitions in single go, use fsck with 'A' option,

 **$ fsck -A**

To disable the root file system check, we will use the option 'R'

 **$ fsck -AR**

### Check only partition with mentioned filesystem

In order to run fsck on all the partitiions with mentioned filesystem type, for example 'ext4', use fsck with option 't' followed by filesystem type,

 **$ fsck -t ext4 /dev/sdb1**

or

 **$ fsck -t -A ext4**

### Perform consistency check only on unmounted drives

To make sure that the fsck is performed only on unmounted drives, we will use option 'M' while running fsck,

 **$ fsck -AM**

This was our tutorial on fsck command with examples. Please feel free to send in your questions or queries to us, using the comment box below.


--------------------------------------------------------------------------------

via: http://linuxtechlab.com/linux-filesystem-errors-fsck-command-with-examples/

作者：[Shusain][a]
译者：[lujun9972](https://github.com/lujun9972)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://linuxtechlab.com/author/shsuain/
[1]:http://linuxtechlab.com/learn-use-tcpdump-command-examples/

dbarobin translating

4 Tools to Securely Delete Files from Linux
================================================================================
Any computer user with normal level skill set knows that any data removed from computer system can be recovered later with little bit of efforts. This is a good thing in the scenario when you have accidentally deleted your critical data. But in most cases, you don't want your private data to be recovered easily. Whenever we remove anything, the operating system deletes just the index of the particular data. It means that data is still there somewhere on the disk, this method is insecure, as any smart computer hacker can use any good data recovery tool to easily recover your deleted data. Linux users utilizes the well know “**rm**” command to remove data from their operating system, but “rm” command works in the conventional fashion. Data removed using this command can be recovered by special file recovery tools.

Let’s see how we can safely and completely remove files/folders from our Linux system. The methods mentioned below remove data completely so it becomes very hard for recovery tools to find traces of the actual data and recover it.

### Secure-Delete ###

Secure-Delete is a set of tools for Linux operating system and they provide advanced techniques for permanent removal of files.  Once Secure-Delete has been installed on any Linux system, it provides following four commands:

- srm
- smem
- sfill
- sswap

Run following command in the terminal to install it in ubuntu:

    sudo apt-get install secure-delete

![secure delete](http://blog.linoxide.com/wp-content/uploads/2015/03/secure-delete.png)

Run following command to install it in RHEL, Fedora or Centos:

    sudo yum install secure-delete

“**srm**” command works similarly to “rm” command, but instead of just deleting the file, it first overwrites it multiple times with some random data and then removes the file permanently. The syntax for this command is pretty simply, just specify the file or directory to remove and it will take care of the task.

    sudo srm  /home/aun/Documents/xueo/1.png

"**sfill**" checks the specified partition/directories for space marked as free or available, and then uses its algorithm to fill it up with some random data. In this way it ensures that there are no more recoverable files/folders on the partition.

    sudo sfill /home

"**sswap**" command is used to securely wipe your swap partitions. Swap partition is used to store data for running programs. First of all find out your swap partition by running the following command:

    cat /proc/swaps

Example output of above command is show below:

    aun@eagle:~$ cat /proc/swaps
    Filename                Type        Size    Used    Priority
    /dev/sda5                               partition    2084860    71216    -1

From here, you can see that swap is set to which partition, and then securely clean it by running the following command. Replace the "/dev/sda5" part with your partition name.

    sudo sswap /dev/sda5

“**smem**” is used to clean the contents of memory, its true that RAM contents are cleaned when system is rebooted or powered off, but some residual traces of data still remain in the memory. This command provides secure memory cleaning, simly run smem command on the terminal.

    smem

### Shred ###

"shred" command destroys files/folder’s contents in a way that it is impossible to recover. It keeps overwriting the files with randomly generated data patterns so in this way it becomes very hard to recover any data from them even if hackers or thief uses high level of data recovery tools/equipments. Shred is installed by default on all Linux distributions, if you want, you can find its installation path by running following command:

    aun@eagle:~$  whereis shred

    shred: /usr/bin/shred /usr/share/man/man1/shred.1.gz

Run following command to remove file using shred utility.

    shred /home/aun/Documents/xueo/1.png

Run following command to securely remove any partition using shred ; Replace partition name with your desired partition.

    shred /dev/sda5

Shred by default overwrites file with random contents 25 times. If you want it to overwrite file more than this, simply specify the desired number with "shred -n" option.

    shred -n 100 filename

If you want to truncate and remove file after overwriting, use "shred -u" option

    shred -u filename

### dd ###

This command is originally used for Disk Cloning. It is used to copy contents of one partition or disk to another. But it is also used for securely wiping out the contents of a hard disk or partitions. Run following command to overwrite your current data with random data.You don't need to install dd command, all Linux distributions include this command already.

    sudo dd if=/dev/random of=/dev/sda

You can also overwrite the contents of hard disk or partitions by simply replacing everything with “zero”.

    sudo dd if=/dev/zero of=/dev/sda

### Wipe ###

Wipe was originally developed to securely erase files from magnetic media. This command line utility writes special patterns to the files repeatedly. It uses fsync() call and/or the O_SYNC bit to force disk access. It uses Gutmann algorithm for repeated writes. You can remove contents of single file, folder or entire hard disk with this command, but whole hard disk format using wipe command will take good amount of time. The installation and use of this utility is pretty easy.

Install wipe on ubuntu by running the following command on the terminal.

    sudo aptitude install wipe

![Wipe Linux](http://blog.linoxide.com/wp-content/uploads/2015/03/wipe.png)

Install Wipe in Redhat Linux, Centos or Fedora by running the following command:

    sudo yum install wipe

Once the installation is complete, run following command on the terminal to get complete list of its available options:

    man wipe

Remove any file or directory as:

    wipe filename

Securely remove your tmp partition by running following command:

    wipe -r /tmp

Use following command to remove contents  of complete partition (replace partition name with your desired partition).

    wipe /dev/sda1

### Conclusion ###

We hope you find this article useful, the privacy of your data is critical, its important to have such secure file removal utilities installed on your system so you may be able to remove your private data without fear of being recovered easily.  All of the above mentioned tools are pretty lightweight, they take minimum system resources to run, and does not affect performance of your system in anyway. Enjoy!

--------------------------------------------------------------------------------

via: http://linoxide.com/security/delete-files-permanatly-linux/

作者：[Aun Raza][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/arunrz/

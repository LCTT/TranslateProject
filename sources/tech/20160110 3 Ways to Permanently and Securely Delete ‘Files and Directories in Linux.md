translating---geekpi

3 Ways to Permanently and Securely Delete ‘Files and Directories’ in Linux
============================================================

In most cases the means we use to [delete a file from our computers][1] such as using `Delete` key, Trash files or `rm` command, which do not permanently and securely remove the file from the hard disk (or any storage media).

The file is simply hidden from users and it resides somewhere on the hard disk. It can be recovered by data thieves, law enforcement or other threats.

Assuming a file contains classified or secret content such as usernames and passwords of a security system, an attacker with the necessary knowledge and skills can easily [recover a deleted copy of the file][2] and access these user credentials (and you can probably guess the aftermath of such as scenario).

In this article, we will explain a number of command line tools for permanently and securely deleting files in Linux.

### 1\. Shred – Overwrite a File to Hide Content

shred overwrites a file to hide its contents, and can optionally delete it as well.

```
$ shred -zvu -n  5 passwords.list
```

In the command below, the options:

1.  `-z` – adds a final overwrite with zeros to hide shredding
2.  `-v` – enables display of operation progress
3.  `-u` – truncates and removes file after overwriting
4.  `-n` – specifies number of times to overwrite file content (the default is 3)

[
 ![shred - overwrite a file to hide its contents](http://www.tecmint.com/wp-content/uploads/2017/01/shred-command-example.png) 
][3]

shred – overwrite a file to hide its contents

You can find more usage options and information in the shred man page:

```
$ man shred
```

### 2\. Wipe – Securely Erase Files in Linux

A Linux wipe command securely erases files from magnetic memory and thereby making it impossible to [recover deleted files or directory content][4].

First, you need to install wipe tool in order to it, run the appropriate command below:

```
$ sudo apt-get install wipe   [On Debian and its derivatives]
$ sudo yum install wipe       [On RedHat based systems]
```

The following command will destroy everything under the directory private.

```
$ wipe -rfi private/*
```

where the flags used:

1.  `-r` – tells wipe to recurse into subdirectories
2.  `-f` – enables forced deletion and disable confirmation query
3.  `-i` – shows progress of deletion process

[
 ![Wipe - Securely Erase Files in Linux](http://www.tecmint.com/wp-content/uploads/2017/01/Wipe-Securely-Erase-Files.png) 
][5]

Wipe – Securely Erase Files in Linux

Note: Wipe only works reliably on magnetic memory, therefore use the other methods for solid state disks (memory).

Read through the wipe man page for additional usage options and instructions:

```
$ man wipe
```

### 3\. Secure-deletetion Toolkit for Linux

Secure-delete is a collection of secure file deletion tools, that contains srm (secure_deletion) tool, which is used to remove files securely.

First you need to install it using the relevant command below:

```
$ sudo apt-get install secure-delete   [On Debian and its derivatives]
$ sudo yum install secure-delete       [On RedHat based systems]
```

Once installed, you can use srm tool to remove files or directories securely on a Linux system as follows.

```
$ srm -vz private/*
```

where the options used:

1.  `-v` – enables verbose mode
2.  `-z` – wipes the last write with zeros instead of random data

[
 ![srm - Securely Delete Files in Linux ](http://www.tecmint.com/wp-content/uploads/2017/01/srm-securely-delete-Files-in-Linux.png) 
][6]

srm – Securely Delete Files in Linux

Read through the srm man page for more usage options and information:

```
$ man srm
```

### 4\. sfill -Secure Free Disk/Inode Space Wiper

sfill is a part of secure-deletetion toolkit, is a secure free disk and inode space wiper, it deletes files on free disk space in a secure method. sfill [checks the the free space on the specified partition][7] and fills it with random data from /dev/urandom.

The command below will execute sfill on my root partition, with the `-v` switch enabling verbose mode:

```
$ sudo sfill -v /home/aaronkilik/tmp/
```

Assuming you created a separate partition, `/home` to store normal system users home directories, you can specify a directory on that partition to apply sfill on it:

```
$ sudo sfill -v /home/username
```

The are a few limitations of sfill that you can read about in the man page, where you can also find additional usage flags and instructions:

```
$ man sfill
```

Note: These following two tools (sswap and sdmem) in the secure-deletetion toolkit are not directly relevant for the scope of this guide, however, we will explain them for knowledge purpose and future use.

### 5\. sswap – Secure Swap Wiper

It is a secure partition wiper, sswap deletes data present on your swap partition in a secure manner.

Caution: remember to unmount your swap partition before using sswap! Otherwise your system might crash!

Simply determine you swap partition (and check if paging and swapping devices/files are turned on using swapon command), next, disable paging and swapping devices/files with swapoff command (renders swap partition unusable).

Then run sswap command on the swap partition:

```
$ cat /proc/swaps 
$ swapon
$ sudo swapoff /dev/sda6
$ sudo sswap /dev/sda6    #this command may take some time to complete with 38 default passes
```
[
 ![sswap - Secure Swap Wiper](http://www.tecmint.com/wp-content/uploads/2017/01/sswap-Secure-Swap-Wiper.png) 
][8]

sswap – Secure Swap Wiper

Make an effort to read through the sswap man page for more usage options and information:

```
$ man sswap
```

### 6\. sdmem – Secure Memory Wiper

sdmem is a secure memory wiper, it is designed to remove data present in your memory (RAM) in a secure manner.

It was originally named [smem][9], but because on Debain systems there exists another package called [smem – report memory consumption on per-process and per-user basis][10], the developer decided to rename it sdmem.

```
$ sudo sdmem -f -v
```

For more usage information, read through the sdmem man page:

```
$ man sdmem 
```

**Suggested Read:** [PhotoRec – Recover Deleted or Lost Files in Linux][11]

That’s it! In this article, we reviewed a number command line tools for permanently as well as securely deleting files in Linux. As usual, offer your thoughts or suggestions about the post via the comment form below.

--------------------------------------------------------------------------------

作者简介：

![](http://1.gravatar.com/avatar/7badddbc53297b2e8ed7011cf45df0c0?s=128&d=blank&r=g)
I am Ravi Saive, creator of TecMint. A Computer Geek and Linux Guru who loves to share tricks and tips on Internet. Most Of My Servers runs on Open Source Platform called Linux. Follow Me: Twitter, Facebook and Google+

--------------------------------------------------------------------------------

via: http://www.tecmint.com/permanently-and-securely-delete-files-directories-linux/

作者：[Ravi Saive][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/admin/
[1]:http://www.tecmint.com/delete-all-files-in-directory-except-one-few-file-extensions/
[2]:http://www.tecmint.com/photorec-recover-deleted-lost-files-in-linux/
[3]:http://www.tecmint.com/wp-content/uploads/2017/01/shred-command-example.png
[4]:http://www.tecmint.com/recover-deleted-file-in-linux/
[5]:http://www.tecmint.com/wp-content/uploads/2017/01/Wipe-Securely-Erase-Files.png
[6]:http://www.tecmint.com/wp-content/uploads/2017/01/srm-securely-delete-Files-in-Linux.png
[7]:http://www.tecmint.com/find-top-large-directories-and-files-sizes-in-linux/
[8]:http://www.tecmint.com/wp-content/uploads/2017/01/sswap-Secure-Swap-Wiper.png
[9]:http://www.tecmint.com/smem-linux-memory-usage-per-process-per-user/
[10]:http://www.tecmint.com/smem-linux-memory-usage-per-process-per-user/
[11]:http://www.tecmint.com/photorec-recover-deleted-lost-files-in-linux/

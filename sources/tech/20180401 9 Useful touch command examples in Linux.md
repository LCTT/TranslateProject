9 Useful touch command examples in Linux
======
Touch command is used to create empty files and also changes the timestamps of existing files on Unix & Linux System. Changing timestamps here means updating the access and modification time of files and directories.

[![touch-command-examples-linux][1]![touch-command-examples-linux][2]][2]

Let’s have a look on the syntax and options used in touch command,

**Syntax** : # touch {options} {file}

Options used in touch command,

![touch-command-options][1]

![touch-command-options][3]

In this article we will walk through 9 useful touch command examples in Linux,

### Example:1 Create an empty file using touch

To create an empty file using touch command on Linux systems, type touch followed by the file name, example is shown below,
```
[root@linuxtechi ~]# touch devops.txt
[root@linuxtechi ~]# ls -l devops.txt
-rw-r--r--. 1 root root 0 Mar 29 22:39 devops.txt
[root@linuxtechi ~]#

```

### Example:2 Create empty files in bulk using touch

There can be some scenario where we have to create lots of empty files for some testing, this can be easily achieved using touch command,
```
[root@linuxtechi ~]# touch sysadm-{1..20}.txt

```

In the above example we have created 20 empty files with name sysadm-1.txt to sysadm-20.txt, you can change the name and numbers based on your requirements.

### Example:3 Change / Update access time of a file and directory

Let’s assume we want to change access time of a file called “ **devops.txt** “, to do this use ‘ **-a** ‘ option in touch command followed by file name, example is shown below,
```
[root@linuxtechi ~]# touch -a devops.txt
[root@linuxtechi ~]#

```

Now verify whether access time of a file has been updated or not using ‘stat’ command
```
[root@linuxtechi ~]# stat devops.txt
  File: ‘devops.txt’
  Size: 0               Blocks: 0          IO Block: 4096   regular empty file
Device: fd00h/64768d    Inode: 67324178    Links: 1
Access: (0644/-rw-r--r--)  Uid: (    0/    root)   Gid: (    0/    root)
Context: unconfined_u:object_r:admin_home_t:s0
Access: 2018-03-29 23:03:10.902000000 -0400
Modify: 2018-03-29 22:39:29.365000000 -0400
Change: 2018-03-29 23:03:10.902000000 -0400
 Birth: -
[root@linuxtechi ~]#

```

**Change access time of a directory** ,

Let’s assume we have a ‘nfsshare’ folder under /mnt, Let’s change the access time of this folder using the below command,
```
[root@linuxtechi ~]# touch -m /mnt/nfsshare/
[root@linuxtechi ~]#

[root@linuxtechi ~]# stat /mnt/nfsshare/
  File: ‘/mnt/nfsshare/’
  Size: 6               Blocks: 0          IO Block: 4096   directory
Device: fd00h/64768d    Inode: 2258        Links: 2
Access: (0755/drwxr-xr-x)  Uid: (    0/    root)   Gid: (    0/    root)
Context: unconfined_u:object_r:mnt_t:s0
Access: 2018-03-29 23:34:38.095000000 -0400
Modify: 2018-03-03 10:42:45.194000000 -0500
Change: 2018-03-29 23:34:38.095000000 -0400
 Birth: -
[root@linuxtechi ~]#

```

### Example:4 Change Access time without creating new file

There can be some situations where we want to change access time of a file if it exists and avoid creating the file. Using ‘ **-c** ‘ option in touch command, we can change access time of a file if it exists and will not a create a file, if it doesn’t exist.
```
[root@linuxtechi ~]# touch -c sysadm-20.txt
[root@linuxtechi ~]# touch -c winadm-20.txt
[root@linuxtechi ~]# ls -l winadm-20.txt
ls: cannot access winadm-20.txt: No such file or directory
[root@linuxtechi ~]#

```

### Example:5 Change Modification time of a file and directory

Using ‘ **-m** ‘ option in touch command, we can change the modification time of a file and directory,

Let’s change the modification time of a file called “devops.txt”,
```
[root@linuxtechi ~]# touch -m devops.txt
[root@linuxtechi ~]#

```

Now verify whether modification time has been changed or not using stat command,
```
[root@linuxtechi ~]# stat devops.txt
  File: ‘devops.txt’
  Size: 0               Blocks: 0          IO Block: 4096   regular empty file
Device: fd00h/64768d    Inode: 67324178    Links: 1
Access: (0644/-rw-r--r--)  Uid: (    0/    root)   Gid: (    0/    root)
Context: unconfined_u:object_r:admin_home_t:s0
Access: 2018-03-29 23:03:10.902000000 -0400
Modify: 2018-03-29 23:59:49.106000000 -0400
Change: 2018-03-29 23:59:49.106000000 -0400
 Birth: -
[root@linuxtechi ~]#

```

Similarly, we can change modification time of a directory,
```
[root@linuxtechi ~]# touch -m /mnt/nfsshare/
[root@linuxtechi ~]#

```

### Example:6 Changing access and modification time in one go

Use “ **-am** ” option in touch command to change the access and modification together or in one go, example is shown below,
```
[root@linuxtechi ~]# touch -am devops.txt
[root@linuxtechi ~]#

```

Cross verify the access and modification time using stat,
```
[root@linuxtechi ~]# stat devops.txt
  File: ‘devops.txt’
  Size: 0               Blocks: 0          IO Block: 4096   regular empty file
Device: fd00h/64768d    Inode: 67324178    Links: 1
Access: (0644/-rw-r--r--)  Uid: (    0/    root)   Gid: (    0/    root)
Context: unconfined_u:object_r:admin_home_t:s0
Access: 2018-03-30 00:06:20.145000000 -0400
Modify: 2018-03-30 00:06:20.145000000 -0400
Change: 2018-03-30 00:06:20.145000000 -0400
 Birth: -
[root@linuxtechi ~]#

```

### Example:7 Set the Access & modification time to a specific date and time

Whenever we do change access and modification time of a file & directory using touch command, then it set the current time as access & modification time of that file or directory,

Let’s assume we want to set specific date and time as access & modification time of a file, this is can be achieved using ‘-c’ & ‘-t’ option in touch command,

Date and Time can be specified in the format: {CCYY}MMDDhhmm.ss

Where:

  * CC – First two digits of a year
  * YY – Second two digits of a year
  * MM – Month of the Year (01-12)
  * DD – Day of the Month (01-31)
  * hh – Hour of the day (00-23)
  * mm – Minutes of the hour (00-59)



Let’s set the access & modification time of devops.txt file for future date and time( 2025 year, 10th Month, 19th day of month, 18th hours and 20th minute)
```
[root@linuxtechi ~]# touch -c -t 202510191820 devops.txt

```

Use stat command to view the update access & modification time,

![stat-command-output-linux][1]

![stat-command-output-linux][4]

Set the Access and Modification time based on date string, Use ‘-d’ option in touch command and then specify the date string followed by the file name, example is shown below,
```
[root@linuxtechi ~]# touch -c -d "2010-02-07 20:15:12.000000000 +0530" sysadm-29.txt
[root@linuxtechi ~]#

```

Verify the status using stat command,
```
[root@linuxtechi ~]# stat sysadm-20.txt
  File: ‘sysadm-20.txt’
  Size: 0               Blocks: 0          IO Block: 4096   regular empty file
Device: fd00h/64768d    Inode: 67324189    Links: 1
Access: (0644/-rw-r--r--)  Uid: (    0/    root)   Gid: (    0/    root)
Context: unconfined_u:object_r:admin_home_t:s0
Access: 2010-02-07 20:15:12.000000000 +0530
Modify: 2010-02-07 20:15:12.000000000 +0530
Change: 2018-03-30 10:23:31.584000000 +0530
 Birth: -
[root@linuxtechi ~]#

```

**Note:** In above commands, if we don’t specify ‘-c’ then touch command will create a new file in case it doesn’t exist on the system and will set the timestamps whatever is mentioned in the command.

### Example:8 Set the timestamps to a file using a reference file (-r)

In touch command we can use a reference file for setting the timestamps of file or directory. Let’s assume I want to set the same timestamps of file “sysadm-20.txt” on “devops.txt” file. This can be easily achieved using ‘-r’ option in touch.

**Syntax:** # touch -r {reference-file} actual-file
```
[root@linuxtechi ~]# touch -r sysadm-20.txt devops.txt
[root@linuxtechi ~]#

```

### Example:9 Change Access & Modification time on symbolic link file

By default, whenever we try to change timestamps of a symbolic link file using touch command then it will change the timestamps of original file only, In case you want to change timestamps of a symbolic link file then this can be achieved using ‘-h’ option in touch command,

**Syntax:** # touch -h {symbolic link file}
```
[root@linuxtechi opt]# ls -l /root/linuxgeeks.txt
lrwxrwxrwx. 1 root root 15 Mar 30 10:56 /root/linuxgeeks.txt -> linuxadmins.txt
[root@linuxtechi ~]# touch -t 203010191820 -h linuxgeeks.txt
[root@linuxtechi ~]# ls -l linuxgeeks.txt
lrwxrwxrwx. 1 root root 15 Oct 19  2030 linuxgeeks.txt -> linuxadmins.txt
[root@linuxtechi ~]#

```

That’s all from this tutorial, I hope these examples help you to understand touch command. Please do share your valuable feedback and comments.

--------------------------------------------------------------------------------

via: https://www.linuxtechi.com/9-useful-touch-command-examples-linux/

作者：[Pradeep Kumar][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linuxtechi.com/author/pradeep/
[1]:https://www.linuxtechi.com/wp-content/plugins/lazy-load/images/1x1.trans.gif
[2]:https://www.linuxtechi.com/wp-content/uploads/2018/03/touch-command-examples-linux.jpg
[3]:https://www.linuxtechi.com/wp-content/uploads/2018/03/touch-command-options.jpg
[4]:https://www.linuxtechi.com/wp-content/uploads/2018/03/stat-command-output-linux.jpg

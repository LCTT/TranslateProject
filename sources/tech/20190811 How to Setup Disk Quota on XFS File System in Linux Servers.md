[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to Setup Disk Quota on XFS File System in Linux Servers)
[#]: via: (https://www.linuxtechi.com/disk-quota-xfs-file-system-linux-servers/)
[#]: author: (Pradeep Kumar https://www.linuxtechi.com/author/pradeep/)

How to Setup Disk Quota on XFS File System in Linux Servers
======

Managing Disk quota on file systems is one of the most common day to day operation tasks for Linux admins, in this article we will demonstrate how to setup disk quota on XFS file system / partition on Linux Servers like **CentOS**, **RHEL**, **Ubuntu** and **Debian**. Here Disk quota means implementing limit on disk usage and file or inode usage.

[![Setup-Disk-Quota-XFS-Linux-Servers][1]][2]

Disk quota on XFS file system is implemented as followings:

  * User Quota
  * Group Quota
  * Project Quota (or Directory Quota)



To setup disk quota on XFS file system, first we must enable quota using following mount options:

  * **uquota**: Enable user quota &amp; also enforce usage limits.
  * **uqnoenforce**: Enable user quota and report usage but don’t enforce usage limits.
  * **gquota**: Enable group quota &amp; also enforce usage limits.
  * **gqnoenforce**: Enable group quota and report usage, but don’t enforce usage limits.
  * **prjquota / pquota**:  Enable project quota &amp; enforce usage limits.
  * **pqnoenforce**:  Enable project quota and report usage but don’t enforce usage limits.



In article we will implement user &amp; group disk quota on /home partition and apart from this we will also see how to setup  inode quota on /home file system and project quota on /var file system.

```
[root@linuxtechi ~]# df -Th /home /var
Filesystem           Type  Size  Used Avail Use% Mounted on
/dev/mapper/Vol-home xfs    16G   33M   16G   1% /home
/dev/mapper/Vol-var  xfs    18G   87M   18G   1% /var
[root@linuxtechi ~]#
```

### Enable User and Group Quota on /home

Unmount /home partition and then edit the /etc/fstab file,

```
[root@linuxtechi ~]# umount /home/
```

Add uquota and gquota after default keyword for /home partition in /etc/fstab file, example is shown below

```
[root@linuxtechi ~]# vi /etc/fstab
……………………………
/dev/mapper/Vol-home   /home    xfs    defaults,uquota,gquota   0 0
……………………………
```

![user-group-quota-fstab-file][1]

Now mount the /home partition using below “**mount -a**” command,

```
[root@linuxtechi ~]# mount -a
[root@linuxtechi ~]#
```

Verify whether quota is enabled on /home or not,

```
[root@linuxtechi ~]# mount | grep  /home
/dev/mapper/Vol-home on /home type xfs (rw,relatime,seclabel,attr2,inode64,usrquota,grpquota)
[root@linuxtechi ~]#
```

**Note :** While umounting /home partition if you get /home is busy then edit the fstab file, add uquota and gquota keywords after default keyword for /home partition and then reboot your system. After reboot we will see that quota is enabled on /home.

Quota on XFS file system is managed by the command line tool called “**xfs_quota**“. xfs_quota works in two modes:

  * **Basic Mode** – For this mode, simply type xfs_quota then you will enter basic mode there you can print disk usage of all file system and disk quota for users, example is show below



![xfs-quota-basic-mode][1]

  * **Expert Mode** – This mode is invoked using “-x” option in “xfs_quota” command, as the name suggests this mode is used to configure disk and file quota for local users on xfs file system.



To print disk quota on any file system, let’s say /home, use the following command,

```
[root@linuxtechi ~]# xfs_quota -x -c 'report -h' /home
User quota on /home (/dev/mapper/Vol-home)
                        Blocks
User ID      Used   Soft   Hard Warn/Grace
---------- ---------------------------------
root            0      0      0  00 [------]
pkumar        12K      0      0  00 [------]

Group quota on /home (/dev/mapper/Vol-home)
                        Blocks
Group ID     Used   Soft   Hard Warn/Grace
---------- ---------------------------------
root            0      0      0  00 [------]
pkumar        12K      0      0  00 [------]
[root@linuxtechi ~]#
```

### Configure User Quota

Let’s assume we have a user named “pkumar”, let’s set disk and file quota on his home directory using “xfs_quota” command

```
[root@linuxtechi ~]# xfs_quota -x -c 'limit bsoft=4250m bhard=4550m pkumar' /home
```

In above command, **bsoft** is block soft limit in MBs and **bhard** is block hard limit in MBs, limit is a keyword to implement disk or file limit on a file system for a specific user.

Let’s set file or inode limit for user pkumar on his home directory,

```
[root@linuxtechi ~]# xfs_quota -x -c 'limit isoft=400 ihard=500 pkumar' /home
```

In above command isoft is inode or file soft limit and ihard is inode or file hard limit.

Both block (disk) limit and Inode (file) limit can be applied using a single command, example is shown below,

```
root@linuxtechi ~]# xfs_quota -x -c 'limit bsoft=4250m bhard=4550m isoft=400 ihard=500 pkumar' /home
[root@linuxtechi ~]#
```

Now verify whether disk and inode limits are implemented on pkumar user using the following xfs_quota command,

```
[root@linuxtechi ~]# xfs_quota -x -c "report -bih" /home
```

![User-Quota-Details-xfs-linux][1]

In above xfs_quota command, report is a keyword , b is for block report , i is for inode report and h is for to display report in human readable format,

### Configure Group Quota

Let’s assume we have a group named called “**engineering**” and two local users (shashi &amp; rakesh) whose secondary group is engineering

Now set the following quotas:

  * Soft block limit: 6 GB (or 6144 MB),
  * Hard block limit :8 GB (or 8192 MB),
  * Soft file limit: 1000
  * Hard file limit: 1200



So to configure disk and file quota on engineering group, use the beneath xfs_quota command,

```
[root@linuxtechi ~]# xfs_quota -x -c 'limit -g bsoft=6144m bhard=8192m isoft=1000 ihard=1200 engineering' /home
[root@linuxtechi ~]#
```

**Note:** In xfs_quota we can also specify the block limit size in GB like “bsoft=6g and bhard=8g”

Now verify the Quota details for group engineering using the following command,

```
[root@linuxtechi ~]# xfs_quota -x -c "report -gbih" /home
Group quota on /home (/dev/mapper/Vol-home)
                        Blocks                            Inodes
Group ID     Used   Soft   Hard Warn/Grace     Used   Soft   Hard Warn/Grace
---------- --------------------------------- ---------------------------------
root            0      0      0  00 [------]      3      0      0  00 [------]
pkumar        12K      0      0  00 [------]      4      0      0  00 [------]
engineering      0     6G     8G  00 [------]      0   1000   1.2k  00 [------]
shashi        12K      0      0  00 [------]      4      0      0  00 [------]
rakesh        12K      0      0  00 [------]      4      0      0  00 [------]
[root@linuxtechi ~]#
```

As we can see above command output, disk and file quota is implemented on engineering group and under the engineering group, we have two users.

### Configure Project (or Directory) Quota

Let’s assume we want to set project quota or directory Quota on “**/var/log**“, So first enable project quota(**prjquota**) on /var file system, edit the /etc/fstab file, add “**prjquota**” after default keyword for /var file system, example is shown below,

```
[root@linuxtechi ~]# vi /etc/fstab
……………………………….
/dev/mapper/Vol-var     /var     xfs     defaults,prjquota        0 0
…………………………………
```

Save &amp; exit the file

To make the above changes into the effect, we must reboot our system,

```
[root@linuxtechi ~]# init 6
```

After reboot, we can verify whether project quota is enabled or not on /var file system using below mount command

```
[root@linuxtechi ~]# mount | grep /var
/dev/mapper/Vol-var on /var type xfs (rw,relatime,seclabel,attr2,inode64,prjquota)
[root@linuxtechi ~]#
```

As we can see in above output, project quota is enabled now, so to configure quota /var/log directory, first we must define directory path and its unique id in the file /etc/projects ( In my case i am taking 151 as unique id for /var/log)

```
[root@linuxtechi ~]# vi /etc/projects
51:/var/log
```

Save &amp; exit the file

Now associate the above id “151” to a project called “**Logs**”, create a file **/etc/projid** and add the following content to it,

```
[root@linuxtechi ~]# vi /etc/projid
Logs:151
```

Save &amp; exit the file

Initialize “Logs” project directory using the xfs_quota command,

**Syntax: #**  xfs_quota -x -c ‘project -s project_name’ project_directory

```
[root@linuxtechi ~]# xfs_quota -x -c 'project -s Logs' /var
Setting up project Logs (path /var/log)...
Processed 1 (/etc/projects and cmdline) paths for project Logs with recursion depth infinite (-1).
[root@linuxtechi ~]#
```

Let’s suppose we want to implement 10 GB hard disk limit and 8 GB soft limit on /var/log directory, run the following xfs_quota command,

```
[root@linuxtechi ~]# xfs_quota -x -c 'limit -p bsoft=8g bhard=10g Logs' /var
[root@linuxtechi ~]#
```

In above command we have used “-p” after limit keyword which shows that we want to implement project quota

Use below xfs_quota command to set file or inode limit on /var/log directory

```
[root@linuxtechi ~]# xfs_quota -x -c 'limit -p isoft=1800 ihard=2000 Logs' /var
[root@linuxtechi ~]#
```

Use below command to print Project quota details

```
[root@linuxtechi ~]# xfs_quota -xc 'report -pbih' /var
Project quota on /var (/dev/mapper/Vol-var)
                        Blocks                            Inodes
Project ID   Used   Soft   Hard Warn/Grace     Used   Soft   Hard Warn/Grace
---------- --------------------------------- ---------------------------------
#0         137.6M      0      0  00 [------]   1.5k      0      0  00 [------]
Logs         3.1M     8G    10G  00 [------]     33   1.8k     2k  00 [------]
[root@linuxtechi ~]#
```

Test Project quota by creating big files under /var/log folder and see whether you can cross 10GB block limit,

```
[root@linuxtechi ~]# cd /var/log/
[root@linuxtechi log]# dd if=/dev/zero of=big_file bs=1G count=9
9+0 records in
9+0 records out
9663676416 bytes (9.7 GB) copied, 37.8915 s, 255 MB/s
[root@linuxtechi log]# dd if=/dev/zero of=big_file2 bs=1G count=5
dd: error writing ‘big_file2’: No space left on device
1+0 records in
0+0 records out
1069219840 bytes (1.1 GB) copied, 3.90945 s, 273 MB/s
[root@linuxtechi log]#
```

Above dd error command confirms that configured project quota is working fine, we can also confirm the same from xfs_quota command,

![xfs-project-quota-details][1]

That’s all from this tutorial, I hope these steps helps you to understand about quota on XFS file system, please do share your feedback and comments in the comments section below.

--------------------------------------------------------------------------------

via: https://www.linuxtechi.com/disk-quota-xfs-file-system-linux-servers/

作者：[Pradeep Kumar][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.linuxtechi.com/author/pradeep/
[b]: https://github.com/lujun9972
[1]: data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[2]: https://www.linuxtechi.com/wp-content/uploads/2019/08/Setup-Disk-Quota-XFS-Linux-Servers.jpg

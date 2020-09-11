[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Using the Linux stat command to create flexible file listings)
[#]: via: (https://www.networkworld.com/article/3573802/using-the-linux-stat-command-to-create-flexible-file-listings.html)
[#]: author: (Sandra Henry-Stocker https://www.networkworld.com/author/Sandra-Henry_Stocker/)

Using the Linux stat command to create flexible file listings
======

D3Damon / Getty Images

The **stat** command supplies a lot of detailed information on files.

It provides not just the date/time of the most recent file changes, but also shows when files were most recently accessed and permissions changed. It tells you the file size in both bytes and blocks. It displays the inode being used by the file along with the file type. It includes the file owner and the associated user group both by name and UID/GID. It displays file permissions in both the “rwx” (referred to as the “human-readable” format) and numerically. On some systems, it might even include the date and time that a file was created (called its “birth”).

[[Get regularly scheduled insights by signing up for Network World newsletters.]][1]

In addition to providing all this information, the **stat** command can also be used to create file listings. These listings are extremely flexible in that you can choose to include any or all of the information described above.

To generate a custom listing, you just need to use the **stat** command’s **-c** (or --**format**) option and specify the fields you want included. For example, to create a listing that shows file permissions in both of the available formats, use this command:

```
$ stat -c '%n %a %A' my*
my.banner 664 -rw-rw-r--
mydir 775 drwxrwxr-x
myfile 664 -rw-rw-r--
myjunk 777 lrwxrwxrwx
mykey 664 -rw-rw-r--
mylog 664 -rw-rw-r--
myscript 755 -rwxr-xr-x
mytext 664 -rw-rw-r--
mytext.bak 664 -rw-rw-r--
mytwin 50 -rw-r-----
mywords 664 -rw-rw-r--
```

As you can see in the example above, **%n** represents the file name, **%a** the permissions in octal and **%A** the permissions in the **rwx** form. A complete list is shown below.

To create an alias for this command, type this or add this definition to your **.bashrc** file:

```
$ alias ls_perms="stat -c '%n %a %A'"
```

To create a listing that is very close to the long listing provided by **ls -l**, do this:

```
$ stat -c '%A %h %U %G %s %y %n' my*
-rw-rw-r-- 1 shs shs 255 2020-04-01 16:20:00.899374215 -0400 my.banner
drwxrwxr-x 2 shs shs 4096 2020-09-07 12:50:20.224470760 -0400 mydir
-rw-rw-r-- 1 shs shs 6 2020-05-16 11:12:00.460355387 -0400 myfile
lrwxrwxrwx 1 shs shs 11 2020-05-28 18:49:21.666792608 -0400 myjunk
-rw-rw-r-- 1 shs shs 655 2020-01-14 15:56:08.540540488 -0500 mykey
-rw-rw-r-- 1 shs shs 8 2020-03-04 17:13:21.406874246 -0500 mylog
-rwxr-xr-x 1 shs shs 201 2020-09-07 12:50:41.316745867 -0400 myscript
-rw-rw-r-- 1 shs shs 40 2019-06-06 08:54:09.538663323 -0400 mytext
-rw-rw-r-- 1 shs shs 24 2019-06-06 08:48:59.652712578 -0400 mytext.bak
-rw-r----- 2 shs shs 228 2019-04-12 19:37:12.790284604 -0400 mytwin
-rw-rw-r-- 1 shs shs 1983 2020-08-10 14:39:57.164842370 -0400 mywords
```

The differences include: 1) no attempt to line up the fields in discernible columns, 2) the date in a _**yyyy-mm-dd**_ format, 3) considerably more precision in the time field and 4) the addition of the time zone (-0400 is EDT).

If you want to see files listed according to the date they were most last accessed (e.g., displayed with the **cat** command), use a command like this:

```
$ stat -c '%n %x' my* | sort -k2
mytwin 2019-04-22 11:25:20.656828964 -0400
mykey 2020-08-20 16:10:34.479324431 -0400
mylog 2020-08-20 16:10:34.527325066 -0400
myfile 2020-08-20 16:10:57.815632794 -0400
mytext.bak 2020-08-20 16:10:57.935634379 -0400
mytext 2020-08-20 16:15:42.323391985 -0400
mywords 2020-08-20 16:15:43.479407259 -0400
myjunk 2020-09-07 10:04:26.543980300 -0400
myscript 2020-09-07 12:50:41.312745815 -0400
my.banner 2020-09-07 13:22:38.105826116 -0400
mydir 2020-09-07 14:53:10.171867194 -0400
```

The field options available for listing file details with **stat** include:

  * %a – access rights in octal (note '#' and '0' printf flags)
  * %A – access rights in human readable form
  * %b – number of blocks allocated (see %B)
  * %B – the size in bytes of each block reported by %b
  * %C – SELinux security context string
  * %d – device number in decimal
  * %D – device number in hex
  * %f – raw mode in hex
  * %F – file type
  * %g – group ID of owner
  * %G – group name of owner
  * %h – number of hard links
  * %i – inode number
  * %m – mount point
  * %n – file name
  * %N – quoted file name with dereference if symbolic link
  * %o – optimal I/O transfer size hint
  * %s – total size, in bytes
  * %t – major device type in hex, for character/block device special files
  * %T – minor device type in hex, for character/block device special files
  * %u – user ID of owner
  * %U – user name of owner
  * %w – time of file birth, human-readable; - if unknown
  * %W – time of file birth, seconds since Epoch; 0 if unknown
  * %x – time of last access, human-readable
  * %X – time of last access, seconds since Epoch
  * %y – time of last data modification, human-readable
  * %Y – time of last data modification, seconds since Epoch
  * %z – time of last status change, human-readable
  * %Z – time of last status change, seconds since Epoch



These field choices are all listed in the man page and you can choose any, though creating a few aliases with your preferred details should save you a lot of trouble. Some options, like the SELinux security context string, will not be available unless that option is in use on the system. File birth is only available if your system retains that information.

Join the Network World communities on [Facebook][2] and [LinkedIn][3] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3573802/using-the-linux-stat-command-to-create-flexible-file-listings.html

作者：[Sandra Henry-Stocker][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Sandra-Henry_Stocker/
[b]: https://github.com/lujun9972
[1]: https://www.networkworld.com/newsletters/signup.html
[2]: https://www.facebook.com/NetworkWorld/
[3]: https://www.linkedin.com/company/network-world

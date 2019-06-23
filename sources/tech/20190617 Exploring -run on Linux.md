[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Exploring /run on Linux)
[#]: via: (https://www.networkworld.com/article/3403023/exploring-run-on-linux.html)
[#]: author: (Sandra Henry-Stocker https://www.networkworld.com/author/Sandra-Henry_Stocker/)

Exploring /run on Linux
======
There's been a small but significant change in how Linux systems work with respect to runtime data.
![Sandra Henry-Stocker][1]

If you haven’t been paying close attention, you might not have noticed a small but significant change in how Linux systems work with respect to runtime data. A re-arrangement of how and where it’s accessible in the file system started taking hold about eight years ago. And while this change might not have been big enough of a splash to wet your socks, it provides some additional consistency in the Linux file system and is worthy of some exploration.

To get started, cd your way over to /run. If you use df to check it out, you’ll see something like this:

```
$ df -k .
Filesystem     1K-blocks  Used Available Use% Mounted on
tmpfs             609984  2604    607380   1% /run
```

Identified as a “tmpfs” (temporary file system), we know that the files and directories in /run are not stored on disk but only in volatile memory. They represent data kept in memory (or disk-based swap) that takes on the appearance of a mounted file system to allow it to be more accessible and easier to manage.

**[ Two-Minute Linux Tips:[Learn how to master a host of Linux commands in these 2-minute video tutorials][2] ]**

/run is home to a wide assortment of data. For example, if you take a look at /run/user, you will notice a group of directories with numeric names.

```
$ ls /run/user
1000  1002  121
```

A long file listing will clarify the significance of these numbers.

```
$ ls -l
total 0
drwx------ 5 shs  shs  120 Jun 16 12:44 1000
drwx------ 5 dory dory 120 Jun 16 16:14 1002
drwx------ 8 gdm  gdm  220 Jun 14 12:18 121
```

This allows us to see that each directory is related to a user who is currently logged in or to the display manager, gdm. The numbers represent their UIDs. The content of each of these directories are files that are used by running processes.

The /run/user files represent only a very small portion of what you’ll find in /run. There are lots of other files, as well. A handful contain the process IDs for various system processes.

```
$ ls *.pid
acpid.pid  atopacctd.pid  crond.pid  rsyslogd.pid
atd.pid    atop.pid       gdm3.pid   sshd.pid
```

As shown below, that sshd.pid file listed above contains the process ID for the ssh daemon (sshd).

```
$ cat sshd.pid
1148
$ ps -ef | grep sshd
root      1148     1  0 Jun14 ?        00:00:00 /usr/sbin/sshd -D    <==
root     10784  1148  0 12:44 ?        00:00:00 sshd: shs [priv]
shs      10922 10784  0 12:44 ?        00:00:00 sshd: shs@pts/0
root     18109  1148  0 16:13 ?        00:00:00 sshd: dory [priv]
dory     18232 18109  0 16:14 ?        00:00:00 sshd: dory@pts/1
shs      19276 10923  0 16:50 pts/0    00:00:00 grep --color=auto sshd
```

Some of the subdirectories within /run can only be accessed with root authority such as /run/sudo. Running as root, for example, we can see some files related to real or attempted sudo usage:

```
/run/sudo/ts# ls -l
total 8
-rw------- 1 root dory 112 Jun 16 16:37 dory
-rw------- 1 root shs  168 Jun 17 08:33 shs
```

In keeping with the shift to using /run, some of the old locations for runtime data are now symbolic links. /var/run is now a pointer to /run and /var/lock a pointer to /run/lock, allowing old references to work as expected.

```
$ ls -l /var
total 52
drwxr-xr-x  2 root root     4096 Jun 17 07:36 backups
drwxr-xr-x 19 root root     4096 Apr 18 13:46 cache
drwxrwsrwt  2 root whoopsie 4096 Jun 13 07:39 crash
drwxr-xr-x 75 root root     4096 Jun  9 15:14 lib
drwxrwsr-x  2 root staff    4096 Oct 16  2017 local
lrwxrwxrwx  1 root root        9 May 14  2018 lock -> /run/lock
drwxrwxr-x 17 root syslog   4096 Jun 17 00:00 log
drwxrwsrwt  2 root mail     4096 Jun 13 12:10 mail
drwxrwsrwt  2 root whoopsie 4096 Jan  5  2018 metrics
drwxr-xr-x  2 root root     4096 Jan  5  2018 opt
lrwxrwxrwx  1 root root        4 May 14  2018 run -> /run
drwxr-xr-x  9 root root     4096 Jun 16  2018 snap
drwxr-xr-x  9 root root     4096 Jun  9 15:14 spool
drwxrwxrwt  8 root root     4096 Jun 17 00:00 tmp
drwxr-xr-x  3 root root     4096 Jan 19 12:14 www
```

While minor as far as technical changes go, the transition to using /run simply allows for a better organization of runtime data in the Linux file system.

**[ Now read this:[Invaluable tips and tricks for troubleshooting Linux][3] ]**

Join the Network World communities on [Facebook][4] and [LinkedIn][5] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3403023/exploring-run-on-linux.html

作者：[Sandra Henry-Stocker][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Sandra-Henry_Stocker/
[b]: https://github.com/lujun9972
[1]: https://images.idgesg.net/images/article/2019/06/exploring_run-100799398-large.jpg
[2]: https://www.youtube.com/playlist?list=PL7D2RMSmRO9J8OTpjFECi8DJiTQdd4hua
[3]: https://www.networkworld.com/article/3242170/linux/invaluable-tips-and-tricks-for-troubleshooting-linux.html
[4]: https://www.facebook.com/NetworkWorld/
[5]: https://www.linkedin.com/company/network-world

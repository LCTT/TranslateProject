[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to manage logs in Linux)
[#]: via: (https://www.networkworld.com/article/3428361/how-to-manage-logs-in-linux.html)
[#]: author: (Sandra Henry-Stocker https://www.networkworld.com/author/Sandra-Henry_Stocker/)

How to manage logs in Linux
======
Log files on Linux systems contain a LOT of information — more than you'll ever have time to view. Here are some tips on how you can make use of it without ... drowning in it.
![Greg Lobinski \(CC BY 2.0\)][1]

Managing log files on Linux systems can be incredibly easy or painful. It all depends on what you mean by log management.

If all you mean is how you can go about ensuring that your log files don’t eat up all the disk space on your Linux server, the issue is generally quite straightforward. Log files on Linux systems will automatically roll over, and the system will only maintain a fixed number of the rolled-over logs. Even so, glancing over what can easily be a group of 100 files can be overwhelming. In this post, we'll take a look at how the log rotation works and some of the most relevant log files.

**[ Two-Minute Linux Tips: [Learn how to master a host of Linux commands in these 2-minute video tutorials][2] ]**

### Automatic log rotation

Log files rotate frequently. What is the current log acquires a slightly different file name and a new log file is established. Take the syslog file as an example. This file is something of a catch-all for a lot of normal system messages. If you **cd** over to **/var/log** and take a look, you’ll probably see a series of syslog files like this:

```
$ ls -l syslog*
-rw-r----- 1 syslog adm 28996 Jul 30 07:40 syslog
-rw-r----- 1 syslog adm 71212 Jul 30 00:00 syslog.1
-rw-r----- 1 syslog adm  5449 Jul 29 00:00 syslog.2.gz
-rw-r----- 1 syslog adm  6152 Jul 28 00:00 syslog.3.gz
-rw-r----- 1 syslog adm  7031 Jul 27 00:00 syslog.4.gz
-rw-r----- 1 syslog adm  5602 Jul 26 00:00 syslog.5.gz
-rw-r----- 1 syslog adm  5995 Jul 25 00:00 syslog.6.gz
-rw-r----- 1 syslog adm 32924 Jul 24 00:00 syslog.7.gz
```

Rolled over at midnight each night, the older syslog files are kept for a week and then the oldest is deleted. The syslog.7.gz file will be tossed off the system and syslog.6.gz will be renamed syslog.7.gz. The remainder of the log files will follow suit until syslog becomes syslog.1 and a new syslog file is created. Some syslog files will be larger than others, but in general, none will likely ever get very large and you’ll never see more than eight of them. This gives you just over a week to review any data they collect.

The number of files maintained for any particular log file depends on the log file itself. For some, you may have as many as 13. Notice how the older files – both for syslog and dpkg – are gzipped to save space. The thinking here is likely that you’ll be most interested in the recent logs. Older logs can be unzipped with **gunzip** as needed.

```
# ls -t dpkg*
dpkg.log       dpkg.log.3.gz  dpkg.log.6.gz  dpkg.log.9.gz   dpkg.log.12.gz
dpkg.log.1     dpkg.log.4.gz  dpkg.log.7.gz  dpkg.log.10.gz
dpkg.log.2.gz  dpkg.log.5.gz  dpkg.log.8.gz  dpkg.log.11.gz
```

Log files can be rotated based on age, as well as by size. Keep this in mind as you examine your log files.

Log file rotation can be configured differently if you are so inclined, though the defaults work for most Linux sysadmins. Take a look at files like **/etc/rsyslog.conf** and **/etc/logrotate.conf** for some of the details.

### Making use of your log files

Managing log files should also include using them from time to time. The first step in making use of log files should probably include getting used to what each log file can tell you about how your system is working and what problems it might have run into. Reading log files from top to bottom is almost never a good option, but knowing how to pull information from them can be of great benefit when you want to get a sense of how well your system is working or need to track down a problem. This also suggests that you have a general idea what kind of information is stored in each file. For example:

```
$ who wtmp | tail -10     show the most recent logins
$ who wtmp | grep shark show recent logins for a particular user
$ grep "sudo:" auth.log see who is using sudo
$ tail dmesg                    look at kernel messages
$ tail dpkg.log                 see recently installed and updated packages
$ more ufw.log                  see firewall activity (i.e., if you are using ufw)
```

Some commands that you run will also extract information from your log files. If you want to see, for example, a list of system reboots, you can use a command like this:

```
$ last reboot
reboot   system boot  5.0.0-20-generic Tue Jul 16 13:19   still running
reboot   system boot  5.0.0-15-generic Sat May 18 17:26 - 15:19 (21+21:52)
reboot   system boot  5.0.0-13-generic Mon Apr 29 10:55 - 15:34 (18+04:39)
```

### Using more advanced log managers

While you can write scripts to make it easier to find interesting information in your log files, you should also be aware that there are some very sophisticated tools available for log file analysis. Some correlate information from multiple sources to get a fuller picture of what’s happening on your network. They may provide real-time monitoring, as well. Tools such as [Solarwinds Log &amp; Event Manager][3] and [PRTG Network Monitor][4] (which includes log monitoring) come to mind.

There are also some free tools that can help with analyzing log files. These include:

  * **Logwatch** — program to scan system logs for interesting lines
  * **Logcheck** — system log analyzer and reporter



I'll provide some insights and help on these tools in upcoming posts.

**[ Also see: [Invaluable tips and tricks for troubleshooting Linux][5] ]**

Join the Network World communities on [Facebook][6] and [LinkedIn][7] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3428361/how-to-manage-logs-in-linux.html

作者：[Sandra Henry-Stocker][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Sandra-Henry_Stocker/
[b]: https://github.com/lujun9972
[1]: https://images.idgesg.net/images/article/2019/07/logs-100806633-large.jpg
[2]: https://www.youtube.com/playlist?list=PL7D2RMSmRO9J8OTpjFECi8DJiTQdd4hua
[3]: https://www.esecurityplanet.com/products/solarwinds-log-event-manager-siem.html
[4]: https://www.paessler.com/prtg
[5]: https://www.networkworld.com/article/3242170/linux/invaluable-tips-and-tricks-for-troubleshooting-linux.html
[6]: https://www.facebook.com/NetworkWorld/
[7]: https://www.linkedin.com/company/network-world

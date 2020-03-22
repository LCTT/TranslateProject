[#]: collector: (lujun9972)
[#]: translator: (HankChow)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Manually rotating log files on Linux)
[#]: via: (https://www.networkworld.com/article/3531969/manually-rotating-log-files-on-linux.html)
[#]: author: (Sandra Henry-Stocker https://www.networkworld.com/author/Sandra-Henry_Stocker/)

Manually rotating log files on Linux
======

[deovolenti][1] [(CC BY 2.0)][2]

Log rotation, a normal thing on Linux systems, keeps any particular log file from becoming too large, yet ensures that sufficient details on system activities are still available for proper system monitoring and troubleshooting.

The oldest in a group of log files is removed, remaining log files are bumped down a notch and a newer file takes its place as the current log file. This process is conveniently automated and the details can be adjusted as needed.

[[Get regularly scheduled insights by signing up for Network World newsletters.]][3]

Manual rotation of log files is possible through the use of the **logrotate** command. This post provides details on how to manually rotate log files and what to expect.

The examples described in this post work on Ubuntu and related Linux systems. Other systems might use different log file and configuration file names, but the process itself should be very similar.

### Why rotate a log file

Under normal circumstances, there is no need to manually rotate log files. Your Linux system should already be set up to rotate some logs daily (or less often) and others depending on their size. If you need to rotate a log file to free up space or separate a current log from ongoing activity, it's fairly easy to do but will depend on your file-rotation specifications.

### A little background

A number of log files are set up for rotation as soon as a Linux system is installed. In addition, certain applications add their own log files and rotation specs when they are installed on the system. The configuration files for log-file rotations can be found in the **/etc/logrotate.d** directory. Details on how this process works are available on an [earlier post][4].

In the log-rotation process, the current log generally acquires a name like log.1, the old log.1 becomes log.2 and so on while the oldest of the log files, say log.7, is removed from the system. Of course, the names and number of versions retained depend on the logs being rotated and the rotation specifications for those files in the **/etc/logrotate.d** directory. For some log files, only a few "generations" are retained while, for others, you might see seven or even more.

[][5]

After the usual log file rotation, your **syslog** files might look like the following. (NOTE: The "was syslog" comments at the end of lines were added to illustrate how the rotation process affected the files.)

```
$ ls -l /var/log/syslog*
-rw-r----- 1 syslog adm  128674 Mar 10 08:00 /var/log/syslog      <== new
-rw-r----- 1 syslog adm 2405968 Mar  9 16:09 /var/log/syslog.1    <== was syslog
-rw-r----- 1 syslog adm  206451 Mar  9 00:00 /var/log/syslog.2.gz <== was syslog.1
-rw-r----- 1 syslog adm  216852 Mar  8 00:00 /var/log/syslog.3.gz <== was syslog.2.gz
-rw-r----- 1 syslog adm  212889 Mar  7 00:00 /var/log/syslog.4.gz <== was syslog.3.gz
-rw-r----- 1 syslog adm  219106 Mar  6 00:00 /var/log/syslog.5.gz <== was syslog.4.gz
-rw-r----- 1 syslog adm  218596 Mar  5 00:00 /var/log/syslog.6.gz <== was syslog.5.gz
-rw-r----- 1 syslog adm  211074 Mar  4 00:00 /var/log/syslog.7.gz <== was syslog.6.gz
```

You might not be surprised to see that all but the current and most recent log files on this system have been gzipped to save space. The expectation behind this is that most system admins would likely be looking at only the most recent files, so keeping others available but compressed is a smart move.

### Manual log rotation

To manually rotate the syslog files, you would use the **logrotate** command like this:

```
$ sudo logrotate -f /etc/logrotate.d/rsyslog
```

Notice that this **logrotate** command uses **-f** (force the rotation) option. The rotation configuration details are pulled from the specified file in the **/etc/logrotate.d/rsyslog** directory. This command would then follow the typical process – remove **syslog.7.gz**, move **syslog.6.gz** to **syslog.7.gz**, move **syslog.5.gz** to **syslog.6.gz**, move **syslog.4.gz** to **syslog.5.gz**, move **syslog.3.gz** to **syslog.4.gz**, and move **syslog.2.gz** to **syslog.1.gz**, but it would not necessarily create the new **syslog** file. You could do that manually with commands like these to set up the file and ensure proper file ownership and permissions:

```
$ sudo touch /var/log/syslog
$ sudo chown syslog:adm /var/log/syslog
$ sudo chmod 640 /var/log/syslog
```

Alternately, you could add this line to your **/etc/logrotate.d/rsyslog** file to do the work for you:

```
create 0640 syslog adm
```

Insert as shown below:

```
/var/log/syslog
{
rotate 7
daily
missingok
notifempty
create 0640 syslog adm           <==
delaycompress
compress
postrotate
/usr/lib/rsyslog/rsyslog-rotate
endscript
}
```

Here is an example of manual log rotation of the **wtmp** log files that record user logins. Note that only two **wtmp** files are retained on this system due to the "rotate 2" specification in **/etc/logrotate.d/wtmp**.

Before:

```
$ ls -l wtmp*
-rw-r----- 1 root utmp  1152 Mar 12 11:49 wtmp
-rw-r----- 1 root utmp   768 Mar 11 17:04 wtmp.1
```

Command:

```
$ sudo logrotate -f /etc/logrotate.d/wtmp
```

After:

```
$ ls -l /var/log/wtmp*
-rw-r----- 1 root utmp     0 Mar 12 11:52 /var/log/wtmp
-rw-r----- 1 root utmp  1152 Mar 12 11:49 /var/log/wtmp.1
-rw-r----- 1 root adm  99726 Feb 21 07:46 /var/log/wtmp.report
```

Notice that the most recent rotations for each log are captured in **logrotate**'s status file – whether the rotations are done manually or are automated:

```
$ grep wtmp /var/lib/logrotate/status
"/var/log/wtmp" 2020-3-12-11:52:57
```

Join the Network World communities on [Facebook][6] and [LinkedIn][7] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3531969/manually-rotating-log-files-on-linux.html

作者：[Sandra Henry-Stocker][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Sandra-Henry_Stocker/
[b]: https://github.com/lujun9972
[1]: https://www.flickr.com/photos/klif/4244284159/in/photolist-7t44P6-oPFpsr-a8c5W-gWNZ6-32EEo4-cjdxqy-diHaq9-8DYZWf-gWNWM-bgLApc-hBt94C-cj71kY-PMESV-dZBcCU-pSqgNM-51eKHq-EecbfS-osGNau-KMUx-nFaWEL-cj71PE-HFVXn-gWNWs-85HueR-8QpDh8-kV1dEc-76qYSV-5YnxuS-gWNXr-dYoQ5w-dzj1j3-3AJyd-mHbaWF-q2fTri-e9bFa6-nJyvfR-4PnMyH-gWNZr-8VUtGS-gWNWZ-ajzUd4-2hAjMk-gWW3g-gWP11-dwYbH5-4XMew-cj71B1-ica9kJ-5RonM6-8z5tGL
[2]: https://creativecommons.org/licenses/by/2.0/legalcode
[3]: https://www.networkworld.com/newsletters/signup.html
[4]: https://www.networkworld.com/article/3218728/how-log-rotation-works-with-logrotate.html
[5]: https://www.networkworld.com/blog/itaas-and-the-corporate-storage-technology/?utm_source=IDG&utm_medium=promotions&utm_campaign=HPE22140&utm_content=sidebar (ITAAS and Corporate Storage Strategy)
[6]: https://www.facebook.com/NetworkWorld/
[7]: https://www.linkedin.com/company/network-world

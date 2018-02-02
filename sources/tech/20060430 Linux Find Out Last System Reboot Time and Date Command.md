Linux Find Out Last System Reboot Time and Date Command
======
So, how do you find out your Linux or UNIX-like system was last rebooted? How do you display the system shutdown date and time? The last utility will either list the sessions of specified users, ttys, and hosts, in reverse time order, or list the users logged in at a specified date and time. Each line of output contains the user name, the tty from which the session was conducted, any hostname, the start and stop times for the session, and the duration of the session. To view Linux or Unix system reboot and shutdown date and time stamp using the following commands:

  * last command
  * who command



### Use who command to find last system reboot time/date

You need to use the [who command][1], to print who is logged on. It also displays the time of last system boot. Use the last command to display system reboot and shutdown date and time, run:
`$ who -b`
Sample outputs:
```
 system boot 2017-06-20 17:41
```

Use the last command to display listing of last logged in users and system last reboot time and date, enter:
`$ last reboot | less`
Sample outputs:
[![Fig.01: last command in action][2]][2]
Or, better try:
`$ last reboot | head -1`
Sample outputs:
```
reboot system boot 4.9.0-3-amd64 Sat Jul 15 19:19 still running
```

The last command searches back through the file /var/log/wtmp and displays a list of all users logged in (and out) since that file was created. The pseudo user reboot logs in each time the system is rebooted. Thus last reboot command will show a log of all reboots since the log file was created.

### Finding systems last shutdown date and time

To display last shutdown date and time use the following command:
`$ last -x|grep shutdown | head -1`
Sample outputs:
```
shutdown system down 2.6.15.4 Sun Apr 30 13:31 - 15:08 (01:37)
```

Where,

  *  **-x** : Display the system shutdown entries and run level changes.



Here is another session from my last command:
```
$ last
$ last -x
$ last -x reboot
$ last -x shutdown
```
Sample outputs:
![Fig.01: How to view last Linux System Reboot Date/Time ][3]

### Find out Linux system up since…

Another option as suggested by readers in the comments section below is to run the following command:
`$ uptime -s`
Sample outputs:
```
2017-06-20 17:41:51
```

### OS X/Unix/FreeBSD find out last reboot and shutdown time command examples

Type the following command:
`$ last reboot`
Sample outputs from OS X unix:
```
reboot ~ Fri Dec 18 23:58
reboot ~ Mon Dec 14 09:54
reboot ~ Wed Dec 9 23:21
reboot ~ Tue Nov 17 21:52
reboot ~ Tue Nov 17 06:01
reboot ~ Wed Nov 11 12:14
reboot ~ Sat Oct 31 13:40
reboot ~ Wed Oct 28 15:56
reboot ~ Wed Oct 28 11:35
reboot ~ Tue Oct 27 00:00
reboot ~ Sun Oct 18 17:28
reboot ~ Sun Oct 18 17:11
reboot ~ Mon Oct 5 09:35
reboot ~ Sat Oct 3 18:57


wtmp begins Sat Oct 3 18:57
```

To see shutdown date and time, enter:
`$ last shutdown`
Sample outputs:
```
shutdown ~ Fri Dec 18 23:57
shutdown ~ Mon Dec 14 09:53
shutdown ~ Wed Dec 9 23:20
shutdown ~ Tue Nov 17 14:24
shutdown ~ Mon Nov 16 21:15
shutdown ~ Tue Nov 10 13:15
shutdown ~ Sat Oct 31 13:40
shutdown ~ Wed Oct 28 03:10
shutdown ~ Sun Oct 18 17:27
shutdown ~ Mon Oct 5 09:23


wtmp begins Sat Oct 3 18:57
```

### How do I find who rebooted/shutdown the Linux box?

You need [to enable psacct service and run the following command to see info][4] about executed commands including user name. Type the following [lastcomm command][5] to see
```
# lastcomm userNameHere
# lastcomm commandNameHere
# lastcomm | more
# lastcomm reboot
# lastcomm shutdown
### OR see both reboot and shutdown time
# lastcomm | egrep 'reboot|shutdown'
```
Sample outputs:
```
reboot S X root pts/0 0.00 secs Sun Dec 27 23:49
shutdown S root pts/1 0.00 secs Sun Dec 27 23:45
```

So root user rebooted the box from 'pts/0' on Sun, Dec, 27th at 23:49 local time.

### See also

  * For more information read last(1) and [learn how to use the tuptime command on Linux server to see the historical and statistical uptime][6].



### about the author


The author is the creator of nixCraft and a seasoned sysadmin and a trainer for the Linux operating system/Unix shell scripting. He has worked with global clients and in various industries, including IT, education, defense and space research, and the nonprofit sector. Follow him on [Twitter][7], [Facebook][8], [Google+][9].

--------------------------------------------------------------------------------

via: https://www.cyberciti.biz/tips/linux-last-reboot-time-and-date-find-out.html

作者：[Vivek Gite][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.cyberciti.biz/
[1]:https://www.cyberciti.biz/faq/unix-linux-who-command-examples-syntax-usage/ (See Linux/Unix who command examples for more info)
[2]:https://www.cyberciti.biz/tips/wp-content/uploads/2006/04/last-reboot.jpg
[3]:https://www.cyberciti.biz/media/new/tips/2006/04/check-last-time-system-was-rebooted.jpg
[4]:https://www.cyberciti.biz/tips/howto-log-user-activity-using-process-accounting.html
[5]:https://www.cyberciti.biz/faq/linux-unix-lastcomm-command-examples-usage-syntax/ (See Linux/Unix lastcomm command examples for more info)
[6]:https://www.cyberciti.biz/hardware/howto-see-historical-statistical-uptime-on-linux-server/
[7]:https://twitter.com/nixcraft
[8]:https://facebook.com/nixcraft
[9]:https://plus.google.com/+CybercitiBiz

[#]: collector: (lujun9972)
[#]: translator: (dianbanjiu )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Commands to help you monitor activity on your Linux server)
[#]: via: (https://www.networkworld.com/article/3335200/linux/how-to-monitor-activity-on-your-linux-server.html)
[#]: author: (Sandra Henry-Stocker https://www.networkworld.com/author/Sandra-Henry_Stocker/)

Commands to help you monitor activity on your Linux server
======
The watch, top, and ac commands provide some effective ways to oversee what is happening on your Linux servers.

![](https://images.idgesg.net/images/article/2019/01/owl-face-100785829-large.jpg)

Linux systems provide a number of commands that make it easy to report on system activity. In this post, we're going to look at several commands that are especially helpful.

### The watch command

The **watch** command is one that makes it easy to repeatedly examine a variety of data on your system — user activities, running processes, logins, memory usage, etc. All the command really does is run the command that you specify repeatedly, each time overwriting the previously displayed output, but this lends itself to a very convenient way of monitoring what's happening on your system.

To start with a very basic and not particularly useful command, you could run **watch -n 5 date** and see a display with the current date and time that updates every 5 seconds. As you likely have guessed, the **-n 5** option specifies the number of seconds to wait between each run of the command. The default is 2 seconds. The command will run and update a display like this until you stop it with a ^c.

```
Every 5.0s: date butterfly: Wed Jan 23 15:59:14 2019

Wed Jan 23 15:59:14 EST 2019
```

As a more interesting command example, you can watch an updated list of whoever is logging into the server. As written, this command will update every 10 seconds. Users who log out will disappear from the current display and those who log in will come into view. If no one is logging in or out, the display will remain the same except for the time displayed.

```
$ watch -n 10 who

Every 10.0s: who butterfly: Tue Jan 23 16:02:03 2019

shs :0 2019-01-23 09:45 (:0)
dory pts/0 2019-01-23 15:50 (192.168.0.5)
nemo pts/1 2019-01-23 16:01 (192.168.0.15)
shark pts/3 2019-01-23 11:11 (192.168.0.27)
```

If you just want to see how many users are logged in, you can get a user count along with load averages showing you how hard the system is working by having watch call the **uptime** command.

```
$ watch uptime

Every 2.0s: uptime butterfly: Tue Jan 23 16:25:48 2019

 16:25:48 up 22 days, 4:38, 3 users, load average: 1.15, 0.89, 1.02
```

If you want to use watch to repeat a command that includes a pipe, you need to put the command between quote marks like this command that every 5 seconds shows you how many processes are running:

```
$ watch -n 5 'ps -ef | wc -l'

Every 5.0s: ps -ef | wc -l butterfly: Tue Jan 23 16:11:54 2019

245
```

To watch memory usage, you might try a command like this one:

```
$ watch -n 5 free -m

Every 5.0s: free -m butterfly: Tue Jan 23 16:34:09 2019

 total used free shared buff/cache available
Mem: 5959 776 3276 12 1906 4878
Swap: 2047 0 2047
```

You could watch processes being run by one particular user with **watch,** but the **top** command provides a much better option.

### The top command

If you want to watch one particular user's processes, top has an ideal option for you — the -u option:

```
$ top -u nemo
top - 16:14:33 up 2 days, 4:27, 3 users, load average: 0.00, 0.01, 0.02
Tasks: 199 total, 1 running, 198 sleeping, 0 stopped, 0 zombie
%Cpu(s): 0.0 us, 0.2 sy, 0.0 ni, 99.8 id, 0.0 wa, 0.0 hi, 0.0 si, 0.0 st
MiB Mem : 5959.4 total, 3277.3 free, 776.4 used, 1905.8 buff/cache
MiB Swap: 2048.0 total, 2048.0 free, 0.0 used. 4878.4 avail Mem

 PID USER PR NI VIRT RES SHR S %CPU %MEM TIME+ COMMAND
23026 nemo 20 0 46340 7820 6504 S 0.0 0.1 0:00.05 systemd
23033 nemo 20 0 149660 3140 72 S 0.0 0.1 0:00.00 (sd-pam)
23125 nemo 20 0 63396 5100 4092 S 0.0 0.1 0:00.00 sshd
23128 nemo 20 0 16836 5636 4284 S 0.0 0.1 0:00.03 zsh
```

You not only see what processes the user is running, but the resources (CPU time and memory) that the process is consuming and how hard the system is working overall.

### The ac command

If you'd like to see how much time each of your users is spending logged in, you can make use of the **ac** command. This requires installation of the **acct** (Debian) or **psacct** (RHEL, Centos, etc.) package.

The **ac** command has a number of options, but it pulls its data from the current **wtmp** file. Here's an example showing the total number of hours users were logged in recently:

```
$ ac
 total 1261.72
```

This command shows total hours by user:

```
$ ac -p
 shark 5.24
 nemo 5.52
 shs 1251.00
 total 1261.76
```

This ac command shows daily counts of how many hours users were logged in:

```
$ ac -d | tail -10

Jan 11 total 0.05
Jan 12 total 1.36
Jan 13 total 16.39
Jan 15 total 55.33
Jan 16 total 38.02
Jan 17 total 28.51
Jan 19 total 48.66
Jan 20 total 1.37
Jan 22 total 23.48
Today total 9.83
```

### Wrap-up

There are many commands for examining system activity. The **watch** command allows you to run just about any command in a repetitive way and watch how the output changes. The **top** command is a better option for focusing on user processes and also loops in a way that allows you to see the changes as they happen, while the **ac** command examines user connect time.

Join the Network World communities on [Facebook][1] and [LinkedIn][2] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3335200/linux/how-to-monitor-activity-on-your-linux-server.html

作者：[Sandra Henry-Stocker][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Sandra-Henry_Stocker/
[b]: https://github.com/lujun9972
[1]: https://www.facebook.com/NetworkWorld/
[2]: https://www.linkedin.com/company/network-world

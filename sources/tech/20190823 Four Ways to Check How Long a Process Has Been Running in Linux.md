[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Four Ways to Check How Long a Process Has Been Running in Linux)
[#]: via: (https://www.2daygeek.com/how-to-check-how-long-a-process-has-been-running-in-linux/)
[#]: author: (Magesh Maruthamuthu https://www.2daygeek.com/author/magesh/)

Four Ways to Check How Long a Process Has Been Running in Linux
======

If you want to figure out how long a process has been running in Linux for some reason.

Yes, it is possible and can be done with help of ps command.

It shows, the given process uptime in the form of [[DD-]hh:]mm:ss, in seconds, and exact start date and time.

There are multiple options are available in ps command to check this.

Each options comes with different output, which can be used for different purpose.

```
# top -b -s -n 1 | grep httpd

16337 root      20   0  228272   5160   3272 S   0.0  0.1   1:02.27 httpd
30442 apache    20   0  240520   3132   1232 S   0.0  0.1   0:00.00 httpd
30443 apache    20   0  240520   3132   1232 S   0.0  0.1   0:00.00 httpd
30444 apache    20   0  240520   3132   1232 S   0.0  0.1   0:00.00 httpd
30445 apache    20   0  240520   3132   1232 S   0.0  0.1   0:00.00 httpd
30446 apache    20   0  240520   3132   1232 S   0.0  0.1   0:00.00 httpd
```

**`Make a note:`**` ` You may think the same details can be found on **[top command output][1]**. No, It shows you the total CPU time the task has used since it started. But it doesn’t include elapsed time. So, don’t confuse on this.

### What’s ps Command?

ps stands for processes status, it is display information about the active/running processes on the system.

It provides a snapshot of the current processes along with detailed information like username, user id, cpu usage, memory usage, process start date and time command name etc.

  * **`etime:`**` ` elapsed time since the process was started, in the form of [[DD-]hh:]mm:ss.
  * **`etimes:`**` ` elapsed time since the process was started, in seconds.



To do so, you need to **[find out the PID of a process][2]**, we can easily identify it by using pidof command.

```
# pidof httpd

30446 30445 30444 30443 30442 16337
```

### Method-1: Using etime Option

Use the ps command with **`etime`**` ` option to get detailed elapsed time.

```
# ps -p 16337 -o etime

    ELAPSED
13-13:13:26
```

As per the above output, the httpd process has been running in our server `13 days, 13 hours, 13 mins, and 26 sec`****.

### Method-2: Using Process Name Instead of Process ID (PID)

If you want to use process name instead of PID, use the following one.

```
# ps -eo pid,etime,cmd | grep httpd | grep -v grep

16337 13-13:13:39 /usr/sbin/httpd -DFOREGROUND
30442  1-02:59:50 /usr/sbin/httpd -DFOREGROUND
30443  1-02:59:49 /usr/sbin/httpd -DFOREGROUND
30444  1-02:59:49 /usr/sbin/httpd -DFOREGROUND
30445  1-02:59:49 /usr/sbin/httpd -DFOREGROUND
30446  1-02:59:49 /usr/sbin/httpd -DFOREGROUND
```

### Method-3: Using etimes Option

The following command will show you the elapsed time in seconds.

```
# ps -p 16337 -o etimes

ELAPSED
1170810
```

It shows the output in Seconds and you need to convert it as per your requirement.

```
+---------------------+-------------------------+
| Human-Readable time |          Seconds        |
+---------------------+-------------------------+
|       1 hour        |       3600 seconds      |
|       1 day         |       86400 seconds     |
+---------------------+-------------------------+
```

If you would like to know how many hours the process has been running then use, **[Linux command line calculator][3]**.

```
# bc -l

1170810/3600
325.22500000000000000000
```

If you would like to know how many days the process has been running then use the following format.

```
# bc -l

1170810/86400
13.55104166666666666666
```

The above commands doesn’t show you the exact start date of the process and if you want to know those information then you can use the following command. As per the below output the httpd process has been running since **`Aug 05`**.

```
# ps -ef | grep httpd

root     16337     1  0 Aug05 ?        00:01:02 /usr/sbin/httpd -DFOREGROUND
root     24999 24902  0 06:34 pts/0    00:00:00 grep --color=auto httpd
apache   30442 16337  0 Aug18 ?        00:00:00 /usr/sbin/httpd -DFOREGROUND
apache   30443 16337  0 Aug18 ?        00:00:00 /usr/sbin/httpd -DFOREGROUND
apache   30444 16337  0 Aug18 ?        00:00:00 /usr/sbin/httpd -DFOREGROUND
apache   30445 16337  0 Aug18 ?        00:00:00 /usr/sbin/httpd -DFOREGROUND
apache   30446 16337  0 Aug18 ?        00:00:00 /usr/sbin/httpd -DFOREGROUND
```

### Method-4: Using proc filesystem (procfs)

However, the above command doesn’t show you the exact start time of the process and use the following format to check that. As per the below output the httpd process has been running since **`Aug 05 at 17:20`**.

The proc filesystem (procfs) is a special filesystem in Unix-like operating systems that presents information about processes and other system information.

It’s sometimes referred to as a process information pseudo-file system. It doesn’t contain ‘real’ files but run time system information (e.g. system memory, devices mounted, hardware configuration, etc).

```
# ls -ld /proc/16337

dr-xr-xr-x. 9 root root 0 Aug  5 17:20 /proc/16337/
```

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/how-to-check-how-long-a-process-has-been-running-in-linux/

作者：[Magesh Maruthamuthu][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/magesh/
[b]: https://github.com/lujun9972
[1]: https://www.2daygeek.com/understanding-linux-top-command-output-usage/
[2]: https://www.2daygeek.com/9-methods-to-check-find-the-process-id-pid-ppid-of-a-running-program-in-linux/
[3]: https://www.2daygeek.com/linux-command-line-calculator-bc-calc-qalc-gcalccmd/

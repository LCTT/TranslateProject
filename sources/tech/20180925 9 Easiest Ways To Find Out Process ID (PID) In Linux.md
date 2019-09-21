9 Easiest Ways To Find Out Process ID (PID) In Linux
======
Everybody knows about PID, Exactly what is PID? Why you want PID? What are you going to do using PID? Are you having the same questions on your mind? If so, you are in the right place to get all the details.

Mainly, we are looking PID to kill an unresponsive program and it’s similar to Windows task manager. Linux GUI also offering the same feature but CLI is an efficient way to perform the kill operation.

### What Is Process ID?

PID stands for process identification number which is generally used by most operating system kernels such as Linux, Unix, macOS and Windows. It is a unique identification number that is automatically assigned to each process when it is created in an operating system. A process is a running instance of a program.

**Suggested Read :**
**(#)** [How To Find Out Which Port Number A Process Is Using In Linux][1]
**(#)** [3 Easy Ways To Kill Or Terminate A Process In Linux][2]

Each time process ID will be getting change to all the processes except init because init is always the first process on the system and is the ancestor of all other processes. It’s PID is 1.

The default maximum value of PIDs is `32,768`. The same has been verified by running the following command on your system `cat /proc/sys/kernel/pid_max`. On 32-bit systems 32768 is the maximum value but we can set to any value up to 2^22 (approximately 4 million) on 64-bit systems.

You may ask, why we need such amount of PIDs? because we can’t reused the PIDs immediately that’s why. Also in order to prevent possible errors.

The PID for the running processes on the system can be found by using the below nine methods such as pidof command, pgrep command, ps command, pstree command, ss command, netstat command, lsof command, fuser command and systemctl command.

This can be achieved using the below six methods.

  * `pidof:` pidof — find the process ID of a running program.
  * `pgrep:` pgre – look up or signal processes based on name and other attributes.
  * `ps:` ps – report a snapshot of the current processes.
  * `pstree:` pstree – display a tree of processes.
  * `ss:` ss is used to dump socket statistics.
  * `netstat:` netstat is displays a list of open sockets.
  * `lsof:` lsof – list open files.
  * `fuser:` fuser – list process IDs of all processes that have one or more files open
  * `systemctl:` systemctl – Control the systemd system and service manager



In this tutorial we are going to find out the Apache process id to test this article. Make sure your need to input your process name instead of us.

### Method-1 : Using pidof Command

pidof used to find the process ID of a running program. It’s prints those id’s on the standard output. To demonstrate this, we are going to find out the Apache2 process id from Debian 9 (stretch) system.

```
# pidof apache2
3754 2594 2365 2364 2363 2362 2361

```

From the above output you may face difficulties to identify the Process ID because it’s shows all the PIDs (included Parent and Childs) aginst the process name. Hence we need to find out the parent PID (PPID), which is the one we are looking. It could be the first number. In my case it’s `3754` and it’s shorted in descending order.

### Method-2 : Using pgrep Command

pgrep looks through the currently running processes and lists the process IDs which match the selection criteria to stdout.

```
# pgrep apache2
2361
2362
2363
2364
2365
2594
3754

```

This also similar to the above output but it’s shorting the results in ascending order, which clearly says that the parent PID is the last one. In my case it’s `3754`.

**Note :** If you have more than one process id of the process, you may face trouble to identify the parent process id when using pidof  & pgrep command.

### Method-3 : Using pstree Command

pstree shows running processes as a tree. The tree is rooted at either pid or init if pid is omitted. If a user name is specified in the pstree command then it’s shows all the process owned by the corresponding user.

pstree visually merges identical branches by putting them in square brackets and prefixing them with the repetition count.

```
# pstree -p | grep "apache2"
            |-apache2(3754)-|-apache2(2361)
            | |-apache2(2362)
            | |-apache2(2363)
            | |-apache2(2364)
            | |-apache2(2365)
            | `-apache2(2594)

```

To get parent process alone, use the following format.

```
# pstree -p | grep "apache2" | head -1
            |-apache2(3754)-|-apache2(2361)

```

pstree command is very simple because it’s segregating the Parent and Child processes separately but it’s not easy when using pidof & pgrep command.

### Method-4 : Using ps Command

ps displays information about a selection of the active processes. It displays the process ID (pid=PID), the terminal associated with the process (tname=TTY), the cumulated CPU time in [DD-]hh:mm:ss format (time=TIME), and the executable name (ucmd=CMD). Output is unsorted by default.

```
# ps aux | grep "apache2"
www-data 2361 0.0 0.4 302652 9732 ? S 06:25 0:00 /usr/sbin/apache2 -k start
www-data 2362 0.0 0.4 302652 9732 ? S 06:25 0:00 /usr/sbin/apache2 -k start
www-data 2363 0.0 0.4 302652 9732 ? S 06:25 0:00 /usr/sbin/apache2 -k start
www-data 2364 0.0 0.4 302652 9732 ? S 06:25 0:00 /usr/sbin/apache2 -k start
www-data 2365 0.0 0.4 302652 8400 ? S 06:25 0:00 /usr/sbin/apache2 -k start
www-data 2594 0.0 0.4 302652 8400 ? S 06:55 0:00 /usr/sbin/apache2 -k start
root 3754 0.0 1.4 302580 29324 ? Ss Dec11 0:23 /usr/sbin/apache2 -k start
root 5648 0.0 0.0 12784 940 pts/0 S+ 21:32 0:00 grep apache2

```

From the above output we can easily identify the parent process id (PPID) based on the process start date. In my case apache2 process was started @ `Dec11` which is the parent and others are child’s. PID of apache2 is `3754`.

### Method-5: Using ss Command

ss is used to dump socket statistics. It allows showing information similar to netstat. It can display more TCP and state informations than other tools.

It can display stats for all kind of sockets such as PACKET, TCP, UDP, DCCP, RAW, Unix domain, etc.

```
# ss -tnlp | grep apache2
LISTEN 0 128 :::80 :::* users:(("apache2",pid=3319,fd=4),("apache2",pid=3318,fd=4),("apache2",pid=3317,fd=4))

```

### Method-6: Using netstat Command

netstat – Print network connections, routing tables, interface statistics, masquerade connections, and multicast memberships.
By default, netstat displays a list of open sockets.

If you don’t specify any address families, then the active sockets of all configured address families will be printed. This program is obsolete. Replacement for netstat is ss.

```
# netstat -tnlp | grep apache2
tcp6 0 0 :::80 :::* LISTEN 3317/apache2

```

### Method-7: Using lsof Command

lsof – list open files. The Linux lsof command lists information about files that are open by processes running on the system.

```
# lsof -i -P | grep apache2
apache2 3317 root 4u IPv6 40518 0t0 TCP *:80 (LISTEN)
apache2 3318 www-data 4u IPv6 40518 0t0 TCP *:80 (LISTEN)
apache2 3319 www-data 4u IPv6 40518 0t0 TCP *:80 (LISTEN)

```

### Method-8: Using fuser Command

The fuser utility shall write to standard output the process IDs of processes running on the local system that have one or more named files open.

```
# fuser -v 80/tcp
 USER PID ACCESS COMMAND
80/tcp: root 3317 F.... apache2
 www-data 3318 F.... apache2
 www-data 3319 F.... apache2

```

### Method-9: Using systemctl Command

systemctl – Control the systemd system and service manager. This is the replacement of old SysV init system management and
most of the modern Linux operating systems were adapted systemd.

```
# systemctl status apache2
● apache2.service - The Apache HTTP Server
 Loaded: loaded (/lib/systemd/system/apache2.service; disabled; vendor preset: enabled)
 Drop-In: /lib/systemd/system/apache2.service.d
 └─apache2-systemd.conf
 Active: active (running) since Tue 2018-09-25 10:03:28 IST; 3s ago
 Process: 3294 ExecStart=/usr/sbin/apachectl start (code=exited, status=0/SUCCESS)
 Main PID: 3317 (apache2)
 Tasks: 55 (limit: 4915)
 Memory: 7.9M
 CPU: 71ms
 CGroup: /system.slice/apache2.service
 ├─3317 /usr/sbin/apache2 -k start
 ├─3318 /usr/sbin/apache2 -k start
 └─3319 /usr/sbin/apache2 -k start

Sep 25 10:03:28 ubuntu systemd[1]: Starting The Apache HTTP Server...
Sep 25 10:03:28 ubuntu systemd[1]: Started The Apache HTTP Server.

```


--------------------------------------------------------------------------------

via: https://www.2daygeek.com/9-methods-to-check-find-the-process-id-pid-ppid-of-a-running-program-in-linux/

作者：[Magesh Maruthamuthu][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/magesh/
[1]: https://www.2daygeek.com/how-to-find-out-which-port-number-a-process-is-using-in-linux/
[2]: https://www.2daygeek.com/kill-terminate-a-process-in-linux-using-kill-pkill-killall-command/

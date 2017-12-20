4 Easiest Ways To Find Out Process ID (PID) In Linux
======
Everybody knows about PID, Exactly what is PID? Why you want PID? What are you going to do using PID? Are you having the same questions on your mind? If so, you are in the right place to get all the details.

Mainly, we are looking PID to kill an unresponsive program and it's similar to Windows task manager. Linux GUI also offering the same feature but CLI is an efficient way to perform the kill operation.

### What Is Process ID?

PID stands for process identification number which is generally used by most operating system kernels such as Linux, Unix, macOS and Windows. It is a unique identification number that is automatically assigned to each process when it is created in an operating system. A process is a running instance of a program.

**Suggested Read :** [How To Check Apache Web Server Uptime In Linux][1]

Each time process ID will be getting change to all the processes except init because init is always the first process on the system and is the ancestor of all other processes. It's PID is 1.

The default maximum value of PIDs is `32,768`. The same has been verified by running the following command on your system `cat /proc/sys/kernel/pid_max`. On 32-bit systems 32768 is the maximum value but we can set to any value up to 2^22 (approximately 4 million) on 64-bit systems.

You may ask, why we need such amount of PIDs? because we can't reused the PIDs immediately that's why. Also in order to prevent possible errors.

The PIDs for the running processes on the system can be found by using the pidof command, pgrep command, ps command, and pstree command.

### Method-1 : Using pidof Command

pidof used to find the process ID of a running program. It's prints those id's on the standard output. To demonstrate this, we are going to find out the Apache2 process id from Debian 9 (stretch) system.
```
# pidof apache2
3754 2594 2365 2364 2363 2362 2361

```

From the above output you may face difficulties to identify the Process ID because it's shows all the PIDs (included Parent and Childs) aginst the process name. Hence we need to find out the parent PID (PPID), which is the one we are looking. It could be the first number. In my case it's `3754` and it's shorted in descending order.

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

This also similar to the above output but it's shorting the results in ascending order, which clearly says that the parent PID is the last one. In my case it's `3754`.

**Note :** If you have more than one process id of the process, you may face trouble to identify the parent process id when using pidof & pgrep command.

### Method-3 : Using pstree Command

pstree shows running processes as a tree. The tree is rooted at either pid or init if pid is omitted. If a user name is specified in the pstree command then it's shows all the process owned by the corresponding user.

pstree visually merges identical branches by putting them in square brackets and prefixing them with the repetition count.
```
# pstree -p | grep "apache2"
 |- apache2(3754) -|-apache2(2361)
 | |-apache2(2362)
 | |-apache2(2363)
 | |-apache2(2364)
 | |-apache2(2365)
 | `-apache2(2594)

```

To get parent process alone, use the following format.
```
# pstree -p | grep "apache2" | head -1
 |- apache2(3754) -|-apache2(2361)

```

pstree command is very simple because it's segregating the Parent and Child processes separately but it's not easy when using pidof & pgrep command.

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

From the above output we can easily identify the parent process id (PPID) based on the process start date. In my case apache2 process was started @ `Dec11` which is the parent and others are child's. PID of apache2 is `3754`.

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/how-to-check-find-the-process-id-pid-ppid-of-a-running-program-in-linux/

作者：[Magesh Maruthamuthu][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.2daygeek.com/author/magesh/
[1]:https://www.2daygeek.com/check-find-apache-httpd-web-server-uptime-linux/

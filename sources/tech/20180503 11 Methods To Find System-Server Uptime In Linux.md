11 Methods To Find System/Server Uptime In Linux
======
Do you want to know, how long your Linux system has been running without downtime? when the system is up and what date.

There are multiple commands is available in Linux to check server/system uptime and most of users prefer the standard and very famous command called `uptime` to get this details.

Server uptime is not important for some people but it’s very important for server administrators when the server running with mission-critical applications such as online shopping portal, netbanking portal, etc,.

It must be zero downtime because if there is a down time then it will impact badly to million users.

As i told, many commands are available to check server uptime in Linux. In this tutorial we are going teach you how to check this using below 11 methods.

Uptime means how long the server has been up since its last shutdown or reboot.

The uptime command the fetch the details from `/proc` files and print the server uptime, the `/proc` file is not directly readable by humans.

The below commands will print how long the system has been running and up. It also shows some additional information.

### Method-1 : Using uptime Command

uptime command will tell how long the system has been running. It gives a one line display of the following information.

The current time, how long the system has been running, how many users are currently logged on, and the system load averages for the past 1, 5, and 15 minutes.
```
# uptime

 08:34:29 up 21 days, 5:46, 1 user, load average: 0.06, 0.04, 0.00

```

### Method-2 : Using w Command

w command provides a quick summary of every user logged into a computer, what each user is currently doing,
and what load all the activity is imposing on the computer itself. The command is a one-command combination of several other Unix programs: who, uptime, and ps -a.
```
# w

 08:35:14 up 21 days, 5:47, 1 user, load average: 0.26, 0.09, 0.02
USER TTY FROM [email protected] IDLE JCPU PCPU WHAT
root pts/1 103.5.134.167 08:34 0.00s 0.01s 0.00s w

```

### Method-3 : Using top Command

Top command is one of the basic command to monitor real-time system processes in Linux. It display system information and running processes information like uptime, average load, tasks running, number of users logged in, number of CPUs & cpu utilization, Memory & swap information. Run top command then hit E to bring the memory utilization in MB.

**Suggested Read :** [TOP Command Examples to Monitor Server Performance][1]
```
# top -c

top - 08:36:01 up 21 days, 5:48, 1 user, load average: 0.12, 0.08, 0.02
Tasks: 98 total, 1 running, 97 sleeping, 0 stopped, 0 zombie
Cpu(s): 0.0%us, 0.3%sy, 0.0%ni, 99.7%id, 0.0%wa, 0.0%hi, 0.0%si, 0.0%st
Mem: 1872888k total, 1454644k used, 418244k free, 175804k buffers
Swap: 2097148k total, 0k used, 2097148k free, 1098140k cached

 PID USER PR NI VIRT RES SHR S %CPU %MEM TIME+ COMMAND
 1 root 20 0 19340 1492 1172 S 0.0 0.1 0:01.04 /sbin/init
 2 root 20 0 0 0 0 S 0.0 0.0 0:00.00 [kthreadd]
 3 root RT 0 0 0 0 S 0.0 0.0 0:00.00 [migration/0]
 4 root 20 0 0 0 0 S 0.0 0.0 0:34.32 [ksoftirqd/0]
 5 root RT 0 0 0 0 S 0.0 0.0 0:00.00 [stopper/0]

```

### Method-4 : Using who Command

who command displays a list of users who are currently logged into the computer. The who command is related to the command w, which provides the same information but also displays additional data and statistics.
```
# who -b

system boot 2018-04-12 02:48

```

### Method-5 : Using last Command

The last command displays a list of last logged in users. Last searches back through the file /var/log/wtmp and displays a list of all users logged in (and out) since that file was created.
```
# last reboot -F | head -1 | awk '{print $5,$6,$7,$8,$9}'

Thu Apr 12 02:48:04 2018

```

### Method-6 : Using /proc/uptime File

This file contains information detailing how long the system has been on since its last restart. The output of `/proc/uptime` is quite minimal.

The first number is the total number of seconds the system has been up. The second number is how much of that time the machine has spent idle, in seconds.
```
# cat /proc/uptime

1835457.68 1809207.16

```

# date -d “$(Method-7 : Using tuptime Command

Tuptime is a tool for report the historical and statistical running time of the system, keeping it between restarts. Like uptime command but with more interesting output.
```
$ tuptime

```

### Method-8 : Using htop Command

htop is an interactive process viewer for Linux which was developed by Hisham using ncurses library. Htop have many of features and options compared to top command.

**Suggested Read :** [Monitor system resources using Htop command][2]
```
# htop

 CPU[| 0.5%] Tasks: 48, 5 thr; 1 running
 Mem[||||||||||||||||||||||||||||||||||||||||||||||||||| 165/1828MB] Load average: 0.10 0.05 0.01
 Swp[ 0/2047MB] Uptime: 21 days, 05:52:35

 PID USER PRI NI VIRT RES SHR S CPU% MEM% TIME+ Command
29166 root 20 0 110M 2484 1240 R 0.0 0.1 0:00.03 htop
29580 root 20 0 11464 3500 1032 S 0.0 0.2 55:15.97 /bin/sh ./OSWatcher.sh 10 1
 1 root 20 0 19340 1492 1172 S 0.0 0.1 0:01.04 /sbin/init
 486 root 16 -4 10780 900 348 S 0.0 0.0 0:00.07 /sbin/udevd -d
 748 root 18 -2 10780 932 360 S 0.0 0.0 0:00.00 /sbin/udevd -d

```

### Method-9 : Using glances Command

Glances is a cross-platform curses-based system monitoring tool written in Python. We can say all in one place, like maximum of information in a minimum of space. It uses psutil library to get information from your system.

Glances capable to monitor CPU, Memory, Load, Process list, Network interface, Disk I/O, Raid, Sensors, Filesystem (and folders), Docker, Monitor, Alert, System info, Uptime, Quicklook (CPU, MEM, LOAD), etc,.

**Suggested Read :** [Glances (All in one Place)– An Advanced Real Time System Performance Monitoring Tool for Linux][3]
```
glances

ubuntu (Ubuntu 17.10 64bit / Linux 4.13.0-37-generic) - IP 192.168.1.6/24 Uptime: 21 days, 05:55:15

CPU [|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| 90.6%] CPU - 90.6% nice: 0.0% ctx_sw: 4K MEM \ 78.4% active: 942M SWAP - 5.9% LOAD 2-core
MEM [||||||||||||||||||||||||||||||||||||||||||||||||||||||||| 78.0%] user: 55.1% irq: 0.0% inter: 1797 total: 1.95G inactive: 562M total: 12.4G 1 min: 4.35
SWAP [|||| 5.9%] system: 32.4% iowait: 1.8% sw_int: 897 used: 1.53G buffers: 14.8M used: 749M 5 min: 4.38
 idle: 7.6% steal: 0.0% free: 431M cached: 273M free: 11.7G 15 min: 3.38

NETWORK Rx/s Tx/s TASKS 211 (735 thr), 4 run, 207 slp, 0 oth sorted automatically by memory_percent, flat view
docker0 0b 232b
enp0s3 12Kb 4Kb Systemd 7 Services loaded: 197 active: 196 failed: 1
lo 616b 616b
_h478e48e 0b 232b CPU% MEM% VIRT RES PID USER NI S TIME+ R/s W/s Command
 63.8 18.9 2.33G 377M 2536 daygeek 0 R 5:57.78 0 0 /usr/lib/firefox/firefox -contentproc -childID 1 -isForBrowser -intPrefs 6:50|7:-1|19:0|34:1000|42:20|43:5|44:10|51
DefaultGateway 83ms 78.5 10.9 3.46G 217M 2039 daygeek 0 S 21:07.46 0 0 /usr/bin/gnome-shell
 8.5 10.1 2.32G 201M 2464 daygeek 0 S 8:45.69 0 0 /usr/lib/firefox/firefox -new-window
DISK I/O R/s W/s 1.1 8.5 2.19G 170M 2653 daygeek 0 S 2:56.29 0 0 /usr/lib/firefox/firefox -contentproc -childID 4 -isForBrowser -intPrefs 6:50|7:-1|19:0|34:1000|42:20|43:5|44:10|51
dm-0 0 0 1.7 7.2 2.15G 143M 2880 daygeek 0 S 7:10.46 0 0 /usr/lib/firefox/firefox -contentproc -childID 6 -isForBrowser -intPrefs 6:50|7:-1|19:0|34:1000|42:20|43:5|44:10|51
sda1 9.46M 12K 0.0 4.9 1.78G 97.2M 6125 daygeek 0 S 1:36.57 0 0 /usr/lib/firefox/firefox -contentproc -childID 7 -isForBrowser -intPrefs 6:50|7:-1|19:0|34:1000|42:20|43:5|44:10|51

```

### Method-10 : Using stat Command

stat command displays the detailed status of a particular file or a file system.
```
# stat /var/log/dmesg | grep Modify

Modify: 2018-04-12 02:48:04.027999943 -0400

```

### Method-11 : Using procinfo Command

procinfo gathers some system data from the /proc directory and prints it nicely formatted on the standard output device.
```
# procinfo | grep Bootup

Bootup: Fri Apr 20 19:40:14 2018 Load average: 0.16 0.05 0.06 1/138 16615

```

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/11-methods-to-find-check-system-server-uptime-in-linux/

作者：[Magesh Maruthamuthu][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.2daygeek.com/author/magesh/
[1]:https://www.2daygeek.com/top-command-examples-to-monitor-server-performance/
[2]:https://www.2daygeek.com/htop-command-examples-to-monitor-system-resources/
[3]:https://www.2daygeek.com/install-glances-advanced-real-time-linux-system-performance-monitoring-tool-on-centos-fedora-ubuntu-debian-opensuse-arch-linux/

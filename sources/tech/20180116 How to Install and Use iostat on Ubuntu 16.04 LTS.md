How to Install and Use iostat on Ubuntu 16.04 LTS
======

iostat also known as input/output statistics is a popular Linux system monitoring tool that can be used to collect statistics of input and output devices. It allows users to identify performance issues of local disk, remote disk and system information. The iostat create reports, the CPU Utilization report, the Device Utilization report and the Network Filesystem report.

In this tutorial, we will learn how to install iostat on Ubuntu 16.04 and how to use it.

### Prerequisite

  * Ubuntu 16.04 desktop installed on your system.
  * Non-root user with sudo privileges setup on your system



### Install iostat

By default, iostat is included with sysstat package in Ubuntu 16.04. You can easily install it by just running the following command:

```
sudo apt-get install sysstat -y
```

Once sysstat is installed, you can proceed to the next step.

### iostat Basic Example

Let's start by running the iostat command without any argument. This will displays information about the CPU usage, and I/O statistics of your system:

```
iostat
```

You should see the following output:
```
Linux 3.19.0-25-generic (Ubuntu-PC) 	Saturday 16 December 2017 	_x86_64_	(4 CPU)

avg-cpu: %user %nice %system %iowait %steal %idle
 22.67 0.52 6.99 1.88 0.00 67.94

Device: tps kB_read/s kB_wrtn/s kB_read kB_wrtn
sda 15.15 449.15 119.01 771022 204292

```

In the above output, the first line display, Linux kernel version and hostname. Next two lines displays CPU statistics like, average CPU usage, percentage of time the CPU were idle and waited for I/O response, percentage of waiting time of virtual CPU and the percentage of time the CPU is idle. Next two lines displays the device utilization report like, number of blocks read and write per second and total block reads and write per second.

By default iostat displays the report with current date. If you want to display the current time, run the following command:

```
iostat -t
```

You should see the following output:
```
Linux 3.19.0-25-generic (Ubuntu-PC) 	Saturday 16 December 2017 	_x86_64_	(4 CPU)

Saturday 16 December 2017 09:44:55 IST
avg-cpu: %user %nice %system %iowait %steal %idle
 21.37 0.31 6.93 1.28 0.00 70.12

Device: tps kB_read/s kB_wrtn/s kB_read kB_wrtn
sda 9.48 267.80 79.69 771022 229424

```

To check the version of the iostat, run the following command:

```
iostat -V
```

Output:
```
sysstat version 10.2.0
(C) Sebastien Godard (sysstat orange.fr)

```

You can listout all the options available with iostat command using the following command:

```
iostat --help
```

Output:
```
Usage: iostat [ options ] [ [ ] ]
Options are:
[ -c ] [ -d ] [ -h ] [ -k | -m ] [ -N ] [ -t ] [ -V ] [ -x ] [ -y ] [ -z ]
[ -j { ID | LABEL | PATH | UUID | ... } ]
[ [ -T ] -g ] [ -p [ [,...] | ALL ] ]
[ [...] | ALL ]

```

### iostat Advance Usage Example

If you want to view only the device report only once, run the following command:

```
iostat -d
```

You should see the following output:
```
Linux 3.19.0-25-generic (Ubuntu-PC) 	Saturday 16 December 2017 	_x86_64_	(4 CPU)

Device: tps kB_read/s kB_wrtn/s kB_read kB_wrtn
sda 12.18 353.66 102.44 771022 223320

```

To view the device report continuously for every 5 seconds, for 3 times:

```
iostat -d 5 3
```

You should see the following output:
```
Linux 3.19.0-25-generic (Ubuntu-PC) 	Saturday 16 December 2017 	_x86_64_	(4 CPU)

Device: tps kB_read/s kB_wrtn/s kB_read kB_wrtn
sda 11.77 340.71 98.95 771022 223928

Device: tps kB_read/s kB_wrtn/s kB_read kB_wrtn
sda 2.00 0.00 8.00 0 40

Device: tps kB_read/s kB_wrtn/s kB_read kB_wrtn
sda 0.60 0.00 3.20 0 16

```

If you want to view the statistics of specific devices, run the following command:

```
iostat -p sda
```

You should see the following output:
```
Linux 3.19.0-25-generic (Ubuntu-PC) 	Saturday 16 December 2017 	_x86_64_	(4 CPU)

avg-cpu: %user %nice %system %iowait %steal %idle
 21.69 0.36 6.98 1.44 0.00 69.53

Device: tps kB_read/s kB_wrtn/s kB_read kB_wrtn
sda 11.00 316.91 92.38 771022 224744
sda1 0.07 0.27 0.00 664 0
sda2 0.01 0.05 0.00 128 0
sda3 0.07 0.27 0.00 648 0
sda4 10.56 315.21 92.35 766877 224692
sda5 0.12 0.48 0.02 1165 52
sda6 0.07 0.32 0.00 776 0

```

You can also view the statistics of multiple devices with the following command:

```
iostat -p sda, sdb, sdc
```

If you want to displays the device I/O statistics in MB/second, run the following command:

```
iostat -m
```

You should see the following output:
```
Linux 3.19.0-25-generic (Ubuntu-PC) 	Saturday 16 December 2017 	_x86_64_	(4 CPU)

avg-cpu: %user %nice %system %iowait %steal %idle
 21.39 0.31 6.94 1.30 0.00 70.06

Device: tps MB_read/s MB_wrtn/s MB_read MB_wrtn
sda 9.67 0.27 0.08 752 223

```

If you want to view the extended information for a specific partition (sda4), run the following command:

```
iostat -x sda4
```

You should see the following output:
```
Linux 3.19.0-25-generic (Ubuntu-PC) 	Saturday 16 December 2017 	_x86_64_	(4 CPU)

avg-cpu: %user %nice %system %iowait %steal %idle
 21.26 0.28 6.87 1.19 0.00 70.39

Device: rrqm/s wrqm/s r/s w/s rkB/s wkB/s avgrq-sz avgqu-sz await r_await w_await svctm %util
sda4 0.79 4.65 5.71 2.68 242.76 73.28 75.32 0.35 41.80 43.66 37.84 4.55 3.82

```

If you want to displays only the CPU usage statistics, run the following command:

```
iostat -c
```

You should see the following output:
```
Linux 3.19.0-25-generic (Ubuntu-PC) 	Saturday 16 December 2017 	_x86_64_	(4 CPU)

avg-cpu: %user %nice %system %iowait %steal %idle
 21.45 0.33 6.96 1.34 0.00 69.91

```

--------------------------------------------------------------------------------

via: https://www.howtoforge.com/tutorial/how-to-install-and-use-iostat-on-ubuntu-1604/

作者：[Hitesh Jethva][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.howtoforge.com

[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How To Monitor Disk I/O Activity Using iotop And iostat Commands In Linux?)
[#]: via: (https://www.2daygeek.com/check-monitor-disk-io-in-linux-using-iotop-iostat-command/)
[#]: author: (Magesh Maruthamuthu https://www.2daygeek.com/author/magesh/)

How To Monitor Disk I/O Activity Using iotop And iostat Commands In Linux?
======

Do you know what are the tools we can use for troubleshooting or monitoring real-time disk activity in Linux?

If **[Linux system performance][1]** gets slow down we may use **[top command][2]** to see the system performance.

It is used to check what are the processes are consuming high utilization on server.

It’s common for most of the Linux administrator.

It’s widely used by Linux administrator in the real world.

If you don’t see much difference in the process output still you have an option to check other things.

I would like to advise you to check `wa` status in the top output because most of the time the server performance will be degraded due to high I/O Read and Write on hard disk.

If it’s high or fluctuation, it could be a cause. So, we need to check I/O activity on hard drive.

We can monitory disk I/O statistics for all disks and file system in Linux system using `iotop` and `iostat` commands.

### What Is iotop?

iotop is a top-like utility for displaying real-time disk activity.

iotop watches I/O usage information output by the Linux kernel and displays a table of current I/O usage by processes or threads on the system.

It displays the I/O bandwidth read and written by each process/thread. It also displays the percentage of time the thread/process spent while swapping in and while waiting on I/O.

Total DISK READ and Total DISK WRITE values represent total read and write bandwidth between processes and kernel threads on the one side and kernel block device subsystem on the other.

Actual DISK READ and Actual DISK WRITE values represent corresponding bandwidths for actual disk I/O between kernel block device subsystem and underlying hardware (HDD, SSD, etc.).

### How To Install iotop In Linux?

We can easily install it with help of package manager since the package is available in all the Linux distributions repository.

For **`Fedora`** system, use **[DNF Command][3]** to install iotop.

```
$ sudo dnf install iotop
```

For **`Debian/Ubuntu`** systems, use **[APT-GET Command][4]** or **[APT Command][5]** to install iotop.

```
$ sudo apt install iotop
```

For **`Arch Linux`** based systems, use **[Pacman Command][6]** to install iotop.

```
$ sudo pacman -S iotop
```

For **`RHEL/CentOS`** systems, use **[YUM Command][7]** to install iotop.

```
$ sudo yum install iotop
```

For **`openSUSE Leap`** system, use **[Zypper Command][8]** to install iotop.

```
$ sudo zypper install iotop
```

### How To Monitor Disk I/O Activity/Statistics In Linux Using iotop Command?

There are many options are available in iotop command to check varies statistics about disk I/O.

Run the iotop command without any arguments to see each process or thread current I/O usage.

```
# iotop
```

[![][9]![][9]][10]

If you would like to check which process are actually doing IO then run the iotop command with `-o` or `--only` option.

```
# iotop --only
```

[![][9]![][9]][11]

**Details:**

  * **`IO:`** It shows I/O utilization for each process, which includes disk and swap.
  * **`SWAPIN:`** It shows only the swap usage of each process.



### What Is iostat?

iostat is used to report Central Processing Unit (CPU) statistics and input/output statistics for devices and partitions.

The iostat command is used for monitoring system input/output device loading by observing the time the devices are active in relation to their average transfer rates.

The iostat command generates reports that can be used to change system configuration to better balance the input/output load between physical disks.

All statistics are reported each time the iostat command is run. The report consists of a CPU header row followed by a row of CPU statistics.

On multiprocessor systems, CPU statistics are calculated system-wide as averages among all processors. A device header row is displayed followed by a line of statistics for each device that is configured.

The iostat command generates two types of reports, the CPU Utilization report and the Device Utilization report.

### How To Install iostat In Linux?

iostat tool is part of sysstat package so, We can easily install it with help of package manager since the package is available in all the Linux distributions repository.

For **`Fedora`** system, use **[DNF Command][3]** to install sysstat.

```
$ sudo dnf install sysstat
```

For **`Debian/Ubuntu`** systems, use **[APT-GET Command][4]** or **[APT Command][5]** to install sysstat.

```
$ sudo apt install sysstat
```

For **`Arch Linux`** based systems, use **[Pacman Command][6]** to install sysstat.

```
$ sudo pacman -S sysstat
```

For **`RHEL/CentOS`** systems, use **[YUM Command][7]** to install sysstat.

```
$ sudo yum install sysstat
```

For **`openSUSE Leap`** system, use **[Zypper Command][8]** to install sysstat.

```
$ sudo zypper install sysstat
```

### How To Monitor Disk I/O Activity/Statistics In Linux Using sysstat Command?

There are many options are available in iostat command to check varies statistics about disk I/O and CPU.

Run the iostat command without any arguments to see complete statistics of the system.

```
# iostat

Linux 4.19.32-1-MANJARO (daygeek-Y700)  Thursday 18 April 2019  _x86_64_    (8 CPU)

avg-cpu:  %user   %nice %system %iowait  %steal   %idle
          29.45    0.02   16.47    0.12    0.00   53.94

Device             tps    kB_read/s    kB_wrtn/s    kB_dscd/s    kB_read    kB_wrtn    kB_dscd
nvme0n1           6.68       126.95       124.97         0.00   58420014   57507206          0
sda               0.18         6.77        80.24         0.00    3115036   36924764          0
loop0             0.00         0.00         0.00         0.00       2160          0          0
loop1             0.00         0.00         0.00         0.00       1093          0          0
loop2             0.00         0.00         0.00         0.00       1077          0          0
```

Run the iostat command with `-d` option to see I/O statistics for all the devices

```
# iostat -d

Linux 4.19.32-1-MANJARO (daygeek-Y700)  Thursday 18 April 2019  _x86_64_    (8 CPU)

Device             tps    kB_read/s    kB_wrtn/s    kB_dscd/s    kB_read    kB_wrtn    kB_dscd
nvme0n1           6.68       126.95       124.97         0.00   58420030   57509090          0
sda               0.18         6.77        80.24         0.00    3115292   36924764          0
loop0             0.00         0.00         0.00         0.00       2160          0          0
loop1             0.00         0.00         0.00         0.00       1093          0          0
loop2             0.00         0.00         0.00         0.00       1077          0          0
```

Run the iostat command with `-p` option to see I/O statistics for all the devices and their partitions.

```
# iostat -p

Linux 4.19.32-1-MANJARO (daygeek-Y700)  Thursday 18 April 2019  _x86_64_    (8 CPU)

avg-cpu:  %user   %nice %system %iowait  %steal   %idle
          29.42    0.02   16.45    0.12    0.00   53.99

Device             tps    kB_read/s    kB_wrtn/s    kB_dscd/s    kB_read    kB_wrtn    kB_dscd
nvme0n1           6.68       126.94       124.96         0.00   58420062   57512278          0
nvme0n1p1         6.40       124.46       118.36         0.00   57279753   54474898          0
nvme0n1p2         0.27         2.47         6.60         0.00    1138069    3037380          0
sda               0.18         6.77        80.23         0.00    3116060   36924764          0
sda1              0.00         0.01         0.00         0.00       3224          0          0
sda2              0.18         6.76        80.23         0.00    3111508   36924764          0
loop0             0.00         0.00         0.00         0.00       2160          0          0
loop1             0.00         0.00         0.00         0.00       1093          0          0
loop2             0.00         0.00         0.00         0.00       1077          0          0
```

Run the iostat command with `-x` option to see detailed I/O statistics for all the devices.

```
# iostat -x

Linux 4.19.32-1-MANJARO (daygeek-Y700)  Thursday 18 April 2019  _x86_64_    (8 CPU)

avg-cpu:  %user   %nice %system %iowait  %steal   %idle
          29.41    0.02   16.45    0.12    0.00   54.00

Device            r/s     rkB/s   rrqm/s  %rrqm r_await rareq-sz     w/s     wkB/s   wrqm/s  %wrqm w_await wareq-sz     d/s     dkB/s   drqm/s  %drqm d_await dareq-sz  aqu-sz  %util
nvme0n1          2.45    126.93     0.60  19.74    0.40    51.74    4.23    124.96     5.12  54.76    3.16    29.54    0.00      0.00     0.00   0.00    0.00     0.00    0.31  30.28
sda              0.06      6.77     0.00   0.00    8.34   119.20    0.12     80.23    19.94  99.40   31.84   670.73    0.00      0.00     0.00   0.00    0.00     0.00    0.00   0.13
loop0            0.00      0.00     0.00   0.00    0.08    19.64    0.00      0.00     0.00   0.00    0.00     0.00    0.00      0.00     0.00   0.00    0.00     0.00    0.00   0.00
loop1            0.00      0.00     0.00   0.00    0.40    12.86    0.00      0.00     0.00   0.00    0.00     0.00    0.00      0.00     0.00   0.00    0.00     0.00    0.00   0.00
loop2            0.00      0.00     0.00   0.00    0.38    19.58    0.00      0.00     0.00   0.00    0.00     0.00    0.00      0.00     0.00   0.00    0.00     0.00    0.00   0.00
```

Run the iostat command with `-d [Device_Name]` option to see I/O statistics of particular device and their partitions.

```
# iostat -p [Device_Name]

# iostat -p sda

Linux 4.19.32-1-MANJARO (daygeek-Y700)  Thursday 18 April 2019  _x86_64_    (8 CPU)

avg-cpu:  %user   %nice %system %iowait  %steal   %idle
          29.38    0.02   16.43    0.12    0.00   54.05

Device             tps    kB_read/s    kB_wrtn/s    kB_dscd/s    kB_read    kB_wrtn    kB_dscd
sda               0.18         6.77        80.21         0.00    3117468   36924764          0
sda2              0.18         6.76        80.21         0.00    3112916   36924764          0
sda1              0.00         0.01         0.00         0.00       3224          0          0
```

Run the iostat command with `-m` option to see I/O statistics with `MB` for all the devices instead of `KB`. By default it shows the output with KB.

```
# iostat -m

Linux 4.19.32-1-MANJARO (daygeek-Y700)  Thursday 18 April 2019  _x86_64_    (8 CPU)

avg-cpu:  %user   %nice %system %iowait  %steal   %idle
          29.36    0.02   16.41    0.12    0.00   54.09

Device             tps    MB_read/s    MB_wrtn/s    MB_dscd/s    MB_read    MB_wrtn    MB_dscd
nvme0n1           6.68         0.12         0.12         0.00      57050      56176          0
sda               0.18         0.01         0.08         0.00       3045      36059          0
loop0             0.00         0.00         0.00         0.00          2          0          0
loop1             0.00         0.00         0.00         0.00          1          0          0
loop2             0.00         0.00         0.00         0.00          1          0          0
```

Run the iostat command with certain interval then use the following format. In this example, we are going to capture totally two reports at five seconds interval.

```
# iostat [Interval] [Number Of Reports]

# iostat 5 2

Linux 4.19.32-1-MANJARO (daygeek-Y700)  Thursday 18 April 2019  _x86_64_    (8 CPU)

avg-cpu:  %user   %nice %system %iowait  %steal   %idle
          29.35    0.02   16.41    0.12    0.00   54.10

Device             tps    kB_read/s    kB_wrtn/s    kB_dscd/s    kB_read    kB_wrtn    kB_dscd
nvme0n1           6.68       126.89       124.95         0.00   58420116   57525344          0
sda               0.18         6.77        80.20         0.00    3118492   36924764          0
loop0             0.00         0.00         0.00         0.00       2160          0          0
loop1             0.00         0.00         0.00         0.00       1093          0          0
loop2             0.00         0.00         0.00         0.00       1077          0          0

avg-cpu:  %user   %nice %system %iowait  %steal   %idle
           3.71    0.00    2.51    0.05    0.00   93.73

Device             tps    kB_read/s    kB_wrtn/s    kB_dscd/s    kB_read    kB_wrtn    kB_dscd
nvme0n1          19.00         0.20       311.40         0.00          1       1557          0
sda               0.20        25.60         0.00         0.00        128          0          0
loop0             0.00         0.00         0.00         0.00          0          0          0
loop1             0.00         0.00         0.00         0.00          0          0          0
loop2             0.00         0.00         0.00         0.00          0          0          0
```

Run the iostat command with `-N` option to see the LVM disk I/O statistics report.

```
# iostat -N

Linux 4.15.0-47-generic (Ubuntu18.2daygeek.com)     Thursday 18 April 2019  _x86_64_    (2 CPU)

avg-cpu:  %user   %nice %system %iowait  %steal   %idle
           0.38    0.07    0.18    0.26    0.00   99.12

Device             tps    kB_read/s    kB_wrtn/s    kB_read    kB_wrtn
sda               3.60        57.07        69.06     968729    1172340
sdb               0.02         0.33         0.00       5680          0
sdc               0.01         0.12         0.00       2108          0
2g-2gvol1         0.00         0.07         0.00       1204          0
```

Run the nfsiostat command to see the I/O statistics for Network File System(NFS).

```
# nfsiostat
```

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/check-monitor-disk-io-in-linux-using-iotop-iostat-command/

作者：[Magesh Maruthamuthu][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/magesh/
[b]: https://github.com/lujun9972
[1]: https://www.2daygeek.com/category/monitoring-tools/
[2]: https://www.2daygeek.com/linux-top-command-linux-system-performance-monitoring-tool/
[3]: https://www.2daygeek.com/dnf-command-examples-manage-packages-fedora-system/
[4]: https://www.2daygeek.com/apt-get-apt-cache-command-examples-manage-packages-debian-ubuntu-systems/
[5]: https://www.2daygeek.com/apt-command-examples-manage-packages-debian-ubuntu-systems/
[6]: https://www.2daygeek.com/pacman-command-examples-manage-packages-arch-linux-system/
[7]: https://www.2daygeek.com/yum-command-examples-manage-packages-rhel-centos-systems/
[8]: https://www.2daygeek.com/zypper-command-examples-manage-packages-opensuse-system/
[9]: data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[10]: https://www.2daygeek.com/wp-content/uploads/2015/03/monitor-disk-io-activity-using-iotop-iostat-command-in-linux-1.jpg
[11]: https://www.2daygeek.com/wp-content/uploads/2015/03/monitor-disk-io-activity-using-iotop-iostat-command-in-linux-2.jpg

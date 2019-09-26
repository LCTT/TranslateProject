[#]: collector: (lujun9972)
[#]: translator: (warmfrog)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10815-1.html)
[#]: subject: (How To Monitor Disk I/O Activity Using iotop And iostat Commands In Linux?)
[#]: via: (https://www.2daygeek.com/check-monitor-disk-io-in-linux-using-iotop-iostat-command/)
[#]: author: (Magesh Maruthamuthu https://www.2daygeek.com/author/magesh/)

在 Linux 中如何使用 iotop 和 iostat 监控磁盘 I/O 活动？
======================================

你知道在 Linux 中我们使用什么工具检修和监控实时的磁盘活动吗？如果 [Linux 系统性能][1]变慢，我们会用 [top 命令][2] 来查看系统性能。它被用来检查是什么进程在服务器上占有如此高的使用率，对于大多数 Linux 系统管理员来说很常见，现实世界中被 Linux 系统管理员广泛采用。

如果在进程输出中你没有看到很大的不同，你仍然有选择查看其他东西。我会建议你在 `top` 输出中检查 `wa` 状态，因为大多数时间里服务器性能由于在硬盘上的高 I/O 读和写降低了性能。如果它很高或者波动，很可能就是它造成的。因此，我们需要检查硬盘上的 I/O 活动。

我们可以在 Linux 中使用 `iotop` 和  `iostat` 命令监控所有的磁盘和文件系统的磁盘 I/O 统计。

### 什么是 iotop？

`iotop` 是一个类似 `top` 的工具，用来显示实时的磁盘活动。

`iotop` 监控 Linux 内核输出的 I/O 使用信息，并且显示一个系统中进程或线程的当前 I/O 使用情况。

它显示每个进程/线程读写 I/O 带宽。它同样显示当等待换入和等待 I/O 的线程/进程花费的时间的百分比。

`Total DISK READ` 和 `Total DISK WRITE` 的值一方面表示了进程和内核线程之间的总的读写带宽，另一方面也表示内核块设备子系统的。

`Actual DISK READ` 和 `Actual DISK WRITE` 的值表示在内核块设备子系统和下面硬件（HDD、SSD 等等）对应的实际磁盘 I/O 带宽。

### 如何在 Linux 中安装 iotop ？

我们可以轻松在包管理器的帮助下安装，因为该软件包在所有的 Linux 发行版仓库中都可以获得。

对于 Fedora 系统，使用 [DNF 命令][3] 来安装 `iotop`。

```
$ sudo dnf install iotop
```

对于 Debian/Ubuntu 系统，使用 [API-GET 命令][4] 或者 [APT 命令][5] 来安装 `iotop`。

```
$ sudo apt install iotop
```

对于基于 Arch Linux 的系统，使用 [Pacman Command][6] 来安装 `iotop`。

```
$ sudo pacman -S iotop
```

对于 RHEL/CentOS 的系统，使用 [YUM Command][7] 来安装 `iotop`。

```
$ sudo yum install iotop
```

对于使用 openSUSE Leap 的系统，使用 [Zypper Command][8] 来安装 `iotop`。

```
$ sudo zypper install iotop
```

### 在 Linux 中如何使用 iotop 命令来监控磁盘 I/O 活动/统计？

`iotop` 命令有很多参数来检查关于磁盘 I/O 的变化：

```
# iotop
```

![10]

如果你想检查那个进程实际在做 I/O，那么运行 `iotop` 命令加上 `-o` 或者 `--only` 参数。

```
# iotop --only
```

![11]

细节：

  * `IO`：它显示每个进程的 I/O 利用率，包含磁盘和交换。
  * `SWAPIN`： 它只显示每个进程的交换使用率。

### 什么是 iostat？

`iostat` 被用来报告中央处理单元（CPU）的统计和设备与分区的输出/输出的统计。

`iostat` 命令通过观察与它们平均传输率相关的设备活跃时间来监控系统输入/输出设备负载。

`iostat` 命令生成的报告可以被用来改变系统配置来更好的平衡物理磁盘之间的输入/输出负载。

所有的统计都在 `iostat` 命令每次运行时被报告。该报告包含一个 CPU 头部，后面是一行 CPU 统计。

在多处理器系统中，CPU 统计被计算为系统层面的所有处理器的平均值。设备头行后紧跟显示每个配置的设备一行的统计。

`iostat` 命令生成两种类型的报告，CPU 利用率报告和设备利用率报告。

### 在 Linux 中怎样安装 iostat？

`iostat` 工具是 `sysstat` 包的一部分，所以我们可以轻松地在包管理器地帮助下安装，因为在所有的 Linux 发行版的仓库都是可以获得的。

对于 Fedora 系统，使用 [DNF Command][3] 来安装 `sysstat`。

```
$ sudo dnf install sysstat
```

对于 Debian/Ubuntu 系统，使用 [APT-GET Command][4] 或者 [APT Command][5] 来安装 `sysstat`。

```
$ sudo apt install sysstat
```

对于基于 Arch Linux 的系统，使用 [Pacman Command][6] 来安装 `sysstat`。

```
$ sudo pacman -S sysstat
```

对于 RHEL/CentOS 系统，使用 [YUM Command][7] 来安装 `sysstat`。

```
$ sudo yum install sysstat
```

对于 openSUSE Leap 系统，使用 [Zypper Command][8] 来安装 `sysstat`。

```
$ sudo zypper install sysstat
```

### 在 Linux 中如何使用 sysstat 命令监控磁盘 I/O 活动/统计？

在 `iostat` 命令中有很多参数来检查关于 I/O 和 CPU 的变化统计信息。

不加参数运行 `iostat` 命令会看到完整的系统统计。

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

运行 `iostat` 命令加上 `-d` 参数查看所有设备的 I/O 统计。

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

运行 `iostat` 命令加上 `-p` 参数查看所有的设备和分区的 I/O 统计。

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

运行 `iostat` 命令加上 `-x` 参数显示所有设备的详细的 I/O 统计信息。

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

运行 `iostat` 命令加上 `-d [设备名]` 参数查看具体设备和它的分区的 I/O 统计信息。

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

运行 `iostat` 命令加上 `-m` 参数以 MB 为单位而不是 KB 查看所有设备的统计。默认以 KB 显示输出。

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

运行 `iostat` 命令使用特定的间隔使用如下的格式。在这个例子中，我们打算以 5 秒捕获的间隔捕获两个报告。

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

运行 `iostat` 命令与 `-N` 参数来查看 LVM 磁盘 I/O 统计报告。

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

运行 `nfsiostat` 命令来查看 Network File System（NFS）的 I/O 统计。

```
# nfsiostat
```

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/check-monitor-disk-io-in-linux-using-iotop-iostat-command/

作者：[Magesh Maruthamuthu][a]
选题：[lujun9972][b]
译者：[warmfrog](https://github.com/warmfrog)
校对：[wxy](https://github.com/wxy)

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

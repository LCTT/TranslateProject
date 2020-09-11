[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10560-1.html)
[#]: subject: (PowerTOP – Monitors Power Usage and Improve Laptop Battery Life in Linux)
[#]: via: (https://www.2daygeek.com/powertop-monitors-laptop-battery-usage-linux/)
[#]: author: (Vinoth Kumar https://www.2daygeek.com/author/vinoth/)

PowerTOP：在 Linux 上监视电量使用和改善笔记本电池寿命
======

我们都知道，现在几乎都从 PC 机换到了笔记本电脑了。但是使用笔记本有个问题，我们希望电池耐用，我们可以使用到每一点电量。所以，我们需要知道电量都去哪里了，是不是浪费了。

你可以使用 PowerTOP 工具来查看没有接入电源线时电量都用在了何处。你需要在终端中使用超级用户权限来运行 PowerTOP 工具。它可以访问该电池硬件并测量电量使用情况。

### 什么是 PowerTOP

PowerTOP 是一个 Linux 工具，用于诊断电量消耗和电源管理的问题。

它是由 Intel 开发的，可以在内核、用户空间和硬件中启用各种节电模式。

除了作为一个一个诊断工具之外，PowweTop 还有一个交互模式，可以让你实验 Linux 发行版没有启用的各种电源管理设置。

它也能监控进程，并展示其中哪个正在使用 CPU，以及从休眠状态页将其唤醒，也可以找出电量消耗特别高的应用程序。

### 如何安装 PowerTOP

PowerTOP 软件包在大多数发行版的软件库中可用，使用发行版的 [包管理器][1] 安装即可。

对于 Fedora 系统，使用 [DNF 命令][2] 来安装 PowerTOP。

```
$ sudo dnf install powertop
```

对于 Debian/Ubuntu 系统，使用 [APT-GET 命令][3] 或 [APT 命令][4] 来安装 PowerTOP。

```
$ sudo apt install powertop
```

对于基于 Arch Linux 的系统，使用 [Pacman 命令][5] 来安装 PowerTOP。

```
$ sudo pacman -S powertop
```

对于 RHEL/CentOS 系统，使用 [YUM 命令][6] 来安装 PowerTOP。

```
$ sudo yum install powertop
```

对于 openSUSE Leap 系统，使用 [Zypper 命令][7] 来安装 PowerTOP。

```
$ sudo zypper install powertop
```

### 如何使用 PowerTOP

PowerTOP 需要超级用户权限，所以在 Linux 系统中以 root 身份运行 PowerTOP 工具。

默认情况下其显示 “概览” 页，在这里我们可以看到所有设备的电量消耗情况，也可以看到系统的唤醒秒数。

```
$ sudo powertop

PowerTOP v2.9     Overview   Idle stats   Frequency stats   Device stats   Tunables                                     

The battery reports a discharge rate of 12.6 W
The power consumed was 259 J
The estimated remaining time is 1 hours, 52 minutes

Summary: 1692.9 wakeups/second,  0.0 GPU ops/seconds, 0.0 VFS ops/sec and 54.9% CPU use

                Usage       Events/s    Category       Description
              9.3 ms/s     529.4        Timer          tick_sched_timer
            378.5 ms/s     139.8        Process        [PID 2991] /usr/lib/firefox/firefox -contentproc -childID 7 -isForBrowser -prefsLen 8314 -prefMapSize 173895 -schedulerPrefs 00
              7.5 ms/s     141.7        Timer          hrtimer_wakeup
              3.3 ms/s     102.7        Process        [PID 1527] /usr/lib/firefox/firefox --new-window
             11.6 ms/s      69.1        Process        [PID 1568] /usr/lib/firefox/firefox -contentproc -childID 1 -isForBrowser -prefsLen 1 -prefMapSize 173895 -schedulerPrefs 0001,
              6.2 ms/s      59.0        Process        [PID 1496] /usr/lib/firefox/firefox --new-window
              2.1 ms/s      59.6        Process        [PID 2466] /usr/lib/firefox/firefox -contentproc -childID 3 -isForBrowser -prefsLen 5814 -prefMapSize 173895 -schedulerPrefs 00
              1.8 ms/s      52.3        Process        [PID 2052] /usr/lib/firefox/firefox -contentproc -childID 4 -isForBrowser -prefsLen 5814 -prefMapSize 173895 -schedulerPrefs 00
              1.8 ms/s      50.8        Process        [PID 3034] /usr/lib/firefox/firefox -contentproc -childID 7 -isForBrowser -prefsLen 8314 -prefMapSize 173895 -schedulerPrefs 00
              3.6 ms/s      48.4        Process        [PID 3009] /usr/lib/firefox/firefox -contentproc -childID 7 -isForBrowser -prefsLen 8314 -prefMapSize 173895 -schedulerPrefs 00
              7.5 ms/s      46.2        Process        [PID 2996] /usr/lib/firefox/firefox -contentproc -childID 7 -isForBrowser -prefsLen 8314 -prefMapSize 173895 -schedulerPrefs 00
             25.2 ms/s      33.6        Process        [PID 1528] /usr/lib/firefox/firefox --new-window
              5.7 ms/s      32.2        Interrupt      [7] sched(softirq)
              2.1 ms/s      32.2        Process        [PID 1811] /usr/lib/firefox/firefox -contentproc -childID 4 -isForBrowser -prefsLen 5814 -prefMapSize 173895 -schedulerPrefs 00
             19.7 ms/s      25.0        Process        [PID 1794] /usr/lib/firefox/firefox -contentproc -childID 4 -isForBrowser -prefsLen 5814 -prefMapSize 173895 -schedulerPrefs 00
              1.9 ms/s      31.5        Process        [PID 1596] /usr/lib/firefox/firefox -contentproc -childID 1 -isForBrowser -prefsLen 1 -prefMapSize 173895 -schedulerPrefs 0001,
              3.1 ms/s      29.9        Process        [PID 1535] /usr/lib/firefox/firefox --new-window
              7.1 ms/s      28.2        Process        [PID 1488] /usr/lib/firefox/firefox --new-window
              1.8 ms/s      29.5        Process        [PID 1762] /usr/lib/firefox/firefox -contentproc -childID 3 -isForBrowser -prefsLen 5814 -prefMapSize 173895 -schedulerPrefs 00
              8.8 ms/s      23.3        Process        [PID 1121] /usr/bin/gnome-shell
              1.2 ms/s      21.8        Process        [PID 1657] /usr/lib/firefox/firefox -contentproc -childID 2 -isForBrowser -prefsLen 920 -prefMapSize 173895 -schedulerPrefs 000
             13.3 ms/s      13.9        Process        [PID 1746] /usr/lib/firefox/firefox -contentproc -childID 3 -isForBrowser -prefsLen 5814 -prefMapSize 173895 -schedulerPrefs 00
              2.7 ms/s      11.1        Process        [PID 3410] /usr/lib/gnome-terminal-server
              3.8 ms/s      10.8        Process        [PID 1057] /usr/lib/Xorg vt2 -displayfd 3 -auth /run/user/1000/gdm/Xauthority -nolisten tcp -background none -noreset -keeptty
              3.1 ms/s       9.8        Process        [PID 1629] /usr/lib/firefox/firefox -contentproc -childID 2 -isForBrowser -prefsLen 920 -prefMapSize 173895 -schedulerPrefs 000
              0.9 ms/s       6.7        Interrupt      [136] xhci_hcd
            278.0 us/s       6.4        Process        [PID 414] [irq/141-iwlwifi]
            128.7 us/s       5.7        Process        [PID 1] /sbin/init
            118.5 us/s       5.2        Process        [PID 10] [rcu_preempt]
             49.0 us/s       4.7        Interrupt      [0] HI_SOFTIRQ
            459.3 us/s       3.1        Interrupt      [142] i915
              2.1 ms/s       2.3        Process        [PID 3451] powertop
              8.4 us/s       2.7        kWork          intel_atomic_helper_free_state_
              1.2 ms/s       1.8        kWork          intel_atomic_commit_work
            374.2 us/s       2.1        Interrupt      [9] acpi
             42.1 us/s       1.8        kWork          intel_atomic_cleanup_work
              3.5 ms/s      0.25        kWork          delayed_fput
            238.0 us/s       1.5        Process        [PID 907] /usr/lib/upowerd
             17.7 us/s       1.5        Timer          intel_uncore_fw_release_timer
             26.4 us/s       1.4        Process        [PID 576] [i915/signal:0]
             19.8 us/s       1.3        Timer          watchdog_timer_fn
              1.1 ms/s      0.00        Process        [PID 206] [kworker/7:2]
              2.4 ms/s      0.00        Interrupt      [1] timer(softirq)
             13.4 us/s       0.9        Process        [PID 9] [ksoftirqd/0]

 Exit |  /  Navigate |
```

PowerTOP 的输出类似如上截屏，在你的机器上由于硬件不同会稍有不同。它的显示有很多页，你可以使用 `Tab` 和 `Shift+Tab` 在它们之间切换。

### 空闲状态页

它会显示处理器的各种信息。

```
PowerTOP v2.9     Overview   Idle stats   Frequency stats   Device stats   Tunables                                     


          Package   |             Core    |            CPU 0       CPU 4
                    |                     | C0 active   6.7%        7.2%
                    |                     | POLL        0.0%    0.1 ms  0.0%    0.1 ms
                    |                     | C1E         1.2%    0.2 ms  1.6%    0.3 ms
C2 (pc2)    7.5%    |                     |
C3 (pc3)   25.2%    | C3 (cc3)    0.7%    | C3          0.5%    0.2 ms  0.6%    0.1 ms
C6 (pc6)    0.0%    | C6 (cc6)    7.1%    | C6          6.6%    0.5 ms  6.3%    0.5 ms
C7 (pc7)    0.0%    | C7 (cc7)   59.8%    | C7s         0.0%    0.0 ms  0.0%    0.0 ms
C8 (pc8)    0.0%    |                     | C8         33.9%    1.6 ms 32.3%    1.5 ms
C9 (pc9)    0.0%    |                     | C9          2.1%    3.4 ms  0.7%    2.8 ms
C10 (pc10)  0.0%    |                     | C10        39.5%    4.7 ms 41.4%    4.7 ms

                    |             Core    |            CPU 1       CPU 5
                    |                     | C0 active   8.3%        7.2%
                    |                     | POLL        0.0%    0.0 ms  0.0%    0.1 ms
                    |                     | C1E         1.3%    0.2 ms  1.4%    0.3 ms
                    |                     |
                    | C3 (cc3)    0.5%    | C3          0.5%    0.2 ms  0.4%    0.2 ms
                    | C6 (cc6)    6.0%    | C6          5.3%    0.5 ms  4.7%    0.5 ms
                    | C7 (cc7)   59.3%    | C7s         0.0%    0.8 ms  0.0%    1.0 ms
                    |                     | C8         27.2%    1.5 ms 23.8%    1.4 ms
                    |                     | C9          1.6%    3.0 ms  0.5%    3.0 ms
                    |                     | C10        44.5%    4.7 ms 52.2%    4.6 ms

                    |             Core    |            CPU 2       CPU 6
                    |                     | C0 active  11.2%        8.4%
                    |                     | POLL        0.0%    0.0 ms  0.0%    0.0 ms
                    |                     | C1E         1.4%    0.4 ms  1.3%    0.3 ms
                    |                     |
                    | C3 (cc3)    0.3%    | C3          0.2%    0.1 ms  0.4%    0.2 ms
                    | C6 (cc6)    4.0%    | C6          3.7%    0.5 ms  4.3%    0.5 ms
                    | C7 (cc7)   54.2%    | C7s         0.0%    0.0 ms  0.0%    1.0 ms
                    |                     | C8         20.0%    1.5 ms 20.7%    1.4 ms
                    |                     | C9          1.0%    3.4 ms  0.4%    3.8 ms
                    |                     | C10        48.8%    4.6 ms 52.3%    5.0 ms

                    |             Core    |            CPU 3       CPU 7
                    |                     | C0 active   8.8%        8.1%
                    |                     | POLL        0.0%    0.1 ms  0.0%    0.0 ms
                    |                     | C1E         1.2%    0.2 ms  1.2%    0.2 ms
                    |                     |
                    | C3 (cc3)    0.6%    | C3          0.6%    0.2 ms  0.4%    0.2 ms
                    | C6 (cc6)    7.0%    | C6          7.5%    0.5 ms  4.4%    0.5 ms
                    | C7 (cc7)   56.8%    | C7s         0.0%    0.0 ms  0.0%    0.9 ms
                    |                     | C8         29.4%    1.4 ms 23.8%    1.4 ms
                    |                     | C9          1.1%    2.7 ms  0.7%    3.9 ms
                    |                     | C10        41.0%    4.0 ms 50.0%    4.8 ms


 Exit |  /  Navigate |
```

### 频率状态页

它会显示 CPU 的主频。

```
PowerTOP v2.9     Overview   Idle stats   Frequency stats   Device stats   Tunables                                     


            Package |             Core    |            CPU 0       CPU 4
                    |                     | Average      930 MHz    1101 MHz
Idle                | Idle                | Idle

                    |             Core    |            CPU 1       CPU 5
                    |                     | Average     1063 MHz     979 MHz
                    | Idle                | Idle

                    |             Core    |            CPU 2       CPU 6
                    |                     | Average      976 MHz     942 MHz
                    | Idle                | Idle

                    |             Core    |            CPU 3       CPU 7
                    |                     | Average      924 MHz     957 MHz
                    | Idle                | Idle

```

### 设备状态页

它仅针对设备显示其电量使用信息。

```
PowerTOP v2.9     Overview   Idle stats   Frequency stats   Device stats   Tunables                                     


The battery reports a discharge rate of 13.8 W
The power consumed was 280 J

              Usage     Device name
             46.7%        CPU misc
             46.7%        DRAM
             46.7%        CPU core
             19.0%        Display backlight
              0.0%        Audio codec hwC0D0: Realtek
              0.0%        USB device: Lenovo EasyCamera (160709000341)
            100.0%        PCI Device: Intel Corporation HD Graphics 530
            100.0%        Radio device: iwlwifi
            100.0%        PCI Device: O2 Micro, Inc. SD/MMC Card Reader Controller
            100.0%        PCI Device: Intel Corporation Xeon E3-1200 v5/E3-1500 v5/6th Gen Core Processor Host Bridge/DRAM Registers
            100.0%        USB device: Lenovo Wireless Optical Mouse N100
            100.0%        PCI Device: Intel Corporation Wireless 8260
            100.0%        PCI Device: Intel Corporation HM170/QM170 Chipset SATA Controller [AHCI Mode]
            100.0%        Radio device: btusb
            100.0%        PCI Device: Intel Corporation 100 Series/C230 Series Chipset Family PCI Express Root Port #4
            100.0%        USB device: xHCI Host Controller
            100.0%        PCI Device: Intel Corporation 100 Series/C230 Series Chipset Family USB 3.0 xHCI Controller
            100.0%        PCI Device: Realtek Semiconductor Co., Ltd. RTL8111/8168/8411 PCI Express Gigabit Ethernet Controller
            100.0%        PCI Device: Intel Corporation 100 Series/C230 Series Chipset Family PCI Express Root Port #3
            100.0%        PCI Device: Samsung Electronics Co Ltd NVMe SSD Controller SM951/PM951
            100.0%        PCI Device: Intel Corporation 100 Series/C230 Series Chipset Family PCI Express Root Port #2
            100.0%        PCI Device: Intel Corporation 100 Series/C230 Series Chipset Family PCI Express Root Port #9
            100.0%        PCI Device: Intel Corporation 100 Series/C230 Series Chipset Family SMBus
             26.1 pkts/s  Network interface: wlp8s0 (iwlwifi)
              0.0%        USB device: usb-device-8087-0a2b
              0.0%        runtime-reg-dummy
              0.0%        Audio codec hwC0D2: Intel
              0.0 pkts/s  Network interface: enp9s0 (r8168)
              0.0%        PCI Device: Intel Corporation 100 Series/C230 Series Chipset Family Power Management Controller
              0.0%        PCI Device: Intel Corporation HM170 Chipset LPC/eSPI Controller
              0.0%        PCI Device: Intel Corporation Xeon E3-1200 v5/E3-1500 v5/6th Gen Core Processor PCIe Controller (x16)
              0.0%        PCI Device: Intel Corporation 100 Series/C230 Series Chipset Family MEI Controller #1
              0.0%        PCI Device: NVIDIA Corporation GM107M [GeForce GTX 960M]
              0.0%        I2C Adapter (i2c-8): nvkm-0000:01:00.0-bus-0005
              0.0%        runtime-PNP0C14:00
              0.0%        PCI Device: Intel Corporation 100 Series/C230 Series Chipset Family HD Audio Controller
              0.0%        runtime-PNP0C0C:00
              0.0%        USB device: xHCI Host Controller
              0.0%        runtime-ACPI000C:00
              0.0%        runtime-regulatory.0
              0.0%        runtime-PNP0C14:01
              0.0%        runtime-vesa-framebuffer.0
              0.0%        runtime-coretemp.0
              0.0%        runtime-alarmtimer

 Exit |  /  Navigate |    
```

### 可调整状态页

这个页面是个重要区域，可以为你的笔记本电池优化提供建议。

```
PowerTOP v2.9     Overview   Idle stats   Frequency stats   Device stats   Tunables                                     


>> Bad           Enable SATA link power management for host2                                                            
   Bad           Enable SATA link power management for host3
   Bad           Enable SATA link power management for host0
   Bad           Enable SATA link power management for host1
   Bad           VM writeback timeout
   Bad           Autosuspend for USB device Lenovo Wireless Optical Mouse N100 [1-2]
   Good          Bluetooth device interface status
   Good          Enable Audio codec power management
   Good          NMI watchdog should be turned off
   Good          Runtime PM for I2C Adapter i2c-7 (nvkm-0000:01:00.0-bus-0002)
   Good          Autosuspend for unknown USB device 1-11 (8087:0a2b)
   Good          Runtime PM for I2C Adapter i2c-3 (i915 gmbus dpd)
   Good          Autosuspend for USB device Lenovo EasyCamera [160709000341]
   Good          Runtime PM for I2C Adapter i2c-1 (i915 gmbus dpc)
   Good          Runtime PM for I2C Adapter i2c-12 (nvkm-0000:01:00.0-bus-0009)
   Good          Autosuspend for USB device xHCI Host Controller [usb1]
   Good          Runtime PM for I2C Adapter i2c-13 (nvkm-0000:01:00.0-aux-000a)
   Good          Runtime PM for I2C Adapter i2c-2 (i915 gmbus dpb)
   Good          Runtime PM for I2C Adapter i2c-8 (nvkm-0000:01:00.0-bus-0005)
   Good          Runtime PM for I2C Adapter i2c-15 (nvkm-0000:01:00.0-aux-000c)
   Good          Runtime PM for I2C Adapter i2c-16 (nvkm-0000:01:00.0-aux-000d)
   Good          Runtime PM for I2C Adapter i2c-5 (nvkm-0000:01:00.0-bus-0000)
   Good          Runtime PM for I2C Adapter i2c-0 (SMBus I801 adapter at 6040)
   Good          Runtime PM for I2C Adapter i2c-11 (nvkm-0000:01:00.0-bus-0008)
   Good          Runtime PM for I2C Adapter i2c-14 (nvkm-0000:01:00.0-aux-000b)
   Good          Autosuspend for USB device xHCI Host Controller [usb2]
   Good          Runtime PM for I2C Adapter i2c-9 (nvkm-0000:01:00.0-bus-0006)
   Good          Runtime PM for I2C Adapter i2c-10 (nvkm-0000:01:00.0-bus-0007)
   Good          Runtime PM for I2C Adapter i2c-6 (nvkm-0000:01:00.0-bus-0001)
   Good          Runtime PM for PCI Device Intel Corporation 100 Series/C230 Series Chipset Family HD Audio Controller
   Good          Runtime PM for PCI Device Intel Corporation 100 Series/C230 Series Chipset Family USB 3.0 xHCI Controller
   Good          Runtime PM for PCI Device Intel Corporation Xeon E3-1200 v5/E3-1500 v5/6th Gen Core Processor Host Bridge/DRAM Registers
   Good          Runtime PM for PCI Device Intel Corporation 100 Series/C230 Series Chipset Family PCI Express Root Port #9
   Good          Runtime PM for PCI Device Intel Corporation HD Graphics 530
   Good          Runtime PM for PCI Device Realtek Semiconductor Co., Ltd. RTL8111/8168/8411 PCI Express Gigabit Ethernet Controller
   Good          Runtime PM for PCI Device Intel Corporation 100 Series/C230 Series Chipset Family PCI Express Root Port #3
   Good          Runtime PM for PCI Device O2 Micro, Inc. SD/MMC Card Reader Controller
   Good          Runtime PM for PCI Device Intel Corporation HM170 Chipset LPC/eSPI Controller
   Good          Runtime PM for PCI Device Intel Corporation 100 Series/C230 Series Chipset Family MEI Controller #1
   Good          Runtime PM for PCI Device Samsung Electronics Co Ltd NVMe SSD Controller SM951/PM951
   Good          Runtime PM for PCI Device Intel Corporation HM170/QM170 Chipset SATA Controller [AHCI Mode]
   Good          Runtime PM for PCI Device Intel Corporation 100 Series/C230 Series Chipset Family Power Management Controller
   Good          Runtime PM for PCI Device Intel Corporation 100 Series/C230 Series Chipset Family PCI Express Root Port #2
   Good          Runtime PM for PCI Device Intel Corporation Wireless 8260
   Good          Runtime PM for PCI Device Intel Corporation Xeon E3-1200 v5/E3-1500 v5/6th Gen Core Processor PCIe Controller (x16)
   Good          Runtime PM for PCI Device Intel Corporation 100 Series/C230 Series Chipset Family PCI Express Root Port #4
   Good          Runtime PM for PCI Device Intel Corporation 100 Series/C230 Series Chipset Family SMBus
   Good          Runtime PM for PCI Device NVIDIA Corporation GM107M [GeForce GTX 960M]

  Exit |  Toggle tunable |  Window refresh
```

### 如何生成 PowerTop 的 HTML 报告

运行如下命令生成 PowerTop 的 HTML 报告。

```
$ sudo powertop --html=powertop.html
modprobe cpufreq_stats failedLoaded 100 prior measurements
Cannot load from file /var/cache/powertop/saved_parameters.powertop
File will be loaded after taking minimum number of measurement(s) with battery only
RAPL device for cpu 0
RAPL Using PowerCap Sysfs : Domain Mask f
RAPL device for cpu 0
RAPL Using PowerCap Sysfs : Domain Mask f
Devfreq not enabled
glob returned GLOB_ABORTED
Cannot load from file /var/cache/powertop/saved_parameters.powertop
File will be loaded after taking minimum number of measurement(s) with battery only
Preparing to take measurements
To show power estimates do 182 measurement(s) connected to battery only
Taking 1 measurement(s) for a duration of 20 second(s) each.
PowerTOP outputing using base filename powertop.html
```

打开 `file:///home/daygeek/powertop.html` 文件以访问生成的 PowerTOP 的 HTML 报告。

![][9]

### 自动调整模式

这个功能可以将所有可调整选项从 BAD 设置为 GOOD，这可以提升 Linux 中的笔记本电池寿命。

```
$ sudo powertop --auto-tune
modprobe cpufreq_stats failedLoaded 210 prior measurements
Cannot load from file /var/cache/powertop/saved_parameters.powertop
File will be loaded after taking minimum number of measurement(s) with battery only
RAPL device for cpu 0
RAPL Using PowerCap Sysfs : Domain Mask f
RAPL device for cpu 0
RAPL Using PowerCap Sysfs : Domain Mask f
Devfreq not enabled
glob returned GLOB_ABORTED
Cannot load from file /var/cache/powertop/saved_parameters.powertop
File will be loaded after taking minimum number of measurement(s) with battery only
To show power estimates do 72 measurement(s) connected to battery only
Leaving PowerTOP
```

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/powertop-monitors-laptop-battery-usage-linux/

作者：[Vinoth Kumar][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/vinoth/
[b]: https://github.com/lujun9972
[1]: https://www.2daygeek.com/category/package-management/
[2]: https://www.2daygeek.com/dnf-command-examples-manage-packages-fedora-system/
[3]: https://www.2daygeek.com/apt-get-apt-cache-command-examples-manage-packages-debian-ubuntu-systems/
[4]: https://www.2daygeek.com/apt-command-examples-manage-packages-debian-ubuntu-systems/
[5]: https://www.2daygeek.com/pacman-command-examples-manage-packages-arch-linux-system/
[6]: https://www.2daygeek.com/yum-command-examples-manage-packages-rhel-centos-systems/
[7]: https://www.2daygeek.com/zypper-command-examples-manage-packages-opensuse-system/
[8]: data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[9]: https://www.2daygeek.com/wp-content/uploads/2015/07/powertop-html-output.jpg

[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10848-1.html)
[#]: subject: (TLP – An Advanced Power Management Tool That Improve Battery Life On Linux Laptop)
[#]: via: (https://www.2daygeek.com/tlp-increase-optimize-linux-laptop-battery-life/)
[#]: author: (Magesh Maruthamuthu https://www.2daygeek.com/author/magesh/)

TLP：一个可以延长 Linux 笔记本电池寿命的高级电源管理工具
======

![](https://img.linux.net.cn/data/attachment/album/201905/13/094413iu77i8w75t80tq7h.jpg)

笔记本电池是针对 Windows 操作系统进行了高度优化的，当我在笔记本电脑中使用 Windows 操作系统时，我已经意识到这一点，但对于 Linux 来说却不一样。

多年来，Linux 在电池优化方面取得了很大进步，但我们仍然需要做一些必要的事情来改善 Linux 中笔记本电脑的电池寿命。

当我考虑延长电池寿命时，我没有多少选择，但我觉得 TLP 对我来说是一个更好的解决方案，所以我会继续使用它。

在本教程中，我们将详细讨论 TLP 以延长电池寿命。

我们之前在我们的网站上写过三篇关于 Linux [笔记本电池节电工具][1] 的文章：[PowerTOP][2] 和 [电池充电状态][3]。

### TLP

[TLP][4] 是一款自由开源的高级电源管理工具，可在不进行任何配置更改的情况下延长电池寿命。

由于它的默认配置已针对电池寿命进行了优化，因此你可能只需要安装，然后就忘记它吧。

此外，它可以高度定制化，以满足你的特定要求。TLP 是一个具有自动后台任务的纯命令行工具。它不包含GUI。

TLP 适用于各种品牌的笔记本电脑。设置电池充电阈值仅适用于 IBM/Lenovo ThinkPad。

所有 TLP 设置都存储在 `/etc/default/tlp` 中。其默认配置提供了开箱即用的优化的节能设置。

以下 TLP 设置可用于自定义，如果需要，你可以相应地进行必要的更改。

### TLP 功能

* 内核笔记本电脑模式和脏缓冲区超时
* 处理器频率调整，包括 “turbo boost”/“turbo core”
* 限制最大/最小的 P 状态以控制 CPU 的功耗
* HWP 能源性能提示
* 用于多核/超线程的功率感知进程调度程序
* 处理器性能与节能策略（`x86_energy_perf_policy`）
* 硬盘高级电源管理级别（APM）和降速超时（按磁盘）
* AHCI 链路电源管理（ALPM）与设备黑名单
* PCIe 活动状态电源管理（PCIe ASPM）
* PCI(e) 总线设备的运行时电源管理
* Radeon 图形电源管理（KMS 和 DPM）
* Wifi 省电模式
* 关闭驱动器托架中的光盘驱动器
* 音频省电模式
* I/O 调度程序（按磁盘）
* USB 自动暂停，支持设备黑名单/白名单（输入设备自动排除）
* 在系统启动和关闭时启用或禁用集成的 wifi、蓝牙或 wwan 设备
* 在系统启动时恢复无线电设备状态（从之前的关机时的状态）
* 无线电设备向导：在网络连接/断开和停靠/取消停靠时切换无线电
* 禁用 LAN 唤醒
* 挂起/休眠后恢复集成的 WWAN 和蓝牙状态
* 英特尔处理器的动态电源降低 —— 需要内核和 PHC-Patch 支持
* 电池充电阈值 —— 仅限 ThinkPad
* 重新校准电池 —— 仅限 ThinkPad

### 如何在 Linux 上安装 TLP

TLP 包在大多数发行版官方存储库中都可用，因此，使用发行版的 [包管理器][5] 来安装它。

对于 Fedora 系统，使用 [DNF 命令][6] 安装 TLP。

```
$ sudo dnf install tlp tlp-rdw
```

ThinkPad 需要一些附加软件包。

```
$ sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
$ sudo dnf install http://repo.linrunner.de/fedora/tlp/repos/releases/tlp-release.fc$(rpm -E %fedora).noarch.rpm
$ sudo dnf install akmod-tp_smapi akmod-acpi_call kernel-devel
```

安装 smartmontool 以显示 tlp-stat 中 S.M.A.R.T. 数据。

```
$ sudo dnf install smartmontools
```

对于 Debian/Ubuntu 系统，使用 [APT-GET 命令][7] 或 [APT 命令][8] 安装 TLP。

```
$ sudo apt install tlp tlp-rdw
```

ThinkPad 需要一些附加软件包。

```
$ sudo apt-get install tp-smapi-dkms acpi-call-dkms
```

安装 smartmontool 以显示 tlp-stat 中 S.M.A.R.T. 数据。

```
$ sudo apt-get install smartmontools
```

当基于 Ubuntu 的系统的官方软件包过时时，请使用以下 PPA 存储库，该存储库提供最新版本。运行以下命令以使用 PPA 安装 TLP。

```
$ sudo add-apt-repository ppa:linrunner/tlp
$ sudo apt-get update
$ sudo apt-get install tlp
```

对于基于 Arch Linux 的系统，使用 [Pacman 命令][9] 安装 TLP。

```
$ sudo pacman -S tlp tlp-rdw
```

ThinkPad 需要一些附加软件包。

```
$ pacman -S tp_smapi acpi_call
```

安装 smartmontool 以显示 tlp-stat 中 S.M.A.R.T. 数据。

```
$ sudo pacman -S smartmontools
```

对于基于 Arch Linux 的系统，在启动时启用 TLP 和 TLP-Sleep 服务。

```
$ sudo systemctl enable tlp.service
$ sudo systemctl enable tlp-sleep.service
```

对于基于 Arch Linux 的系统，你还应该屏蔽以下服务以避免冲突，并确保 TLP 的无线电设备切换选项的正确操作。

```
$ sudo systemctl mask systemd-rfkill.service
$ sudo systemctl mask systemd-rfkill.socket
```

对于 RHEL/CentOS 系统，使用 [YUM 命令][10] 安装 TLP。

```
$ sudo yum install tlp tlp-rdw
```

安装 smartmontool 以显示 tlp-stat 中 S.M.A.R.T. 数据。

```
$ sudo yum install smartmontools
```

对于 openSUSE Leap 系统，使用 [Zypper 命令][11] 安装 TLP。

```
$ sudo zypper install TLP
```

安装 smartmontool 以显示 tlp-stat 中 S.M.A.R.T. 数据。

```
$ sudo zypper install smartmontools
```

成功安装 TLP 后，使用以下命令启动服务。

```
$ systemctl start tlp.service
```

### 使用方法

#### 显示电池信息

```
$ sudo tlp-stat -b
或
$ sudo tlp-stat --battery
```

```
--- TLP 1.1 --------------------------------------------

+++ Battery Status
/sys/class/power_supply/BAT0/manufacturer                   = SMP
/sys/class/power_supply/BAT0/model_name                     = L14M4P23
/sys/class/power_supply/BAT0/cycle_count                    = (not supported)
/sys/class/power_supply/BAT0/energy_full_design             =  60000 [mWh]
/sys/class/power_supply/BAT0/energy_full                    =  48850 [mWh]
/sys/class/power_supply/BAT0/energy_now                     =  48850 [mWh]
/sys/class/power_supply/BAT0/power_now                      =      0 [mW]
/sys/class/power_supply/BAT0/status                         = Full

Charge                                                      =  100.0 [%]
Capacity                                                    =   81.4 [%]
```

#### 显示磁盘信息

```
$ sudo tlp-stat -d
或
$ sudo tlp-stat --disk
```

```
--- TLP 1.1 --------------------------------------------

+++ Storage Devices
/dev/sda:
  Model     = WDC WD10SPCX-24HWST1                    
  Firmware  = 02.01A02
  APM Level = 128
  Status    = active/idle
  Scheduler = mq-deadline

  Runtime PM: control = on, autosuspend_delay = (not available)

  SMART info:
      4 Start_Stop_Count          =    18787 
      5 Reallocated_Sector_Ct     =        0 
      9 Power_On_Hours            =      606 [h]
     12 Power_Cycle_Count         =     1792 
    193 Load_Cycle_Count          =    25775 
    194 Temperature_Celsius       =       31    [°C]


+++ AHCI Link Power Management (ALPM)
/sys/class/scsi_host/host0/link_power_management_policy  = med_power_with_dipm
/sys/class/scsi_host/host1/link_power_management_policy  = med_power_with_dipm
/sys/class/scsi_host/host2/link_power_management_policy  = med_power_with_dipm
/sys/class/scsi_host/host3/link_power_management_policy  = med_power_with_dipm

+++ AHCI Host Controller Runtime Power Management
/sys/bus/pci/devices/0000:00:17.0/ata1/power/control = on
/sys/bus/pci/devices/0000:00:17.0/ata2/power/control = on
/sys/bus/pci/devices/0000:00:17.0/ata3/power/control = on
/sys/bus/pci/devices/0000:00:17.0/ata4/power/control = on
```

#### 显示 PCI 设备信息

```
$ sudo tlp-stat -e
或
$ sudo tlp-stat --pcie
```

```
$ sudo tlp-stat -e
or
$ sudo tlp-stat --pcie

--- TLP 1.1 --------------------------------------------

+++ Runtime Power Management
Device blacklist = (not configured)
Driver blacklist = amdgpu nouveau nvidia radeon pcieport

/sys/bus/pci/devices/0000:00:00.0/power/control = auto (0x060000, Host bridge, skl_uncore)
/sys/bus/pci/devices/0000:00:01.0/power/control = auto (0x060400, PCI bridge, pcieport)
/sys/bus/pci/devices/0000:00:02.0/power/control = auto (0x030000, VGA compatible controller, i915)
/sys/bus/pci/devices/0000:00:14.0/power/control = auto (0x0c0330, USB controller, xhci_hcd)

......
```

#### 显示图形卡信息

```
$ sudo tlp-stat -g
或
$ sudo tlp-stat --graphics
```

```
--- TLP 1.1 --------------------------------------------

+++ Intel Graphics
/sys/module/i915/parameters/enable_dc        = -1 (use per-chip default)
/sys/module/i915/parameters/enable_fbc       =  1 (enabled)
/sys/module/i915/parameters/enable_psr       =  0 (disabled)
/sys/module/i915/parameters/modeset          = -1 (use per-chip default)
```

#### 显示处理器信息

```
$ sudo tlp-stat -p
或
$ sudo tlp-stat --processor
```

```
--- TLP 1.1 --------------------------------------------

+++ Processor
CPU model      = Intel(R) Core(TM) i7-6700HQ CPU @ 2.60GHz

/sys/devices/system/cpu/cpu0/cpufreq/scaling_driver    = intel_pstate
/sys/devices/system/cpu/cpu0/cpufreq/scaling_governor  = powersave
/sys/devices/system/cpu/cpu0/cpufreq/scaling_available_governors = performance powersave
/sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq  =   800000 [kHz]
/sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq  =  3500000 [kHz]
/sys/devices/system/cpu/cpu0/cpufreq/energy_performance_preference = balance_power
/sys/devices/system/cpu/cpu0/cpufreq/energy_performance_available_preferences = default performance balance_performance balance_power power 

......

/sys/devices/system/cpu/intel_pstate/min_perf_pct      =  22 [%]
/sys/devices/system/cpu/intel_pstate/max_perf_pct      = 100 [%]
/sys/devices/system/cpu/intel_pstate/no_turbo          =   0
/sys/devices/system/cpu/intel_pstate/turbo_pct         =  33 [%]
/sys/devices/system/cpu/intel_pstate/num_pstates       =  28

x86_energy_perf_policy: program not installed.

/sys/module/workqueue/parameters/power_efficient       = Y
/proc/sys/kernel/nmi_watchdog                          = 0

+++ Undervolting
PHC kernel not available.
```

#### 显示系统数据信息

```
$ sudo tlp-stat -s
或
$ sudo tlp-stat --system
```

```
--- TLP 1.1 --------------------------------------------

+++ System Info
System         = LENOVO Lenovo ideapad Y700-15ISK 80NV
BIOS           = CDCN35WW
Release        = "Manjaro Linux"
Kernel         = 4.19.6-1-MANJARO #1 SMP PREEMPT Sat Dec 1 12:21:26 UTC 2018 x86_64
/proc/cmdline  = BOOT_IMAGE=/boot/vmlinuz-4.19-x86_64 root=UUID=69d9dd18-36be-4631-9ebb-78f05fe3217f rw quiet resume=UUID=a2092b92-af29-4760-8e68-7a201922573b
Init system    = systemd 
Boot mode      = BIOS (CSM, Legacy)

+++ TLP Status
State          = enabled
Last run       = 11:04:00  IST,    596 sec(s) ago
Mode           = battery
Power source   = battery
```

#### 显示温度和风扇速度信息

```
$ sudo tlp-stat -t
或
$ sudo tlp-stat --temp
```

```
--- TLP 1.1 --------------------------------------------

+++ Temperatures
CPU temp               =    36 [°C]
Fan speed              = (not available)
```

#### 显示 USB 设备数据信息

```
$ sudo tlp-stat -u
或
$ sudo tlp-stat --usb
```

```
--- TLP 1.1 --------------------------------------------

+++ USB
Autosuspend         = disabled
Device whitelist    = (not configured)
Device blacklist    = (not configured)
Bluetooth blacklist = disabled
Phone blacklist     = disabled
WWAN blacklist      = enabled

Bus 002 Device 001 ID 1d6b:0003 control = auto, autosuspend_delay_ms =     0 -- Linux Foundation 3.0 root hub (hub)
Bus 001 Device 003 ID 174f:14e8 control = auto, autosuspend_delay_ms =  2000 -- Syntek  (uvcvideo)

......
```

#### 显示警告信息

```
$ sudo tlp-stat -w
或
$ sudo tlp-stat --warn
```

```
--- TLP 1.1 --------------------------------------------

No warnings detected.
```

#### 状态报告及配置和所有活动的设置

```
$ sudo tlp-stat
```

```
--- TLP 1.1 --------------------------------------------

+++ Configured Settings: /etc/default/tlp
TLP_ENABLE=1
TLP_DEFAULT_MODE=AC
TLP_PERSISTENT_DEFAULT=0
DISK_IDLE_SECS_ON_AC=0
DISK_IDLE_SECS_ON_BAT=2
MAX_LOST_WORK_SECS_ON_AC=15
MAX_LOST_WORK_SECS_ON_BAT=60

......

+++ System Info
System = LENOVO Lenovo ideapad Y700-15ISK 80NV
BIOS = CDCN35WW
Release = "Manjaro Linux"
Kernel = 4.19.6-1-MANJARO #1 SMP PREEMPT Sat Dec 1 12:21:26 UTC 2018 x86_64
/proc/cmdline = BOOT_IMAGE=/boot/vmlinuz-4.19-x86_64 root=UUID=69d9dd18-36be-4631-9ebb-78f05fe3217f rw quiet resume=UUID=a2092b92-af29-4760-8e68-7a201922573b
Init system = systemd
Boot mode = BIOS (CSM, Legacy)

+++ TLP Status
State = enabled
Last run = 11:04:00 IST, 684 sec(s) ago
Mode = battery
Power source = battery

+++ Processor
CPU model = Intel(R) Core(TM) i7-6700HQ CPU @ 2.60GHz

/sys/devices/system/cpu/cpu0/cpufreq/scaling_driver = intel_pstate
/sys/devices/system/cpu/cpu0/cpufreq/scaling_governor = powersave
/sys/devices/system/cpu/cpu0/cpufreq/scaling_available_governors = performance powersave

......

/sys/devices/system/cpu/intel_pstate/min_perf_pct = 22 [%]
/sys/devices/system/cpu/intel_pstate/max_perf_pct = 100 [%]
/sys/devices/system/cpu/intel_pstate/no_turbo = 0
/sys/devices/system/cpu/intel_pstate/turbo_pct = 33 [%]
/sys/devices/system/cpu/intel_pstate/num_pstates = 28

x86_energy_perf_policy: program not installed.

/sys/module/workqueue/parameters/power_efficient = Y
/proc/sys/kernel/nmi_watchdog = 0

+++ Undervolting
PHC kernel not available.

+++ Temperatures
CPU temp = 42 [°C]
Fan speed = (not available)

+++ File System
/proc/sys/vm/laptop_mode = 2
/proc/sys/vm/dirty_writeback_centisecs = 6000
/proc/sys/vm/dirty_expire_centisecs = 6000
/proc/sys/vm/dirty_ratio = 20
/proc/sys/vm/dirty_background_ratio = 10

+++ Storage Devices
/dev/sda:
 Model = WDC WD10SPCX-24HWST1
 Firmware = 02.01A02
 APM Level = 128
 Status = active/idle
 Scheduler = mq-deadline

 Runtime PM: control = on, autosuspend_delay = (not available)

 SMART info:
 4 Start_Stop_Count = 18787
 5 Reallocated_Sector_Ct = 0
 9 Power_On_Hours = 606 [h]
 12 Power_Cycle_Count = 1792
 193 Load_Cycle_Count = 25777
 194 Temperature_Celsius = 31 [°C]


+++ AHCI Link Power Management (ALPM)
/sys/class/scsi_host/host0/link_power_management_policy = med_power_with_dipm
/sys/class/scsi_host/host1/link_power_management_policy = med_power_with_dipm
/sys/class/scsi_host/host2/link_power_management_policy = med_power_with_dipm
/sys/class/scsi_host/host3/link_power_management_policy = med_power_with_dipm

+++ AHCI Host Controller Runtime Power Management
/sys/bus/pci/devices/0000:00:17.0/ata1/power/control = on
/sys/bus/pci/devices/0000:00:17.0/ata2/power/control = on
/sys/bus/pci/devices/0000:00:17.0/ata3/power/control = on
/sys/bus/pci/devices/0000:00:17.0/ata4/power/control = on

+++ PCIe Active State Power Management
/sys/module/pcie_aspm/parameters/policy = powersave

+++ Intel Graphics
/sys/module/i915/parameters/enable_dc = -1 (use per-chip default)
/sys/module/i915/parameters/enable_fbc = 1 (enabled)
/sys/module/i915/parameters/enable_psr = 0 (disabled)
/sys/module/i915/parameters/modeset = -1 (use per-chip default)

+++ Wireless
bluetooth = on
wifi = on
wwan = none (no device)

hci0(btusb) : bluetooth, not connected
wlp8s0(iwlwifi) : wifi, connected, power management = on

+++ Audio
/sys/module/snd_hda_intel/parameters/power_save = 1
/sys/module/snd_hda_intel/parameters/power_save_controller = Y

+++ Runtime Power Management
Device blacklist = (not configured)
Driver blacklist = amdgpu nouveau nvidia radeon pcieport

/sys/bus/pci/devices/0000:00:00.0/power/control = auto (0x060000, Host bridge, skl_uncore)
/sys/bus/pci/devices/0000:00:01.0/power/control = auto (0x060400, PCI bridge, pcieport)
/sys/bus/pci/devices/0000:00:02.0/power/control = auto (0x030000, VGA compatible controller, i915)

......

+++ USB
Autosuspend = disabled
Device whitelist = (not configured)
Device blacklist = (not configured)
Bluetooth blacklist = disabled
Phone blacklist = disabled
WWAN blacklist = enabled

Bus 002 Device 001 ID 1d6b:0003 control = auto, autosuspend_delay_ms = 0 -- Linux Foundation 3.0 root hub (hub)
Bus 001 Device 003 ID 174f:14e8 control = auto, autosuspend_delay_ms = 2000 -- Syntek (uvcvideo)
Bus 001 Device 002 ID 17ef:6053 control = on, autosuspend_delay_ms = 2000 -- Lenovo (usbhid)
Bus 001 Device 004 ID 8087:0a2b control = auto, autosuspend_delay_ms = 2000 -- Intel Corp. (btusb)
Bus 001 Device 001 ID 1d6b:0002 control = auto, autosuspend_delay_ms = 0 -- Linux Foundation 2.0 root hub (hub)

+++ Battery Status
/sys/class/power_supply/BAT0/manufacturer = SMP
/sys/class/power_supply/BAT0/model_name = L14M4P23
/sys/class/power_supply/BAT0/cycle_count = (not supported)
/sys/class/power_supply/BAT0/energy_full_design = 60000 [mWh]
/sys/class/power_supply/BAT0/energy_full = 51690 [mWh]
/sys/class/power_supply/BAT0/energy_now = 50140 [mWh]
/sys/class/power_supply/BAT0/power_now = 12185 [mW]
/sys/class/power_supply/BAT0/status = Discharging

Charge = 97.0 [%]
Capacity = 86.2 [%]
```

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/tlp-increase-optimize-linux-laptop-battery-life/

作者：[Magesh Maruthamuthu][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/magesh/
[b]: https://github.com/lujun9972
[1]: https://www.2daygeek.com/check-laptop-battery-status-and-charging-state-in-linux-terminal/
[2]: https://www.2daygeek.com/powertop-monitors-laptop-battery-usage-linux/
[3]: https://www.2daygeek.com/monitor-laptop-battery-charging-state-linux/
[4]: https://linrunner.de/en/tlp/docs/tlp-linux-advanced-power-management.html
[5]: https://www.2daygeek.com/category/package-management/
[6]: https://www.2daygeek.com/dnf-command-examples-manage-packages-fedora-system/
[7]: https://www.2daygeek.com/apt-get-apt-cache-command-examples-manage-packages-debian-ubuntu-systems/
[8]: https://www.2daygeek.com/apt-command-examples-manage-packages-debian-ubuntu-systems/
[9]: https://www.2daygeek.com/pacman-command-examples-manage-packages-arch-linux-system/
[10]: https://www.2daygeek.com/yum-command-examples-manage-packages-rhel-centos-systems/
[11]: https://www.2daygeek.com/zypper-command-examples-manage-packages-opensuse-system/

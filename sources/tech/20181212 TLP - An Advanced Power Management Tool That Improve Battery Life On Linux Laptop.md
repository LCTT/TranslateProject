[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (TLP – An Advanced Power Management Tool That Improve Battery Life On Linux Laptop)
[#]: via: (https://www.2daygeek.com/tlp-increase-optimize-linux-laptop-battery-life/)
[#]: author: (Magesh Maruthamuthu https://www.2daygeek.com/author/magesh/)

TLP – An Advanced Power Management Tool That Improve Battery Life On Linux Laptop
======

Laptop battery is highly optimized for Windows OS, that i had realized when i was using Windows OS in my laptop but it’s not same for Linux.

Over the years Linux has improved a lot for battery optimization but still we need make some necessary things to improve laptop battery life in Linux.

When i think about battery life, i got few options for that but i felt TLP is a better solutions for me so, i’m going with it.

In this tutorial we are going to discuss about TLP in details to improve battery life.

We had written three articles previously in our site about **[laptop battery saving utilities][1]** for Linux **[PowerTOP][2]** and **[Battery Charging State][3]**.

### What is TLP?

[TLP][4] is a free opensource advanced power management tool that improve your battery life without making any configuration change.

Since it comes with a default configuration already optimized for battery life, so you may just install and forget it.

Also, it is highly customizable to fulfill your specific requirements. TLP is a pure command line tool with automated background tasks. It does not contain a GUI.

TLP runs on every laptop brand. Setting the battery charge thresholds is available for IBM/Lenovo ThinkPads only.

All TLP settings are stored in `/etc/default/tlp`. The default configuration provides optimized power saving out of the box.

The following TLP settings is available for customization and you need to make the necessary changes accordingly if you want it.

### TLP Features

  * Kernel laptop mode and dirty buffer timeouts
  * Processor frequency scaling including “turbo boost” / “turbo core”
  * Limit max/min P-state to control power dissipation of the CPU
  * HWP energy performance hints
  * Power aware process scheduler for multi-core/hyper-threading
  * Processor performance versus energy savings policy (x86_energy_perf_policy)
  * Hard disk advanced power magement level (APM) and spin down timeout (per disk)
  * AHCI link power management (ALPM) with device blacklist
  * PCIe active state power management (PCIe ASPM)
  * Runtime power management for PCI(e) bus devices
  * Radeon graphics power management (KMS and DPM)
  * Wifi power saving mode
  * Power off optical drive in drive bay
  * Audio power saving mode
  * I/O scheduler (per disk)
  * USB autosuspend with device blacklist/whitelist (input devices excluded automatically)
  * Enable or disable integrated wifi, bluetooth or wwan devices upon system startup and shutdown
  * Restore radio device state on system startup (from previous shutdown).
  * Radio device wizard: switch radios upon network connect/disconnect and dock/undock
  * Disable Wake On LAN
  * Integrated WWAN and bluetooth state is restored after suspend/hibernate
  * Untervolting of Intel processors – requires kernel with PHC-Patch
  * Battery charge thresholds – ThinkPads only
  * Recalibrate battery – ThinkPads only



### How to Install TLP in Linux

TLP package is available in most of the distributions official repository so, use the distributions **[Package Manager][5]** to install it.

For **`Fedora`** system, use **[DNF Command][6]** to install TLP.

```
$ sudo dnf install tlp tlp-rdw
```

ThinkPads require an additional packages.

```
$ sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
$ sudo dnf install http://repo.linrunner.de/fedora/tlp/repos/releases/tlp-release.fc$(rpm -E %fedora).noarch.rpm
$ sudo dnf install akmod-tp_smapi akmod-acpi_call kernel-devel
```

Install smartmontool to display S.M.A.R.T. data in tlp-stat.

```
$ sudo dnf install smartmontools
```

For **`Debian/Ubuntu`** systems, use **[APT-GET Command][7]** or **[APT Command][8]** to install TLP.

```
$ sudo apt install tlp tlp-rdw
```

ThinkPads require an additional packages.

```
$ sudo apt-get install tp-smapi-dkms acpi-call-dkms
```

Install smartmontool to display S.M.A.R.T. data in tlp-stat.

```
$ sudo apt-get install smartmontools
```

When the official package becomes outdated for Ubuntu based systems then use the following PPA repository which provides an up-to-date version. Run the following commands to install TLP using the PPA.

```
$ sudo apt-get install tlp tlp-rdw
```

For **`Arch Linux`** based systems, use **[Pacman Command][9]** to install TLP.

```
$ sudo pacman -S tlp tlp-rdw
```

ThinkPads require an additional packages.

```
$ pacman -S tp_smapi acpi_call
```

Install smartmontool to display S.M.A.R.T. data in tlp-stat.

```
$ sudo pacman -S smartmontools
```

Enable TLP & TLP-Sleep service on boot for Arch Linux based systems.

```
$ sudo systemctl enable tlp.service
$ sudo systemctl enable tlp-sleep.service
```

You should also mask the following services to avoid conflicts and assure proper operation of TLP’s radio device switching options for Arch Linux based systems.

```
$ sudo systemctl mask systemd-rfkill.service
$ sudo systemctl mask systemd-rfkill.socket
```

For **`RHEL/CentOS`** systems, use **[YUM Command][10]** to install TLP.

```
$ sudo yum install tlp tlp-rdw
```

Install smartmontool to display S.M.A.R.T. data in tlp-stat.

```
$ sudo yum install smartmontools
```

For **`openSUSE Leap`** system, use **[Zypper Command][11]** to install TLP.

```
$ sudo zypper install TLP
```

Install smartmontool to display S.M.A.R.T. data in tlp-stat.

```
$ sudo zypper install smartmontools
```

After successfully TLP installed, use the following command to start the service.

```
$ systemctl start tlp.service
```

To show battery information.

```
$ sudo tlp-stat -b
or
$ sudo tlp-stat --battery

--- TLP 1.1 --------------------------------------------

+++ Battery Status
/sys/class/power_supply/BAT0/manufacturer = SMP
/sys/class/power_supply/BAT0/model_name = L14M4P23
/sys/class/power_supply/BAT0/cycle_count = (not supported)
/sys/class/power_supply/BAT0/energy_full_design = 60000 [mWh]
/sys/class/power_supply/BAT0/energy_full = 48850 [mWh]
/sys/class/power_supply/BAT0/energy_now = 48850 [mWh]
/sys/class/power_supply/BAT0/power_now = 0 [mW]
/sys/class/power_supply/BAT0/status = Full

Charge = 100.0 [%]
Capacity = 81.4 [%]
```

To show disk information.

```
$ sudo tlp-stat -d
or
$ sudo tlp-stat --disk

--- TLP 1.1 --------------------------------------------

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
 193 Load_Cycle_Count = 25775
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
```

To show PCI device information.

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
/sys/bus/pci/devices/0000:00:16.0/power/control = auto (0x078000, Communication controller, mei_me)
/sys/bus/pci/devices/0000:00:17.0/power/control = auto (0x010601, SATA controller, ahci)
/sys/bus/pci/devices/0000:00:1c.0/power/control = auto (0x060400, PCI bridge, pcieport)
/sys/bus/pci/devices/0000:00:1c.2/power/control = auto (0x060400, PCI bridge, pcieport)
/sys/bus/pci/devices/0000:00:1c.3/power/control = auto (0x060400, PCI bridge, pcieport)
/sys/bus/pci/devices/0000:00:1d.0/power/control = auto (0x060400, PCI bridge, pcieport)
/sys/bus/pci/devices/0000:00:1f.0/power/control = auto (0x060100, ISA bridge, no driver)
/sys/bus/pci/devices/0000:00:1f.2/power/control = auto (0x058000, Memory controller, no driver)
/sys/bus/pci/devices/0000:00:1f.3/power/control = auto (0x040300, Audio device, snd_hda_intel)
/sys/bus/pci/devices/0000:00:1f.4/power/control = auto (0x0c0500, SMBus, i801_smbus)
/sys/bus/pci/devices/0000:01:00.0/power/control = auto (0x030200, 3D controller, nouveau)
/sys/bus/pci/devices/0000:07:00.0/power/control = auto (0x080501, SD Host controller, sdhci-pci)
/sys/bus/pci/devices/0000:08:00.0/power/control = auto (0x028000, Network controller, iwlwifi)
/sys/bus/pci/devices/0000:09:00.0/power/control = auto (0x020000, Ethernet controller, r8168)
/sys/bus/pci/devices/0000:0a:00.0/power/control = auto (0x010802, Non-Volatile memory controller, nvme)
```

To show graphics card information.

```
$ sudo tlp-stat -g
or
$ sudo tlp-stat --graphics

--- TLP 1.1 --------------------------------------------

+++ Intel Graphics
/sys/module/i915/parameters/enable_dc = -1 (use per-chip default)
/sys/module/i915/parameters/enable_fbc = 1 (enabled)
/sys/module/i915/parameters/enable_psr = 0 (disabled)
/sys/module/i915/parameters/modeset = -1 (use per-chip default)
```

To show Processor information.

```
$ sudo tlp-stat -p
or
$ sudo tlp-stat --processor

--- TLP 1.1 --------------------------------------------

+++ Processor
CPU model = Intel(R) Core(TM) i7-6700HQ CPU @ 2.60GHz

/sys/devices/system/cpu/cpu0/cpufreq/scaling_driver = intel_pstate
/sys/devices/system/cpu/cpu0/cpufreq/scaling_governor = powersave
/sys/devices/system/cpu/cpu0/cpufreq/scaling_available_governors = performance powersave
/sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq = 800000 [kHz]
/sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq = 3500000 [kHz]
/sys/devices/system/cpu/cpu0/cpufreq/energy_performance_preference = balance_power
/sys/devices/system/cpu/cpu0/cpufreq/energy_performance_available_preferences = default performance balance_performance balance_power power

/sys/devices/system/cpu/cpu1/cpufreq/scaling_driver = intel_pstate
/sys/devices/system/cpu/cpu1/cpufreq/scaling_governor = powersave
/sys/devices/system/cpu/cpu1/cpufreq/scaling_available_governors = performance powersave
/sys/devices/system/cpu/cpu1/cpufreq/scaling_min_freq = 800000 [kHz]
/sys/devices/system/cpu/cpu1/cpufreq/scaling_max_freq = 3500000 [kHz]
/sys/devices/system/cpu/cpu1/cpufreq/energy_performance_preference = balance_power
/sys/devices/system/cpu/cpu1/cpufreq/energy_performance_available_preferences = default performance balance_performance balance_power power

/sys/devices/system/cpu/cpu2/cpufreq/scaling_driver = intel_pstate
/sys/devices/system/cpu/cpu2/cpufreq/scaling_governor = powersave
/sys/devices/system/cpu/cpu2/cpufreq/scaling_available_governors = performance powersave
/sys/devices/system/cpu/cpu2/cpufreq/scaling_min_freq = 800000 [kHz]
/sys/devices/system/cpu/cpu2/cpufreq/scaling_max_freq = 3500000 [kHz]
/sys/devices/system/cpu/cpu2/cpufreq/energy_performance_preference = balance_power
/sys/devices/system/cpu/cpu2/cpufreq/energy_performance_available_preferences = default performance balance_performance balance_power power

/sys/devices/system/cpu/cpu3/cpufreq/scaling_driver = intel_pstate
/sys/devices/system/cpu/cpu3/cpufreq/scaling_governor = powersave
/sys/devices/system/cpu/cpu3/cpufreq/scaling_available_governors = performance powersave
/sys/devices/system/cpu/cpu3/cpufreq/scaling_min_freq = 800000 [kHz]
/sys/devices/system/cpu/cpu3/cpufreq/scaling_max_freq = 3500000 [kHz]
/sys/devices/system/cpu/cpu3/cpufreq/energy_performance_preference = balance_power
/sys/devices/system/cpu/cpu3/cpufreq/energy_performance_available_preferences = default performance balance_performance balance_power power

/sys/devices/system/cpu/cpu4/cpufreq/scaling_driver = intel_pstate
/sys/devices/system/cpu/cpu4/cpufreq/scaling_governor = powersave
/sys/devices/system/cpu/cpu4/cpufreq/scaling_available_governors = performance powersave
/sys/devices/system/cpu/cpu4/cpufreq/scaling_min_freq = 800000 [kHz]
/sys/devices/system/cpu/cpu4/cpufreq/scaling_max_freq = 3500000 [kHz]
/sys/devices/system/cpu/cpu4/cpufreq/energy_performance_preference = balance_power
/sys/devices/system/cpu/cpu4/cpufreq/energy_performance_available_preferences = default performance balance_performance balance_power power

/sys/devices/system/cpu/cpu5/cpufreq/scaling_driver = intel_pstate
/sys/devices/system/cpu/cpu5/cpufreq/scaling_governor = powersave
/sys/devices/system/cpu/cpu5/cpufreq/scaling_available_governors = performance powersave
/sys/devices/system/cpu/cpu5/cpufreq/scaling_min_freq = 800000 [kHz]
/sys/devices/system/cpu/cpu5/cpufreq/scaling_max_freq = 3500000 [kHz]
/sys/devices/system/cpu/cpu5/cpufreq/energy_performance_preference = balance_power
/sys/devices/system/cpu/cpu5/cpufreq/energy_performance_available_preferences = default performance balance_performance balance_power power

/sys/devices/system/cpu/cpu6/cpufreq/scaling_driver = intel_pstate
/sys/devices/system/cpu/cpu6/cpufreq/scaling_governor = powersave
/sys/devices/system/cpu/cpu6/cpufreq/scaling_available_governors = performance powersave
/sys/devices/system/cpu/cpu6/cpufreq/scaling_min_freq = 800000 [kHz]
/sys/devices/system/cpu/cpu6/cpufreq/scaling_max_freq = 3500000 [kHz]
/sys/devices/system/cpu/cpu6/cpufreq/energy_performance_preference = balance_power
/sys/devices/system/cpu/cpu6/cpufreq/energy_performance_available_preferences = default performance balance_performance balance_power power

/sys/devices/system/cpu/cpu7/cpufreq/scaling_driver = intel_pstate
/sys/devices/system/cpu/cpu7/cpufreq/scaling_governor = powersave
/sys/devices/system/cpu/cpu7/cpufreq/scaling_available_governors = performance powersave
/sys/devices/system/cpu/cpu7/cpufreq/scaling_min_freq = 800000 [kHz]
/sys/devices/system/cpu/cpu7/cpufreq/scaling_max_freq = 3500000 [kHz]
/sys/devices/system/cpu/cpu7/cpufreq/energy_performance_preference = balance_power
/sys/devices/system/cpu/cpu7/cpufreq/energy_performance_available_preferences = default performance balance_performance balance_power power

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
```

To show system data information.

```
$ sudo tlp-stat -s
or
$ sudo tlp-stat --system

--- TLP 1.1 --------------------------------------------

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
Last run = 11:04:00 IST, 596 sec(s) ago
Mode = battery
Power source = battery
```

To show temperatures and fan speed information.

```
$ sudo tlp-stat -t
or
$ sudo tlp-stat --temp

--- TLP 1.1 --------------------------------------------

+++ Temperatures
CPU temp = 36 [°C]
Fan speed = (not available)
```

To show USB device data information.

```
$ sudo tlp-stat -u
or
$ sudo tlp-stat --usb

--- TLP 1.1 --------------------------------------------

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
```

To show warnings.

```
$ sudo tlp-stat -w
or
$ sudo tlp-stat --warn

--- TLP 1.1 --------------------------------------------

No warnings detected.
```

Status report with configuration and all active settings.

```
$ sudo tlp-stat

--- TLP 1.1 --------------------------------------------

+++ Configured Settings: /etc/default/tlp
TLP_ENABLE=1
TLP_DEFAULT_MODE=AC
TLP_PERSISTENT_DEFAULT=0
DISK_IDLE_SECS_ON_AC=0
DISK_IDLE_SECS_ON_BAT=2
MAX_LOST_WORK_SECS_ON_AC=15
MAX_LOST_WORK_SECS_ON_BAT=60
CPU_HWP_ON_AC=balance_performance
CPU_HWP_ON_BAT=balance_power
SCHED_POWERSAVE_ON_AC=0
SCHED_POWERSAVE_ON_BAT=1
NMI_WATCHDOG=0
ENERGY_PERF_POLICY_ON_AC=performance
ENERGY_PERF_POLICY_ON_BAT=power
DISK_DEVICES="sda sdb"
DISK_APM_LEVEL_ON_AC="254 254"
DISK_APM_LEVEL_ON_BAT="128 128"
SATA_LINKPWR_ON_AC="med_power_with_dipm max_performance"
SATA_LINKPWR_ON_BAT="med_power_with_dipm max_performance"
AHCI_RUNTIME_PM_TIMEOUT=15
PCIE_ASPM_ON_AC=performance
PCIE_ASPM_ON_BAT=powersave
RADEON_POWER_PROFILE_ON_AC=default
RADEON_POWER_PROFILE_ON_BAT=low
RADEON_DPM_STATE_ON_AC=performance
RADEON_DPM_STATE_ON_BAT=battery
RADEON_DPM_PERF_LEVEL_ON_AC=auto
RADEON_DPM_PERF_LEVEL_ON_BAT=auto
WIFI_PWR_ON_AC=off
WIFI_PWR_ON_BAT=on
WOL_DISABLE=Y
SOUND_POWER_SAVE_ON_AC=0
SOUND_POWER_SAVE_ON_BAT=1
SOUND_POWER_SAVE_CONTROLLER=Y
BAY_POWEROFF_ON_AC=0
BAY_POWEROFF_ON_BAT=0
BAY_DEVICE="sr0"
RUNTIME_PM_ON_AC=on
RUNTIME_PM_ON_BAT=auto
RUNTIME_PM_DRIVER_BLACKLIST="amdgpu nouveau nvidia radeon pcieport"
USB_AUTOSUSPEND=0
USB_BLACKLIST_BTUSB=0
USB_BLACKLIST_PHONE=0
USB_BLACKLIST_PRINTER=1
USB_BLACKLIST_WWAN=1
RESTORE_DEVICE_STATE_ON_STARTUP=0

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
/sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq = 800000 [kHz]
/sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq = 3500000 [kHz]
/sys/devices/system/cpu/cpu0/cpufreq/energy_performance_preference = balance_power
/sys/devices/system/cpu/cpu0/cpufreq/energy_performance_available_preferences = default performance balance_performance balance_power power

/sys/devices/system/cpu/cpu1/cpufreq/scaling_driver = intel_pstate
/sys/devices/system/cpu/cpu1/cpufreq/scaling_governor = powersave
/sys/devices/system/cpu/cpu1/cpufreq/scaling_available_governors = performance powersave
/sys/devices/system/cpu/cpu1/cpufreq/scaling_min_freq = 800000 [kHz]
/sys/devices/system/cpu/cpu1/cpufreq/scaling_max_freq = 3500000 [kHz]
/sys/devices/system/cpu/cpu1/cpufreq/energy_performance_preference = balance_power
/sys/devices/system/cpu/cpu1/cpufreq/energy_performance_available_preferences = default performance balance_performance balance_power power

/sys/devices/system/cpu/cpu2/cpufreq/scaling_driver = intel_pstate
/sys/devices/system/cpu/cpu2/cpufreq/scaling_governor = powersave
/sys/devices/system/cpu/cpu2/cpufreq/scaling_available_governors = performance powersave
/sys/devices/system/cpu/cpu2/cpufreq/scaling_min_freq = 800000 [kHz]
/sys/devices/system/cpu/cpu2/cpufreq/scaling_max_freq = 3500000 [kHz]
/sys/devices/system/cpu/cpu2/cpufreq/energy_performance_preference = balance_power
/sys/devices/system/cpu/cpu2/cpufreq/energy_performance_available_preferences = default performance balance_performance balance_power power

/sys/devices/system/cpu/cpu3/cpufreq/scaling_driver = intel_pstate
/sys/devices/system/cpu/cpu3/cpufreq/scaling_governor = powersave
/sys/devices/system/cpu/cpu3/cpufreq/scaling_available_governors = performance powersave
/sys/devices/system/cpu/cpu3/cpufreq/scaling_min_freq = 800000 [kHz]
/sys/devices/system/cpu/cpu3/cpufreq/scaling_max_freq = 3500000 [kHz]
/sys/devices/system/cpu/cpu3/cpufreq/energy_performance_preference = balance_power
/sys/devices/system/cpu/cpu3/cpufreq/energy_performance_available_preferences = default performance balance_performance balance_power power

/sys/devices/system/cpu/cpu4/cpufreq/scaling_driver = intel_pstate
/sys/devices/system/cpu/cpu4/cpufreq/scaling_governor = powersave
/sys/devices/system/cpu/cpu4/cpufreq/scaling_available_governors = performance powersave
/sys/devices/system/cpu/cpu4/cpufreq/scaling_min_freq = 800000 [kHz]
/sys/devices/system/cpu/cpu4/cpufreq/scaling_max_freq = 3500000 [kHz]
/sys/devices/system/cpu/cpu4/cpufreq/energy_performance_preference = balance_power
/sys/devices/system/cpu/cpu4/cpufreq/energy_performance_available_preferences = default performance balance_performance balance_power power

/sys/devices/system/cpu/cpu5/cpufreq/scaling_driver = intel_pstate
/sys/devices/system/cpu/cpu5/cpufreq/scaling_governor = powersave
/sys/devices/system/cpu/cpu5/cpufreq/scaling_available_governors = performance powersave
/sys/devices/system/cpu/cpu5/cpufreq/scaling_min_freq = 800000 [kHz]
/sys/devices/system/cpu/cpu5/cpufreq/scaling_max_freq = 3500000 [kHz]
/sys/devices/system/cpu/cpu5/cpufreq/energy_performance_preference = balance_power
/sys/devices/system/cpu/cpu5/cpufreq/energy_performance_available_preferences = default performance balance_performance balance_power power

/sys/devices/system/cpu/cpu6/cpufreq/scaling_driver = intel_pstate
/sys/devices/system/cpu/cpu6/cpufreq/scaling_governor = powersave
/sys/devices/system/cpu/cpu6/cpufreq/scaling_available_governors = performance powersave
/sys/devices/system/cpu/cpu6/cpufreq/scaling_min_freq = 800000 [kHz]
/sys/devices/system/cpu/cpu6/cpufreq/scaling_max_freq = 3500000 [kHz]
/sys/devices/system/cpu/cpu6/cpufreq/energy_performance_preference = balance_power
/sys/devices/system/cpu/cpu6/cpufreq/energy_performance_available_preferences = default performance balance_performance balance_power power

/sys/devices/system/cpu/cpu7/cpufreq/scaling_driver = intel_pstate
/sys/devices/system/cpu/cpu7/cpufreq/scaling_governor = powersave
/sys/devices/system/cpu/cpu7/cpufreq/scaling_available_governors = performance powersave
/sys/devices/system/cpu/cpu7/cpufreq/scaling_min_freq = 800000 [kHz]
/sys/devices/system/cpu/cpu7/cpufreq/scaling_max_freq = 3500000 [kHz]
/sys/devices/system/cpu/cpu7/cpufreq/energy_performance_preference = balance_power
/sys/devices/system/cpu/cpu7/cpufreq/energy_performance_available_preferences = default performance balance_performance balance_power power

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
/sys/bus/pci/devices/0000:00:14.0/power/control = auto (0x0c0330, USB controller, xhci_hcd)
/sys/bus/pci/devices/0000:00:16.0/power/control = auto (0x078000, Communication controller, mei_me)
/sys/bus/pci/devices/0000:00:17.0/power/control = auto (0x010601, SATA controller, ahci)
/sys/bus/pci/devices/0000:00:1c.0/power/control = auto (0x060400, PCI bridge, pcieport)
/sys/bus/pci/devices/0000:00:1c.2/power/control = auto (0x060400, PCI bridge, pcieport)
/sys/bus/pci/devices/0000:00:1c.3/power/control = auto (0x060400, PCI bridge, pcieport)
/sys/bus/pci/devices/0000:00:1d.0/power/control = auto (0x060400, PCI bridge, pcieport)
/sys/bus/pci/devices/0000:00:1f.0/power/control = auto (0x060100, ISA bridge, no driver)
/sys/bus/pci/devices/0000:00:1f.2/power/control = auto (0x058000, Memory controller, no driver)
/sys/bus/pci/devices/0000:00:1f.3/power/control = auto (0x040300, Audio device, snd_hda_intel)
/sys/bus/pci/devices/0000:00:1f.4/power/control = auto (0x0c0500, SMBus, i801_smbus)
/sys/bus/pci/devices/0000:01:00.0/power/control = auto (0x030200, 3D controller, nouveau)
/sys/bus/pci/devices/0000:07:00.0/power/control = auto (0x080501, SD Host controller, sdhci-pci)
/sys/bus/pci/devices/0000:08:00.0/power/control = auto (0x028000, Network controller, iwlwifi)
/sys/bus/pci/devices/0000:09:00.0/power/control = auto (0x020000, Ethernet controller, r8168)
/sys/bus/pci/devices/0000:0a:00.0/power/control = auto (0x010802, Non-Volatile memory controller, nvme)

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
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

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

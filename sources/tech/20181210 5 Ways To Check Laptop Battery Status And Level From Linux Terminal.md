[#]: collector: (lujun9972)
[#]: translator: (dianbanjiu )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (5 Ways To Check Laptop Battery Status And Level From Linux Terminal)
[#]: via: (https://www.2daygeek.com/check-laptop-battery-status-and-charging-state-in-linux-terminal/)
[#]: author: (Magesh Maruthamuthu https://www.2daygeek.com/author/magesh/)

5 Ways To Check Laptop Battery Status And Level From Linux Terminal
======

We can easily check the battery status through GUI such as current battery percentage, whether it’s charging or not charging and how long it will be usable without charging, but we can’t able to check the battery health and other related information.

In this scenario what will be the solutions.

Yes, we have few utilities available for this in Linux and it can be achieved through command line.

We are going to discuss about this topic today through this article and i will try to cover possible information i can.

Checking your battery health monthly once is something good. It will help you to identify whether we are facing any battery or charge related issues.

Also, we can see battery model name, power source, vendor and battery technology, etc,.

Power management is a feature that turns off the power or switches system’s components to a low-power state when inactive.

### Following Utilities are available in Linux to Check Battery Status.

  * `upower`: upower is a command line tool which provides an interface to enumerate power sources on the system.
  * `acpi`: acpi Shows information from the /proc or the /sys filesystem, such as battery status or thermal information.
  * `batstat`: batstat is a command line tool to print battery status for linux.
  * `tlp`: TLP brings you the benefits of advanced power management for Linux without changing any configuration.
  * `class file`: The sysfs filesystem is a pseudo-filesystem which provides an interface to kernel data structures.



### How to Check Laptop Battery Status Using upower Command?

[upower][1] is a command line tool that provides an interface to enumerate power sources on the system. It control the latency of different operations on your computer, which enables you to save significant amounts of power.

Just run the following command to get the battery and it’s related information on Linux.

```
$ upower -i /org/freedesktop/UPower/devices/battery_BAT0
 native-path: BAT0
 vendor: SMP
 model: L14M4P23
 serial: 756
 power supply: yes
 updated: Monday 03 December 2018 07:56:18 PM IST (95 seconds ago)
 has history: yes
 has statistics: yes
 battery
 present: yes
 rechargeable: yes
 state: discharging
 warning-level: none
 energy: 28.23 Wh
 energy-empty: 0 Wh
 energy-full: 52.26 Wh
 energy-full-design: 60 Wh
 energy-rate: 10.714 W
 voltage: 14.819 V
 time to empty: 2.6 hours
 percentage: 54%
 capacity: 87.1%
 technology: lithium-ion
 icon-name: 'battery-good-symbolic'
 History (charge):
 1543847178 54.000  discharging
 History (rate):
 1543847178 10.714  discharging
```

To check the specific information about battery, use the following format.

```
$ upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep -i "state\|percentage\|time to empty"
 state: discharging
 time to empty: 2.1 hours
 percentage: 43%
```

It’s same as above, but it’s taken after power cable plugged in, that’s why the state showing charging.

```
$ upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep -i "state\|percentage\|time to empty"
 state: charging
 percentage: 41%
```

### How to Check Laptop Battery Status Using TLP Command?

TLP is a free opensource feature-rich command line tool which optimize laptop battery without making any configuration change.

TLP brings you the benefits of advanced power management for Linux without the need to understand every technical detail. TLP comes with a default configuration already optimized for battery life, so you may just install and forget it. Nevertheless TLP is highly customizable to fulfil your specific requirements.

TLP package is available in most of the Linux distribution official repository such as Arch, Debian, Fedora, Gentoo, openSUSE, etc. Use your distribution Package Manager to install the TLP utility.

Just run the following command to get the battery and it’s related information on Linux.

```
$ sudo tlp-stat -b
--- TLP 1.1 --------------------------------------------

+++ Battery Status
/sys/class/power_supply/BAT0/manufacturer = SMP
/sys/class/power_supply/BAT0/model_name = L14M4P23
/sys/class/power_supply/BAT0/cycle_count = (not supported)
/sys/class/power_supply/BAT0/energy_full_design = 60000 [mWh]
/sys/class/power_supply/BAT0/energy_full = 52260 [mWh]
/sys/class/power_supply/BAT0/energy_now = 21950 [mWh]
/sys/class/power_supply/BAT0/power_now = 10923 [mW]
/sys/class/power_supply/BAT0/status = Discharging

Charge = 42.0 [%]
Capacity = 87.1 [%]
```

To see other information as well.

```
$ sudo tlp-stat -s
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
Last run = 07:16:12 IST, 4362 sec(s) ago
Mode = battery
Power source = battery
```

### How to Check Laptop Battery Status Using ACPI Command?

ACPI stands for Advanced Configuration and Power Interface modules are kernel modules for different ACPI parts. They enable special ACPI functions or add information to /proc or /sys. These information can be parsed by acpid for events or other monitoring applications.

```
$ acpi
Battery 0: Charging, 43%, 01:05:11 until charged
```

To see battery capacity.

```
$ acpi -i
Battery 0: Charging, 43%, 01:05:07 until charged
Battery 0: design capacity 3817 mAh, last full capacity 3324 mAh = 87%
```

To see more details about battery and related information.

```
$ acpi -V
Battery 0: Charging, 43%, 01:05:07 until charged
Battery 0: design capacity 3815 mAh, last full capacity 3323 mAh = 87%
Adapter 0: on-line
Cooling 0: Processor 0 of 10
Cooling 1: Processor 0 of 10
Cooling 2: Processor 0 of 10
Cooling 3: iwlwifi 0 of 19
Cooling 4: Processor 0 of 10
Cooling 5: iwlwifi no state information available
Cooling 6: Processor 0 of 10
Cooling 7: Processor 0 of 10
Cooling 8: Processor 0 of 10
Cooling 9: intel_powerclamp no state information available
Cooling 10: x86_pkg_temp no state information available
Cooling 11: Processor 0 of 10
```

### How to Check Laptop Battery Status Using Batstat Command?

batstat is a command line tool to print battery status in linux terminal.

```
Status: Charging
Max energy: 50.00 Wh
Energy left: 24.50 Wh
Power Consumption: 26.40 W
Percentage left: 49.00%
Average power Consumption: 0.00 W
Time elapsed: 0: 0:12 since 49.00%
= Time ======== Percent ============================================
 0: 0: 0 49.00%
```

### How to Check Laptop Battery Status Using sysfs filesystem?

The sysfs filesystem is a pseudo-filesystem which provides an interface to kernel data structures. The files under sysfs provide information about devices, kernel modules, filesystems, and other kernel components.

The sysfs filesystem is commonly mounted at /sys. Typically, it is mounted automatically by the system, but it can also be mounted manually using a command such as `mount -t sysfs sysfs /sys`

Many of the files in the sysfs filesystem are read-only, but some files are writable, allowing kernel variables to be changed. To avoid redundancy, symbolic links are heavily used to connect entries across the filesystem tree.

```
$ cat /sys/class/power_supply/BAT0/*
0
51
Normal
0
cat: /sys/class/power_supply/BAT0/device: Is a directory
52260000
60000000
26660000
SMP
L14M4P23
cat: /sys/class/power_supply/BAT0/power: Is a directory
27656000
1
 756
Charging
cat: /sys/class/power_supply/BAT0/subsystem: Is a directory
Li-ion
Battery
POWER_SUPPLY_NAME=BAT0
POWER_SUPPLY_STATUS=Charging
POWER_SUPPLY_PRESENT=1
POWER_SUPPLY_TECHNOLOGY=Li-ion
POWER_SUPPLY_CYCLE_COUNT=0
POWER_SUPPLY_VOLTAGE_MIN_DESIGN=14800000
POWER_SUPPLY_VOLTAGE_NOW=15840000
POWER_SUPPLY_POWER_NOW=27656000
POWER_SUPPLY_ENERGY_FULL_DESIGN=60000000
POWER_SUPPLY_ENERGY_FULL=52260000
POWER_SUPPLY_ENERGY_NOW=26660000
POWER_SUPPLY_CAPACITY=51
POWER_SUPPLY_CAPACITY_LEVEL=Normal
POWER_SUPPLY_MODEL_NAME=L14M4P23
POWER_SUPPLY_MANUFACTURER=SMP
POWER_SUPPLY_SERIAL_NUMBER= 756
14800000
15840000
```

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/check-laptop-battery-status-and-charging-state-in-linux-terminal/

作者：[Magesh Maruthamuthu][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/magesh/
[b]: https://github.com/lujun9972
[1]: https://upower.freedesktop.org/

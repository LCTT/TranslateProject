How To Check System Hardware Manufacturer, Model And Serial Number In Linux
======
Getting system hardware information is not a problem for Linux GUI and Windows users but CLI users facing trouble to get this details.

Even most of us don’t know what is the best command to get this. There are many utilities available in Linux to get system hardware information such as

System Hardware Manufacturer, Model And Serial Number.

We are trying to write possible ways to get this details but you can choose the best method for you.

It is mandatory to know all these information because it will be needed when you raise a case with hardware vendor for any kind of hardware issues.

This can be achieved in six methods, let me show you how to do that.

### Method-1 : Using Dmidecode Command

Dmidecode is a tool which reads a computer’s DMI (stands for Desktop Management Interface) (some say SMBIOS – stands for System Management BIOS) table contents and display system hardware information in a human-readable format.

This table contains a description of the system’s hardware components, as well as other useful information such as serial number, Manufacturer information, Release Date, and BIOS revision, etc,.,

The DMI table doesn’t only describe what the system is currently made of, it also can report the possible evolution (such as the fastest supported CPU or the maximal amount of memory supported).

This will help you to analyze your hardware capability like whether it’s support latest application version or not?
```
# dmidecode -t system

# dmidecode 2.12
# SMBIOS entry point at 0x7e7bf000
SMBIOS 2.7 present.

Handle 0x0024, DMI type 1, 27 bytes
System Information
 Manufacturer: IBM
 Product Name: System x2530 M4: -[1214AC1]-
 Version: 0B
 Serial Number: MK2RL11
 UUID: 762A99BF-6916-450F-80A6-B2E9E78FC9A1
 Wake-up Type: Power Switch
 SKU Number: Not Specified
 Family: System X

Handle 0x004B, DMI type 12, 5 bytes
System Configuration Options
 Option 1: JP20 pin1-2: TPM PP Disable, pin2-3: TPM PP Enable

Handle 0x004D, DMI type 32, 20 bytes
System Boot Information
 Status: No errors detected

```

**Suggested Read :** [Dmidecode – Easy Way To Get Linux System Hardware Information][1]

### Method-2 : Using inxi Command

inxi is a nifty tool to check hardware information on Linux and offers wide range of option to get all the hardware information on Linux system that i never found in any other utility which are available in Linux. It was forked from the ancient and mindbendingly perverse yet ingenius infobash, by locsmif.

inxi is a script that quickly shows system hardware, CPU, drivers, Xorg, Desktop, Kernel, GCC version(s), Processes, RAM usage, and a wide variety of other useful information, also used for forum technical support & debugging tool.
```
# inxi -M
Machine: Device: server System: IBM product: N/A v: 0B serial: MK2RL11
 Mobo: IBM model: 00Y8494 serial: 37M17D UEFI: IBM v: -[VVE134MUS-1.50]- date: 08/30/2013

```

**Suggested Read :** [inxi – A Great Tool to Check Hardware Information on Linux][2]

### Method-3 : Using lshw Command

lshw (stands for Hardware Lister) is a small nifty tool that generates detailed reports about various hardware components on the machine such as memory configuration, firmware version, mainboard configuration, CPU version and speed, cache configuration, usb, network card, graphics cards, multimedia, printers, bus speed, etc.

It’s generating hardware information by reading varies files under /proc directory and DMI table.

lshw must be run as super user to detect the maximum amount of information or it will only report partial information. Special option is available in lshw called class which will shows specific given hardware information in detailed manner.
```
# lshw -C system
enal-dbo01t
 description: Blade
 product: System x2530 M4: -[1214AC1]-
 vendor: IBM
 version: 0B
 serial: MK2RL11
 width: 64 bits
 capabilities: smbios-2.7 dmi-2.7 vsyscall32
 configuration: boot=normal chassis=enclosure family=System X uuid=762A99BF-6916-450F-80A6-B2E9E78FC9A1

```

**Suggested Read :** [LSHW (Hardware Lister) – A Nifty Tool To Get A Hardware Information On Linux][3]

### Method-4 : Using /sys file system

The kernel expose some DMI information in the /sys virtual filesystem. So we can easily get the machine type by running grep command with following format.
```
# grep "" /sys/class/dmi/id/[pbs]*

```

Alternatively we can print only specific details by using cat command.
```
# cat /sys/class/dmi/id/board_vendor
IBM

# cat /sys/class/dmi/id/product_name
System x2530 M4: -[1214AC1]-

# cat /sys/class/dmi/id/product_serial
MK2RL11

# cat /sys/class/dmi/id/bios_version
-[VVE134MUS-1.50]-

```

### Method-5 : Using dmesg Command

The dmesg command is used to write the kernel messages (boot-time messages) in Linux before syslogd or klogd start. It obtains its data by reading the kernel ring buffer. dmesg can be very useful when troubleshooting or just trying to obtain information about the hardware on a system.
```
# dmesg | grep -i DMI
DMI: System x2530 M4: -[1214AC1]-/00Y8494, BIOS -[VVE134MUS-1.50]- 08/30/2013

```

### Method-6 : Using hwinfo Command

hwinfo stands for hardware information tool is another great utility that used to probe for the hardware present in the system and display detailed information about varies hardware components in human readable format.

It reports information about CPU, RAM, keyboard, mouse, graphics card, sound, storage, network interface, disk, partition, bios, and bridge, etc,., This tool could display more detailed information among others like lshw, dmidecode, inxi, etc,.

hwinfo uses libhd library libhd.so to gather hardware information on the system. This tool especially designed for openSUSE system, later other distributions are included the tool into their official repository.
```
# hwinfo | egrep "system.hardware.vendor|system.hardware.product"
 system.hardware.vendor = 'IBM'
 system.hardware.product = 'System x2530 M4: -[1214AC1]-'

```

**Suggested Read :** [hwinfo (Hardware Info) – A Nifty Tool To Detect System Hardware Information On Linux][4]

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/how-to-check-system-hardware-manufacturer-model-and-serial-number-in-linux/

作者：[VINOTH KUMAR][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.2daygeek.com/author/vinoth/
[1]:https://www.2daygeek.com/dmidecode-get-print-display-check-linux-system-hardware-information/
[2]:https://www.2daygeek.com/inxi-system-hardware-information-on-linux/
[3]:https://www.2daygeek.com/lshw-find-check-system-hardware-information-details-linux/
[4]:https://www.2daygeek.com/hwinfo-check-display-detect-system-hardware-information-linux/

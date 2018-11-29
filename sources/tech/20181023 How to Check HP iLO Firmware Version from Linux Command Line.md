How to Check HP iLO Firmware Version from Linux Command Line
======
There are many utilities are available in Linux to get a [hardware information][1].

Each tool has their own unique feature which help us to gather the required information.

We have already wrote many articles about this, the hardware tools are Dmidecode, hwinfo, lshw, inxi, lspci, lssci, lsusb, lsblk, neofetch, screenfetch, etc.,

Today we are going to discuss about the same topic. I will tell you, how to check HP iLO firmware version through Linux command line.

Also read a following articles which is related to Linux hardware.

**Suggested Read :**
**(#)** [LSHW (Hardware Lister) – A Nifty Tool To Get A Hardware Information On Linux][2]
**(#)** [inxi – A Great Tool to Check Hardware Information on Linux][3]
**(#)** [Dmidecode – Easy Way To Get Linux System Hardware Information][4]
**(#)** [Neofetch – Shows Linux System Information With ASCII Distribution Logo][5]
**(#)** [ScreenFetch – Fetch Linux System Information on Terminal with Distribution ASCII art logo][6]
**(#)** [16 Methods To Check If A Linux System Is Physical or Virtual Machine][7]
**(#)** [hwinfo (Hardware Info) – A Nifty Tool To Detect System Hardware Information On Linux][8]
**(#)** [How To Find WWN, WWNN and WWPN Number Of HBA Card In Linux][9]
**(#)** [How To Check System Hardware Manufacturer, Model And Serial Number In Linux][1]
**(#)** [How To Use lspci, lsscsi, lsusb, And lsblk To Get Linux System Devices Information][10]

### What is iLO?

iLO stands for Integrated Lights-Out is a proprietary embedded server management technology by Hewlett-Packard which provides out-of-band management facilities.

I can say this in simple term, it’s a dedicated device management channel which allow users to manage and monitor the device remotely regardless of whether the machine is powered on, or whether an operating system is installed or functional.

It allows a system administrator to monitor all devices such as CPU, RAM, Hardware RAID, fan speed, power voltages, chassis intrusion, firmware (BIOS or UEFI), also manage remote terminals (KVM over IP), remote reboot, shutdown, powering on, etc.

The below list of lights out management (LOM) technology offered by other vendors.

  * **`iLO:`** Integrated Lights-Out by HP
  * **`IMM:`** Integrated Management Module by IBM
  * **`iDRAC:`** Integrated Dell Remote Access Controllers by Dell
  * **`IPMI:`** Intelligent Platform Management Interface – General Standard, it’s used on Supermicro hardware
  * **`AMT:`** Intel Active Management Technology by Intel
  * **`CIMC:`** Cisco Integrated Management Controller by Cisco



The below table will give the details about iLO version and supported hardware’s.

  * **`iLO:`** ProLiant G2, G3, G4, and G6 servers, model numbers under 300
  * **`iLO 2:`** ProLiant G5 and G6 servers, model numbers 300 and higher
  * **`iLO 3:`** ProLiant G7 servers
  * **`iLO 4:`** ProLiant Gen8 and Gen9 servers
  * **`iLO 5:`** ProLiant Gen10 servers



There are three easy ways to check HP iLO firmware version in Linux, Here we are going to show you one by one.

### Method-1: Using Dmidcode Command

[Dmidecode][4] is a tool which reads a computer’s DMI (stands for Desktop Management Interface) (some say SMBIOS – stands for System Management BIOS) table contents and display system hardware information in a human-readable format.

This table contains a description of the system’s hardware components, as well as other useful information such as serial number, Manufacturer information, Release Date, and BIOS revision, etc,.,

The DMI table doesn’t only describe what the system is currently made of, it also can report the possible evolution’s (such as the fastest supported CPU or the maximal amount of memory supported). This will help you to analyze your hardware capability like whether it’s support latest application version or not?

As you run it, dmidecode will try to locate the DMI table. If it succeeds, it will then parse this table and display a list of records which you expect.

First, learn about DMI Types and its keywords, so that we can play nicely without any trouble otherwise we can’t.

```
# dmidecode | grep "Firmware Revision"
 Firmware Revision: 2.40
```

### Method-2: Using HPONCFG Utility

HPONCFG is an online configuration tool used to set up and reconfigure iLO without requiring a reboot of the server operating system. The utility runs in a command-line mode and must be executed from an operating system command line on the local server. HPONCFG enables you to initially configure features exposed through the RBSU or iLO.

Before using HPONCFG, the iLO Management Interface Driver must be loaded on the server. HPONCFG displays a warning if the driver is not installed.

To install this, visit the [HP website][11] and get the latest hponcfg package by searching the following keyword (sample search key word for iLO 4 “HPE Integrated Lights-Out 4 (iLO 4)”). In that you need to click “HP Lights-Out Online Configuration Utility for Linux (AMD64/EM64T)” and download the package.

```
# rpm -ivh /tmp/hponcfg-5.3.0-0.x86_64.rpm
```

Use hponcfg command to get the information.

```
# hponcfg | grep Firmware
Firmware Revision = 2.40 Device type = iLO 4 Driver name = hpilo
```

### Method-3: Using CURL Command

We can use cURL command to get some of the information in XML format, for HP iLO, iLO 2, iLO 3, iLO 4 and iLO 5.

Using cURL command we can get the iLO firmware version without to login to the server or console.

Make sure you have to use right iLO management IP instead of us to get the details. I have removed all the unnecessary details from the below output for better clarification.

```
# curl -k https://10.2.0.101/xmldata?item=All

ProLiant DL380p G8
Integrated Lights-Out 4 (iLO 4)
2.40
```

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/how-to-check-hp-ilo-firmware-version-from-linux-command-line/

作者：[Prakash Subramanian][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/prakash/
[b]: https://github.com/lujun9972
[1]: https://www.2daygeek.com/how-to-check-system-hardware-manufacturer-model-and-serial-number-in-linux/
[2]: https://www.2daygeek.com/lshw-find-check-system-hardware-information-details-linux/
[3]: https://www.2daygeek.com/inxi-system-hardware-information-on-linux/
[4]: https://www.2daygeek.com/dmidecode-get-print-display-check-linux-system-hardware-information/
[5]: https://www.2daygeek.com/neofetch-display-linux-systems-information-ascii-distribution-logo-terminal/
[6]: https://www.2daygeek.com/install-screenfetch-to-fetch-linux-system-information-on-terminal-with-distribution-ascii-art-logo/
[7]: https://www.2daygeek.com/check-linux-system-physical-virtual-machine-virtualization-technology/
[8]: https://www.2daygeek.com/hwinfo-check-display-detect-system-hardware-information-linux/
[9]: https://www.2daygeek.com/how-to-find-wwn-wwnn-and-wwpn-number-of-hba-card-in-linux/
[10]: https://www.2daygeek.com/check-system-hardware-devices-bus-information-lspci-lsscsi-lsusb-lsblk-linux/
[11]: https://support.hpe.com/hpesc/public/home

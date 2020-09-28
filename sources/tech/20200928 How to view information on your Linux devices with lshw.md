[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to view information on your Linux devices with lshw)
[#]: via: (https://www.networkworld.com/article/3583598/how-to-view-information-on-your-linux-devices-with-lshw.html)
[#]: author: (Sandra Henry-Stocker https://www.networkworld.com/author/Sandra-Henry_Stocker/)

How to view information on your Linux devices with lshw
======
The lshw (list hardware) command on Linux systems provides a lot more information on system devices than most of us might imagine is available.
Kali Linux / nevarpp / Getty Images

While far from being one of the first 50 Linux commands anyone learns, the **lshw** command (read as “ls hardware”) can provide a lot of useful details on your system’s hardware.

It extracts details—maybe quite a few more than you knew were available—in a format that is reasonably easy to digest. Given descriptions, logical (device) names, sizes, etc., you are likely to appreciate how much detail you can access.

This post examines the information that **lshw** provides with a particular focus on disk and related hardware. Here is some sample **lshw** output:

```
$ sudo lshw -C disk
  *-disk:0
       description: SCSI Disk
       product: Card Reader-1
       vendor: JIE LI
       physical id: 0.0.0
       bus info: scsi@4:0.0.0
       logical name: /dev/sdc
       version: 1.00
       capabilities: removable
       configuration: logicalsectorsize=512 sectorsize=512
     *-medium
          physical id: 0
          logical name: /dev/sdc
```

Note that you should run the **lshw** command with **sudo** to ensure that you get all of the available details.

While we asked for “disk” in the above command (the output included shows only the first of five entries displayed), this particular output shows not a hard disk, but a card reader—another member of the disk class. Note that the system knows this device as **/dev/sdc**.

Similar details are provided on the primary disk on the system:

```
*-disk
        description: ATA Disk
        product: SSD2SC120G1CS175
        physical id: 0
        bus info: scsi@0:0.0.0
         logical name: /dev/sda         <==
        version: 1101
        serial: PNY20150000778410606
        size: 111GiB (120GB)
        capabilities: partitioned partitioned:dos
        configuration: ansiversion=5 logicalsectorsize=512 sectorsize=512 signature=
           f63b5929
```

This disk is **/dev/sda**. The hard disks on this system both show up as **ATA** disks. **ATA** is a disk-drive implementation that integrates the controller on the disk drive itself.

To get an abbreviated list of devices in the “disk” class, you can run a command like this one. Notice that two of the devices are listed twice, so we are still seeing five disk devices.

```
$ sudo lshw -short -C disk
H/W path               Device      Class          Description
=============================================================
/0/100/1d/1/1/0.0.0    /dev/sdc    disk           Card Reader-1
/0/100/1d/1/1/0.0.0/0  /dev/sdc    disk
/0/100/1d/1/1/0.0.1    /dev/sdd    disk           2
/0/100/1d/1/1/0.0.1/0  /dev/sdd    disk
/0/100/1f.2/0          /dev/sda    disk           120GB SSD2SC120G1CS175
/0/100/1f.2/1          /dev/cdrom  disk           DVD+-RW GSA-H73N
/0/100/1f.5/0.0.0      /dev/sdb    disk           500GB SAMSUNG HE502HJ
```

Hold onto your seat if you decide you want to see _**all**_ of the devices on a system. You will get a list that includes a lot more things than you probably normally think of as “devices”. Here’s an example—and this is the “short” (few details) list:

```
$ sudo lshw -short
[sudo] password for shs:
H/W path               Device      Class          Description
=============================================================
                                   system         Inspiron 530s
/0                                 bus            0RY007
/0/0                               memory         128KiB BIOS
/0/4                               processor      Intel(R) Core(TM)2 Duo CPU
/0/4/a                             memory         32KiB L1 cache
/0/4/b                             memory         6MiB L2 cache
/0/24                              memory         6GiB System Memory
/0/24/0                            memory         2GiB DIMM DDR2 Synchronous 667
/0/24/1                            memory         1GiB DIMM DDR2 Synchronous 667
/0/24/2                            memory         2GiB DIMM DDR2 Synchronous 667
/0/24/3                            memory         1GiB DIMM DDR2 Synchronous 667
/0/1                               generic
/0/10                              generic
/0/11                              generic
/0/12                              generic
/0/13                              generic
/0/14                              generic
/0/15                              generic
/0/17                              generic
/0/18                              generic
/0/19                              generic
/0/2                               generic
/0/20                              generic
/0/100                             bridge         82G33/G31/P35/P31 Express DRAM
/0/100/1                           bridge         82G33/G31/P35/P31 Express PCI
/0/100/1/0                         display        Caicos [Radeon HD 6450/7450/84
/0/100/1/0.1                       multimedia     Caicos HDMI Audio [Radeon HD 6
/0/100/19              enp0s25     network        82562V-2 10/100 Network Connec
/0/100/1a                          bus            82801I (ICH9 Family) USB UHCI
/0/100/1a/1            usb3        bus            UHCI Host Controller
/0/100/1a.1                        bus            82801I (ICH9 Family) USB UHCI
/0/100/1a.1/1          usb4        bus            UHCI Host Controller
/0/100/1a.1/1/2                    input          Rock Candy Wireless Keyboard
/0/100/1a.2                        bus            82801I (ICH9 Family) USB UHCI
/0/100/1a.2/1          usb5        bus            UHCI Host Controller
/0/100/1a.2/1/2                    input          USB OPTICAL MOUSE
/0/100/1a.7                        bus            82801I (ICH9 Family) USB2 EHCI
/0/100/1a.7/1          usb1        bus            EHCI Host Controller
/0/100/1b                          multimedia     82801I (ICH9 Family) HD Audio
/0/100/1d                          bus            82801I (ICH9 Family) USB UHCI
/0/100/1d/1            usb6        bus            UHCI Host Controller
/0/100/1d/1/1          scsi4       storage        CD04
/0/100/1d/1/1/0.0.0    /dev/sdc    disk           Card Reader-1
/0/100/1d/1/1/0.0.0/0  /dev/sdc    disk
/0/100/1d/1/1/0.0.1    /dev/sdd    disk           2
/0/100/1d/1/1/0.0.1/0  /dev/sdd    disk
/0/100/1d.1                        bus            82801I (ICH9 Family) USB UHCI
/0/100/1d.1/1          usb7        bus            UHCI Host Controller
/0/100/1d.2                        bus            82801I (ICH9 Family) USB UHCI
/0/100/1d.2/1          usb8        bus            UHCI Host Controller
/0/100/1d.7                        bus            82801I (ICH9 Family) USB2 EHCI
/0/100/1d.7/1          usb2        bus            EHCI Host Controller
/0/100/1d.7/1/2                    multimedia     USB  Live camera
/0/100/1e                          bridge         82801 PCI Bridge
/0/100/1e/1                        communication  HSF 56k Data/Fax Modem
/0/100/1f                          bridge         82801IR (ICH9R) LPC Interface
/0/100/1f.2            scsi0       storage        82801IR/IO/IH (ICH9R/DO/DH) 4
/0/100/1f.2/0          /dev/sda    disk           120GB SSD2SC120G1CS175
/0/100/1f.2/0/1        /dev/sda1   volume         111GiB EXT4 volume
/0/100/1f.2/1          /dev/cdrom  disk           DVD+-RW GSA-H73N
/0/100/1f.3                        bus            82801I (ICH9 Family) SMBus Con
/0/100/1f.5            scsi3       storage        82801I (ICH9 Family) 2 port SA
/0/100/1f.5/0.0.0      /dev/sdb    disk           500GB SAMSUNG HE502HJ
/0/100/1f.5/0.0.0/1    /dev/sdb1   volume         433GiB EXT4 volume
/0/3                               system         PnP device PNP0c02
/0/5                               system         PnP device PNP0b00
/0/6                               storage        PnP device PNP0700
/0/7                               system         PnP device PNP0c02
/0/8                               system         PnP device PNP0c02
/0/9                               system         PnP device PNP0c01
```

Run a command like this to list device classes and count how many devices are in each class.

```
$ sudo lshw -short | awk ‘{print substr($0,36,13)}’ | tail -n +3 | sort | uniq -c
      4 bridge
     18 bus
      1 communication
      7 disk
      1 display
     12 generic
      2 input
      8 memory
      3 multimedia
      1 network
      1 processor
      4 storage
      6 system
      2 volume
```

**NOTE:** The **awk** command selects the Class column from the **lshw** output using $0 (complete lines), but taking only the substrings that start in the correct place (column 36). None of the class entries have more than 13 letters so the substring ends there. The **tail -n +3** part of the command drops the heading and the “=====” line beneath it, so only the 14 device classes are included in the final listing.

One thing you’ll notice is that we get approximately 12 lines of output for each device in the disk class when we don’t use the **-short** option. We see the logical names, such as **/dev/sda**, disk sizes and types, etc.

```
$ sudo lshw -C disk
[sudo] password for shs:
  *-disk:0
       description: SCSI Disk
       product: Card Reader-1            card reader?
       vendor: JIE LI
       physical id: 0.0.0
       bus info: scsi@4:0.0.0
       logical name: /dev/sdc
       version: 1.00
       capabilities: removable
       configuration: logicalsectorsize=512 sectorsize=512
     *-medium
          physical id: 0
          logical name: /dev/sdc
  *-disk:1
       description: SCSI Disk
       product: 2
       vendor: AC4100 -
       physical id: 0.0.1
       bus info: scsi@4:0.0.1
       logical name: /dev/sdd
       capabilities: removable
       configuration: logicalsectorsize=512 sectorsize=512
     *-medium
          physical id: 0
          logical name: /dev/sdd
  *-disk
       description: ATA Disk
       product: SSD2SC120G1CS175
       physical id: 0
       bus info: scsi@0:0.0.0
       logical name: /dev/sda            main system disk
       version: 1101
       serial: PNY20150000778410606
       size: 111GiB (120GB)
       capabilities: partitioned partitioned:dos
       configuration: ansiversion=5 logicalsectorsize=512 sectorsize=512 signature=f63b5929
  *-cdrom                                        aka /dev/sr0
       description: DVD writer
       product: DVD+-RW GSA-H73N
       vendor: HL-DT-ST
       physical id: 1
       bus info: scsi@1:0.0.0
       logical name: /dev/cdrom
       logical name: /dev/cdrw
       logical name: /dev/dvd
       logical name: /dev/dvdrw
       logical name: /dev/sr0
       version: B103
       serial: [
       capabilities: removable audio cd-r cd-rw dvd dvd-r
       configuration: ansiversion=5 status=nodisc
  *-disk
       description: ATA Disk
       product: SAMSUNG HE502HJ
       physical id: 0.0.0
       bus info: scsi@3:0.0.0
       logical name: /dev/sdb            secondary disk
       version: 0002
       serial: S2B6J90B501053
       size: 465GiB (500GB)
       capabilities: partitioned partitioned:dos
       configuration: ansiversion=5 logicalsectorsize=512 sectorsize=512 signature=7e67ccf3
```

### Wrap-up

The **lshw** command provides details that many of us won’t normally deal with. Still, it’s nice to know how much information is available even if you only use a portion of it.

Join the Network World communities on [Facebook][1] and [LinkedIn][2] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3583598/how-to-view-information-on-your-linux-devices-with-lshw.html

作者：[Sandra Henry-Stocker][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Sandra-Henry_Stocker/
[b]: https://github.com/lujun9972
[1]: https://www.facebook.com/NetworkWorld/
[2]: https://www.linkedin.com/company/network-world

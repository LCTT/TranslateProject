[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Linux commands to display your hardware information)
[#]: via: (https://opensource.com/article/19/9/linux-commands-hardware-information)
[#]: author: (Howard Fosdick https://opensource.com/users/howtechhttps://opensource.com/users/sethhttps://opensource.com/users/sethhttps://opensource.com/users/seth)

Linux commands to display your hardware information
======
Get the details on what's inside your computer from the command line.
![computer screen ][1]

There are many reasons you might need to find out details about your computer hardware. For example, if you need help fixing something and post a plea in an online forum, people will immediately ask you for specifics about your computer. Or, if you want to upgrade your computer, you'll need to know what you have and what you can have. You need to interrogate your computer to discover its specifications.

The easiest way is to do that is with one of the standard Linux GUI programs:

  * [i-nex][2] collects hardware information and displays it in a manner similar to the popular [CPU-Z][3] under Windows.
  * [HardInfo][4] displays hardware specifics and even includes a set of eight popular benchmark programs you can run to gauge your system's performance.
  * [KInfoCenter][5] and [Lshw][6] also display hardware details and are available in many software repositories.



Alternatively, you could open up the box and read the labels on the disks, memory, and other devices. Or you could enter the boot-time panels—the so-called UEFI or BIOS panels. Just hit [the proper program function key][7] during the boot process to access them. These two methods give you hardware details but omit software information.

Or, you could issue a Linux line command. Wait a minute… that sounds difficult. Why would you do this?

Sometimes it's easy to find a specific bit of information through a well-targeted line command. Perhaps you don't have a GUI program available or don't want to install one.

Probably the main reason to use line commands is for writing scripts. Whether you employ the Linux shell or another programming language, scripting typically requires coding line commands.

Many line commands for detecting hardware must be issued under root authority. So either switch to the root user ID, or issue the command under your regular user ID preceded by **sudo**:


```
`sudo <the_line_command>`
```

and respond to the prompt for the root password.

This article introduces many of the most useful line commands for system discovery. The quick reference chart at the end summarizes them.

### Hardware overview

There are several line commands that will give you a comprehensive overview of your computer's hardware.

The **inxi** command lists details about your system, CPU, graphics, audio, networking, drives, partitions, sensors, and more. Forum participants often ask for its output when they're trying to help others solve problems. It's a standard diagnostic for problem-solving:


```
`inxi -Fxz`
```

The **-F** flag means you'll get full output, **x** adds details, and **z** masks out personally identifying information like MAC and IP addresses.

The **hwinfo** and **lshw** commands display much of the same information in different formats:


```
`hwinfo --short`
```

or


```
`lshw -short`
```

The long forms of these two commands spew out exhaustive—but hard to read—output:


```
`hwinfo`
```

or


```
`lshw`
```

### CPU details

You can learn everything about your CPU through line commands. View CPU details by issuing either the **lscpu** command or its close relative **lshw**:


```
`lscpu`
```

or


```
`lshw -C cpu`
```

In both cases, the last few lines of output list all the CPU's capabilities. Here you can find out whether your processor supports specific features.

With all these commands, you can reduce verbiage and narrow any answer down to a single detail by parsing the command output with the **grep** command. For example, to view only the CPU make and model:


```
`lshw -C cpu | grep -i product`
```

To view just the CPU's speed in megahertz:


```
`lscpu | grep -i mhz`
```

or its [BogoMips][8] power rating:


```
`lscpu | grep -i bogo`
```

The **-i** flag on the **grep** command simply ensures your search ignores whether the output it searches is upper or lower case.

### Memory

Linux line commands enable you to gather all possible details about your computer's memory. You can even determine whether you can add extra memory to the computer without opening up the box.

To list each memory stick and its capacity, issue the **dmidecode** command:


```
`dmidecode -t memory | grep -i size`
```

For more specifics on system memory, including type, size, speed, and voltage of each RAM stick, try:


```
`lshw -short -C memory`
```

One thing you'll surely want to know is is the maximum memory you can install on your computer:


```
`dmidecode -t memory | grep -i max`
```

Now find out whether there are any open slots to insert additional memory sticks. You can do this without opening your computer by issuing this command:


```
`lshw -short -C memory | grep -i empty`
```

A null response means all the memory slots are already in use.

Determining how much video memory you have requires a pair of commands. First, list all devices with the **lspci** command and limit the output displayed to the video device you're interested in:


```
`lspci | grep -i vga`
```

The output line that identifies the video controller will typically look something like this:


```
`00:02.0 VGA compatible controller: Intel Corporation 82Q35 Express Integrated Graphics Controller (rev 02)`
```

Now reissue the **lspci** command, referencing the video device number as the selected device:


```
`lspci -v -s 00:02.0`
```

The output line identified as _prefetchable_ is the amount of video RAM on your system:


```
...
Memory at f0100000 (32-bit, non-prefetchable) [size=512K]
I/O ports at 1230 [size=8]
Memory at e0000000 (32-bit, prefetchable) [size=256M]
Memory at f0000000 (32-bit, non-prefetchable) [size=1M]
...
```

Finally, to show current memory use in megabytes, issue:


```
`free -m`
```

This tells how much memory is free, how much is in use, the size of the swap area, and whether it's being used. For example, the output might look like this:


```
              total        used        free     shared    buff/cache   available
Mem:          11891        1326        8877      212        1687       10077
Swap:          1999           0        1999
```

The **top** command gives you more detail on memory use. It shows current overall memory and CPU use and also breaks it down by process ID, user ID, and the commands being run. It displays full-screen text output:


```
`top`
```

### Disks, filesystems, and devices

You can easily determine whatever you wish to know about disks, partitions, filesystems, and other devices.

To display a single line describing each disk device:


```
`lshw -short -C disk`
```

Get details on any specific SATA disk, such as its model and serial numbers, supported modes, sector count, and more with:


```
`hdparm -i /dev/sda`
```

Of course, you should replace **sda** with **sdb** or another device mnemonic if necessary.

To list all disks with all their defined partitions, along with the size of each, issue:


```
`lsblk`
```

For more detail, including the number of sectors, size, filesystem ID and type, and partition starting and ending sectors:


```
`fdisk -l`
```

To start up Linux, you need to identify mountable partitions to the [GRUB][9] bootloader. You can find this information with the **blkid** command. It lists each partition's unique identifier (UUID) and its filesystem type (e.g., ext3 or ext4):


```
`blkid`
```

To list the mounted filesystems, their mount points, and the space used and available for each (in megabytes):


```
`df -m`
```

Finally, you can list details for all USB and PCI buses and devices with these commands:


```
`lsusb`
```

or


```
`lspci`
```

### Network

Linux offers tons of networking line commands. Here are just a few.

To see hardware details about your network card, issue:


```
`lshw -C network`
```

Traditionally, the command to show network interfaces was **ifconfig**:


```
`ifconfig -a`
```

But many people now use:


```
`ip link show`
```

or


```
`netstat -i`
```

In reading the output, it helps to know common network abbreviations:

**Abbreviation** | **Meaning**
---|---
**lo** | Loopback interface
**eth0** or **enp*** | Ethernet interface
**wlan0** | Wireless interface
**ppp0** | Point-to-Point Protocol interface (used by a dial-up modem, PPTP VPN connection, or USB modem)
**vboxnet0** or **vmnet*** | Virtual machine interface

The asterisks in this table are wildcard characters, serving as a placeholder for whatever series of characters appear from system to system. ****

To show your default gateway and routing tables, issue either of these commands:


```
`ip route | column -t`
```

or


```
`netstat -r`
```

### Software

Let's conclude with two commands that display low-level software details. For example, what if you want to know whether you have the latest firmware installed? This command shows the UEFI or BIOS date and version:


```
`dmidecode -t bios`
```

What is the kernel version, and is it 64-bit? And what is the network hostname? To find out, issue:


```
`uname -a`
```

### Quick reference chart

This chart summarizes all the commands covered in this article:

Display info about all hardware | **inxi -Fxz**              _\--or--_
**hwinfo --short**     _\--or--_
**lshw  -short**
---|---
Display all CPU info | **lscpu**                  _\--or--_
**lshw -C cpu**
Show CPU features (e.g., PAE, SSE2) | **lshw -C cpu | grep -i capabilities**
Report whether the CPU is 32- or 64-bit | **lshw -C cpu | grep -i width**
Show current memory size and configuration | **dmidecode -t memory | grep -i size**    _\--or--_
**lshw -short -C memory**
Show maximum memory for the hardware | **dmidecode -t memory | grep -i max**
Determine whether memory slots are available | **lshw -short -C memory | grep -i empty**
(a null answer means no slots available)
Determine the amount of video memory | **lspci | grep -i vga**
then reissue with the device number;
for example:  **lspci -v -s 00:02.0**
The VRAM is the _prefetchable_ value.
Show current memory use | **free -m**    _\--or--_
**top**
List the disk drives | **lshw -short -C disk**
Show detailed information about a specific disk drive | **hdparm -i /dev/sda**
(replace **sda** if necessary)
List information about disks and partitions | **lsblk **     (simple)      _\--or--_
**fdisk -l**   (detailed)
List partition IDs (UUIDs) | **blkid**
List mounted filesystems, their mount points,
and megabytes used and available for each | **df -m**
List USB devices | **lsusb**
List PCI devices | **lspci**
Show network card details | **lshw -C network**
Show network interfaces | **ifconfig -a**       _\--or--_
**ip link show   **_\--or--_
**netstat -i**
Display routing tables | **ip route | column -t`  `**_\--or--_
**netstat -r**
Display UEFI/BIOS info | **dmidecode -t bios**
Show kernel version, network hostname, more | **uname -a**

Do you have a favorite command that I overlooked? Please add a comment and share it.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/9/linux-commands-hardware-information

作者：[Howard Fosdick][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/howtechhttps://opensource.com/users/sethhttps://opensource.com/users/sethhttps://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/features_solutions_command_data.png?itok=4_VQN3RK (computer screen )
[2]: http://sourceforge.net/projects/i-nex/
[3]: https://www.cpuid.com/softwares/cpu-z.html
[4]: http://sourceforge.net/projects/hardinfo.berlios/
[5]: https://userbase.kde.org/KInfoCenter
[6]: http://www.binarytides.com/linux-lshw-command/
[7]: http://www.disk-image.com/faq-bootmenu.htm
[8]: https://en.wikipedia.org/wiki/BogoMips
[9]: https://www.dedoimedo.com/computers/grub.html

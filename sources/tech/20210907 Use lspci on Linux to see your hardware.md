[#]: subject: "Use lspci on Linux to see your hardware"
[#]: via: "https://opensource.com/article/21/9/lspci-linux-hardware"
[#]: author: "Alan Formy-Duval https://opensource.com/users/alanfdoss"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Use lspci on Linux to see your hardware
======
Use the lspci command to display devices and drivers on your Linux
system.
![computer screen ][1]

When you're running Linux on a desktop or server, sometimes you need to identify the hardware in that system. One command used for this is `lspci`. It works by showing all devices attached to the PCI bus. It's provided by the [pciutils][2] package and is available for a wide range of Linux and BSD-based operating systems.

### Basic usage

The information displayed when a regular user runs `lspci` might be limited due to access permissions. Running the command with `sudo` provides a complete picture.

Running `lspci` by itself lists the PCI buses and their attached devices. Here's an example from my media center PC. It's an AMD Phenom CPU-based system, so it has an AMD chipset. It also has an Atheros wireless controller and an Nvidia graphics card. All hardware devices are listed with details such as vendor, name, and model number:


```
$ sudo lspci
00:00.0 Host bridge: Advanced Micro Devices, Inc. [AMD] RS880 Host Bridge
00:02.0 PCI bridge: Advanced Micro Devices, Inc. [AMD] RS780 PCI to PCI bridge (ext gfx port 0)
00:04.0 PCI bridge: Advanced Micro Devices, Inc. [AMD] RS780/RS880 PCI to PCI bridge (PCIE port 0)
00:05.0 PCI bridge: Advanced Micro Devices, Inc. [AMD] RS780/RS880 PCI to PCI bridge (PCIE port 1)
00:11.0 SATA controller: Advanced Micro Devices, Inc. [AMD/ATI] SB7x0/SB8x0/SB9x0 SATA Controller [AHCI mode]
00:12.0 USB controller: Advanced Micro Devices, Inc. [AMD/ATI] SB7x0/SB8x0/SB9x0 USB OHCI0 Controller
00:12.1 USB controller: Advanced Micro Devices, Inc. [AMD/ATI] SB7x0 USB OHCI1 Controller
00:12.2 USB controller: Advanced Micro Devices, Inc. [AMD/ATI] SB7x0/SB8x0/SB9x0 USB EHCI Controller
00:13.0 USB controller: Advanced Micro Devices, Inc. [AMD/ATI] SB7x0/SB8x0/SB9x0 USB OHCI0 Controller
00:13.1 USB controller: Advanced Micro Devices, Inc. [AMD/ATI] SB7x0 USB OHCI1 Controller
00:13.2 USB controller: Advanced Micro Devices, Inc. [AMD/ATI] SB7x0/SB8x0/SB9x0 USB EHCI Controller
00:14.0 SMBus: Advanced Micro Devices, Inc. [AMD/ATI] SBx00 SMBus Controller (rev 3c)
00:14.1 IDE interface: Advanced Micro Devices, Inc. [AMD/ATI] SB7x0/SB8x0/SB9x0 IDE Controller
00:14.3 ISA bridge: Advanced Micro Devices, Inc. [AMD/ATI] SB7x0/SB8x0/SB9x0 LPC host controller
00:14.4 PCI bridge: Advanced Micro Devices, Inc. [AMD/ATI] SBx00 PCI to PCI Bridge
00:14.5 USB controller: Advanced Micro Devices, Inc. [AMD/ATI] SB7x0/SB8x0/SB9x0 USB OHCI2 Controller
00:18.0 Host bridge: Advanced Micro Devices, Inc. [AMD] Family 10h Processor HyperTransport Configuration
00:18.1 Host bridge: Advanced Micro Devices, Inc. [AMD] Family 10h Processor Address Map
00:18.2 Host bridge: Advanced Micro Devices, Inc. [AMD] Family 10h Processor DRAM Controller
00:18.3 Host bridge: Advanced Micro Devices, Inc. [AMD] Family 10h Processor Miscellaneous Control
00:18.4 Host bridge: Advanced Micro Devices, Inc. [AMD] Family 10h Processor Link Control
01:00.0 VGA compatible controller: NVIDIA Corporation GK107 [GeForce GTX 650] (rev a1)
01:00.1 Audio device: NVIDIA Corporation GK107 HDMI Audio Controller (rev a1)
02:00.0 Network controller: Qualcomm Atheros AR9287 Wireless Network Adapter (PCI-Express) (rev 01)
```

### Verbose output

Adding a `-v` option increases the verbosity or the level of detail for each device. You can use `-vv` or `-vvv` for even higher amounts of device detail. At this level, `lspci` displays various subsystems and memory addresses, interrupt request (IRQ) numbers, and other capabilities for all devices. The output is extremely long. Give it a try on your system.

### Searching with grep

Sometimes you want to narrow your search. For instance, the RPM Fusion web site has instructions for installing Nvidia graphics drivers. They begin with identifying your graphics card using the `grep` command. This is what I get on my laptop:


```
$ sudo lspci | grep -e VGA
00:02.0 VGA compatible controller: Intel Corporation UHD Graphics 620 (rev 07)
$ sudo lspci | grep -e 3D
01:00.0 3D controller: NVIDIA Corporation GM108M [GeForce MX130] (rev a2)
```

The `grep` commands above show one VGA device on my media center PC but no 3D device.


```
$ sudo lspci | grep -e VGA
01:00.0 VGA compatible controller: NVIDIA Corporation GK107 [GeForce GTX 650] (rev a1)
$ sudo lspci | grep -e 3D
$
```

### Searching by vendor ID

There is another way that doesn't require `grep`. Suppose I want to determine whether any other Nvidia devices are present. It's necessary to know a little more. I use the `-nn` option to display vendor and device ID numbers. On my media center PC, this option shows my VGA card, vendor ID, and device ID:


```
$ sudo lspci -nn | grep -e VGA
01:00.0 VGA compatible controller [0300]: NVIDIA Corporation GK107 [GeForce GTX 650] [10de:0fc6] (rev a1)
```

The set of brackets with the colon-separated numbers after the device name shows the vendor and device ID. The output indicates that the vendor ID for a device made by Nvidia Corporation is **10de**.

The `-d` option displays all devices from a specified vendor, device, or class ID. Here are all the Nvidia devices in my system (keeping the `-nn` to include the vendor IDs):


```
$ sudo lspci -nn -d 10de:
01:00.0 VGA compatible controller [0300]: NVIDIA Corporation GK107 [GeForce GTX 650] [10de:0fc6] (rev a1)
01:00.1 Audio device [0403]: NVIDIA Corporation GK107 HDMI Audio Controller [10de:0e1b] (rev a1)
```

From the output, you can see that in addition to a graphics card, I have an Nvidia audio device. They are both actually part of the same **Nvidia GeForce GTX 650** card, but this is a good example nonetheless.

### Kernel modules

Along with PCI hardware devices, `lspci` can show what kernel driver modules are loaded with the `-k` option. I add this option to my `lspci` commands to view several pieces of information about my Nvidia devices.


```
$ sudo lspci -nn -k -d 10de:
01:00.0 VGA compatible controller [0300]: NVIDIA Corporation GK107 [GeForce GTX 650] [10de:0fc6] (rev a1)
 Subsystem: eVga.com. Corp. GK107 [GeForce GTX 650] [3842:2650]
 Kernel driver in use: nvidia
 Kernel modules: nvidiafb, nouveau, nvidia_drm, nvidia
01:00.1 Audio device [0403]: NVIDIA Corporation GK107 HDMI Audio Controller [10de:0e1b] (rev a1)
 Subsystem: eVga.com. Corp. GK107 HDMI Audio Controller [3842:2650]
 Kernel driver in use: snd_hda_intel
 Kernel modules: snd_hda_intel
```

Two additional lines are displayed: _Kernel driver in use_ and _Kernel modules_. The second one lists the modules available to support the device.

### Keeping up to date

New devices and vendors are constantly entering the market. If you see a device listed as _unknown_, your PCI device ID database may be outdated. There are two ways to check. The `-Q` option uses DNS to query the central database. This, of course, requires network connectivity.


```
`$ sudo lspci -Q`
```

You can also update your local PCI ID database by running the command `update-pciids`.


```
$ sudo update-pciids
Downloaded daily snapshot dated 2021-08-22 03:15:01
```

### Learn more about your hardware

Of course, `lspci` is just one of many commands available for Linux that is useful for querying the hardware and software on your system. Learn more about hardware on Linux in my article covering USB devices: [Recognize more devices on Linux with this USB ID Repository][3].

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/9/lspci-linux-hardware

作者：[Alan Formy-Duval][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/alanfdoss
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/features_solutions_command_data.png?itok=4_VQN3RK (computer screen )
[2]: https://mj.ucw.cz/sw/pciutils/
[3]: https://opensource.com/article/20/8/usb-id-repository

[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How To Find Hardware Specifications On Linux)
[#]: via: (https://www.ostechnix.com/getting-hardwaresoftware-specifications-in-linux-mint-ubuntu/)
[#]: author: (sk https://www.ostechnix.com/author/sk/)

How To Find Hardware Specifications On Linux
======

There are plenty of tools available to find hardware specifications on Linux systems. Here, I have listed four most commonly used tools to get almost all hardware (and software) details of a Linux system. Good thing is these tools comes pre-installed by default on some Linux distributions. I tested these tools on Ubuntu 18.04 LTS desktop, however they should work on other Linux distros as well.

### 1\. LSHW

**Lshw (Hardware Lister)** is a simple, yet full-featured utility that provides detailed information on the hardware configuration of a Linux system. It can report exact memory configuration, firmware version, mainboard configuration, CPU version and speed, cache configuration, bus speed etc. Information can be output in plain text, XML or HTML.

It currently supports DMI (x86 and EFI only), Open Firmware device tree (PowerPC only), PCI/AGP, ISA PnP (x86), CPUID (x86), IDE/ATA/ATAPI, PCMCIA (only tested on x86), USB and SCSI.

Like I already said, lshw comes pre-installed with Ubuntu by default. If it isn’t installed in your Ubuntu system, install it using the command:

```
$ sudo apt install lshw lshw-gtk
```

On other Linux distributions, for example Arch Linux, run:

```
$ sudo pacman -S lshw lshw-gtk
```

Once installed, run lshw to find your system hardware details:

```
$ sudo lshw
```

You will see the detailed output of your system’s hardware specifications.

**Sample output:**

![][2]

Find Hardware Specifications On Linux using lshw

Please be mindful that if you run lshw command without sudo rights, the output may be incomplete or inaccurate.

Lshw can display the output as an HTML page. To do so, use:

```
$ sudo lshw -html
```

Likewise, we can output the device tree as XML and json formats like below.

```
$ sudo lshw -xml

$ sudo lshw -json
```

To output the device tree showing hardware paths, use -short option:

```
$ sudo lshw -short
```

![][3]

Show device tree with hardware path using lshw

To list devices with bus information, detailing SCSI, USB, IDE and PCI addresses, run:

```
$ sudo lshw -businfo
```

By default, lshw display all hardware details. You can also view the hardware information of a specific hardware details based on **Class** options such as processor, memory, display etc. The class options can be found using **lshw -short** or **lshw -businfo** commands.

To display a specific hardware details, for example Processor, do:

```
$ sudo lshw -class processor
```

Sample output:

```
*-cpu
description: CPU
product: Intel(R) Core(TM) i3-2350M CPU @ 2.30GHz
vendor: Intel Corp.
physical id: 4
bus info: [email protected]
version: Intel(R) Core(TM) i3-2350M CPU @ 2.30GHz
serial: To Be Filled By O.E.M.
slot: CPU 1
size: 913MHz
capacity: 2300MHz
width: 64 bits
clock: 100MHz
capabilities: x86-64 fpu fpu_exception wp vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall nx rdtscp constant_tsc arch_perfmon pebs bts rep_good nopl xtopology nonstop_tsc cpuid aperfmperf pni pclmulqdq dtes64 monitor ds_cpl vmx est tm2 ssse3 cx16 xtpr pdcm pcid sse4_1 sse4_2 x2apic popcnt tsc_deadline_timer xsave avx lahf_lm epb pti ssbd ibrs ibpb stibp tpr_shadow vnmi flexpriority ept vpid xsaveopt dtherm arat pln pts md_clear flush_l1d cpufreq
configuration: cores=2 enabledcores=1 threads=2
```

Similarly, we can get system details using command:

```
$ sudo lshw -class system
```

Get hard disk details:

```
$ sudo lshw -class disk
```

Get network details:

```
$ sudo lshw -class network
```

Get memory details:

```
$ sudo lshw -class memory
```

Also, we can list details of multiple devices like below.

```
$ sudo lshw -class storage -class power -class volume
```

If you want to view the details with hardware path, just add **-short** option.

```
$ sudo lshw -short -class processor
```

Output:

```
H/W path Device Class Description
=======================================================
/0/4 processor Intel(R) Core(TM) i3-2350M CPU @ 2.30GHz
```

Sometimes you might want to share your hardware details to someone, for example customer support person. If so, you can remove potentially sensitive information, such as IP addresses, serial numbers, etc., from output like below.

```
$ lshw -sanitize
```

**Lshw-gtk GUI utility
**

If you’re not comfortable with CLI, you can use **lshw-gtk** which is the graphical interface for lshw command line tool.

It can be opened either from Terminal or Dash.

To launch it from Terminal, simply do:

```
$ sudo lshw-gtk
```

Here is the default GUI interface of lshw tool.

![][4]

Find Hardware Specifications On Linux using lshw-gtk

Just double click on “Portable Computer” to expand it further.

![][5]

Find Hardware Specifications On Linux using lshw-gtk GUI

You can keep double click on subsequent hardware tab to get the detailed view.

For more details, refer man pages.

```
$ man lshw
```

### 2\. Inxi

**Inxi** is my another favorite tool to find almost everything about a Linux system. It is a free, open source, and full featured command line system information tool. It shows system hardware, CPU, drivers, Xorg, Desktop, Kernel, GCC version(s), Processes, RAM usage, and a wide variety of other useful information. Be it a hard disk or CPU, mother board or the complete detail of the entire system, inxi will display it more accurately in seconds. Since it is CLI tool, you can use it in Desktop or server edition. For more details, refer the following guide.

  * [**How To Find Linux System Details Using inxi**][6]



### 3\. Hardinfo

**Hardinfo** will get you the both hardware and software details of your system which isn’t available in the _lshw._
HardInfo can gather information about your system’s hardware and operating system, perform benchmarks, and generate printable reports either in HTML or in plain text formats.

If Hardinfo isn’t installed in Ubuntu, install it using the command:***

* * *

```
$ sudo apt install hardinfo
```

Once installed, Hardinfo tool either from the Terminal or Menu.

Here is how Hardinfo default interface looks like.

![][7]

Find Hardware Specifications On Linux Using Hardinfo

As you see in the above screenshot, Hardinfo has simple and intuitive GUI.

All hardware information have grouped in four main groups namely **Computer** , **Devices** , **Network** , and **Benchmarks**. Each group has shows specific hardware details.

For example, to view your processor details, click on “Processor” option under “Devices” group.

![][8]

Show processor details using hardinfo

Unlike lshw, Hardinfo helps you to find basic software specifications like operating system details, kernel modules, locale information, filesystem usage, users/groups, and development tools etc.

![][9]

Show operating system details using hardinfo

Another notable feature of Hardinfo is it allows us to do simple benchmarks to test CPU and FPU capabilities and some of the graphical user interface capabilities.

![][10]

Perform benchmarks using hardinfo

* * *

**Suggested read:**

  * [**Phoronix Test Suite – An Open Source Testing And Benchmarking Tool**][11]
  * [**UnixBench – A Benchmark Suite For Unix-like Systems**][12]
  * [**How To Benchmark Linux Commands And Programs From Commandline**][13]



* * *

We can generate reports of our entire system as well as individual devices. To generate report, simply click on “Generate Report” button on the menu bar and choose the information that you want to include in the report.

![][14]

Generate system reports using hardinfo

Hardinfo has few command line options as well.

For instance, to generate report and display it in the Terminal, run:

```
$ hardinfo -r
```

List modules:

```
$ hardinfo -l
```

For more details, refer man pages.

```
$ man hardinfo
```

### 4\. Sysinfo

**Sysinfo** is yet another alternative to HardInfo and lshw-gtk utilities that can be used to get both hardware and software information as listed below.

  * System details such as distribution release, versions of GNOME, kernel, gcc and Xorg and hostname.
  * CPU details like vendor identification, model name, frequency, L2 cache, model numbers and flags.
  * Memory details such as total system RAM, free memory, swap space total and free, cached, active/inactive memory.
  * Storage Controllers such as IDE interface, all IDE devices, SCSI devices.
  * Hardware details such as motherboard, graphic card, sound card and network devices.



Let us install sysinfo using the command:

```
$ sudo apt install sysinfo
```

Sysinfo can be launched either from from Terminal or Dash.

To launch it from terminal, run:

$ sysinfo

Here is the default interface of Sysinfo utility.

![][15]

sysinfo interface

As you can see, all hardware(and software) details have been grouped under five categories namely System, CPU, Memory, Storage and Hardware. Click on a category on the navigation bar to get respective details.

![][16]

Find Hardware Specifications On Linux Using Sysinfo

Further details can be found on man pages.

```
$ man sysinfo
```

And, that’s all. Like I already mentioned there could be many tools available to display Hardware/Software Specifications. However, these four tools are just enough to find everything about your Linux distribution.

**Inxi** is my another favorite tool to find almost everything about a Linux system. It is a free, open source, and full featured command line system information tool. It shows system hardware, CPU, drivers, Xorg, Desktop, Kernel, GCC version(s), Processes, RAM usage, and a wide variety of other useful information. Be it a hard disk or CPU, mother board or the complete detail of the entire system, inxi will display it more accurately in seconds. Since it is CLI tool, you can use it in Desktop or server edition. For more details, refer the following guide.

  * [**How To Find Linux System Details Using inxi**][6]



### 3\. Hardinfo

--------------------------------------------------------------------------------

via: https://www.ostechnix.com/getting-hardwaresoftware-specifications-in-linux-mint-ubuntu/

作者：[sk][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.ostechnix.com/author/sk/
[b]: https://github.com/lujun9972
[2]: https://www.ostechnix.com/wp-content/uploads/2013/01/Find-Hardware-Specifications-On-Linux-using-lshw-1.png
[3]: https://www.ostechnix.com/wp-content/uploads/2013/01/Show-device-tree-with-hardware-path-using-lshw.png
[4]: https://www.ostechnix.com/wp-content/uploads/2013/01/Find-Hardware-Specifications-On-Linux-using-lshw-gtk-1.png
[5]: https://www.ostechnix.com/wp-content/uploads/2013/01/Find-Hardware-Specifications-On-Linux-using-lshw-gtk-2.png
[6]: https://www.ostechnix.com/how-to-find-your-system-details-using-inxi/
[7]: https://www.ostechnix.com/wp-content/uploads/2013/01/Find-Hardware-Specifications-On-Linux-Using-Hardinfo.png
[8]: https://www.ostechnix.com/wp-content/uploads/2013/01/Show-processor-details-using-hardinfo.png
[9]: https://www.ostechnix.com/wp-content/uploads/2013/01/Show-operating-system-details-using-hardinfo.png
[10]: https://www.ostechnix.com/wp-content/uploads/2013/01/Perform-benchmarks-using-hardinfo.png
[11]: https://www.ostechnix.com/phoronix-test-suite-open-source-testing-benchmarking-tool/
[12]: https://www.ostechnix.com/unixbench-benchmark-suite-unix-like-systems/
[13]: https://www.ostechnix.com/how-to-benchmark-linux-commands-and-programs-from-commandline/
[14]: https://www.ostechnix.com/wp-content/uploads/2013/01/Generate-system-reports-using-hardinfo.png
[15]: https://www.ostechnix.com/wp-content/uploads/2013/01/sysinfo-interface.png
[16]: https://www.ostechnix.com/wp-content/uploads/2013/01/Find-Hardware-Specifications-On-Linux-Using-Sysinfo.png

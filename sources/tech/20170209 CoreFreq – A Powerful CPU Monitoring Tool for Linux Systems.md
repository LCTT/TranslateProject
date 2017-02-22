translating---geekpi

CoreFreq – A Powerful CPU Monitoring Tool for Linux Systems
============================================================

CoreFreq is a [CPU monitoring program][1] intended for the Intel 64-bits processor and supports architectures such as Atom, Core2, Nehalem, SandyBridge and above, AMD Family 0F.

Its core is established on a kernel module which helps to retrieve internal performance counters from each CPU core, and works in relation with a daemon which gathers the data and a small console client links to the daemon and displays collected data.

[
 ![CoreFreq CPU Monitoring](http://www.tecmint.com/wp-content/uploads/2017/02/CoreFreq-CPU-Monitoring.gif) 
][2]

It offers a groundwork to recapture CPU data with a high degree of accuracy:

1.  Core frequencies & ratios; SpeedStep (EIST), Turbo Boost, Hyper-Threading (HTT) as well as Base Clock.
2.  Performance counters in conjunction with Time Stamp Counter (TSC), Unhalted Core Cycles (UCC), Unhalted Reference Cycles (URC).
3.  Number of instructions per cycle or second, IPS, IPC, or CPI.
4.  CPU C-States C0 C1 C3 C6 C7 – C1E – Auto/UnDemotion of C1 C3.
5.  DTS Temperature along with Tjunction Max, Thermal Monitoring TM1 TM2 state.
6.  Topology map including Caches for boostrap together with application CPU.
7.  Processor features, brand plus architecture strings.

Note: This tool is more useful and appropriate for expert Linux users and experienced system administrators, however, novice users can gradually learn how to purposefully use it.

#### How Does CoreFreq Works

It functions by invoking a Linux Kernel module which then uses:

1.  asm code to keep the readings of the performance counters as close as possible.
2.  per-CPU, effects slab data memory plus high-resolution timer.
3.  compliant with suspend / resume and CPU Hot-Plug.
4.  a shared memory to protect kernel from the user-space part of the program.
5.  atomic synchronization of threads to do away with mutexes and deadlock.

### How to Install CoreFreq in Linux

To install CoreFreq, first you need to install the prerequisites (Development Tools) to compile and build the program from source.

```
$ sudo yum group install 'Development Tools'           [On CentOS/RHEL]
$ sudo dnf  group install 'Development Tools'          [On Fedora 22+ Versions]
# sudo apt-get install dkms git libpthread-stubs0-dev  [On Debian/Ubuntu] 
```

Next clone the CoreFreq source code from the Github repository, move into the download folder and compile and build the program:

```
$ git clone https://github.com/cyring/CoreFreq.git
$ cd CoreFreq
$ make 
```
[
 ![Build CoreFreq Program](http://www.tecmint.com/wp-content/uploads/2017/02/make-corefreq.png) 
][3]

Build CoreFreq Program

Note: Arch Linux users can install [corefreq-git][4] from the AUR.

Now run the following commands to load the Linux kernel module from local directory followed by the daemon:

```
$ sudo insmod corefreqk.ko
$ sudo ./corefreqd
```

Then, start the client, as a user.

```
$ ./corefreq-cli
```
[
 ![CoreFreq Linux CPU Monitoring](http://www.tecmint.com/wp-content/uploads/2017/02/CoreFreq-Linux-CPU-Monitoring.gif) 
][5]

CoreFreq Linux CPU Monitoring

From the interface above, you can use shortcut keys:

1.  `F2` to display a usage menu as seen at the top section of the screen.
2.  `Right` and `Left` arrows to move over the menu tabs.
3.  `Up` and `Down` arrows to select a menu item, then click [Enter].
4.  `F4` will close the program.
5.  `h` will open a quick reference.

To view all usage options, type the command below:

```
$ ./corefreq-cli -h
```
CoreFreq Options
```
CoreFreq.  Copyright (C) 2015-2017 CYRIL INGENIERIE
usage:	corefreq-cli [-option <arguments>]
-t	Show Top (default)
-d	Show Dashboard
arguments: <left> <top> <marginWidth> <marginHeight>
-c	Monitor Counters
-i	Monitor Instructions
-s	Print System Information
-M	Print Memory Controller
-m	Print Topology
-u	Print CPUID
-k	Print Kernel
-h	Print out this message
Exit status:
0	if OK,
1	if problems,
>1	if serious trouble.
Report bugs to labs[at]cyring.fr
```

To print info about the kernel, run:

```
$ ./corefreq-cli -k
```

Print CPU identification details:

```
$ ./corefreq-cli -u
```

You can as well monitor CPU instructions in real-time:

```
$ ./corefreq-cli -i
```

Enable tracing of counters as below:

```
$ ./corefreq-cli -c
```

For more information and usage, visit the CoreFreq Github repository: [https://github.com/cyring/CoreFreq][6]

In this article, we reviewed a powerful CPU monitoring tool, which may be more useful to Linux experts or experienced system administrators as compared to novice users.

Share your thoughts about this command tool or any related ideas with us via the feedback form below.

--------------------------------------------------------------------------------

作者简介：

Aaron Kili is a Linux and F.O.S.S enthusiast, an upcoming Linux SysAdmin, web developer, and currently a content creator for TecMint who loves working with computers and strongly believes in sharing knowledge.

--------------------------------------------------------------------------------

via: http://www.tecmint.com/corefreq-linux-cpu-monitoring-tool/

作者：[Aaron Kili][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/aaronkili/

[1]:http://www.tecmint.com/bcc-best-linux-performance-monitoring-tools/
[2]:http://www.tecmint.com/wp-content/uploads/2017/02/CoreFreq-CPU-Monitoring.gif
[3]:http://www.tecmint.com/wp-content/uploads/2017/02/make-corefreq.png
[4]:https://aur.archlinux.org/packages/corefreq-git
[5]:http://www.tecmint.com/wp-content/uploads/2017/02/CoreFreq-Linux-CPU-Monitoring.gif
[6]:https://github.com/cyring/CoreFreq

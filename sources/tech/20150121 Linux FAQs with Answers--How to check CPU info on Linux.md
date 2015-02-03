Linux有问必答时间--如何查看Linux系统的CPU信息
================================================================================
> **问题**: 我想要了解我的电脑关于CPU处理器的详细信息，查看CPU信息比较有效地方法是什么？

根据你的需要，有各种各样的关于你的CPU处理器信息你需要了解，比如CPU供应商名、模型名、时钟频率、套接字/内核的数量, L1/L2/L3缓存配置、可用的处理器能力(比如：硬件虚拟化、AES, MMX, SSE)等等。在Linux中，有许多命令行或基于GUI的工具就能来展示你的CPU硬件的相关具体信息。

### 1. /proc/cpuinfo ###

最简单的方法就是查看 /proc/cpuinfo ，这个虚拟文件展示的是可用CPU硬件的配置。

    $ more /proc/cpuinfo 

![](https://farm8.staticflickr.com/7572/15934711577_4136a8e0b9_c.jpg)

通过查看这个文件，你能[识别出][1]物理处理器数、每个CPU核心数、可用的CPU标志寄存器以及其它东西的数量。

### 2. cpufreq-info ###

cpufreq-info命令(**cpufrequtils**包的一部分)从内核/硬件中收集并报告CPU频率信息。这条命令展示了CPU当前运行的硬件频率，包括CPU所允许的最小/最大频率、CPUfreq策略/统计数据等等。来看下CPU #0上的信息：

    $ cpufreq-info -c 0 

![](https://farm8.staticflickr.com/7484/16094667926_d979240081_c.jpg)

### 3. cpuid ###

cpuid命令的功能就相当于一个专用的CPU信息工具，它能通过使用[CPUID功能][2]来显示详细的关于CPU硬件的信息。信息报告包括处理器类型/家族、CPU扩展指令集、缓存/TLB（译者注：传输后备缓冲器）配置、电源管理功能等等。

    $ cpuid 

![](https://farm9.staticflickr.com/8563/15500753923_6f1b25e8e9_c.jpg)

### 4. dmidecode ###

dmidecode命令直接从BIOS的DMI（译者注：桌面管理接口）数据收集关于系统硬件的具体信息。CPU信息报告包括CPU供应商、版本、CPU flags, maximum/current clock speed, (enabled) core count, L1/L2/L3 cache configuration, and so on. 

    $ sudo dmidecode 

![](https://farm8.staticflickr.com/7503/16094667836_825b61d0e5_b.jpg)

### 5. hardinfo ###

The hardinfo is a GUI-based system information tool which can give you an easy-to-understand summary of your CPU hardware, as well as other hardware components of your system.

    $ hardinfo 

![](https://farm8.staticflickr.com/7482/15933041268_40ccc17407_b.jpg)

### 6. i7z ###

i7z is a real-time CPU reporting tool dedicated to Intel Core i3, i5 and i7 CPUs. It can display various per-core information in real time, such as Turbo Boost states, CPU frequencies, CPU power states, temperature measurements, and so on. i7z runs in either ncurses-based console mode or QT based GUI.

    $ sudo i7z 

![](https://farm8.staticflickr.com/7546/15534687744_1968dc2b18_c.jpg)

### 8. likwid-topology ###

[likwid][3] (Like I Knew What I'm Doing) is a collection of command-line tools to measure, configure and display hardware related properties. Among them is likwid-topology which shows CPU hardware (thread/cache/NUMA) topology information. It can also identify processor families (e.g., Intel Core 2, AMD Shanghai).

![](https://farm8.staticflickr.com/7511/15934711707_5dc0793599_b.jpg)

### 9. lscpu ###

The lscpu command summarizes /etc/cpuinfo content in a more user-friendly format, e.g., the number of (online/offline) CPUs, cores, sockets, NUMA nodes.

    $ lscpu 

![](https://farm8.staticflickr.com/7501/15933173470_69e53b3021_b.jpg)

### 10. lshw ###

The **lshw** command is a comprehensive hardware query tool. Unlike other tools, lshw requires root privilege because it query DMI information in system BIOS. It can report the total number of cores and enabled cores, but miss out on information such as L1/L2/L3 cache configuration. The GTK version lshw-gtk is also available.

    $ sudo lshw -class processor

![](https://farm9.staticflickr.com/8649/15498132484_a47c4e8cb3_c.jpg)

### 11. lstopo ###

The lstopo command (contained in [hwloc][4] package) visualizes the topology of the system which is composed of CPUs, cache, memory and I/O devices. This command is useful to identify the processor architecture and NUMA topology of the system.

    $ lstopo 

![](https://farm8.staticflickr.com/7490/15934399829_4012213734_z.jpg)

### 12. numactl ###

Originally developed to set the NUMA scheduling and memeory placement policy of Linux processes, the numactl command can also show information about NUMA topology of the CPU hardware from the command line.

    $ numactl --hardware 

![](https://farm8.staticflickr.com/7553/16094667876_9d7daa77a1_b.jpg)

### 13. x86info ###

x86info is a command-line tool for showing x86-based CPU information. Reported information includes CPU model, number of threads/cores, clock speed, TLB cache configuration, supported feature flags, etc.

    $ x86info --all

![](https://farm8.staticflickr.com/7522/16131238626_d8a703c060_c.jpg)

--------------------------------------------------------------------------------

via: http://ask.xmodulo.com/check-cpu-info-linux.html

译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://xmodulo.com/how-to-find-number-of-cpu-cores-on.html
[2]:http://en.wikipedia.org/wiki/CPUID
[3]:http://xmodulo.com/identify-cpu-processor-architecture-linux.html
[4]:http://xmodulo.com/identify-cpu-processor-architecture-linux.html

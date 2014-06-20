戴文的Linux内核专题：07 配置内核 (3)
================================================================================

OK，我们还继续配置内核。还有更多功能等待着去配置。

下一个问题(Enable ELF core dumps (ELF\_CORE))询问的是内核是否可以生成内核转储文件。这会使内核变大4KB。所以我选择了"no"。

注意：内核转储文件(内存或者系统的转储)是程序崩溃前已记录的状态。内核转储是用来调试问题的。这个转储文件的格式是ELF(Executable and Linkable Format )。

下面可以启用PC扬声器(Enable PC-Speaker support (PCSPKR\_PLATFORM))。大多数计算机用户拥有并使用扬声器，所以这个启用它。

虽然下面的特性会增加内核的大小(Enable full-sized data structures for core (BASE\_FULL))（启用完全大小的内核数据结构），但性能也随之增加。所以我选择"yes"。

为了使内核可以运行基于glibc的程序，必须启用FUTEX(Enable futex support (FUTEX))。这个特性启用了快速用户空间互斥锁(Fast Userspace muTEXes)。

注意：glibc(GNU C Library)是由GNU实现的标准C库。

注意：FUTEX (fast userspace mutex)是用来防止两个线程访问同一个不能被多个线程使用的共享资源。

下一个问题(Enable eventpoll support (EPOLL))可以通过回答"no"来禁用epoll系统调用。然而，为了含有epoll系统调用，我选择了"yes"。epoll是一种I/O事件通知系统。

为了收到来自文件描述符的信号，我们启用signalfd系统调用(Enable signalfd() system call (SIGNALFD)。

如果启用这个特性(Enable timerfd() system call (TIMERFD))，它允许程序使用定时器事件获取文件描述符。

我们现在的配置必须启用eventfd系统调用(Enable eventfd() system call (EVENTFD))。它默认启用访问共享内存文件系统(Use full shmem filesystem (SHMEM)。共享内存文件系统是一种虚拟内存文件系统。

下一个问题是"Enable AIO support (AIO)"。这个特性启用了线程化程序使用的POSIX异步I/O。

注意：异步I/O用来处理输入/输出，它允许线程在传输完成前就完成处理。

如果你正在给一个嵌入式系统配置一个内核，那么问题“Embedded system (EMBEDDED)”可以选择"yes"。否则就像我一样选择"no"。

注意：嵌入式系统是运行在一个更大的电子系统的实时计算机。

现在，我们可以配置内核性能事件和计时器了。配置工具没有给开发者选择，直接启用了事件和计数器(Kernel performance events and counters (PERF\_EVENTS))（内核性能事件和计数器）。这是一个重要特性。

接下来，我们可以禁用另外一个调试特性(ebug: use vmalloc to back perf mmap() buffers (DEBUG\_PERF\_USE\_VMALLOC))。

如果启用了VM事件计数器，那么事件计数就会显示在/proc/vmstat(Enable VM event counters for /proc/vmstat (VM\_EVENT\_COUNTERS))。如果禁用了事件计数就不会显示，/proc/vmstat只会显示内存页计数。

为了更好地支持PCI芯片，(Enable PCI quirk workarounds (PCI\_QUIRKS))回答yes。这会启用对PCI芯片的怪异行为和bug的临时解决方案。

下面一个调试特性可以像我一样禁用掉(Enable SLUB debugging support (SLUB\_DEBUG))。这个特性会耗费很多空间并且会禁用用于调试内核的SLB sysfs。如果这个特性被禁用，那么/sys/slab就不会存在并且系统上也不再支持缓冲验证。

堆随机化是一个让利用堆漏洞更加困难的特性(Disable heap randomization (COMPAT\_BRK))。然而我们不应该去启用它，因为任何基于libc5的软件都无法工作在这个系统上！只有我们有特别的理由这么做或者如果你不会使用基于libc5的软件时才去启用它。我禁用了这个特性。当编译一个通用的内核时，开发这会希望禁用这个特性。

接下来必须选择一个SLAB分配器。SLAB分配器是一个没有碎片且有效率地将内核对象放置在内存中的内存管理系统。默认选择是"2"。

Choose SLAB allocator

	1. SLAB (SLAB)
	> 2. SLUB (Unqueued Allocator) (SLUB)
	3. SLOB (Simple Allocator) (SLOB)
choice[1-3?]: 2

为了支持扩展性能支持，(Profiling support (PROFILING))回答"yes"。

下一个问题让开发者选择是否启用OProfile系统。它可以禁用、启用或者添加为一个模块在需要时载入。我选择禁用这个特性。

Kprobes允许用户捕捉几乎任意的内核地址去启动一个回调函数。这是一个可以像我一样禁用的调试工具(Kprobes (KPROBES))。

这个优化特性可以启用(Optimize very unlikely/likely branches (JUMP\_LABEL))（优化非常近似/不近似的分支）。这使分支预判更加简单并可以减小开销。

配置工具启用了一个实验性特性"透明用户空间探针"(Transparent user-space probes (EXPERIMENTAL) (UPROBES))。不过不要担心，系统可以很好工作，并不是所有的实验性特性是不稳定或者坏的。

接下来，我们会被询问基于gcov的内核分析(Enable gcov-based kernel profiling (GCOV\_KERNEL))。这可以被禁用。

为了允许内核加载模块，需要启用可加载模块支持(Enable loadable module support (MODULES))。

内核一般只能加载有版本号的模块。如果想允许内核加载没有版本号的模块，就启用这个特性(Forced module loading (MODULE\_FORCE\_LOAD))（强制模块载入）。这么做是一个很糟糕的注意，所以我已经禁用了它，除非你有特定的需求需要这个特性。

如果启用了这个特性(Module unloading (MODULE\_UNLOAD))，Linux内核也能卸载模块，最好启用。如果内核判断你要卸载的模块不应该被卸载，那么用户则无法卸载模块。启用强制卸载也行，但是不建议(Forced module unloading (MODULE\_FORCE\_UNLOAD)。

为了使用不是为你的内核开发的或者并不适用你的版本号的模块，可以启用版本支持(Module versioning support (MODVERSIONS))。最好不要混用不同版本号的模块，所以我禁用了这个特性。

模块在它们的modinfo(模块信息)里有一个字段名为"srcverion"。这个字段允许开发者知道使用什么源码版本来编译模块。启用这个选项可以在编译模块的时候加入这个字段。这个并不必要，所以我禁用了它(Source checksum for all modules (MODULE\_SRCVERSION\_ALL))。如果启用了先前的选项，开发者可以将校验和加入到模块中(Source checksum for all modules (MODULE\_SRCVERSION\_ALL))。

为了启用模块签名验证(Module signature verification (MODULE\_SIG))，这个选项回答"yes"。因为这个并不必要，我选择了"no"，否则内核在加载模块前会检查并验证签名。

为了启用块级支持(Enable the block layer (BLOCK)),像我一样选择"yes"。禁用这个将会使块设备无法使用并且无法启用某些文件系统。

下面，SG支持已经默认启用(Block layer SG support v4 (BLK\_DEV\_BSG))（块级SG支持V4版），并且辅助库也启用了(Block layer SG support v4 helper lib (BLK\_DEV\_BSGLIB))。

下面回答的问题是关于对块设备的数据完整性支持(Block layer data integrity support (BLK\_DEV\_INTEGRITY))。这个特性允许拥有更好的数据完整性来提供设备数据保护特性。许多设备不支持这个特性，所以我禁用了它。

如果启用了块级bio带宽限制(Block layer bio throttling support (BLK\_DEV\_THROTTLING))那就可以限制设备的IO速率。

为了启用外部分区方案的支持，这个问题就回答"yes"(Advanced partition selection (PARTITION\_ADVANCED))。我禁用了这个特性。

为了启用CSCAN(译注：循环扫描)和FIFO过期请求，那就启用最后期限IO调度器(Deadline I/O scheduler (IOSCHED\_DEADLINE))。

CFQ IO调度器在处理器之间平均地分配带宽。因此启用这个特性feature (CFQ I/O scheduler (IOSCHED\_CFQ))是个好主意。

下面，开发者可以启用或禁用CFQ组支持(CFQ Group Scheduling support (CFQ\_GROUP\_IOSCHED))。接下来，开发者可以选择默认的IO调度器，最好选择DEFAULT\_DEADLINE。

对于小于32位寻址的设备，下面的特性会分配16MB的寻址空间(DMA memory allocation support (ZONE\_DMA))。如果你不使用这些设备，那么这个是可以禁用的，所以我禁用了它。

对于有多个CPU的系统，最好启用SMP(Symmetric multi-processing support (SMP))。对于只有单个处理器的设备，内核会在禁用这个特性后执行得更快。我启用了这个特性。

对于支持x2apic的CPU，启用x2apic支持support (Support x2apic (X86_X2APIC))。如果你的系统缺乏这个特性就像我一样禁用它。

接下来我们可以启用对那些缺乏合适的ACPI支持的旧式SMP系统的MPS表(Enable MPS table (X86\_MPPARSE))。一些拥有ACPI、DSDT、MADT支持的更新的系统不需要这个特性。我禁用了它。

下面的问题允许我们启用扩展x86平台的支持(Support for extended (non-PC) x86 platforms (X86\_EXTENDED\_PLATFORM))。只有在你需要一个通用内核或者内核运行在某个特定的需要扩展支持的处理器上时才启用它。我禁用了这个特性。

为了支持Intel低功耗子系统，就启用这个特性(Intel Low Power Subsystem Support (X86\_INTEL\_LPSS))。

单一深度WCHAN输出(Single-depth WCHAN output (SCHED\_OMIT\_FRAME\_POINTER))是用来计算电量(/proc/<PID>/wchan)，然而这会导致更多的功耗。

下面，我们启用虚拟客户系统支持(Paravirtualized guest support (PARAVIRT\_GUEST))。这允许一个Guest操作系统与主操作系统一起运行。我会禁用这个特性。

Memtest是一个在系统启动时检测内存的软件。Memtest可以配置为每次或者有时开机运行。Memtest并不必要，所以我禁用了它。

这里我们可以选择一个内核应该支持的处理器家族。我选择了5 – Generic-x86-64。这是一个64位的系统，x86是32系统。

下面我们能选择也支持x86(32位)处理器 (Supported processor vendors (PROCESSOR\_SELECT))。

为了发现机器异常，我们可以启用DMI扫描(Enable DMI scanning (DMI))，这可以检测异常。

要启用DMA访问系统上32位内存的3GB以上的内存，下一个问题(GART IOMMU support (GART_IOMMU))我们回答"yes"。


--------------------------------------------------------------------------------

via: http://www.linux.org/threads/the-linux-kernel-configuring-the-kernel-part-3.4369/

译者：[geekpi](https://github.com/geekpi) 校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出
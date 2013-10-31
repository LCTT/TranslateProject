Translating-------------------geekpi

07 The Linux Kernel: Configuring the Kernel Part 3
================================================================================
![](http://www.linux.org/attachments/slide-jpg.388/)

Here, we are still configuring the kernel. There are many more features to configure.

The next question (Enable ELF core dumps (ELF_CORE)) asks about enabling the ability for the kernel to generate core dumps. This feature makes the kernel four kilobytes larger. I chose “no”.

NOTE: A core dump (memory or system dump) is the recorded state of an application before it crashed. Core dumps are used for debugging issues. This core dump file is in the Executable and Linkable Format (ELF) format.

Next, PC-Speakers can be enabled (Enable PC-Speaker support (PCSPKR_PLATFORM)). Most computers users have and use speakers, so this is enabled.

Although this next feature increases the kernel size (Enable full-sized data structures for core (BASE_FULL)), performance is increased. I chose “yes”.

For the kernel to run glibc-based programs, FUTEX must be enabled (Enable futex support (FUTEX)). This feature enables Fast Userspace muTEXes.

NOTE: glibc (GNU C Library) is the GNU's implementation of the standard C library.

NOTE: FUTEX (fast userspace mutex) is used for preventing two threads from accessing a shared resource that should not be used by more than one thread at once.

The epoll system calls can be disabled by answering “no” to this next question (Enable eventpoll support (EPOLL)). However, it helps to have epoll system calls, so I chose “yes”. Epoll is an I/O event notification system.

To receive signals on file descriptors, enable signalfd system calls (Enable signalfd() system call (SIGNALFD)).

This feature allows applications to get file descriptors to use with timer events if enabled (Enable timerfd() system call (TIMERFD)).

The eventfd system call must be enabled with our current configuration (Enable eventfd() system call (EVENTFD)). The ability to use a shmem filesystem is enabled by default (Use full shmem filesystem (SHMEM)). A shmem filesystem is a virtual RAM filesystem.

The next question that can be answered is “Enable AIO support (AIO)”. This feature enables POSIX asynchronous I/O that threaded application use. This features takes up seven kilobytes of space. I disabled this feature.

NOTE: Asynchronous I/O is input/output processing that allows other threads to get processed before transmission is complete.

If embedding a kernel for embedded systems, select “yes” for the question “Embedded system (EMBEDDED)”. Otherwise, choose no as I have done.

NOTE: Embedded systems are real-time computers that run in a larger electronic system.

Now, we can configure kernel performance events and counters. The configuration tool enables events and counters without giving the developer a choice (Kernel performance events and counters (PERF_EVENTS)). This is an important feature.

Next, we can disable another debugging feature (Debug: use vmalloc to back perf mmap() buffers (DEBUG_PERF_USE_VMALLOC)).

If VM event counters are enabled, then event counts will be shown in the /proc/vmstat (Enable VM event counters for /proc/vmstat (VM_EVENT_COUNTERS)). If disabled, event counts will not be shown and /proc/vmstat will only display page counts.

For better support for PCI chipsets, answer yes (Enable PCI quirk workarounds (PCI_QUIRKS)). This will enable workarounds for PCI quirks and bugs.

Next is another debugging feature that can be disabled as I did (Enable SLUB debugging support (SLUB_DEBUG)). This feature takes up a lot of space and disables SLB sysfs which is used for debugging the kernel. If this feature is disabled, then /sys/slab will not exist and cache validation support will not exist on the system.

Heap randomization is a feature that makes heap exploits more difficult (Disable heap randomization (COMPAT_BRK)). However, this should not be enabled because any libc5-based software will not work on the system. Only enable this feature if you have a specific reason for doing so or if you will not use libc5-based software. I disabled this feature. When making a general kernel, developers will want to disable this feature.


Next, a SLAB allocator must be chosen. A SLAB allocator is a memory management system for placing kernel objects in memory in am efficient way without fragmentation. The default is choice “2”.

Choose SLAB allocator
1. SLAB (SLAB)
> 2. SLUB (Unqueued Allocator) (SLUB)
3. SLOB (Simple Allocator) (SLOB)
choice[1-3?]: 2

To enable extended profiling support, answer “yes” (Profiling support (PROFILING)).

The next question gives developers the choice of enabling the OProfile system. It can be disabled, enabled, or added as a module to be loaded when needed. I chose to disable this feature.

Kprobes allows users to trap nearly any kernel address to start a callback function. This is a debugging tool that can be disabled as I did (Kprobes (KPROBES)).

This optimization feature should be enabled (Optimize very unlikely/likely branches (JUMP_LABEL)). This makes branch prediction easier and reduces overhead.

The configuration tool enabled an experimental feature (Transparent user-space probes (EXPERIMENTAL) (UPROBES)). Do not worry, the system will be fine. Not all experimental features are unstable or bad.

Next, we are asked about gcov-based kernel profiling (Enable gcov-based kernel profiling (GCOV_KERNEL)). This can be disabled.

To allow the kernel to load modules, enable loadable module support (Enable loadable module support (MODULES)).

The Linux kernel will only load modules with version numbers. To allow the kernel to load modules with missing version numbers, enable this feature (Forced module loading (MODULE_FORCE_LOAD)). It is generally a bad idea to do this, so disable this feature as I have done, unless you have a specific need to such a feature.

The Linux kernel can also unload modules if that feature is enabled which is best to do (Module unloading (MODULE_UNLOAD)). If the kernel feels that unloading a modules is a bad idea, then the user cannot unload the module. Enabling force-unload is possible, but is a bad idea (Forced module unloading (MODULE_FORCE_UNLOAD)).

To use modules that did not come with your kernel or are not meant for your kernel version, enable versioning support (Module versioning support (MODVERSIONS)). It is best not to mix versions, so I will disable this feature.

Modules can have a field in their modinfo (Module Information) section titled “srcversion”. This field allows developers to see what source was used to make the module. Enabling this option will add this field when the modules are compiled. This is not necessary, so I will disable it (Source checksum for all modules (MODULE_SRCVERSION_ALL)). If the previous option was enabled, developers could have the checksums added to the modules (Source checksum for all modules (MODULE_SRCVERSION_ALL)).

To enable module signature verification (Module signature verification (MODULE_SIG)), answer “yes” for this option. Because it is not needed, I will answer “no”. Otherwise, the kernel will check and verify the signature before loading a module.

To enable block layer support (Enable the block layer (BLOCK)), choose “yes” as I have done. Disabling this will make block devices unusable and certain file systems will not be enabled

Next, SG support is enabled by default (Block layer SG support v4 (BLK_DEV_BSG)), and the helper library is also enabled (Block layer SG support v4 helper lib (BLK_DEV_BSGLIB)).

The next answerable question is about data integration support for block devices (Block layer data integrity support (BLK_DEV_INTEGRITY)). This allows better data integrity to help protect data on devices that support such a feature. Many devices do not support this feature, so I will disable it.

IO device rates can be limited if block layer bio throttling is enabled (Block layer bio throttling support (BLK_DEV_THROTTLING)).

To enable support for foreign partitioning schemes, answer “yes” to the next question (Advanced partition selection (PARTITION_ADVANCED)). I will disable this feature.

To enable the CSCAN service and FIFO expiration of requests, enable the deadline IO scheduler (Deadline I/O scheduler (IOSCHED_DEADLINE)).

The CFQ IO scheduler distributes bandwidth evenly between the processes. It is a good idea to enable this feature (CFQ I/O scheduler (IOSCHED_CFQ)).

Next, developers can enable or disable CFQ group support (CFQ Group Scheduling support (CFQ_GROUP_IOSCHED)). Then, developers can choose the default IO scheduler. It is best to pick DEFAULT_DEADLINE.

For devices with less than 32-bit addressing, this next feature allocated the first 16 megabytes of address space (DMA memory allocation support (ZONE_DMA)). If the kernel is not meant for such devices, this can be disabled, so I disabled this feature.

For systems with more than one CPU, it is best to enable SMP (Symmetric multi-processing support (SMP)). For single processor devices, the kernel will execute faster with this feature disabled. I enabled this feature.

For CPUs that offer x2apic, enable x2apic support (Support x2apic (X86_X2APIC)). If your system lacks this feature, then disable it as I have done.

Next, we can enable a MPS table which is for old SMP systems that lack appropriate ACPI support (Enable MPS table (X86_MPPARSE)). Newer systems that have ACPI support, DSDT, and MADT do not need this feature. I disabled the feature.

The following question allows us to enable support for extended x86 platforms (Support for extended (non-PC) x86 platforms (X86_EXTENDED_PLATFORM)). Only enable this if you need a general kernel or a kernel that will run on certain processors that need extended support. I disabled extended support.

To support an Intel Low Power Subsystem, enable this feature (Intel Low Power Subsystem Support (X86_INTEL_LPSS)).

Single-depth WCHAN output (Single-depth WCHAN output (SCHED_OMIT_FRAME_POINTER)) is used to calculate batter /proc/<PID>/wchan values. However, this will cause more overhead.

Next, we can enable virtual guest system support (Paravirtualized guest support (PARAVIRT_GUEST)). This will allow a guest operating system to run with the main OS. I will disable this feature.

Memtest is software that checks the RAM when the system starts. Memtest can be configured to run every time the system starts or sometimes. Memtest is not required, so I will disable it.

Here, we can select the processor family that the kernel should support. I will pick 5 – Generic-x86-64. This is a 64-bit system, a x86 is a 32-bit system,

Next, we can choose to support x86 processors (32-bit) (Supported processor vendors (PROCESSOR_SELECT)).

To find the machine's quirks, we can enable DMI scanning (Enable DMI scanning (DMI)). This will detect quirks.

To enable DMA access of 32bit memory devices with systems with more than 3GB of RAM, answer “yes” to this next question (GART IOMMU support (GART_IOMMU)).

--------------------------------------------------------------------------------

via: http://www.linux.org/threads/the-linux-kernel-configuring-the-kernel-part-3.4369/

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出
08 The Linux Kernel: Configuring the Kernel Part 4
================================================================================
![](http://www.linux.org/attachments/slide-jpg.392/)

Here, in part four of “The Linux kernel: Configuring the Kernel”, we are continuing with more settings and features to configure.

Here, we are asked about “IBM Calgary IOMMU support (CALGARY_IOMMU)”. This option will enable support for IOMMUs that belong to the xSeries x366 and x460 by IBM. This will also allow 32-bit PCI that do not support DAC (Double Address Cycle) devices of such systems to run properly because this system setup will have issues accessing more than 3GB of RAM. If needed, these IOMMU devices can be turned off at boot time using the “iommu=off” parameter. (These kernel/module parameters will be discussed in a later article.)

An IOMMU (input/output memory management unit) is a memory management unit (MMU) that connects a DMA-capable I/O bus to the main memory. DMA (Direct Memory Access) is a feature of many computers that allows certain devices to access the memory without help from the CPU. Double Address Cycle (DAC) is 64-bit DMA; regular DMA uses 32-bits.

Next, we are asked about enabling Calgary by default (Should Calgary be enabled by default? (CALGARY_IOMMU_ENABLED_BY_DEFAULT)). Calgary is the same concept as the IOMMU support mentioned above. The difference between the two is this is support for such a feature on many devices while the one above is specifically for IOMMU IBM devices. If this is disabled and you need to use it later, use this kernel parameter (iommu=calgary).

Here is a question that should be handled carefully (Enable Maximum number of SMP Processors and NUMA Nodes (MAXSMP)). Only enable this if the system the kernel will run on has many SMP processors and NUMA nodes like the Core i7 and many AMD CPU chips. If such a system lacks SMP processors and NUMA nodes or has a very little amount, the kernel can be inefficient. It is best to select “No”.

Non-Uniform Memory Access (NUMA) is a system of memory where each part of the memory takes longer to access than others. A node is a set of memory. For instance, a NUMA system may have three RAM chips. Each chip is one node. There is a node/chip on the motherboard with the CPU (this is the fastest node). The other two nodes are on a different bus. These two nodes take more time to access than the first node.

NOTE: ccNUMA and NUMA are now the same or at least very similar.

Symmetric Multi-Processing (SMP) is an alternative to NUMA. The memory is on the same bus. Only so many CPUs can access a bus, so this limits the number of processors on a SMP system. However, the memory is equally fast.

REMEMBER: I am compiling a kernel for an AMD64 system, so I will tell you what choice I made to help readers to understand the process and choices. If I do not specify what I choose, then I choose the default choice. When you are compiling for a different system or you have different needs, you will need to make alternate decisions based on your situation.

Next, choose the maximum number of CPUs the kernel will support unless the configuration tool chose for you. This configuration can optimize the kernel for the given amount.

Then, enable or disable “SMT (Hyperthreading) scheduler support (SCHED_SMT)”. The SMT scheduler improves the CPU's decision-making on Pentium 4 processors that use HyperThreading. However, there will be extra overhead. For some systems, it is best to choose “no” as I have done.

HyperThreading is a proprietary SMT parallelization for microprocessors (Intel invented the implementation). This is a special form of multitasking/multithreading (doing many tasks at once). Simultaneous multithreading (SMT) improves multithreading efficiency.

After that, enable or disable “Multi-core scheduler support (SCHED_MC)”. This feature also improves the CPU's decision making on multi-core chips. However, the cost is extra overhead. I chose “No”.

Here, in this next option, the preemption model can be chosen.

Preemption Model
1. No Forced Preemption (Server) (PREEMPT_NONE)
> 2. Voluntary Kernel Preemption (Desktop) (PREEMPT_VOLUNTARY)
3. Preemptible Kernel (Low-Latency Desktop) (PREEMPT)
choice[1-3]: 2

Preemption is the process of pausing an interrupting task with the intent of allowing it to continue executing later. Preemption forces the task to pause. The task cannot ignore preemption.

Next, we are asked about “Reroute for broken boot IRQs (X86_REROUTE_FOR_BROKEN_BOOT_IRQS)”. This is simply a fix for spurious interrupts. A spurious interrupt is an unwanted hardware interrupt. These are usually triggered by electrical interference or improperly connected electronics. Remember, an interrupt is a signal to the processor that needs immediate attention.

This option is vital for every machine; I doubt anyone would have a reason for disabling this feature (Machine Check / overheating reporting (X86_MCE)). The kernel must be aware of overheating and data corruption, otherwise, the system will continue to operate only to receive further damage.

Next, users can enable/disable “Intel MCE features (X86_MCE_INTEL)”. This is extra support for Intel MCE features like a thermal monitor. I chose “no” since I am compiling for an AMD64 processor. Machine Check Exception (MCE) is a type of error produced when the processor finds a hardware issue. An MCE will usually cause a kernel panic (equivalent to the “Blue-Screen-of-Death” on Windows).

Here is the same question again except for AMD devices (AMD MCE features (X86_MCE_AMD)).

Next is a debugging feature that I will disable (Machine check injector support (X86_MCE_INJECT)). This allows injecting machine checks. If you do perform machine injections occasionally, it may be better to enable this as a module rather than build it into the kernel. Machine injection makes a device send an error message even though no real error exists. This is used to make sure the kernel and other processes act correctly towards errors. For instance, if the CPU over heats, then it should shutdown, but how would a developer test such code without harming the CPU. Injecting errors is the best way since it is just software that tells hardware to send an error signal.

NOTE: Modules are for features/drivers that may be used or are very rarely executed. Only add features/drivers to the kernel itself if it will be used by many systems that will use the kernel being built.

If the kernel will likely be used on Dell laptops, then enable this feature (Dell laptop support (I8K)). Otherwise, add it as a module if some users of this kernel may use it on a Dell laptop. If this kernel is not planned for Dell laptops, then disable this support as I have done. Specifically, this support is a driver that allows the System Management Mode of the processor to be accessed on the Dell Inspiron 8000. The system management mode's purpose is to get the processor's temperature and fan status which are needed information for controlling the fans on such systems.

Next, users can allow microcode loading support (CPU microcode loading support (MICROCODE)). This will allow users to update the microcode on AMD and Intel CPU chips that support such a feature.

NOTE: To load microcode, you must have a legal copy of the microcode binary-file that is designed for your processor.

For loading microcode patches (to fix bugs or add minor features) to Intel chips (Intel microcode loading support (MICROCODE_INTEL)), this must be enabled. I disabled this feature.

This is the same as above except for AMD chips (AMD microcode loading support (MICROCODE_AMD)).

Enabling this support (/dev/cpu/*/msr - Model-specific register support (X86_MSR)) will allow certain processes to have permission to use x86
Model-Specific Registers (MSRs). These registers are a character devices that include major 202 and minors 0 to 31 (/dev/cpu/0/msr to /dev/cpu/31/msr). This feature is used on multiprocessor systems. Each virtual character device is linked to a specific CPU.

NOTE: MSRs are used for changing CPU settings, debugging, performance monitoring, and execution tracing. MSRs use the x86 instruction set.

After that, we have an option for “CPU information support (X86_CPUID)”. Enabling this feature allows processes to access the x86 CPUID instructions needed to execute on a particular CPU through character devices. These character devices that include major 202 and minors 0 to 31 (/dev/cpu/0/msr to /dev/cpu/31/msr), just like x86_MSR support above.

For processors that support it, enable the kernel linear mapping to use 1GB pages (Enable 1GB pages for kernel pagetables (DIRECT_GBPAGES)). Enabling this feature helps performance by reducing TLB pressure.

A page is the basic unit of memory itself (bits are the basic units of data). Page size is determined by the hardware itself. A page table is the mapping between virtual and physical memory. Physical memory is the memory on devices. The virtual memory is the addresses to the memory. Depending on the architecture of a system, there may be more addresses the hardware has the ability to access than what there is to access. For instance, on a 64-bit system with a 6GB RAM chip, an administrator can add more RAM if needed. This is because there are still more virtual addresses. However, on many 32-bit systems, an administrator can add an 8GB RAM chip, but the system will not use all of it because there are not enough virtual addresses for the system to use to access the large amount of RAM. Translation Lookaside Buffer (TLB) is a cache system that improves virtual address translation speed. Reducing pressure on it keeps it from being so busy.

Next, we have a NUMA option (Numa Memory Allocation and Scheduler Support (NUMA)). This will allow the kernel to allocate memory used by the CPU on the local memory controller of the CPU. This support also makes the kernel more NUMA aware. Very few 32-bit systems need this feature, but some common 64-bit processors use this feature. I chose “no”.


For the system to detect AMD NUMA node topology using an old method, enable this feature (Old style AMD Opteron NUMA detection (AMD_NUMA)). Next is an option for a newer detection method (ACPI NUMA detection (X86_64_ACPI_NUMA)). If both are enabled, the newer one will dominate. Some hardware works better using one of the methods instead of the other.

For NUMA emulation for the purpose of debugging, enable this next feature (NUMA emulation (NUMA_EMU)).

NOTE: If you do not plan to do debugging and you need a fast, light-weight system, disable as many debugging features as you can.

In this next option, choose the maximum number of NUMA nodes your kernel is planned to handle. Then, choose the memory model. There may be only one choice for a memory model. The memory model specifies how the memory is stored.

Maximum NUMA Nodes (as a power of 2) (NODES_SHIFT) [6]
Memory model
> 1. Sparse Memory (SPARSEMEM_MANUAL)
choice[1]: 1

To help performance, there is this option for optimizing pfn_to_page and page_to_pfn operations via a virtually mapped memmap (Sparse Memory virtual memmap (SPARSEMEM_VMEMMAP)). Page Frame Number (pfn) is a number given to each page. These two operations get a page from a number or a number from a page.

Next is an option that allows a node to move memory (Enable to assign a node which has only movable memory (MOVABLE_NODE)). Kernel pages cannot normally be moved. When enabled, users can hotplug memory nodes. Also, movable memory allows memory defragmentation. As data goes in and out of memory, a set of data may get divided across the memory where ever there is space available.

Following the previous memory question, we have more. These may be preconfigured by the configuration tool. The third option (BALLOON_COMPACTION), when enabled, helps to lessen memory fragmentation. Fragmented memory can slow down the system. The fourth option (COMPACTION) allows memory to be compressed. The fifth option listed below (MIGRATION) allows pages to be moved.

Allow for memory hot-add (MEMORY_HOTPLUG)
Allow for memory hot remove (MEMORY_HOTREMOVE)
Allow for balloon memory compaction/migration (BALLOON_COMPACTION)
Allow for memory compaction ()
Page migration (MIGRATION)

NOTE: Enabling movable memory will enable the five features listed above.

Next, we can “Enable KSM for page merging (KSM)”. Kernel Samepage Merging (KSM) views memory that an application says can be merged. This saves memory because if two pages are identical, one can be deleted or merged and only one will be used.

The configuration tool may automatically choose how much memory to save for user allocation (Low address space to protect from user allocation (DEFAULT_MMAP_MIN_ADDR) [65536]).

This next option is important (Enable recovery from hardware memory errors (MEMORY_FAILURE)). If the memory fails and the system has MCA recovery and ECC memory, the system can continue to run and try to recover. To have such a feature, the hardware itself must be able to support it as well as the kernel.

Machine Check Architecture (MCA) is a feature of some CPUs where they can send hardware error messages to the operating system. Error-correcting code memory (ECC memory) is a form of a memory device with error detection and correction.

Next, the configuration tool automatically enables “HWPoison pages injector (HWPOISON_INJECT)”. This feature allows the kernel to mark a bad page as “poisoned”, and then the kernel kills the application that created the bad page. This helps to stop and correct errors.

To allow the kernel to use large pages (Transparent Hugepage Support (TRANSPARENT_HUGEPAGE)), enable this feature. This speeds up the system, but more memory is needed. Embedded system should not use this feature. Embedded systems generally have very small amounts of memory.

If the above is enabled, then the sysfs support for huge pages must be configured.

Transparent Hugepage Support sysfs defaults
1. always (TRANSPARENT_HUGEPAGE_ALWAYS)
> 2. madvise (TRANSPARENT_HUGEPAGE_MADVISE)
choice[1-2?]: 2

This next option is for adding system calls process_vm_readv and
process_vm_writev (Cross Memory Support (CROSS_MEMORY_ATTACH)). This allows privileged processes to access the address space of another application.

If tmem is present, enabling cleancache will generally be a good idea. (Enable cleancache driver to cache clean pages if Transcendent Memory (tmem) is present (CLEANCACHE)). When needed pages are removed from the memory, cleancache will place the page on cleancache-enabled filesystems. When the page is needed, it is placed back on memory. Transcendent Memory (tmem) is memory without a set known size. The kernel indirectly addresses such memory.

This next option allows caching swap pages if tmem is active (Enable frontswap to cache swap pages if tmem is present (FRONTSWAP)). Frontswap places data on swap partitions. This is needed for swap support.

It is best to enable this next feature (Check for low memory corruption (X86_CHECK_BIOS_CORRUPTION)). This will check the low memory for memory corruption. This feature is disabled at runtime. To use this feature, add “memory_corruption_check=1” to the kernel command-line (this will be discussed in a later article; this is not the same as any command-line). This feature, even when actively being executed, uses very little overhead (nearly none).

Next, we can “Set the default setting of memory_corruption_check (X86_BOOTPARAM_MEMORY_CORRUPTION_CHECK)”. This will set whether memory_corruption_check is on or off. It is best to have the memory checked otherwise data can be lost and the system can crash if an important part of the memory is corrupted.

This option concerns the BIOS (Amount of low memory, in kilobytes, to reserve for the BIOS (X86_RESERVE_LOW) [64]). The configuration tool usually knows the best amount of memory to reserve for the BIOS.

For Intel P6 processors, developers can enable memory type range registers (MTRR (Memory Type Range Register) support (MTRR)). This is used for AGP and PCI cards with a VGA card attached. Enabling this feature creates /proc/mtrr.

If X drivers need to add writeback entries, then enable this following option (MTRR cleanup support (MTRR_SANITIZER)). This will convert MTRR layout from continuous to discrete. Memory type range registers (MTRRs) provide software a way to access CPU cache.

Next, some MTRR options are set by the configuration tool.

MTRR cleanup enable value (0-1) (MTRR_SANITIZER_ENABLE_DEFAULT) [1]
MTRR cleanup spare reg num (0-7) (MTRR_SANITIZER_SPARE_REG_NR_DEFAULT) [1]

To set up page-level cache control, enable PAT attributes (x86 PAT support (X86_PAT)). Page Attribute Table (PATs) are the modern equivalents of MTRRs and are much more flexible than MTRRs. If you experience bootup issues with this enabled, then remake the kernel with this feature disabled. I chose “no”.

--------------------------------------------------------------------------------

via: http://www.linux.org/threads/the-linux-kernel-configuring-the-kernel-part-4.4392/

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出
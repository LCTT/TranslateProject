戴文的Linux内核专题：08 配置内核(4)
================================================================================

在这个第四部分里，我们将继续配置更多的设置和特性。

这里我们被问及关于"IBM Calgary IOMMU support (CALGARY\_IOMMU)"。这个选项将会提供对IBM xSeries x366和x460的IOMMU的支持。这也将让那些32位PCI的设备工作正常——在这些系统上不支持双地址周期(DAC : Double Address Cycle)——因为该系统设置在访问超过3GB内存的时候会有问题。如果需要这些IOMMU设备可以用"iommu=off"在启动时关闭。(这些内核/模块参数会在以后的文章中讨论)

IOMMU(input/output memory management unit)是一个内存管理单元(MMU)，它连接具有DMA功能的I/O总线到主内存上。DMA(Direct Memory Access)是许多计算机支持的一种允许特定设备不借助CPU直接访问内存的特性。双地址周期(Double Address Cycle, DAC)是64位DMA；而通常的DMA使用32位。

下面，我们被问及是否默认启用Calgary(Should Calgary be enabled by default? (CALGARY\_IOMMU\_ENABLED\_BY\_DEFAULT))。Calgary与上面提到的IOMMU是同一个概念。这两者之间的不同是IOMMU可以支持许多设备而Calgary只能支持IBM IOMMU设备。如果禁用了它，但是以后需要使用到它，可以使用内核参数(iommu=calgary)。

这里有个问题需要小心处理(Enable Maximum number of SMP Processors and NUMA Nodes (MAXSMP))。只有在内核运行在拥有很多SMP处理器和NUMA节点的情况下才启用它，如Core i7和许多AMD CPU芯片。如果系统缺乏或者只有少量的SMP处理器和NUMA节点，内核就会变得低效。这个最好选择"No"。

非一致性内存访问(Non-Uniform Memory Access (NUMA))是一个每块内存都需要花费更长时间访问其他部分内存的系统。一个节点就是一组内存。例如，一个NUMA系统可能有三块内存芯片。每块芯片是一个节点，在带CPU的主板上有一个节点/芯片(这是最快的节点)，另外两个在不同的总线上。这两个节点需要比第一个节点花费更长的时间去访问。

注意：ccNUMA和NUMA目前是一样的，至少是非常相似的。

对称多处理器(Symmetric Multi-Processing (SMP))是NUMA的替代品。它的内存在同一根总线上。只有限定数量的CPU可以访问总线，所以这限制了SMP系统上处理器的数量。然而它内存的访问速度一样块。

注意：我是在为AMD64系统在编译内核，所以我会告诉你我的选择，来帮助读者理解过程和选择。如果我没有指出我的选择，那么我用的就是默认选择。如果你在为不同的系统编译或者你有不同的需求，你需要在你的情况下做出替代的选择。

接下来，除非配置工具已经为你做了选择，选择一个内核需要支持的最多CPU的数量。这个配置根据你给的数量优化内核。

接着启用或禁用"SMT (Hyperthreading) scheduler support (SCHED\_SMT)"（超线程调度器支持）。SMT调度器提升了在使用了超线程技术的Pentium 4处理器上的CPU决策能力。然而，这会带来额外的功耗，在一些系统上最好像我一样选择"no"。

超线程一种专有的SMT并行微处理器(Intel 实现了它)。这是多任务/多线程(同时做许多任务)的一种特殊形式，并行多线程(Simultaneous multithreading (SMT))提升了多线程执行的效率。

在这之后，启用或者禁用"Multi-core scheduler support (SCHED\_MC)"。这样也是一种提升多核CPU决策的特性。然而这回带来额外功耗，我选择了"No"。

在下一个选项中可以选择抢占模式。

Preemption Model（抢占模式）

1\. No Forced Preemption (Server) (PREEMPT\_NONE) （非强制抢占）

\> 2. Voluntary Kernel Preemption (Desktop) (PREEMPT\_VOLUNTARY) （自愿内核抢占）

3\. Preemptible Kernel (Low-Latency Desktop) (PREEMPT) （可抢占内核）

choice[1-3]: 2

抢占就是暂停一个意图让它之后继续执行的中断任务的过程。抢占强制一个进程暂停，执行中的任务无法忽视抢占。

接着，我们被询问关于"Reroute for broken boot IRQs (X86\_REROUTE\_FOR\_BROKEN\_BOOT\_IRQS)"。这是一个对于假中断的简单修复。假中断是一种无用的硬件中断，这些通常是有电子干扰或者错误连接的电子产品触发。记住，中断是发送给处理器需要马上注意的信号。

这个选项对任何机器都很重要；我怀疑任何人可能都会有禁用这个特性的理由(Machine Check / overheating reporting (X86\_MCE))。内核必须意识到过热和数据损坏，不然，系统将会继续操作，这样只会导致进一步的破坏。

下面，用户可以启用禁用"Intel MCE features (X86\_MCE\_INTEL)"，这是一种额外的对像热度监控的Intel MCE特性的支持。因为我是为AMD64处理器编译内核所以我选择了"no"。机器检测异常(MCE)是一种当处理器发现硬件问题时的错误输出。MCE通常会导致内核严重错误(kernel panic)(相当于Windows中的"蓝屏")。

这个除了是AMD设备外是同一个问题Intel MCE features (X86\_MCE\_INTEL)。

下一个是我会禁用的调试特性(Machine check injector support (X86\_MCE\_INJECT))。这个会允许注射检查。如果你偶尔执行机器注射，那最好编译成模块而不是编译进内核。机器注射可以使设备即使实际没有错误也可以发送一个伪造的错误信息。这个用来确认内核和其他进程可以正常处理错误。比如，如果CPU过热，接着应该关机，但是开发者如何在不损坏CPU的情况下测试代码。注射错误是一种最好的方法，因为它只是一种告诉硬件发送错误信号的软件。

注:模块是对可能被使用或者很少执行的特性/驱动而言的。只加入在许多使用该内核的系统中用到的特性/驱动到内核中。

如果内核很可能用在Dell笔记本上，那么启用这个特性(Dell laptop support (I8K))。否则，如果一些用户可能在戴尔笔记本电脑上用到这个内核，将其作为一个模块加入。如果这个内核不打算支持Dell笔记本，那就像我一样忽略掉它。特别地，这个支持是一个允许Dell Inspiron 8000系列笔记本访问处理器的系统管理模式的驱动。系统管理模式的目的是得到处理器的温度和风扇状态，这对一些需要控制风扇的系统有用。

下面，用户可以选择微码加载支持(CPU microcode loading support (MICROCODE))。这可以允许用户在支持这个特性的AMD或者Intel芯片上更新微码。

注意：为了加载微码，你必须拥有一个为你的处理器设计的合法的二进制微代码拷贝。

如果要加载微码补丁(修复bug或加入次要的特性)到intel芯片上(Intel microcode loading support (MICROCODE\_INTEL))，这个就必须启用。这里我禁用了它。

然后是AMD芯片的类似选项(AMD microcode loading support (MICROCODE\_AMD))。

启用这个支持(/dev/cpu/*/msr - Model-specific register support (X86\_MSR))可以允许某个处理器有权限使用x86特殊模块寄存器(Model-Specific Registers (MSRs))。这些寄存器是一些字符设备，包括major 202下minor 0到31的设备((/dev/cpu/0/msr to /dev/cpu/31/msr))。这个特性用在多处理器系统上。每个虚拟字符设备都连接到一个特定的CPU。

注意：MSRs被用来改变CPU设备、调试、性能监控和执行追踪。MSRs使用x86指令集。

在这之后，我们有一个选项"CPU information support (X86\_CPUID)"，启用这个特性允许处理器访问x86 CPUID指令，这需要通过字符设备在一个特定的CPU上执行。这些字符设备包括major 202下minor 0到31的设备(/dev/cpu/0/msr to /dev/cpu/31/msr)，就像上面x86\_MSR支持的这些。

如果处理器支持，启用内核线性映射来使用1GB的内存页(Enable 1GB pages for kernel pagetables (DIRECT\_GBPAGES))。启用这个可以帮助减轻TLB的压力。

页是内存本身的基本单位(位是数据的基本单位)。页的大小是由硬件自身决定的。页码表是虚拟和物理内存间的映射。物理内存是设备上的内存。虚拟内存是到内存的地址。依赖于系统架构，硬件可以访问大于实际内存地址的地址。举例来说，一个64位系统拥有6GB内存，管理员在需要时可以加上更多的内存。这是因为还有很多虚拟内存地址。然而，在很多32位系统上，系统管理员可以增加一条8GB的内存，但是系统无法完全使用它，因为系统中没有足够的虚拟内存地址去访问大容量的内存。转换后援缓冲器(Translation Lookaside Buffer (TLB))是一种提升虚拟内存转换速度的缓存系统。

下面，我们看到了NUMA选项(Numa Memory Allocation and Scheduler Support (NUMA))。这可以允许内核在CPU本地内存分配器上分配CPU可使用的内存。这个支持同样可使内核更好感知到NUMA。很少的32位系统需要这个特性，但是一些通用的645位处理器使用这个特性。我选择了"no"。

为了系统使用旧方式来检测AMD NUMA节点拓扑，启用这个特性(Old style AMD Opteron NUMA detection (AMD\_NUMA))。下一个选项是一种更新的检测方式(ACPI NUMA detection (X86\_64\_ACPI\_NUMA))。如果两个都启用，新的方式将会占支配作用。一些硬件在使用其中一种方式而不是另外一个时工作得更好。

如果为了调试目的的NUMA仿真，可以启用下一个特性(NUMA emulation (NUMA\_EMU))。

注意：如果你不打算进行调试并且你需要一个快速、轻量级系统，那么禁用尽可能多的调试特性。

下一个选项中，选择你的内核打算如何处理NUMA节点的最大数量。接下来选择内存模型，这里可能只有一个内存模型选择。内存模型指定了内存如何存储。

Maximum NUMA Nodes (as a power of 2) (NODES\_SHIFT) [6]

Memory model

\> 1. Sparse Memory (SPARSEMEM\_MANUAL)

choice[1]: 1

为了提升性能，这里有一个选项用通过虚拟内存映射(Sparse Memory virtual memmap (SPARSEMEM\_VMEMMAP))来优化pfn\_to\_page和page\_to\_pfn操作。页帧号是每页被给定的号码。这两个操作用来从号码得到页或者从页得到号码。

下一个选项是允许一个节点可以移除内存(Enable to assign a node which has only movable memory (MOVABLE\_NODE))。内核页通常无法移除。当启用后，用户可以热插拔内存节点，同样可移除内存允许内存整理。作为出入内存的数据，只要有可用空间一组数据可能被划分到不同内存。

接着前面的内存问题，我们还有更多的问题。这些可能已被配置工具预配置了。第三个选项(BALLOON\_COMPACTION)，当启用时可以帮助减少内存碎片。碎片内存会减慢系统速度。第四个选项(COMPACTION)允许内存压缩。下面列到的第五个选项(MIGRATION)允许页面被移动。

- Allow for memory hot-add (MEMORY\_HOTPLUG) (允许内存热添加)
- Allow for memory hot remove (MEMORY\_HOTREMOVE) （允许内存热移除）
- Allow for balloon memory compaction/migration (BALLOON\_COMPACTION) （允许泡状内存规整和合并）
- Allow for memory compaction (允许内存规整)
- Page migration (MIGRATION) (页合并)

注意：启用可移动内存会启用以上5个特性。

下一步，我们可以"Enable KSM for page merging (KSM)"。内核同页合并(Kernel Samepage Merging (KSM))会查看程序认为可以合并的内核。如果两页内存完全相同这可以节约内存。一块内存可以被删除或者被合并，并且只有一块可以使用。

配置工具可能会自动选择保存多少内存用于用户分配(Low address space to protect from user allocation (DEFAULT\_MMAP\_MIN\_ADDR) [65536])。

下一个选项很重要(Enable recovery from hardware memory errors (MEMORY\_FAILURE))。如果内存故障并且系统有MCA恢复或者ECC内存，系统就可以继续运行并且恢复。要使用这个特性，硬件自身和内核都必须支持。

机器检测架构(Machine Check Architecture (MCA))是一个一些CPU上可以发送硬件错误信息给操作系统的特性。错误更正码内存(Error-correcting code memory (ECC memory))是一种内存设备检测和纠正错误的形式。

下面，配置工具会自动启用"HWPoison pages injector (HWPOISON\_INJECT)"。这个特性允许内核标记一块坏页为"poisoned"，接着内核会杀死创建坏页的程序。这有助于停止并纠正错误。

为了允许内核使用大页(Transparent Hugepage Support (TRANSPARENT\_HUGEPAGE))，启用这个特性。这可以加速系统但是需要更多内存。嵌入式系统不必使用这个特性。嵌入式系统通常只有非常小的内存。

如果启用了上面的，那么必须配置大页的sysfs支持。

Transparent Hugepage Support sysfs defaults

1\. always (TRANSPARENT\_HUGEPAGE\_ALWAYS)

\> 2. madvise (TRANSPARENT\_HUGEPAGE\_MADVISE)

choice[1-2?]: 2

下面的选项是增加process\_vm\_readv和process\_vm\_writev这两个系统调用(Cross Memory Support (CROSS\_MEMORY\_ATTACH))。这允许特权进程访问另外一个程序的地址空间。

如果有tmem，启用缓存清理(cleancache)通常是一个好主意 (Enable cleancache driver to cache clean pages if Transcendent Memory (tmem) is present (CLEANCACHE))。当一些内存页需要从内存中移除时，cleancache会将页面放在cleancache-enabled的文件系统上。当需要该页时，页会被重新放回内存中。超内存(tmem)没有一组已知大小的内存，内核对此内存使用间接寻址。

下一个选项允许在tmen激活后缓存交换页(Enable frontswap to cache swap pages if tmem is present (FRONTSWAP))。frontswap在交换分区放置数据。交换特性的支持需要这个。

最好启用下一个特性(Check for low memory corruption (X86\_CHECK\_BIOS\_CORRUPTION))。这会检测低位内存的内存损坏情况。这个特性在执行期被禁止。为了启用这个特性,在内核命令行内加入 "memory\_corruption\_check=1"(这会在以后的文章中讨论;这不同于任何命令行)。即使经常执行这个特性，也只使用非常小的开销(接近没有)。

接下来我门可以设置内存损坏检测的默认设置(“Set the default setting of memory\_corruption\_check (X86\_BOOTPARAM\_MEMORY\_CORRUPTION\_CHECK))。这可以选择是否开启或关闭memory\_corruption\_check。最好启用内存损坏检测不然如果一部分重要内存损坏后可能会导致数据丢失和系统崩溃。

这个选项关注的是BIOS(Amount of low memory, in kilobytes, to reserve for the BIOS (X86\_RESERVE\_LOW) [64])。配置工具通常知道给BIOS预留内存的最佳大小。

对于Intel P6处理器，开发者可以启用存储区域类型寄存器(MTRR (Memory Type Range Register) support (MTRR))。这用于连接着VGA卡的AGP和PCI卡。启用这个特性内核会创建/proc/mtrr。

如果X驱动需要加入回写入口，那么启用下面的选项(MTRR cleanup support (MTRR\_SANITIZER))。这会将MTRR的布局从连续转换到离散。存储区域类型寄存器(Memory type range registers (MTRRs))提供了一种软件访问CPU缓存的方法。

下面，配置工具已经设置了一些MTRR选项

- MTRR cleanup enable value (0-1) (MTRR\_SANITIZER\_ENABLE\_DEFAULT) [1]

- MTRR cleanup spare reg num (0-7) (MTRR\_SANITIZER\_SPARE\_REG\_NR\_DEFAULT) [1]

为了设置页级缓冲控制，那就启用PAT属性(x86 PAT support (X86\_PAT))。页属性表(Page Attribute Table (PATs))是现在版的MTRRs并比它更灵活。如果你经历过因启用它而引发的启动问题，那么禁用这个特性后重新编译内核。我选择了"no"。

--------------------------------------------------------------------------------

via: http://www.linux.org/threads/the-linux-kernel-configuring-the-kernel-part-4.4392/

译者：[geekpi](https://github.com/geekpi) 校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出
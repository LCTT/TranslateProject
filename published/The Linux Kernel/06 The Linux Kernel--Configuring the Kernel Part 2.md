戴文的Linux内核专题：06 内核配置(2)
================================================================================
![](http://www.linux.org/attachments/slide-jpg.351/)

这一部分我们讲配置内核IRQ子系统。中断请求(IRQ)是硬件发给处理器的一个信号，它暂时停止一个正在运行的程序并允许一个特殊的程序占用CPU运行。

这个目录中的第一个问题属于内核特性(Expose hardware/virtual IRQ mapping via debugfs (IRQ\_DOMAIN\_DEBUG))（通过debugfs来显示硬件/虚拟的IRQ映射），它询问是否可以使用虚拟的调试文件系统来映射硬件及Linux上对应的IRQ中断号。这个用作调试目的，大多数用户不需要用到，所以我选择了"no"。

下一个标题显示"Timers subsystem"（计时器子系统）。第一个有关定时器子系统的问题是“Tickless System (Dynamic Ticks) (NO\_HZ)”（无滴答系统）。我选择了“yes”，这会启用一个无滴答系统。这意味着定时器中断将会按需使用，定时器中断允许任务以特定的时间间隔执行。下一个问题(High Resolution Timer Support (HIGH\_RES\_TIMERS))问是否支持高精度定时器。并不是所有的硬件支持这个，通常地说，如果硬件很慢或很旧，那么选择"no",否则像我一样选择"yes"。

下一个标题"CPU/Task time and stats accounting"（CPU/任务用时与状态统计），这个是关于进程的追踪。第一个问题看上去像这样：

Cputime accounting （CPU用时统计）

1. Simple tick based cputime accounting (TICK\_CPU\_ACCOUNTING) （简单基于滴答的用时统计）
2. Full dynticks CPU time accounting (VIRT\_CPU\_ACCOUNTING\_GEN) (NEW) （全动态滴答的用时统计）
3. Fine granularity task level IRQ time accounting (IRQ\_TIME\_ACCOUNTING) （细粒度的任务级IRQ用时统计）

TICK_CPU_ACCOUNTING会在每个CPU滴答中检测/proc/stat。这是默认的选项，这个记账方法非常简单。

注意：CPU滴答是抽象测量CPU时间的方式。每个处理器、操作系统和安装的系统都不同，比如说，一个更强大的处理器会比老的处理器拥有更多的CPU滴答。如果你安装了一个Linux系统，然后接着在同一块磁盘上重新安装了它，你可能会得到一个更快或更慢的CPU滴答时间(至少一些计算机技术书上这么说)。通常来讲，一个更快的时钟速度意味着更多的CPU滴答。

如果启用了VIRT\_CPU\_ACCOUNTING\_GEN，任务和CPU时间统计将由监视内核-用户边界实现。这个选择的代价是会增加额外的开销。

IRQ\_TIME\_ACCOUNTING记账方式则通过检测IRQ状态间的时间戳工作，这个性能开销很小。

我选择了"1"并被询问有关BSD记账"BSD Process Accounting (BSD\_PROCESS\_ACCT)"（BSD进程记账）的问题。这个内核特性会记录每个进程不同的关闭信息。为了得到一个更小和更快的内核，我选择了"no".

下一组问题看上去就像下面这样。

- Export task/process statistics through netlink (TASKSTATS) （通过netlink导出任务/进程统计数据）
- Enable per-task delay accounting (TASK\_DELAY\_ACCT) （启用针对每个任务的延迟统计）
- Enable extended accounting over taskstats (TASK\_XACCT) （启用taskstats的扩展统计）

TASKSTATS使内核可以通过网络套接字导出进程统计。网络套接字是内核和用户空间进程间IPC通信的一种形式。TASK_DELAY\_ACCT监视进程并注意资源访问的延迟。比如，TASK_DELAY_ACCT可以看到X进程正在为了CPU时间而等待，如果TASK\_DELAY\_ACCT观察到进程已经等待了太长时间，这个进程接着就会被给予一些CPU时间。TASK\_XACCT会收集额外的统计数据，为了更小的内核负载我会禁用这个。

现在接下来的目录就会显示RCU子系统：读取-复制-更新子系统是一种低负载的同步机制，它允许程序查看到正在被修改/更新的文件。配置工具已经回答了第一个问题。

RCU Implementation （RCU 实现方式）

\> 1. Tree-based hierarchical RCU (TREE\_RCU) （树形分层结构的RCU）

choice[1]: 1

这里就选择“1”。除了TREE\_RCU，还有classic RCU(更老的实现)。下一个问题(Consider userspace as in RCU extended quiescent state (RCU\_USER\_QS) [N/y/?])（是否在用户空间记录扩展的quiescent状态）问RCU是否可以在CPU运行在用户空间时设置一个特殊的quiescent状态。这个选项通常被禁用，因为这会增加太多消耗。下面是另一个RCU问题(Tree-based hierarchical RCU fanout value (RCU\_FANOUT) [64])（树形分层结构的RCU端点数），问的是关于端点数。下一个问题(Tree-based hierarchical RCU leaf-level fanout value (RCU\_FANOUT\_LEAF) [16])（树形分层结构的RCU叶级端点数），是另外一个关于端点数的问题，但它只处理叶级。还有另外一个RCU问题(Disable tree-based hierarchical RCU auto-balancing (RCU\_FANOUT\_EXACT) [N/y/?])（是否禁用树形分层结构的RCU的自动平衡），询问是否禁用RCU自动平衡树，而采用上述的端点数。

接下来，配置脚本将会询问"Accelerate last non-dyntick-idle CPU's grace periods (RCU\_FAST\_NO\_HZ)"（加速最后的非dyntick-idle CPU的RCU宽限期）。在这之后会显示"Offload RCU callback processing from boot-selected CPUs (RCU\_NOCB\_CPU)"（从选择引导的CPU里面卸载RCU回调）。（译注：此处作者没做解释。前一个能够节省电力，但是降低了性能；后一个用于调试。）

下一个问题非常重要(Kernel .config support (IKCONFIG))（内核的.config支持）。开发人员可以选择保存由这个配置工具生成的设置到一个文件中。这个文件可以放在内核中，也可在一个模块中，或者完全不保存。这个文件可以被想要编译一个完全跟某人相同内核的开发者使用。这个文件还可以帮助开发人员使用一个更新的编译器重新编译一个内核。举例来说，开发人员配置并编译了一个内核，然而编译器有一些bug，但开发人员仍然需要一个使用这些设置的内核。而值得庆幸的是，开发人员可以升级他们的编译器，并使用设置文件来节省他们重新配置内核的时间。开发人员也可以在另一台计算机上保存源代码和配置文件并编译内核。至于另一个目的，开发人员可以加载该文件，并根据需要调整设置。我选择保存配置文件在一个模块中，这个问题 "Enable access to .config through /proc/config.gz (IKCONFIG\_PROC)"（启用通过/proc/config.gz来访问.config的功能）是询问这个文件是否是可以通过这次方式访问的，我选择了"yes"。

下一个问题是内核使用多大的log缓冲区(Kernel log buffer size (16 => 64KB, 17 => 128KB) (LOG\_BUF\_SHIFT) [17])（内核日志缓冲区大小）。小的缓冲区意味着它无法像更大的缓冲区那样保持日志更长的时间。这个选择取决于开发者想要日志保持的时间，我选择的是"12"。

接着，出现了另外一个问题。该问题询问关于是否启用NUMA(非一致性内存访问)的内存/任务的均衡(Automatically enable NUMA aware memory/task placement (NUMA\_BALANCING\_DEFAULT\_ENABLED))（自动启用NUMA的内存/任务均衡）。如果在NUMA的机器上设置了该选项，那么NUMA自动平衡就会启用。在NUMA下，处理器可以比非本地内存(内存分配给另外一个处理器或在处理器之间共享的内存)更快地访问它的本地内存。如果上面启用了(我启用了)，那么最好对这个问题"Memory placement aware NUMA scheduler (NUMA\_BALANCING)"（由NUMA调度器进行内存分配）回答"yes"，这是一个NUMA调度器。

在新的标题"Control Group support"（Cgroup支持）下，因为先前的选择，"Control Group support (CGROUPS)"（Cgroup支持）被自动地回答了"yes"。

以下设定(Example debug cgroup subsystem (CGROUP\_DEBUG))（导出Cgroup子系统的调试信息）是启用一个用于调试cgroup框架的一个简单cgroup子系统。下一个选项(Freezer cgroup subsystem (CGROUP\_FREEZER))（冻结Cgroup子系统）可以让程序员可以冻结或解冻cgroup内的任务。

注意：cgroup是一组进程。

下面我们要求回答"Device controller for cgroups (CGROUP\_DEVICE)"(Cgroup的设备控制器)。cgroup(控制组)是一种用来控制资源使用的特性。回答"yes"可以允许设备cgroup的白名单可以使用open和mknod系统调用(用来创建文件系统节点的系统调用)。

下一个问题(Cpuset support (CPUSETS))（CPU分组支持）询问的是内核是否可以创建和管理CPU分组。这允许管理员可以在一个系统上动态分配各组内存节点，并分配任务在这些内存上运行。这通常用于SMP和NUMA系统中。我这个问题回答的是"no"。

注意：请记住，如果我没有指定我选的是什么，那么我选的就是默认选项。

启用cgroup统计子系统(Simple CPU accounting cgroup subsystem (CGROUP\_CPUACCT))（Cgroup子系统的简单CPU统计）会生成一个资源控制器来监控在一个cgroup组内的独立任务的CPU使用情况。我选择了"no"。

资源计数器(Resource counters (RESOURCE\_COUNTERS))使控制器的独立资源统计功能能够统计cgroup。我选择了"no"。

下一个问题(Enable perf\_event per-cpu per-container group (cgroup) monitoring (CGROUP\_PERF))（启用每个CPU、每个容器组的pref_event监控）允许开发者扩展每个CPU的模式，使它可以只监控运行在特定CPU上的一个特别的cgroup组的线程。

下一章节是"Group CPU Scheduler"（CPU分组调度器）。前两个已经回答的问题包括：

Group CPU scheduler (CGROUP_SCHED)（CPU分组调度器）
Group scheduling for SCHED_OTHER (FAIR_GROUP\_SCHED)（SCHED\_OTHER分组调度）

第一个已回答的问题(CPU bandwidth provisioning for FAIR\_GROUP\_SCHED (CFS\_BANDWIDTH))（CPU带宽分配）询问的是内核是否允许用户设置在公平组调度器内执行的任务的CPU带宽限制。没有限制的组会被认为不受约束，并会没有限制地运行。

注意：并不是所有内核选项都在这里。我这里提到的组只是为了便于阅读，并挑出那些新的和大的部分。并不需要了解所有的分组。分组有助于使用图形工具配置内核，这样开发者可以在搜索特定的设置时，直接通过分组菜单找到。

开发者可以通过回答"Group scheduling for SCHED\_RR/FIFO (RT\_GROUP\_SCHED)"（SCHED\_RR/FIFO分组调度）这个问题为"yes"来让用户可以分配CPU带宽到任务组中。

下一个问题是"Block IO controller (BLK\_CGROUP)"（阻塞IO控制器）。任务组可以被识别，并且它们的磁盘带宽是由使用块IO控制器实现的CFQ IO调度器分配的。BIO在块级的限制逻辑使用块IO控制器来提供设备上的IO速率上限。

这里有一个调试问题(Enable Block IO controller debugging (DEBUG_BLK_CGROUP) [N/y/?])（启用阻塞IO控制器的调试）询问是否启用块IO控制器的调试。为了制作一个精简的内核，最好禁用这个特性。

为了启用内核中的检查点和还原特性。这个问题“Checkpoint/restore support (CHECKPOINT_RESTORE)”（检查点及还原支持）可以选择“yes”，不过为了更低的负载这里我选择了“n”。启用这个特性会增加辅助的进程控制代码来设置进程的代码段、数据段和堆的大小，并增加了一些额外的程序入口。

下面我们就要配置命名空间的支持了。命名空间是一组标识符的容器。比如，/usr/lib/python3/dist-packages/re.py就是一个标识符，/usr/lib/python3/dist-packages/就是一个命名空间。而re.py是这个命名空间下的本地名称。

第一个命名空间问题(Namespaces support (NAMESPACES))询问的是是否启用命名空间。这允许可以使用相同的PID但在不同的命名空间内(译注：原文为" This will allow the same PIDs (Process ID) to be used but indifferent namespaces",这里indiffernt根据上下文应该是少了空格)，否则PID永远不会重复。

下一个问题(UTS namespace (UTS\_NS))询问是否可以让UTS命名空间内的任务可以在uname()系统调用中看到不同的信息。uname()系统调用提供查看机器和操作系统的信息。

启用IPC命名空间(IPC namespace (IPC\_NS))将允许在这个命名空间内的任务与其他命名空间内相对应IPC ID的对象协同工作。

PID命名空间(PID Namespaces (PID\_NS))就是进程ID命名空间。这可以使不同的进程在不同的PID命名空间使用相同的PID。这是一个容器的构建块。

接下来，启用网络命名空间(Network namespace (NET\_NS))可以使用户创建一个拥有多个实例的网络栈。

当启用后,自动进程分组调度(SCHED\_AUTOGROUP)会填充并创建任务组来优化桌面程序的调度。它将把占用大量资源的应用程序放在它们自己的任务组，这有助于性能提升。

这里是一个调试特性，除非你有特别的需求否则应该禁用它。这个问题(Enable deprecated sysfs features to support old userspace tools (SYSFS_DEPRECATED))（启用不推荐的sysfs功能来支持旧式的用户空间工具）询问是否启用sysfs，这是调试内核时用的虚拟文件系统。

接下来，因为当前的配置需要它，所以"Kernel->user space relay support (formerly relayfs) (RELAY)"（内核->用户空间的中继支持，即relayfs）已经被设成"yes"了。最好启用initrd支持(Initial RAM filesystem and RAM disk (initramfs/initrd) support (BLK\_DEV\_INITRD))（初始化内存文件系统和内存盘(initramfs/initrd)）。

用户会被问及哪里放置initramfs源文件。如果没有需要，请留空。

接下来,开发人员会被询问关于初始虚拟磁盘(Linux的内核映像文件)所支持的压缩格式。你可以启用所有支持的压缩格式。

- Support initial ramdisks compressed using gzip (RD\_GZIP)
- Support initial ramdisks compressed using bzip2 (RD\_BZIP2)
- Support initial ramdisks compressed using LZMA (RD\_LZMA)
- Support initial ramdisks compressed using XZ (RD\_XZ)
- Support initial ramdisks compressed using LZO (RD\_LZO)

这里设置了内核的编译内核编译选项(Optimize for size (CC\_OPTIMIZE\_FOR\_SIZE))（优化大小）。开发者可以让编译器在编译时优化代码。我选择了"yes"。

用户想要配置更多的内核特性，那么下个问题就回答"yes"(Configure standard kernel features (expert users) (EXPERT))（配置标准内核特性（专家级用户））。

要启用过时的16位UID系统调用封装器，这个问题设成"yes"(Enable 16-bit UID system calls (UID16))。系统调用就会使用16位UID。

推荐启用"sysctl syscall"(Sysctl syscall support (SYSCTL_SYSCALL))支持。这使/proc/sys成为二进制路径的接口。

接下来的两个问题已经被预先回答了"yes",它们是"Load all symbols for debugging/ksymoops (KALLSYMS)"（载入所以的调试符号）和"“Include all symbols in kallsyms (KALLSYMS_ALL)"（包括所有的kallsyms符号）。这些都是启用调试标志。

下一步，开发者应该启用printk支持( (Enable support for printk (PRINTK)))，这会输出内核消息到内核日志中。这在内核出错时是很重要的。编译一个"哑巴"内核并不是一个好主意。然而，如果我们启用了这个支持，就会被一些开发者看到这些出错，要么就不要启用。

除非有必要，开发者可以禁用bug支持(BUG() support (BUG))。禁用这项将会不支持WARN信息和BUG信息。这会减小内核的体积。

--------------------------------------------------------------------------------

via: http://www.linux.org/threads/the-linux-kernel-configuring-the-kernel-part-2.4318/

译者：[geekpi](https://github.com/geekpi) 校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出
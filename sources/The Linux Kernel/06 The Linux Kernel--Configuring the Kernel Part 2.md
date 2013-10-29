06 The Linux Kernel: Configuring the Kernel Part 2
================================================================================
![](http://www.linux.org/attachments/slide-jpg.351/)

The next portion of the kernel that is configured is the IRQ subsystem. An Interrupt ReQuest (or IRQ) is a signal from the hardware to the processor to temporarily stop a running program and allow a special program to execute in its place.

The first question belonging to this category of kernel features (Expose hardware/virtual IRQ mapping via debugfs (IRQ_DOMAIN_DEBUG)) asks if the IRQ numbers of the hardware and the respective can be mapped using a virtual debugging filesystem. This is for debugging purposes. Most users will not need this, so I will select “no”.

The next heading displays “Timers subsystem”. The first question pertaining to the timers subsystem is “Tickless System (Dynamic Ticks) (NO_HZ)”. Selecting “yes” (which I did) will enable a tickless system. This means that the timer interrupts will be used as needed. Timer interrupts allow tasks to be executed at particular timed intervals. The next question (High Resolution Timer Support (HIGH_RES_TIMERS)) asks if high resolution timer support can be enabled. Not all hardware supports this. Generally, if the hardware is slow or old, then select “no”, else select “yes” as I did.

The next heading - “CPU/Task time and stats accounting” - pertains to keeping track of processes. The first question looks like this

Cputime accounting
1. Simple tick based cputime accounting (TICK_CPU_ACCOUNTING)
2. Full dynticks CPU time accounting (VIRT_CPU_ACCOUNTING_GEN) (NEW)
3. Fine granularity task level IRQ time accounting (IRQ_TIME_ACCOUNTING)

TICK_CPU_ACCOUNTING checks /proc/stat on every CPU tick. This is the default choice. This accounting method is very simple.

NOTE: A CPU tick is an abstract way of measuring time by the CPU. Every processor, operating system, and installation is different. For example, a more powerful processor will have more CPU ticks than an old processor. If you install a Linux system and then reinstall from the same disk, you may have a faster or slower CPU tick time (at least that is what some computer techs say). Generally, a larger clock speed means more CPU ticks.

If VIRT_CPU_ACCOUNTING_GEN is enabled, task and CPU time accounting will be implemented by watching kernel-user boundaries. This choice comes with a price – extra overhead.

The IRQ_TIME_ACCOUNTING accounting method works by checking a time-stamp between IRQ states. The performance cost is small.

I chose “1” and was then asked about BSD Accounting “BSD Process Accounting (BSD_PROCESS_ACCT)”. This kernel feature logs a variety of information for each process that closes. For a smaller and faster kernel, I will choose “no”.

The next set of questions looks like the following.

Export task/process statistics through netlink (TASKSTATS)
Enable per-task delay accounting (TASK_DELAY_ACCT)
Enable extended accounting over taskstats (TASK_XACCT)

TASKSTATS gives the kernel the ability to export process statistics through a netlink socket. Netlink sockets are a form of IPC between the kernel and user space processes. TASK_DELAY_ACCT watches the processes and the delays concerning the access of resources. For example, TASK_DELAY_ACCT would see that process-X is waiting for some CPU time. The process is then given some CPU time if TASK_DELAY_ACCT notices that the process waits too long. TASK_XACCT collects extra accounting data. I will disable this for less kernel overhead.

Now, the next category is displayed – RCU Subsystem. The Read-Copy-Update subsystem is a low-overhead syncing mechanism that allows programs to view files that are in the process of being modified/updated. The configuration tool answered the first question.

RCU Implementation
> 1. Tree-based hierarchical RCU (TREE_RCU)
choice[1]: 1

This is to select the type of RCU. Besides TREE_RCU, there is classic RCU (the older implementation). The next question (Consider userspace as in RCU extended quiescent state (RCU_USER_QS) [N/y/?]) asks if RCU can be put in a special state when the CPU runs in userspace. This feature is usually disabled because this adds too much overhead. After this question is another RCU question (Tree-based hierarchical RCU fanout value (RCU_FANOUT) [64]) asking for a fanout value. The next question (Tree-based hierarchical RCU leaf-level fanout value (RCU_FANOUT_LEAF) [16]) is another fanout value question except this one deals with the leaf-level. Yet again, another RCU question (Disable tree-based hierarchical RCU auto-balancing (RCU_FANOUT_EXACT) [N/y/?]) asking if the RCU auto-balancing can be disabled.

Next, the configuration script asks this question “Accelerate last non-dyntick-idle CPU's grace periods (RCU_FAST_NO_HZ)”. After that, “Offload RCU callback processing from boot-selected CPUs (RCU_NOCB_CPU)” is displayed.

This next question is very important (Kernel .config support (IKCONFIG)). The developer has the choice of saving the settings made in this configuration tool into a file. This file can be placed in the kernel, in a module, or not saved at all. This file can be used by other developers that want to compile a kernel exactly as someone else. This file can also help developers recompile a kernel using a newer compiler. For illustration, a developer configures and compiles a kernel. The compiler has some bugs, but the developer still needs a kernel with these settings. Thankfully, the developer can upgrade their compiler and use the settings file to save them time from configuring the kernel again. The developer could also save the source code and config file and compile the kernel on another computer. As for another purpose, the developer can load this file and tweak the settings as needed. I chose to save the config file in a module. “Enable access to .config through /proc/config.gz (IKCONFIG_PROC)” asks if this file is accessible. I chose yes.

The next question asks how large to make the kernel log buffers (Kernel log buffer size (16 => 64KB, 17 => 128KB) (LOG_BUF_SHIFT) [17]). Smaller buffers indicate logs are not kept as long as logs set to higher buffers. This choice depends on how long the developer wishes the logs to last. I chose “12”.

Again, another question appears. This one asks about enabling NUMA (Non-Uniform Memory Access) aware memory/task placement (Automatically enable NUMA aware memory/task placement (NUMA_BALANCING_DEFAULT_ENABLED)). If set and if the computer is a NUMA machine, then NUMA balancing will be enabled. Under NUMA, a processor can access its own local memory faster than non-local memory (memory local to another processor or memory shared between processors). If the above is enabled (I enabled it), then it would be best to answer yes to “Memory placement aware NUMA scheduler (NUMA_BALANCING)”. This is the NUMA scheduler.

Under the new heading “Control Group support”, the choice “Control Group support (CGROUPS)” is automatically answered “yes” due to previous choices.

The following setting (Example debug cgroup subsystem (CGROUP_DEBUG)) is for enabling a simple cgroup subsystem for debugging the cgroups framework. The next choice (Freezer cgroup subsystem (CGROUP_FREEZER)) allows programmers to allow the ability to freeze and unfreeze tasks in a cgroup.

NOTE: A cgroup is a group of processes.

Next, we are asked “Device controller for cgroups (CGROUP_DEVICE)”. Cgroups (Control Groups) is a feature used to control resource usage. Answering “yes” will allow cgroup whitelists for the devices cgroups can open or mknod (system call for creating a file system node).

The next question (Cpuset support (CPUSETS)) asks if it can allow the creation and management of CPUSETS. This would allow administrators to dynamically partition sets of Memory Nodes and CPUs on a system and assign tasks to run on those sets. This is usually used on SMP and NUMA systems. I answered “no” on this question.

NOTE: Remember, if I do not specify what I chose, then I chose the default.

Enabling a cgroup accounting subsystem (Simple CPU accounting cgroup subsystem (CGROUP_CPUACCT)) makes a resource controller for monitoring the CPU usage of individual tasks in a cgroup. I chose “no”.

Resource counters (Resource counters (RESOURCE_COUNTERS)) enables controller independent resource accounting infrastructure that works with cgroups. I chose “no”.

The next question (Enable perf_event per-cpu per-container group (cgroup) monitoring (CGROUP_PERF)) allows developers to extend the per-cpu mode to make it only monitor threads of a particular cgroup on a specific CPU. I chose “no”.

The next section is “Group CPU Scheduler”. The first two pre-answered questions include

Group CPU scheduler (CGROUP_SCHED)
Group scheduling for SCHED_OTHER (FAIR_GROUP_SCHED)

The first answerable question (CPU bandwidth provisioning for FAIR_GROUP_SCHED (CFS_BANDWIDTH)) asks if the kernel should allow users to set CPU bandwidth limits for tasks executing in the fair group scheduler. Groups with no limit set are considered to be unconstrained and will run with no restriction.

NOTE: Not all of the kernel options are in groups. I mention groups only for the ease of reading and to indicate a new, large topic. It is not important to know the groups. This grouping system is helpful when configuring the kernel using the graphical tools. Then, developers can look through the menus that are grouped when searching for a particular setting.

Developers can enable users to allocate CPU bandwidth to task groups by answering yes to “Group scheduling for SCHED_RR/FIFO (RT_GROUP_SCHED)”.

The next question is “Block IO controller (BLK_CGROUP)”. Task groups are recognized and their disk bandwidth is allocated by the CFQ IO scheduler which uses the block IO controller to do so. The BIO throttling logic in the block layer uses a block IO controller to provide upper limit in IO rates on a device.

Here is a debugging question (Enable Block IO controller debugging (DEBUG_BLK_CGROUP) [N/y/?]) that is asking to enable debugging for block IO controllers. To make a streamlined kernel, it is best to disable this feature.

To enable checkpoint and restore features in the kernel answer yes to “Checkpoint/restore support (CHECKPOINT_RESTORE)”. I chose no for less overhead. Enabling this feature would add auxiliary prctl codes to setup process text, data and heap segment sizes, and a few additional proc entries.

Next, we will configure namespace support. A namespace is a container for a group of identifiers. For illustration, /usr/lib/python3/dist-packages/re.py is an identifier, /usr/lib/python3/dist-packages/ is the namespace, and re.py is the localname in the namespace.

The first namespace question (Namespaces support (NAMESPACES)) asks if namespaces can be enabled. This will allow the same PIDs (Process ID) to be used but indifferent namespaces. Otherwise, PIDs can never be duplicated.

The next question (UTS namespace (UTS_NS)) asks to enable the ability for tasks in the UTS namespace to see different information in the uname() system call. The uname() system call provides information about the machine and operating system.

Enabling the IPC namespace (IPC namespace (IPC_NS)) will allow tasks in this namespace to work with IPC IDs which correspond to different IPC objects in different namespaces.

PID Namespaces (PID Namespaces (PID_NS)) are process ID namespaces. This allows multiple processes, each in different PID namespaces, to use the same PID. This is a building block of containers.

Next, enabling network namespaces (Network namespace (NET_NS)) will allow users to make a network stack appear to have multiple instances.

When enabled, Automatic process group scheduling (SCHED_AUTOGROUP) populates and creates task groups to optimize the scheduler for desktop workloads. This will put applications that take up a lot of resources in their own task group. This helps performance.

Here is a debugging feature that should be disabled unless it is specifically needed. This question (Enable deprecated sysfs features to support old userspace tools (SYSFS_DEPRECATED)) asks if sysfs should be enabled. This is a virtual filesystem for debugging the kernel.

Next, the question “Kernel->user space relay support (formerly relayfs) (RELAY)” is answered “yes” because it is needed with the current configuration. It is best to allow initrd support (Initial RAM filesystem and RAM disk (initramfs/initrd) support (BLK_DEV_INITRD)).

The user is asked where to put the initramfs source files. If none are needed, then leave this blank.

Next, the developer is asked about the supported compression format for the initial ramdisks (Linux image files for the kernel). It is fine to enable support for all of the compression formats.

Support initial ramdisks compressed using gzip (RD_GZIP)
Support initial ramdisks compressed using bzip2 (RD_BZIP2)
Support initial ramdisks compressed using LZMA (RD_LZMA)
Support initial ramdisks compressed using XZ (RD_XZ)
Support initial ramdisks compressed using LZO (RD_LZO)

Here, the compiling options for the kernel are set (Optimize for size (CC_OPTIMIZE_FOR_SIZE)). The developer can have the compiler optimize the code when compiling. I chose “yes”.

For users wanting to configure more kernel features, then they can answer “yes” for this next question (Configure standard kernel features (expert users) (EXPERT)).


To enable legacy 16-bit UID syscall wrappers, answer yes to this question (Enable 16-bit UID system calls (UID16)). These system calls use 16-bit user IDs.

It is recommended to enable sysctl syscall support (Sysctl syscall support (SYSCTL_SYSCALL)). This allows /proc/sys to be the interface for binary paths.

The next two questions about debugging have been pre-answered “yes” - “Load all symbols for debugging/ksymoops (KALLSYMS)” and “Include all symbols in kallsyms (KALLSYMS_ALL)”. These enable debugging symbols.

Next, developers should enable printk support (Enable support for printk (PRINTK)). This prints kernel messages to the kernel log. This is important if something goes wrong with the kernel. Having a mute kernel is not a good idea. However, some developer saw a purpose for it if we have a choice. Otherwise, we would not have a choice.

Unless needed, developers can disable bug support (BUG() support (BUG)). Disabling this will remove support for WARN and BUG messages. This reduces the kernel's size.

--------------------------------------------------------------------------------

via: http://www.linux.org/threads/the-linux-kernel-configuring-the-kernel-part-2.4318/

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出
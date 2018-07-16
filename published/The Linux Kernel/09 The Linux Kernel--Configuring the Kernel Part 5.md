戴文的Linux内核专题：09 配置内核(5)
================================================================================

Linux内核拥有许多可以配置的特性，接下来我们还有许多要配置。

下一个可以配置的特性是x86的随机数生成器(x86 architectural random number generator (ARCH_RANDOM))。记住，我们现在配置的是针对AMD64系统的内核代码。这个随机数生成器使用Intel x86的RDRAND指令。这并不通用，所以为了一个更轻量的内核我禁用了它。

接着，我们可以启用或者禁用"Supervisor Mode Access Prevention (X86\_SMAP)"。这是Intel处理器使用的安全特性。SMAP在一些条件下只允许内核访问用户空间。这个有助于保护用户空间。如果启用，这里有一点性能和内核大小的开销，但是开销很小。由于我是用的是AMD系统，所以我禁用了这个特性。

开发者可以启用"EFI runtime service support (EFI)"。只有在有EFI固件的系统上启用它。拥有这个特性，内核可以使用的EFI服务。EFI是一个操作系统和硬件如何交流的规范，所以EFI固件是使用这个规范的硬件代码。因为我没有EFI固件，所以我禁用了它。

这是一个应该被启用的有用的安全方式(Enable seccomp to safely compute untrusted bytecode (SECCOMP))。这个安全特性在使用非可信的字节码的数值计算(执行大量计算的软件)中使用。字节码(可移植代码)是一种被解释器有效读取的代码。字节码不是源代码，但它也不是汇编或者二进制代码。非可信的代码是一种可能导致系统/数据损坏的代码。可能会破坏系统或者毁坏数据的非可信的代码通过seccomp被隔离在独立的地址空间中。这是通过文件描述符传输的方法。通常上，最好启用这个安全特性，即使会有一些性能开销，除非你在制作一个需要榨干性能的内核。

这里是另外一个安全特性(Enable -fstack-protector buffer overflow detection (CC\_STACKPROTECTOR))。缓冲溢出是数据被写在超出了它的内存界限而进入了邻近的内存中。这是一个安全威胁。一些恶意软件使用缓冲区溢出来破坏系统。启用这个会使用GCC选项 "-fstack-protector"。GCC是一个Linux编译器，在你配置完成后用它来编译内核。这个编译器参数会在返回地址前在栈上加入一个canary值(特殊的安全代码)。这个值会在返回前被验证。当内存溢出发生时，canary值会得到覆盖消息。这时，会导致内核崩溃。如许多人知道的那样，内核错误意味着系统将要崩溃，但是这比系统被入侵或者数据永久损害的好。发生内核错误，系统会重启，但是如果缓冲溢出则可能导致系统被入侵。一个简单的重启无法修复破坏（译注：但也不会更坏）。你必须用GCC 4.2或者更高版本支持这个参数的GCC来编译内核。

提示：要知道你使用的版本号，在命令行内键入"gcc --version"。

在这之后，我们可以配置定时器频率。配置工具建议使用250Hz，所以我们使用这个值。

Timer frequency

1\. 100 HZ (HZ\_100)

\>2\. 250 HZ (HZ\_250)

3\. 300 HZ (HZ\_300)

4\. 1000 HZ (HZ\_1000)

choice[1-4?]: 2

使用1000Hz通常来讲对许多系统而言太快了。定时器频率决定着定时器中断被使用的频率。这有助于在时间线上的系统操作。程序并不是随机地执行一条命令，相反它们会等到定时器中断结束。这保持着有组织和结构的处理。频率为100Hz的定时器中断之间的时间是10ms，250Hz是4ms，1000Hz是1ms。现在许多开发者会马上想到1000Hz是最好的。好吧，这取决于你对开销的要求。一个更大的定时器频率意味着更多的能源消耗和更多的能源被利用(在定时器上)，产生更多的热量。更多的热量意味着硬件损耗的更快。

注意：如果某个特定的特性对你并不重要或者你不确定该选择什么，就使用配置工具选择的默认值。比如，就我现在正在配置的内核而言，使用哪个定时器对我并不重要。总的来说，如果你没有特别的原因去选择任何一个选项时，就使用默认值。

下面这个有趣的系统调用可能会对一些用户有用(kexec system call (KEXEC))。kexec调用会关闭当前内核去启动另外一个或者重启当前内核。硬件并不会关闭，并且这个调用可以无需固件的帮助工作。bootloader是不执行的(bootloader是启动操作系统的软件) 。这个重启发生在操作系统级别上而不是硬件上。使用这个系统调用会快于执行一个标准的关机或者重启，这会保持硬件在加电状态。这个系统调用并不能工作在所有系统上。为了更高性能，启用这个热启动功能。

为了使用kexec，对重启后要使用的内核使用如下命令替换"<kernel-image>"。同样，使用之前我们讲过的内核参数替换"<command-line-options>" (我会在以后的文章中更深入的讨论。)

    kexec -l <kernel-image> --append="<command-line-options>”

特别地，我这里输入：
	
	kexec -l /boot/vmlinuz-3.8.0-27-generic –append="root=/dev/sda1"

注意：硬件有时不需要重置，所以这不依赖于kexec。

下面，我们有一个适用于kexec的调试特性(kernel crash dumps (CRASH\_DUMP))。当kexec被调用时，一个崩溃信息(crash dump)会生成。除非你有必要调试kexec，否则这个并不必要。我禁用了这个特性。

再者，我们有另外一个kexec特性(kexec jump (KEXEC_JUMP))。kexec跳允许用户在原始内核和kexec启动的内核之间切换。

最好对内核启动地址使用默认值(Physical address where the kernel is loaded (PHYSICAL\_START) [0x1000000])。

下一个内核选项(Build a relocatable kernel (RELOCATABLE))允许内核放在内存的任何地方。内核文件会增大10%，但是超出部分会在执行时从内存移除。许多人也许想知道这为什么很重要。在2.6.20内核前，救援内核(rescue kernel)必须被配置和编译运行在不同的内存地址上。当这个特性发明后，开发者不必再编译两个内核。救援内核不会在第一个已加载的内核的地方加载，因为该块内存已被占用或者发生了错误。(如果你正在使用救援内核，那么明显第一个内核发生了错误)

下面这个特性应该在可以增加CPU数量的系统中启用，除非你有特别的理由不去这么做(Support for hot-pluggable CPUs (HOTPLUG\_CPU))。配置工具会自动启用这个特性。在这个特性下，你可以在一个拥有很多处理器的系统上激活/停用一个CPU，这并不是说在系统中插入新的CPU，所有的CPU必须已经安装在系统中。

下面的选项会让我们选择设置上面的特性是否默认启用(Set default setting of cpu0_hotpluggable (BOOTPARAM\_HOTPLUG\_CPU0))。为了性能最好禁用这个特性直到需要的时候。

接着的这个调试特性允许开发者调试CPU热插拔特性(Debug CPU0 hotplug (DEBUG\_HOTPLUG\_CPU0))。我禁用了它。

为了兼容旧版本的glibc(<2.3.3)，可以启用这个特性(Compat VDSO support (COMPAT\_VDSO))。这适用于通过映射32位在VDSO(虚拟动态链接共享对象)的旧式地址。Glibc是GNC C库；这是GNU工程实现的C标准库。

如果系统内核被用于一个缺乏完整功能的bootloader上，那么启用这个特性(Built-in kernel command line (CMDLINE_BOOL))。这允许用户在内核自身上使用一条命令行（译注：及其参数），那么管理员可以修复内核问题。如果bootloader已经有了一条命令行(像grub)，那么这个特性不必启用。

现在我们可以配置ACPI和电源了。首先,我们被要求选择系统是否可以挂起到内存(Suspend to RAM and standby (SUSPEND))。高级配置和电源接口(ACPI)是一种对于设备配置和电源管理的开放标准。挂起系统会将数据放在内存上，同时硬件进入一种低功耗的状态。系统不会完全关机。如果用户需要计算机进入一个低功耗的状态，但是希望保留当前已打开程序时是非常有用的。关闭一个系统会完全关闭系统电源并且清理内存。

下面，我们可以启用睡眠(Hibernation (aka 'suspend to disk') (HIBERNATION))。睡眠就像挂起模式，但是内存中所有数据被保存到硬盘上，并且设备完全关闭。这允许用户在电源恢复后继续使用他们已打开的程序。

这里,我们可以设置默认的恢复分区(Default resume partition (PM\_STD\_PARTITION))。很少有开发者和管理员需要这个特性。当系统从睡眠中恢复时，他会加载默认的恢复分区。

在这之后,我们可以启用"Opportunistic sleep (PM\_AUTOSLEEP)"。这会让内核在没有活跃的唤醒调用被调用时进入挂起或者睡眠状态。这意味着空闲的系统将会进入挂起模式以节省电源。我启用了这个特性。

接下来，是询问关于"User space wakeup sources interface (PM\_WAKELOCKS)"。启用这个特性将会允许唤醒源对象被激活、停用，并通过基于sysfs接口由用户空间创建。唤醒源对象会追踪唤醒事件源。

sysfs是位于/sys/的虚拟文件系统。这个虚拟文件系统包含了关于设备的信息。当进入/sys/时，它似乎是硬盘的一部分，但是这个并不是一个真正的挂载点。这些文件实际存在于内存中。这与/proc/是同一个概念。

注意:"/sysfs/"是一个文件夹，而"/sysfs"则可以是一个根目录下名为"sysfs"的文件。许多Linux用户会混淆这两种命名约定。

如果启用了上面的选项,那么你可以设置"Maximum number of user space wakeup sources (0 = no limit) (PM\_WAKELOCKS\_LIMIT)"。最好选择默认，那么你就可以启用垃圾收集器(Garbage collector for user space wakeup sources (PM\_WAKELOCKS\_GC))。垃圾收集是一种内存管理方式。

注意: 在需要更多内存的系统中，通常最好在大多数情况下尽可能启用垃圾收集。不然内存会消耗得更快且杂乱。

下一个电源选项关于IO设备(Run-time PM core functionality (PM\_RUNTIME))。这个选项允许IO硬件在运行时进入低功耗状态。硬件必须支持这个才行，不是所有硬件都支持。

与其他许多内核组件一样，如果启用了(Power Management Debug Support)，电源管理代码同样有调试支持。我禁用了这个选项。

注意: 注意这些我引用/显示的配置工具上的选项或问题不再显示选项代码(括号间所有的大写字母)。这是因为我没有使用基于ncurses的配置工具(make menuconfig)而是使用默认工具去得到选项、设置和问题。记住，"make config"缺乏保存当前进度的能力。

在这之后,配置工具会启用"ACPI (Advanced Configuration and Power Interface) Support"。最好允许这个电源管理规范。通常配置工具会启用这个特性。

为了允许向后兼容，启用"Deprecated /proc/acpi files"。新的实现使用更新的在/sys下的实现。我禁用了这个选项。一个相似的问题询问关于"Deprecated power /proc/acpi directories"。通常上,如果你禁用了这些文件，你不再需要这些文件夹，所以我禁用了他们。一些旧的程序可能会使用这些文件和文件夹。如果你在给旧的的Linux系统上编译一个新的内核，最好启用这个选项。

下面，我们有另外一个文件接口可以启用或者禁用(EC read/write access through)。这会在/sys/kernek/debug/ec下创建一个嵌入式控制器接口。嵌入式控制器通常在笔记本中读取传感器，内核代码通过系统的BIOS表提供的ACPI代码访问嵌入式控制器。

这里有另外一个可以启用或者禁用的向后兼容特性 (Deprecated /proc/acpi/event support)。acpi守护进程可能会读取/proc/api/event来管理ACPI生成的驱动。不同于这个接口，守护进程使用netlink事件或者输入层来得到送给用户空间的事件，acpi守护进程管理ACPI事件。

下一个选项允许开发者启用一个特性，它会通知内核现在使用的是交流电源(AC Adapter)还是电池。下一个选项从/proc/acpi/battery/ (Battery)中提供电池信息。

为了内核在电源/睡眠按钮按下或者盖子合上时不同表现，启用这个“按钮”选项(Button)。这些事件在/proc/acpi/event/中控制。比如这样的行为，如果在用户账户的电源选项启用了挂起，当笔记本电脑的盖子关闭后系统将会挂起。

下一个ACPI扩展是针对显卡的(Video)。

ACPI风扇控制可以被启用/禁用(Fan)。最好启用ACPI风扇管理，这有助于节能。

我们正在进一步配置内核中，但在接下来的文章中还有更多要做。

--------------------------------------------------------------------------------

via: http://www.linux.org/threads/the-linux-kernel-configuring-the-kernel-part-5.4424/

译者：[geekpi](https://github.com/geekpi) 校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

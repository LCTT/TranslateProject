戴文的Linux内核专题：10 配置内核(6)
================================================================================

欢迎来到下一篇关于内核配置文章！还有大量的选项需要配置。这篇文章将主要讨论PCI和ACPI。

这里我们可以启用由ACPI控制的扩展坞和可移动驱动器槽的支持(Dock)。记住，ACPI(Advanced Configuration and Power Management Interface)是一个电源管理系统。扩展坞是一种其他的设备通过额外的接口插入的设备。扩展坞可以容纳许多不同的端口和连接器。一个ACPI控制的扩展坞是指其电源管理是通过ACPI进行的。驱动器槽是一套可以增加硬盘的设备，这也可以由ACPI管理。

下面，我们允许ACPI用来管理空闲的CPU(Processor)。这会让处理器在空闲时进入ACPI C2或者C3状态。这可以节省电源并降低CPU芯片的温度。处理器只在100%没有占用时才进入空闲状态。没有程序必须请求一个特定时间的CPU资源。

CPU电源有四个状态 - C0、C1、C2和C3。C0是操作激活状态。C1(Halt)是一个不执行指令激活状态，但是可以立刻执行指令。C2(Stop-Clock)是一种断电状态。C3(Sleep)是一种比C2更彻底的断电状态。在C3状态中，现在缓存不再被同步或者管理，直到CPU离开这个状态。第五个状态称作C1E(Enhanced Halt State)，他拥有低功耗。

如果启用了IPMI驱动，那么ACPI可以访问BMC控制器(IPMI)。基板管理控制器(BMC)是一种管理软件和硬件间连接的微控制器。智能平台管理接口(IPMI)是一种框架，通过直接的硬件层面而不是登录shell或者操作系统层面来管理计算机。

ACPI v4.0进程聚合器允许内核应用一个CPU配置到所有系统中的处理器中(Processor Aggregator)。截止到ACPI v4.0，只有idle状态可以用这个方式配置。

接下来，可以启用ACPI热区(Thermal Zone)。多数硬件支持这个特性。这允许风扇的电源由ACPI管理。

如果启用这个选项，自定义DSDT可以链接到内核。在这个设置中，开发者必须在文件中包含完整的路径名。系统差异表(DSDT)是一个包含了系统支持的电源事件信息的文件。它不需要输入路径名，这些表存在于固件中。内核会帮你处理这些。这个主要的目的是用于如果开发者需要使用不同于设备内置的表时用到。

任意ACPI表都可以通过initrd来覆盖(ACPI tables override via initrd)。ACPI表是指示如何控制并与硬件交互的基础规则和指令。

像内核的其他部分一样，ACPI系统也可以生成调试信息(Debug Statements)。像其他调试特性一样，你或许希望禁用它并省下50KB。

启用下面的特性会为系统检测到的每个PCI插槽(PCI slot detection driver)创建文件(/sys/bus/pci/slots/)。一个PCI插槽是在PCI主板上的一个端口，它允许用户接上其他的PC设备。PCI是主板的一种类型。PCI是指组件互相通信的方式。有些应用程序可能需要这些文件。

电源管理定时器是另外一种电源管理系统(Power Management Timer Support)。这是许多系统追踪时间的方式。这个只需要很少的能源。处理器的空闲、电压/频率调节和节流都不会影响这个定时器。大量的系统需要使用这个特性。

下面，可以启用ACPI模块和容器设备驱动(Container and Module Devices)。这会启用处理器、内存和节点的热插拔支持。它需要NUMA系统。

下面的驱动提供对ACPI内存的热插拔支持(Memory Hotplug)。有些设备甚至启用这个驱动也不支持热插拔。如果驱动以模块形式加入，那么模块将会被acpi\_memhotplug调用。

注意：对于内核某个特定的功能，硬件、BIOS和固件在必须支持时会有问题。有些系统的BIOS是不控制硬件的。这种类型的BIOS通常不会限制特性。如果内核确实有一个特定的功能，硬件必须有能力完成这样的任务。

智能电源管理驱动提供访问电池的状态和信息(Smart Battery System)。

下面，我们有一个"Hardware Error Device"驱动。设备通过SCI报告硬件错误。通常上，大多数的错误会是已纠正的错误。

下面的是ACPI调试特性(Allow ACPI methods to be inserted/replaced at run time)。这允许ACPI AML方式不通过重启系统管理。 AML代表的是ACPI机器语言(ACPI Machine Language)。AML代码可以通过请求重启来改变和测试。

APEI是ACPI的错误接口(ACPI Platform Error Interface (APEI))。APEI从芯片给操作系统报告错误。这个错误接口同样提供错误注射的能力。

当"SFI (Simple Firmware Interface) Support" 启用后，硬件固件可以发送消息给操作系统。固件与操作系统间的通信通过内存中的静态表。SFI-only的计算机的内核工作需要这个特性。

想要改变处理器的时钟速度和运行时，就启用这个特性(CPU Frequency scaling)。CPU频率调整意味着改变处理器的时钟速度。这个驱动可以用于降低时钟频率以节能。

下面是另外一个电源管理子系统(CPU idle PM support)。当处理器不在活跃状态时，它最好处在有效的空闲方式来减少电源消耗和减少CPU损耗。减少电源消耗同样可以降低内部元件的发热。

Linux内核提供了很多CPU空闲驱动。在多处理器系统上，一些用户可能有一个理由在每个CPU上使用不同的驱动(Support multiple cpuidle drivers)。启用这个驱动可以允许用户给每个处理器设置不同的驱动。

对于Intel处理器，内核有一个特别为管理这类CPU芯片空闲的驱动(Cpuidle Driver for Intel Processors)。

当内存芯片空闲时，这些同样可以处于低功耗状态(Intel chipset idle memory power saving driver)。这个驱动是特别支持IO AT的Intel设备的。

不同的计算机使用不同类型的主板(PCI support)。其中一种类型是PCI。这个驱动允许内核运行在PCI主板上。

下面，我们可以启用/禁用 "Support mmconfig PCI config space access"。

接下来，我们有一个选择启用/禁用主桥窗口驱动(Support mmconfig PCI config space access)。警告：这个驱动还没有完成(至少在3.9.4中是这样)。

像上面提到的主板，还有另一种类型的主板。写一个选项是提供"PCI Express (PCIe) support"的驱动。PCIe是一种改进并且更快速的PCI。

在这之后，下面的驱动应该被启用以支持PCIe主板上的热插拔(PCI Express Hotplug driver)。

接着，我们可以启用/禁用PCIe主板报错(Root Port Advanced Error Reporting)。这就是PCIe AER驱动。

下一个特性允许用户使用PCIe EREC(PCI Express ECRC settings control)覆盖BIOS和固件设置。下一个选项，这是对PCIe的错误注射(PCIe AER error injector support)。

下面的设置提供了操作系统控制PCI的活跃状态和时钟电源管理(PCI Express ASPM control)。通常上，固件会控制ASPM，但是这个特性允许操作系统采取控制。

如前面一样，像内核的许多组件一样，这里提供了ASPM的调试支持(Debug PCI Express ASPM)。

下面，在这个菜单选择"Default ASPM policy"。

在这选项之后，下一个是关于允许设备驱动启消息信号中断(Message Signaled Interrupts (MSI))。通常上最好允许设备给CPU发送中断。

为了在系统日志中加入大量的调试信息，启用"PCI Debugging"。

下一个选项允许PCI核心检测是否有必要启用PCI资源重分配(Enable PCI resource re-allocation detection)。

当在Linux上托管一个虚拟操作系统时，它有时可以用于为虚拟系统保留PCI设备(PCI Stub driver)。在系统虚拟化下，一个操作系统可能在另一个系统的内部或者并行。有时它们会竞争资源。可以为客户机保留设备可以减小竞争和增加性能。

下面的驱动允许超传输设备(hypertransport devices)使用中断(Interrupts on hypertransport devices)。HyperTransport是一种系统/协议总线用于处理器之间的高速通信。

下一个驱动用于PCI虚拟化，它允许虚拟设备间共享它们的物理资源(PCI IOV support)。

PCI页面请求接口(PRI)使在IOMMU(输入/输出内存管理单元)之后的PCI设备能够从页错误中恢复(PCI PRI support)。页错误不是一种错误；它指的是软件尝试访问不在物理内存上的数据的事件。

再次说明，你会在之后的文章中看到更多的需要配置Linux内核特性。

--------------------------------------------------------------------------------

via: http://www.linux.org/threads/the-linux-kernel-configuring-the-kernel-part-6.4457/

译者：[geekpi](https://github.com/geekpi) 校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出
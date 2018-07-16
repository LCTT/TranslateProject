戴文的Linux内核专题：22 配置内核 (18)
================================================================================
![](http://www.linux.org/attachments/slide-jpg.616/)

你好！准备好阅读下一篇文章了么？在本篇中，我们将会讨论辅助显示。辅助显示是一些小的LCD屏幕；大多数小于或等于128x64。接着，我们会讨论用户空间IO驱动，一些虚拟驱动，Hyper-V，开发中驱动，IOMMU，和其他一些内核特性。

第一个配置辅助显示的驱动是"KS0108 LCD Controller"。KS0108 LCD Controller是由三星制造的图形控制器。

下面可以设置LCD并口地址(Parallel port where the LCD is connected)。第一个并口地址是0x378，下一个是0x278，第三个是0x3BC。这些不是地址唯一的选择。大多数人不需要改变这个。shell命令"cat /proc/ioports"会列出可用的并口和地址。

内核可以设置KS0108 LCD 控制器的写入延时到并口(Delay between each control writing (microseconds))。默认的值大部分是正确的，因此一般不需要更改。

"CFAG12864B LCD"屏幕是一块128x64，双色LCD屏幕。这块屏幕依赖于KS0108 LCD控制器。

可以改变这些LCD屏幕的刷新率(Refresh rate (hertz))。通常上，更高的刷新率会导致更多的CPU活动。这意味着一个缓慢的系统需要一个更低的刷新率。

设置完辅助显示后，接着设置"Userspace I/O drivers"。用户空间系统允许用户的应用和进程访问内核中断和内存地址。启用了它，一些驱动可以放在用户空间。

"generic Hilscher CIF Card driver"用于Profibus卡和Hilscher CIF卡。

"Userspace I/O platform driver"在用户空间创建通用驱动系统。

下一个驱动和上面的相同，但是增加IRQ处理(Userspace I/O platform driver with generic IRQ handling)。

下面的驱动又像前面的一个，但是增加了动态内存支持(Userspace platform driver with generic irq and dynamic memory)。

下面，是一些供应商/设备特性的驱动。

接着是一些通用PCI/PCIe卡驱动(Generic driver for PCI 2.3 and PCI Express cards)。

下面的驱动用于"VFIO support for PCI devices"。VFIO代表Virtual Function Input/Output(虚拟功能输入/输出)。VFIO允许设备直接以安全方式访问用户空间。

"VFIO PCI support for VGA devices"允许VGA通过VFIO被PCI支持。

接下来是virtio驱动。virtio是一个IO虚拟化平台。这个虚拟软件用于操作系统虚拟化。这在Linux系统上的虚拟机上运行一个操作系统时需要。

我们第一个可以配置的virtio驱动是"PCI driver for virtio devices"。这允许虚拟访问PCI

"Virtio balloon driver"允许虚拟系统的内存根据需要扩展或减少。通常上，没有人希望在需要内存的时候，虚拟系统保留它可能不会使用的内存。

下面的驱动允许内存映射到virtio设备(Platform bus driver for memory mapped virtio devices)。

如果Linux内核需要运行在微软的Hyper-V系统上，那么启用这个驱动(Microsoft Hyper-V client drivers)。这允许Linux能够成为Hyper的访客/客户端系统。

![](http://www.linux.org/attachments/kernel_18-png.617/)

下面，我们会配置处于开发阶段的驱动。这些驱动正在开发当中，可能会变化很快，或者还没到Linux内核的质量标准。这个分类中的驱动只有Android驱动(在内核3.9.4中)。是的，Andorid使用Linux内核，这使得Andorid变成了一个Linux系统。然而，这仍然有争议。如果内核是用于Android，那么最好启用所有的驱动。

"Android Binder IPC Driver"提供了对于Binder的支持，它允许Andorid系统进程间相互通信。

下面可以启用ashmen驱动(Enable the Anonymous Shared Memory Subsystem)。Ashmem代表"Anonymous SHared MEMory"(虚拟内存共享)或者"Android SHared MEMory"(Andorid共享内存)。

"Android log driver"提供了完整的Andorid日志系统。

"Timed output class driver" 和 "Android timed gpio driver"允许Andorid系统操作GIP引脚并在超时后取消操作。

"Android Low Memory Killer"会在需要更多内存关闭进程。这个特性会杀死不再使用或活跃的任务。

"Android alarm driver"使内核在设定的间隔后唤醒。

在配置完开发阶段的驱动后，下面的驱动用于X86平台。这些驱动是 X86 (32-bit)的供应商/设备特定硬件。

下一个驱动是"Mailbox Hardware Support"。这个框架控制邮箱队列和硬件邮箱系统的中断信号。

"IOMMU Hardware Support"链接内存到能够使用DMA的设备上。IOMMU增强了DMA。IOMMU映射地址并阻止故障设备访问内存。IOMMU同样允许硬件访问比没有IOMMU更多内存。

"AMD IOMMU support"提供了对AMD设备更好的IOMMU支持。

对于AMD IOMMU支持存在调试特性(Export AMD IOMMU statistics to debugfs)。

存在一个对于AMD硬件的更新版本的IOMMU驱动(AMD IOMMU Version 2 driver)。

Linux内核同样支持对Intel设备的IOMMU驱动支持(Support for Intel IOMMU using DMA Remapping Devices)。

一些设备可能会接受不同的电压和时钟频率。这个驱动允许操作系统控制设备的电压输出和时钟频率(Generic Dynamic Voltage and Frequency Scaling (DVFS) support)。启用了这个驱动，可以启用下面的那些对于电源/性能管理特性。

"Simple Ondemand"就像上面的，但是只会基于设备活动改变时钟频率。通常上，更多的活动意味着设备需要更快的时钟速率来使用更多的资源需求。

"Performance"允许系统设置最高支持的时钟速度以满足最好的性能。这会增加电源消耗。

"Powersave"会设置时钟频率到最低以节约电源。

"Userspace"允许用户空间设置时钟频率。

"External Connector Class (extcon) support"使得用户空间可以监视外部连接器如USB和AC口。这允许应用了解是否插入了线缆。用户几乎都希望启用这个。如果任何人由于某个合理的理由禁用了它，请告诉我们为什么这么做。

"GPIO extcon support"驱动就像上面的驱动，但是它只对于GPIO管脚。

接下来是不同的供货商/设备特定的内存控制器(Memory Controller drivers)。内存芯片控制器可能是独立的设备或者内置在内存芯片上。这些控制器管理这输入和输出的数据流。

"Industrial I/O support"驱动提供了标准的传感器接口而不管总线的类型(像PCIe、spi、GPIO等等)。IIO是"Industrial I/O support"(工业IO)的通用缩写。

Linux内核提供了大量不同的加速器、放大器模数转换器、惯性测量单元、光敏传感器、磁场传感器和其他许多传感器和转换器的支持。

"Intel Non-Transparent Bridge support"驱动支持连接到系统的PCIe硬件桥。所有到映射内存的写入会镜像到两个系统中。

"VME bridge support"和上面的相同除了桥使用的是VME，这是一个不同的总线标准。

"Pulse-Width Modulation (PWM) Support"通过调节从这些设备收到的平均功率调节背光灯和风扇速度。

"IndustryPack bus support"提供了对IndustryPack总线标准的支持。

下一篇文章，我们会继续配置固件驱动。谢谢!

--------------------------------------------------------------------------------

via: http://www.linux.org/threads/the-linux-kernel-configuring-the-kernel-part-18.4896/

译者：[geekpi](https://github.com/geekpi) 校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出
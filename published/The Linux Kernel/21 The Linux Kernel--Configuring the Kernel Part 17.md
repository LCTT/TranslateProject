戴文的Linux内核专题：21 配置内核 (17)
================================================================================
![](http://www.linux.org/attachments/slide-jpg.605/)

你好！这篇文章会覆盖不同的驱动。

首先"virtio console"是一种用于hypervisors的虚拟控制台驱动。

"IPMI top-level message handler"是用于IPMI系统的消息管理器。IPMI代表的是"Intelligent Platform Management Interface"(智能平台管理系统)。IPMI是一种不需要shell通过网络管理系统的接口。

"/dev/nvram support"允许系统读取和写入实时时钟的内存。通常上，这个特性用于在掉电时保存数据。

下面一个驱动支持Siemens R3964包驱动(Siemens R3964 line discipline)。这个是设备对设备协议

现在，我们可以进入PCMCIA字符设备驱动。然而，大多数这里的驱动是供货商/设备特定的。

原始块设备驱动允许块设备绑定到设备文件上/dev/raw/rawN(RAW driver (/dev/raw/rawN))。这么做的好处是高效的零拷贝。然而，大多数软件更偏好通过/dev/sd** 或者 /dev/hd**访问存储设备。

下面，可以设置支持的原始设备的最大数量。

下面的驱动可以生成设备文件/dev/hpet (HPET - High Precision Event Timer)。

注意：你们中很多人可能会想知道为什么要启用这些设备文件问题。好的，这些设备文件充当了一个软件和硬件之间的接口。

通过这个驱动可以映射HPET驱动(Allow mmap of HPET)。映射是一个生成设备和文件在内存中的地址列表。文件接着可以通过内存地址更快地找到并且接着指挥硬盘从地址中得到数据。

"Hangcheck timer"用于检测系统是否被锁定。这个定时器监视着锁定进程。当一个进程被冻结了，定时器就开启。当定时器停止后，如果进程还没有重启或者关闭，那么定时器会强迫进程关闭。

> 引用Linus Torvalds的话：可移植性是对于那些无法写新程序的人而言的。

使用Trusted Computing Group(可信赖计算组)规范的TPM安全芯片会需要这个驱动(TPM Hardware Support)。

现在，我们可以进入I2C设备。I2C代表的是"Inter-Integrated Circuit"(内部集成电路)并经常被成为"eye two see"。然而，一些人会说"eye squared see"。I2C是一种串行总线标准。

一些旧的软件将I2C适配器作为类设备，但是如今的软件不会这么做(Enable compatibility bits for old user-space)。所以，这个驱动会提供对旧软件的向后支持。

接下来，可以生成I2C设备文件(I2C device interface)。

I2C可以通过这个驱动提供复用支持(I2C bus multiplexing support)。

I2C可以通过这个驱动支持GPIO控制的复用(GPIO-based I2C multiplexer)。

对于开发者用这个驱动可以在I2C和SMBus上执行不同的测试(I2C/SMBus Test Stub)。

I2C系统启用这个特性可以生成调试信息(I2C Core debugging messages)。

下一个驱动生成额外的I2C调试信息(I2C Algorithm debugging messages)。

> 引用Linus Torvalds的话：Linux中没有原始设备的原因似乎我个人任何原始设备是一个愚蠢的注意。

下面的驱动会使I2C驱动生成调试信息(I2C Bus debugging messages)。

接下来，我们有串行外设接口(Serial Peripheral Interface)支持(SPI support)。SPi是一种用于SPI总线的同步串行协议。

在这之后，有一个驱动用于高速同步串行接口(High speed synchronous Serial Interface support)支持(HSI support)。HSI是一种同步串行协议。

PPS同样在Linux内核中支持(PPS support)。

"IP-over-InfiniBand"驱动支持IP包通过InfiniBand(译注：一种无限带宽技术)传输。

在这之后，有一个调试驱动用于IP-over-InfiniBand(IP-over-InfiniBand debugging)。

SCSI的RDMA协议同样可以通过InfiniBand传输(InfiniBand SCSI RDMA Protocol)。

这里同样有一种通过InfiniBand传输iSCSI协议的扩展(iSCSI Extensions for RDMA (iSER))。

有时候，错误发生在了整个系统必须知道的核心系统中(EDAC (Error Detection And Correction) reporting)。这个驱动发送核心给系统。通常地，这类底层错误由处理器中报告并接着由这个驱动让其他系统进程知道或者处理错误。

这个驱动提供了在老版本中的sysfs中使用的过时EDAC的支持(EDAC legacy sysfs)。

EDAC可以用来设置发送调试信息给Linux的日志系统(Debugging)。

> 引用Linus Torvalds的话：没有人可以第一次创造如此好的代码，除了我。

"Machine Check Exceptions"(机器检测异常)(MCEs)通过这个驱动被转化成可读的信息(Decode MCEs in human-readable form (only on AMD for now))。MCEs是由CPU检测到的硬件错误。MCEs通常触发内核错误。

将MCE解码成可读的形式的过程可以被注射用于测试错误处理(Simple MCE injection interface over /sysfs)。

下一个驱动允许错误在内存中被检测到并纠正(Main Memory EDAC (Error Detection And Correction) reporting)。

下面，还有很多用于特定设备组的检测和纠正错误的驱动。

> 引用Linus Torvalds的话：理论和实践有时会冲突。那这个发生时，理论输了。每次都是。

现在我们可以进入实时时钟("Real Time Clock")。这通常缩写为"RTC"。RTC一直跟随着时间。

![](http://www.linux.org/attachments/rtc-png.606/)

下面的设定允许用户在Linux系统中使用RTC时间作为"挂钟"时间(Set system time from RTC on startup and resume)。这个挂钟是我们在桌面上或者通过"date"命令看到的时间。

另外，挂钟可以通过NTP服务器得到时间并与RTC同步(Set the RTC time based on NTP synchronization)。

一些系统有几个RTC，所以用户必须设置哪一个是默认 (RTC used to set the system time)。最好设置第一个(/dev/rtc0)为主时钟。

可以设置RTC系统的调试特性(RTC debug support)。

RTC可以使用不同的接口给予操作系统当前时间。使用sysfs会需要这个驱动(/sys/class/rtc/rtcN (sysfs))，而似乎用proc需要这个驱动 (/proc/driver/rtc (procfs for rtcN))。特殊的RTC字符设备可以生成并使用 (/dev/rtcN (character devices))。shell命令"hwclock"使用/dev/rtc,所以RTC字符设备。

下一个驱动允许在/dev接口上模拟RTC中断(RTC UIE emulation on dev interface)。这个驱动读取时钟时间并允许新的时间从/dev中检索。

RTC系统可以通过测试驱动测试(Test driver/device)。

下面，我们会讨论直接内存访问系统。DMA是硬件独立于处理器的内存访问过程。DMA增加的系统性能因为处理器将做得更少如果硬件自身做了更多的任务。不然，硬件会等待处理器完成任务。

这是调试DMA系统的调试引擎(DMA Engine debugging)。

接下来，有许多的供货商/设备特定驱动用于DMA支持。

一些DMA通过这个驱动支持大端读取和写入(Use big endian I/O register access)。

大端指的是二进制码的排列。英语国家的数字系统将数字的最大端放在左边。比如，数字17，最左的数字是放置十位的地方大于个位。在大端中，每字节最大的放在左边。字节有8位。比如：10110100。每一处都有相应的值128、64、32、16、8、4、2、1。所以提到的为被转换成十进制180。

DMA系统可以使用网络减小CPU使用(Network: TCP receive copy offload)。

"DMA Test Client"用于测试DMA系统。

下一篇文章中，我们会讨论显示/视频驱动。谢谢！

参考：Linus Torvalds的引用来自于:[http://en.wikiquote.org/wiki/Linus_Torvalds][1]

--------------------------------------------------------------------------------

via: http://www.linux.org/threads/the-linux-kernel-configuring-the-kernel-part-17.4875/

译者：[geekpi](https://github.com/geekpi) 校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://en.wikiquote.org/wiki/Linus_Torvalds
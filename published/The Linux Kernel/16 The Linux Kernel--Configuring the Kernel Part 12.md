戴文的Linux内核专题：16 配置内核 (12)
================================================================================
![](http://www.linux.org/attachments/slide-jpg.539/)

欢迎来享受Linux内核配置系列下一部分。如你所猜到的那样，内核支持大量不同的硬件、协议和特性。

下一组我们要讨论的特性是"EEPROM support"。电可擦除可编程只读存储器(Electrically Erasable Programmable Read-Only Memory)是一种掉电或者意外关闭后不会擦除内容的存储器。

内核支持在I2C卡上的EEPROM芯片包括FRAMs、ROMs和SRAMs (I2C EEPROMs / RAMs / ROMs 来自多数供货商)。FRAM(同样也称作FeRAM是一种使用铁电原理而不是电介质存储数据的随机访问存储芯片)。ROM芯片是只读(Read Only Memory)芯片。SRAM是静态而不是动态存储器就像DRAM。DRAN必须被刷新以保留数据而SRAM不需要刷新。然而，两者都会在电源关闭或者丢失时失去数据。

内核支持SPI总线的EEPROM(SPI EEPROMs from most vendors)。串行外设接口总线(Serial Peripheral Interface Bus (SPI))是一个缺乏错误检测的全双工总线系统。

老式的I2C EEPROM芯片需要一个除了上面I2C驱动之外的驱动(Old I2C EEPROM reader)。I2C总线用于嵌入式系统和电话，由于它用的是低速总线协议。

这个特性用来防止Maxim的可编程EEPROM变成只读模式(Maxim MAX6874/5 power supply supervisor)。特别地，这驱动提供对这个芯片的更好的电源管理。

这里还有一个驱动"EEPROM 93CX6 support"，"Microwire EEPROM 93XX46 support"和"ENE CB710/720 Flash memory card reader support"。

和其他内核特性一样，这里有一个对于EEPROM的调试特性(Enable driver debugging)。再说一次，为了更好的性能，禁用调试特性。

下面，我们有一个TI特性(Shared transport core driver)。这个驱动提供对于BT/FM和GPS芯片的传输协议。

下面的驱动支持I2C LIS3LV02Dx加速度计(STMicroeletronics LIS3LV02Dx three-axis digital accelerometer (I2C))。设备提供的数据存储在/sys/devices/platform/lis3lv02d。

下一步， Linux提供了下载固件到Altera的FPGA的模块(Altera FPGA firmware download module)。FPGA就是现场可编辑逻辑门阵列(field-programmable gate array)。它们是可编程集成电路。

Intel Management Engine Interface提供Intel芯片的安全和其他服务。

"ME Enabled Intel Chipsets"可以支持MEI。MEI是"Management Engine Interface"(管理引擎接口)。这个驱动支持有MEI服务的芯片组。

"VMware VMCI Driver"是一种用于客户机和宿主机中继通信的高速虚拟设备。VMCI代表的是"Virtual Machine Communication Interface"(虚拟机通信接口)。

下面， "ATA/ATAPI/MFM/RLL support"可以启用/禁用。MFM (Modified Frequency Modulation)是一种特殊的编码软驱位的方法。然而，这并不工作在所有的软驱上。MFM使用RLL(Run-Length Limited)编码制式。RLL通过有带宽限制的系统通信转换数据。ATAPI是先前提过的"ATA Packet Interface"，同时ATA也在讨论接口标准的时候讨论过。

现在我们将讨论SCSI支持。小型计算机接口(Small Computer System Interface (SCSI))是另外一种SATA的接口标准。USB和火线设备使用SCSI协议。

第一个SCSI设定关于"RAID Transport Class"。这允许RAID使用SCSI标准。

为了使用SCSI目标，启用这个特性(SCSI target support)。

如果系统会运行旧的Linux应用，系统可能需要"legacy /proc/scsi/ support"。这会在/proc/scsi创建SCSI文件。

为了支持SCSI磁盘，启用下一个特性(SCSI disk support)。这是一个通用驱动。

为了支持SCSI磁带，启用这个特性(SCSI tape support)。这是一个通用驱动。SCSI磁带驱动器在像磁带的磁性条上记录数据。

OnStream SCSI磁带需要这个驱动而不是前面提到SCSI通用驱动SCSI OnStream SC-x0 tape support)。

"对于SCSI CDROM support"，一些CD-ROM使用SCSI协议。

下面， 用户可以启用"Enable vendor-specific extensions (for SCSI CDROM)"。

这是一个对于大量不同SCSI设备的通用驱动(SCSI generic support)。这主要用于SCSI扫描仪和其他不被上面提到的SCSI驱动支持的设备或者那些之后会讨论的设备。

一些SCSI点唱机需要这个SCSI驱动(SCSI media changer support)。

Linux内核提供"SCSI Enclosure Support"。SCSI附件是一种管理电源和制冷SCSI设备同时提供不关于数据的服务的设备。

Linux内核应该设置为每个SCSI设备搜索全部的逻辑单元号(Logical Unit Numbers (LUN))(Probe all LUNs on each SCSI device)。LUN是SCSI地址。

这有额外的对于SCSI的错误报告(Verbose SCSI error reporting (kernel size +=12K))。这会明显地增加内核的大小。

这里还有一个SCSI日志系统(SCSI logging facility)。

为了增强你的系统，启用这个特性会允许SCSI在系统启动时就被探测到而不是先启用再探测(Asynchronous SCSI scanning)。大多数系统可以一次执行这两个任务，因此为什么允许这项? 对于那些连接了很多SCSI设备的硬件，这个会明显加快启动速度。

下面，"Parallel SCSI (SPI) Transport Attributes"(传统的并行SCSI)允许每个SCSI设备发送传输信息给sysfs。一些系统需要这个特性。

下面的特性和上面提到的一样，但是发送光纤通道设备的传输信息(FiberChannel Transport Attributes)(光纤通道接口)。光线通道设备使用SCSI。

下面用户可以启用/禁用"SCSI target support for FiberChannel Transport Attributes"(为光纤通道添加"target"模式驱动)。

iSCSI设备和SAS设备的传输数据可以导出到sysfs(iSCSI Transport Attributes)和SAS Transport Attributes)。SAS代表的的是"Serial Attached SCSI"(串行链接SCSI)。

下面，ATA支持被加入libsas(ATA support for libsas (requires libata))。注意配置工具提示需要libata。为了满足这个需求，启用ATA支持。更多情况下，配置工具已经或者将会会你这么做，但是请无论再检查一下。libsas和libata是相应的支持SAS和ATA的库。

下面的特性允许SAS接口接收SMP帧(Support for SMP interpretation for SAS hosts)。这加入了一个SMP解释器到libsas中。然而，这不会增加内核的尺寸。SMP帧允许所有在多CPU系统上的处理器访问SAS设备。

SRP可以发送传输的数据给sysfs(SRP Transport Attributes)。SRP代表SCSI RDMA协议(SCSI RDMA Protocol)。RDMA代表远程直接内存访问(Remote Direct Memory Access)。这意味着SRP是一个用来访问连接到另外一台计算机的SCSI设备的数据的协议。

下一步，用户可以启用"SCSI target support for SRP Transport"。

可以启用底层SCSI驱动(SCSI low-level drivers)。这提供了很多基础驱动。

在这之后，用户可以启用/禁用"PCMCIA SCSI adapter support"。这个适配器允许SCSI设备连接到PC卡上。

这里有一些驱动用于特殊的适配器- (Future Domain PCMCIA support)、(Qlogic PCMCIA support) 、(Symbios 53c500 PCMCIA support)。

多路径安装的设备需要这个特性(SCSI Device Handlers)。这用在每个节点都需要一个到SCSI存储单元的直接路径的集群中。

下一步，"OSD-Initiator library"(OSD启动库)可以启用。这是一个提供了补丁、OSD协议、和针对SCSI设备的T10协议的SCSI驱动。 OSD代表的是基于对象的存储设备(Object-based Storage Device);下一段会讨论得更多。

这个特性生成一个SCSI上层用于测试和管理/dev/osdx设备(OSD Upper Level driver)。exofs使用这个驱动用于挂载基于OSD的文件系统。OSD设备不像其他存储单元一样使用块的存储设备。相反地，OSD设备存储数据在称之为对象的容器里。exofs曾经称作OSDFS。

如果启用了它，OSD特性提供了调试工具(Compile All OSD modules with lots of DEBUG prints)。

如今，我们可以讨论串行ATA和并行ATA特性和驱动了。首先启用/禁用用于调试的第一个特性(Verbose ATA error reporting)。

下一步，用户应该对于ATA设备启用高级配置及电源接口特性(ATA ACPI Support)。这允许内核在SATA设备上更有效地管理电源使用。

内核包含了对于"SATA Zero Power Optical Disc Drive (ZPODD) support"的驱动。这会在不使用时关闭SATA光盘驱动器(SATA optical disc drives (ODD))。这节约了能源以及减少损耗。

贴士：即使你在编译一个高性能的内核，尝试启用所有的电源管理特性。则减少了电源消耗、操作开销、热量产生(热量会降低性能)，以及老化。

SATA端口复用器需要这个驱动(SATA Port Multiplier support)。端口复用器是一个拥有许多端口但是自己仅需插入一个端口的设备。举例来说，如果一个硬件有一个SATA口，但是还需要更多的口，在这个口上插入端口复用器。现在设备可以有许多SATA口了。

下一个驱动用于AHCI SATA(AHCI SATA support)。高级主机控制器接口(Advanced Host Controller Interface (AHCI))是一种SATA总线适配器的操作标准。

对于要在Soc硬件上支持AHCI SATA设备，必须启用这个驱动(Platform AHCI SATA support)。Soc代表片上系统(System-on-a-Chip)。

下面是一些特殊设备的驱动
- Initio 162x SATA support
- ACard AHCI variant (ATP 8620)
- Silicon Image 3124/3132 SATA support

再说一次，等着下一篇精彩的文章。

--------------------------------------------------------------------------------

via: http://www.linux.org/threads/the-linux-kernel-configuring-the-kernel-part-12.4681/

译者：[geekpi](https://github.com/geekpi) 校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

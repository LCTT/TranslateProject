Linux有问必答：如何在虚拟机上配置PCI直通
================================================================================
> **提问**：我想要分配一块物理网卡到用KVM创建的虚拟机上。我打算为这台虚拟机启用网卡的PCI直通。请问，我如何才能在virt-manager里面通过PCI直通增加一个PCI设备到虚拟机上？

如今的hypervisor能够高效地在多个虚拟操作系统间共享和模拟硬件资源。然而，虚拟资源共享不是总能使人满意，甚至在虚拟机性能是重点考量时，或者是虚拟机需要硬件DMA的完全控制时，应该避免共享。一项名叫“PCI直通”的技术可以用在一个虚拟机需要独享PCI设备时（例如：网卡、声卡、显卡）。本质上，PCI直通穿透了虚拟层，直接将PCI设备放到虚拟机里，而其他虚拟机则不能访问该设备。

### 开启“PCI直通”的准备 ###

如果你想要为一台HVM实例开启PCI直通（例如，一台KVM创建的全虚拟化的虚拟机），你的母系统（包括CPU和主板）必须满足以下条件。如果你的虚拟机是半虚拟化的（由Xen创建），你可以跳过这步。

为了在 HVM虚拟机上开启PCI直通，系统需要支持**VT-d** (Intel处理器)或者**AMD-Vi** (AMD处理器)。Intel的VT-D（“英特尔直接I/O虚拟化技术”）是适用于最高端的Nehalem处理器和它的后继者（例如，Westmere、Sandy Bridge的，Ivy Bridge）。注意：VT-d和VT-x是两个独立功能。intel/AMD处理器支持VT-D/AMD-VI功能的列表可以[查看这里][1]。

在确认你的设备支持VT-d/AMD-Vi后，还有两件事情需要做。首先，确保VT-d/AMD-Vi已经在BIOS中开启。然后，在内核启动过程中开启IOMMU。IOMMU服务，是由VT-d/AMD-Vi提供的，可以保护虚拟机访问的主机内存，同时它也是全虚拟化虚拟机支持PCI直通的前提。

Intel处理器中，通过将“**intel_iommu=on**传给内核启动参数来开启IOMMU。参看[这篇教程][2]了解如何通过GRUB修改内核启动参数。

配置完启动参数后，重启电脑。

### 添加PCI设备到虚拟机 ###

我们已经完成了开启PCI直通的准备。事实上，只需通过virt-manager就可以给虚拟机分配一个PCI设备。

打开virt-manager的虚拟机设置，在左边工具栏点击‘增加硬件’按钮。

选择从PCI设备表一个PCI设备来分配，点击“完成”按钮

![](https://farm8.staticflickr.com/7587/17015584385_db49e96372_c.jpg)

最后，启动实例。这样，主机的PCI设备已经可以由虚拟机直接访问了。

### 常见问题 ###

在虚拟机启动时，如果你看见下列任何一个错误，这个错误有可能由于母机VT-d (或 IOMMU)未开启导致。

    Error starting domain: unsupported configuration: host doesn't support passthrough of host PCI devices

----------

    Error starting domain: Unable to read from monitor: Connection reset by peer

请确保"**intel_iommu=on**"启动参数已经按上文叙述开启。

--------------------------------------------------------------------------------

via: http://ask.xmodulo.com/pci-passthrough-virt-manager.html

作者：[Dan Nanni][a]
译者：[Vic020/VicYu](http://vicyu.net)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://ask.xmodulo.com/author/nanni
[1]:http://wiki.xenproject.org/wiki/VTdHowTo
[2]:http://xmodulo.com/add-kernel-boot-parameters-via-grub-linux.html

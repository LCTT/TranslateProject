Linux 有问必答: 如何在红帽系linux中编译Ixgbe驱动
================================================================================
> **提问**：我想要安装最新版的ixgbe 10G网卡驱动。在CentOS, Fedora 或 RHEL中，我应该如何编译ixgbe驱动？

想要在linux使用Intel的PCI Express 10G网卡（例如，82598，82599，x540），需要安装Ixgbe驱动。如今的Linux发行版都会预安装ixgbe的可加载模块，但是预安装的ixgbe驱动不是完整功能版。如果想要开启和定制所有10G网卡的功能（如，RSS、多队列、虚拟化功能、硬件 offload 等），需要从源码编译安装。

本文基于红帽系平台（如，CentOS，RHEL或Fedora）。Debian系平台，请看[这篇文章][1]

### 第一步: 安装依赖 ###

首先，安装必要的开发环境和安装匹配的内核头文件

    $ sudo yum install gcc make
    $ sudo yum install kernel-devel

### 第二步: 编译Ixgbe ###

从[官方页面][2]下载最新Ixgbe源码

    $ wget http://downloads.sourceforge.net/project/e1000/ixgbe%20stable/3.23.2/ixgbe-3.23.2.tar.gz 

请检查支持的内核版本。例如，Ixgbe3.23.2版本支持Linux内核版本2.6.18到3.18.1。

提取压缩包并编译

    $ tar -xvf ixgbe-3.23.2.tar.gz
    $ cd ixgbe-3.23.2/src
    $ make 

如果成功，可以在当前目录找到编译完成的驱动（ixgbe.ko）。

可以运行这个命令来查看编译信息：

    $ modinfo ./ixgbe.ko 

将会输出一个Ixgbe驱动的可用参数列表

![](https://farm9.staticflickr.com/8789/16429483653_b9b6e6cd7f_c.jpg)

### 第三步: 加载 Ixgbe 驱动 ###

这步准备加载已经编译好的驱动。

如果系统已经加载了Ixgbe驱动，首先需要卸载掉老版本。否则，新版本不能加载。

    $ sudo rmmod ixgbe.ko

然后插入编译完成的驱动到内核中：

    $ sudo insmod ./ixgbe.ko

同时，你可以设置启动参数

    $ sudo insmod ./ixgbe.ko FdirPballoc=3 RSS=16

验证驱动是否加载成功，使用dmesg命令，查看其输出

    $ dmesg 

----------

    Intel(R) 10 Gigabit PCI Express Network Driver - version 3.23.2
    Copyright (c) 1999-2014 Intel Corporation.
    ixgbe 0000:21:00.0: PCI INT A -> GSI 64 (level, low) -> IRQ 64
    ixgbe 0000:21:00.0: setting latency timer to 64
    ixgbe: Receive-Side Scaling (RSS) set to 16
    ixgbe: Flow Director packet buffer allocation set to 3
    ixgbe: 0000:21:00.0: ixgbe_check_options: Flow Director will be allocated 256kB of packet buffer
    ixgbe: 0000:21:00.0: ixgbe_check_options: FCoE Offload feature enabled
    ixgbe 0000:21:00.0: irq 87 for MSI/MSI-X
    ixgbe 0000:21:00.0: irq 88 for MSI/MSI-X
    ixgbe 0000:21:00.0: irq 89 for MSI/MSI-X
    ixgbe 0000:21:00.0: irq 90 for MSI/MSI-X
    ixgbe 0000:21:00.0: irq 91 for MSI/MSI-X
    ixgbe 0000:21:00.0: irq 92 for MSI/MSI-X
    ixgbe 0000:21:00.0: irq 93 for MSI/MSI-X
    ixgbe 0000:21:00.0: irq 94 for MSI/MSI-X
    ixgbe 0000:21:00.0: irq 95 for MSI/MSI-X
    ixgbe 0000:21:00.0: irq 96 for MSI/MSI-X
    ixgbe 0000:21:00.0: irq 97 for MSI/MSI-X
    ixgbe 0000:21:00.0: irq 98 for MSI/MSI-X
    ixgbe 0000:21:00.0: irq 99 for MSI/MSI-X
    ixgbe 0000:21:00.0: irq 100 for MSI/MSI-X
    ixgbe 0000:21:00.0: irq 101 for MSI/MSI-X
    ixgbe 0000:21:00.0: irq 102 for MSI/MSI-X
    ixgbe 0000:21:00.0: irq 103 for MSI/MSI-X
    ixgbe 0000:21:00.0: eth3: DCA registration failed: -1
    ixgbe 0000:21:00.0: PCI Express bandwidth of 32GT/s available
    ixgbe 0000:21:00.0: (Speed:5.0GT/s, Width: x8, Encoding Loss:20%)
    ixgbe 0000:21:00.0: eth3: MAC: 2, PHY: 9, SFP+: 3, PBA No: E68793-006
    ixgbe 0000:21:00.0: 90:e2:ba:5b:e9:1c
    ixgbe 0000:21:00.0: eth3: Enabled Features: RxQ: 16 TxQ: 16 FdirHash RSC 
    ixgbe 0000:21:00.0: eth3: Intel(R) 10 Gigabit Network Connection
    ixgbe 0000:21:00.1: PCI INT B -> GSI 68 (level, low) -> IRQ 68
    ixgbe 0000:21:00.1: setting latency timer to 64
    ixgbe: 0000:21:00.1: ixgbe_check_options: FCoE Offload feature enabled
    ixgbe 0000:21:00.0: registered PHC device on eth3
    ixgbe 0000:21:00.1: irq 104 for MSI/MSI-X
    ixgbe 0000:21:00.1: irq 105 for MSI/MSI-X
    ixgbe 0000:21:00.1: irq 106 for MSI/MSI-X
    ixgbe 0000:21:00.1: irq 107 for MSI/MSI-X
    ixgbe 0000:21:00.1: irq 108 for MSI/MSI-X
    ixgbe 0000:21:00.1: irq 109 for MSI/MSI-X
    ixgbe 0000:21:00.1: irq 110 for MSI/MSI-X
    ixgbe 0000:21:00.1: irq 111 for MSI/MSI-X
    ixgbe 0000:21:00.1: irq 112 for MSI/MSI-X
    ixgbe 0000:21:00.1: irq 113 for MSI/MSI-X
    ixgbe 0000:21:00.1: irq 114 for MSI/MSI-X
    ixgbe 0000:21:00.1: irq 115 for MSI/MSI-X
    ixgbe 0000:21:00.1: irq 116 for MSI/MSI-X
    ixgbe 0000:21:00.1: irq 117 for MSI/MSI-X
    ixgbe 0000:21:00.1: irq 118 for MSI/MSI-X
    ixgbe 0000:21:00.1: irq 119 for MSI/MSI-X
    ixgbe 0000:21:00.1: irq 120 for MSI/MSI-X
    ixgbe 0000:21:00.1: irq 121 for MSI/MSI-X
    ixgbe 0000:21:00.1: irq 122 for MSI/MSI-X
    ixgbe 0000:21:00.1: irq 123 for MSI/MSI-X
    ixgbe 0000:21:00.1: irq 124 for MSI/MSI-X
    ixgbe 0000:21:00.1: irq 125 for MSI/MSI-X
    ixgbe 0000:21:00.1: irq 126 for MSI/MSI-X
    ixgbe 0000:21:00.1: irq 127 for MSI/MSI-X
    ixgbe 0000:21:00.1: irq 128 for MSI/MSI-X
    ixgbe 0000:21:00.1: irq 129 for MSI/MSI-X
    ixgbe 0000:21:00.1: irq 130 for MSI/MSI-X
    ixgbe 0000:21:00.1: irq 131 for MSI/MSI-X
    ixgbe 0000:21:00.1: irq 132 for MSI/MSI-X
    ixgbe 0000:21:00.1: irq 133 for MSI/MSI-X
    ixgbe 0000:21:00.1: irq 134 for MSI/MSI-X
    ixgbe 0000:21:00.1: irq 135 for MSI/MSI-X
    ixgbe 0000:21:00.1: irq 136 for MSI/MSI-X
    ixgbe 0000:21:00.1: irq 137 for MSI/MSI-X
    ixgbe 0000:21:00.1: irq 138 for MSI/MSI-X
    ixgbe 0000:21:00.1: irq 139 for MSI/MSI-X
    ixgbe 0000:21:00.1: irq 140 for MSI/MSI-X
    ixgbe 0000:21:00.1: irq 141 for MSI/MSI-X
    ixgbe 0000:21:00.1: irq 142 for MSI/MSI-X
    ixgbe 0000:21:00.1: irq 143 for MSI/MSI-X
    ixgbe 0000:21:00.1: irq 144 for MSI/MSI-X
    ixgbe 0000:21:00.1: irq 145 for MSI/MSI-X
    ixgbe 0000:21:00.1: irq 146 for MSI/MSI-X
    ixgbe 0000:21:00.1: irq 147 for MSI/MSI-X
    ixgbe 0000:21:00.1: irq 148 for MSI/MSI-X
    ixgbe 0000:21:00.1: irq 149 for MSI/MSI-X
    ixgbe 0000:21:00.1: irq 150 for MSI/MSI-X
    ixgbe 0000:21:00.1: irq 151 for MSI/MSI-X
    ixgbe 0000:21:00.1: irq 152 for MSI/MSI-X
    ADDRCONF(NETDEV_UP): eth3: link is not ready
    8021q: adding VLAN 0 to HW filter on device eth3
    ixgbe 0000:21:00.1: eth4: DCA registration failed: -1
    ixgbe 0000:21:00.1: PCI Express bandwidth of 32GT/s available
    ixgbe 0000:21:00.1: (Speed:5.0GT/s, Width: x8, Encoding Loss:20%)
    ixgbe 0000:21:00.1: eth4: MAC: 2, PHY: 9, SFP+: 4, PBA No: E68793-006
    ixgbe 0000:21:00.1: 90:e2:ba:5b:e9:1e
    ixgbe 0000:21:00.1: eth4: Enabled Features: RxQ: 48 TxQ: 48 FdirHash RSC 
    ixgbe 0000:21:00.1: eth4: Intel(R) 10 Gigabit Network Connection
    ixgbe 0000:21:00.0: eth3: detected SFP+: 3
    ixgbe 0000:21:00.1: registered PHC device on eth4
    ADDRCONF(NETDEV_UP): eth4: link is not ready
    8021q: adding VLAN 0 to HW filter on device eth4
    ixgbe 0000:21:00.1: eth4: detected SFP+: 4
    ixgbe 0000:21:00.0: eth3: NIC Link is Up 10 Gbps, Flow Control: RX/TX
    ADDRCONF(NETDEV_CHANGE): eth3: link becomes ready
    ixgbe 0000:21:00.1: eth4: NIC Link is Up 10 Gbps, Flow Control: RX/TX
    ADDRCONF(NETDEV_CHANGE): eth4: link becomes ready
    eth3: no IPv6 routers present
    eth4: no IPv6 routers present

### 第四步: 安装Ixgbe驱动 ###

当确认驱动已经加载后，就可以安装驱动到系统中了

    $ sudo make install

ixgbe.ko将会安装在下列目录

    /lib/modules/<kernel-version>/kernel/drivers/net/ixgbe

此时，编译好的驱动将在启动时自动加载，也可以通过运行命令加载它：

    $ sudo modprobe ixgbe 

![](https://farm9.staticflickr.com/8760/16863416809_804dea1491_c.jpg)

--------------------------------------------------------------------------------

via: http://ask.xmodulo.com/compile-ixgbe-driver-centos-rhel-fedora.html

作者：[Dan Nanni][a]
译者：[Vic020](http://vicyu.net)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://ask.xmodulo.com/author/nanni
[1]:https://linux.cn/article-5149-1.html
[2]:http://sourceforge.net/projects/e1000/files/ixgbe%20stable/

如何在Ubuntu上找出可用的网络适配器
================================================================================
想知道**在Linux中你正在使用的网卡是什么吗？** 在Linux中很容易就找出网卡的生产商。打开一个终端并输入下面的额命令：

    sudo lshw -C network

如果上面的命令不能在sudo下使用，那就别用 sudo 的特权模式。它的输出看上去有点奇怪但是很有用。

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2014/12/Network_Adapter_Linux.jpeg)

> *-network
> 
> description: Wireless interface
> 
> product: BCM4360 802.11ac Wireless Network Adapter
> 
> vendor: Broadcom Corporation
> 
> physical id: 0
> 
> bus info: pci@0000:03:00.0
> 
> logical name: wlan0
> 
> version: 03
> 
> serial: 9c:f3:87:c1:5d:6a
> 
> width: 64 bits
> 
> clock: 33MHz
> 
> capabilities: bus_master cap_list ethernet physical wireless
> 
> configuration: broadcast=yes driver=wl0 driverversion=6.30.223.248 (r487574) ip=192.168.1.23 latency=0 multicast=yes wireless=IEEE 802.11abg
> 
> resources: irq:18 memory:b0600000-b0607fff memory:b0400000-b05fffff

如你所见，我Macbook Air上的无线网卡是BCM4360，这是一款在Ubuntu下面很容易出现无法检测无线网络问题的网卡。

[lshw][1] 命令实际上死用来列出硬件的，因此命令的名字是lshw。带上网络的选项后，就会只过滤出网络硬件了。

### 了解网卡的其他方法 ###

另外你还可以使用lspci命令来显示PCI总线上的信息。你不应该用特权模式来运行这个命令。只需要在命令行下输入：

    lspci

命令的输出看上去想这样：

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2014/12/Network_Adapter_Linux_1.jpeg)

> 00:00.0 Host bridge: Intel Corporation Haswell-ULT DRAM Controller (rev 09)
> 
> 00:02.0 VGA compatible controller: Intel Corporation Haswell-ULT Integrated Graphics Controller (rev 09)
> 
> 00:03.0 Audio device: Intel Corporation Haswell-ULT HD Audio Controller (rev 09)
> 
> 00:14.0 USB controller: Intel Corporation 8 Series USB xHCI HC (rev 04)
> 
> 00:16.0 Communication controller: Intel Corporation 8 Series HECI #0 (rev 04)
> 
> 00:1b.0 Audio device: Intel Corporation 8 Series HD Audio Controller (rev 04)
> 
> 00:1c.0 PCI bridge: Intel Corporation 8 Series PCI Express Root Port 1 (rev e4)
> 
> 00:1c.1 PCI bridge: Intel Corporation 8 Series PCI Express Root Port 2 (rev e4)
> 
> 00:1c.2 PCI bridge: Intel Corporation 8 Series PCI Express Root Port 3 (rev e4)
> 
> 00:1c.4 PCI bridge: Intel Corporation 8 Series PCI Express Root Port 5 (rev e4)
> 
> 00:1c.5 PCI bridge: Intel Corporation 8 Series PCI Express Root Port 6 (rev e4)
> 
> 00:1f.0 ISA bridge: Intel Corporation 8 Series LPC Controller (rev 04)
> 
> 00:1f.3 SMBus: Intel Corporation 8 Series SMBus Controller (rev 04)
> 
> 02:00.0 Multimedia controller: Broadcom Corporation Device 1570
> 
> 03:00.0 Network controller: Broadcom Corporation BCM4360 802.11ac Wireless Network Adapter (rev 03)
> 
> 04:00.0 SATA controller: Marvell Technology Group Ltd. 88SS9183 PCIe SSD Controller (rev 14)

这些命令会同时列出有线和无线的网卡。你应该注意到上面的输出中显示我的系统中没有有线网卡。因为我使用的是Macbook Air，它没有以太网端口

我希望这边文章可以帮助你找到你系统中的网卡。欢迎提出问题和建议。

--------------------------------------------------------------------------------

via: http://itsfoss.com/find-network-adapter-ubuntu-linux/

作者：[Abhishek][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://itsfoss.com/author/Abhishek/
[1]:http://linux.die.net/man/1/lshw
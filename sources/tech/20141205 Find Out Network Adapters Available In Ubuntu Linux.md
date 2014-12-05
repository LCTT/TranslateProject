Find Out Network Adapters Available In Ubuntu Linux
================================================================================
Wondering **which network adapters you are using in Ubuntu or any other Linux OS**? It is very easy to to find out the manufacturer of the network adapters in your computer in Linux. Open a terminal and use the following command:

    sudo lshw -C network

If the above command doesn’t work with sudo, remove the super user privileges. Weird but helps. The output of the command reads like this:

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

As you can see, the wireless network adapter in my Macbook Air is BCM4360, a troublesome wireless adapter because of which often Ubuntu does not detect wireless networks.

[lshw][1] command actually used to list hardware and hence the command is named lshw. With the option network, it filters the result for networking hardware only.

### Alternate method to know the network adapter ###

Alternatively, you can use lspci command that displays the information about PCI buses in the system. You should not need super user privileges to use this command. Just type the command in terminal:

    lspci

The output of the command reads as:

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

These command gives you information about both wired and wireless network adapters. You might have noticed that there is no wired network adapter for my system in the output above. The reason is that I am using a Macbook Air and it does not have an Ethernet port.

I hope this quick post helped you to find the network adapters in your Linux system. Any questions or suggestions are always welcomed.

--------------------------------------------------------------------------------

via: http://itsfoss.com/find-network-adapter-ubuntu-linux/

作者：[Abhishek][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://itsfoss.com/author/Abhishek/
[1]:http://linux.die.net/man/1/lshw
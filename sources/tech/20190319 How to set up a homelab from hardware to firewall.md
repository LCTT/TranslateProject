[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to set up a homelab from hardware to firewall)
[#]: via: (https://opensource.com/article/19/3/home-lab)
[#]: author: (Michael Zamot  https://opensource.com/users/mzamot)

How to set up a homelab from hardware to firewall
======

Take a look at hardware and software options for building your own homelab.

![][1]

Do you want to create a homelab? Maybe you want to experiment with different technologies, create development environments, or have your own private cloud. There are many reasons to have a homelab, and this guide aims to make it easier to get started.

There are three categories to consider when planning a home lab: hardware, software, and maintenance. We'll look at the first two categories here and save maintaining your computer lab for a future article.

### Hardware

When thinking about your hardware needs, first consider how you plan to use your lab as well as your budget, noise, space, and power usage.

If buying new hardware is too expensive, search local universities, ads, and websites like eBay or Craigslist for recycled servers. They are usually inexpensive, and server-grade hardware is built to last many years. You'll need three types of hardware: a virtualization server, storage, and a router/firewall.

#### Virtualization servers

A virtualization server allows you to run several virtual machines that share the physical box's resources while maximizing and isolating resources. If you break one virtual machine, you won't have to rebuild the entire server, just the virtual one. If you want to do a test or try something without the risk of breaking your entire system, just spin up a new virtual machine and you're ready to go.

The two most important factors to consider in a virtualization server are the number and speed of its CPU cores and its memory. If there are not enough resources to share among all the virtual machines, they'll be overallocated and try to steal each other's CPU cycles and memory.

So, consider a CPU platform with multiple cores. You want to ensure the CPU supports virtualization instructions (VT-x for Intel and AMD-V for AMD). Examples of good consumer-grade processors that can handle virtualization are Intel i5 or i7 and AMD Ryzen. If you are considering server-grade hardware, the Xeon class for Intel and EPYC for AMD are good options. Memory can be expensive, especially the latest DDR4 SDRAM. When estimating memory requirements, factor at least 2GB for the host operating system's memory consumption.

If your electricity bill or noise is a concern, solutions like Intel's NUC devices provide a small form factor, low power usage, and reduced noise, but at the expense of expandability.

#### Network-attached storage (NAS)

If you want a machine loaded with hard drives to store all your personal data, movies, pictures, etc. and provide storage for the virtualization server, network-attached storage (NAS) is what you want.

In most cases, you won't need a powerful CPU; in fact, many commercial NAS solutions use low-powered ARM CPUs. A motherboard that supports multiple SATA disks is a must. If your motherboard doesn't have enough ports, use a host bus adapter (HBA) SAS controller to add extras.

Network performance is critical for a NAS, so select a gigabit network interface (or better).

Memory requirements will differ based on your filesystem. ZFS is one of the most popular filesystems for NAS, and you'll need more memory to use features such as caching or deduplication. Error-correcting code (ECC) memory is your best bet to protect data from corruption (but make sure your motherboard supports it before you buy). Last, but not least, don't forget an uninterruptible power supply (UPS), because losing power can cause data corruption.

#### Firewall and router

Have you ever realized that a cheap router/firewall is usually the main thing protecting your home network from the exterior world? These routers rarely receive timely security updates, if they receive any at all. Scared now? Well, [you should be][2]!

You usually don't need a powerful CPU or a great deal of memory to build your own router/firewall, unless you are handling a huge throughput or want to do CPU-intensive tasks, like a VPN server or traffic filtering. In such cases, you'll need a multicore CPU with AES-NI support.

You may want to get at least two 1-gigabit or better Ethernet network interface cards (NICs), also, not needed, but recommended, a managed switch to connect your DIY-router to create VLANs to further isolate and secure your network.

![Home computer lab PfSense][4]

### Software

After you've selected your virtualization server, NAS, and firewall/router, the next step is exploring the different operating systems and software to maximize their benefits. While you could use a regular Linux distribution like CentOS, Debian, or Ubuntu, they usually take more time to configure and administer than the following options.

#### Virtualization software

**[KVM][5]** (Kernel-based Virtual Machine) lets you turn Linux into a hypervisor so you can run multiple virtual machines in the same box. The best thing is that KVM is part of Linux, and it is the go-to option for many enterprises and home users. If you are comfortable, you can install **[libvirt][6]** and **[virt-manager][7]** to manage your virtualization platform.

**[Proxmox VE][8]** is a robust, enterprise-grade solution and a full open source virtualization and container platform. It is based on Debian and uses KVM as its hypervisor and LXC for containers. Proxmox offers a powerful web interface, an API, and can scale out to many clustered nodes, which is helpful because you'll never know when you'll run out of capacity in your lab.

**[oVirt][9] (RHV)** is another enterprise-grade solution that uses KVM as the hypervisor. Just because it's enterprise doesn't mean you can't use it at home. oVirt offers a powerful web interface and an API and can handle hundreds of nodes (if you are running that many servers, I don't want to be your neighbor!). The potential problem with oVirt for a home lab is that it requires a minimum set of nodes: You'll need one external storage, such as a NAS, and at least two additional virtualization nodes (you can run it just on one, but you'll run into problems in maintenance of your environment).

#### NAS software

**[FreeNAS][10]** is the most popular open source NAS distribution, and it's based on the rock-solid FreeBSD operating system. One of its most robust features is its use of the ZFS filesystem, which provides data-integrity checking, snapshots, replication, and multiple levels of redundancy (mirroring, striped mirrors, and striping). On top of that, everything is managed from the powerful and easy-to-use web interface. Before installing FreeNAS, check its hardware support, as it is not as wide as Linux-based distributions.

Another popular alternative is the Linux-based **[OpenMediaVault][11]**. One of its main features is its modularity, with plugins that extend and add features. Among its included features are a web-based administration interface; protocols like CIFS, SFTP, NFS, iSCSI; and volume management, including software RAID, quotas, access control lists (ACLs), and share management. Because it is Linux-based, it has extensive hardware support.

#### Firewall/router software

**[pfSense][12]** is an open source, enterprise-grade FreeBSD-based router and firewall distribution. It can be installed directly on a server or even inside a virtual machine (to manage your virtual or physical networks and save space). It has many features and can be expanded using packages. It is managed entirely using the web interface, although it also has command-line access. It has all the features you would expect from a router and firewall, like DHCP and DNS, as well as more advanced features, such as intrusion detection (IDS) and intrusion prevention (IPS) systems. You can create multiple networks listening on different interfaces or using VLANs, and you can create a secure VPN server with a few clicks. pfSense uses pf, a stateful packet filter that was developed for the OpenBSD operating system using a syntax similar to IPFilter. Many companies and organizations use pfSense.

* * *

With all this information in mind, it's time for you to get your hands dirty and start building your lab. In a future article, I will get into the third category of running a home lab: using automation to deploy and maintain it.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/3/home-lab

作者：[Michael Zamot (Red Hat)][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/mzamot
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/computer_keyboard_laptop_development_code_woman.png?itok=vbYz6jjb
[2]: https://opensource.com/article/18/5/how-insecure-your-router
[3]: /file/427426
[4]: https://opensource.com/sites/default/files/uploads/pfsense2.png (Home computer lab PfSense)
[5]: https://www.linux-kvm.org/page/Main_Page
[6]: https://libvirt.org/
[7]: https://virt-manager.org/
[8]: https://www.proxmox.com/en/proxmox-ve
[9]: https://ovirt.org/
[10]: https://freenas.org/
[11]: https://www.openmediavault.org/
[12]: https://www.pfsense.org/

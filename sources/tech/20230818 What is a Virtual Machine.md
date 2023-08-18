[#]: subject: "What is a Virtual Machine?"
[#]: via: "https://itsfoss.com/virtual-machine/"
[#]: author: "Ankush Das https://itsfoss.com/author/ankush/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

What is a Virtual Machine?
======

**A virtual machine (VM) is an emulated version of a physical computer that mimics the functions and allocates the resources in a virtual environment.**

Simply put, you have another operating system running as a regular application like a media player or web browser in your current operating system.

![Windows 10 running in VirtualBox inside Manjaro Linux][1]

You can do the same things in a VM compared to a bare metal machine (a real computer like your laptop or PC). For instance, connecting to a network, downloading software, updating the operating system, and more.

Of course, depending on the use case, the experience will be different from a physical computer.

Let us explore virtual machines, their use-cases, and how they work.

### Virtual Machines: The Origins

![][2]

Virtual Machine is one of the most significant software-based innovation. It has its roots as early as **1966** with **IBM CP-40 and CP-67** virtual machine operating systems, where the concept of virtual memory and resources was researched/tested.

Fast forward to 2023, when we publish this article, VMs are everywhere, from personal computers to enterprises and small businesses. Everyone uses a VM in one form or the other.

Considering all of that, it is evident that Virtual Machines (VMs) are immensely useful. But how does it work, and what exactly do we use it for?

💡

Bare Metal = The actual physical computer like your PC or laptop
Host OS = The operating system on your actual computer
Guest OS = The operating system running inside VM
VM = Virtual Machine, the generic term for the virtualization application

### Here's How Virtual Machines Work

![][3]

The concept of virtualization should help you clarify how virtual machines work.

To give you a quick reminder from one of our articles:

" _Virtualization provides an abstract concept of computer hardware to help you create virtual machines (VMs), networks, storage, and more._ "

**Virtualization** lets a user utilize physical system resources in a virtual environment. This enables a process to use the resources separately without tampering with the physical computer.

And **Virtual Machine is the process** that uses this ability, where you get virtual resources in the form of a virtual disk, RAM, and other configuration files to allow you to run an operating system on top of it.

You might already know some [virtualization software for Linux][4] that help you create these virtual machines.

**Suggested Read 📖**

![][5]

To give you a technical difference between a virtual machine and a physical computer, here's a diagram to help you learn:

![][6]

### Why Do We Use Virtual Machines?

Virtual Machines have become a versatile concept that comes in handy for almost every little thing—one of the reasons why you should [run Linux in virtual machines][7].

Not just for individual users, but it is also a key highlight in cloud computing, which is a massive part of the internet.

![][8]

Some of the tasks that VMs help achieve include:

  * Software testing
  * Operating system testing
  * Enhancing your online privacy for temporary web browsing sessions
  * Cybersecurity research without tampering physical computer
  * Using VMs as servers to host more VMs (thereby making efficient use of hardware resources) on the same hardware
  * All kinds of development activity with great flexibility of migration, cloning, etc.
  * Replicating systems in the cloud using VMs



So, the virtual machine's isolation capability helps us use it for testing and development and use it as the core for server scalability and flexibility.

**Suggested Read 📖**

![][5]

No matter whether you are a student, professional, or an enterprise, you will find the use of a virtual machine handy at one point of time.

### Do Virtual Machines Consume System Resources?

When you create a virtual machine to run another operating system in it, you allocate some system resources to it. They are primarily:

  * CPU: Consumed only when the operating system is running in the VM
  * RAM: Consumed only when the operating system is running in the VM
  * Disk space: Reserved when you create the VM. Occupied irrespective of whether the VM is running or not.



A few people think the CPU and RAM will be utilized all the time. That's not true. RAM and CPUs are consumed only when the VM is running an operating system.

However, disk space is always reserved even when the VMs are not running.

### Types of Virtualization That Make it All Possible

If you are curious about the virtualization concept responsible for helping create a virtual machine, let me highlight all the different types of it and briefly explain it.

A hypervisor manages the hardware while separating the system resources from the virtual environment. It is technically labeled as a " **Virtual Machine Monitor (VMM)** "

And the hypervisor is the **software responsible for letting** An excellent **you create and run virtual machines.**

There are two types of hypervisors including:

  * **Type 1 hypervisor** : This is directly connected to the physical machine for managing resources for the VM. An excellent example for it is [KVM][9], which comes baked with Linux.
  * **Type 2 hypervisor:** This exists on top of an operating system as an application that lets you manage VM resources and more—for instance, [VirtualBox][10].



While the hypervisor makes virtualization possible, the types of virtualization available make your experience hassle-free facilitating the features you get with a VM.

Some of the relevant types include:

  * **Storage virtualization** : This helps creating a virtual disk by splitting the available disk space to small chunks reserved to be used by a virtual machine.
  * **Network virtualization** allows the physical network connection to be routed through virtual networks (or adapters) to the virtual machines.
  * **Desktop virtualization** : **** With this, you can deploy multiple virtual desktop environments to multiple physical machines at the same time. Configuration and management of all the virtual desktops is possible from a central point.



To explore all the technical details, I recommend checking out [AWS's documentation on virtualization][11].

### Advantages of Virtual Machines

![][12]

While their use cases already give you an idea of the benefits they give you, let me add some pointers for you to know better:

  * Virtual Machines let you use the hardware resources fully without tampering with the host.
  * With VMs, you get the freedom to test or break whatever you want. Whether it is a super old application or a risky software, you can rely on the VM to do it all without affecting your host.
  * You can run multiple operating systems from a single place without needing the hassle of dual-boot or adding extra physical drives to use other operating systems. Thereby saving you cost, time, and management trouble.
  * With VMs, you can clone your configurations quickly without needing additional hardware.



### Disadvantages of Virtual Machines

![][13]

Considering VMs are helpful in many scenarios, how can they be harmful?

Well, not precisely drawbacks to using them, but you need to be cautious about some of the things they can do:

  * Even though virtual machines are known to use resources efficiently, they can still overwhelm the system resources if you do not monitor them or run multiple VMs without thinking about it.
  * Virtual Machines can never replace bare metal experience and performance. No matter how mighty the host is, VMs run slower than you would expect with a physical computer.
  * Virtual Machines are isolated from the host, but you must be careful about file sharing that might expose malware to your host system.



### Virtual Machines Are Super Useful

The concept of VMs made a lot of things happen.

What do you think would have happened to the cloud computing industry? How inconvenient would it be to always re-install operating systems to try a different one?

💬 _In one form or the other, every computer user or server user does need it. What are your thoughts on a virtual machine? How would you define it?_

--------------------------------------------------------------------------------

via: https://itsfoss.com/virtual-machine/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/content/images/2023/08/windows-without-menu.png
[2]: https://itsfoss.com/content/images/2023/06/origin.png
[3]: https://itsfoss.com/content/images/2023/06/vm.png
[4]: https://itsfoss.com/virtualization-software-linux/
[5]: https://itsfoss.com/content/images/size/w256h256/2022/12/android-chrome-192x192.png
[6]: https://itsfoss.com/content/images/2023/06/vm-vs-physical-computer.png
[7]: https://itsfoss.com/why-linux-virtual-machine/
[8]: https://itsfoss.com/content/images/2023/06/why-we-use-vm.png
[9]: https://www.linux-kvm.org/page/Main_Page?ref=itsfoss.com
[10]: https://www.virtualbox.org/?ref=itsfoss.com
[11]: https://aws.amazon.com/what-is/virtualization/?ref=itsfoss.com
[12]: https://itsfoss.com/content/images/2023/08/advantage.png
[13]: https://itsfoss.com/content/images/2023/08/disadvantage.png

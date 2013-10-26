Translating----------geekpi

01 The Linux Kernel: Introduction
================================================================================
In 1991, a Finnish student named Linus Benedict Torvalds made the kernel of a now popular operating system. He released Linux version 0.01 on September 1991, and on February 1992, he licensed the kernel under the GPL license. The GNU General Public License (GPL) allows people to use, own, modify, and distribute the source code legally and free of charge. This permits the kernel to become very popular because anyone may download it for free. Now that anyone can make their own kernel, it may be helpful to know how to obtain, edit, configure, compile, and install the Linux kernel.

A kernel is the core of an operating system. The operating system is all of the programs that manages the hardware and allows users to run applications on a computer. The kernel controls the hardware and applications. Applications do not communicate with the hardware directly, instead they go to the kernel. In summary, software runs on the kernel and the kernel operates the hardware. Without a kernel, a computer is a useless object.

There are many reasons for a user to want to make their own kernel. Many users may want to make a kernel that only contains the code needed to run on their system. For instance, my kernel contains drivers for FireWire devices, but my computer lacks these ports. When the system boots up, time and RAM space is wasted on drivers for devices that my system does not have installed. If I wanted to streamline my kernel, I could make my own kernel that does not have FireWire drivers. As for another reason, a user may own a device with a special piece of hardware, but the kernel that came with their latest version of Ubuntu lacks the needed driver. This user could download the latest kernel (which is a few versions ahead of Ubuntu's Linux kernels) and make their own kernel that has the needed driver. However, these are two of the most common reasons for users wanting to make their own Linux kernels.

Before we download a kernel, we should discuss some important definitions and facts. The Linux kernel is a monolithic kernel. This means that the whole operating system is on the RAM reserved as kernel space. To clarify, the kernel is put on the RAM. The space used by the kernel is reserved for the kernel. Only the kernel may use the reserved kernel space. The kernel owns that space on the RAM until the system is shutdown. In contrast to kernel space, there is user space. User space is the space on the RAM that the user's programs own. Applications like web browsers, video games, word processors, media players, the wallpaper, themes, etc. are all on the user space of the RAM. When an application is closed, any program may use the newly freed space. With kernel space, once the RAM space is taken, nothing else can have that space.

The Linux kernel is also a preemptive multitasking kernel. This means that the kernel will pause some tasks to ensure that every application gets a chance to use the CPU. For instance, if an application is running but is waiting for some data, the kernel will put that application on hold and allow another program to use the newly freed CPU resources until the data arrives. Otherwise, the system would be wasting resources for tasks that are waiting for data or another program to execute. The kernel will force programs to wait for the CPU or stop using the CPU. Applications cannot unpause or use the CPU without the kernel allowing them to do so.

The Linux kernel makes devices appear as files in the folder /dev. USB ports, for instance, are located in /dev/bus/usb. The hard-drive partitions are seen in /dev/disk/by-label. It is because of this feature that many people say "On Linux, everything is a file.". If a user wanted to access data on their memory card, for example, they cannot access the data through these device files.

The Linux kernel is portable. Portability is one of the best features that makes Linux popular. Portability is the ability for the kernel to work on a wide variety of processors and systems. Some of the processor types that the kernel supports include Alpha, AMD, ARM, C6X, Intel, x86, Microblaze, MIPS, PowerPC, SPARC, UltraSPARC, etc. This is not a complete list.

In the boot folder (/boot), users will see a "vmlinux" or a "vmlinuz" file. Both are compiled Linux kernels. The one that ends in a "z" is compressed. The "vm" stands for virtual memory. On systems with SPARC processors, users will see a zImage file instead. A small number of users may find a bzImage file; this is also a compressed Linux kernel. No matter which one a user owns, they are all bootable files that should not be changed unless the user knows what they are doing. Otherwise, their system can be made unbootable - the system will not turn on.

Source code is the coding of the program. With source code, programmers can make changes to the kernel and see how the kernel works.

### Downloading the Kernel: ###

Now, that we understand more about the kernel, it is time to download the source code. Go to [kernel.org][1] and click the large download button. Once the download is finished, uncompress the downloaded file.

For this article, I am using the source code for Linux kernel 3.9.4. All of the instructions in this article series are the same (or nearly the same) for all versions of the kernel.

--------------------------------------------------------------------------------

via: http://www.linux.org/threads/%EF%BB%BFthe-linux-kernel-introduction.4203/

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:https://www.kernel.org/

Translating by qhwdw
Custom Embedded Linux Distributions
======
### Why Go Custom?

In the past, many embedded projects used off-the-shelf distributions and stripped them down to bare essentials for a number of reasons. First, removing unused packages reduced storage requirements. Embedded systems are typically shy of large amounts of storage at boot time, and the storage available, in non-volatile memory, can require copying large amounts of the OS to memory to run. Second, removing unused packages reduced possible attack vectors. There is no sense hanging on to potentially vulnerable packages if you don't need them. Finally, removing unused packages reduced distribution management overhead. Having dependencies between packages means keeping them in sync if any one package requires an update from the upstream distribution. That can be a validation nightmare.

Yet, starting with an existing distribution and removing packages isn't as easy as it sounds. Removing one package might break dependencies held by a variety of other packages, and dependencies can change in the upstream distribution management. Additionally, some packages simply cannot be removed without great pain due to their integrated nature within the boot or runtime process. All of this takes control of the platform outside the project and can lead to unexpected delays in development.

A popular alternative is to build a custom distribution using build tools available from an upstream distribution provider. Both Gentoo and Debian provide options for this type of bottom-up build. The most popular of these is probably the Debian debootstrap utility. It retrieves prebuilt core components and allows users to cherry-pick the packages of interest in building their platforms. But, debootstrap originally was only for x86 platforms. Although there are ARM (and possibly other) options now, debootstrap and Gentoo's catalyst still take dependency management away from the local project.

Some people will argue that letting someone else manage the platform software (like Android) is much easier than doing it yourself. But, those distributions are general-purpose, and when you're sitting on a lightweight, resource-limited IoT device, you may think twice about any any advantage that is taken out of your hands.

### System Bring-Up Primer

A custom Linux distribution requires a number of software components. The first is the toolchain. A toolchain is a collection of tools for compiling software, including (but not limited to) a compiler, linker, binary manipulation tools and standard C library. Toolchains are built specifically for a target hardware device. A toolchain built on an x86 system that is intended for use with a Raspberry Pi is called a cross-toolchain. When working with small embedded devices with limited memory and storage, it's always best to use a cross-toolchain. Note that even applications written for a specific purpose in a scripted language like JavaScript will need to run on a software platform that needs to be compiled with a cross-toolchain.

![](http://www.linuxjournal.com/files/linuxjournal.com/ufiles/imagecache/large-550px-centered/u1000009/12278f1.png)

Figure 1\. Compile Dependencies and Boot Order

The cross-toolchain is used to build software components for the target hardware. The first component needed is a bootloader. When power is applied to a board, the processor (depending on design) attempts to jump to a specific memory location to start running software. That memory location is where a bootloader is stored. Hardware can have a built-in bootloader that can be run directly from its storage location or it may be copied into memory first before it is run. There also can be multiple bootloaders. A first-stage bootloader would reside on the hardware in NAND or NOR flash, for example. Its sole purpose would be to set up the hardware so a second-stage bootloader, such as one stored on an SD card, can be loaded and run.

Bootloaders have enough knowledge to get the hardware to the point where it can load Linux into memory and jump to it, effectively handing control over to Linux. Linux is an operating system. This means that, by design, it doesn't actually do anything other than monitor the hardware and provide services to higher layer software—aka applications. The [Linux kernel][1] often is accompanied by a variety of firmware blobs. These are software objects that have been precompiled, often containing proprietary IP (intellectual property) for devices used with the hardware platform. When building a custom distribution, it may be necessary to acquire any firmware blobs not provided by the Linux kernel source tree before beginning compilation of the kernel.

Applications are stored in the root filesystem. The root filesystem is constructed by compiling and collecting a variety of software libraries, tools, scripts and configuration files. Collectively, these all provide the services, such as network configuration and USB device mounting, required by applications the project will run.

In summary, a complete system build requires the following components:

1.  A cross-toolchain.

2.  One or more bootloaders.

3.  The Linux kernel and associated firmware blobs.

4.  A root filesystem populated with libraries, tools and utilities.

5.  Custom applications.

### Start with the Right Tools

The components of the cross-toolchain can be built manually, but it's a complex process. Fortunately, tools exist that make this process easier. The best of them is probably [Crosstool-NG][2]. This project utilizes the same kconfig menu system used by the Linux kernel to configure the bits and pieces of the toolchain. The key to using this tool is finding the correct configuration items for the target platform. This typically includes the following items:

1.  The target architecture, such as ARM or x86.

2.  Endianness: little (typically Intel) or big (typically ARM or others).

3.  CPU type as it's known to the compiler, such as GCC's use of either -mcpu or --with-cpu.

4.  The floating point type supported, if any, by the CPU, such as GCC's use of either -mfpu or --with-fpu.

5.  Specific version information for the binutils package, the C library and the C compiler.

![](http://www.linuxjournal.com/files/linuxjournal.com/ufiles/imagecache/large-550px-centered/u1000009/12278f2.png)

Figure 2. Crosstool-NG Configuration Menu

The first four are typically available from the processor maker's documentation. It can be hard to find these for relatively new processors, but for the Raspberry Pi or BeagleBoards (and their offspring and off-shoots), you can find the information online at places like the [Embedded Linux Wiki][3].

The versions of the binutils, C library and C compiler are what will separate the toolchain from any others that might be provided from third parties. First, there are multiple providers of each of these things. Linaro provides bleeding-edge versions for newer processor types, while working to merge support into upstream projects like the GNU C Library. Although you can use a variety of providers, you may want to stick to the stock GNU toolchain or the Linaro versions of the same.

Another important selection in Crosstool-NG is the version of the Linux kernel. This selection gets headers for use with various toolchain components, but it is does not have to be the same as the Linux kernel you will boot on the target hardware. It's important to choose a kernel that is not newer than the target hardware's kernel. When possible, pick a long-term support kernel that is older than the kernel that will be used on the target hardware.

For most developers new to custom distribution builds, the toolchain build is the most complex process. Fortunately, binary toolchains are available for many target hardware platforms. If building a custom toolchain becomes problematic, search online at places like the [Embedded Linux Wiki][4] for links to prebuilt toolchains.

### Booting Options

The next component to focus on after the toolchain is the bootloader. A bootloader sets up hardware so it can be used by ever more complex software. A first-stage bootloader is often provided by the target platform maker, burned into on-hardware storage like an EEPROM or NOR flash. The first-stage bootloader will make it possible to boot from, for example, an SD card. The Raspberry Pi has such a bootloader, which makes creating a custom bootloader unnecessary.

Despite that, many projects add a secondary bootloader to perform a variety of tasks. One such task could be to provide a splash animation without using the Linux kernel or userspace tools like plymouth. A more common secondary bootloader task is to make network-based boot or PCI-connected disks available. In those cases, a tertiary bootloader, such as GRUB, may be necessary to get the system running.

Most important, bootloaders load the Linux kernel and start it running. If the first-stage bootloader doesn't provide a mechanism for passing kernel arguments at boot time, a second-stage bootloader may be necessary.

A number of open-source bootloaders are available. The [U-Boot project][5] often is used for ARM platforms like the Raspberry Pi. CoreBoot typically is used for x86 platform like the Chromebook. Bootloaders can be very specific to target hardware. The choice of bootloader will depend on overall project requirements and target hardware (search for lists of open-source bootloaders be online).

### Now Bring the Penguin

The bootloader will load the Linux kernel into memory and start it running. Linux is like an extended bootloader: it continues hardware setup and prepares to load higher-level software. The core of the kernel will set up and prepare memory for sharing between applications and hardware, prepare task management to allow multiple applications to run at the same time, initialize hardware components that were not configured by the bootloader or were configured incompletely and begin interfaces for human interaction. The kernel may not be configured to do this on its own, however. It may include an embedded lightweight filesystem, known as the initramfs or initrd, that can be created separately from the kernel to assist in hardware setup.

Another thing the kernel handles is downloading binary blobs, known generically as firmware, to hardware devices. Firmware is pre-compiled object files in formats specific to a particular device that is used to initialize hardware in places that the bootloader and kernel cannot access. Many such firmware objects are available from the Linux kernel source repositories, but many others are available only from specific hardware vendors. Examples of devices that often provide their own firmware include digital TV tuners or WiFi network cards.

Firmware may be loaded from the initramfs or may be loaded after the kernel starts the init process from the root filesystem. However, creating the kernel often will be the process where obtaining firmware will occur when creating a custom Linux distribution.

### Lightweight Core Platforms

The last thing the Linux kernel does is to attempt to run a specific program called the init process. This can be named init or linuxrc or the name of the program can be passed to the kernel by the bootloader. The init process is stored in a file system that the kernel can access. In the case of the initramfs, the file system is stored in memory (either by the kernel itself or by the bootloader placing it there). But the initramfs is not typically complete enough to run more complex applications. So another file system, known as the root file system, is required.

![](http://www.linuxjournal.com/files/linuxjournal.com/ufiles/imagecache/large-550px-centered/u1000009/12278f3.png)

Figure 3\. Buildroot Configuration Menu

The initramfs filesystem can be built using the Linux kernel itself, but more commonly, it is created using a project called [BusyBox][6]. BusyBox combines a collection of GNU utilities, such as grep or awk, into a single binary in order to reduce the size of the filesystem itself. BusyBox often is used to jump-start the root filesystem's creation.

But, BusyBox is purposely lightweight. It isn't intended to provide every tool that a target platform will need, and even those it does provide can be feature-reduced. BusyBox has a sister project known as [Buildroot][7], which can be used to get a complete root filesystem, providing a variety of libraries, utilities and scripting languages. Like Crosstool-NG and the Linux kernel, both BusyBox and Buildroot allow custom configuration using the kconfig menu system. More important, the Buildroot system handles dependencies automatically, so selection of a given utility will guarantee that any software it requires also will be built and installed in the root filesystem.

Buildroot can generate a root filesystem archive in a variety of formats. However, it is important to note that the filesystem only is archived. Individual utilities and libraries are not packaged in either Debian or RPM formats. Using Buildroot will generate a root filesystem image, but its contents are not managed packages. Despite this, Buildroot does provide support for both the opkg and rpm package managers. This means custom applications that will be installed on the root filesystem can be package-managed, even if the root filesystem itself is not.

### Cross-Compiling and Scripting

One of Buildroot's features is the ability to generate a staging tree. This directory contains libraries and utilities that can be used to cross-compile other applications. With a staging tree and the cross toolchain, it becomes possible to compile additional applications outside Buildroot on the host system instead of on the target platform. Using rpm or opkg, those applications then can be installed to the root filesystem on the target at runtime using package management software.

Most custom systems are built around the idea of building applications with scripting languages. If scripting is required on the target platform, a variety of choices are available from Buildroot, including Python, PHP, Lua and JavaScript via Node.js. Support also exists for applications requiring encryption using OpenSSL.

### What's Next

The Linux kernel and bootloaders are compiled like most applications. Their build systems are designed to build a specific bit of software. Crosstool-NG and Buildroot are metabuilds. A metabuild is a wrapper build system around a collection of software, each with their own build systems. Alternatives to these include [Yocto][8] and [OpenEmbedded][9]. The benefit of Buildroot is the ease with which it can be wrapped by an even higher-level metabuild to automate customized Linux distribution builds. Doing this opens the option of pointing Buildroot to project-specific cache repositories. Using cache repositories can speed development and offers snapshot builds without worrying about changes to upstream repositories.

An example implementation of a higher-level build system is [PiBox][10]. PiBox is a metabuild wrapped around all of the tools discussed in this article. Its purpose is to add a common GNU Make target construction around all the tools in order to produce a core platform on which additional software can be built and distributed. The PiBox Media Center and kiosk projects are implementations of application-layer software installed on top of the core platform to produce a purpose-built platform. The [Iron Man project][11] is intended to extend these applications for home automation, integrated with voice control and IoT management.

But PiBox is nothing without these core software tools and could never run without an in-depth understanding of a complete custom distribution build process. And, PiBox could not exist without the long-term dedication of the teams of developers for these projects who have made custom-distribution-building a task for the masses.


--------------------------------------------------------------------------------

via: http://www.linuxjournal.com/content/custom-embedded-linux-distributions

作者：[Michael J.Hammel][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.linuxjournal.com/user/1000879
[1]:https://www.kernel.org
[2]:http://crosstool-ng.github.io
[3]:https://elinux.org/Main_Page
[4]:https://elinux.org/Main_Page
[5]:https://www.denx.de/wiki/U-Boot
[6]:https://busybox.net
[7]:https://buildroot.org
[8]:https://www.yoctoproject.org
[9]:https://www.openembedded.org/wiki/Main_Page
[10]:https://www.piboxproject.com
[11]:http://redmine.graphics-muse.org/projects/ironman/wiki/Getting_Started

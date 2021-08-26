[#]: subject: "30 things you didn't know about the Linux kernel"
[#]: via: "https://opensource.com/article/21/8/linux-kernel"
[#]: author: "Seth Kenlon https://opensource.com/users/seth"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

30 things you didn't know about the Linux kernel
======
The Linux kernel is turning 30 this year.
![30 years][1]

The Linux kernel is turning 30 this year. That's three decades of pioneering open source software, enabling users to run free software, to learn from the applications they're running, and to share what they've learned with friends. It's argued that without the Linux kernel, the luxuries of [open culture][2] and free software we enjoy today may not have surfaced when they have. It's highly improbable that the parts of Apple and Microsoft and Google that are open would be open at all without Linux as the catalyst. The impact of Linux as a phenomenon for culture, software development, and user experience cannot be overstated, and yet it all started with a kernel.

A kernel is the software that boots a computer, recognizes—and ensures communication between—all of the components attached to the computer, both inside and outside of the computer case. For code that most users never even think about, much less understand, there are a lot of surprises about the Linux kernel. In no particular order, here's one fact about the kernel for each year of its life:

  1. Linux was the first operating system to feature USB 3.0 drivers. Sarah Sharp announced on 7 June 2009 that her driver for USB 3.0 devices was available, and her code was included in kernel version 2.6.31

  2. The kernel marks itself as `tainted` when some event occurs that could be useful later for troubleshooting. It’s not a problem to run a "tainted" kernel. Should something go wrong, one of the first troubleshooting steps is to try to reproduce the issue on a non-tainted kernel.

  3. You can specify a hostname or domain name as part of the `ip=` command-line option, Linux preserves it instead of overwriting it with one proposed by DHCP or BOOTP. For instance, `ip=::::myhostname::dhcp` gets the name `myhostname`.

  4. There's a version of a black-and-white, 16-color, and 224-color Tux logo during text bootup.

  5. In the entertainment business, DRM is technology used to prevent access to media. However, in the Linux kernel DRM refers to Direct Rendering Manager and refers to library (libdrm) and drivers used to interface with the GPUs of video cards.

  6. It's possible to patch the Linux kernel without rebooting.

  7. If you compile your own kernel, you can configure your text console to have more than 80 columns.

  8. The Linux kernel provides built-in FAT, exFAT, and NTFS (read and write) compatibility.

  9. Drivers for Wacom tablets and many similar devices are built into the kernel.

  10. Most kernel hackers use the `git send-email` to submit patches.

  11. The kernel uses a documentation toolchain called [Sphinx][3], which is written in Python.

  12. Hamlib provides shared libraries with a standardized API to control amateur radio equipment through your Linux computer.

  13. Hardware manufacturers are encouraged to help develop the kernel in order to ensure compatibility. The hardware can thus be addressed directly without having to download a driver from the manufacturer. Drivers that are directly part of the kernel also automatically benefit from performance and security improvements in new versions of the kernel.

  14. There are drivers included in the kernel for many Raspberry Pi modules (Pi Hats).

  15. The band netcat released an album playable only as a [Linux kernel module.][4]

  16. Inspired by netcat's album release, a module to [turn your kernel into a music player][5] has also been developed.

  17. The Linux kernel features supports many CPU architectures: ARM, ARM64, IA-64, m68k, MIPS, Nios II, PA-RISC, OpenRISC, PowerPC, s390, Sparc, x86, Xtensa, and more.

  18. In 2001, the Linux kernel became the first to [run the x86-64 CPU architecture in long mode][6].

  19. Linux version 3.4 introduced the x32 ABI, allowing developers to compile code to run in 64-bit mode while only using 32-bit pointers and data fields.

  20. The kernel supports many different file systems, including Ext2, Ext3, Ext4, JFS, XFS, GFS2, GCFS2, BtrFS, NILFS2, NFS, Overlay FS, UDF, and more.

  21. The Virtual File System is a software layer in the kernel providing the filesystem interface to applications users run. It's also an abstraction for the kernel so that different filesystem implementations can coexist.

  22. The Linux kernel includes a driver for a physical Braille output device.

  23. For kernel version 2.6.29, the Tux logo during boot was replaced by "Tuz" to raise awareness of an aggressive cancer that was affecting the Tasmanian Devil population in Australia at the time.

  24. Control Groups (cgroups) are the reason containers (the foundation technology for Docker, Podman, Kubernetes, and much more) can exist.

  25. It took extensive legal action to liberate it so it could be included, but today the CIFS module is built into the kernel to enable SMB support. This allows Linux to mount Microsoft remote and cloud-based file shares.

  26. It's notoriously difficult (in fact impossible, so far) for a computer to produce a truly random number. The `hw_random` framework can make use of special hardware features on your CPU or motherboard in an effort to improve random number generation.

  27. _OS jitter_ is interference experienced by an application caused by conflicts in how background processes are scheduled, and how the system handles asynchronous events (such as interrupts.) Binding tasks to sets of CPUs defined by the kernel, using cgroups, and SMP IRQ affinity are options that the kernel provides programmers for reducing OS jitter. Issues like these are discussed in detail in the kernel documentation, helping programmers targeting Linux can write smarter code.

  28. The `make menuconfig` command allows you to use a GUI to configure a kernel before compiling. The `Kconfig` language defines kernel config options.

  29. For essential Linux servers, a _watchdog_ system can be implemented to monitor the health of the server. Between health checks, the watchdog daemon writes data to a special watchdog kernel device, preventing a system reset. Should a watchdog fail to log success, the system is reset. Many implementations of watchdog hardware exist, and they're vital for remote mission critical computers (such as those sent to Mars.)

  30. Although it was developed on Earth, there's a copy of the Linux kernel on the planet Mars.




--------------------------------------------------------------------------------

via: https://opensource.com/article/21/8/linux-kernel

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/kernel-30.png?itok=xmwX2pCQ (30 years)
[2]: https://opensource.com/article/18/1/creative-commons-real-world
[3]: https://opensource.com/article/19/11/document-python-sphinx
[4]: https://github.com/usrbinnc/netcat-cpi-kernel-module
[5]: https://github.com/FlaviaR/Netcat-Music-Kernel-Expansion
[6]: http://www.x86-64.org/pipermail/announce/2001-June/000020.html

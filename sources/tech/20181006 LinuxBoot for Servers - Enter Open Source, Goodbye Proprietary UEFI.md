qhwdw is translating

LinuxBoot for Servers: Enter Open Source, Goodbye Proprietary UEFI
============================================================

[LinuxBoot][13] is an Open Source [alternative][14] to Proprietary [UEFI][15] firmware. It was released last year and is now being increasingly preferred by leading hardware manufacturers as default firmware. Last year, LinuxBoot was warmly [welcomed][16]into the Open Source family by The Linux Foundation.

This project was an initiative by Ron Minnich, author of LinuxBIOS and lead of [coreboot][17] at Google, in January 2017.

Google, Facebook, [Horizon Computing Solutions][18], and [Two Sigma][19] collaborated together to develop the [LinuxBoot project][20] (formerly called [NERF][21]) for server machines based on Linux.

Its openness allows Server users to easily customize their own boot scripts, fix issues, build their own [runtimes][22] and [reflash their firmware][23] with their own keys. They do not need to wait for vendor updates.

Following is a video of [Ubuntu Xenial][24] booting for the first time with NERF BIOS:

[视频](https://youtu.be/HBkZAN3xkJg)

Let’s talk about some other advantages by comparing it to UEFI in terms of Server hardware.

### Advantages of LinuxBoot over UEFI

![LinuxBoot vs UEFI](https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2018/10/linuxboot-uefi.png)

Here are some of the major advantages of LinuxBoot over UEFI:

### Significantly faster startup

It can boot up Server boards in less than twenty seconds, versus multiple minutes on UEFI.

### Significantly more flexible

LinuxBoot can make use of any devices, filesystems and protocols that Linux supports.

### Potentially more secure

Linux device drivers and filesystems have significantly more scrutiny than through UEFI.

We can argue that UEFI is partly open with [EDK II][25] and LinuxBoot is partly closed. But it has been [addressed][26] that even such EDK II code does not have the proper level of inspection and correctness as the [Linux Kernel][27] goes through, while there is a huge amount of other Closed Source components within UEFI development.

On the other hand, LinuxBoot has a significantly smaller amount of binaries with only a few hundred KB, compared to the 32 MB of UEFI binaries.

To be precise, LinuxBoot fits a whole lot better into the [Trusted Computing Base][28], unlike UEFI.

[Suggested readBest Free and Open Source Alternatives to Adobe Products for Linux][29]

LinuxBoot has a [kexec][30] based bootloader which does not support startup on Windows/non-Linux kernels, but that is insignificant since most clouds are Linux-based Servers.

### LinuxBoot adoption

In 2011, the [Open Compute Project][31] was started by [Facebook][32] who [open-sourced][33] designs of some of their Servers, built to make its data centers  more efficient. LinuxBoot has been tested on a few Open Compute Hardware listed as under:

*   Winterfell

*   Leopard

*   Tioga Pass

More [OCP][34] hardware are described [here][35] in brief. The OCP Foundation runs a dedicated project on firmware through [Open System Firmware][36].

Some other devices that support LinuxBoot are:

*   [QEMU][9] emulated [Q35][10] systems

*   [Intel S2600wf][11]

*   [Dell R630][12]

Last month end, [Equus Compute Solutions][37] [announced][38] the release of its [WHITEBOX OPEN™][39] M2660 and M2760 Servers, as a part of their custom, cost-optimized Open-Hardware Servers and storage platforms. Both of them support LinuxBoot to customize the Server BIOS for flexibility, improved security, and create a blazingly fast booting experience.

### What do you think of LinuxBoot?

LinuxBoot is quite well documented [on GitHub][40].  Do you like the features that set it apart from UEFI? Would you prefer using LinuxBoot rather than UEFI for starting up Servers, owing to the former’s open-ended development and future? Let us know in the comments below.

--------------------------------------------------------------------------------

via: https://itsfoss.com/linuxboot-uefi/

作者：[ Avimanyu Bandyopadhyay][a]
选题：[oska874][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://itsfoss.com/author/avimanyu/
[b]:https://github.com/oska874
[1]:https://itsfoss.com/linuxboot-uefi/#
[2]:https://itsfoss.com/linuxboot-uefi/#
[3]:https://itsfoss.com/linuxboot-uefi/#
[4]:https://itsfoss.com/linuxboot-uefi/#
[5]:https://itsfoss.com/linuxboot-uefi/#
[6]:https://itsfoss.com/linuxboot-uefi/#
[7]:https://itsfoss.com/author/avimanyu/
[8]:https://itsfoss.com/linuxboot-uefi/#comments
[9]:https://en.wikipedia.org/wiki/QEMU
[10]:https://wiki.qemu.org/Features/Q35
[11]:https://trmm.net/S2600
[12]:https://trmm.net/NERF#Installing_on_a_Dell_R630
[13]:https://www.linuxboot.org/
[14]:https://www.phoronix.com/scan.php?page=news_item&px=LinuxBoot-OSFC-2018-State
[15]:https://itsfoss.com/check-uefi-or-bios/
[16]:https://www.linuxfoundation.org/blog/2018/01/system-startup-gets-a-boost-with-new-linuxboot-project/
[17]:https://en.wikipedia.org/wiki/Coreboot
[18]:http://www.horizon-computing.com/
[19]:https://www.twosigma.com/
[20]:https://trmm.net/LinuxBoot_34c3
[21]:https://trmm.net/NERF
[22]:https://trmm.net/LinuxBoot_34c3#Runtimes
[23]:http://www.tech-faq.com/flashing-firmware.html
[24]:https://itsfoss.com/features-ubuntu-1604/
[25]:https://www.tianocore.org/
[26]:https://media.ccc.de/v/34c3-9056-bringing_linux_back_to_server_boot_roms_with_nerf_and_heads
[27]:https://medium.com/@bhumikagoyal/linux-kernel-development-cycle-52b4c55be06e
[28]:https://en.wikipedia.org/wiki/Trusted_computing_base
[29]:https://itsfoss.com/adobe-alternatives-linux/
[30]:https://en.wikipedia.org/wiki/Kexec
[31]:https://en.wikipedia.org/wiki/Open_Compute_Project
[32]:https://github.com/facebook
[33]:https://github.com/opencomputeproject
[34]:https://www.networkworld.com/article/3266293/lan-wan/what-is-the-open-compute-project.html
[35]:http://hyperscaleit.com/ocp-server-hardware/
[36]:https://www.opencompute.org/projects/open-system-firmware
[37]:https://www.equuscs.com/
[38]:http://www.dcvelocity.com/products/Software_-_Systems/20180924-equus-compute-solutions-introduces-whitebox-open-m2660-and-m2760-servers/
[39]:https://www.equuscs.com/servers/whitebox-open/
[40]:https://github.com/linuxboot/linuxboot

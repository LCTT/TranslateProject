[bazz2 owns this]
Linux Kernel News - January and February 2014
================================================================================
I am reporting the Linux project activity for the past two months in this article. Blame it on me being heads down to get some development work done. Without further ado, let's get started on catching up.

### Mainline Release (Linus's tree) News ###

Linux 3.13 was released on Sunday January 19th 2014. Please read [What is in Linux 3.13][1]. 3.14-rc5 was released on March 2 2014. Based on the rc release progress so far, it is looking very likely that the Linux 3.14 release will be out before the end of March 2014. Summary of selected git pull requests for 3.14 that made it into 3.14-rc1 are:

### turbostat updates from Len Brown:  ###

> A new command line option -s to dump counters
> 
> Enhancement to run on Haswell Xeon [HSX]. HSX has a slightly different RAPL support than client HSW, which prevented the previous version of turbostat from running on HSX.

### ARM SoC fixes from Olof Johansson: ###

> Enable new drivers in the defconfigs for platforms that have such devices
> 
> Increase coverage of the multi-platform defconfig and some DTS changes that plumbs up some of the devices that now have bindings and driver support.

### ARM64 patches from Catalin Marinas: ###

> Introduction of PTE_WRITE to distinguish between writable but clean and truly read-only pages

### ACPI and power management updates from Rafael Wysocki: ###

> ACPI core changes to make it create a struct acpi_device object for every device represented in the ACPI tables during all namespace scans regardless of the current status of that device. This change prevents, ACPI hot-plug operations from erroneously deleting those objects, unless the underlying ACPI tables go away.
> 
> A new tool for suspend/resume performance optimization from Todd E Brandt
> 
> Init code change to move up early ACPI initialization which should allow the kernel to use ACPI during the time-keeping initialization and possibly simplify the EFI initialization as well - From Chun-Yi Lee
> 
> apm-emulation: add hibernation APM events to support suspend2disk - Enhancement to improve hibernation on embedded systems that use hibernation for fast boot. With this change, software components will be notified with APM events to get ready for hibernation and restore the state afterwards. Capturing the apm status about these pm events is necessary help use fast boot while maintaining system state for hibernation and restore. This change adds apm support for suspend to disk.

### Thermal management updates from Zhang Rui: ###

> Representing hardware thermal properties in device tree infrastructure This work includes the introduction of a device tree bindings for describing the hardware thermal behavior and limits, a parser to read and interpret the data, and build thermal zones and thermal binding parameters. In addition to that three drivers (TI SoC thermal and two hwmon drivers) are converted to use the new representation on sensor devices to serve as an initial validation for the API. This is the first step towards completing the work to identify and convert drivers to use the proposed API and validate it.

### Links to 3.14-rcs ###

- [Linux 3.14-rc1 is out][2]
- [Linux 3.14-rc2][3]
- [Linux 3.14-rc3][4]
- [Linux 3.14-rc4][5]
- [Linux 3.14-rc5][6]

### Stable release News ###

Jiri Slaby is taking over the longterm maintenance of the 3.12 stable tree. Greg KH will continue to do the final release to kernel.org. Jiri Slaby is responsible for collecting patches, sending out release candidate announcements. Please read the details [3.12-stable kernel tree being taken over by Jiri Slaby][7]. As of this writing the latest stable releases are as follows: 

### Latest Stable and Extended releases ###

#### Release	Version	Projected EOL ####
Stable 3.13	3.13.6	Not announced
Stable 3.12	3.12.14	Not announced
Stable 3.11	3.11.10	EOL November 29 2013
Longterm 3.10	3.10.33	September 2015
Longterm 3.4	3.4.82	October 2014
Longterm 3.2	3.2.55	2016
Longterm 3.0	3.0.101	EOL October 22 2013
Longterm 2.6.34	2.6.34.15 	EOL February 10 2014
Longterm 2.6.32	2.6.32.61 	mid-2014
Extended stable 3.11.y.z	3.11.10.6	[Extended Stable][8]
Extended stable 3.8.y.z	3.8.13.19	[Extended Stable][9]
Extended stable 3.5.y.z	3.5.7.31	[Extended Stable][10]

If you ever wondered how these stable releases are managed and how often a new release comes out, here is more detail: [Active kernel releases][11]

### Linux RT ###

Linux RT stable releases_ are numerous. Please checkout linux-stable-rt.git for their latest versions.

### Where can you find all git trees for Linux releases? ###

#### Linux Release	Git ####

Mainline	git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
Stable releases (all)	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
Linux RT releases	git://git.kernel.org/pub/scm/linux/kernel/git/rt/linux-stable-rt.git
Extended stable releases	git://kernel.ubuntu.com/ubuntu/linux.git
Bleeding edge linux-next	git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git

### Final Thoughts ###

TCP Fast Open in 3.13 makes establishing a TCP connection much faster by elimination of one round time trip from certain kinds of TCP conversation, which can improve the load speed of web pages.

ARM changes are significant in 3.14-rc1 merge. Several new devices can now be enabled and increased coverage of the multi-platform defconfig and some DTS changes that plumbs up some of the devices that now have bindings and driver support. Multi-platform configurations coupled with DTS changes help support on multiple platforms with the a common driver code as opposed to requiring device tree device enumeration and special handling for platform to platform variations in how devices are enumerated. This is good news for ARM evolution as it is beginning to add support for PCI devices.

Enhancement to improve hibernation on embedded systems that use hibernation for fast boot is good for mobile and embedded space. Who would want their mobiles coming out of hibernation behaving weird?

In Linux 3.14-rc5 announcement, Linus Torvalds said "Another week, another rc. Things were fairly calm, and fairly normal.". Based on that, barring any last minutes nasty surprises, Linux 3.14 should come out in the next 2-3 weeks. After that as usual the next merge window will open for 3.15-rc1.

If anybody is wondering, what is changing with Jiri Slaby taking over the longterm maintenance of 3.12, please rest assured that it will be maintained the same way it is done today. Jiri Slaby will collect patches and send out release candidates. I volunteered to keep testing the 3.12 release candidates, and Guenter Roeck has volunteered to keep running his build tests on the patch queue for 3.12. Greg KH will do the final release to kernel.org. 

--------------------------------------------------------------------------------

via: http://www.linuxjournal.com/content/linux-kernel-news-january-and-february-2014

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://kernelnewbies.org/LinuxChanges
[2]:https://lkml.org/lkml/2014/2/2/176
[3]:https://lkml.org/lkml/2014/2/9/372
[4]:https://lkml.org/lkml/2014/2/16/120
[5]:https://lkml.org/lkml/2014/2/23/234
[6]:https://lkml.org/lkml/2014/3/2/257
[7]:https://lkml.org/lkml/2014/2/26/596
[8]:https://wiki.ubuntu.com/Kernel/Dev/ExtendedStable
[9]:https://wiki.ubuntu.com/Kernel/Dev/ExtendedStable
[10]:https://wiki.ubuntu.com/Kernel/Dev/ExtendedStable
[11]:https://www.kernel.org/category/releases.html

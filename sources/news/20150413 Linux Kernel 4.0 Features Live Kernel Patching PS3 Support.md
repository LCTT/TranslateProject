Linux Kernel 4.0 Features Live Kernel Patching, PS3 Support
================================================================================
![](http://www.omgubuntu.co.uk/wp-content/uploads/2011/10/tuxtuxtux.jpeg)

**A new stable release of the Linux Kernel [has been announced][1] by Linus Torvalds on the Linux kernel mailing list. **

Linux 4.0, codenamed ‘Hurr durr I’m a sheep’ — no, really — brings with it a small set of new hardware support, driver improvements, performance tweaks, bug fixes and the like.

But remarking on the minor-ness of the update, Torvalds’ writes;

> “Feature-wise, 4.0 doesn’t have all that much special. Much have been made of the new kernel patching infrastructure, but realistically […] we’ve had much bigger changes in other versions.  So this is very much a “solid code progress” release.”

Linus adds that Linux 4.1 is likely to be a ‘bigger release’.

### New Linux Kernel 4.0 Features ###

Install Kernel Updates Without Rebooting

If you’ve ever been put out by the need to reboot your Linux box to finish installing a kernel update you won’t be alone. It’s a minor inconvenience on the desktop, and a major one for servers.

![Reboot-free Kernel Updates](http://www.omgubuntu.co.uk/wp-content/uploads/2012/10/update.jpg)
Reboot-free Kernel Updates

The ability to install/apply security patches to the Linux kernel “live”, without the need to reboot, has been a long-held want of many Linux enthusiasts for years.

A slew of third-party projects, like [Oracle’s KSplice][2] and Red Hat’s Kpatch, have sought to offer live patching functionality for certain distributions.

For servers, enterprise and mission-critical use cases where uptime is priority live kernel patching is a pretty big deal.

The good news is that Linux 4.0 makes having to reboot to complete a kernel update a thing of the past.

Well, almost.

The initial groundwork to support reboot-free patching arrives in this latest release, ready for experienced sysadmins to take advantage of in Linux 4.0.

Desktop Linux distributions should also be able to take advantage of the feature too (though given the complexity involved in configuring the reboot-less functionality on the end-user side it may be a little way off).

This infrastructure will continue to be refined and improved on over the course of the 4.x series. As it does so I expect we’ll all start to hear more about it.

#### Other Changes ####

Although it is considered a small release the latest Linux kernel manages to squeeze in a welcome set of hardware improvements, new drivers and performance tweaks. These include:


- Improvements to Intel ‘Skylake’ platform
- Intel Quark SoC support
- Various patches to improve Linux running on a  Playstation 3
- TOpen-source AMD Radeon driver supports DisplayPort Audio
- Various misc HID driver tweaks, including Lenovo compact keyboards, Wacom Cintiq 27QHD
- Toshiba power settings driver adds USB sleep/charge functionality, rapid charge, sleep w/ music, etc
- File System tweaks, including F2FS, BtrfFS, etc

### Install Linux Kernel 4.0 on Ubuntu ###

Although classed as stable there is, at present, **no need for desktop users or new-comers to go upgrade**. 

The impatient and adept can take a crack at installing Linux 4.0 in Ubuntu 15.04 Beta by grabbing the appropriate set of packages from [Canonical’s mainline kernel archive][3] or by risking a third-party PPA hosted on Launchpad.

Ubuntu 15.04 Vivid Vervet is due later this month and will ship with Ubuntu Kernel 3.19 (the Ubuntu kernel is the Linux Kernel plus Ubuntu-specific patches that have not been accepted upstream).

--------------------------------------------------------------------------------

via: http://www.omgubuntu.co.uk/2015/04/linux-kernel-4-0-new-features

作者：[Joey-Elijah Sneddon][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:https://plus.google.com/117485690627814051450/?rel=author
[1]:https://lkml.org/lkml/2015/4/12/178
[2]:http://www.omgubuntu.co.uk/2009/10/how-to-install-kernel-updates-without-rebooting
[3]:http://kernel.ubuntu.com/~kernel-ppa/mainline/?C=N;O=D
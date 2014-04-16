Canonical's Ubuntu 14.04 focuses on the long haul
================================================================================
> The server edition of Ubuntu 14.04 comes with Docker and better support for solid-state disks

IDG News Service - As organizations move in-house systems to the cloud, Canonical wants them to consider switching their OSes as well.

"When people move to cloud, it very often involves re-architecting an application," said Mark Baker, Canonical Ubuntu Server product manager. "Enterprises are evolving to want to take advantage of scale-out and cloud technology."

Due to factors such as the emergence of cloud services, about 70 percent of CIOs plan to revaluate their choices in IT vendors within the next few years, [according to a Gartner survey][1]. "We are seeing evidence of that," Baker said.

With Thursday's release of the server edition of its Linux distribution, Ubuntu 14.04, Canonical will emphasize how it can be used for organizations as the base for running large mission-critical applications in hosted environments. The release comes with long-term support and many cloud-friendly software programs, such as Docker and the latest edition of OpenStack.

> "We are now much more conscious of the fact that we are creating a platform that is being adopted by enterprises," Baker said.
> 
> Ubuntu 14.04 is a long-term support (LTS) release, meaning it will come with five years of patching and support, making it more viable for enterprise and long-term production usage. It will also allow users to update software packages from Ubuntu's own repository system for this time as well.
> 
> Canonical releases a new version of Ubuntu twice a year, though LTS releases only come every two years. The other non-LTS releases are only supported for nine months.
> 
> With regular non-LTS releases, users will no longer get bug fixes and they cannot update software or the OS itself through Canonical after nine months. This gives users only about three months to update the OS, should they choose to do so.
> 
> Long-term support comes at a good time, given the increasing severity of bugs being found in the infrastructure software, such as the severe OpenSSL Heartbleed bug [that rendered countless Web applications vulnerable to attack][2].

Also last week, Microsoft discontinued support for its Windows XP OS, potentially leaving millions of users [open to attack][3].

About 70 percent of those using the server edition of Ubuntu use the LTS versions of the OS, Baker noted.

Organizations "don't want to be pushed to upgrade until a time that suits them. Five years is a long time. It gives them a lot of runway to work out the right migration path," Baker said.

Baker admitted that the new release is relatively light on new packages and features, mainly due to Canonical's work on getting the software ready for long-term usage.

The company has done a lot of interoperability work with other hardware and software vendors, such as Advanced Micro Devices, Cisco and cloud providers such as Amazon, Joyent, Hewlett-Packard and others.

The package includes the latest version of the OpenStack cloud-hosting software, called Icehouse, [due to be released Thursday][4].

This is notable in that OpenStack itself will only support each release through the next two releases, [a duration that has been until now about 18 months][5].

Ubuntu 14.04 is also the first to include Docker,[a Linux container technology that provides a lighter-weight alternative to running full virtual machines][6].

This is also the first edition to include XFS, a high performance 64-bit journaling file system first developed by SGI (Silicon Graphics). Canonical competitor Red Hat [plans to use XFS][7] as the default file system for the next edition of its Red Hat Enterprise Linux (RHEL) distribution.

Red Hat also includes Docker and OpenStack in RHEL.

Canonical has also equipped Ubuntu to work more effectively with solid-state disks (SSDs). Ubuntu 14.04 comes with Linux kernel version 3.13, [released in January][8]. Linux 3.13 includes a new technology called Multi-Queue Block Layer, which improves read-write performance on SSD disks [by spreading the work across multiple cores][9].

--------------------------------------------------------------------------------

via: http://www.computerworld.com/s/article/9247694/Canonical_39_s_Ubuntu_14.04_focuses_on_the_long_haul?taxonomyId=122

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://www.gartner.com/newsroom/id/2685515
[2]:http://www.computerworld.com/s/article/9247671/Server_makers_rush_their_Heartbleed_patches
[3]:http://www.computerworld.com/s/article/9247525/Microsoft_Patch_Tuesday_bids_adieu_to_Windows_XP
[4]:https://wiki.openstack.org/wiki/Icehouse_Release_Schedule
[5]:https://wiki.openstack.org/wiki/Releases
[6]:http://www.infoworld.com/d/virtualization/docker-challenges-virtualization-market-containers-235897
[7]:http://www.infoworld.com/t/linux/red-hat-enterprise-linux-7-beta-now-available-232520
[8]:http://kernelnewbies.org/Linux_3.13
[9]:http://www.phoronix.com/scan.php?page=news_item&px=MTUwNDc
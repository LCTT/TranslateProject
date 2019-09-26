[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Linux on the mainframe: Then and now)
[#]: via: (https://opensource.com/article/19/9/linux-mainframes-part-2)
[#]: author: (Elizabeth K. Joseph https://opensource.com/users/pleia2https://opensource.com/users/pleia2https://opensource.com/users/lauren-pritchett)

Linux on the mainframe: Then and now
======
It's been two decades since IBM got onboard with Linux on the mainframe.
Here's what happened.
![Penguin driving a car with a yellow background][1]

Last week, I introduced you to the origins of the [mainframe's origins from a community perspective][2]. Let's continue our journey, picking up at the end of 1999, which is when IBM got onboard with Linux on the mainframe (IBM Z).

According to the [Linux on z Systems Wikipedia page][3]:

> "IBM published a collection of patches and additions to the Linux 2.2.13 kernel on December 18, 1999, to start today's mainline Linux on Z. Formal product announcements quickly followed in 2000."

These patches weren't part of the mainline Linux kernel yet, but they did get Linux running on z/VM (Virtual Machine for IBM Z), for anyone who was interested. Several efforts followed, including the first Linux distro—put together out of Marist College in Poughkeepsie, N.Y., and Think Blue Linux by Millenux in Germany. The first real commercial distribution came from SUSE on October 31, 2000; this is notable in SUSE history because the first edition of what is now known as SUSE Enterprise Linux (SLES) is that S/390 port. Drawing again from Wikipedia, the [SUSE Enterprise Linux page][4] explains:

> "SLES was developed based on SUSE Linux by a small team led by Josué Mejía and David Áreas as principal developer who was supported by Joachim Schröder. It was first released on October 31, 2000 as a version for IBM S/390 mainframe machines… In April 2001, the first SLES for x86 was released."

Red Hat quickly followed with support, and community-driven distributions, including Debian, Slackware, and Gentoo, followed, as they gained access to mainframe hardware to complete their builds. Over the next decade, teams at IBM and individual distributions improved support, even getting to the point where a VM was no longer required, and Linux could run on what is essentially "bare metal" alongside the traditional z/OS. With the release of Ubuntu 16.04 in 2016, Canonical also began official support for the platform.

In 2015, some of the biggest news in Linux mainframe history occurred: IBM began offering a Linux-only mainframe called LinuxONE. With z/OS and similar traditional configurations, this was released as the IBM z13; with Linux, these mainframes were branded Rockhopper and Emperor. These two machines came only with Integrated Facility for Linux (IFL) processors, meaning it wasn't even possible to run z/OS, only Linux. This investment from IBM in an entire product line for Linux was profound.

With the introduction of this machine, we also saw the first support for KVM on the mainframe. KVM can replace z/VM as the virtualization technology. This allows for all the standard tooling around KVM to be used for managing virtual machines on the mainframe, including libvirt and OpenStack.

Also in 2015, The Linux Foundation announced the [Open Mainframe Project][5]. Both a community and a series of open source software projects geared specifically towards the mainframe, the flagship project, [Zowe][6], has gathered contributions from multiple companies in the mainframe ecosystem. While it is created for z/OS, Zowe has been a driving force behind the modernization of interactions with mainframes today. On the Linux on Z side, [ADE][7], announced in 2016, is used to detect "anomalous time slices and messages in Linux logs" so that they can be analyzed alongside other mainframe logs.

In 2017, the z14 was released, and LinuxONE Rockhopper II and Emperor II were introduced. One of the truly revolutionary changes with this release was the size of the Rockhopper II: it's air-cooled and fits in the space of a 19" rack. No longer does a company need special space and consideration for this mainframe in their datacenter, it has standard connectors and fits in standard spaces. Then, on September 12, 2019, the z15 was launched alongside the LinuxONE III, and the really notable thing from an infrastructure perspective is the size. A considerable amount of effort was put into making it run happily alongside non-Z systems in the data center, so there is only a 19" version.

![LinuxONE Emperor III mainframe][8]

LinuxONE Emperor III mainframe | Used with permission, Copyright IBM

There are one, two, three, or four-frame configurations, but they'll still fit in a standard datacenter spot. See inside a four-frame, water-cooled version.

![Inside the water-cooled LinuxONE III][9]

Inside the water-cooled LinuxONE III | Used with permission, Copyright IBM

As a long-time x86 Linux systems administrator new to the mainframe world, I'm excited to be a part of it at IBM and to introduce my fellow systems administrators and developers to the platform. Looking forward, I see a future where mainframes continue to be used in tandem with cloud and edge technologies to leverage the best of all worlds.

The modernization of the mainframe isn't stopping any time soon. The mainframe may have a long history, but it's not old.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/9/linux-mainframes-part-2

作者：[Elizabeth K. Joseph][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/pleia2https://opensource.com/users/pleia2https://opensource.com/users/lauren-pritchett
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/car-penguin-drive-linux-yellow.png?itok=twWGlYAc (Penguin driving a car with a yellow background)
[2]: https://opensource.com/article/19/9/linux-mainframes-part-1
[3]: https://en.wikipedia.org/wiki/Linux_on_z_Systems
[4]: https://en.wikipedia.org/wiki/SUSE_Linux_Enterprise
[5]: https://www.openmainframeproject.org/
[6]: https://www.zowe.org/
[7]: https://www.openmainframeproject.org/projects/anomaly-detection-engine-for-linux-logs-ade
[8]: https://opensource.com/sites/default/files/uploads/linuxone_iii_pair.jpg (LinuxONE Emperor III mainframe)
[9]: https://opensource.com/sites/default/files/uploads/water-cooled_rear.jpg (Inside the water-cooled LinuxONE III)

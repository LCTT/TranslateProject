[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Fedora 31 is officially here!)
[#]: via: (https://fedoramagazine.org/announcing-fedora-31/)
[#]: author: (Matthew Miller https://fedoramagazine.org/author/mattdm/)

Fedora 31 is officially here!
======

![][1]

It’s here! We’re proud to announce the release of Fedora 31. Thanks to the hard work of thousands of Fedora community members and contributors, we’re celebrating yet another on-time release. This is getting to be a habit!

If you just want to get to the bits without delay, go to <https://getfedora.org/> right now. For details, read on!

### Toolbox

If you haven’t used the [Fedora Toolbox][2], this is a great time to try it out. This is a simple tool for launching and managing personal workspace containers, so you can do development or experiment in an isolated experience. It’s as simple as running “toolbox enter” from the command line.

This containerized workflow is vital for users of the ostree-based Fedora variants like CoreOS, IoT, and Silverblue, but is also extremely useful on any workstation or even server system. Look for many more enhancements to this tool and the user experience around it in the next few months — your feedback is very welcome.

### All of Fedora’s Flavors

Fedora Editions are targeted outputs geared toward specific “showcase” uses.

Fedora Workstation focuses on the desktop, and particular software developers who want a “just works” Linux operating system experience. This release features GNOME 3.34, which brings significant performance enhancements which will be especially noticeable on lower-powered hardware.

Fedora Server brings the latest in cutting-edge open source server software to systems administrators in an easy-to-deploy fashion.

And, in preview state, we have Fedora CoreOS, a category-defining operating system made for the modern container world, and [Fedora IoT][3] for “edge computing” use cases. (Stay tuned for a planned contest to find a shiny name for the IoT edition!)

Of course, we produce more than just the editions. [Fedora Spins][4] and [Labs][5] target a variety of audiences and use cases, including the [Fedora Astronomy][6], which brings a complete open source toolchain to both amateur and professional astronomers, and desktop environments like [KDE Plasma][7] and [Xfce][8].

And, don’t forget our alternate architectures, [ARM AArch64, Power, and S390x][9]. Of particular note, we have improved support for the Rockchip system-on-a-chip devices including the Rock960, RockPro64,  and Rock64, plus initial support for “[panfrost][10]”, an open source 3D accelerated graphics driver for newer Arm Mali “midgard” GPUs.

If you’re using an older 32-bit only i686 system, though, it’s time to find an alternative — [we bid farewell to 32-bit Intel architecture as a base system][11] this release.

### General improvements

No matter what variant of Fedora you use, you’re getting the latest the open source world has to offer. Following our “[First][12]” foundation, we’re enabling CgroupsV2 (if you’re using Docker, [make sure to check this out][13]). Glibc 2.30  and NodeJS 12 are among the many updated packages in Fedora 31. And, we’ve switched the “python” command to by Python 3 — remember, Python 2 is end-of-life at the [end of this year][14].

We’re excited for you to try out the new release! Go to <https://getfedora.org/> and download it now. Or if you’re already running a Fedora operating system, follow the easy [upgrade instructions][15].

### In the unlikely event of a problem….

If you run into a problem, check out the [Fedora 31 Common Bugs][16] page, and if you have questions, visit our [Ask Fedora][17] user-support platform.

### Thank you everyone

Thanks to the thousands of people who contributed to the Fedora Project in this release cycle, and especially to those of you who worked extra hard to make this another on-time release. And if you’re in Portland for [USENIX LISA][18] this week, stop by the expo floor and visit me at the Red Hat, Fedora, and CentOS booth.

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/announcing-fedora-31/

作者：[Matthew Miller][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/mattdm/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2019/10/fedora31-816x345.jpg
[2]: https://docs.fedoraproject.org/en-US/fedora-silverblue/toolbox/
[3]: https://iot.fedoraproject.org/
[4]: https://spins.fedoraproject.org/
[5]: https://labs.fedoraproject.org/
[6]: https://labs.fedoraproject.org/en/astronomy/
[7]: https://spins.fedoraproject.org/en/kde/
[8]: https://spins.fedoraproject.org/en/xfce/
[9]: https://alt.fedoraproject.org/alt/
[10]: https://panfrost.freedesktop.org/
[11]: https://fedoramagazine.org/in-fedora-31-32-bit-i686-is-86ed/
[12]: https://docs.fedoraproject.org/en-US/project/#_first
[13]: https://fedoraproject.org/wiki/Common_F31_bugs#Docker_package_no_longer_available_and_will_not_run_by_default_.28due_to_switch_to_cgroups_v2.29
[14]: https://pythonclock.org/
[15]: https://docs.fedoraproject.org/en-US/quick-docs/upgrading/
[16]: https://fedoraproject.org/wiki/Common_F31_bugs
[17]: http://ask.fedoraproject.org
[18]: https://www.usenix.org/conference/lisa19

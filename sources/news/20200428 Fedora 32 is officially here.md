[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Fedora 32 is officially here!)
[#]: via: (https://fedoramagazine.org/announcing-fedora-32/)
[#]: author: (Matthew Miller https://fedoramagazine.org/author/mattdm/)

Fedora 32 is officially here!
======

![][1]

It’s here! We’re proud to announce the release of Fedora 32. Thanks to the hard work of thousands of Fedora community members and contributors, we’re celebrating yet another on-time release.

If you just want to get to the bits without delay, head over to <https://getfedora.org/> right now. For details, read on!

## **All of Fedora’s Flavors**

Fedora Editions are targeted outputs geared toward specific “showcase” uses.

Fedora Workstation focuses on the desktop. In particular, it’s geared toward software developers who want a “just works” Linux operating system experience. This release features [GNOME 3.36][2], which has plenty of great improvements as usual. My favorite is the new lock screen!

Fedora Server brings the latest in cutting-edge open source server software to systems administrators in an easy-to-deploy fashion. For edge computing use cases, [Fedora IoT][3] provides a strong foundation for IoT ecosystems.

Fedora CoreOS is an emerging Fedora Edition. It’s an automatically-updating, minimal operating system for running containerized workloads securely and at scale. It offers several [update streams][4] that can be followed for automatic updates that occur roughly every two weeks. Currently the **next** stream is based on Fedora 32, with the **testing** and **stable** streams to follow. You can find information about released artifacts that follow the **next** stream from [the download page][5] and information about how to use those artifacts in the [Fedora CoreOS Documentation][6].

Of course, we produce more than just the editions. [Fedora Spins][7] and [Labs][8] target a variety of audiences and use cases, including the [Fedora Astronomy Lab][9], which brings a complete open source toolchain to both amateur and professional astronomers, and desktop environments like [KDE Plasma][10] and [Xfce][11]. New in Fedora 32 is the [Comp Neuro Lab][12], developed by our Neuroscience Special Interest Group to enable computational neuroscience.

And, don’t forget our alternate architectures: [ARM AArch64, Power, and S390x][13]. Of particular note, we have improved support for the Rockchip system-on-a-chip devices including the Rock960, RockPro64, and Rock64.

**General improvements**

No matter what variant of Fedora you use, you’re getting the latest the open source world has to offer. Following our “[First][14]” foundation, we’ve updated key programming language and system library packages, including GCC 10, Ruby 2.7, and Python 3.8. Of course, with Python 2 past end-of-life, we’ve removed most Python 2 packages from Fedora. A legacy python27 package is provided for developers and users who still need it. In Fedora Workstation, we’ve enabled the EarlyOOM service by default to improve the user experience in low-memory situations.

We’re excited for you to try out the new release! Go to <https://getfedora.org/> and download it now. Or if you’re already running a Fedora operating system, follow the easy [upgrade instructions][15].

## **In the unlikely event of a problem….**

If you run into a problem, check out the [Fedora 32 Common Bugs][16] page, and if you have questions, visit our [Ask Fedora][17] user-support platform.

## **Thank you everyone**

Thanks to the thousands of people who contributed to the Fedora Project in this release cycle, and especially to those of you who worked extra hard to make this another on-time release during a pandemic. Fedora is a community, and it’s great to see how much we’ve supported each other. I invite you to join us in the [Red Hat Summit Virtual Experience][18] 28-29 April to learn more about Fedora and other communities.

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/announcing-fedora-32/

作者：[Matthew Miller][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/mattdm/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2020/04/f32-final-816x345.png
[2]: https://www.gnome.org/news/2020/03/gnome-3-36-released/
[3]: https://iot.fedoraproject.org/
[4]: https://docs.fedoraproject.org/en-US/fedora-coreos/update-streams/
[5]: https://getfedora.org/en/coreos/download?stream=next
[6]: https://docs.fedoraproject.org/en-US/fedora-coreos/getting-started/
[7]: https://spins.fedoraproject.org/
[8]: https://labs.fedoraproject.org/
[9]: https://labs.fedoraproject.org/en/astronomy/
[10]: https://spins.fedoraproject.org/en/kde/
[11]: https://spins.fedoraproject.org/en/xfce/
[12]: https://labs.fedoraproject.org/en/comp-neuro
[13]: https://alt.fedoraproject.org/alt/
[14]: https://docs.fedoraproject.org/en-US/project/#_first
[15]: https://docs.fedoraproject.org/en-US/quick-docs/upgrading/
[16]: https://fedoraproject.org/wiki/Common_F32_bugs
[17]: http://ask.fedoraproject.org
[18]: https://www.redhat.com/en/summit

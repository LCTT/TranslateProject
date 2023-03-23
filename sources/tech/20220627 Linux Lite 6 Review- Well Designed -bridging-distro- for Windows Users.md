[#]: subject: "Linux Lite 6 Review: Well Designed “bridging-distro” for Windows Users"
[#]: via: "https://www.debugpoint.com/linux-lite-6-review/"
[#]: author: "Arindam https://www.debugpoint.com/author/admin1/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Linux Lite 6 Review: Well Designed “bridging-distro” for Windows Users
======

**We took [Linux Lite 6 “Fluorite”][1] for a test drive in a physical and virtual machine for a review.**

It has been more than a year since we reviewed the Linux Lite distribution. The [last review][2] was for its 5.0 series. And it’s time for a refreshed review of this excellent distribution with its latest major release Linux Lite 6.0.

Linux Lite 6.0, AKA Linux Lite OS, is based on Ubuntu and follows its LTS (Long Term Support) lifecycle. That means you get a similar release schedule and security updates for five years following Ubuntu Linux. The lightweight desktop environment – Xfce is the primary and only desktop it offers. Linux Lite OS primarily focuses on Windows users who want to kick start their Linux journey. Hence you may think of it as a “bridging” Linux operating system.

![Linux Lite 6 Xfce Desktop][3]

### Linux Lite 6: Review

Lite 6 is coming after two years of its last major release. Due to its dependency on Ubuntu LTS, you should expect some significant changes in this version. First, let’s wrap up the new features in this release. And then, we can talk about the installation, performance and review pointers.

#### Core updates and changes

At its core, it is based on Linux Kernel 5.15, the default LTS kernel for Ubuntu 22.04 LTS Jammy Jellyfish. In addition, this release introduces a set of desktop applications from Assistive Technologies to help hearing and sight-impaired people. The apps are – “Onscreen Keyboard – Onboard”, “Screen reader – Orca”, and “screen magnifier”. With this change, Linux Lite 6 becomes more similar to Windows for its target users.

In addition to the above change, a controversial decision is to add Google Chrome as its default browser replacing the Snap version of Firefox. Undoubtedly, Google Chrome is the market leader in the browser space and is well built. But many have issues with it because it’s from Google.

Besides, the team also chose between the Firefox deb version and the Microsft Edge (considering Linux Lite 6 targets Windows users).

Another beneficial core change for users is the team’s decision to bring the latest LibreOffice stable edition in each point release in the next two years. Because Ubuntu might delay specific LibreOffice versions, but with Linux Lite point releases, you definitely would get the latest version.

Moreover, if you are a fan of look and feel, the new Materia window theme is going to give you a pleasant and sleek desktop.

Overall, it’s a good set of changes and choices (such as the browser) in Linux Lite 6 to stay ahead with the times. Now, let’s discuss some review findings during our test run.

![Linux Lite has a nice update tool][4]

#### Download, Installation

Linux Lite 6 ISO size is 2.1 GB, and I believe it’s reasonably well-composed, considering the vanilla Ubuntu 22.04 ISO desktop size is a whopping 3 GB+.

In all fairness, unlike other Linux distributions, Linux Lite doesn’t ask you which desktop you want – because you have only one choice – The Xfce desktop.

During testing, we could not get it installed in a physical system. The Ubiquity installer became unresponsive on the “read partition” module. After a few hours of research, we found that Ubiquity doesn’t play well with a non-GPT table with more than three logical partitions.

However, it installs fine in a virtual-machine environment.

![Ubiquity gave some errors in test machines][5]

The Lite Welcome app gives you a single point to perform various maintenance activities in the first boot. Critical tasks such as updating the system, patching and installing/removing software are easy with its native Lite Software and Updater.

Moreover, if you want to install the Firefox web browser, the Lite Software gives you a fair warning that it is a snap. Although, it doesn’t matter much from a new Windows user standpoint, whether it’s snap or anything else.

![Firefox is available as Snap from Lite Software][6]

### Performance

Linux Lite 6 takes around 590 MB of RAM in an idle state with an uptime of 3 hours. The CPU is at about 2% to 3% in an inactive state. Furtehrmore, if you run more applications, the resource usage would increase eventually. However, I believe it’s a good performance considering the target hardware of this distro. Besides, the old Windows 10 or Windows 7 devices would work fine in this distro.

And it uses 9 GB of disk space for the default install.

![Linux Lite 6 – Performance][7]

### Closing Notes

Overall, it is an excellent release and perhaps one of the early mainstream distros based on Ubuntu 22.04. Tiny additions in this release such as new accessibility tools, a new system monitoring tool and other changes are definitely good. However, some users may not like Google Chrome considering the privacy debates.

Moreover, the lack of a major upgrade path may be a roadblock and troublesome for new users. I hope the Linux Lite team brings the upgrade feature in the future. Other than that, it’s well built and a good release. You can easily try it out and choose for your daily driver.

You can download Linux Lite on the [official website][8].

--------------------------------------------------------------------------------

via: https://www.debugpoint.com/linux-lite-6-review/

作者：[Arindam][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.debugpoint.com/author/admin1/
[b]: https://github.com/lkxed
[1]: https://debugpointnews.com/linux-lite-6-0/
[2]: https://www.debugpoint.com/linux-lite-5-2-review/
[3]: https://www.debugpoint.com/wp-content/uploads/2022/06/Linux-Lite-6-Xfce-Desktop.jpg
[4]: https://www.debugpoint.com/wp-content/uploads/2022/06/Linux-Lite-has-a-nice-update-tool.jpg
[5]: https://www.debugpoint.com/wp-content/uploads/2022/06/Ubiquity-gave-some-errors-in-test-machines.jpg
[6]: https://www.debugpoint.com/wp-content/uploads/2022/06/Firefox-is-available-as-Snap-from-Lite-Software.jpg
[7]: https://www.debugpoint.com/wp-content/uploads/2022/06/Linux-Lite-6-Performance.jpg
[8]: https://www.linuxliteos.com/download.php
[9]: https://t.me/debugpoint
[10]: https://twitter.com/DebugPoint
[11]: https://www.youtube.com/c/debugpoint?sub_confirmation=1
[12]: https://facebook.com/DebugPoint
[13]: https://t.me/debugpoint

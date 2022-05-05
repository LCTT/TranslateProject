[#]: subject: "Getting Nostalgic With Common Desktop Environment on a Modern Linux Distro"
[#]: via: "https://itsfoss.com/common-desktop-environment/"
[#]: author: "Bill Dyer https://itsfoss.com/author/bill/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Getting Nostalgic With Common Desktop Environment on a Modern Linux Distro
======

Recently, I installed the old [Common Desktop Environment (CDE)][1] on a [SparkyLinux][2] machine. It was the old window environment for [UNIX][3] back in the 1990s. I kept using it until it was finally discontinued in the early 2000s. I remember using CDE on [AIX][4], [HP-UX][5], [DG/UX][6], and I even got it to run on Slackware and RedHat distros running on a ‘386.

![CDE desktop][7]

Installing CDE had no real purpose, but I miss it sometimes. Feeling a bit nostalgic, I decided it would be nice to see again. It can’t handle some of the newer, more powerful programs today, but it was still nice to play with. How easily I can be entertained.

Here’s a bit of history for you. CDE was a product of cooperation between companies – jointly developed by Hewlett-Packard, IBM, Novell, and Sun Microsystems. It was adopted as the standard operating environment by these companies and many others in the UNIX workstation market.

![HP9000 workstation with CDE login screen | Image Credit Wikimedia][8]

The color scheme wasn’t much to look at, but it could be changed. I recall that CDE was a bit buggy too. The Help Manager was rarely complete, so we always had to resort to man pages from xterm.

![CDE help manager][9]

The calendar never worked right. It would display dates fine but saving an event could turn out to be an impossible event in itself.

CDE used the **dtwm** window manager, which was an X Window System window manager based upon the [Motif][10] window manager, `mwm`. It provided **mwm** compatible window management functionality to the user or programmer, including functions that facilitated control of elements of window state such as placement, size, icon/normal display, and input-focus ownership.

In addition to window control, **dtwm** provided workspace management. Workspaces provide a way of grouping together logically related windows. Each workspace was shown independent of the other workspaces so that only those windows related to the immediate task were visible. Workspaces were an effective tool to organize windows by task and make efficient use of screen real estate.

![CDE task bar][11]

Today, we do these things with almost hardly a thought, but back then, it was rather novel (especially since it ran on different UNIX systems) and, despite some of the bugs CDE had, it was much better than [Windows 3.11][12], which was commonly used in the early-mid 1990’s.

### For the More Adventurous

![CDE on Linux in 2012 | Image Credit Wikimedia][13]

It is the custom of [It’s FOSS][14] to go into details on how to install and run the package being featured. I’ll keep to that tradition, but with the warning that CDE depends on on older X code – you might not want that on your machine. To that end, I’ll tell you where you can find it, along with some documentation, and then you can decide.

CDE is available in the SparkyLinux repository. SparkyLinux is a Debian derivative so it should work with some tweaking. Personally, I don’t like to “cross-pollenate” (adding the SparkyLinux repository to an Ubuntu system, for example), so I’ll leave this to the reader to perform due research before installing this on a distro other than SparkyLinux.

SparkyLinux has two CDE packages. One is the older standard and the other a retro using more modern code. The older package, based on older X Windows code, is called simply: [Common Desktop Environment (CDE)][15].

The second package is called: [Not so Common Desktop Environment (NsCDE)][16] has the retro CDE look (and partial feel) but with a more powerful and flexible framework, under the hood, so more advanced software, in use today, can run on it.

There is a [Reddit article][17] that explains how to add the SparklyLinux repository to your system and how to install it. Since there are two CDE packages on SparkyLinux, be sure to review the two wiki links fro CDE and NsCDE, so you’re sure to get the package you want.

For RedHat, Fedora, and CentOS folks, there is an [RPM package][18] available. Most of the major work has been done, so it looks to have been sitting untouched for some time. However, it’s still being monitored and a little activity has been recorded over the last few months.

![][19]

CDE used to be proprietary software, but it was released as open source software in 2012. You can check out a major [SourceForge project][20] which is quite active. The same project also houses a copy of all of the [documentation][21]. For history buffs, this is worth checking out.

### Conclusion

CDE was once considered the de-facto standard windowing environment on UNIX systems. Seeing it resurrected as open-source projects was a pleasure and I was able to enjoy reliving a little bit of my early years in UNIX.

[XFCE][22] was an open-source fork of CDE in 1996. It looks, or acts, nothing like CDE today, but it, and other similar projects laid the groundwork for the systems we have today. That’s a good thing.

--------------------------------------------------------------------------------

via: https://itsfoss.com/common-desktop-environment/

作者：[Bill Dyer][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/bill/
[b]: https://github.com/lujun9972
[1]: https://en.wikipedia.org/wiki/Common_Desktop_Environment
[2]: https://sparkylinux.org/
[3]: https://en.wikipedia.org/wiki/Unix
[4]: https://en.wikipedia.org/wiki/IBM_AIX
[5]: https://en.wikipedia.org/wiki/HP-UX
[6]: https://en.wikipedia.org/wiki/DG/UX
[7]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/12/cde_desktop-4.jpg?resize=786%2C566&ssl=1
[8]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/12/HP9000-Workstation_with_CDE.webp?resize=800%2C630&ssl=1
[9]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/12/cde_helpmgr.jpg?resize=652%2C762&ssl=1
[10]: https://en.wikipedia.org/wiki/Motif_Window_Manager
[11]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/12/cde_taskbar.jpg?resize=602%2C62&ssl=1
[12]: https://en.wikipedia.org/wiki/Windows_3.1x
[13]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/12/CDE_2012_on_Linux.png?resize=800%2C604&ssl=1
[14]: https://itsfoss.com/
[15]: https://wiki.sparkylinux.org/doku.php/cde
[16]: https://wiki.sparkylinux.org/doku.php/nscde_desktop
[17]: https://www.reddit.com/r/linux/comments/jv7zra/guide_the_easiest_way_to_install_cde_common/
[18]: https://github.com/zssfred/cderpm
[19]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/12/common-desktop-environment.png?resize=800%2C450&ssl=1
[20]: https://sourceforge.net/p/cdesktopenv/wiki/Home/
[21]: https://sourceforge.net/p/cdesktopenv/wiki/Documentation/
[22]: https://en.wikipedia.org/wiki/Xfce

Linus Torvalds Releases Linux Kernel 3.15 Stable
================================================================================
![](http://i1-news.softpedia-static.com/images/news2/Linus-Torvalds-Releases-Linux-Kernel-3-15-Stable-445785-2.jpg)

**Linus Torvalds has just announced that the final version in the new Linux kernel 3.15 branch has been released and is now available for download.**

Linux kernel 3.15 arrived a little early than anticipated, but it looks like the final build is on track and that Linus Torvalds managed to launch it with all the bells and whistles

“So I ended up doing an rc8 because I was a bit worried about some last-minute dcache fixes, but it turns out that nobody seemed to even notice those. We did have other issues during the week, though, so it was just as well. The futex fixes and cleanups may stand out, but as usual there's various other random fixes since rc8 in there too: mainly drivers (drm, networking, sound, usb etc), networking, scheduling and perf tooling.”

“But it's all been fairly small and quiet, which *may* of course be due to the fact that last week was also the first week of the merge window for 3.16. That might have distracted some developers. I'm not entirely convinced I liked the overlap, but it seemed to work ok, and unless people scream really loudly (‘Please don't _ever_ do that again’) and give good reasons for doing so, I might end up doing that overlapping merge window in the future too if it ends up helping out with some particular timing issue,” said Linus Torvalds in the official announcement.

According to the changelog, Netgear AirCard 341U support has been added, additional Sierra Wireless QMI devices are now supported, support has been added for Novatel E371 PCIe card, page table updates have been implemented for Radeon, C0 tracking has been removed, beacon filtering has been disabled, inet_getid() and ipv6_select_ident() bugs have been fixed, corrupted path strings for long paths have been repaired, NovaTech OrionLXm product ID has been added, and mux settling delay has been added.

Also, list/memory corruption on the CPU hotplug has been fixed, the missing support of 10mbit in emac/rgmii has been added, runtime dependencies have been set, support for iPad 2 and iPad 3 has been added, EFI_MIXED should not prohibit loading above 4G, a kernel panic caused by a non-linear skb has been fixed, locking checks are now skipped in the panicking path, and correct available vectors are now received for CPU_disable.

A complete list of changes, improvements, and fixes can be found in the official [changelog][1].

### Download Linux kernel 3.15: ###

- [tar.xz (3.15)][2][sources] [76 MB]
- [tar.xz (3.14.6)][3][sources] [74.80 MB]

--------------------------------------------------------------------------------

via: http://news.softpedia.com/news/Linus-Torvalds-Releases-Linux-Kernel-3-15-Stable-445785.shtml

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://www.mail-archive.com/linux-kernel@vger.kernel.org/msg659672.html
[2]:https://www.kernel.org/pub/linux/kernel/v3.x/linux-3.15.tar.xz
[3]:https://www.kernel.org/pub/linux/kernel/v3.x/linux-3.14.6.tar.xz
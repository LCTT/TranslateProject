While the event had a certain amount of drama surrounding it, the [announcement][1] of the end for the [Debian Live project][2] seems likely to have less of an impact than it first appeared. The loss of the lead developer will certainly be felt—and the treatment he and the project received seems rather baffling—but the project looks like it will continue in some form. So Debian will still have tools to create live CDs and other media going forward, but what appears to be a long-simmering dispute between project founder and leader Daniel Baumann and the Debian CD and installer teams has been "resolved", albeit in an unfortunate fashion.

The November 9 announcement from Baumann was titled "An abrupt End to Debian Live". In that message, he pointed to a number of different events over the nearly ten years since the [project was founded][3] that indicated to him that his efforts on Debian Live were not being valued, at least by some. The final straw, it seems, was an "intent to package" (ITP) bug [filed][4] by Iain R. Learmonth that impinged on the namespace used by Debian Live.

Given that one of the main Debian Live packages is called "live-build", the new package's name, "live-build-ng", was fairly confrontational in and of itself. Live-build-ng is meant to be a wrapper around the [vmdebootstrap][5] tool for creating live media (CDs and USB sticks), which is precisely the role Debian Live is filling. But when Baumann [asked][6] Learmonth to choose a different name for his package, he got an "interesting" [reply][7]:

```
It is worth noting that live-build is not a Debian project, it is an external project that claims to be an official Debian project. This is something that needs to be fixed.
There is no namespace issue, we are building on the existing live-config and live-boot packages that are maintained and bringing these into Debian as native projects. If necessary, these will be forks, but I'm hoping that won't have to happen and that we can integrate these packages into Debian and continue development in a collaborative manner.
live-build has been deprecated by debian-cd, and live-build-ng is replacing it. In a purely Debian context at least, live-build is deprecated. live-build-ng is being developed in collaboration with debian-cd and D-I [Debian Installer].
```

Whether or not Debian Live is an "official" Debian project (or even what "official" means in this context) has been disputed in the thread. Beyond that, though, Neil Williams (who is the maintainer of vmdebootstrap) [provided some][8] explanation for the switch away from Debian Live:

```
vmdebootstrap is being extended explicitly to provide support for a replacement for live-build. This work is happening within the debian-cd team to be able to solve the existing problems with live-build. These problems include reliability issues, lack of multiple architecture support and lack of UEFI support. vmdebootstrap has all of these, we do use support from live-boot and live-config as these are out of the scope for vmdebootstrap.
```

Those seem like legitimate complaints, but ones that could have been fixed within the existing project. Instead, though, something of a stealth project was evidently undertaken to replace live-build. As Baumann [pointed out][9], nothing was posted to the debian-live mailing list about the plans. The ITP was the first notice that anyone from the Debian Live project got about the plans, so it all looks like a "secret plan"—something that doesn't sit well in a project like Debian.

As might be guessed, there were multiple postings that supported Baumann's request to rename "live-build-ng", followed by many that expressed dismay at his decision to stop working on Debian Live. But Learmonth and Williams were adamant that replacing live-build is needed. Learmonth did [rename][10] live-build-ng to a perhaps less confrontational name: live-wrapper. He noted that his aim had been to add the new tool to the Debian Live project (and "bring the Debian Live project into Debian"), but things did not play out that way.

```
I apologise to everyone that has been upset by the ITP bug. The software is not yet ready for use as a full replacement for live-build, and it was filed to let people know that the work was ongoing and to collect feedback. This sort of worked, but the feedback wasn't the kind I was looking for.
```

The backlash could perhaps have been foreseen. Communication is a key aspect of free-software communities, so a plan to replace the guts of a project seems likely to be controversial—more so if it is kept under wraps. For his part, Baumann has certainly not been perfect—he delayed the "wheezy" release by [uploading an unsuitable syslinux package][11] and [dropped down][12] from a Debian Developer to a Debian Maintainer shortly thereafter—but that doesn't mean he deserves this kind of treatment. There are others involved in the project as well, of course, so it is not just Baumann who is affected.

One of those other people is Ben Armstrong, who has been something of a diplomat during the event and has tried to smooth the waters. He started with a [post][13] that celebrated the project and what Baumann and the team had accomplished over the years. As he noted, the [list of downstream projects][14] for Debian Live is quite impressive. In another post, he also [pointed out][15] that the project is not dead:

```
If the Debian CD team succeeds in their efforts and produces a replacement that is viable, reliable, well-tested, and a suitable candidate to replace live-build, this can only be good for Debian. If they are doing their job, they will not "[replace live-build with] an officially improved, unreliable, little-tested alternative". I've seen no evidence so far that they operate that way. And in the meantime, live-build remains in the archive -- there is no hurry to remove it, so long as it remains in good shape, and there is not yet an improved successor to replace it.
```

On November 24, Armstrong also [posted][16] an update (and to [his blog][17]) on Debian Live. It shows some good progress made in the two weeks since Baumann's exit; there are even signs of collaboration between the project and the live-wrapper developers. There is also a [to-do list][18], as well as the inevitable call for more help. That gives reason to believe that all of the drama surrounding the project was just a glitch—avoidable, perhaps, but not quite as dire as it might have seemed.


---------------------------------

via: https://lwn.net/Articles/665839/

作者：Jake Edge
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出


[1]: https://lwn.net/Articles/666127/
[2]: http://live.debian.net/
[3]: https://www.debian.org/News/weekly/2006/08/
[4]: https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=804315
[5]: http://liw.fi/vmdebootstrap/
[6]: https://lwn.net/Articles/666173/
[7]: https://lwn.net/Articles/666176/
[8]: https://lwn.net/Articles/666181/
[9]: https://lwn.net/Articles/666208/
[10]: https://lwn.net/Articles/666321/
[11]: https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=699808
[12]: https://nm.debian.org/public/process/14450
[13]: https://lwn.net/Articles/666336/
[14]: http://live.debian.net/project/downstream/
[15]: https://lwn.net/Articles/666338/
[16]: https://lwn.net/Articles/666340/
[17]: http://syn.theti.ca/2015/11/24/debian-live-after-debian-live/
[18]: https://wiki.debian.org/DebianLive/TODO

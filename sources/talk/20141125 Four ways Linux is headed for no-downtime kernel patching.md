翻译中 by coloka
Four ways Linux is headed for no-downtime kernel patching
================================================================================
![Credit: Shutterstock](http://images.techhive.com/images/article/2014/10/patch_f-100526950-primary.idge.jpeg)
Credit: Shutterstock

These technologies are competing to provide the best way to patch the Linux kernel without reboots or downtime

Nobody loves a reboot, especially not if it involves a late-breaking patch for a kernel-level issue that has to be applied stat.

To that end, three projects are in the works to provide a mechanism for upgrading the kernel in a running Linux instance without having to reboot anything.

### Ksplice ###

The first and original contender is Ksplice, courtesy of a company of the same name founded in 2008. The kernel being replaced does not have to be pre-modified; all it needs is a diff file listing the changes to be made to the kernel source. Ksplice, Inc. offered support for the (free) software as a paid service and supported most common Linux distributions used in production.

All that changed in 2011, when [Oracle purchased the company][1], rolled the feature into its own Linux distribution, and kept updates for the technology to itself. As a result, other intrepid kernel hackers have been looking for ways to pick up where Ksplice left off, without having to pay the associated Oracle tax.

### Kgraft ###

In February 2014, Suse provided the exact solution needed: [Kgraft][2], its kernel-update technology released under a mixed GPLv2/GPLv3 license and not kept close as a proprietary creation. It's since been [submitted][3] as a possible inclusion to the mainline Linux kernel, although Suse has rolled a version of the technology into [Suse Linux Enterprise Server 12][4].

Kgraft works roughly like Ksplice by using a set of diffs to figure out what parts of the kernel to replace. But unlike Ksplice, Kgraft doesn't need to stop the kernel entirely to replace it. Any running functions can be directed to their old or new kernel-level counterparts until the patching process is finished.

### Kpatch ###

Red Hat came up with its own no-reboot kernel-patch mechanism, too. Also introduced earlier this year -- right after Suse's work in that vein, no less -- [Kpatch][5] works in roughly the same manner as Kgraft.

The main difference, [as outlined][6] by Josh Poimboeuf of Red Hat, is that Kpatch doesn't redirect calls to old kernel functions. Rather, it waits until all function calls have stopped, then swaps in the new kernel. Red Hat's engineers consider this approach safer, with less code to maintain, albeit at the cost of more latency during the patch process.

Like Kgraft, Kpatch has been submitted for consideration as a possible kernel inclusion and can be used with Linux kernels other than Red Hat's. The bad news is that Kpatch isn't yet considered production-ready by Red Hat. It's included as part of Red Hat Enterprise Linux 7, but only in the form of a technology preview.

### ...or Kgraft + Kpatch? ###

A fourth solution [proposed by Red Hat developer Seth Jennings][7] early in November 2014 is a mix of both the Kgraft and Kpatch approaches, using patches built for either one of those solutions. This new approach, Jennings explained, "consists of a live patching 'core' that provides an interface for other 'patch' kernel modules to register patches with the core." This way, the patching process -- specifically, how to deal with any running kernel functions -- can be handled in a more orderly fashion.

The sheer newness of these proposals means it'll be a while before any of them are officially part of the Linux kernel, although Suse's chosen to move fast and made it a part of its latest enterprise offering. Let's see if Red Hat and Canonical choose to follow suit in the short run as well.

--------------------------------------------------------------------------------

via: http://www.infoworld.com/article/2851028/linux/four-ways-linux-is-headed-for-no-downtime-kernel-patching.html

作者：[Serdar Yegulalp][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.infoworld.com/author/Serdar-Yegulalp/
[1]:http://www.infoworld.com/article/2622437/open-source-software/oracle-buys-ksplice-for-linux--zero-downtime--tech.html
[2]:http://www.infoworld.com/article/2610749/linux/suse-open-sources-live-updater-for-linux-kernel.html
[3]:https://lwn.net/Articles/596854/
[4]:http://www.infoworld.com/article/2838421/linux/suse-linux-enterprise-12-goes-light-on-docker-heavy-on-reliability.html
[5]:https://github.com/dynup/kpatch
[6]:https://lwn.net/Articles/597123/
[7]:http://lkml.iu.edu/hypermail/linux/kernel/1411.0/04020.html
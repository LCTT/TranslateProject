[bazz2222222]
Linux about to gain a new file system – bcachefs
================================================================================
A five year old file system built by Kent Overstreet, formerly of Google, is near feature complete with all critical components in place. Bcachefs boasts the performance and reliability of the widespread ext4 and xfs as well as the feature list similar to that of btrfs and zfs. Notable features include checksumming, compression, multiple devices, caching and eventually snapshots and other “nifty” features.

Bcachefs started out as **bcache** which was a block caching layer, the evolution from bcache to a fully featured [copy-on-write][1] file system has been described as a metamorphosis.

Responding to the self-imposed question “Yet another new filesystem? Why?” Kent Overstreet replies with the following “Well, years ago (going back to when I was still at Google), I and the other people working on bcache realized that what we were working on was, almost by accident, a good chunk of the functionality of a full blown filesystem – and there was a really clean and elegant design to be had there if we took it and ran with it. And a fast one – the main goal of bcachefs to match ext4 and xfs on performance and reliability, but with the features of btrfs/xfs.”

Overstreet has invited people to use and test bcachefs out on their own systems. To find instructions to use bcachefs on your system check out the mailing list [announcement][2].

The file system situation on Linux is a fairly drawn out one, Fedora 16 for instance aimed to use btrfs instead of ext4 as the default file system, this switch still has not happened. Currently all of the Debian based distros, including Ubuntu, Mint and elementary OS, still use ext4 as their default file systems and none have even whispered about switching to a new default file system yet.

--------------------------------------------------------------------------------

via: http://www.linuxveda.com/2015/08/22/linux-gain-new-file-system-bcachefs/

作者：[Paul Hill][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.linuxveda.com/author/paul_hill/
[1]:https://en.wikipedia.org/wiki/Copy-on-write
[2]:https://lkml.org/lkml/2015/8/21/22

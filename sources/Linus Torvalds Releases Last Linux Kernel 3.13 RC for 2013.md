翻译中 by小眼儿
Linus Torvalds Releases Last Linux Kernel 3.13 RC for 2013
================================================================================
**Linus Torvalds has announced the immediate availability of the sixth Release Candidate in the 3.13 branch of the kernel.**

Linux kernel 3.13 RC6 has arrived on schedule, but with a very small number of commits, making it one of the smallest release candidates so far, at last in this development cycle.

“As expected, things have been quiet over the holiday week. So various small random updates: drivers (infiniband, gpu, cpufreq, libata, block), some small filesystem fixes (ext4/jbd2), and a few ARM SoC things. Tiny x86, percpu and cgroup fixes. Nothing you'd normally even notice, just 81 fairly small commits,” said Linus Torvalds in the official announcement.

He is usually a lot more talkative than this, but being such a small release and the end of the year, he probably abstained himself from any other divergent commentaries.

Linus Torvalds also celebrated [his birthday on December 28][1], but he usually doesn't make a fuss about it.

### Highlights of Linux Kernel 3.13 RC6: ###

• The correct number of audio pins has been set (drm/radeon/dce6);
• SS has been disabled on Cayman (drm/radeon/dpm);
• Check for 0 count in speaker allocation and SAD code (drm/radeon);
• Various memory leaks that occurred when unplugging a block device have been fixed;
• SDHI resource sizes have been fixed;
• Prevent double unref following alloc failure during execbuffer (drm/i9150);
• The erroneous dereference of batch_obj inside reset_status has been fixed;
• The correct GMCH_CTRL register for Sandybridge+ is now used;
• The obsoleted msg JBD->JBD2 has been renamed;
• Support for the ValleyView Soc has been added;
• The PWM backlight power supply has been added.

A complete list of changes, improvements, and fixes can be found in the official [changelog][2].

Download Linux kernel 3.13 Release Candidate 6 right now:

- [Linux kernel 3.13 Release Candidate 6 tar.xz][3][sources] [73.60 MB]

*Remember that this is a beta version and it should NOT be installed on production machines. It is intended for testing purposes only.*

--------------------------------------------------------------------------------

via: http://news.softpedia.com/news/Linus-Torvalds-Releases-Last-Linux-Kernel-3-13-RC-for-2013-412622.shtml

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://news.softpedia.com/news/Happy-Birthday-Linus-Torvalds-412474.shtml
[2]:https://lkml.org/lkml/2013/12/29/95
[3]:https://www.kernel.org/pub/linux/kernel/v3.x/testing/linux-3.13-rc6.tar.xz

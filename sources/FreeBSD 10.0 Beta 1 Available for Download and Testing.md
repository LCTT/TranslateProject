crowner翻译
FreeBSD 10.0 Beta 1 Available for Download and Testing
================================================================================
**FreeBSD 10.0 Beta 1, an operating system for x86, ARM, IA-64, PowerPC, PC-98, and UltraSPARC architectures, has been released and it's now available for download and testing.**

![](http://i1-news.softpedia-static.com/images/news2/FreeBSD-10-0-Beta-1-Available-for-Download-and-Testing-391246-2.png)

The FreeBSD developers are moving with an incredible speed and are releasing one version after another. The new Beta has arrived after no less than five Alpha versions, but not without any problems.

“Due to a last minute problem found in the 10.0-BETA1 freebsd-update(8) builds, freebsd-update(8) is NOT supported for 10.0-BETA1 upgrades. Please do not use freebsd-update(8) to upgrade to 10.0-BETA1. Please be aware that cvsup and CVS are not supported methods of updating the src/ tree,” reads the official [announcement][1].

Also, according to the developers, the ports.txz distribution hasn't been included in the 10.0 Beta 1 release, however, it is expected to be included with disc1.iso for subsequent builds during the release cycle.

Highlights of FreeBSD 10.0 Beta 1:

- freebsd-version, which is intended to be used as an auditing tool, has been implemented. This is a very important tool if you want to determine the userland patch level when it differs from what 'uname -r' reports;
- The ZFS lzjb decompress performance has been improved;
- Two new MIPS CPU families, mips24k and mips74k, have been added;
- The "jail_<jname>_*" rc.conf(5) variables for per-jail configuration are automatically converted to /var/run/jail.<jname>.conf before the jail(8) utility is invoked, so the new jail.conf(5) syntax is used;
- Most of the ATF tools and the _atf user have been removed;

Users have been encouraged to test the distribution and report any problems they find. The official [changelog][1] comes with a complete list of fixes and modifications. Download FreeBSD 10.0 Beta 1 right now from Softpedia.

Remember that this is a development release and it should NOT be installed on production machines. It is intended to be used for testing purposes only.

--------------------------------------------------------------------------------

via: http://news.softpedia.com/news/FreeBSD-10-0-Beta-1-Available-for-Download-and-Testing-391246.shtml

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

[1]:http://lists.freebsd.org/pipermail/freebsd-current/2013-October/045524.html

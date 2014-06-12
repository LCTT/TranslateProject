Dpkg Vulnerabilities Closed in Ubuntu 14.04
================================================================================
![](http://i1-news.softpedia-static.com/images/news2/Dpkg-Vulnerabilities-Closed-in-Ubuntu-14-04-446282-2.jpg)

**Canonical has announced that a dpkg vulnerability in its Ubuntu 14.04 LTS, Ubuntu 13.10, Ubuntu 12.10, Ubuntu 12.04 LTS, and Ubuntu 10.04 LTS operating systems has been corrected.**

The company has just released a new update for the dpkg package, fixing a problem with this very important software that is used in all Ubuntu versions.

“It was discovered that dpkg incorrectly handled certain patches when unpacking source packages. If a user or an automated system were tricked into unpacking a specially crafted source package, a remote attacker could modify files outside the target unpack directory, leading to a denial of service or potentially gaining access to the system,” reads the security notice.

For a more detailed description of the problems, you can see Canonical's [security notification][1]. Users have been advised to upgrade their systems as soon as possible.

The flaws can be fixed if you upgrade your system(s) to the latest libdpkg-perl packages specific to each distribution. To apply the patch, run the Update Manager application.

In general, a standard system update will make all the necessary changes and users won't have to restart the PC or the laptop in order to apply the patch. This update can also be performed from the terminal, with the apt-get dist-upgrade command.

--------------------------------------------------------------------------------

via: http://news.softpedia.com/news/Dpkg-Vulnerabilities-Closed-in-Ubuntu-14-04-446282.shtml

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://www.ubuntu.com/usn/usn-2242-1/
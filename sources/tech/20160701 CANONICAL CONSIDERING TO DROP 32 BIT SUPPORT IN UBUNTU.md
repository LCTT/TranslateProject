(翻译中 by runningwater)
CANONICAL CONSIDERING TO DROP 32 BIT SUPPORT IN UBUNTU
========================================================

![](https://itsfoss.com/wp-content/uploads/2016/06/Ubuntu-32-bit-goes-for-a-toss-.jpg)

Yesterday, developer [Dimitri John Ledkov][1] wrote a message on the [Ubuntu Mailing list][2] calling for the end of i386 support by Ubuntu 18.10. Ledkov argues that more software is being developed with 64-bit support. He is also concerned that it will be difficult to provide security support for the aging i386 architecture.

Ledkov also argues that building i386 images is not free, but takes quite a bit of Canonical’s resources.

>Building i386 images is not “for free”, it comes at the cost of utilizing our build farm, QA and validation time. Whilst we have scalable build-farms, i386 still requires all packages, autopackage tests, and ISOs to be revalidated across our infrastructure. As well as take up mirror space & bandwidth.

Ledkov offers a plan where the 16.10, 17.04, and 17.10 versions of Ubuntu will continue to have i386 kernels, netboot installers, and cloud images, but drop i386 ISO for desktop and server. The 18.04 LTS would then drop support for i386 kernels, netboot installers, and cloud images, but still provide the ability for i386 programs to run on 64-bit architecture. Then, 18.10 would end the i386 port and limit legacy 32-bit applications to snaps, containers, and virtual machines.

Ledkov’s plan had not been accepted yet, but it shows a definite push toward eliminating 32-bit support.

### GOOD NEWS

Don’t despair yet. this will not affect the distros used to resurrect your old system. [Martin Wimpress][3], the creator of [Ubuntu MATE][4], revealed during a discussion on Googl+ that these changes will only affect mainline Ubuntu.

>The i386 archive will continue to exist into 18.04 and flavours can continue to elect to build i386 isos. There is however a security concern, in that some larger applications (Firefox, Chromium, LibreOffice) are already presenting challenges in terms of applying some security patches to older LTS releases. So flavours are being asked to be mindful of the support period they can reasonably be expected to support i386 versions for.

### THOUGHTS

I understand why they need to make this move from a security standpoint, but it’s going to make people move away from mainline Ubuntu to either one of the flavors or a different architecture. Thankfully, we have alternative [lightweight Linux distributions][5].


--------------------------------------------------------------------------------

via: https://itsfoss.com/ubuntu-32-bit-support-drop/?utm_source=feedburner&utm_medium=feed&utm_campaign=Feed%3A+ItsFoss+%28Its+FOSS%21+An+Open+Source+Blog%29

作者：[John Paul][a]
译者：[runningwater](https://github.com/runningwater)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/john/
[1]: https://plus.google.com/+DimitriJohnLedkov
[2]: https://lists.ubuntu.com/archives/ubuntu-devel-discuss/2016-June/016661.html
[3]: https://twitter.com/m_wimpress
[4]: http://ubuntu-mate.org/
[5]: https://itsfoss.com/lightweight-linux-beginners/

Debian dropping the Linux Standard Base
=======================================

The Linux Standard Base (LSB) is a [specification][1] that purports to define the services and application-level ABIs that a Linux distribution will provide for use by third-party programs.  But some in the Debian project are questioning the value of maintaining LSB compliance—it has become, they say, a considerable amount of
work for little measurable benefit.

The LSB was first released in 2001, and was modeled to a degree on the [POSIX][2] and [Single UNIX Specification][3] standards.  Today, the LSB is maintained by a [working group][4] at the Linux Foundation. The most recent release was [LSB 5.0][5] in June 2015.  It defines five LSB modules (Core, Desktop, Languages, Imaging, and Trial Use).

The bulk of each module consists of a list of required libraries and the mandatory version for each, plus a description of the public functions and data definitions for each library.  Other contents of the modules include naming and organizational specifications, such as the filesystem layout in the [Filesystem Hierarchy Standard (FHS)][6] or directory specifications like the Freedesktop [XDG Base Directory][7] specification.

In what appears to be sheer coincidence, during the same week that LSB 5.0 was released, a discussion arose within the Debian project as to whether or not maintaining LSB compliance was a worthwhile pursuit for Debian.  After LSB compliance was mentioned in passing in another thread, Didier Raboud took the opportunity to [propose][8] scaling back Debian's compliance efforts to the bare minimum.  As it stands today, he said, Debian's `lsb-*` meta-packages attempt to require the correct versions of the libraries mentioned in the standard, but no one is actually checking that all of the symbols and data definitions are met as aresult.

Furthermore, the LSB continues to grow; the 4.1 release (the most recent when Debian "jessie" was released) consisted of "*1493 components, 1672 libs, 38491 commands, 30176 classes and 716202 interfaces*," he said.  No one seems interested in checking those details in the Debian packages, he noted, adding that "*I've held an LSB BoF last year at DebConf, and discussed src:lsb with various people back then, and what I took back was 'roughly no one cares'.*"  Just as importantly, though, the lack of interest does not seem to be limited to Debian:

	The crux of the issue is, I think, whether this whole game is worth the work: I am yet to hear about software distribution happening through LSB packages. There are only _8_ applications by 6 companies on the LSB certified applications list, of which only one is against LSB >= 4.

Raboud proposed that Debian drop everything except for the [lsb-base][9] package (which currently includes a small set of shell functions for use by the init system) and the [lsb-release][10] package (which provides a simple tool that users can use to query the identity of the distribution and what level of LSB compliance it advertises).

In a follow-up [message][11],he noted that changing the LSB to be, essentially, "*whatever Debian as well as all other actors in the FLOSS world are _actually_ doing*" might make the standard—and the effort to support it in Debian—more valuable.  But here again, he questioned whether anyone was interested in pursuing that objective.

If his initial comments about lack of interest in LSB were not evidence enough, a full three months then went by with no one offering any support for maintaining the LSB-compliance packages and two terse votes in favor of dropping them.  Consequently, on September 17, Raboud [announced][12] that he had gutted the `src:lsb` package (leaving just `lsb-base` and `lsb-release` as described) and uploaded it to the "unstable" archive.  That minimalist set of tools will allow an interested user to start up the next Debian release and query whether or not it is LSB-compliant—and the answer will be "no."

Raboud added that Debian does still plan to maintain FHS compliance, even though it is dropping LSB compliance:

	But Debian's not throwing all of the LSB overboard: we're still firmly standing behind the FHS (version 2.3 through Debian Policy; although 3.0 was released in August this year) and our SysV init scripts mostly conform to LSB VIII.22.{2-8}. But don't get me wrong, this src:lsb upload is an explicit move away from the LSB.

After the announcement, Nikolaus Rath [replied][13] that some proprietary applications expect `ld-lsb.so*` symbolic links to be present in `/lib` and `/lib64`, and that those symbolic links had been provided by the `lsb-*` package set.  Raboud [suggested][14] that the links should be provided by the `libc6` package instead; package maintainer Aurelien Jarno [said][15] he would accept such a patch if it was provided.

The only remaining wrinkle, it seems, is that there are some printer-driver packages that expect some measure of LSB compliance. Raboud had noted in his first message that [OpenPrinting][16] drivers were the only example of LSB-compliant packages he had seen actually distributed. Michael Biebl [noted][17] that there was one such driver package in the main archive; Raboud [replied][18] that he believed the package in question ought to be moved to the non-free repository anyway, since it contained a binary driver.

With that, the issue appears to be settled, at least for the current Debian development cycle.  What will be more interesting, naturally, will be to see what effect, if any, the decision has on broader LSB acceptance.  As Raboud alluded to, the number of distributions that are certified as LSB-compliant is [small][19]. It is hard not to notice that those distributions are largely of the "enterprise" variety.  

Perhaps, then, LSB compliance is still important to some business sectors, but it is hard to know how many customers of those enterprise distributions genuinely care about the LSB certification stamp.  If Debian's experience is anything to go by, however, general interest in such certification may be in steep decline.

---

via：https://lwn.net/Articles/658809/

作者：Nathan Willis
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，
[Linux中国](https://linux.cn/) 荣誉推出


[1]:http://refspecs.linuxfoundation.org/lsb.shtml
[2]:https://en.wikipedia.org/wiki/POSIX
[3]:https://en.wikipedia.org/wiki/Single_UNIX_Specification
[4]:http://www.linuxfoundation.org/collaborate/workgroups/lsb
[5]:http://www.linuxfoundation.org/collaborate/workgroups/lsb/lsb-50
[6]:http://www.linuxfoundation.org/collaborate/workgroups/lsb/fhs
[7]:http://standards.freedesktop.org/basedir-spec/basedir-spec-0.6.html
[8]:https://lwn.net/Articles/658838/
[9]:https://packages.debian.org/sid/lsb-base
[10]:https://packages.debian.org/sid/lsb-release
[11]:https://lwn.net/Articles/658842/
[12]:/Articles/658843/
[13]:/Articles/658846/
[14]:/Articles/658847/
[15]:/Articles/658848/
[16]:http://www.linuxfoundation.org/collaborate/workgroups/openprinting/
[17]:/Articles/658844/
[18]:/Articles/658845/



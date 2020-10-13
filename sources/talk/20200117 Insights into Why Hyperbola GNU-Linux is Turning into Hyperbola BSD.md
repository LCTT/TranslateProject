[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Insights into Why Hyperbola GNU/Linux is Turning into Hyperbola BSD)
[#]: via: (https://itsfoss.com/hyperbola-linux-bsd/)
[#]: author: (John Paul https://itsfoss.com/author/john/)

Insights into Why Hyperbola GNU/Linux is Turning into Hyperbola BSD
======

In late December 2019, [Hyperbola][1] [announced][2] that they would be making major changes to their project. They have decided to drop the Linux kernel in favor of forking the OpenBSD kernel. This announcement only came months after Project Trident [announced][3] that they were going in the opposite direction (from BSD to Linux).

Hyperbola also plans to replace all software that is not GPL v3 compliant with new versions that are.

To get more insight into the future of their new project, I interviewed **Andre, co-founder of Hyperbola**.

### Why Hyperbola GNU/Linux Turned into Hyperbola BSD

![][4]

_**It’s FOSS: In your announcement, you state that the Linux kernel is “rapidly proceeding down an unstable path”. Could you explain what you mean by that?**_

**Andre:** First of all, it’s including the adaption of DRM features such as [HDCP][5] (High-bandwidth Digital Content Protection). Currently there is an option to disable it at build time, however there isn’t a policy that guarantees us that it will be optional forever.

Historically, some features began as optional ones until they reached total functionality. Then they became forced and difficult to patch out. Even if this does not happen in the case of HDCP, we remain cautious about such implementations.

Another of the reasons is that the _**Linux kernel is no longer getting proper hardening**_. [Grsecurity][6] stopped offering public patches several years ago, and we depended on that for our system’s security. Although we could use their patches still for a very expensive subscription, the subscription would be terminated if we chose to make those patches public.

Such restrictions goes against the FSDG principles that require us to provide full source code, deblobbed, and unrestricted, to our users.

KSPP is a project that was intended to upstream Grsec into the kernel, but thus far it has not come close to reaching Grsec / PaX level of kernel hardening. There also has not been many recent developments, which leads us to believe it is now an inactive project for the most part.

Lastly, the interest in [allowing Rust modules][7] into the kernel are a problem for us, due to Rust trademark restrictions which prevent us from applying patches in our distribution without express permission. We patch to remove non-free software, unlicensed files, and enhancements to user-privacy anywhere it is applicable. We also expect our users to be able to re-use our code without any additional restrictions or permission required.

This is also in part why we use UXP, a fully free browser engine and application toolkit without Rust, for our mail and browser applications.

Due to these restrictions, and the concern that it may at some point become a forced build-time dependency for the kernel we needed another option.

_**It’s FOSS: You also said in the announcement that you would be forking the OpenBSD kernel. Why did you pick the OpenBSD kennel over the FreeBSD, the DragonflyBSD kernel or the MidnightBSD kernel?**_

**Andre:** [OpenBSD][8] was chosen as our base for hard-forking because it’s a system that has always had quality code and security in mind.

Some of their ideas which greatly interested us were new system calls, including pledge and unveil which adds additional hardening to userspace and the removal of the systrace system policy-enforcement tool.

They also are known for [Xenocara][9] and [LibreSSL][10], both of which we had already been using after porting them to [GNU/Linux-libre][11]. We found them to be well written and generally more stable than Xorg/OpenSSL respectively.

None of the other BSD implementations we are aware of have that level of security. We also were aware [LibertyBSD][12] has been working on liberating the OpenBSD kernel, which allowed us to use their patches to begin the initial development.

_**It’s FOSS: Why fork the kernel in the first place? How will you keep the new kernel up-to-date with newer hardware support?**_

**Andre:** The kernel is one of the most important parts of any operating system, and we felt it is critical to start on a firm foundation moving forward.

For the first version we plan to keep in synchronization with OpenBSD where it is possible. In future versions we may adapt code from other BSDs and even the Linux kernel where needed to keep up with hardware support and features.

We are working in coordination with [Libreware Group][13] (our representative for business activities) and have plans to open our foundation soon.

This will help to sustain development, hire future developers and encourage new enthusiasts for newer hardware support and code. We know that deblobbing isn’t enough because it’s a mitigation, not a solution for us. So, for that reason, we need to improve our structure and go to the next stage of development for our projects.

_**It’s FOSS: You state that you plan to replace the parts of the OpenBSD kernel and userspace that are not GPL compatible or non-free with those that are. What percentage of the code falls into the non-GPL zone?**_

**Andre:** It’s around 20% in the OpenBSD kernel and userspace.

Mostly, the non-GPL compatible licensed parts are under the Original BSD license, sometimes called the “4-clause BSD license” that contains a serious flaw: the “obnoxious BSD advertising clause”. It isn’t fatal, but it does cause practical problems for us because it generates incompatibility with our code and future development under GPLv3 and LGPLv3.

The non-free files in OpenBSD include files without an appropriate license header, or without a license in the folder containing a particular component.

If those files don’t contain a license to give users the four essential freedoms or if it has not been explicitly added in the public domain, it isn’t free software. Some developers think that code without a license is automatically in the public domain. That isn’t true under today’s copyright law; rather, all copyrightable works are copyrighted by default.

The non-free firmware blobs in OpenBSD include various hardware firmwares. These firmware blobs occur in Linux kernel also and have been manually removed by the Linux-libre project for years following each new kernel release.

They are typically in the form of a hex encoded binary and are provided to kernel developers without source in order to provide support for proprietary-designed hardware. These blobs may contain vulnerabilities or backdoors in addition to violating your freedom, but no one would know since the source code is not available for them. They must be removed to respect user freedom.

_**It’s FOSS: I was talking with someone about HyperbolaBSD and they mentioned [HardenedBSD][14]. Have you considered HardenedBSD?**_

**Andre:** We had looked into HardenedBSD, but it was forked from FreeBSD. FreeBSD has a much larger codebase. While HardenedBSD is likely a good project, it would require much more effort for us to deblob and verify licenses of all files.

We decided to use OpenBSD as a base to fork from instead of FreeBSD due to their past commitment to code quality, security, and minimalism.

_**It’s FOSS: You mentioned UXP (or [Unified XUL Platform][15]). It appears that you are using [Moonchild’s fork of the pre-Servo Mozilla codebase][16] to create a suite of applications for the web. Is that about the size of it?**_

**Andre:** Yes. Our decision to use UXP was for several reasons. We were already rebranding Firefox as Iceweasel for several years to remove DRM, disable telemetry, and apply preset privacy options. However, it became harder and harder for us to maintain when Mozilla kept adding anti-features, removing user customization, and rapidly breaking our rebranding and privacy patches.

After FF52, all XUL extensions were removed in favor of WebExt and Rust became enforced at compile time. We maintain several XUL addons to enhance user-privacy/security which would no longer work in the new engine. We also were concerned that the feature limited WebExt addons were introducing additional privacy issues. E.g. each installed WebExt addon contains a UUID which can be used to uniquely and precisely identify users (see [Bugzilla 1372288][17]).

After some research, we discovered UXP and that it was regularly keeping up with security fixes without rushing to implement new features. They had already disabled telemetry in the toolkit and remain committed to deleting all of it from the codebase.

We knew this was well-aligned with our goals, but still needed to apply a few patches to tweak privacy settings and remove DRM. Hence, we started creating our own applications on top of the toolkit.

This has allowed us to go far beyond basic rebranding/deblobbing as we were doing before and create our own fully customized XUL applications. We currently maintain [Iceweasel-UXP][18], [Icedove-UXP][19] and [Iceape-UXP][20] in addition to sharing toolkit improvements back to UXP.

_**It’s FOSS: In a [forum post][21], I noticed mentions of HyperRC, HyperBLibC, and hyperman. Are these forks or rewrites of current BSD tools to be GPL compliant?**_

**Andre:** They are forks of existing projects.

Hyperman is a fork of our current package manager, pacman. As pacman does not currently work on BSD, and the minimal support it had in the past was removed in recent versions, a fork was required. Hyperman already has a working implementation using LibreSSL and BSD support.

HyperRC will be a patched version of OpenRC init. HyperBLibC will be a fork from BSD LibC.

_**It’s FOSS: Since the beginning of time, Linux has championed the GPL license and BSD has championed the BSD license. Now, you are working to create a BSD that is GPL licensed. How would you respond to those in the BSD community who don’t agree with this move?**_

**Andre:** We are aware that there are disagreements between the GPL and BSD world. There are even disagreements over calling our previous distribution “GNU/Linux” rather than simply “Linux”, since the latter definition ignores that the GNU userspace was created in 1984, several years prior to the Linux kernel being created by Linus Torvalds. It was the two different software combined that make a complete system.

Some of the primary differences from BSD, is that the GPL requires that our source code must be made public, including future versions, and that it can only be used in tandem with compatibly licensed files. BSD systems do not have to share their source code publicly, and may bundle themselves with various licenses and non-free software without restriction.

Since we are strong supporters of the Free Software Movement and wish that our future code remain in the public space always, we chose the GPL.

_**It’s FOSS: I know at this point you are just starting the process, but do you have any idea who you might have a usable version of HyperbolaBSD available?**_

**Andre:** We expect to have an alpha release ready by 2021 (Q3) for initial testing.

_**It’s FOSS: How long will you continue to support the current Linux version of Hyperbola? Will it be easy for current users to switch over to**_?

**Andre:** As per our announcement, we will continue to support Hyperbola GNU/Linux-libre until 2022 (Q4). We expect there to be some difficulty in migration due to ABI changes, but will prepare an announcement and information on our wiki once it is ready.

_**It’s FOSS: If someone is interested in helping you work on HyperbolaBSD, how can they go about doing that? What kind of expertise would you be looking for?**_

**Andre:** Anyone who is interested and able to learn is welcome. We need C programmers and users who are interested in improving security and privacy in software. Developers need to follow the FSDG principles of free software development, as well as the YAGNI principle which means we will implement new features only as we need them.

Users can fork our git repository and submit patches to us for inclusion.

_**It’s FOSS: Do you have any plans to support ZFS? What filesystems will you support?**_

**Andre:** [ZFS][22] support is not currently planned, because it uses the Common Development and Distribution License, version 1.0 (CDDL). This license is incompatible with all versions of the GNU General Public License (GPL).

It would be possible to write new code under GPLv3 and release it under a new name (eg. HyperZFS), however there is no official decision to include ZFS compatibility code in HyperbolaBSD at this time.

We have plans on porting BTRFS, JFS2, NetBSD’s CHFS, DragonFlyBSD’s HAMMER/HAMMER2 and the Linux kernel’s JFFS2, all of which have licenses compatible with GPLv3. Long term, we may also support Ext4, F2FS, ReiserFS and Reiser4, but they will need to be rewritten due to being licensed exclusively under GPLv2, which does not allow use with GPLv3. All of these file systems will require development and stability testing, so they will be in later HyperbolaBSD releases and not for our initial stable version(s).

* * *

I would like to thank Andre for taking the time to answer my questions and for revealing more about the future of HyperbolaBSD.

What are your thoughts on Hyperbola switching to a BSD kernel? What do you think about a BSD being released under the GPL? Please let us know in the comments below.

If you found this article interesting, please take a minute to share it on social media, Hacker News or [Reddit][23].

--------------------------------------------------------------------------------

via: https://itsfoss.com/hyperbola-linux-bsd/

作者：[John Paul][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/john/
[b]: https://github.com/lujun9972
[1]: https://www.hyperbola.info/
[2]: https://www.hyperbola.info/news/announcing-hyperbolabsd-roadmap/
[3]: https://itsfoss.com/bsd-project-trident-linux/
[4]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/01/hyperbola_linux_bsd.png?ssl=1
[5]: https://patchwork.kernel.org/patch/10084131/
[6]: https://grsecurity.net/
[7]: https://lwn.net/Articles/797828/
[8]: https://www.openbsd.org/
[9]: https://www.xenocara.org/
[10]: https://www.libressl.org/
[11]: https://en.wikipedia.org/wiki/Linux-libre
[12]: https://libertybsd.net/
[13]: https://en.libreware.info/
[14]: https://hardenedbsd.org/
[15]: http://thereisonlyxul.org/
[16]: https://github.com/MoonchildProductions/UXP
[17]: https://bugzilla.mozilla.org/show_bug.cgi?id=1372288
[18]: https://wiki.hyperbola.info/doku.php?id=en:project:iceweasel-uxp
[19]: https://wiki.hyperbola.info/doku.php?id=en:project:icedove-uxp
[20]: https://wiki.hyperbola.info/doku.php?id=en:project:iceape-uxp
[21]: https://forums.hyperbola.info/viewtopic.php?id=315
[22]: https://itsfoss.com/what-is-zfs/
[23]: https://reddit.com/r/linuxusersgroup

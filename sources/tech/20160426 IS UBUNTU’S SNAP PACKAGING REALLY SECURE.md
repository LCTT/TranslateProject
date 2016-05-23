IS UBUNTU’S SNAP PACKAGING REALLY SECURE
==========================================


The recent release of [Ubuntu 16.04 LTS has brought a number of new features][1], one of which we covered was the [inclusion of ZFS][2]. Another feature that many people have been talking about is the Snap package format. But according to one of the developers of [CoreOS][3], the Snap packages are not as safe as the claim.

### WHAT ARE SNAP PACKAGES?

Snap packages are inspired by containers. This new package format allows [developers to issue updates for applications running on Ubuntu Long-Term-Support (LTS) releases][4]. This gives users the option to run a stable operating system, but keep their applications updated. This is accomplished by including all of the application’s dependencies in the same package. This prevents the program from breaking when a dependency updates.

Another advantage of Snap packages is that the applications are isolated from the rest of the system. This means that if you change something with a Snap package, it will not affect the rest of the system. It also prevents other applications from accessing your private information, which makes it harder for hackers to get your data.

### BUT WAIT…

According to [Matthew Garrett][5], Snap can’t quite deliver on the last promise. Garret works as a Linux kernel developer and security developer at CoreOS, so he should know what he’s talking about.

[According to Garret][6], “Any Snap package you install is completely capable of copying all your private data to wherever it wants with very little difficulty.”

[ZDnet][7] reported:

>*“To prove his point, he built a proof-of-concept attack package in Snap, which first shows an “adorable” teddy bear and then logs keystrokes from Firefox and could be used to steal private SSH keys. The PoC actually injects a harmless command, but could be tweaked to include a cURL session to steal SSH keys.”*

### BUT WAIT A LITTLE MORE…

Is it really that Snap has security flaws? Apparently not so.

Garret himself said that this problem was caused by the X11 window system and did not affect mobile devices that use Mir. So, it is the flaw in X11 that does it. It’s not Snap itself.

>how X11 trusts applications is a well-known security risk. Snap doesn’t change X11’s trust model, so the fact that applications can see what other applications are doing isn’t a weakness in the new package format, but rather X11’s.

Garrett is just actually trying to show that when Canonical is all praises for Snap and its security; Snap applications are not fully sandboxed. They are as risky as any other binaries.

Keeping the fact in mind that Ubuntu 16.04 still uses X11 display, and not Mir, downloading and installing Snap packages from unknown sources might be harmful. But that’s the case with any other packaging, isn’t it?

In related articles, you should check out [how to use Snap packages in Ubuntu 16.04][8]. And do let us know of your views on Snap and its security.

----------
via: http://itsfoss.com/snap-package-securrity-issue/?utm_source=feedburner&utm_medium=feed&utm_campaign=Feed%3A+ItsFoss+%28Its+FOSS%21+An+Open+Source+Blog%29

作者：[ John Paul][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: http://itsfoss.com/author/john/
[1]: http://itsfoss.com/features-ubuntu-1604/
[2]: http://itsfoss.com/oracle-canonical-lawsuit/
[3]: https://en.wikipedia.org/wiki/CoreOS
[4]: https://insights.ubuntu.com/2016/04/13/snaps-for-classic-ubuntu/
[5]: https://mjg59.dreamwidth.org/l
[6]: https://mjg59.dreamwidth.org/42320.html
[7]: http://www.zdnet.com/article/linux-expert-matthew-garrett-ubuntu-16-04s-new-snap-format-is-a-security-risk/
[8]: http://itsfoss.com/use-snap-packages-ubuntu-16-04/

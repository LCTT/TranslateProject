MidnightBSD Hits 1.0! Checkout What’s New
======
A couple days ago, Lucas Holt announced the release of MidnightBSD 1.0. Let’s take a quick look at what is included in this new release.

### What is MidnightBSD?

![MidnightBSD][1]

[MidnightBSD][2] is a fork of FreeBSD. Lucas created MightnightBSD to be an option for desktop users and for BSD newbies. He wanted to create something that would allow people to quickly get a desktop experience on BSD. He believed that other options had too much of a focus on the server market.

### What is in MidnightBSD 1.0?

According to the [release notes][3], most of the work in 1.0 went towards updating the base system, improving the package manager and updating tools. The new release is compatible with FreeBSD 10-Stable.

Mports (MidnightBSD’s package management system) has been upgraded to support installing multiple packages with one command. The `mport upgrade` command has been fixed. Mports now tracks deprecated and expired packages. A new package format was also introduced.

<https://www.youtube.com/embed/-rlk2wFsjJ4>

Other changes include:

  * [ZFS][4] is now supported as a boot file system. Previously, ZFS could only be used for additional storage.
  * Support for NVME SSDs
  * AMD Ryzen and Radeon support have been improved.
  * Intel, Broadcom, and other drivers updated.
  * bhyve support has been ported from FreeBSD
  * The sensors framework was removed because it was causing locking issues.
  * Sudo was removed and replaced with [doas][5] from OpenBSD.
  * Added support for Microsoft hyper-v



### Before you upgrade…

If you are a current MidnightBSD user or are thinking of trying out the new release, it would be a good idea to wait. Lucas is currently rebuilding packages to support the new package format and tooling. He also plans to upgrade packages and ports for the desktop environment over the next couple of months. He is currently working on porting Firefox 52 ESR because it is the last release that does not require Rust. He also hopes to get a newer version of Chromium ported to MidnightBSD. I would recommend keeping an eye on the MidnightBSD [Twi][6][t][6][ter][6] feed.

### What happened to 0.9?

You might notice that the previous release of MidnightBSD was 0.8.6. Now, you might be wondering “Why the jump to 1.0”? According to Lucas, he ran into several issues while developing 0.9. In fact, he restarted it several times. He ending up taking CURRENT in a different direction than the 0.9 branch and it became 1.0. Some packages also had an issue with the 0.* numbering system.

### Help Needed

Currently, the MidnightBSD project is the work of pretty much one guy, Lucas Holt. This is the main reason why development has been slow. If you are interested in helping out, you can contact him on [Twitter][6].

In the [release announcement video][7]. Lucas said that he had encountered problems with upstream projects accepting patches. They seem to think that MidnightBSD is too small. This often means that he has to port an application from scratch.

### Thoughts

I have a thing for the underdog. Of all the BSDs that I have interacted with, that monicker fits MidnightBSD the most. One guy trying to create an easy desktop experience. Currently, there is only one other BSD trying to do something similar: Project Trident. I think that this is a real barrier to BSDs success. Linux succeeds because people can quickly and easily install it. Hopefully, MidnightBSD does that for BSD, but right now it has a long way to go.

Have you ever used MidnightBSD? If not, what is your favorite BSD? What other BSD topics should we cover? Let us know in the comments below.

If you found this article interesting, please take a minute to share it on social media, Hacker News or [Reddit][8].

--------------------------------------------------------------------------------

via: https://itsfoss.com/midnightbsd-1-0-release/

作者：[John Paul][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:  https://itsfoss.com/author/john/
[b]: https://github.com/lujun9972
[1]: https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2018/10/midnightbsd-wallpaper.jpeg
[2]: https://www.midnightbsd.org/
[3]: https://www.midnightbsd.org/notes/
[4]: https://itsfoss.com/what-is-zfs/
[5]: https://man.openbsd.org/doas
[6]: https://twitter.com/midnightbsd
[7]: https://www.youtube.com/watch?v=-rlk2wFsjJ4
[8]: http://reddit.com/r/linuxusersgroup

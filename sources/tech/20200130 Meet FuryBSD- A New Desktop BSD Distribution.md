[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Meet FuryBSD: A New Desktop BSD Distribution)
[#]: via: (https://itsfoss.com/furybsd/)
[#]: author: (John Paul https://itsfoss.com/author/john/)

Meet FuryBSD: A New Desktop BSD Distribution
======

In the last couple of months, a few new desktop BSD have been announced. There is [HyperbolaBSD which was Hyperbola GNU/Linux][1] previously. Another new entry in the [BSD][2] world is [FuryBSD][3].

### FuryBSD: A new BSD distribution

![][4]

At its heart, FuryBSD is a very simple beast. According to [the site][5], “FuryBSD is a back to basics lightweight desktop distribution based on stock FreeBSD.” It is basically FreeBSD with a desktop environment pre-configured and several apps preinstalled. The goal is to quickly get a FreeBSD-based system running on your computer.

You might be thinking that this sounds a lot like a couple of other BSDs that are available, such as [NomadBSD][6] and [GhostBSD][7]. The major difference between those BSDs and FuryBSD is that FuryBSD is much closer to stock FreeBSD. For example, FuryBSD uses the FreeBSD installer, while others have created their own installers and utilities.

As it states on the [site][8], “Although FuryBSD may resemble past graphical BSD projects like PC-BSD and TrueOS, FuryBSD is created by a different team and takes a different approach focusing on tight integration with FreeBSD. This keeps overhead low and maintains compatibility with upstream.” The lead dev also told me that “One key focus for FuryBSD is for it to be a small live media with a few assistive tools to test drivers for hardware.”

Currently, you can go to the [FuryBSD homepage][3] and download either an XFCE or KDE LiveCD. A GNOME version is in the works.

### Who’s is Behind FuryBSD?

The lead dev behind FuryBSD is [Joe Maloney][9]. Joe has been a FreeBSD user for many years. He contributed to other BSD projects, such as PC-BSD. He also worked with Eric Turgeon, the creator of GhostBSD, to rewrite the GhostBSD LiveCD. Along the way, he picked up a better understanding of BSD and started to form an idea of how he would make a distribution on his own.

Joe is joined by several other devs who have also spent many years in the BSD world, such as Jaron Parsons, Josh Smith, and Damian Szidiropulosz.

### The Future for FuryBSD

At the moment, FuryBSD is nothing more than a pre-configured FreeBSD setup. However, the devs have a [list of improvements][5] that they want to make going forward. These include:

  * A sane framework for loading, 3rd party proprietary drivers graphics, wireless
  * Cleanup up the LiveCD experience a bit more to continue to make it more friendly
  * Printing support out of box
  * A few more default applications included to provide a complete desktop experience
  * Integrated [ZFS][10] replication tools for backup and restore
  * Live image persistence options
  * A custom pkg repo with sane defaults
  * Continuous integration for applications updates
  * Quality assurance for FreeBSD on the desktop
  * Tailored artwork, color scheming, and theming
  * Directory services integration
  * Security hardening



The devs make it quite clear that any changes they make will have a lot of thought and research behind them. They don’t want to compliment a feature, only to have to remove it or change it when it breaks something.

![FuryBSD desktop][11]

### How You Can Help FuryBSD?

At this moment the project is still very young. Since all projects need help to survive, I asked Joe what kind of help they were looking for. He said, “We could use help [answering questions on the forums][12], [GitHub][13] tickets, help with documentation are all needed.” He also said that if people wanted to add support for other desktop environments, pull requests are welcome.

### Final Thoughts

Although I have not tried it yet, I have a good feeling about FuryBSD. It sounds like the project is in capable hands. Joe Maloney has been thinking about how to make the best BSD desktop experience for over a decade. Unlike majority of Linux distros that are basically a rethemed Ubuntu, the devs behind FuryBSD know what they are doing and they are choosing quality over the fancy bells and whistles.

What are your thoughts on this new entry into the every growing desktop BSD market? Have you tried out FuryBSD or will you give it a try? Please let us know in the comments below.

If you found this article interesting, please take a minute to share it on social media, Hacker News or [Reddit][14].

--------------------------------------------------------------------------------

via: https://itsfoss.com/furybsd/

作者：[John Paul][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/john/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/hyperbola-linux-bsd/
[2]: https://itsfoss.com/bsd/
[3]: https://www.furybsd.org/
[4]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/01/fury-bsd.jpg?ssl=1
[5]: https://www.furybsd.org/manifesto/
[6]: https://itsfoss.com/nomadbsd/
[7]: https://ghostbsd.org/
[8]: https://www.furybsd.org/furybsd-video-overview-at-knoxbug/
[9]: https://github.com/pkgdemon
[10]: https://itsfoss.com/what-is-zfs/
[11]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/01/FuryBSDS-desktop.jpg?resize=800%2C450&ssl=1
[12]: https://forums.furybsd.org/
[13]: https://github.com/furybsd
[14]: https://reddit.com/r/linuxusersgroup

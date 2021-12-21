[#]: subject: "Pop!_OS is Moving PPA Repositories to its Own System: Is System76 Considering to Switch its Ubuntu Base?"
[#]: via: "https://news.itsfoss.com/pop-os-ppa-repo-move/"
[#]: author: "Ankush Das https://news.itsfoss.com/author/ankush/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Pop!_OS is Moving PPA Repositories to its Own System: Is System76 Considering to Switch its Ubuntu Base?
======

Pop!_OS has been making news for some of its recent development decisions.

For instance, they introduced a [customized GNOME-based desktop environment experience with COSMIC][1]. Moving forward, they decided to [create their desktop environment from scratch based on Rust][2].

Overall, Pop!_OS has been putting a lot of effort into providing a unique desktop experience keeping all the essential factors in mind like user-friendliness, resource efficiency, and security.

Now, in a [tweet][3], a Pop!_OS user noticed that System76 had replaced the PPA repositories with its self-hosted APT system in Pop!_OS 21.10 beta, instead of Canonical’s launchpad.

And, to that, _System76’s Principal Engineer_, **Jeremy Soller**, responded with a confirmation sharing more details.

### Moving the Build System and Repositories Away From Launchpad

![][4]

Pop!_OS aims to evolve as a modern Linux distribution, which isn’t just similar to its Ubuntu base but does a lot of things better.

And, moving the repositories away from the launchpad is one of the key changes. Switching the build system and APT repos to its own system should give System76 better control of package updates while reducing the build, test, and release time.

Considering System76 has managed to provide the latest and greatest kernels (faster than most mainstream desktop Linux distributions), it is no surprise that you could expect speedier package updates to popular applications as well.

![][5]

Not just for the distro users, it should be good news for System76 customers to realize that Pop!_OS is eventually turning into the Apple of Linux world (in a good way).

In my opinion, having control of the ecosystem should help provide a consistent user experience.

And that is what new Linux desktop users need.

### Is System76 Considering to Change its Ubuntu Base?

No. As mentioned in the tweet, this move does not relate to changing bases.

> Pop switched the build system and repositories away from <https://t.co/sKE1Zdgzpo> to our own system <https://t.co/LA3S0N4lQD> for 21.10 in order to improve our control of package updates and reduce the time to build, test, and release them. It is not related to changing bases. <https://t.co/N0S8fSgbgg>
>
> — Jeremy Soller (@jeremy_soller) [December 3, 2021][6]

But, I would not rule out the possibility of trying out another base as an experiment because they have been scaling up their experiments.

*What do you think about Pop!_OS making these changes for its upcoming Pop!_OS 21.10 release?

Feel free to let me know your thoughts in the comments below.*

#### Big Tech Websites Get Millions in Revenue, It's FOSS Got You!

If you like what we do here at It's FOSS, please consider making a donation to support our independent publication. Your support will help us keep publishing content focusing on desktop Linux and open source software.

I'm not interested

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/pop-os-ppa-repo-move/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://news.itsfoss.com/cosmic-desktop-pop-os/
[2]: https://news.itsfoss.com/pop-os-cosmic-rust/
[3]: https://twitter.com/david_drapeau/status/1466787174154657795
[4]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjQ3NSIgd2lkdGg9IjczNiIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB2ZXJzaW9uPSIxLjEiLz4=
[5]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjE3OSIgd2lkdGg9IjYyOCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB2ZXJzaW9uPSIxLjEiLz4=
[6]: https://twitter.com/jeremy_soller/status/1466789512072228867?ref_src=twsrc%5Etfw

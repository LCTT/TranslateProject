[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (IBM’s Red Hat Just Killed CentOS as we Know it: With CentOS Stream, Stability Goes out of the Door)
[#]: via: (https://itsfoss.com/centos-stream-fiasco/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

IBM’s Red Hat Just Killed CentOS as we Know it: With CentOS Stream, Stability Goes out of the Door
======

CentOS is regarded as a stable, secure and free Linux distribution for servers. The stability part of it is being jeopardized thanks to the [latest changes made to this project][1] by IBM-owned Red Hat. Here’s a quick summary:

  * Focus shifts from CentOS Linux, the rebuild of Red Hat Enterprise Linux (RHEL) to CentOS Stream, which tracks just _ahead_ of a current RHEL release.
  * CentOS Linux 8, as a rebuild of RHEL 8, will end at the end of 2021.
  * After that, the rolling release CentOS Stream becomes the identity of CentOS project. There will be no CentOS 9 based on RHEL 9 in the future.
  * CentOS Linux 7 will continue its lifecycle and will end in 2024.



Let’s go in detail.

### Before CentOS Stream, learn a little background knowledge of Red Hat, CentOS and Fedora

Let me explain it to those who are unaware. [Red Hat Enterprise Linux][2] (RHEL) is a commercial Linux distribution developed by [Red Hat][3] and it offers both servers and desktop editions. They have strict guidelines to protect Red Hat trademark.

Red Hat has two main community projects on Linux distribution: [Fedora][4] and [CentOS][5].

![Situation until now][6]

For years, Fedora worked as upstream for RHEL. This means that new features and changes get introduced in Fedora first and some of them get to be included in the next release of RHEL. In loose terms, Fedora works as testing ground for Red Hat. At least that’s what it used to be until a couple of years ago.

CentOS, on the other hand, is/was a downstream community project. Whatever changes RHEL introduced also get to be included in CentOS. A new version of RHEL released? A new version of CentOS would follow a couple of months later.

Basically, CentOS is a clone of RHEL with most of RHEL’s benefits but without RHEL’s cost. So far, it was regarded as the paying customers get the features first in RHEL and then the community users get them through CentOS.

### CentOS Stream: What started as an experiment, becomes the future

![][7]

In September 2019, [Red Hat announced CentOS Stream][8]. It is a rolling release version of CentOS.

The idea was to use CentOS Stream as a midstream between the upstream development in Fedora and downstream development in Red Hat Enterprise Linux (RHEL).

So, Fedora is testing ground for the future **major version** release of RHEL and CentOS. At the same time, CentOS Stream clears the path to contribute to future **minor release** to RHEL and CentOS.

Sounds like a good idea? It was until Red Hat announced that in the future CentOS will only exist as CentOS Stream.

The latest stable release CentOS 8 suddenly has its life cut short to the end of 2021 instead of the earlier projected date of May 2029. The older CentOS 7 will still be supported till 2024.

Do you see the problem with this change? You deployed CentOS 8 thinking that you’ll get a stable production server till 2029. Instead, it gets discontinued next year and you are forced choose between opting for CentOS Stream or replace it with other distributions like Debian or Ubuntu.

This means while the paid RHEL users will enjoy the well-tested stable server, community members will have no option other than using a not-so-stable rolling release distribution.

Trivia

CentOS was not started by Red Hat. It was a community project since the beginning. After Red Hat started sponsoring the development, the trademark and ownership of CentOS was transferred to Red Hat in 2014, around 10 years after its creation.

### Corporate interference often spell doom

As Nixcraft observes, when a big corporate enters the scene, it may not always bring good news. Community projects often take the hit.

> Oracle buys Sun: Solaris Unix, Sun servers/workstation, and MySQL went to /dev/null.
>
> IBM buys Red Hat: CentOS is going to &gt;/dev/null.
>
> Note to self: If a big vendor such as Oracle, IBM, MS, and others buys your fav software, start the migration procedure ASAP.
>
> — The Best Linux Blog In the Unixverse (@nixcraft) [December 8, 2020][9]

Red Hat had been a successful company for a long time. It was the [first billion dollar open source company][10]. Red Hat also put itself as industry leader with its focus on containers and orchestration platforms.

A cash-rich but struggling [IBM bought Red Hat for $34 billion][11]. It remains one of the biggest tech buy-outs in the history.

IBM is directing Red Hat and Red Hat is directing CentOS. The move to convert stable CentOS to CentOS Stream will discourage the use of freely available CentOS server. [CentOS is the second most popular choice for server][12] and some of its users may opt for RHEL licenses. This will bring additional revenue to Red Hat.

### Red Hat wants to you trust CentOS Stream for your servers

[CentOS assures][13] that this move will not make CentOS Stream a RHEL beta test platform.

> CentOS Stream will be getting fixes and features ahead of RHEL. Generally speaking, we expect CentOS Stream to have fewer bugs and more runtime features than RHEL until those packages make it into the RHEL release

Red Hat also [suggests putting your faith in the CentOS Stream project][14]. It mentions that many enterprises are already using CentOS Stream for their servers.

> we’ve seen our ecosystem embrace CentOS Stream as a “rolling preview” of what’s next in RHEL, both in terms of kernels and features. **Facebook** runs millions of servers supporting its vast global social network, all of which have been migrated (or are migrating) to an operating system they derive from [CentOS Stream][15].

### What lies ahead?

It will be interesting to see how things develop in the future. For the moment, despite all the assurances, it looks like CentOS is becoming the beta of RHEL future releases.

The worst part is that Red Hat and CentOS didn’t bother to take users into confidence. At least they could have made these changes with CentOS 9. This sudden ending of CentOS 8 is a bad move. Imagine the situation where sysadmin(s) put effort to migrate from CentOS 7 to 8, only to realize that its support is ending 8 years earlier.

_**Update**: The original creator of CentOS is already working on creating a [RHEL fork called Rocky Linux][16] to fill the void left by CentOS Stream._

What do you think of the development? What’s your opinion on CentOS Stream?

--------------------------------------------------------------------------------

via: https://itsfoss.com/centos-stream-fiasco/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://blog.centos.org/2020/12/future-is-centos-stream/
[2]: https://www.redhat.com/en/technologies/linux-platforms/enterprise-linux
[3]: https://www.redhat.com/en
[4]: https://getfedora.org/
[5]: https://centos.org/
[6]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/12/redhat-fedora-centos.png?resize=800%2C450&ssl=1
[7]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/12/CentOS-Stream-fiasco.jpg?resize=800%2C450&ssl=1
[8]: https://www.redhat.com/en/blog/transforming-development-experience-within-centos
[9]: https://twitter.com/nixcraft/status/1336348208184741888?ref_src=twsrc%5Etfw
[10]: https://www.zdnet.com/article/red-hat-the-first-billion-dollar-linux-company-has-arrived
[11]: https://itsfoss.com/ibm-red-hat-acquisition/
[12]: https://www.datanyze.com/market-share/operating-systems--443/centos-market-share
[13]: https://centos.org/distro-faq/
[14]: https://www.redhat.com/en/blog/centos-stream-building-innovative-future-enterprise-linux
[15]: https://www.youtube.com/watch?v=EajAjFCZz4Q
[16]: https://news.itsfoss.com/rocky-linux-announcement/

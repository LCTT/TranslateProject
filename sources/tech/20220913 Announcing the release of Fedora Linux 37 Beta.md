[#]: subject: "Announcing the release of Fedora Linux 37 Beta"
[#]: via: "https://fedoramagazine.org/announcing-fedora-37-beta/"
[#]: author: "Matthew Miller https://fedoramagazine.org/author/mattdm/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Announcing the release of Fedora Linux 37 Beta
======

![][1]

The Fedora Project is pleased to announce the immediate availability of Fedora Linux 37 Beta, the next step towards our planned Fedora Linux 37 release at the end of October.

Download the prerelease from our Get Fedora site:

  * [Get Fedora 37 Workstation Beta ][2]
  * [Get Fedora 37 Server Beta][3]
  * [Get Fedora 37 IoT Beta][4]



Or, check out one of our popular variants, including KDE Plasma, Xfce, and other desktop environments, as well as images for specific use cases like Computational Neuroscience

  * [Get Fedora Spins 37 Beta][5]
  * [Get Fedora Labs 37 Beta][6]



### Beta Release Highlights

#### Fedora Workstation

Fedora 37 Workstation Beta includes a beta release of [GNOME 43][7]. (We expect the final GNOME 43 release in a few weeks.) GNOME 43 includes a new device security panel in Settings, providing the user with information about the security of hardware and firmware on the system. Building on the previous release, more core GNOME apps have been ported to the latest version of the GTK toolkit, providing improved performance and a modern look. 

#### Other updates

The Raspberry Pi 4 is now officially supported in Fedora Linux, including accelerated graphics. In other ARM news, Fedora Linux 37 Beta drops support for the ARMv7 architecture (also known as arm32 or armhfp).

We are preparing to promote two of our most popular variants: Fedora CoreOS and Fedora Cloud Base to Editions. Fedora Editions are our flagship offerings targeting specific use cases. 

In order to keep up with advances in cryptography, this release introduces a _TEST-FEDORA39_ policy that previews changes planned for Fedora Linux 39. The new policy includes a move away from SHA-1 signatures.

Of course, there’s the usual update of programming languages and libraries: Python 3.11, Perl 5.36, Golang 1.19, and more!

### Testing needed

Since this is a Beta release, we expect that you may encounter bugs or missing features. To report issues encountered during testing, contact the Fedora QA team via the [test mailing list][8] or in the [#quality channel on Matrix][9] (bridged to #fedora-qa on Libera.chat). As testing progresses, we track common issues on [Ask Fedora][10].

For tips on reporting a bug effectively, read [how to file a bug][11].

### What is the Beta Release?

A Beta release is code-complete and bears a very strong resemblance to the final release. If you take the time to download and try out the Beta, you can check and make sure the things that are important to you are working. Every bug you find and report doesn’t just help you, it improves the experience of millions of Fedora Linux users worldwide! Together, we can make Fedora rock-solid. We have a culture of coordinating new features and pushing fixes upstream as much as we can. Your feedback improves not only Fedora Linux, but the Linux ecosystem and free software as a whole.

### More information

For more detailed information about what’s new on Fedora Linux 37 Beta release, you can consult the [Fedora Linux 37 Change set][12]. It contains more technical information about the new packages and improvements shipped with this release.

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/announcing-fedora-37-beta/

作者：[Matthew Miller][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/mattdm/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2022/09/f37-beta-816x345.jpg
[2]: https://getfedora.org/workstation/download/
[3]: https://getfedora.org/server/download/
[4]: https://getfedora.org/iot/download/
[5]: https://spins.fedoraproject.org/prerelease
[6]: https://labs.fedoraproject.org/prerelease
[7]: https://www.gnome.org/
[8]: https://lists.fedoraproject.org/archives/list/test%40lists.fedoraproject.org/
[9]: https://matrix.to/#/#social:fedoraproject.org?web-instance%5Belement.io%5D=chat.fedoraproject.org
[10]: https://ask.fedoraproject.org/tags/c/common-issues/141/f37
[11]: https://docs.fedoraproject.org/en-US/quick-docs/howto-file-a-bug/
[12]: https://fedoraproject.org/wiki/Releases/37/ChangeSet

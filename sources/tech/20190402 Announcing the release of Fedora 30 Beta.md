[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Announcing the release of Fedora 30 Beta)
[#]: via: (https://fedoramagazine.org/announcing-the-release-of-fedora-30-beta/)
[#]: author: (Ben Cotton https://fedoramagazine.org/author/bcotton/)

Announcing the release of Fedora 30 Beta
======

![][1]

The Fedora Project is pleased to announce the immediate availability of Fedora 30 Beta, the next big step on our journey to the exciting Fedora 30 release.

Download the prerelease from our Get Fedora site:

  * [Get Fedora 30 Beta Workstation][2]
  * [Get Fedora 30 Beta Server][3]
  * [Get Fedora 30 Beta Silverblue][4]



Or, check out one of our popular variants, including KDE Plasma, Xfce, and other desktop environments, as well as images for ARM devices like the Raspberry Pi 2 and 3:

  * [Get Fedora 30 Beta Spins][5]
  * [Get Fedora 30 Beta Labs][6]
  * [Get Fedora 30 Beta ARM][7]



### Beta Release Highlights

#### New desktop environment options

Fedora 30 Beta includes two new options for desktop environment. [DeepinDE][8] and [Pantheon Desktop][9] join GNOME, KDE Plasma, Xfce, and others as options for users to customize their Fedora experience.

#### DNF performance improvements

All dnf repository metadata for Fedora 30 Beta is compressed with the zchunk format in addition to xz or gzip. zchunk is a new compression format designed to allow for highly efficient deltas. When Fedora’s metadata is compressed using zchunk, dnf will download only the differences between any earlier copies of the metadata and the current version.

#### GNOME 3.32

Fedora 30 Workstation Beta includes GNOME 3.32, the latest version of the popular desktop environment. GNOME 3.32 features updated visual style, including the user interface, the icons, and the desktop itself. For a full list of GNOME 3.32 highlights, see the [release notes][10].

#### Other updates

Fedora 30 Beta also includes updated versions of many popular packages like Golang, the Bash shell, the GNU C Library, Python, and Perl. For a full list, see the [Change set][11] on the Fedora Wiki. In addition, many Python 2 packages are removed in preparation for Python 2 end-of-life on 2020-01-01.

#### Testing needed

Since this is a Beta release, we expect that you may encounter bugs or missing features. To report issues encountered during testing, contact the Fedora QA team via the mailing list or in #fedora-qa on Freenode. As testing progresses, common issues are tracked on the [Common F30 Bugs page][12].

For tips on reporting a bug effectively, read [how to file a bug][13].

#### What is the Beta Release?

A Beta release is code-complete and bears a very strong resemblance to the final release. If you take the time to download and try out the Beta, you can check and make sure the things that are important to you are working. Every bug you find and report doesn’t just help you, it improves the experience of millions of Fedora users worldwide! Together, we can make Fedora rock-solid. We have a culture of coordinating new features and pushing fixes upstream as much as we can. Your feedback improves not only Fedora, but Linux and free software as a whole.

#### More information

For more detailed information about what’s new on Fedora 30 Beta release, you can consult the [Fedora 30 Change set][11]. It contains more technical information about the new packages and improvements shipped with this release.

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/announcing-the-release-of-fedora-30-beta/

作者：[Ben Cotton][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/bcotton/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2019/03/f30-beta-816x345.jpg
[2]: https://getfedora.org/workstation/prerelease/
[3]: https://getfedora.org/server/prerelease/
[4]: https://silverblue.fedoraproject.org/download
[5]: https://spins.fedoraproject.org/prerelease
[6]: https://labs.fedoraproject.org/prerelease
[7]: https://arm.fedoraproject.org/prerelease
[8]: https://www.deepin.org/en/dde/
[9]: https://www.fosslinux.com/4652/pantheon-everything-you-need-to-know-about-the-elementary-os-desktop.htm
[10]: https://help.gnome.org/misc/release-notes/3.32/
[11]: https://fedoraproject.org/wiki/Releases/30/ChangeSet
[12]: https://fedoraproject.org/wiki/Common_F30_bugs
[13]: https://docs.fedoraproject.org/en-US/quick-docs/howto-file-a-bug/

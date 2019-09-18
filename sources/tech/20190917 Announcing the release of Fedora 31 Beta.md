[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Announcing the release of Fedora 31 Beta)
[#]: via: (https://fedoramagazine.org/announcing-the-release-of-fedora-31-beta/)
[#]: author: (Matthew Miller https://fedoramagazine.org/author/mattdm/)

Announcing the release of Fedora 31 Beta
======

![][1]

The Fedora Project is pleased to announce the immediate availability of Fedora 31 Beta, the next step towards our planned Fedora 31 release at the end of October.

Download the prerelease from our Get Fedora site:

  * [Get Fedora 31 Beta Workstation][2]
  * [Get Fedora 31 Beta Server][3]



Or, check out one of our popular variants, including KDE Plasma, Xfce, and other desktop environments, as well as images for ARM devices like the Raspberry Pi 2 and 3:

  * [Get Fedora 31 Beta Spins][4]
  * [Get Fedora 31 Beta Labs][5]
  * [Get Fedora 31 Beta ARM][6]



### Beta Release Highlights

#### GNOME 3.34 (almost)

The newest release of the GNOME desktop environment is full of performance enhancements and improvements. The beta ships with a prerelease, and the full 3.34 release will be available as an update. For a full list of GNOME 3.34 highlights, see the [release notes][7].

#### Fedora IoT Edition

Fedora Editions address specific use-cases the Fedora Council has identified as significant in growing our userbase and community. We have Workstation, Server, and CoreOS — and now we’re adding Fedora IoT. This will be available from the main “Get Fedora” site when the final release of F31 is ready, but for now, get it from [iot.fedoraproject.org][8].

Read more about Fedora IoT in our [Getting Started][9] docs.

#### Fedora CoreOS

Fedora CoreOS remains in a preview state, with a planned generally-available release planned for early next year. CoreOS is a rolling release which rebases periodically to a new underlying Fedora OS version. Right now, that version is Fedora 30, but soon there will be a “next” stream which will track Fedora 31 until that’s ready to become the “stable” stream.

#### Other updates

Fedora 31 Beta includes updated versions of many popular packages like Node.js, the Go language, Python, and Perl. We also have the customary updates to underlying infrastructure software, like the GNU C Library and the RPM package manager. For a full list, see the [Change set][10] on the Fedora Wiki.

#### Farewell to bootable i686

We’re no longer producing full media or repositories for 32-bit Intel-architecture systems. We recognize that this means newer Fedora releases will no longer work on some older hardware, but the fact is there just hasn’t been enough contributor interest in maintaining i686, and we can provide greater benefit for the majority of our users by focusing on modern architectures. (The majority of Fedora systems have been 64-bit x86_64 since 2013, and at this point that’s the _vast_ majority.)

Please note that we’re still making userspace packages for compatibility when running 32-bit software on a 64-bit systems — we don’t see the need for that going away anytime soon.

#### Testing needed

Since this is a Beta release, we expect that you may encounter bugs or missing features. To report issues encountered during testing, contact the Fedora QA team via the mailing list or in #fedora-qa on Freenode. As testing progresses, common issues are tracked on the [Common F31 Bugs page][11].

For tips on reporting a bug effectively, read [how to file a bug][12].

#### What is the Beta Release?

A Beta release is code-complete and bears a very strong resemblance to the final release. If you take the time to download and try out the Beta, you can check and make sure the things that are important to you are working. Every bug you find and report doesn’t just help you, it improves the experience of millions of Fedora users worldwide! Together, we can make Fedora rock-solid. We have a culture of coordinating new features and pushing fixes upstream as much as we can. Your feedback improves not only Fedora, but Linux and free software as a whole.

#### More information

For more detailed information about what’s new on Fedora 31 Beta release, you can consult the [Fedora 31 Change set][10]. It contains more technical information about the new packages and improvements shipped with this release.

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/announcing-the-release-of-fedora-31-beta/

作者：[Matthew Miller][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/mattdm/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2019/09/f31-beta-816x345.jpg
[2]: https://getfedora.org/workstation/download/
[3]: https://getfedora.org/server/download/
[4]: https://spins.fedoraproject.org/prerelease
[5]: https://labs.fedoraproject.org/prerelease
[6]: https://arm.fedoraproject.org/prerelease
[7]: https://help.gnome.org/misc/release-notes/3.34/
[8]: https://iot.fedoraproject.org/
[9]: https://docs.fedoraproject.org/en-US/iot/getting-started/
[10]: https://fedoraproject.org/wiki/Releases/31/ChangeSet
[11]: https://fedoraproject.org/wiki/Common_F31_bugs
[12]: https://docs.fedoraproject.org/en-US/quick-docs/howto-file-a-bug/

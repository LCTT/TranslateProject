[#]: subject: "Announcing the release of Fedora Linux 36 Beta"
[#]: via: "https://fedoramagazine.org/announcing-fedora-36-beta/"
[#]: author: "Matthew Miller https://fedoramagazine.org/author/mattdm/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Announcing the release of Fedora Linux 36 Beta
======

![][1]

The Fedora Project is pleased to announce the immediate availability of Fedora Linux 36 Beta, the next step towards our planned Fedora Linux 36 release at the end of April.

Download the prerelease from our Get Fedora site:

  * [Get Fedora 36 Workstation Beta ][2]
  * [Get Fedora 36 Server Beta][3]
  * [Get Fedora 36 IoT Beta][4]
  * [Get Fedora CoreOS “next” stream][5]



Or, check out one of our popular variants, including KDE Plasma, Xfce, and other desktop environments, as well as images for ARM devices like the Raspberry Pi 2 and 3:

  * [Get Fedora Spins 36 Beta][6]
  * [Get Fedora Labs 36 Beta][7]
  * [Get Fedora Linux 36 Beta for ARM][8]



### Beta Release Highlights

#### Fedora Workstation

Fedora 36 Workstation Beta includes [GNOME 42][9], the newest release of the GNOME desktop environment. GNOME 42 includes a global dark style UI setting. It also has a redesigned screenshot tool. And many core GNOME apps have been ported to the latest version of the GTK toolkit, providing improved performance and a modern look. 

#### Other updates

Fedora Silverblue and Kinoite now have /var on a separate subvolume for new installs, which makes handling snapshots of dynamic data easier to manage independently from the system snapshots.

Fans of the lightweight LXQt desktop environment will be glad to see the [upstream 1.0 release][10] in Fedora Linux 36. You can install the LXQt Spin directly or install LXQt alongside your existing desktop environment.

If you use the proprietary NVIDIA driver, GDM sessions will now use Wayland by default.

Sometimes it’s the small changes that make the biggest improvements. Along that line, systemd now includes the unit names in the output so you can more easily understand what services are starting and stopping.

Of course, there’s the usual update of programming languages and libraries: Golang 1.18, Ruby 3.1, and more!

### Testing needed

Since this is a Beta release, we expect that you may encounter bugs or missing features. To report issues encountered during testing, contact the Fedora QA team via the [test mailing list][11] or in the #fedora-qa channel on Libera.chat. As testing progresses, common issues are tracked on the [Common F36 Bugs][12] page.

For tips on reporting a bug effectively, read [how to file a bug][13].

### What is the Beta Release?

A Beta release is code-complete and bears a very strong resemblance to the final release. If you take the time to download and try out the Beta, you can check and make sure the things that are important to you are working. Every bug you find and report doesn’t just help you, it improves the experience of millions of Fedora Linux users worldwide! Together, we can make Fedora rock-solid. We have a culture of coordinating new features and pushing fixes upstream as much as we can. Your feedback improves not only Fedora Linux, but the Linux ecosystem and free software as a whole.

### More information

For more detailed information about what’s new on Fedora Linux 36 Beta release, you can consult the [Fedora Linux 36 Change set][14]. It contains more technical information about the new packages and improvements shipped with this release.

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/announcing-fedora-36-beta/

作者：[Matthew Miller][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/mattdm/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2022/03/f36-beta-816x345.jpg
[2]: https://getfedora.org/workstation/download/
[3]: https://getfedora.org/server/download/
[4]: https://getfedora.org/iot/download/
[5]: https://getfedora.org/en/coreos/download?stream=next
[6]: https://spins.fedoraproject.org/prerelease
[7]: https://labs.fedoraproject.org/prerelease
[8]: https://arm.fedoraproject.org/prerelease
[9]: https://release.gnome.org/42/
[10]: https://lxqt-project.org/release/2021/11/06/lxqt-1-0-0/
[11]: https://lists.fedoraproject.org/archives/list/test%40lists.fedoraproject.org/
[12]: https://fedoraproject.org/wiki/Common_F36_bugs
[13]: https://docs.fedoraproject.org/en-US/quick-docs/howto-file-a-bug/
[14]: https://fedoraproject.org/wiki/Releases/36/ChangeSet

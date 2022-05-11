[#]: subject: "Announcing Fedora Linux 36"
[#]: via: "https://fedoramagazine.org/announcing-fedora-36/"
[#]: author: "Matthew Miller https://fedoramagazine.org/author/mattdm/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Announcing Fedora Linux 36
======

![][1]

Today, I’m excited to share the results of the hard work of thousands of Fedora Project contributors: our latest release, Fedora Linux 36, is here!

### By the community, for the community

Normally when I write these announcements, I talk about some of the great technical changes in the release. This time, I wanted to put the focus on the community that makes those changes happen. Fedora isn’t just a group of people toiling away in isolation — we’re friends. In fact, that’s one of our Four Foundations.

One of our newest Fedora Friends, Juan Carlos Araujo said it beautifully in a [Fedora Discussion post][2]:

> Besides functionality, stability, features, how it works under the hood, and how cutting-edge it is, I think what makes or breaks a distro are those intangibles, like documentation and the community. And Fedora has it all… especially the intangibles.

We’ve worked hard over the years to make Fedora an inclusive and welcoming community. We want to be a place where experienced contributors and newcomers alike can work together. Just like we want Fedora Linux to be a distribution that appeals to both long-time and novice Linux users.

Speaking of Fedora Linux, let’s take a look at some of the highlights this time around. As always, you should make sure your system is _fully up-to-date_ before upgrading from a previous release. This time especially, because we’ve squashed some very important upgrade-related bugs in F34/F35 updates. Your system upgrade to Fedora Linux 36 could fail if those updates aren’t applied first.

### Desktop improvements

Fedora Workstation focuses on the desktop, and in particular, it’s geared toward users who want a “just works” Linux operating system experience. As usual, Fedora Workstation features the latest GNOME release: [GNOME 42][3]. While it doesn’t _completely_ provide the answer to life, the universe, and everything, GNOME 42 brings a lot of improvements. Many applications have been ported to GTK 4 for improved style and performance. And two new applications come in GNOME 42: Text Editor and Console. They’re aptly named, so you can guess what they do. Text Editor is the new default text editor and Console is available in the repos.

If you use NVIDIA’s proprietary graphics driver, your desktop sessions will now default to using the Wayland protocol. This allows you to take advantage of hardware acceleration while using the modern desktop compositor.

Of course, we produce more than just the Editions. [Fedora Spins][4] and [Labs][5] target a variety of audiences and use cases, including [Fedora Comp Neuro][6], which provides tools for computational neuroscience, and desktop environments like [Fedora LXQt][7], which provides a lightweight desktop environment. And don’t forget our alternate architectures: [ARM AArch64, Power, and S390x][8].

### Sysadmin improvements

Fedora Linux 36 includes the latest release of Ansible. Ansible 5 splits the “engine” into an ansible-core package and [collections packages][9]. This makes maintenance easier and allows you to download only the collections you need. See the [Ansible 5 Porting Guide][10] to learn how to update your playbooks.

Beginning in Fedora Server 36, Cockpit provides a module for provisioning and ongoing administration of NFS and Samba shares. This allows administrators to manage network file shares through the Cockpit web interface used to configure other server attributes.

### Other updates

No matter what variant of Fedora Linux you use, you’re getting the latest the open source world has to offer. Podman 4.0 will be fully released for the first time in Fedora Linux 36. Podman 4.0 has a huge number of changes and a brand new network stack. It also brings backwards-incompatible API changes, so read the [upstream documentation][11] carefully.

Following our “[First][12]” foundation, we’ve updated key programming language and system library packages, including Ruby 3.1, Golang 1.18 and PHP 8.1. 

We’re excited for you to try out the new release! Go to <https://getfedora.org/> and download it now. Or if you’re already running Fedora Linux, follow the [easy upgrade instructions][13]. For more information on the new features in Fedora Linux 36, see the [release notes][14].

### In the unlikely event of a problem…

If you run into a problem, visit our [Ask Fedora][15] user-support forum. This includes a category for [common issues][16].

### Thank you everyone

Thanks to the thousands of people who contributed to the Fedora Project in this release cycle. We love having you in the Fedora community. Be sure to join us May 13 – 14 for a [virtual release party][17]!

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/announcing-fedora-36/

作者：[Matthew Miller][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/mattdm/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2022/05/f36-final-816x345.jpg
[2]: https://discussion.fedoraproject.org/t/the-end-of-my-distro-hopping-days/38445
[3]: https://release.gnome.org/42/
[4]: https://spins.fedoraproject.org/
[5]: https://labs.fedoraproject.org/
[6]: https://labs.fedoraproject.org/en/comp-neuro/
[7]: https://spins.fedoraproject.org/en/lxqt/
[8]: https://alt.fedoraproject.org/alt/
[9]: https://koji.fedoraproject.org/koji/search?match=glob&type=package&terms=ansible-collection*
[10]: https://docs.ansible.com/ansible/devel/porting_guides/porting_guide_5.html
[11]: https://podman.io/releases/2022/02/22/podman-release-v4.0.0.html
[12]: https://docs.fedoraproject.org/en-US/project/#_first
[13]: https://docs.fedoraproject.org/en-US/quick-docs/upgrading/
[14]: https://docs.fedoraproject.org/en-US/fedora/f36/release-notes/
[15]: https://ask.fedoraproject.org/
[16]: https://ask.fedoraproject.org/tags/c/common-issues/141/f36
[17]: https://hopin.com/events/fedora-linux-36-release-party/registration

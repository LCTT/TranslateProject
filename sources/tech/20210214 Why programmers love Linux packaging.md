[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Why programmers love Linux packaging)
[#]: via: (https://opensource.com/article/21/2/linux-packaging)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

Why programmers love Linux packaging
======
Programmers can distribute their software easily and consistently via
Flatpaks, letting them focus on their passion: Programming.
![Package wrapped with brown paper and red bow][1]

In 2021, there are more reasons why people love Linux than ever before. In this series, I'll share 21 different reasons to use Linux. Today, I'll talk about what makes packaging for Linux ideal for programmers.

Programmers love to program. That probably seems like an obvious statement, but it's important to understand that developing software involves a lot more than just writing code. It includes compiling, documentation, source code management, install scripts, configuration defaults, support files, delivery format, and more. Getting from a blank screen to a deliverable software installer requires much more than just programming, but most programmers would rather program than package.

### What is packaging?

When food is sent to stores to be purchased, it is packaged. When buying directly from a farmer or from an eco-friendly bulk or bin store, the packaging is whatever container you've brought with you. When buying from a grocery store, packaging may be a cardboard box, plastic bag, a tin can, and so on.

When software is made available to computer users at large, it also must be packaged. Like food, there are several ways software can be packaged. Open source software can be left unpackaged because users, having access to the raw code, can compile and package it themselves. However, there are advantages to packages, so applications are commonly delivered in some format specific to the user's platform. And that's where the problems begin, because there's not just one format for software packages.

For the user, packages make it easy to install software because all the work is done by the system's installer. The software is extracted from its package and distributed to the appropriate places within the operating system. There's little opportunity for anything to go wrong.

For the software developer, however, packaging means that you have to learn how to create a package—and not just one package, but a unique package for every operating system you want your software to be installable on. To complicate matters, there are multiple packaging formats and options for each operating system, and sometimes even for the programming language being used.

### Packaging on Linux

Packaging options for Linux have traditionally seemed pretty overwhelming. Linux distributions derived from Fedora, such as Red Hat and CentOS, default to `.rpm` packages. Debian and Ubuntu (and similar) default to `.deb` packages. Other distributions may use one or the other, or neither, opting for a custom format. When asked, many Linux users say that ideally, a programmer won't package their software for Linux at all but instead rely on the package maintainers of each distribution to create the package. All software installed onto any Linux system ought to come from that distribution's official repository. However, it remains unclear how to get your software reliably packaged and included by one distribution, let alone all distributions.

### Flatpak for Linux

The Flatpak packaging system was introduced to unify and decentralize Linux as a delivery target for developers. With Flatpak, either a developer or anyone (a member of a Linux community, a different developer, a Flatpak team member, or anyone else) is free to package software. They can then submit the package to Flathub or choose to self-host the package and offer it to basically any Linux distribution. The Flatpak system is available to all Linux distributions, so targeting one is the same as targeting them all.

### How Flatpak technology works

The secret to Flatpak's universal appeal is a standard base. The Flatpak system allows developers to reference a common set of Software Developer Kit (SDK) modules. These are packaged and managed by the maintainers of the Flatpak system. The SDKs get pulled in as needed whenever you install a Flatpak, ensuring compatibility with your system. Any given SDK is only required once because the libraries it contains can be shared across any Flatpak calling for it.

If a developer requires a library not already included in an existing SDK, the developer can add that library in the Flatpak.

The results speak for themselves. Users may install hundreds of packages on any Linux distribution from one central repository, called [Flathub][2].

### How developers use Flatpaks

Flatpaks are designed to be reproducible, so the build process is easily integrated into a CI/CD workflow. A Flatpak is defined in a [YAML][3] or JSON manifest file. You can create your first Flatpak by following my [introductory article][4], and you can read the full documentation at [docs.flatpak.org][5].

### Linux makes it easy

Creating software on Linux is easy, and packaging it up for Linux is simple and automatable. If you're a programmer, Linux makes it easy for you to forget about packaging by targeting one system and integrating that into your build process.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/2/linux-packaging

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/brown-package-red-bow.jpg?itok=oxZYQzH- (Package wrapped with brown paper and red bow)
[2]: https://flatpak.org/setup/
[3]: https://www.redhat.com/sysadmin/yaml-beginners
[4]: https://opensource.com/article/19/10/how-build-flatpak-packaging
[5]: https://docs.flatpak.org/en/latest/index.html

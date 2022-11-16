[#]: subject: "Announcing Fedora Linux 37"
[#]: via: "https://fedoramagazine.org/announcing-fedora-37/"
[#]: author: "Matthew Miller https://fedoramagazine.org/author/mattdm/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Announcing Fedora Linux 37
======

![][1]

Today I’m excited to share the results of the hard work of thousands of Fedora Project contributors: the Fedora Linux 37 release is here! Let’s see what the latest release brings you. As always, you should make sure your system is fully up-to-date before upgrading from a previous release. Can’t wait to get started? [Download][2] while you read!

### New editions

Fedora Editions are flagship offerings targeted at a particular “market”. With Fedora Linux 37, we’re adding two new Editions. Fedora CoreOS is the successor to what you may remember as Atomic Host. Drawing from Project Atomic and the original CoreOS work, it provides an automatic update mechanism geared toward hosting container-based workloads. With atomic updates and easy rollback, it adds peace of mind to your infrastructure.

Fedora Cloud is also back as an Edition. The Cloud Working Group has seen a resurgence in activity. Cloud provides a great Fedora base to run in your favorite public or private cloud. AMIs will be available in the AWS Marketplace later this week and community channels are available now. Check the [website][3] for images in other cloud providers or for your own cloud!

### Desktop improvements

Fedora Workstation focuses on the desktop experience. As usual, Fedora Workstation features the latest GNOME release. [GNOME 43][4] includes a new device security panel in Settings, providing the user with information about the security of hardware and firmware on the system. Building on the previous release, more core GNOME apps have been ported to the latest version of the GTK toolkit, providing improved performance and a modern look. 

With this release, we’ve made a few changes to allow you to slim down your installation a bit. We split the language packs for the Firefox browser into subpackages. This means you can remove the “firefox-langpacks” package if you don’t need the localization. The runtime packages for gettext — the tools that help other packages produce multilingual text — are split into a separate, optional subpackage.

Of course, we produce more than just the Editions. [Fedora Spins][5] and [Labs][6] target a variety of audiences and use cases, including [Fedora Comp Neuro][7], which provides tools for computational neuroscience, and desktop environments like [Fedora LXQt][8], which provides a lightweight desktop environment. And, don’t forget our alternate architectures: [ARM AArch64, Power, and S390x][9].

### Sysadmin improvements

Fedora Server now produces a KVM disk image to make running Server in a virtual machine easier. If you’ve disabled SELinux (it’s okay — we still love you!), you can turn it back on with less impact. The autorelabel now runs in parallel, making the “fixfiles” operation much faster.

In order to keep up with advances in cryptography, this release introduces a TEST-FEDORA39 policy that previews changes planned for future releases. The new policy includes a move away from SHA-1 signatures. Researchers have long known that this hash (like MD5 before it) is not safe to use for many security purposes.

In the future, we are likely to remove SHA-1 from the list of acceptable security algorithms in Fedora Linux. (As the name TEST-FEDORA39 implies, perhaps as soon as next year.) We know there are still SHA-1 hashes in use today, however. The new policy helps you test your critical applications now so that you’ll be ready. Please try it out, and let us know where you encounter problems.

Speaking of cryptography, the openssl1.1 package is now deprecated. It will remain available, but we recommend you update your code to work with openssl 3.

### Other updates

The Raspberry Pi 4 is now officially supported in Fedora Linux, including accelerated graphics. In other ARM news, Fedora Linux 37 drops support for the ARMv7 architecture (also known as arm32 or armhfp).

Following our “[First][10]” foundation, we’ve updated key programming language and system library packages, including Python 3.11, Golang 1.19, glibc 2.36, and LLVM 15.

We’re excited for you to try out the new release! Go to <https://getfedora.org/> and download it now. Or if you’re already running Fedora Linux, follow the [easy upgrade instructions][11]. For more information on the new features in Fedora Linux 37, see the [release notes][12].

### In the unlikely event of a problem…

If you run into a problem, visit our [Ask Fedora][13] user-support forum. This includes a category for [common issues][14].

### Thank you everyone

Thanks to the thousands of people who contributed to the Fedora Project in this release cycle. We love having you in the Fedora community.

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/announcing-fedora-37/

作者：[Matthew Miller][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/mattdm/
[b]: https://github.com/lujun9972
[1]: https://fedoramag.wpenginepowered.com/wp-content/uploads/2022/11/f37-release-1-816x345.jpg
[2]: https://getfedora.org
[3]: https://getfedora.org/en/cloud/
[4]: https://release.gnome.org/43/
[5]: https://spins.fedoraproject.org/
[6]: https://labs.fedoraproject.org/
[7]: https://labs.fedoraproject.org/en/comp-neuro/
[8]: https://spins.fedoraproject.org/en/lxqt/
[9]: https://alt.fedoraproject.org/alt/
[10]: https://docs.fedoraproject.org/en-US/project/#_first
[11]: https://docs.fedoraproject.org/en-US/quick-docs/upgrading/
[12]: https://docs.fedoraproject.org/en-US/fedora/f37/release-notes/
[13]: https://ask.fedoraproject.org/
[14]: https://ask.fedoraproject.org/c/common-issues/141/none

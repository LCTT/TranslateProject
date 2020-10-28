[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Fedora 33 is officially here!)
[#]: via: (https://fedoramagazine.org/announcing-fedora-33/)
[#]: author: (Matthew Miller https://fedoramagazine.org/author/mattdm/)

Fedora 33 is officially here!
======

![][1]

Today, I’m excited to share the results of the hard work of thousands of contributors to the Fedora Project: our latest release, Fedora 33, is here! This is a big release with a lot of change, but I believe all that work will also make it a comfortable one, fulfilling our goal of bringing you the latest stable, powerful, and robust free and open source software in many easy to use offerings. 

If you just want to get to the bits without delay, head over to <https://getfedora.org/> right now. For details, read on!

### **Find the Fedora flavor that’s right for you!**

Fedora Editions are targeted outputs geared toward specific “showcase” uses on the desktop, in server and cloud environments—and now for Internet of Things as well.

Fedora Workstation focuses on the desktop, and in particular, it’s geared toward software developers who want a “just works” Linux operating system experience. This release features [GNOME 3.38][2], which has plenty of great improvements as usual. The addition of the Tour application helps new users learn their way around. And like all of our other desktop-oriented variants, Fedora Workstation now uses [BTRFS as the default filesystem][3]. This advanced filesystem lays the foundation for bringing a lot of great enhancements in upcoming releases. For your visual enjoyment, Fedora 33 Workstation now features an animated background (based on time of day) by default.

Fedora CoreOS is an emerging Fedora Edition. It’s an automatically-updating, minimal operating system for running containerized workloads securely and at scale. It offers several [update streams][4] that can be followed for automatic updates that occur roughly every two weeks. Currently the **next** stream is based on Fedora 33, with the **testing** and **stable** streams to follow. You can find information about released artifacts that follow the **next** stream from [the download page][5] and information about how to use those artifacts in the [Fedora CoreOS Documentation][6].

[Fedora IoT][7], newly promoted to Edition status, provides a strong foundation for IoT ecosystems and edge computing use cases. Among many other features, Fedora 33 IoT introduces the Platform AbstRaction for SECurity (PARSEC), an open-source initiative to provide a common API to hardware security and cryptographic services in a platform-agnostic way.

Of course, we produce more than just the Editions. [Fedora Spins][8] and [Labs][9] target a variety of audiences and use cases, including [Fedora CompNeuro][10], which brings a plethora of open source computational modelling tools for neuroscience, and desktop environments like [KDE Plasma][11] and [Xfce][12]. 

And, don’t forget our alternate architectures: [ARM AArch64, Power, and S390x][13]. New in Fedora 33, AArch64 users can use the .NET Core language for cross-platform development. We have improved support for Pine64 devices, NVidia Jetson 64 bit platforms, and the Rockchip system-on-a-chip devices including the Rock960, RockPro64, and Rock64. (However, a late-breaking note: there may be problems booting on some of these devices. Upgrading from existing Fedora 32 will be fine. More info will be on the [Common Bugs][14] page as we have it.)

We’re also excited to announce that the Fedora Cloud Base Image and Fedora CoreOS will be available in Amazon’s [AWS Marketplace][15] for the first time with Fedora 33. Fedora cloud images have been available in the Amazon cloud for over a decade, and you can launch our official images by AMI ID or [with a click][16]. The Marketplace provides an alternate way to get the same thing, with significantly wider visibility for Fedora. This will also make our cloud images available in new AWS regions more quickly. Thank you especially to David Duncan for making this happen!

### General improvements

No matter what variant of Fedora you use, you’re getting the latest the open source world has to offer. Following our “[First][17]” foundation, we’ve updated key programming language and system library packages, including Python 3.9, Ruby on Rails 6.0, and Perl 5.32. In Fedora KDE, we’ve followed the work in Fedora 32 Workstation and enabled the EarlyOOM service by default to improve the user experience in low-memory situations.

To make the default Fedora experience better, we’ve set nano as the default editor. nano is a friendly editor for new users. Those of you who want the power of editors like vi can, of course, set your own default.

We’re excited for you to try out the new release! Go to <https://getfedora.org/> and download it now. Or if you’re already running a Fedora operating system, follow the easy [upgrade instructions][18]. For more information on the new features in Fedora 33, see the [release notes][19].

### **A note on Secure Boot**

Secure Boot is a security standard which ensures that only officially-signed operating system software can load on your computer. This is important for preventing persistent malware which could hide itself in your computer’s firmware and survive even an operating system reinstallation. However, in the wake of the [Boot Hole][20] vulnerability, the cryptographic certificate used to sign Fedora bootloader software will be revoked and replaced with a new one. Because this will have a broad impact, revocation should not happen widely until the second quarter of 2021 or later.

However, some users may have received this revocation from other operating systems or firmware updates already. In that case, Fedora installations will not boot with Secure Boot enabled. To be clear, this will not affect most users. If it does affect you, you can boot with Secure Boot disabled for the time being. We will release an update signed with the new certificate to be available on all supported releases well before broad-scale certificate revocation takes place, and at that point Secure Boot should be reenabled.

### **In the unlikely event of a problem….**

If you run into a problem, check out the [Fedora 33 Common Bugs][14] page, and if you have questions, visit our [Ask Fedora][21] user-support platform.

### **Thank you everyone**

Thanks to the thousands of people who contributed to the Fedora Project in this release cycle, and especially to those of you who worked extra hard to make this another on-time release during a pandemic. Fedora is a community, and it’s great to see how much we’ve supported each other.

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/announcing-fedora-33/

作者：[Matthew Miller][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/mattdm/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2020/10/f33-final-816x345.jpg
[2]: https://www.gnome.org/news/2020/09/gnome-3-38-released/
[3]: https://fedoramagazine.org/btrfs-coming-to-fedora-33/
[4]: https://docs.fedoraproject.org/en-US/fedora-coreos/update-streams/
[5]: https://getfedora.org/en/coreos/download?stream=next
[6]: https://docs.fedoraproject.org/en-US/fedora-coreos/getting-started/
[7]: https://getfedora.org/iot
[8]: https://spins.fedoraproject.org/
[9]: https://labs.fedoraproject.org/
[10]: https://labs.fedoraproject.org/en/comp-neuro/
[11]: https://spins.fedoraproject.org/en/kde/
[12]: https://spins.fedoraproject.org/en/xfce/
[13]: https://alt.fedoraproject.org/alt/
[14]: https://fedoraproject.org/wiki/Common_F33_bugs
[15]: https://aws.amazon.com/marketplace
[16]: https://getfedora.org/en/coreos/download?tab=cloud_launchable&stream=stable
[17]: https://docs.fedoraproject.org/en-US/project/#_first
[18]: https://docs.fedoraproject.org/en-US/quick-docs/upgrading/
[19]: https://docs.fedoraproject.org/en-US/fedora/f33/release-notes/
[20]: https://access.redhat.com/security/vulnerabilities/grub2bootloader
[21]: http://ask.fedoraproject.org

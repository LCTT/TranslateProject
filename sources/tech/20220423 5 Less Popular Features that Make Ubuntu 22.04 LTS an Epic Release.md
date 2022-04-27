[#]: subject: "5 Less Popular Features that Make Ubuntu 22.04 LTS an Epic Release"
[#]: via: "https://www.debugpoint.com/2022/04/ubuntu-22-04-release-unique-feature/"
[#]: author: "Arindam https://www.debugpoint.com/author/admin1/"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

5 Less Popular Features that Make Ubuntu 22.04 LTS an Epic Release
======
A LIST OF MINOR HIGHLIGHTED FEATURES OF UBUNTU 22.04 LTS THAT MAKES IT
ONE OF THE BEST LTS RELEASE SO FAR.
Canonical’s latest LTS instalment of [Ubuntu code-named “Jammy Jellyfish”][1] is well received from users worldwide. There are hundreds of new tiny features and some less popular ones that didn’t catch much attention. So, here are five unique Ubuntu 22.04 release features which we think make it an epic release.

![Ubuntu 22.04 LTS Desktop \(GNOME\)][2]

### Ubuntu 22.04 Release – Five Unique Features

#### Optimised for Data-Driven Solutions

Data analysis and processing are the core of every business today. And to do that, you need enormous computing power. Ubuntu 22.04 LTS brings out of the box [NVIDIA virtual GPU (vGPU)][3] driver support. That means you can take advantage of NVIDIA virtual GPU software, enabling you to use GPU computing power in virtual machines shared from physical GPU servers.

Not only that, if your business relies on SQL Servers, Ubuntu LTS for Azure brings SQL Server for Ubuntu which is backed by “Micro$oft” providing optimised performance and scalability.

#### Improved Active Directory Integration

Furthermore, Many businesses deploy Ubuntu in multiple workstations for the entire enterprise users. And it is important to deploy workstation policies to monitor and control user access and various business-critical controls.

Active Directory, which enables the policy-based workstation administration (introduced in Ubuntu 20.04), is further improved in this release. In addition to that, this release brings [ADsys][4] client, which helps to remotely manage the group policy, privilege escalation and remote script execution via command line. Active Directory also now supports installer integration beginning this release with the Advanced Group Policy object.

#### Realtime Kernel Support

Moreover, one of the interesting announcements from Canonical during the Ubuntu 22.04 LTS release is the offering “real-time” Kernel option, which is now beta. For telecom and other industries, a low-latency operating system is required for time-sensitive work. So, with that in mind and a vision to penetrate those areas, Ubuntu 22.04 LTS brings a real-time kernel build with PREEMPT_RT patches applied. It is avialble for x86_64 and AArch64 architectures.

However, the [patch][5] is not in mainline Kernel yet and hopefully, and it will be streamlined soon.

#### Latest Apps, Packages and Drivers

In addition to the above changes, this release also brings a vast list of package and toolchain upgrades. For example, this release brings multiple Linux Kernel types based on usage, such as Ubuntu desktop can opt into [Kernel 5.17][6], whereas the hardware enablement Kernel remains 5.15.

[][7]

SEE ALSO:   10 Things to Do After Installing Ubuntu 22.04 [With Bonus Tip]

Not only that, Ubuntu Server features long-term-support [Kernel 5.15][8], while the Ubuntu Cloud images have the option to use a more optimised Kernel in collaboration with cloud providers.

Moreover, if you are an NVIDIA user, it is worth knowing that Linux-restricted modules of NVIDIA drivers on ARM64 are now available (already available in x86_64). You can use the [ubuntu-drivers][9] program to install and configure NVIDIA drivers.

A complete operating system works flawlessly because of core modules and subsystems. So, with that in mind, Ubuntu 22.04 LTS upgraded all of them carefully to cater for this great release. Here’s a brief.

  * GCC 11.2.0
  * binutils 2.38
  * glibc 2.35


  * Python 3.10.4
  * Perl 5.34.0
  * LLVM 14
  * golang 1.18
  * rustc 1.58
  * OpenJDK 11 (option to use OpenJDK 18)
  * Ruby 3.0
  * PHP 8.1.2Apache 2.4.52
  * PostgreSQL 14.2
  * Django 3.2.12
  * MySQL 8.0
  * Updated NFS and Samba Server
  * Systemd 249.11
  * OpenSSL 3.0


  * qemu 6.2.0
  * libvirt 8.0.0
  * virt-manager 4.0.0



#### Performance Boost

But that’s not all. Thanks to some long-pending updates, you should experience a much faster Ubuntu 22.04 Jammy Jellyfish experience, which eventually lands in this release.

Firstly, the long-pending [Tripple buffering code][10] for GNOME desktop lands. The Tripple buffering is enabled automatically when the prior frame buffering lags behind, and it yields a much faster desktop performance in Intel and Raspberry Pi drivers. Not only that, but the code also monitors the last frame so that the system doesn’t run into excess buffering situations.

Secondly, improved power management that works at runtime for AMD and NVIDIA GPUs will help laptop users.

In addition, Wayland is now the default display server for most systems except for NVIDIA GPU hardware which defaults to X11. Wayland gives you a much faster desktop experience across applications, including web browsers.

Finally, the customised GNOME 42 and its [unique features][11] such as balanced and power saver power profiles gives more advantage to heavy laptop users. Also, the new accent colour with a light/dark look and GTK4/libadwaita port of selected GNOME modules is just an addon to this epic Ubuntu 22.04 LTS release.

### Conclusion

To conclude, I believe this is one of the best LTS releases that Canonical shipped in terms of all the above under the hood changes and many others.

We hope it is well received and remains stable in the coming days.

* * *

We bring the latest tech, software news and stuff that matters. Stay in touch via [Telegram][12], [Twitter][13], [YouTube][14], and [Facebook][15] and never miss an update!

--------------------------------------------------------------------------------

via: https://www.debugpoint.com/2022/04/ubuntu-22-04-release-unique-feature/

作者：[Arindam][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.debugpoint.com/author/admin1/
[b]: https://github.com/lujun9972
[1]: https://www.debugpoint.com/2022/01/ubuntu-22-04-lts/
[2]: https://www.debugpoint.com/wp-content/uploads/2022/04/Ubuntu-22.04-LTS-Desktop-GNOME-1024x580.jpg
[3]: https://docs.nvidia.com/grid/latest/grid-vgpu-release-notes-ubuntu/index.html
[4]: https://github.com/ubuntu/adsys
[5]: https://git.kernel.org/pub/scm/linux/kernel/git/rt/linux-stable-rt.git/
[6]: https://www.debugpoint.com/2022/03/linux-kernel-5-17/
[7]: https://www.debugpoint.com/2022/04/10-things-to-do-ubuntu-22-04-after-install/
[8]: https://www.debugpoint.com/2021/11/linux-kernel-5-15/
[9]: https://launchpad.net/ubuntu/+source/ubuntu-drivers-common
[10]: https://gitlab.gnome.org/GNOME/mutter/-/merge_requests/1441
[11]: https://www.debugpoint.com/2022/03/gnome-42-release/
[12]: https://t.me/debugpoint
[13]: https://twitter.com/DebugPoint
[14]: https://www.youtube.com/c/debugpoint?sub_confirmation=1
[15]: https://facebook.com/DebugPoint

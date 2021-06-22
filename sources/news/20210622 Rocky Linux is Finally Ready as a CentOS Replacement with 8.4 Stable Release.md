[#]: subject: (Rocky Linux is Finally Ready as a CentOS Replacement with 8.4 Stable Release)
[#]: via: (https://news.itsfoss.com/rocky-linux-8-4-release/)
[#]: author: (Ankush Das https://news.itsfoss.com/author/ankush/)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Rocky Linux is Finally Ready as a CentOS Replacement with 8.4 Stable Release
======

One of the most anticipated releases in 2021 — **Rocky Linux** as an alternative to CentOS, is finally here, with its first stable release 8.4 (**Green Obsidian**) ready for production use.

If you have been keeping up with the news, it was interesting to see that Rocky Linux 8.3 release candidate was not slated for a stable release. Instead, it was followed by another 8.4 RC 1 release, which finally made its way to the general availability.

Not to forget, it was also one of my favorite [distros to look forward to in 2021][1].

Now that it is here as a CentOS replacement, potentially dropping the need to switch to [CentOS Stream][2], what’s on board in this release (changes from upstream)?

### Rocky Linux 8.4: Overview

Rocky Linux 8.4 is a community-powered enterprise operating system based on Red Hat Enterprise Linux 8.4.

If you were testing the release candidate releases, you would not be able to migrate.

With this release, a conversion tool ([migrate2ro][3][c][3][ky][3]) has also been made available that can help migrate your existing enterprise Linux system to Rocky Linux.

It has been tested to be useful for migrating from Alma Linux, CentOS Linux 8.4, RHEL 8.4, and Oracle Linux 8.4 but to be used at your own risk.

In addition to that, there are some major changes worth noting:

### Security Improvements

The IPsec VPN by Libreswan has improved with TCP encapsulation support and security labels for IKEv2 protocol have been added as well.

There are a couple of package updates to security tools that improve the memory management as well.

### Kernel Improvements

Along with some technical changes to improve the memory allocation, as mentioned in the [release notes][4], there are some new additions as well.

To quote it from the notes:

> A new implementation of slab memory controller for the control groups technology is now available in Rocky Linux 8.4. The slab memory controller brings improvement in slab utilization, and enables to shift the memory accounting from the page level to the object level. As a result, you can observe a significant drop in the total kernel memory footprint and positive effects on memory fragmentation.

Rocky Linux 8.4 also supports Error Detection and Correction (EDAC) kernel module to work with Intel 8th and 9th gen processors.

#### Other Upgrades

Rocky Linux 8.4 comes with some of the latest modules that include:

  * Python 3.9
  * SWIG 4.0
  * Subversion 1.14
  * Redis 6
  * PostgreSQL 13
  * MariaDB 10.5



Compiler tool sets have also been updated that include: GCC Toolset 10, LLVM Toolset 11.0.0, Rust Toolset 1.49.0, and Go Toolset 1.15.7.

### Download Rocky Linux 8.4

You can download the ISO from the official website. In either case, you can also opt for the available container images in the [Docker Hub][5] and [Quay.io][6].

You should also find it with Amazon Web Services and Google Cloud Platform.

Do note that the first ISO does not come with Secure Boot support. There will be another ISO release later which will include the Secure Boot support.

[Rocky Linux 8.4][7]

#### Big Tech Websites Get Millions in Revenue, It's FOSS Got You!

If you like what we do here at It's FOSS, please consider making a donation to support our independent publication. Your support will help us keep publishing content focusing on desktop Linux and open source software.

I'm not interested

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/rocky-linux-8-4-release/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://news.itsfoss.com/linux-distros-for-2021/
[2]: https://itsfoss.com/centos-stream-faq/
[3]: https://github.com/rocky-linux/rocky-tools/tree/main/migrate2rocky
[4]: https://docs.rockylinux.org/release_notes/8.4
[5]: https://hub.docker.com/r/rockylinux/rockylinux/tags
[6]: https://quay.io/repository/rockylinux/rockylinux?tab=tags
[7]: https://rockylinux.org/download

[#]: subject: (Rocky Linux 8.4 is here As First Stable Version. Recap and Download Details.)
[#]: via: (https://www.debugpoint.com/2021/06/rocky-linux-8-4-release/)
[#]: author: (Arindam https://www.debugpoint.com/author/admin1/)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Rocky Linux 8.4 is here As First Stable Version. Recap and Download Details.
======
The Rocky Linux team announced the general availability of Rocky Linux
8.4 (Green Obsidian) stable as a CentOS replacement. We wrap up this
very first release in this post.
Within months of the first announcement as a true CentOS replacement, the team really pulled this off and brings you the stable version of Rocky Linux 8.4. This release is exact binary compatible with the Red Hat Enterprise Linux version 8.4.

The Rocky Linux team did a tremendous job to pull off a completely new Linux Server Distribution within months. It is a collaborative effort of many people including the core team which brings you a true Cent OS replacement that is completely free and open-source.

That said, lets have a quick look at this stable release.

![Rocky Linux 8.4 Release][1]

### Rocky Linux 8.4 – Summary of Changes

Rocky Linux 8.4 is binary compatible with the Red Hat Enterprise Linux 8.4. Hence it is powered by stable Linux Kernel 4.8 at the core. Being a server OS you may not get the latest Linux Kernel at the moment as they are not widely tested and have little EOL span.

On the development tools and database aspect you get the following packages with this release:

  * Python 3.9
  * SWIG 4.0
  * Subversion 1.14
  * Redis 6
  * PostgreSQL 13
  * MariaDB 10.5


  * GCC Toolset 10
  * LLVM Toolset 11.0.0
  * Rust Toolset 1.49.0
  * Go Toolset 1.15.7



There are some security and networking features that have been incorporated in this release.

  * “IPsec VPN provided by Libreswan now supports TCP encapsulation and security labels for IKEv2.
  * The scap-security-guide packages have been rebased to version 0.1.54, and OpenSCAP has been rebased to version 1.3.4. These updates provide substantial improvements, including Improved memory management.
  * The fapolicyd framework now provides integrity checking, and the RPM plugin now registers any system update that is handled by either the YUM package manager or the RPM Package Manager.”


  * Nmstate is a network API for hosts and fully supported in Rocky Linux 8.4. The nmstate packages provide a library and the nmstatectl command-line utility to manage host network settings in a declarative manner.


  * The Multi-protocol Label Switching (MPLS) is an in-kernel data-forwarding mechanism to route traffic flow across enterprise networks. For example, you can add tc filters for managing packets received from specific ports or carrying specific types of traffic, in a consistent way.



[][2]

SEE ALSO:   Project Lenix - Another CentOS Fork Announced by CloudLinux Team

### Migrate to Rocky Linux – Automation Script

If you are one **of those sysadmins who waited this long for the stable Rocky Linux for your servers, well, good news for you. The team introduces a seamless conversion script called [migrate2rocky][3].

The tool takes away your efforts and streamlines your migration. The tool has been tested with use cases such as migration from Alma Linux, CentOS 8.4, Oracle Linux 8.4, and Red hat Enterprise Linux 8.4.

Overall feedback of the tool is great and should be effortless.

[A detailed release note is present here.][4]

### Download

You can download the Rocky Linux minimal, dvd .iso from the below link.

The DVD .iso is around ~9 GB in size. If you are planning for a fresh server setup, get the minimal .iso which is around ~1.5GB, and install packages as you go.

[rocky linux 8.4][5]

Please note that migration to Rocky Linux 8.4 is not supported from [Rocky Linux 8.3 RC1][6], Rocky Linux 8.4 RC1, or any other release candidates.

For help and support, reach out to the experts at the [official forum][7].

If you are interested, read our featured article – [Top 5 Free Linux Distributions for CentOS Replacement (Desktop and Server)][8].

* * *

--------------------------------------------------------------------------------

via: https://www.debugpoint.com/2021/06/rocky-linux-8-4-release/

作者：[Arindam][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.debugpoint.com/author/admin1/
[b]: https://github.com/lujun9972
[1]: https://www.debugpoint.com/blog/wp-content/uploads/2021/06/Rocky-Linux-8.4-Release-1024x767.jpg
[2]: https://www.debugpoint.com/2020/12/project-lenix/
[3]: https://github.com/rocky-linux/rocky-tools/tree/main/migrate2rocky
[4]: https://docs.rockylinux.org/release_notes/8.4
[5]: https://rockylinux.org/download
[6]: https://www.debugpoint.com/2021/05/rocky-linux-8-3-rc1/
[7]: https://forums.rockylinux.org/
[8]: https://www.debugpoint.com/blog/wp-admin/post.php?post=6090&action=edit

[#]: subject: "VirtualBox 7.0 Releases With Secure Boot and Full VM Encryption Support"
[#]: via: "https://news.itsfoss.com/virtualbox-7-0-release/"
[#]: author: "Sourav Rudra https://news.itsfoss.com/author/sourav/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

VirtualBox 7.0 Releases With Secure Boot and Full VM Encryption Support
======
VirtualBox 7.0 is a big upgrade since its last major update. Some nice advancements!

![VirtualBox 7.0 Releases With Secure Boot and Full VM Encryption Support][1]

A big upgrade for VirtualBox. This release is pretty interesting because we haven't seen a major update in recent years.

For those unfamiliar with VirtualBox, it is a virtualization software developed by [Oracle][2].

With the launch of VirtualBox 7.0, many new features have been added.

Let's take a look at some of the most crucial ones.

### VirtualBox 7.0: What's New?

![virtualbox 7.0][3]

VirtualBox 7.0 is a helpful upgrade. There are icon updates, theme improvements, and some key highlights, including:

* A new utility to show performance statistics for running guests.
* Secure boot support.
* Full VM encryption support (via CLI).
* Reworked new virtual machine wizard.

#### Full VM Encryption via CLI

Virtual Machines (VM) can now be fully encrypted, but only through the command-line interface.

This also includes the config logs and saved states.

As of now, users can encrypt their machines only through the command-line interface, and different methods are to be added in the future.

#### New Resource Monitor Utility

![virtualbox 7.0 resource monitor][4]

The new utility lets you monitor performance statistics like CPU, RAM usage, disk I/O, and more. It would list the performance stats for all the running guests.

Not the most attractive addition, but useful.

#### Improved Theme Support

The support for themes has been improved on all platforms. The native engine is used on Linux and macOS, and on Windows, a separate implementation is in place.

#### Support for Secure Boot

VirtualBox now supports Secure Boot, enhancing security against malware, viruses, and spyware.

It will also prevent a VM from booting up with broken drivers, which is very important for enterprise applications.

Users who use operating systems that require a secure boot to run should be able to create VMs easily.

#### Other Changes

VirtualBox 7.0 is a significant upgrade. So, there are several feature additions and refinements across the board.

For instance, the new VM wizard has now been reworked to integrate unattended guest OS installations.

![virtualbox 7.0 unattended distro installs][5]

Other improvements include:

* Cloud virtual machines can now be added to VirtualBox and controlled as local VMs.
* The VirtualBox icon has been updated with this release.
* A new 3D stack has been introduced that supports DirectX 11. It uses [DXVK][6] to provide the same support for non-Windows hosts.
* Support for virtual TPM 1.2/2.0.
* Improved mouse handling in multi-monitor setups.
* Vorbis is the default audio codec for audio recording.

You can review the [release notes][7] for additional information.

If you were looking for enhanced features, such as better theme support, encryption features, secure boot support, and similar feature additions, VirtualBox 7.0 is a nice upgrade.

💬 *What do you think about the upgrade? Would you use the newer version or stick to the older version for your VMs for now?*

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/virtualbox-7-0-release/

作者：[Sourav Rudra][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/sourav/
[b]: https://github.com/lkxed
[1]: https://news.itsfoss.com/content/images/size/w1200/2022/10/virtualbox-7-0-release.jpg
[2]: https://www.oracle.com/in/
[3]: https://news.itsfoss.com/content/images/2022/10/VirtualBox_7.0.png
[4]: https://news.itsfoss.com/content/images/2022/10/VirtualBox_7.0_Resource_Monitor.png
[5]: https://news.itsfoss.com/content/images/2022/10/VirtualBox_7.0_Unattended_Guest_Install.png
[6]: https://github.com/doitsujin/dxvk
[7]: https://www.virtualbox.org/wiki/Changelog-7.0

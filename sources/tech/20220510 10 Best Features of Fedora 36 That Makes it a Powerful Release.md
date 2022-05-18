[#]: subject: "10 Best Features of Fedora 36 That Makes it a Powerful Release"
[#]: via: "https://www.debugpoint.com/2022/05/fedora-36-features/"
[#]: author: "Arindam https://www.debugpoint.com/author/admin1/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

10 Best Features of Fedora 36 That Makes it a Powerful Release
======
If you are excited about the Fedora 36 release, here’s a quick summary of the 10 best Fedora 36 features that you should check out before trying.

![Fedora 36 Workstation Desktop][1]

Fedora 36 releases on May 10, 2022, and it brings a list of special features across the desktop, flavours, internal structures and more. Before installing or upgrading it, you should know about the unique features. Here they are.

### Best Fedora 36 Features

#### 1. GNOME 42 as Default Workstation Desktop

The most important feature of Fedora 36 is the brand new GNOME 42, which comes as default with the Fedora Workstation edition. With the Fedora Workstation edition, you get the original GNOME 42 version without any customisation, unlike Ubuntu. Hence to experience the vanilla GNOME 42, Fedora 36 is the perfect choice for you.

Firstly, GNOME 42 brings the modern GTK4 and libadwaita based Shell and native applications. Most native GNOME apps are already ported to GTK4, giving a revamped look with friendly UI components. You should notice the difference in every nook and corner of the desktop.

Not only that, this version of GNOME introduces the Dark and Light Style in the Appearance section. The native applications also adapt to the light and dark styles automatically. Moreover, the wallpaper can also change based on the style, and you can create [dark and light versions of the wallpaper][2].

Furthermore, GNOME 42 brings a [new text editor][3], a new screenshot and screencast tool and well designed on-screen display. You may want to read the [features of GNOME 42 here in detail][4].

#### 2. Linux Kernel 5.17

In addition to that, Fedora 36 also brings the latest mainline Linux Kernel 5.17, which has support for all the modern GPU, CPU and other improvements. The updates in this Kernel include temperature support for the AMD Zen family of devices, a long-standing Floppy Disk hangs bug, a handful of ARM/SoC support and performance improvements across all subsystems.

You can read our [detailed Linux Kernel 5.17][5] coverage to learn more.

#### 3. Wayland by Default for NVIDIA Proprietary Drivers

Perhaps the most impactful change in this release is the decision from Fedora to make [Wayland as default][6] session with NVIDIA proprietary driver. If you remember, Wayland was the default server since Fedora 22, but it has not defaulted when the NVIDIA proprietary driver is in use. And it changes now. So, while updating or installing an NVIDIA system, check the session type before login.

#### 4. Systemd Messages Updates

Other than the above changes, the systemd messages become more friendly with a small but impactful change on how the messages are logged in this release. In Fedora 36, the systemd messages show the unit name with the usual name. For example, if it shows “Network Manager”, it would now show “NetworkManager.service” and the name. This will help debug some problems in a system requiring scrolling through thousands of messages.

![More detailed journalctl messages in Fedora 36][7]

#### 5. System Font Changes

On top of the above changes, the default font type is changing to Noto Font from DejaVu fonts. This will provide a better experience and consistent text rendering across the desktop. So, google-noto-sans* packages will be installed by default to replace dejavu*.

#### 6. Updated Spins

That’s not all the changes, the official Fedora flavours or Spins are also refreshed with their stable versions. Not all desktop environments get major releases in a year, but you always get the latest bugfix versions with Fedora.

Here’s a quick recap of the version of the official Fedora Spins in this release.

* Fedora KDE with KDE Plasma 5.24
* Fedora with Xfce 4.16
* Fedora with LXQt 1.1
* Fedora MATE-Compiz with MATE 1.24

#### 7. Tool Chain Updates

Many Fedora users are the developers who use it for their personal or professional work. For programmers or developers, the toolchain is important. Because Fedora features the latest compilers, databases and other dependent packages. Here’s a quick list of packages and applications:

* PHP 8.1
* Ruby on Rails 7.0
* OpenJDK 17
* Django 4.0
* gcc 12
* glibc 2.35
* Golang 1.18
* OpenSSL 3.0
* Ruby 3.1
* Ansible 5
* Firefox 100
* LibreOffice 7.3

#### 8. Single User as Admin

The majority of the Fedora workstation installations are single-user types than the shared or enterprise users. Hence, Fedora 36 makes the single user as administrator by default during installation with this release. The Anaconda installer sets the admin option by default.

#### 9. RPM Structure

The internal RPM package database in the Fedora system is located under `/var` today. With this release, it is [moving][8] to `/usr` directory. The primary reason is consistency with other RPM-based distributions such as openSUSE and Fedora rpm-ostree based systems (Kinoite, Silverblue, etc.)

#### 10. NetworkManager Configuration

Finally, this release removes the NetworkManager legacy configuration file support (ifcfg files). This is a classic case of Fedora being a pioneer in adopting new methods, deprecating the older way of doing things. The NetworkManager evolved over the years and now uses more streamlined configuration files called keyfiles. Hence, it is no longer necessary to support the older ifcfg files for compatibility reasons. For more details about this change, visit this [excellent article][9] from Fedora Magazine.

### Closing Notes

In addition to the above changes, this release brings many more under the hood performance tweaks and bug fixes which you can read [here][10].

Fedora 36 releases on May 10, 2022.

--------------------------------------------------------------------------------

via: https://www.debugpoint.com/2022/05/fedora-36-features/

作者：[Arindam][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.debugpoint.com/author/admin1/
[b]: https://github.com/lkxed
[1]: https://www.debugpoint.com/wp-content/uploads/2022/05/Fedora-36-Workstation-Desktop.jpg
[2]: https://www.debugpoint.com/2022/04/custom-light-dark-wallpaper-gnome/
[3]: https://www.debugpoint.com/2021/12/gnome-text-editor/
[4]: https://www.debugpoint.com/2022/03/gnome-42-release/
[5]: https://www.debugpoint.com/2022/03/linux-kernel-5-17/
[6]: https://www.debugpoint.com/wp-admin/.org/wiki/Changes/WaylandByDefaultOnNVIDIA
[7]: https://www.debugpoint.com/wp-content/uploads/2022/05/More-detailed-journalctl-messages-in-Fedora-36.jpg
[8]: https://fedoraproject.org/wiki/Changes/RelocateRPMToUsr
[9]: https://fedoramagazine.org/converting-networkmanager-from-ifcfg-to-keyfiles/
[10]: https://fedoraproject.org/wiki/Releases/36/ChangeSet

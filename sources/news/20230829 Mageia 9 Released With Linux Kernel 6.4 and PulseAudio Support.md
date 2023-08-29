[#]: subject: "Mageia 9 Released With Linux Kernel 6.4 and PulseAudio Support"
[#]: via: "https://news.itsfoss.com/mageia-9-released/"
[#]: author: "Sourav Rudra https://news.itsfoss.com/author/sourav/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Mageia 9 Released With Linux Kernel 6.4 and PulseAudio Support
======
Mageia's next big release is here. Check it out.
What started as a fork of [Mandriva Linux][1], now has grown into a fully-fledged [independent Linux distro][2].

Started back in 2010, Mageia has come a long way since. It is now a stable and secure operating system for desktop/server use that gets regular updates.

With a recent announcement, Mageia 9 was introduced with plenty of key improvements.

Allow me to take you through those.

## 🆕 Mageia 9: What's New?

Powered by the recently released [Linux Kernel 6.4][3], Mageia 9 offers a plethora of improvements over its predecessor.

Some key highlights include:

  * **Better Kernel and Hardware Support**
  * **Updated Software Suite**
  * **Desktop Environment Upgrades**



### Better Kernel and Hardware Support

Thanks to Linux Kernel 6.4, Mageia 9 is equipped with **[Mesa 3D 23.1][4]** , that has resulted in better graphics support than ever before.

In the case of hardware, **Mageia 9 uses free video drivers for AMD/ATI graphics cards, AMDGPU** , to support both newer and older cards. But, proprietary drivers don't seem to work with this release.

Similarly, **in the case of Nvidia** , the performance of the Xorg Nouveau driver has been enhanced compared to Mageia 8, and proprietary Nvidia drivers are provided via the non-free repositories.

This has allowed for supporting both, older, and newer Nvidia GPUs.

Furthermore, Mageia 9 is offered with **X.Org 21.1.8** and **XWayland 22.1.9,** they have been split from Xserver for easier maintenance.

### Updated Software Suite

Mageia 9 features an extensive suite of applications, that have been updated to newer versions.

Some include:

  * **[LibreOffice 7.5][5]**
  * **Blender 3.3.4**
  * **VirtualBox 7.0.10**
  * **NeoVim 0.9.1**
  * **Xen 4.17.0**
  * **Ruby 3.1.4**
  * **QEmu 7.2**
  * **RPM 4.18**
  * **Vim 9.0**
  * **PHP 8.2**



**Suggested Read** 📖

### Desktop Environment Upgrades

First things first, as Mageia's default desktop is KDE Plasma, we start with that.

Mageia 9 features **KDE Plasma 5.27.5** , that has been built on top of **Qt 5.15.7** , **KDE Frameworks 5.105** , and **KDE Applications 23.04.1**.

**Suggested Read** 📖

Then, for **GNOME edition** , Mageia 9 features **GNOME 44.2** , that now defaults to running Wayland on boot with an alternative “GNOME on Xorg” session available.

**In the case of Xfce** , Mageia 9 features [**Xfce 4.18**][6], that now has dedicated 32-bit/64-bit Live DVDs.

And finally, to sum it up, we have **MATE 1.26.0** , **Cinnamon 5.6** , and **LXQt 1.3.0** as other variants being offered with Mageia 9.

### 🛠️ Other Technical Changes

To conclude, here are some other changes that are worth mentioning:

  * Support for both PulseAudio and PipeWire sound servers.
  * Lower install footprint if disabling the recommended packages.
  * The RPM database now uses SQLite instead of Berkeley DB.
  * Major performance improvements for [Nvidia Optimus][7] laptops.



You may go through the [release notes][8] to know more about this release.

**Suggested Read** 📖

## 📥 Download Mageia 9

Mageia 9 is available for download right now, head over to the [official website][9] to get started.

[Mageia 9][9]

**For existing users:** You can follow the official [handy guide][10] to upgrade.

_💬 What do you think about the new changes? Were you waiting for this release? Share your thoughts in the comments down below._

* * *

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/mageia-9-released/

作者：[Sourav Rudra][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/sourav/
[b]: https://github.com/lujun9972
[1]: https://en.wikipedia.org/wiki/Mandriva_Linux
[2]: https://itsfoss.com/independent-linux-distros/
[3]: https://news.itsfoss.com/linux-kernel-6-4/
[4]: https://docs.mesa3d.org/relnotes/23.1.0.html
[5]: https://news.itsfoss.com/libreoffice-7-5-release/
[6]: https://news.itsfoss.com/xfce-4-18-release/
[7]: https://en.wikipedia.org/wiki/Nvidia_Optimus
[8]: https://wiki.mageia.org/en/Mageia_9_Release_Notes
[9]: https://www.mageia.org/en/downloads/
[10]: https://wiki.mageia.org/en/How_to_choose_the_right_Mageia_upgrade_method

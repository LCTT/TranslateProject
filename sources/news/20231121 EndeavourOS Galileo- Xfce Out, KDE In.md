[#]: subject: "EndeavourOS Galileo: Xfce Out, KDE In"
[#]: via: "https://news.itsfoss.com/endeavouros-galileo/"
[#]: author: "Sourav Rudra https://news.itsfoss.com/author/sourav/"
[#]: collector: "lujun9972/lctt-scripts-1700446145"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

EndeavourOS Galileo: Xfce Out, KDE In
======
Arch-based EndeavourOS makes interesting changes with its latest
release.
A new release for one of the [top Arch-based user friendly Linux distributions][1], EndeavourOS is here.

Code-named “ **Galileo** ”, this follows the same naming scheme as we have seen in past releases such as [EndeavourOS 'Cassini'][2].

Let's take a look at what 'Galileo' has to offer.

## 🆕 EndeavourOS Galileo: What's New?

![][3]

Even though this release took some time to arrive, this is **a major upgrade with some important changes**. The most obvious one being the transition to KDE Plasma, and the dropping of Xfce, more on that later.

**The developers decided to make EndeavourOS leaner than before** , cutting down several pre-settings, but still letting you easily jump start with Arch Linux.

Some **key highlights** of this release include:

  * **Welcome App Improvements**
  * **Calamares Installer Tweaks**
  * **KDE Plasma replaces Xfce**



### Welcome App Improvements

![][4]

The welcome app that shows up while installing has been improved, it now features a dedicated **language selection option** on the bottom left.

The icons were also updated, and the installer now features KDE Plasma by default.

### Calamares Installer Tweaks

![][5]

In line with KDE Plasma being made the default, the [Calamares][6] installer on EndeavourOS Galileo **only allows one desktop environment/window manager to be installed** during the installation process.

This was done in a bid to mitigate the issues arising out of conflicting packages post install. You **can still install other desktop environments/window managers** after the installation is complete.

That's not all, the **developers have also removed community editions from the installer**. So, variants such as **Sway** , **Qtile** , **BSPWM** , **Openbox** , and **Worm** are not available to install via Calamares anymore.

They had to be dropped because most of the original devs have left the project, and no one else picked these up. Luckily, **you can manually install these community editions** from their [GitHub page][7].

### KDE Plasma replaces Xfce

![][8]

Going forward, **KDE Plasma will be used as the default desktop environment** for running on the live environment and the offline install option, replacing Xfce.

Don't worry, **you can still install Xfce during the installation of EndeavourOS** , the screenshot shown earlier is proof of that.

As mentioned by the devs, the reason behind this move was the following:

> To make development and maintenance easier for the team, we switched to KDE Plasma instead of Xfce due to a more native experience for our developers with the Calamares installer.

### 🛠️ Other Changes and Improvements

Here are some other highlights worth noting:

  * **Local Hostname Resolution** is enabled on a new installation.
  * Implementation of stronger **LUKS2 encryption** when systemd-boot is selected.
  * The **permissions for EFI partition** were made stricter in a bid to avoid bugs.
  * The **package selection screen** on Calamares has been restructured to be more intuitive.



You may go through the official [announcement blog][9] to learn more about the “Galileo” release.

## 📥 Get EndeavourOS Galileo

This release of EndeavourOS is available from the [official website][10], they have also **added new download mirrors** around the world for better accessibility.

[EndeavourOS Galileo][10]

### Impact on existing users?

No. The changes that have arrived with this release only affect new installs, the installer, and the live environment on the ISO.

**Upgrading to Galileo is not mandatory** , existing users who update their systems regularly should be fine.

_💬 What are your opinions of this release? Was dropping Xfce a good idea?_

* * *

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/endeavouros-galileo/

作者：[Sourav Rudra][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/sourav/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/arch-based-linux-distros/
[2]: https://news.itsfoss.com/endeavouros-cassini/
[3]: https://news.itsfoss.com/content/images/2023/11/EndeavourOS_Galileo_1.jpg
[4]: https://news.itsfoss.com/content/images/2023/11/EndeavourOS_Galileo_2.png
[5]: https://news.itsfoss.com/content/images/2023/11/EndeavourOS_Galileo_3.png
[6]: https://calamares.io/
[7]: https://github.com/EndeavourOS-Community-Editions
[8]: https://news.itsfoss.com/content/images/2023/11/EndeavourOS_Galileo_4.jpg
[9]: https://endeavouros.com/news/slimmer-options-but-lean-and-in-a-new-live-environment-galileo-has-arrived/
[10]: https://endeavouros.com/

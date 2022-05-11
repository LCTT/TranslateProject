[#]: subject: "What’s new in Fedora Workstation 36"
[#]: via: "https://fedoramagazine.org/whats-new-fedora-36-workstation/"
[#]: author: "Merlin Cooper https://fedoramagazine.org/author/mxanthropocene/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

What’s new in Fedora Workstation 36
======

![][1]

The latest release of Fedora Workstation 36 continues the Fedora Project’s ongoing commitment to delivering the latest innovations in the open source world. This article describes some of the notable user-facing changes that appear in this version.

### GNOME 42

Fedora Workstation 36 includes the latest version of the GNOME desktop environment. GNOME 42 includes many improvements and new features. Just some of the improvements include:

* Significantly improved input handling, resulting in lower input latency and improved responsiveness when the system is under load. This is particularly beneficial for games and graphics applications.
* The Wayland session is now the default for those who use Nvidia’s proprietary graphics driver.
* A universal dark mode is now available.
* A new interface has been added for taking screenshots and screen video recordings.

In addition, many of the core apps have been ported to GTK 4, and the shell features a number of subtle refinements.

#### Refreshed look and feel

![GNOME 42 as featured in Fedora Workstation 36][2]

GNOME Shell features a refreshed look and feel, with rounder and more clearly separated elements throughout. All the symbolic icons have been updated and the top bar is no longer rounded.

#### Universal dark mode option

In Settings > Appearance, you can now choose a dark mode option which applies a dark theme to all supported applications. In addition, the pre-installed wallpapers now include dark mode variants. Dark themes can help reduce eye-strain when there is low ambient light, can help conserve battery life on devices with OLED displays, and can reduce the risk of burn-in on OLED displays. Plus, it looks cool!

#### New screenshot interface

![Taking screenshots and screen video recordings is now easier than ever][3]

Previously, pressing the Print Screen key simply took a screenshot of the entire screen and saved it to the Pictures folder. If you wanted to customize your screenshots, you had to remember a keyboard shortcut, or manually open the Screenshots app and use that to take the screenshot you wanted. This was inconvenient.

Now, pressing Print Screen presents you with an all-new user interface that allows you to take a screenshot of either your entire screen, just one window, or a rectangular selection. You can also choose whether to hide or show the mouse pointer, and you can also now take a screen video recording from within the new interface.

#### Core applications

![Apps made in GTK 4 + libadwaita feature a distinct visual style][4]

GNOME’s core applications have seen a number of improvements. A number of them have been ported to GTK 4 and use libadwaita, a new widget library that implements GNOME’s Human Interface Guidelines.

* Files now includes the ability to sort files by creation date, and includes some visual refinements, such as a tweaked headerbar design and file renaming interface.
* The Software app now includes a more informative update interface, and more prominently features GNOME Circle apps.
* The Settings app now has a more visually appealing interface matching the visual tweaks present throughout GNOME Shell.
* Text Editor replaces Gedit by default. Text Editor is an all-new app built in GTK 4 and libadwaita. You can always reinstall Gedit by searching for it in the Software app.

#### Wayland support on Nvidia’s proprietary graphics driver

In previous versions, Fedora Workstation defaulted to the X display server when using Nvidia’s proprietary graphics driver – now, Fedora Workstation 36 uses the Wayland session by default when using Nvidia’s proprietary graphics driver.

If you experience issues with the Wayland session, you can always switch back to the Xorg session by clicking the gear icon at the bottom-right corner of the login screen and choosing “GNOME on Xorg”.

### Under-the-hood changes throughout Fedora Linux 36

* When installing or upgrading packages with DNF or PackageKit, weak dependencies that have been manually removed will no longer be reinstalled. That is to say: if _foo_ is installed and it has _bar_ as a weak dependency, and _bar_ is then removed, _bar_ will not be reinstalled when _foo_ is updated.
* The Noto fonts are now used by default for many languages. This provides greater coverage for different character sets. For users who write in the Malayalam script, the new Meera and RIT Rachana fonts are now the default.
* systemd messages now include unit names by default rather than just the description, making troubleshooting easier.

![systemd messages shows unit names by default][5]

### Upgrade now!

You can upgrade your system through GNOME Software, via _[dnf system-upgrade][6]_ in the terminal, or [download the live ISO image][7] from the official website.

### Also check out…

There are always cool things happening in the Fedora Project!

* The social links in the upper right corner on Fedora Magazine now include our official [Fedora YouTube prescence][8], [Fedora Matrix homeserver][9], and the [Fedora Discussion][10] website!
* Fedora Discussion has been lightly renovated! Come and chat with us! ☺️

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/whats-new-fedora-36-workstation/

作者：[Merlin Cooper][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/mxanthropocene/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2022/04/fedora36workstation-816x345.jpg
[2]: https://fedoramagazine.org/wp-content/uploads/2022/03/fw36-1-1024x640.png
[3]: https://fedoramagazine.org/wp-content/uploads/2022/03/scrui.png
[4]: https://fedoramagazine.org/wp-content/uploads/2022/03/libadwaitat-1024x633.png
[5]: https://fedoramagazine.org/wp-content/uploads/2022/03/systemdmsg.png
[6]: https://docs.fedoraproject.org/en-US/quick-docs/dnf-system-upgrade/
[7]: https://getfedora.org/en/workstation/download/
[8]: https://www.youtube.com/channel/UCnIfca4LPFVn8-FjpPVc1ow
[9]: https://chat.fedoraproject.org/#/welcome
[10]: https://discussion.fedoraproject.org/

[#]: subject: "What’s new in Fedora Workstation 37"
[#]: via: "https://fedoramagazine.org/whats-new-fedora-37-workstation/"
[#]: author: "Merlin Cooper https://fedoramagazine.org/author/mxanthropocene/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

What’s new in Fedora Workstation 37
======

![][1]

Fedora Workstation 37 is the latest version of the Fedora Project’s desktop operating system, made by a worldwide community dedicated to pushing forward innovation in open source. This article describes some of the new user-facing features in Fedora Workstation 37. Upgrade today from GNOME Software, or by using _[dnf system-upgrade][2]_ in your favourite terminal emulator!

### GNOME 43

Fedora Workstation 37 features the latest version of the GNOME desktop environment which sees more core applications ported to GTK 4, user interface tweaks, and performance tune-ups. Check out the [GNOME 43 release notes][3] for more information!

#### Redesigned Quick Settings menu

![No need to open Settings just to change to and from Dark Mode][4]

The new Quick Settings menu offers more control and convenience. You can now easily switch your Wi-Fi network in the menu instead of being taken to a full-screen dialogue box, change between default and dark modes, and enable Night Light without opening the Settings app. A convenient button for taking screenshots and screencasts is also now present.

#### Core applications

The GNOME core applications included in Fedora Workstation 37 have seen a round of tweaks and improvements.

  * Files has been ported to GTK 4, and the user interface has seen many improvements. Here are just some of them:
    * It is now adaptive – meaning it automatically adjusts to a narrower size, making better use of the available space.
    * The list view has been re-architected to make rubber-band selections easier.
    * The “Properties” and “Open With…” dialogues have been redesigned.



![Rubber-band selection in Files 43][5]

  * Calendar features a new sidebar that shows your upcoming events at a glance. It, along with Contacts, now feature adaptive user interfaces.
  * Characters now shows you different skin tone, hair colour, and gender options for emoji.
  * The package source selector in Software has been redesigned and moved to a more visible location.
  * Maps has been ported to GTK 4.
  * Settings includes a new Device Security panel, allowing you to easily see the hardware security features your devices offers – or lacks!



![Uh oh!][6]

### New supplemental default wallpapers

Fedora Workstation 37 ships with a new set of supplemental wallpapers. [See how they were made here!][7]

![The six new wallpapers come in both light and dark variants][8]

### Under-the-hood changes throughout Fedora Linux 37

Fedora Linux 37 features many under-the-hood changes. Here are some notable ones:

  * The Raspberry Pi 4 single-board computer is now officially supported, including 3D acceleration!
  * New installs on BIOS systems will use the GPT disk layout instead of the legacy MBR layout. The installer images will also now use GRUB instead of syslinux to boot on BIOS systems.
  * If you disable and then re-enable SELinux, or run the _fixfiles onboot_ command, the file system relabelling processes will now be done in parallel, allowing for a significant speed boost.
  * The default fonts for Persian has been changed from DejaVu and Noto Sans Arabic to Vazirmatn, providing a more consistent experience for those who use Fedora Linux in Persian.



### Also check out…

Cool happenings throughout the Fedora Project!

  * Fedora CoreOS and Fedora Cloud Base have been promoted to Edition status!
  * Preview installer images with a new GUI for Anaconda, the Fedora Linux system installer, will become available in about a week. An article will be published with more details, so watch this space!



--------------------------------------------------------------------------------

via: https://fedoramagazine.org/whats-new-fedora-37-workstation/

作者：[Merlin Cooper][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/mxanthropocene/
[b]: https://github.com/lujun9972
[1]: https://fedoramag.wpenginepowered.com/wp-content/uploads/2022/10/f37-whats_new-816x345.jpg
[2]: https://docs.fedoraproject.org/en-US/quick-docs/dnf-system-upgrade/
[3]: https://release.gnome.org/43/
[4]: https://fedoramag.wpenginepowered.com/wp-content/uploads/2022/09/ezgif.com-gif-maker1.gif
[5]: https://fedoramag.wpenginepowered.com/wp-content/uploads/2022/09/ezgif.com-gif-maker2.gif
[6]: https://fedoramag.wpenginepowered.com/wp-content/uploads/2022/09/Screenshot-from-2022-09-16-20-25-28-1024x708.png
[7]: https://blog.linuxgrrl.com/2022/06/27/abstract-wallpapers-in-blender-using-geometry-nodes/
[8]: https://fedoramag.wpenginepowered.com/wp-content/uploads/2022/09/dfg-1-1024x679.png

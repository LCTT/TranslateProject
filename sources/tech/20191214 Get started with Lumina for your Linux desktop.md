[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Get started with Lumina for your Linux desktop)
[#]: via: (https://opensource.com/article/19/12/linux-lumina-desktop)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

Get started with Lumina for your Linux desktop
======
This article is part of a special series of 24 days of Linux desktops.
The Lumina desktop is a shortcut to a quick and sensible Fluxbox-based
desktop with all the things you can't live without.
![Lightbulb][1]

For a good number of years, there was a desktop operating system (OS) based on FreeBSD called PC-BSD. It was intended as an OS for general use, which was noteworthy because BSD development mostly focuses on servers. For most of its life, PC-BSD shipped with the KDE desktop by default, but the more KDE came to depend on Linux-specific technology, the more PC-BSD migrated away from it. PC-BSD became [Trident][2], and its default desktop is [Lumina][3], a collection of widgets written to use the same Qt toolkit that KDE is based upon, running on the Fluxbox window manager.

You may find the Lumina desktop in your Linux distribution's software repository or in BSD's ports tree. If you install Lumina and you're already running another desktop, you may find yourself with redundant applications (two PDF readers, two file managers, and so on) because Lumina includes a few integrated applications. If you just want to try the Lumina desktop, you can install a Lumina-based BSD distribution in a virtual machine, such as [GNOME Boxes][4].

If you install Lumina on your current OS, you must log out of your current desktop session so you can log into your new one. By default, your session manager (SDDM, GDM, LightDM, or XDM, depending on your setup) will continue to log you into your previous desktop, so you must override that before logging in.

With GDM:

![Selecting your desktop in GDM][5]

With SDDM:

![Selecting your desktop in KDM][6]

### Lumina desktop

Lumina delivers a simple and lightweight desktop environment. There's a panel at the bottom of the screen containing an application menu on the left, a taskbar in the middle, and a system tray on the right. There are icons on the desktop providing quick access to common applications and locations.

In addition to this basic desktop structure, Lumina features a custom file manager, PDF viewer, screenshot tool, media player, text editor, and archive tool. There's also a configuration utility to help you customize your Lumina desktop, and you can find further configuration options by right-clicking on the desktop.

![Lumina desktop running on Project Trident][7]

Lumina is very similar to several Linux lightweight desktops, especially LXQT, except without any reliance upon Linux-based desktop frameworks like ConsoleKit, PolicyKit, D-Bus, or systemd. Whether or not that holds any advantage for you depends on the OS you're running. After all, if you're already running Linux with access to those features, using a desktop that doesn't utilize them may not make much sense and cost you features. If you're running BSD, then running Fluxbox with Lumina widgets could mean not having to install the Linux-compatible libraries from ports.

### Why you should use Lumina

Lumina is simple enough in design that it doesn't have many features you can't implement on your own by installing Fluxbox along with your favorite components ([PCManFM][8] for file management, a variety of [LXQt apps][9], [Tint2][10] for a panel, and so on). But this is open source, and users of open source love to find ways to avoid reinventing the wheel (almost as much as we love reinventing the wheel).

The Lumina desktop is a shortcut to a quick and sensible Fluxbox-based desktop with all the things you can't live without and very few of the finer details you'll want to configure yourself. Give the Lumina desktop a try to see if it's the desktop for you.

KDE originally stood for Kool Desktop Environment, but is now known by many as the K Desktop...

A brief overview of PC-BSD and thoughts about the distribution.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/12/linux-lumina-desktop

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/lightbulb-idea-think-yearbook-lead.png?itok=5ZpCm0Jh (Lightbulb)
[2]: https://project-trident.org/
[3]: https://lumina-desktop.org/
[4]: https://opensource.com/article/19/5/getting-started-gnome-boxes-virtualization
[5]: https://opensource.com/sites/default/files/uploads/advent-gdm_400x400_1.jpg (Selecting your desktop in GDM)
[6]: https://opensource.com/sites/default/files/uploads/advent-kdm_400x400_1.jpg (Selecting your desktop in KDM)
[7]: https://opensource.com/sites/default/files/uploads/advent-lumina.jpg (Lumina desktop running on Project Trident)
[8]: https://wiki.lxde.org/en/PCManFM
[9]: http://lxqt.org
[10]: https://opensource.com/article/19/1/productivity-tool-tint2

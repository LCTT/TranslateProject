[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Use the Window Maker desktop on Linux)
[#]: via: (https://opensource.com/article/19/12/linux-window-maker-desktop)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

Use the Window Maker desktop on Linux
======
This article is part of a special series of 24 days of Linux desktops.
Take a step back in time with Window Maker, which implements the old
Unix NeXTSTEP environment for today's users.
![Penguin with green background][1]

Before Mac OS X, there was a quirky closed-source Unix system called [NeXTSTEP][2]. Sun Microsystems later made NeXTSTEP's underpinnings an open specification, which enabled other projects to create free and open source versions of many NeXT libraries and components. GNUStep implemented the bulk of NeXTSTEP's libraries, and [Window Maker][3] implemented its desktop environment.

Window Maker mimics the NeXTSTEP desktop GUI closely and provides some interesting insight into what Unix was like in the late '80s and early '90s. It also reveals some of the foundational concepts behind window managers like Fluxbox and Openbox.

You can install Window Maker from your distribution's repository. To try it out, log out of your desktop session after the installation is complete. By default, your session manager (KDM, GDM, LightDM, or XDM, depending on your setup) will continue to log you into your default desktop, so you must override the default when logging in.

To switch to Window Maker on GDM:

![Selecting the Window Maker desktop in GDM][4]

And on KDM:

![Selecting the Window Maker desktop in KDM][5]

### Window Maker dock

By default, the Window Maker desktop is empty but for a few _docks_ in each corner. As in NeXTSTEP, in Window Maker, a dock area is where major applications can go to be minimized as icons, where launchers can be created for quick access to common applications, and where tiny "dockapps" can run.

You can try out a dockapp by searching for "dockapp" in your software repository. They tend to be network and system monitors, audio-setting panels, clocks, and similar. Here's Window Maker running on Fedora:

![Window Maker running on Fedora][6]

### Application menu

To access the application menu, right-click anywhere on the desktop. To close it again, right-click. Window Maker isn't a desktop environment; rather it's a window manager. It helps you arrange and manage windows. Its only bundled application is called [WPrefs][7] (or more commonly, Window Maker Preferences), a settings application that helps you configure commonly used settings, while the application menu provides access to other options, including themes.

The applications you run are entirely up to you. Within Window Maker, you can choose to run KDE applications, GNOME applications, and applications that are not considered part of any major desktop. Your work environment is yours to create, and you can manage it with Window Maker.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/12/linux-window-maker-desktop

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/linux_penguin_green.png?itok=ENdVzW22 (Penguin with green background)
[2]: https://en.wikipedia.org/wiki/NeXTSTEP
[3]: https://www.windowmaker.org/
[4]: https://opensource.com/sites/default/files/uploads/advent-windowmaker-gdm.jpg (Selecting the Window Maker desktop in GDM)
[5]: https://opensource.com/sites/default/files/uploads/advent-windowmaker-kdm.jpg (Selecting the Window Maker desktop in KDM)
[6]: https://opensource.com/sites/default/files/uploads/advent-windowmaker.jpg (Window Maker running on Fedora)
[7]: http://www.windowmaker.org/docs/guidedtour/prefs.html

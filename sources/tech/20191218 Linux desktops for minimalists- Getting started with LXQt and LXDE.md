[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Linux desktops for minimalists: Getting started with LXQt and LXDE)
[#]: via: (https://opensource.com/article/19/12/lxqt-lxde-linux-desktop)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

Linux desktops for minimalists: Getting started with LXQt and LXDE
======
This article is part of a special series of 24 days of Linux desktops.
Both LXDE and LXQt aim to provide a lightweight desktop for users who
either need it or just prefer it, with minimal setup or configuration
required.
![Penguins walking on the beach ][1]

Preserving and resurrecting old computers is a popular part of the Linux hacker's ethos, and one way to help make that possible is with a desktop environment that doesn't use up scarce system resources. After all, the fact that a current version of Linux can run effectively on a computer over 15 years old is quite a feat, but it doesn't make the CPU and RAM any better than the day they were slotted in. There are extremely light desktops available, but there's usually a catch: the user must assemble the parts. Fortunately, a number of lightweight desktops have appeared over the years in an attempt to provide a fast and light desktop with no setup required.

Two early implementations of this idea were [LXDE][2] and [Razor-qt][3], the former based on GTK (the libraries used by GNOME) and the latter based on Qt (the libraries used by KDE). Coincidentally, the lead maintainer of LXDE discovered [the bliss that is Qt development][4] and decided to port (just as a side project!) the entire desktop to Qt. LXDE, the Qt port of it, and the Razor-qt project were combined to form [LXQt][5], although today, LXDE and LXQt coexist as separate projects.

Whether you use LXDE or LXQt, their goals are the same: to provide a lightweight desktop for users who either need it or just prefer it, with minimal setup or configuration required. These are drop-in desktops for any Linux or BSD system, whether it's 15 years old, or a new Raspberry Pi, or a hefty workstation that was just assembled. I used LXQt for this article, but everything apart from the GUI toolkit and some application names applies equally to LXQt and LXDE.

![LXQt on CentOS][6]

You may find LXQt or LXDE included your distribution's software repository, or you can download and install a distribution that ships LXQt or LXDE as a default desktop. Before you do, though, be aware that an LX* desktop is meant to provide a full desktop experience, so many applications are installed along with the desktop. If you're already running another desktop, you may find yourself with redundant applications (two PDF readers, two media players, two file managers, and so on). If you just want to try the LXQt or LXDE desktop, consider using a desktop virtualization application, such as [GNOME Boxes][7].

After installing, log out of your current desktop session so you can log into your new desktop. By default, your session manager (KDM, GDM, or LightDM, depending on your setup) will continue to log you into your previous desktop, so you must override that before logging in.

With GDM:

![][8]

With SDDM:

![][9]

### LXQt and LXDE desktop tour

The desktop layout has a classic look that's familiar to anyone who's used KDE's Plasma desktop or, realistically, any computer within the past two decades. There's an application menu in the lower-left corner, a taskbar for pinned and active applications, and a system tray in the lower-right corner. Because this is a full desktop environment, a few lightweight but robust applications are included. There's a text editor, an excellent file manager called PCManFM on LXDE and PCManFM-Qt on LXQt, configuration panels, a terminal, theme settings, and so on.

![LXDE desktop on Fedora][10]

The goal, aside from being light on resources, is to be intuitive, and these desktops excel at that. This isn't the place to look for an innovative new desktop design. The LXDE and LXQt desktops feel like they've been around forever, gliding through user actions with ease, finding just the right balance between explanatory prompts and minimal design. All the default settings are sensible, and 90% of what most users need to do on a desktop is covered (I'm reserving a conservative 10% for unique personal tastes that nobody expects any desktop to guess).

### To LXDE or to LXQt

Linux power users know GTK from Qt and sometimes even _care_ about which one they use, but it seems everyone admits it's down to personal taste and, in the end, doesn't actually matter. If you have no preference between GTK and Qt, then whether you use LXDE or LXQt may as well be a flip of a coin. They each have the same admirable goal: to provide a full desktop experience to any Linux computer that needs one, regardless of processor power or amount of RAM. If you're a fan of simplicity, then both desktops will appeal to you, and you're likely to settle into the defaults without spending hours customizing or rearranging anything at all. Sometimes it's refreshing to not care about the details and get straight to work. LXDE and LXQt are determined to bring that convenience to you, so give one a try.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/12/lxqt-lxde-linux-desktop

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/community-penguins-osdc-lead.png?itok=BmqsAF4A (Penguins walking on the beach )
[2]: http://lxde.org
[3]: https://web.archive.org/web/20160220061334/http://razor-qt.org/
[4]: https://opensource.com/article/17/4/pyqt-versus-wxpython
[5]: http://lxqt.org
[6]: https://opensource.com/sites/default/files/uploads/advent-lxqt-file.jpg (LXQt on CentOS)
[7]: https://opensource.com/article/19/5/getting-started-gnome-boxes-virtualization
[8]: https://opensource.com/sites/default/files/advent-gdm_1.jpg
[9]: https://opensource.com/sites/default/files/advent-kdm_0.jpg
[10]: https://opensource.com/sites/default/files/uploads/advent-lxde.jpg (LXDE desktop on Fedora)

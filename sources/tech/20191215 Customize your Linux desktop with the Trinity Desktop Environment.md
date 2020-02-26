[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Customize your Linux desktop with the Trinity Desktop Environment)
[#]: via: (https://opensource.com/article/19/12/linux-trinity-desktop-environment-tde)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

Customize your Linux desktop with the Trinity Desktop Environment
======
This article is part of a special series of 24 days of Linux desktops.
TDE is a fully customizable Linux desktop that will be instantly
recognizable to anyone who knew and loved KDE 3.
![Person standing in front of a giant computer screen with numbers, data][1]

When KDE 4 was released in 2008, KDE 3 went into support mode until support was dropped entirely. That's the usual lifecycle of software, desktops included, but the KDE 3 fanbase wasn't universally pleased with KDE 4, and some of them decided a fork was in order.

Some of them formed a new project with the mission of preserving the look and feel of KDE 3, starting from KDE 3.5.10 (the last official release in the 3.x series), and then forking Qt 3 into TQt to keep the underlying technology updated. Today, the [Trinity Desktop Environment][2] (TDE) delivers a traditional desktop environment that looks and feels essentially the same as KDE 3 did 10-plus years ago.

You may find the Trinity desktop included in the software repository of your distribution. Before you install it, be aware that it is meant to provide a full desktop experience, so many TDE apps are installed along with the desktop. If you're already running another desktop, you may find yourself with redundant applications (two PDF readers, two media players, two file managers, and so on).

If your software repo doesn't offer Trinity, or you just don't want to install it and all of its applications, you can install a TDE distribution in a virtual machine, such as [GNOME Boxes][3]. I used the [exeGNU][4] distribution for the screenshots below, and there are other distros listed on [TDE's LiveCDs][5] page.

### TDE desktop tour

The Trinity Desktop Environment is a very traditional desktop. It's one that's likely to be familiar to you—whether or not you've used KDE at all, in fact. It has one panel at the bottom of the screen that contains an application menu in the left corner, a taskbar in the middle, and a system tray in the right, and there are icons for common locations on the desktop. It behaves exactly as you'd expect a desktop to behave, and you can probably change whatever you want to change because TDE is completely customizable.

If you were a KDE 3 user in the past, revisiting the Trinity Desktop Environment is a little like stepping back in time. While a side-by-side comparison of the two desktops might reveal significant differences, it would be a real challenge to find a deviation in TDE from the desktop you remember. All the key components are there: the sidebar tabs, the Konqueror file manager, the traditional application menu, the retractable panel, and the classic layout.

![TDE on exeGNU][6]

How different this is from KDE 4 or KDE 5 is a matter of perspective. To many users, the TDE default is pretty much the same as the default layout of late KDE 4 or current KDE 5 desktops. As is often the case, however, the biggest differences are in the smallest of details. The absence of Dolphin in favor of [Konqueror][7] is one of the biggest non-changes. Konqueror has quite literally set the standard for both file management and web browsing (KHTML is the code that Apple and Google forked to create the Safari and Chrome browsers), so preserving it as the central desktop application is particularly noteworthy.

All the "old" applications are still there, and seemingly not a button or widget has moved from the old default 3.5 location. The defaults are always set to what they were in KDE 3.5, but nearly everything can be rearranged, changed, hidden, or disassembled. User experience is supreme, and TDE never assumes that any two users want the same experience.

![Trinity Control Center][8]

To a tried and true KDE 3.5.x user, using TDE is just a matter of surrendering to muscle memory.

### Trinity and open source

Trinity, along with the Mate fork of GNOME 2, is one of the most direct examples of how open source empowers developers to sustain a beloved software project that's otherwise reached its end. Not all software is kept alive by a fork and a dedicated team of true believers, but sometimes it does happen, and when it does, it results in greater variety and more choice. Whether you choose KDE 5 or TDE, or GNOME 3 or Mate, you get to make those choices because open source empowers developers and users to make technology work better for everyone.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/12/linux-trinity-desktop-environment-tde

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/data_metrics_analytics_desktop_laptop.png?itok=9QXd7AUr (Person standing in front of a giant computer screen with numbers, data)
[2]: https://www.trinitydesktop.org/
[3]: https://opensource.com/article/19/5/getting-started-gnome-boxes-virtualization
[4]: http://exegnulinux.net
[5]: https://wiki.trinitydesktop.org/LiveCDs
[6]: https://opensource.com/sites/default/files/uploads/advent-trinity.jpg (TDE on exeGNU)
[7]: https://kde.org/applications/internet/org.kde.konqueror
[8]: https://opensource.com/sites/default/files/uploads/advent-trinity-control.jpg (Trinity Control Center)

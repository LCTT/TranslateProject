[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Get back to basics with the TWM Linux desktop)
[#]: via: (https://opensource.com/article/19/12/twm-linux-desktop)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

Get back to basics with the TWM Linux desktop
======
This article is part of a special series of 24 days of Linux desktops.
TWM may be bare-bones by default, but it's a great foundation for a
customized Linux desktop that has all your favorite bits and pieces.
![Penguin driving a car with a yellow background][1]

The most humble of window managers, TWM, is a little akin to those sample photographs you get when you buy a picture frame. It's basic, almost a bare-minimum proof of concept that Xorg ships with the [X11][2] Windows System to demonstrate that a desktop can indeed be created for a graphical user interface (GUI).

Some distributions treat it as a fallback window manager that can be launched in a pinch if you break your usual desktop and need a terminal just long enough for repairs. Now that Xorg is basically bulletproof and moving aside for [Wayland][3], sometimes TWM isn't even included at all. And yet, amazingly, TWM, short for either _Timeless Window Manager_ or _Tabbed Window Manager_, depending on who you ask, has some fun features and configuration options.

![TWM][4]

Your distribution (XQuartz on Mac OS included) may discreetly include TWM as a fallback window manager. Otherwise, you are likely to find it in your software repository, and you can also get it from the [Freedesktop][5] GitHub repository. If you're already running a different desktop, it's safe to install TWM on the same system because it doesn't include any bundled applications aside from a few configuration panels.

After installing, log out of your current desktop session so you can log into TWM. By default, your session manager (KDM, GDM, LightDM, or XDM, depending on your setup) will continue to log you into your previous desktop, so you must override that before logging into your new one.

With GDM:

![Selecting your desktop in GDM][6]

With SDDM:

![Selecting your desktop in KDM][7]

### Desktop tour

TWM's basic configuration is usually unspectacular. Here's TWM on my Slackware system:

![TWM by default][8]

You can get a pop-up menu with a left-click on the desktop. By default, it has one application listed: xterm. When you launch xterm, the outline of a window appears until you click to place it on the desktop.

More actions are available with a right-click or a middle-click on the desktop or a window's title bar. For instance, to resize a window, you can middle-click the title bar and select **Resize**; this places you into resize mode so you can drag your mouse across the edge of the window you want to make smaller or larger. Click again to confirm the new size.

When you right-click the icon in the upper-left corner of any window, that window is minimized into a desktop icon (a precursor to the OS X dock). You can drag this icon anywhere on your desktop and right-click on it to restore it back to a full-sized window.

These are all old Unix conventions; tricks of the visual interface that long-time Unix users will remember fondly but are utterly baffling at first to new users. You can learn to love them by using TWM, but if you do that, you'll no doubt want something a little prettier and more tailored to your daily workflow.

### TWM configuration

One of my favorite sites is [Linux Questions][9], a tried-and-true Linux support forum. I stumbled across a post there about TWM, where user **rkfb** was, apparently in all seriousness, praising TWM as his favorite lightweight window manager. What's more, **rkfb** had [the config file to prove it][10].

I downloaded the sample **.twmrc** file and discovered that there are a surprising number of options and features in TWM. Like other "building-block" window managers, such as [FVWM][11] or [MLVWM][12], it takes a lot of work to customize it and bring it up to modern expectations. You can also add the usual laundry list of applications to TWM. For instance, you could run [Tint2][13] or [Xfce-panel][14] to provide a traditional taskbar and other applets, or [stalonetray][15] for a system tray, and [vdesk][16] to provide virtual desktops, but then again, TWM isn't meant to be a _modern_ window manager, but a _timeless_ window manager. You may not want to make it too modern.

There are _lots_ of options and definitions in the config file for TWM. Two of my favorites are **RandomPlacement** (an option to activate random placement of windows, so you don't have to manually click to set the location of each window you launch) and **ShowIconManager** (which displays a vertical taskbar).

The syntax to define the contents of the menus is pretty easy to understand:


```
menu "Shells" {
   "Shells"     f.title
   "rxvt"               f.exec "urxvt -fg cyan -bg black -cr white &amp;"
   "Konsole"    f.exec "konsole &amp;"
}
```

Color themes are similarly intuitive from the sample file.

You can set a background using the **feh** command (you probably need to install it first):


```
`$ feh --bg-fill ~/christopher-burns_unsplash.jpg`
```

### Old TWM is new TWM

TWM looks and feels like an artifact of a bygone era, when desktops were simpler in design but complex in configuration. It's probably not the best or the most flexible window manager available, but it's surprisingly configurable. You can use it as the foundation of a customized desktop consisting of all your favorite desktop bits and pieces. You can spend the time to make TWM something you enjoy using, and you'll learn a lot about interface design, Unix history, and pixmap bit depth along the way. Give TWM another look, and make that look beautiful.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/12/twm-linux-desktop

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/car-penguin-drive-linux-yellow.png?itok=twWGlYAc (Penguin driving a car with a yellow background)
[2]: https://en.wikipedia.org/wiki/X_Window_System
[3]: https://wayland.freedesktop.org/
[4]: https://opensource.com/sites/default/files/uploads/advent-twm.jpg (TWM)
[5]: https://github.com/freedesktop/twm
[6]: https://opensource.com/sites/default/files/uploads/advent-gdm_3.jpg (Selecting your desktop in GDM)
[7]: https://opensource.com/sites/default/files/uploads/advent-kdm_2.jpg (Selecting your desktop in KDM)
[8]: https://opensource.com/sites/default/files/uploads/advent-twm-basic.jpg (TWM by default)
[9]: http://linuxquestions.org
[10]: https://www.linuxquestions.org/questions/linux-desktop-74/share-your-configuration-file-of-twm-best-x-windows-manager-4175585974
[11]: https://opensource.com/article/19/12/fvwm-linux-desktop
[12]: https://opensource.com/article/19/12/linux-mlvwm-desktop
[13]: https://opensource.com/article/19/1/productivity-tool-tint2
[14]: https://opensource.com/article/19/12/xfce-linux-desktop
[15]: http://stalonetray.sourceforge.net/
[16]: https://offog.org/code/vdesk

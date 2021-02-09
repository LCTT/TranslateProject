[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Revamp your old Linux desktop with Joe's Window Manager)
[#]: via: (https://opensource.com/article/19/12/joes-window-manager-linux-desktop)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

Revamp your old Linux desktop with Joe's Window Manager
======
This article is part of a special series of 24 days of Linux desktops.
JWM's meager weight and simplicity makes it a great window manager for
slow or old Linux computers.
![and old computer and a new computer, representing migration to new software or hardware][1]

Joe's Window Manager ([JWM][2] for short) is a lightweight window manager for X11. It's written in C, minimally using [Xlib][3]. Because it's so small and simple, JWM makes a great window manager for slow or old computers. The Raspberry Pi barely registers that JWM is running, leaving precious system resources for more important tasks than the desktop.

JWM follows in the footsteps of environments like FVWM, Window Maker, and Fluxbox. It provides an application menu, window decoration, and a panel with an application menu, taskbar, and clock.

Install JWM from your distribution's software repository. After installing it, log out of your current desktop session so you can log into JWM. By default, your session manager (KDM, GDM, LightDM, or XDM, depending on your setup) will continue to log you into your previous desktop, so you must override that before logging in.

To select a new desktop with GDM:

![Select your desktop session in GDM][4]

With KDM:

![Select your desktop session with KDM][5]

The first time you log into JWM, you may find a black screen with a panel at the bottom. It's normal on most distributions to let you choose the wallpaper for this minimal desktop. You can set a wallpaper with the **feh** command (you may need to install it from your repository). This command has a few options for setting the background, including **\--bg-fill** to fill the screen with your wallpaper of choice, **\--bg-scale** to scale it to fit, and so on.


```
`$ feh --bg-fill ~/Pictures/wallpapers/mybackground.jpg`
```

### Application menu

There are two locations for the application menus in JWM: it appears at your mouse cursor when you left-click on the desktop, and it is also available by clicking the JWM logo in the lower-left corner.

![JWM running on Debian][6]

There aren't any applications bundled with JWM, so it's up to you to decide what applications to use. You can get applications from any desktop, like GNOME or KDE, or you can use independent applications. Most of the integration between applications is done by [D-Bus][7] and other backend technology on Linux, so it's safe to mix and match them. I use [PCManFM-Qt][8] as a file manager, [unicode-rxvt][9] as a terminal, and, of course, Firefox as an internet browser.

### Configuration

Two configuration files govern JWM. The system-wide configuration file is **/etc/jwm/system.jwmrc**, and the user local file is **$HOME/.jwmrc**. Configuration files are written in XML, but the schema is very basic and easy to reverse-engineer, whether you know XML or not. Configuration options are well-documented on [Joewing.net][10], home of the JWM project.

### Why you should use JWM

There's no shortage of lightweight window managers available for Linux, and you might wonder why there seems to be so much redundancy, much less why you should try Joe's. There are a few reasons JWM is as important as any of the others. When looking at software projects, redundancy is a _good thing_. Should one project's implementation of a desktop paradigm fade, you have many others to choose from. And often, the strengths of each project are in the minor details. For example, the quick and easy setup of a taskbar and application menu makes for a quick, sensible default configuration for all the users who want that common setup. For technical users, the XML configuration may be a refreshing change from the custom configuration formats in other environments.

Joe's Window Manager, in a way, demonstrates the rich diversity of open source and how it's a luxury Linux users enjoy. If you're interested in JWM, try it out today, and see if you can make your own window manager, too.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/12/joes-window-manager-linux-desktop

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/migration_innovation_computer_software.png?itok=VCFLtd0q (and old computer and a new computer, representing migration to new software or hardware)
[2]: http://joewing.net/projects/jwm/
[3]: https://en.wikipedia.org/wiki/Xlib
[4]: https://opensource.com/sites/default/files/advent-gdm_0.jpg (Select your desktop session in GDM)
[5]: https://opensource.com/sites/default/files/advent-kdm.jpg (Select your desktop session with KDM)
[6]: https://opensource.com/sites/default/files/uploads/advent-jwm_675px.jpg (JWM running on Debian)
[7]: https://en.wikipedia.org/wiki/D-Bus
[8]: https://blog.lxqt.org/category/pcmanfm-qt/
[9]: https://opensource.com/article/19/10/why-use-rxvt-terminal
[10]: http://joewing.net/projects/jwm/config-2.3.html

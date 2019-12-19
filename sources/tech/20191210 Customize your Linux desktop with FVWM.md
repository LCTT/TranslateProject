[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Customize your Linux desktop with FVWM)
[#]: via: (https://opensource.com/article/19/12/fvwm-linux-desktop)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

Customize your Linux desktop with FVWM
======
This article is part of a special series of 24 days of Linux desktops.
If you're looking for a lightweight, fast, and simple Linux window
manager, FVWM qualifies. But if you're looking for something to dig
into, explore, and hack, then FVWM is a must.
![Coding on a computer][1]

The [FVWM][2] window manager started out as modifications to [TWM][3], back in 1993. After several years of iteration, what emerged is an extremely customizable environment where any behavior, action, or event is configurable. It has support for custom key bindings, mouse gestures, theming, scripting, and much more.

While FVWM is usable immediately after installation, its default distribution provides only the absolute minimum configuration. It's a great foundation to start your own custom desktop environment, but if you just want to use it as a desktop, then you probably want to install a full configuration distributed by another user. There are a few different distributions of FVWM, including FVWM95, which mimics Windows 95 (at least in appearance and layout). I tried [FVWM-Crystal][4], a modern-looking theme with some common Linux desktop conventions.

Install the FVWM distribution you want to try from your Linux distribution's software repository. If you can't find a specific FVWM distribution, it's safe to install the base FVWM2 package and then go to [Box-Look.org][5] to download a theme package manually. It's a little more work that way, but not nearly as much as building your own workspace from scratch.

After installing, log out of your current desktop session so you can log into FVWM. By default, your session manager (KDM, GDM, LightDM, or XDM, depending on your setup) will continue to log you into your previous desktop, so you must override that before logging in.

To do so with GDM:

![Select your desktop session in GDM][6]

And with KDM:

![Select your desktop session with KDM][7]

### FVWM desktop

Regardless of what theme and configuration you're using, FVWM, at minimum, provides a menu when you left-click on the desktop. The contents of this menu vary depending on what you've installed. The menu in the FVWM-Crystal distribution contains quick access to common preferences, such as screen resolution, wallpaper settings, window decorations, and so on.

As with pretty much everything in FVWM, the menu can be edited to include whatever you want, but FVWM-Crystal favors the application menu bar. The application menu is located at the top-left of the screen, and each icon contains a menu of related application launchers. For example, the GIMP icon reveals image editors, the KDevelop icon reveals integrated development environments (IDEs), the GNU icon reveals text editors, and so on, depending on what you have installed on your system.

![FVWM-crystal running on Slackware 14.2][8]

FVWM-Crystal also provides virtual desktops, a taskbar, a clock, and an application bar.

For your background, you can use the wallpapers bundled with FVWM-Crystal or set your own with the **feh** command (you may need to install it from your repository). This command has a few options for setting the background, including **\--bg-scale** to fill the screen with a scaled version of your wallpaper of choice, **\--bg-fill** to fill the screen without adjusting the size of the image, and so on.


```
`$ feh --bg-scale ~/Pictures/wallpapers/mybackground.jpg`
```

Most configuration files are contained in **$HOME/.fvwm-crystal**, with some systemwide defaults located in **/usr/share/fvwm-crystal**.

### Do it yourself

FVWM is as much a desktop-building platform as it is a window manager. It doesn't do anything for you, and it expects you to configure anything—and possibly everything.
If you're looking for a lightweight, fast, and simple window manager, FVWM qualifies. But if you're looking for something to dig into, explore, and hack, then FVWM is a must.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/12/fvwm-linux-desktop

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/code_computer_laptop_hack_work.png?itok=aSpcWkcl (Coding on a computer)
[2]: http://www.fvwm.org/
[3]: https://en.wikipedia.org/wiki/Twm
[4]: https://www.box-look.org/p/1018270/
[5]: http://box-look.org
[6]: https://opensource.com/sites/default/files/advent-gdm_0.jpg (Select your desktop session in GDM)
[7]: https://opensource.com/sites/default/files/advent-kdm.jpg (Select your desktop session with KDM)
[8]: https://opensource.com/sites/default/files/advent-fvwm-crystal.jpg (FVWM-crystal running on Slackware 14.2)

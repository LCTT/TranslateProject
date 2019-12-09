[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Pekwm: A lightweight Linux desktop)
[#]: via: (https://opensource.com/article/19/12/pekwm-linux-desktop)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

Pekwm: A lightweight Linux desktop
======
This article is part of a special series of 24 days of Linux desktops.
If you're a minimalist who finds traditional desktops get in your way,
try the Pekwm Linux desktop.
![Penguin with green background][1]

Let's say you want a lightweight desktop environment, with just enough to get graphics on the screen, move some windows around, and not much else. You find traditional desktops get in your way, with their notifications and taskbars and system trays. You want to live your life primarily from a terminal, but you also want the luxury of launching graphical applications. If that sounds like you, then [Pekwm][2] may be what you've been looking for all along.

Pekwm is, presumably, inspired by the likes of Window Maker and Fluxbox. It provides an application menu, window decoration, and not a whole lot more. It's ideal for minimalists—users who want to conserve resources and users who prefer to work from a terminal.

Install Pekwm from your distribution's software repository. After installing, log out of your current desktop session so you can log into your new desktop. By default, your session manager (KDM, GDM, LightDM, or XDM, depending on your setup) will continue to log you into your previous desktop, so you must override that before logging in.

To override the previous desktop on GDM:

![Selecting your desktop in GDM][3]

And on KDM:

![Selecting your desktop in KDM][4]

The first time you log into Pekwm, you may encounter nothing but a black screen. Believe it or not, that's normal. What you're seeing is a blank desktop without background wallpaper. You can set a wallpaper with the **feh** command (you may need to install it from your repository). This command has a few options for setting the background, including **\--bg-fill** to fill the screen with your wallpaper, **\--bg-scale** to scale it to fit, and so on.


```
`$ feh --bg-fill ~/Pictures/wallpapers/mybackground.jpg`
```

### Application menu

By default, Pekwm auto-generates a menu, available with a right-click anywhere on the desktop, that gives you access to applications. This menu also provides a few preference settings, such as the ability to pick a theme and to log out of your Pekwm session.

![Pekwm running on Fedora][5]

### Configuration

Pekwm is primarily configured in text config files stored in **$HOME/.pekwm**. The **menu** file defines your application menu, the **keys** file defines keyboard shortcuts, and so on.

The **start** file is a shell script that is executed after Pekwm launches. It is analogous to the **rc.local** file on a traditional Unix system; it's intentionally last in line, so whatever you put into it overrides everything that came before it. This is an important file—it's probably where you want to set your background so that _your_ choice overrides the default on the theme you're using. 

The **start** file is also where you can launch dockapps. Dockapps are tiny applets that rose to prominence with Window Maker and Fluxbox. They usually provide network monitors, a clock, audio settings, and other things you might be used to seeing in a system tray or as a KDE plasmoid or widget in a full desktop environment. You might find some dockapps in your distribution's repository, or you can look for them online at [dockapps.net][6].

You can launch dockapps at startup by listing them in the **start** file followed by an **&amp;** symbol:


```
feh --bg-fill ~/Pictures/wallpapers/mybackground.jpg
wmnd &amp;
bubblemon -d &amp;
```

The **start** file must be [marked executable][7] for it to run when Pekwm starts.


```
`$ chmod +x $HOME/.pekwm/start`
```

### Features

There's not much to Pekwm, and that's the beauty of it. If you want extra services to run on your desktop, it's up to you to launch them. If you're still learning Linux, this is a great way to learn about the minute GUI components you usually don't think about when they come bundled with a complete desktop environment (like [a taskbar][8]). It's also a good way to get used to some of the Linux commands, like [nmcli][9], that you've been meaning to learn.

Pekwm is a fun window manager. It's sparse, terse, and very lightweight. Give it a try!

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/12/pekwm-linux-desktop

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/linux_penguin_green.png?itok=ENdVzW22 (Penguin with green background)
[2]: http://www.pekwm.org/
[3]: https://opensource.com/sites/default/files/uploads/advent-gdm_1.jpg (Selecting your desktop in GDM)
[4]: https://opensource.com/sites/default/files/uploads/advent-enlightenment-kdm_0.jpg (Selecting your desktop in KDM)
[5]: https://opensource.com/sites/default/files/uploads/advent-pekwm.jpg (Pekwm running on Fedora)
[6]: http://dockapps.net
[7]: https://opensource.com/article/19/6/understanding-linux-permissions
[8]: https://opensource.com/article/19/1/productivity-tool-tint2
[9]: https://opensource.com/article/19/5/set-static-network-connection-linux

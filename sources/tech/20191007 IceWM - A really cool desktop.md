[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (IceWM – A really cool desktop)
[#]: via: (https://fedoramagazine.org/icewm-a-really-cool-desktop/)
[#]: author: (tdawson https://fedoramagazine.org/author/tdawson/)

IceWM – A really cool desktop
======

![][1]

IceWM is a very lightweight desktop. It’s been around for over 20 years, and its goals today are still the same as back then: speed, simplicity, and getting out of the users way.

I used to add IceWM to Scientific Linux, for a lightweight desktop. At the time, it was only a .5 Meg rpm. When running, it used only 5 Meg of memory. Over the years, IceWM has grown a little bit. The rpm package is now 1 Meg. When running, IceWM now uses 10 Meg of memory. Even though it literally doubled in size in the past 10 years, it is still extremely small.

What do you get in such a small package? Exactly what it says, a Window Manager. Not much else. You have a toolbar with a menu or icons to launch programs. You have speed. And finally you have themes and options. Besides the few goodies in the toolbar, that’s about it.

![][2]

### Installation

Because IceWM is so small, you just install the main package.

```
$ sudo dnf install icewm
```

If you want to save disk space, many of the dependencies are soft options. IceWM works just fine without them.

```
$ sudo dnf install icewm --setopt install_weak_deps=false
```

### Options

The defaults for IceWM are set so that your average windows user feels comfortable. This is a good thing, because options are done manually, through configuration files.

I hope I didn’t loose you there, because it’s not as bad as it sounds. There are only 8 configuration files, and most people only use a couple. The main three config files are keys (keybinding), preferences (overall preferences), and toolbar (what is shown on the toolbar). The default config files are found in /usr/share/icewm/

To make a change, you copy the default config to you home icewm directory (~/.icewm), edit the file, and then restart IceWM. The first time you do this might be a little scary because “Restart Icewm” is found under the “Logout” menu entry. But when you restart IceWM, you just see a single flicker, and your changes are there. Any open programs are unaffected and stay as they were.

### Themes

![IceWM in the NanoBlue theme][3]

If you install the icewm-themes package, you get quite a few themes. Unlike regular options, you do not need to restart IceWM to change into a new theme. Usually I wouldn’t talk much about themes, but since there are so few other features, I figured I’m mention them.

### Toolbar

The toolbar is the one place where a few extra features have been added to IceWM. You will see that you can switch between workplaces. Workspaces are sometimes called Virtual Desktops. Click on the workspace to move to it. Right clicking on a windows taskbar entry allows you to move it between workspaces. If you like workspaces, this has all the functionality you will like. If you don’t like workspaces, it’s an option and can be turned off.

The toolbar also has Network/Memory/CPU monitoring graphs. Hover your mouse over the graph to get details. Click on the graph to get a window with full monitoring. These little graphs used to be on every window manager. But as those desktops matured, they have all taken the graphs out. I’m very glad that IceWM has left this nice feature alone.

## Summary

If you want something lightweight, but functional, IceWM is the desktop for you. It is setup so that new linux users can use it out of the box. It is flexible so that unix users can tweak it to their liking. Most importantly, IceWM lets your programs run without getting in the way.

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/icewm-a-really-cool-desktop/

作者：[tdawson][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/tdawson/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2019/09/icewm-1-816x346.png
[2]: https://fedoramagazine.org/wp-content/uploads/2019/09/icewm.2-1024x768.png
[3]: https://fedoramagazine.org/wp-content/uploads/2019/09/icewm.3-1024x771.png

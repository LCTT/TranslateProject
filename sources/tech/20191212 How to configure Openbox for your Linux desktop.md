[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to configure Openbox for your Linux desktop)
[#]: via: (https://opensource.com/article/19/12/openbox-linux-desktop)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

How to configure Openbox for your Linux desktop
======
This article is part of a special series of 24 days of Linux desktops.
The Openbox Linux window manager is light on system resources, easy to
configure, and a pleasure to use.
![open with sky and grass][1]

You may have used the [Openbox][2] desktop without knowing it: While Openbox is a great window manager on its own, it also serves as the window manager "engine" for desktop environments like LXDE and LXQT, and it can even manage KDE and GNOME. Aside from being the foundation for several desktops, Openbox is arguably one of the easiest window managers to configure for anyone who doesn't want to learn all the options to put into a config file. By using the **obconf** menu-based configuration application, all the common preferences can be set just as easily as in a full desktop, like GNOME or KDE.

### Installing Openbox

You are likely to find Openbox in the software repository of your Linux distribution, but you can also find it on [Openbox.org][3]. If you're already running a different desktop, it's safe to install Openbox on the same system, because Openbox doesn't include any bundled applications aside from a few configuration panels.

After installing it, log out of your current desktop session so you can log into your Openbox desktop. By default, your session manager (KDM, GDM, LightDM, or XDM, depending on your setup) will continue to log you into your previous desktop, so you must override that before logging in.

To override it with GDM:

![Select your desktop session in GDM][4]

With SDDM:

![Select your desktop session with KDM][5]

### Configure the Openbox desktop

By default, Openbox includes the **obconf** application, which you can use to choose and install themes, modify mouse behavior, set desktop preferences, and do much more. You can probably find other configuration applications, like **obmenu**, in your repository to configure other parts of your window manager.

![Openbox Obconf configuration application][6]

Building your own desktop experience is relatively easy. There are little components for all the usual desktop tropes, like [stalonetray][7] for a system tray, [Tint2][8] for a taskbar, or [Xfce4-panel][9] for nearly anything you can think of. String any set of applications together until you have the open source desktop of your dreams.

![Openbox][10]

### Why you should use Openbox

Openbox is light on system resources, easy to configure, and a pleasure to use. It pops up in the unlikeliest of places, so it can be a good system to get familiar with. You never know when you'll be in front of a desktop that secretly uses Openbox as its window manager (and won't it be nice that you know how to customize it?). If critical mass and open source appeal to you, open up the Openbox box and get started.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/12/openbox-linux-desktop

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/osdc_general_openfield.png?itok=MeVN97oy (open with sky and grass)
[2]: http://openbox.org
[3]: http://openbox.org/wiki/Openbox:Download
[4]: https://opensource.com/sites/default/files/advent-gdm_0.jpg (Select your desktop session in GDM)
[5]: https://opensource.com/sites/default/files/advent-kdm.jpg (Select your desktop session with KDM)
[6]: https://opensource.com/sites/default/files/uploads/advent-openbox-obconf_675px.jpg (Openbox Obconf configuration application)
[7]: https://sourceforge.net/projects/stalonetray/
[8]: https://opensource.com/article/19/1/productivity-tool-tint2
[9]: http://xfce.org
[10]: https://opensource.com/sites/default/files/uploads/advent-openbox_675px.jpg (Openbox)

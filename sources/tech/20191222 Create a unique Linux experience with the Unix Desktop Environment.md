[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Create a unique Linux experience with the Unix Desktop Environment)
[#]: via: (https://opensource.com/article/19/12/linux-unix-desktop-environment-ude)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

Create a unique Linux experience with the Unix Desktop Environment
======
This article is part of a special series of 24 days of Linux desktops.
If you're in the mood for something completely unique, then UDE is the
desktop you need to try.
![Penguins][1]

When the UDE project started in 1996, the developers took on a bold name—[Unix Desktop Environment (UDE)][2]—and held high hopes of reinventing what a desktop could be. They weren't just trying to redefine Unix desktops; they were trying to change the way users interacted with applications on their system. Windows 95 had just come out, so the idea of managing a make-believe "desktop" filled with "folders" and "windows" meant to mimic a real-world desktop had not won all computer users' mindshare (it still hasn't, but it does at least seem to be a reliably stable option now). There was still room for experimentation in computer user interfaces (UIs), and the UDE project introduced some truly innovative ideas.

One of UDE's most intriguing concepts is that its windows have no title bars or handles. All window control is performed with a hex menu that appears when a window border is clicked. Windows are moved with a middle-click and resized with a right-click.

![Unix Desktop Environment][3]

If you're in the mood for something completely unique, then UDE is the desktop you need to try.

### Installing UDE

Your distribution probably doesn't have UDE in its software repository, but it's relatively easy to compile for someone who's used to building software from raw source code.

I installed UDE on Slackware 14.2, but it doesn't rely on any libraries other than standard Xlibs, so it should work on any Linux or BSD system. The compile process requires build tools, which ship by default on Slackware but are often omitted on other distributions to save space on the initial download. The names of the packages you must install to build from source code vary depending on your distro, so refer to the documentation for specifics. For example, on Debian-based distributions, you can learn about build requirements in [Debian's BuildingTutorial][4] doc, and on Fedora-based distributions, refer to [Fedora's Installing software from source][5] doc. Once you have the build tools installed, you can build UDE the standard [GNU Automake][6] way:


```
$ ./configure
$ make -j2
$ sudo make install
```

The default location for installation is **/usr/local**, but you can adjust the paths during the configuration step.

### Xinitrc and UDE

The easiest way to get up and running with UDE is to let Xorg do the bulk of the work. First, you must create a **$HOME/.xinitrc** file. I adapted this from scripts bundled in Slackware:


```
#!/bin/sh
# $XConsortium: xinitrc.cpp,v 1.4 91/08/22 11:41:34 rws Exp $

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f $userresources ]; then
    xrdb -merge $userresources
fi

if [ -f $usermodmap ]; then
    xmodmap $usermodmap
fi

# window manager
exec /usr/local/bin/uwm
```

According to this file, the default action for the **startx** command is to launch the **uwm** window manager (which houses UDE). However, your distribution may have other ideas about what happens when your graphic server is launched (or killed to be restarted), so this file may do you little good. On many distributions, you can add a **.desktop** file to **/usr/share/xsessions** to have it listed in the GDM or KDM menu, so create a file called **uwm.desktop** and enter this text:


```
[Desktop Entry]
Name=UDE
Comment=UNIX Desktop Environment
Exec=/usr/local/bin/uwm
Type=Application
```

Log out from your desktop session and log back into UDE. By default, your session manager (KDM, GDM, or LightDM, depending on your setup) will continue to log you into your previous desktop, so you must override that before logging in.

With GDM:

![][7]

With SDDM:

![][8]

#### Launching with brute force

If UDE fails to start, try installing XDM, a lightweight session manager that doesn't look at **/usr/share/xsessions** and instead just does whatever the authenticated user's **.xinitrc** prescribes.

### Desktop tour

When UDE first launches, you may find yourself staring at a black screen. That's the default primary desktop for UDE, and it's blank because no background wallpaper has been set. You can set one for yourself with the **feh** command (you may need to install it from your repository). This command has a few options for setting the background, including **\--bg-fill** to fill the screen with your wallpaper of choice, **\--bg-scale** to scale it to fit, and so on.


```
`$ feh --bg-fill ~/Pictures/wallpapers/mybackground.jpg`
```

### Interacting with the desktop

The next task is to launch an application. UDE provides an application menu, which you can bring up at your mouse pointer's position with a right-click on the desktop. Because you haven't customized the menu yet, your best bet is to launch an **xterm** window so that you can issue arbitrary commands.

Once you have an xterm window open, you might notice that there's no window decoration. This is the central idea behind UDE: windows are manipulated primarily with a "honeycomb" or hex menu that appears when you left-click on the border of any window.

![UDE honeycomb menu][9]

Clockwise from the top hex, the options are:

  * Close
  * Kill (confirm by selecting the pop-up hex that appears upon mouseover)
  * Make sticky or send to a different desktop
  * Maximize
  * Send behind other windows
  * Minimize



Most of them are self-explanatory, but the minimize option can be confusing because there's no place for windows to be minimized _to_ because there's no taskbar, no docklet, and no desktop icons. To retrieve a minimized window, middle-click on the desktop.

![UDE middle-click menu][10]

This presents a menu of virtual desktops, one of which is your current desktop and therefore contains even your minimized applications. Select the minimized application to restore it to your screen.

### Menus and configuration

There are example and default config files in **/usr/local/share/uwm/config**, including one for the right-click application menu configuration. The syntax for the menu is simple and well-documented at the top of the file. This code sample changes the browser option from Netscape to Firefox:


```
LINE;
% ITEM "Netscape":"netscape";
ITEM "Firefox":"firefox";
LINE;
```

To see your changes, restart UDE from the left-click menu. The **uwmrc** configuration files dictate the layout of UDE, including the size of window borders, fonts, and other stylistic choices. They are

also well-documented in comments, so look through them and make changes to experiment and find what works best for you.

### Old innovations, new again

UDE's interface is strange and new and—if you're intrigued by UI design—very exciting. UDE's design exemplifies the advantages and disadvantages of creating standards in computing. On the one hand, something like UDE is so alien to most users that it's bound to get in the way, yet on the other hand, it's fresh and different and forces users to re-evaluate their workflows, which may result in several unexpected improvements. The reaction you probably have when trying UDE is the same one you're likely to see when you introduce a friend to Linux: What's an old, familiar GNOME or KDE desktop to you is a puzzle to them. But deep down, most of us know the potential benefits of changing the way we look at something we take for granted.

That said, UDE is unquestionably an experiment, not a finished project. It probably isn't going to be your primary desktop, but it's well worth exploring. This is innovation. It's sometimes messy, sometimes slow, sometimes tumultuous. But it's important, bold, and a heck of a lot of fun.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/12/linux-unix-desktop-environment-ude

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/linux-penguins.png?itok=yKOpaJM_ (Penguins)
[2]: http://udeproject.sourceforge.net/
[3]: https://opensource.com/sites/default/files/uploads/advent-ude.jpg (Unix Desktop Environment)
[4]: https://wiki.debian.org/BuildingTutorial
[5]: https://docs.pagure.org/docs-fedora/installing-software-from-source.html
[6]: https://opensource.com/article/19/7/introduction-gnu-autotools
[7]: https://opensource.com/sites/default/files/advent-gdm_2.jpg
[8]: https://opensource.com/sites/default/files/advent-kdm_1.jpg
[9]: https://opensource.com/sites/default/files/uploads/advent-ude-hex.jpg (UDE honeycomb menu)
[10]: https://opensource.com/sites/default/files/uploads/advent-ude-middle.jpg (UDE middle-click menu)

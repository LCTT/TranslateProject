[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Use the Fluxbox Linux desktop as your window manager)
[#]: via: (https://opensource.com/article/19/12/fluxbox-linux-desktop)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

Use the Fluxbox Linux desktop as your window manager
======
This article is part of a special series of 24 days of Linux desktops.
Fluxbox is very light on system resources, yet it has vital Linux
desktop features to make your user experience easy, blazingly efficient,
and unduly fast.
![Text editor on a browser, in blue][1]

The concept of a desktop may differ from one computer user to another. Many people see the desktop as a home base, or a comfy living room, or even a literal desktop where they place frequently used notepads, their best pens and pencils, and their favorite coffee mug. KDE, GNOME, Pantheon (and so on) provide that kind of comfort on Linux.

But for some users, the desktop is just empty monitor space, a side effect of not yet having any free-floating application windows projected directly onto their retina. For these users, the desktop is a void over which they can run applications—whether big office and graphic suites, or a simple terminal window, or docked applets—to manage services. This model of operating a [POSIX][2] computer has a long history, and one branch of that family tree is the *box window managers: Blackbox, Fluxbox, and Openbox.

[Fluxbox][3] is a window manager for X11 systems that's based on an older project called Blackbox. Blackbox development was waning when I discovered Linux, so I fell into Fluxbox, and I've used it ever since on at least one of my active systems. It is written in C++ and is licensed under the MIT open source license.

### Installing Fluxbox

You are likely to find Fluxbox included in the software repository of your Linux distribution, but you can also find it on [Fluxbox.org][4]. If you're already running a different desktop, it's safe to install Fluxbox on the same system because Fluxbox doesn't predetermine any configuration or accompanying applications.

After installing Fluxbox, log out of your current desktop session so you can log into your new one. By default, your session manager (KDM, GDM, LightDM, or XDM, depending on your setup) will continue to log you into your previous desktop, so you must override that before logging in.

To override the desktop with GDM:

![Select your desktop session in GDM][5]

Or with KDM:

![Select your desktop session with KDM][6]

### Configuring the Fluxbox desktop

When you first log in, the screen is mostly empty because all Fluxbox provides are panels (for a taskbar, system tray, and so on) and window decoration for application windows.

![Default Fluxbox configuration on CentOS 7][7]

If your distribution delivers a plain Fluxbox desktop, you can set a background for your desktop using the **feh** command (you may need to install it from your distribution's repository). This command has a few options for setting the background, including **\--bg-fill** to fill the screen with your wallpaper of choice, **\--bg-scale** to scale it to fit, and so on.


```
`$ feh --bg-fill ~/photo/oamaru/leaf-spiral.jpg`
```

![Fluxbox with a theme applied][8]

By default, Fluxbox auto-generates a menu, available with a right-click anywhere on the desktop, that gives you access to applications. Depending on your distribution, this menu may be very minimal, or it may list all the launchers in your **/usr/share/applications** directory.

Fluxbox configuration is set in text files, and those text files are contained in the **$HOME/.fluxbox** directory. You can:

  * Set keyboard shortcuts in **keys**
  * Set startup services and applications in **startup**
  * Set desktop preferences (such as the number of workspaces, locations of panels, and so on) in **init**
  * Set menu items in **menu**



The text configuration files are easy to reverse-engineer, but you also can (and should) read the Fluxbox [documentation][9].

For example, this is my typical menu (or at least the basic structure of it):


```
# to use your own menu, copy this to ~/.fluxbox/menu, then edit
# ~/.fluxbox/init and change the session.menuFile path to ~/.fluxbox/menu

[begin] (fluxkbox)
 [submenu] (apps) {}
  [submenu] (txt) {}
   [exec] (Emacs 23 (text\\)) { x-terminal-emulator -T "Emacs (text)" -e /usr/bin/emacs -nw} &lt;&gt;
   [exec] (Emacs (X11\\)) {/usr/bin/emacs} &lt;&gt;
   [exec] (LibreOffice) {/usr/bin/libreoffice}
  [end]
  [submenu] (code) {}
   [exec] (qtCreator) {/usr/bin/qtcreator}
   [exec] (eclipse) {/usr/bin/eclipse}
  [end]
  [submenu] (graphics) {}
   [exec] (ksnapshot) {/usr/bin/ksnapshot}
   [exec] (gimp) {/usr/bin/gimp}
   [exec] (blender) {/usr/bin/blender}
  [end]
  [submenu] (files) {}
   [exec] (dolphin) {/usr/bin/dolphin}
   [exec] (konqueror) { /usr/bin/kfmclient openURL $HOME }
  [end]
  [submenu] (network) {}
   [exec] (firefox) {/usr/bin/firefox}
   [exec] (konqueror) {/usr/bin/konqueror}
  [end]
 [end]
## change window manager or work env
[submenu] (environments) {}
 [restart] (flux)  {/usr/bin/startfluxbox}
 [restart] (ratpoison)  {/usr/bin/ratpoison}
 [exec] (openIndiana) {/home/kenlon/qemu/startSolaris.sh}
[end]

[config] (config)
 [submenu] (styles) {}
  [stylesdir] (/usr/share/fluxbox/styles)
  [stylesdir] (~/.fluxbox/styles)
 [end]
[workspaces] (workspaces)
[reconfig] (reconfigure)
[restart] (restart)
[exit] (exeunt)
[end]
```

The menu also provides a few preference settings, such as the ability to pick a theme and restart or log out from your Fluxbox session.

I launch most applications using keyboard shortcuts, which are entered into the **keys** configuration file. Here are some examples (the **Mod4** key is the Super key, which I use to designate global shortcuts):


```
# open apps
Mod4 t :Exec konsole
Mod4 k :Exec konqueror
Mod4 z :Exec fbrun
Mod4 e :Exec emacs
Mod4 f :Exec firefox
Mod4 x :Exec urxvt
Mod4 d :Exec dolphin
Mod4 q :Exec xscreensaver-command -activate
Mod4 3 :Exec ksnapshot
```

Between these shortcuts and an open terminal, I have little use for a mouse during most of my workday, so there's no wasted time switching from one controller to another. And because Fluxbox stays well out of the way, there's little distraction.

### Why you should use Fluxbox

Fluxbox is very light on system resources, yet it has vital features to make your user experience easy, blazingly efficient, and unduly fast. It's simple to customize, and it allows you to define your own workflow. You don't have to use Fluxbox's panels, because there are other excellent panels out there. You can even middle-click and drag two separate application windows into one another so that they become one window, each in its own tab.

The possibilities are endless, so try the steady simplicity that is Fluxbox on your Linux box today!

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/12/fluxbox-linux-desktop

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/browser_blue_text_editor_web.png?itok=lcf-m6N7 (Text editor on a browser, in blue)
[2]: https://opensource.com/article/19/7/what-posix-richard-stallman-explains
[3]: http://fluxbox.org
[4]: http://fluxbox.org/download/
[5]: https://opensource.com/sites/default/files/advent-gdm_0.jpg (Select your desktop session in GDM)
[6]: https://opensource.com/sites/default/files/advent-kdm.jpg (Select your desktop session with KDM)
[7]: https://opensource.com/sites/default/files/advent-fluxbox-default.jpg (Default Fluxbox configuration on CentOS 7)
[8]: https://opensource.com/sites/default/files/advent-fluxbox-green.jpg (Fluxbox with a theme applied)
[9]: http://fluxbox.org/features/

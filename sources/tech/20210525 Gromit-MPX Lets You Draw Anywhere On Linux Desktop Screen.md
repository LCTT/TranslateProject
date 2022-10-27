[#]: subject: (Gromit-MPX Lets You Draw Anywhere On Linux Desktop Screen)
[#]: via: (https://itsfoss.com/gromit-mpx/)
[#]: author: (Sarvottam Kumar https://itsfoss.com/author/sarvottam/)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Gromit-MPX Lets You Draw Anywhere On Linux Desktop Screen
======

Have you ever wished that you could freeze your Linux desktop screen and draw anything on it? Or, you may want to point out or highlight a part of your app or desktop to someone else while [screen recording on Linux][1]?

If so, Gromit-MPX is an easy-to-use on-screen annotation tool that you could use right now.

### Make Annotation On Screen Using Gromit-MPX

![Gromit-MPX][2]

[Gromit-MPX][3] (**GR**aphics **O**ver **MI**scellaneous **T**hings – **M**ulti-**P**ointer **EX**tension) is a free and open-source tool that lets you annotate anywhere on the screen. The best thing about the app is it does not restrict you to use it only on one desktop environment.

Rather, Gromit-MPX is desktop-independent and supports [all Unix-based desktop environments][4] such as GNOME, KDE, and Xfce under both X11 and Wayland windowing sessions.

Even for X11, if you have a second pair of input devices and want to use it to annotate in place of the first pair, the app lets you set both a pointer for a dedicated annotation device and a multi-pointer at once.

Another thing that makes Gromit-MPX quite different from other available annotation tools is its easy-to-use and distraction-free philosophy.

What I mean to say is that, once you install and activate the app, you can either operate it using its tray icon (if your desktop has a system tray) or six default keys binding. Gromit-MPX does not draw or stick any UI widget of its own for making useful options available.

![Tray icon options][5]

You can toggle it on and off on the fly using a `F9` hotkey without interrupting your normal workflow. And whether you want to undo/redo your last draw or clear the screen completely, you’re only one key away from performing the action: `F8` to undo the last stroke (max up to 4 stroke) and `SHIFT-F9` to clear the screen.

![Gromit-MPX Available Commands][6]

Of course, you’re also completely free to change its default configuration for both key bindings and drawing tools.

One of the things that I think Gromit-MPX lacks is the availability of different shapes like rectangles, circles, and straight lines. Currently, you can annotate the desktop screen only using freehand drawing, which you may initially find difficult to handle.

![Upcoming feature in Gromit-MPX][7]

However, the good news is the functionality to draw straight lines in Gromit-MPX is under development and already planned to feature in the next version 1.5.

### Installing Gromit-MPX on Ubuntu and other Linux distributions

If you’re using Debian-based distributions like Ubuntu, Gromit-MPX is already available in the repository. You only need to run a single command to install it.

```
sudo apt install gromit-mpx
```

However, for the older OS version, you may not get the latest version 1.4 of the app and miss some important features. If you want the current latest version 1.4, you need to install it from the [Flathub repository][8] using the universal package manager [Flatpak][9].

If you’ve not set up Flatpak on your system, check out the complete [Flatpak guide][10]. Once you enable the Flatpak support, you can run the following command to install Gromit-MPX.

```
flatpak install flathub net.christianbeier.Gromit-MPX
```

![Install Gromit-MPX Using Flatpak][11]

If you don’t want the Flatpak package or your system doesn’t support it, you can also download its [source code][3], compile and build the app on its own.

### How to change key binding and tool color in Gromit-MPX?

By default, Gromit-MPX uses red color for the tool. But it also provides other colors that you can switch to using hotkeys. For instance, once you toggle on drawing, you can hold `SHIFT` for turning tool color into blue, and `CONTROL` for yellow.

And if you wish your default color other than red or different color for different hotkeys, you can configure the same in the `gromit-mpx.cfg` file.

![Change tool color][12]

You can find the configuration file either in a directory listed in $XDG_CONFIG_HOME variable (usually ~/.config or ~/.var/app/net.christianbeier.Gromit-MPX/config/ if you’ve installed Flatpak package) or /etc/gromit-mpx/ if you have Debian package.

For changing the default Hotkey or Undo key, you need to add a new entry with a custom value in the same config file.

```
HOTKEY="F9"
UNDOKEY="F8"
```

### How to start Gromit-MPX automatically on boot?

In case you’re using Gromit-MPX regularly, then you may want to mark it as a startup app instead of opening it manually each time you boot the system.

So, to autostart Gromit-MPX, you can either make use of the GUI [Startup Applications utility][13] or manually add a desktop entry with the below content at `~/.config/autostart/gromit-mpx.desktop`.

```
[Desktop Entry]
Type=Application
Exec=gromit-mpx
```

If you’re using the Flatpak package, you need to replace `Exec=gromit-mpx` with `Exec=flatpak run net.christianbeier.Gromit-MPX`.

I hope you like this nifty tool. If you try it, don’t forget to share your experience.

--------------------------------------------------------------------------------

via: https://itsfoss.com/gromit-mpx/

作者：[Sarvottam Kumar][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/sarvottam/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/best-linux-screen-recorders/
[2]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/05/Gromit-MPX.jpg?resize=800%2C450&ssl=1
[3]: https://github.com/bk138/gromit-mpx
[4]: https://itsfoss.com/best-linux-desktop-environments/
[5]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/05/Tray-icon-options.jpg?resize=235%2C450&ssl=1
[6]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/05/Gromit-MPX-Available-Commands.jpg?resize=800%2C361&ssl=1
[7]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/05/Upcoming-feature-in-Gromit-MPX.jpg?resize=600%2C338&ssl=1
[8]: https://flathub.org/apps/details/net.christianbeier.Gromit-MPX
[9]: https://itsfoss.com/what-is-flatpak/
[10]: https://itsfoss.com/flatpak-guide/
[11]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/05/Install-Gromit-MPX-Using-Flatpak.jpg?resize=800%2C325&ssl=1
[12]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/05/Change-tool-color.jpg?resize=800%2C450&ssl=1
[13]: https://itsfoss.com/manage-startup-applications-ubuntu/

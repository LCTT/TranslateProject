[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Fedora’s gaggle of desktops)
[#]: via: (https://fedoramagazine.org/fedoras-gaggle-of-desktops/)
[#]: author: (Troy Dawson https://fedoramagazine.org/author/tdawson/)

Fedora’s gaggle of desktops
======

![][1]

There are 38 different desktops or window managers in Fedora 31. You could try a different one every day for a month, and still have some left over. Some have very few features. Some have so many features they are called a desktop environment. This article can’t go into detail on each, but it’s interesting to see the whole list in one place.

### Criteria for desktops

To be on this list, the desktop must show up on the desktop manager’s selection list. If the desktop has more than one entry in the desktop manager list, they are counted just as that one desktop. An example is “GNOME”, “GNOME Classic” and “GNOME (Wayland).” These all show up on the desktop manager list, but they are still just GNOME.

### List of desktops
```

```

#### [**9wm**][2]

```
Emulation of the Plan 9 window manager 8 1/2
    dnf install 9wm
```

#### [**awesome**][3]

```
Highly configurable, framework window manager for X. Fast, light and extensible
https://fedoramagazine.org/5-cool-tiling-window-managers/
    dnf install awesome
```

#### [**blackbox**][4]

```
Very small and fast Window Manager
Fedora uses the maintained fork on github
    dnf install blackbox
```

#### [**bspwm**][5]

```
A tiling window manager based on binary space partitioning
https://github.com/windelicato/dotfiles/wiki/bspwm-for-dummies
    dnf install bspwm
```

#### **[byobu][6]**

```
Light-weight, configurable window manager built upon GNU screen
    dnf install byobu
```

#### **[Cinnamon][7]**

```
Cinnamon provides a desktop with a traditional layout, advanced features, easy to use, powerful and flexible.
https://projects.linuxmint.com/cinnamon/
https://opensource.com/article/19/12/cinnamon-linux-desktop
    dnf group install "Cinnamon Desktop"
```

#### **[cwm][8]**

```
Calm Window Manager by OpenBSD project
https://steemit.com/technology/@jamesdeagle/the-calm-window-manager-cwm-a-quick-start-guide
    dnf install cwm
```

#### **[Deepin][9]**

```
Deepin desktop is the desktop environment released with deepin (the linux distribution). It aims at being elegant and easy to use.
    dnf group install "Deepin Desktop"
    (optional) dnf group install "Deepin Desktop Office" "Media packages for Deepin Desktop"
```

#### **[dwm][10]**

```
Dynamic window manager for X
https://fedoramagazine.org/lets-try-dwm-dynamic-window-manger/
https://fedoramagazine.org/5-cool-tiling-window-managers/
    dnf install dwm
    (optional) dnf install dwm-user
```

#### **[enlightenment][11]**

```
Enlightenment window manager
https://opensource.com/article/19/12/linux-enlightenment-desktop
    dnf install enlightenment
```

#### **[e16][11]**

```
The Enlightenment window manager, DR16
    dnf install e16
    (optional) dnf install e16-epplets e16-keyedit e16-themes
```

#### **[fluxbox][12]**

```
Window Manager based on Blackbox
    dnf install fluxbox
    (optional) dnf install fluxbox-pulseaudio fluxbox-vim-syntax
```

#### **[fvwm][13]**

```
Highly configurable multiple virtual desktop window manager
http://www.fvwm.org/
https://opensource.com/article/19/12/fvwm-linux-desktop
    dnf install fvwm
```

#### **[GNOME][14]**

```
GNOME is a highly intuitive and user friendly desktop environment.
* both X11 and wayland
https://opensource.com/article/19/12/gnome-linux-desktop
https://fedoramagazine.org/3-simple-and-useful-gnome-shell-extensions/
    dnf group install "GNOME"
    (optional but large) dnf group install "Fedora Workstation"
```

#### **[herbstluftwm][15]**

```
A manual tiling window manager
https://opensource.com/article/19/12/herbstluftwm-linux-desktop
    dnf install herbstluftwm
    (optional) dnf install herbstluftwm-zsh herbstluftwm-fish
```

#### **[i3][16]**

```
Improved tiling window manager
https://fedoramagazine.org/getting-started-i3-window-manager/
https://fedoramagazine.org/using-i3-with-multiple-monitors/
    dnf install i3
    (optional) dnf install i3-doc i3-ipc
```

#### **[icewm][17]**

```
Window manager designed for speed, usability, and consistency
https://fedoramagazine.org/icewm-a-really-cool-desktop/
    dnf install icewm
    (optional) dnf install icewm-minimal-session
```

#### **[jwm][18]**

```
Joe's Window Manager
https://opensource.com/article/19/12/joes-window-manager-linux-desktop
    dnf install jwm
```

#### **[KDE Plasma Desktop][19]**

```
The KDE Plasma Workspaces, a highly-configurable graphical user interface which includes a panel, desktop, system icons and desktop widgets, and many powerful KDE applications.
* both X11 and wayland
https://opensource.com/article/19/12/linux-kde-plasma
https://fedoramagazine.org/installing-kde-plasma-5/
    dnf group install "KDE Plasma Workspaces"
    (optional) dnf group install "KDE Applications" "KDE Educational applications" "KDE Multimedia support" "KDE Office" "KDE Telepathy"
    (optional for wayland) dnf install kwin-wayland plasma-workspace-wayland
```

#### **[lumina][20]**

```
A lightweight, portable desktop environment
https://opensource.com/article/19/12/linux-lumina-desktop
    dnf install lumina-desktop
    (optional) dnf install lumina-*
```

#### **[LXDE][21]**

```
LXDE is a lightweight X11 desktop environment designed for computers with low hardware specifications like netbooks, mobile devices or older computers.
https://opensource.com/article/19/12/lxqt-lxde-linux-desktop
    dnf group install "LXDE Desktop"
    (optional) dnf group install "LXDE Office" "Multimedia support for LXDE"
```

#### **[LXQt][22]**

```
LXQt is a lightweight X11 desktop environment designed for computers with low hardware specifications like netbooks, mobile devices or older computers.
https://opensource.com/article/19/12/lxqt-lxde-linux-desktop
    dnf group install "LXQt Desktop"
    (optional) dnf group install "LXQt Office" "Multimedia support for LXQt"
```

#### **[MATE][23]**

```
MATE Desktop is based on GNOME 2 and provides a powerful graphical user interface for users who seek a simple easy to use traditional desktop interface.
https://opensource.com/article/19/12/mate-linux-desktop
https://fedoramagazine.org/installing-another-desktop/
    dnf group install "MATE Desktop"
    (optional) dnf group install "MATE Applications"
```

#### **[musca][24]**

```
A simple dynamic window manager fox X
    dnf install musca
```

#### **[openbox][25]**

```
A highly configurable and standards-compliant X11 window manager
https://opensource.com/article/19/12/openbox-linux-desktop
https://fedoramagazine.org/openbox-fedora/
    dnf install openbox
    (optional) dnf install openbox-kde openbox-theme-mistral-thin-dark
```

#### **[Pantheon][26]**

```
The Pantheon desktop environment is the DE that powers elementaryOS.
https://github.com/elementary
https://opensource.com/article/19/12/pantheon-linux-desktop
    dnf group install "Pantheon Desktop"
    (optional) dnf install elementary-capnet-assist elementary-greeter elementary-shortcut-overlay
```

#### **[pekwm][27]**

```
A small and flexible window manager
https://opensource.com/article/19/12/pekwm-linux-desktop
    dnf install pekwm
```

#### **[qtile][28]**

```
A pure-Python tiling window manager
https://fedoramagazine.org/5-cool-tiling-window-managers/
    dnf install qtile
```

#### **[ratpoison][29]**

```
Minimalistic window manager
https://opensource.com/article/19/12/ratpoison-linux-desktop
    dnf install ratpoison
```

#### **[sawfish][30]**

```
An extensible window manager for the X Window System
    dnf install sawfish
    (optional) dnf install sawfish-pager
```

#### **[spectrwm][31]**

```
Minimalist tiling window manager written in C
    dnf install spectrwm
```

#### **[Sugar][32]**

```
A software playground for learning about learning.
* Possibly the most unique desktop of this list.
    dnf group install "Sugar Desktop Environment"
    (optional) dnf group install "Additional Sugar Activities"
```

#### **[sway][33]**

```
i3-compatible window manager for Wayland
* Wayland only
https://fedoramagazine.org/setting-up-the-sway-window-manager-on-fedora/
https://fedoramagazine.org/5-cool-tiling-window-managers/
    dnf install sway
```

#### **[twm][34]**

```
X.Org X11 twm window manager
https://en.wikipedia.org/wiki/Twm
https://opensource.com/article/19/12/twm-linux-desktop
    dnf install xorg-x11-twm
```

#### **[WindowMaker][35]**

```
A fast, feature rich Window Manager
https://opensource.com/article/19/12/linux-window-maker-desktop
    dnf install WindowMaker
    (optional) dnf install WindowMaker-extra
```

#### **[wmx][36]**

```
A really simple window manager for X
    dnf install wmx
```

#### **[XFCE][37]**

```
A lightweight desktop environment that works well on low end machines.
https://opensource.com/article/19/12/xfce-linux-desktop
    dnf group install "Xfce Desktop"
    (optional) dnf group install "Applications for the Xfce Desktop" "Extra plugins for the Xfce panel" "Multimedia support for Xfce" "Xfce Office"
```

#### **[xmonad][38]**

```
A tiling window manager
    dnf install xmonad
    (optional) dnf install xmonad-mate
```

* * *

_Photo by [Annie Spratt][39] on [Unsplash][40]._

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/fedoras-gaggle-of-desktops/

作者：[Troy Dawson][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/tdawson/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2020/01/gaggle-desktops-816x345.jpg
[2]: https://github.com/9wm/9wm
[3]: https://awesomewm.org/
[4]: https://github.com/bbidulock/blackboxwm
[5]: https://github.com/baskerville/bspwm
[6]: https://byobu.org/
[7]: https://github.com/linuxmint/cinnamon
[8]: https://github.com/leahneukirchen/cwm
[9]: https://www.deepin.org/en/dde/
[10]: http://dwm.suckless.org/
[11]: https://www.enlightenment.org/
[12]: http://fluxbox.org/
[13]: https://github.com/fvwmorg/fvwm
[14]: https://www.gnome.org/
[15]: http://herbstluftwm.org/
[16]: https://i3wm.org/
[17]: https://ice-wm.org/
[18]: http://joewing.net/projects/jwm/
[19]: https://kde.org/
[20]: https://lumina-desktop.org/
[21]: https://lxde.org/
[22]: https://lxqt.org/
[23]: https://mate-desktop.org/
[24]: https://github.com/enticeing/musca
[25]: http://openbox.org
[26]: https://elementary.io/
[27]: http://www.pekwm.org/
[28]: http://qtile.org
[29]: http://www.nongnu.org/ratpoison/
[30]: http://sawfish.wikia.com/
[31]: https://github.com/conformal/spectrwm
[32]: https://sugarlabs.org/
[33]: https://github.com/swaywm/sway
[34]: https://www.x.org/releases/X11R7.6/doc/man/man1/twm.1.xhtml
[35]: http://www.windowmaker.org
[36]: http://www.all-day-breakfast.com/wmx/
[37]: https://www.xfce.org/
[38]: https://hackage.haskell.org/package/xmonad
[39]: https://unsplash.com/@anniespratt?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[40]: https://unsplash.com/?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText

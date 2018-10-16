translating---geekpi

5 cool tiling window managers
======

![](https://fedoramagazine.org/wp-content/uploads/2018/09/tilingwindowmanagers-816x345.jpg)
The Linux desktop ecosystem offers multiple window managers (WMs). Some are developed as part of a desktop environment. Others are meant to be used as standalone application. This is the case of tiling WMs, which offer a more lightweight, customized environment. This article presents five such tiling WMs for you to try out.

### i3

[i3][1] is one of the most popular tiling window managers. Like most other such WMs, i3 focuses on low resource consumption and customizability by the user.

You can refer to [this previous article in the Magazine][2] to get started with i3 installation details and how to configure it.

### sway

[sway][3] is a tiling Wayland compositor. It has the advantage of compatibility with an existing i3 configuration, so you can use it to replace i3 and use Wayland as the display protocol.

You can use dnf to install sway from Fedora repository:

```
$ sudo dnf install sway
```

If you want to migrate from i3 to sway, there’s a small [migration guide][4] available.

### Qtile

[Qtile][5] is another tiling manager that also happens to be written in Python. By default, you configure Qtile in a Python script located under ~/.config/qtile/config.py. When this script is not available, Qtile uses a default [configuration][6].

One of the benefits of Qtile being in Python is you can write scripts to control the WM. For example, the following script prints the screen details:

```
> from libqtile.command import Client
> c = Client()
> print(c.screen.info)
{'index': 0, 'width': 1920, 'height': 1006, 'x': 0, 'y': 0}
```

To install Qlite on Fedora, use the following command:

```
$ sudo dnf install qtile
```

### dwm

The [dwm][7] window manager focuses more on being lightweight. One goal of the project is to keep dwm minimal and small. For example, the entire code base never exceeded 2000 lines of code. On the other hand, dwm isn’t as easy to customize and configure. Indeed, the only way to change dwm default configuration is to [edit the source code and recompile the application][8].

If you want to try the default configuration, you can install dwm in Fedora using dnf:

```
$ sudo dnf install dwm
```

For those who wand to change their dwm configuration, the dwm-user package is available in Fedora. This package automatically recompiles dwm using the configuration stored in the user home directory at ~/.dwm/config.h.

### awesome

[awesome][9] originally started as a fork of dwm, to provide configuration of the WM using an external configuration file. The configuration is done via Lua scripts, which allow you to write scripts to automate tasks or create widgets.

You can check out awesome on Fedora by installing it like this:

```
$ sudo dnf install awesome
```


--------------------------------------------------------------------------------

via: https://fedoramagazine.org/5-cool-tiling-window-managers/

作者：[Clément Verna][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org
[1]: https://i3wm.org/
[2]: https://fedoramagazine.org/getting-started-i3-window-manager/
[3]: https://swaywm.org/
[4]: https://github.com/swaywm/sway/wiki/i3-Migration-Guide
[5]: http://www.qtile.org/
[6]: https://github.com/qtile/qtile/blob/develop/libqtile/resources/default_config.py
[7]: https://dwm.suckless.org/
[8]: https://dwm.suckless.org/customisation/
[9]: https://awesomewm.org/

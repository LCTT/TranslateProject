[#]: subject: (Remap your Caps Lock key on Linux)
[#]: via: (https://opensource.com/article/21/5/remap-caps-lock-key-linux)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)
[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13414-1.html)

在 Linux 上重新映射你的大写锁定键
======

> 通过在 GNOME 3 和 Wayland 上重新映射你的键盘，提高你的打字和导航速度，避免重复性压力伤害。

![](https://img.linux.net.cn/data/attachment/album/202105/22/174755hs0dbmm4idl5rbrr.jpg)

对我来说，有许多改变生活的 Linux 时刻，但大多数都在成为现状后淡忘了。有一个 Linux 教给我的键盘小技巧，每次我使用它的时候（也许每天有 1000 次），我都会想起这件事，那就是把大写锁定键转换为 `Ctrl` 键。

我从不使用大写锁定键，但我整天使用 `Ctrl` 键进行复制、粘贴、在 [Emacs][2] 内导航，以及 [调用 Bash][3]、[GNU Screen][4] 或 [tmux][5] 等操作。大写锁定键在我的键盘上占据了宝贵的空间，而将实际上有用的 `Ctrl` 键挤到了难以触及的底部角落。

![手指放在键盘上][6]

*这看起来就痛苦*

重新映射 `Ctrl` 提高了我的打字和导航速度，并可能使我免受重复性压力伤害。

### 消失的控制

系好安全带，这是个过山车式的历史课。

对于像我这样的大写锁定键交换者来说，不幸的是，当 GNOME 3 问世时，它几乎删除了改变 `Ctrl` 键位置的功能。

幸运的是，优秀的 GNOME Tweaks 应用程序带回了这些 “失踪” 的控制面板。

不幸的是，[GNOME 40][8] 没有 GNOME Tweaks 应用程序（还没有？）

另外，不幸的是，过去在 X11 上可以工作的老的 `xmodmap` 技巧在新的 [Wayland 显示服务器][9] 上没有用。

有一小段时间（最多一个下午），我觉得对于那些讨厌大写锁定键的人来说人生都灰暗了。然后我想起我是一个开源的用户，总有一种方法可以解决诸如被忽略的 GUI 控制面板之类的简单问题。

### dconf

GNOME 桌面使用 dconf，这是一个存储重要配置选项的数据库。它是 GSettings 的后端，GSettings 是 GNOME 系统应用程序需要发现系统偏好时的接口。你可以使用 `gsetting` 命令查询 dconf 数据库，也可以使用 `dconf` 命令直接设置 dconf 的键值。

### GSettings

dconf 数据库不一定是你可能称为可发现的数据库。它是一个不起眼的数据库，你通常不需要去考虑它，它包含了许多通常无需直接交互的数据。然而，如果你想更好地了解 GNOME 所要管理的所有偏好选项，那么浏览它是很有趣的。

你可以用 `list-schemas` 子命令列出所有 dconf 的模式。在浏览了数百个模式之后，你可以使用 [grep][10] 将你的注意力缩小到一些看起来特别相关的东西上，比如 `org.gnome.desktop`。

```
$ gsettings list-schemas | grep ^org.gnome.desktop
[...]
org.gnome.desktop.background
org.gnome.desktop.privacy
org.gnome.desktop.remote-desktop.vnc
org.gnome.desktop.interface
org.gnome.desktop.default-applications.terminal
org.gnome.desktop.session
org.gnome.desktop.thumbnailers
org.gnome.desktop.app-folders
org.gnome.desktop.notifications
org.gnome.desktop.sound
org.gnome.desktop.lockdown
org.gnome.desktop.default-applications.office
```

无论是通过手动搜索还是通过 [阅读 GSetting 文档][11]，你可能会注意到 `org.gnome.desktop.input-sources` 模式，它有助于定义键盘布局。从设计上来说，GSetting 模式包含了键和值。

### 用 dconf 重新映射大写字母锁

`xkb-options` 键包含了可选的键盘覆写。要设置这个键值，请使用`dconf`，将上面模式中的点（`.`）转换为斜线（`/`），因为 dconf 数据库需要使用 `/`。

```
$ dconf write /org/gnome/desktop/input-sources/xkb-options "['caps:ctrl_modifier']"
```

我把 `caps` 设置为 `ctrl_modifier`，因为我使用 `Ctrl` 修饰键的次数多于其他修饰键，但 Vim 用户可能喜欢把它设置为 `escape`。

### 查看你的设置

这个改变会立即生效，并在重启后仍然生效。这是你在 GNOME 中定义的首选项，在你改变它之前一直有效。

你可以通过 `gsettings` 查看 dconf 中的新值。首先，查看可用的键：

```
$ gsettings list-keys \
    org.gnome.desktop.input-sources
xkb-options
mru-sources
show-all-sources
current
per-window
sources
```

然后用 `xkb-options` 键名查看设置：

```
$ gsettings get \
    org.gnome.desktop.input-sources \
    xkb-options
['caps:ctrl_modifier']
```

### 选项丰富

我在我的 GNOME 3.4 系统上使用这个小技巧来设置大写锁定键以及 [Compose][12] 键（`compose:ralt`）。虽然我相信正在开发中的 GUI 控件可以控制这些选项，但我也不得不承认，能以编程方式设置这些选项的能力是我的荣幸。作为以前没有可靠方法来调整桌面设置的系统的管理员，能够用命令修改我的首选项使得设置新桌面变得快速而容易。

GSettings 提供了很多有用的选项，而且文档也很详尽。如果你有想要改变的东西，可以看看有什么可用的。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/5/remap-caps-lock-key-linux

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/emoji-keyboard.jpg?itok=JplrSZ9c (Emoji keyboard)
[2]: https://opensource.com/article/20/12/emacs
[3]: https://opensource.com/article/18/5/bash-tricks#key
[4]: https://opensource.com/article/17/3/introduction-gnu-screen
[5]: https://opensource.com/article/19/6/tmux-terminal-joy
[6]: https://opensource.com/sites/default/files/uploads/bendy-fingers.jpg (Fingers on a keyboard)
[7]: https://creativecommons.org/licenses/by-sa/4.0/
[8]: https://discourse.gnome.org/t/new-gnome-versioning-scheme/4235
[9]: https://wayland.freedesktop.org
[10]: https://opensource.com/downloads/grep-cheat-sheet
[11]: https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/8/html/using_the_desktop_environment_in_rhel_8/configuring-gnome-at-low-level_using-the-desktop-environment-in-rhel-8
[12]: https://opensource.com/article/17/5/7-cool-kde-tweaks-will-improve-your-life

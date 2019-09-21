5 个很酷的平铺窗口管理器
======

![](https://fedoramagazine.org/wp-content/uploads/2018/09/tilingwindowmanagers-816x345.jpg)

Linux 桌面生态中有多种窗口管理器（WM）。有些是作为桌面环境的一部分开发的。有的则被用作独立程序。平铺窗口管理器就是这种情况，它提供了一个更轻量级的自定义环境。本文介绍了五种这样的平铺窗口管理器供你试用。

### i3

[i3][1] 是最受欢迎的平铺窗口管理器之一。与大多数其他此类 WM 一样，i3 专注于低资源消耗和用户可定制性。

您可以参考 [Magazine 上的这篇文章][2]了解 i3 安装细节以及如何配置它。

### sway

[sway][3] 是一个平铺 Wayland 合成器。它有与现有 i3 配置兼容的优点，因此你可以使用它来替换 i3 并使用 Wayland 作为显示协议。

您可以使用 `dnf` 从 Fedora 仓库安装 sway：

```
$ sudo dnf install sway
```

如果你想从 i3 迁移到 sway，这里有一个[迁移指南][4]。

### Qtile

[Qtile][5] 是另一个平铺管理器，也恰好是用 Python 编写的。默认情况下，你在位于 `~/.config/qtile/config.py` 下的 Python 脚本中配置 Qtile。当此脚本不存在时，Qtile 会使用默认[配置][6]。

Qtile 使用 Python 的一个好处是你可以编写脚本来控制 WM。例如，以下脚本打印屏幕详细信息：

```
> from libqtile.command import Client
> c = Client()
> print(c.screen.info)
{'index': 0, 'width': 1920, 'height': 1006, 'x': 0, 'y': 0}
```

要在 Fedora 上安装 Qlite，请使用以下命令：

```
$ sudo dnf install qtile
```

### dwm

[dwm][7] 窗口管理器更侧重于轻量级。该项目的一个目标是保持 dwm 最小。例如，整个代码库从未超过 2000 行代码。另一方面，dwm 不容易定制和配置。实际上，改变 dwm 默认配置的唯一方法是[编辑源代码并重新编译程序][8]。

如果你想尝试默认配置，你可以使用 `dnf` 在 Fedora 中安装 dwm：

```
$ sudo dnf install dwm
```

对于那些想要改变 dwm 配置的人，Fedora 中有一个 dwm-user 包。该软件包使用用户主目录中 `~/.dwm/config.h` 的配置自动重新编译 dwm。

### awesome

[awesome][9] 最初是作为 dwm 的一个分支开发，使用外部配置文件提供 WM 的配置。配置通过 Lua 脚本完成，这些脚本允许你编写脚本以自动执行任务或创建 widget。

你可以使用这个命令在 Fedora 上安装 awesome：

```
$ sudo dnf install awesome
```


--------------------------------------------------------------------------------

via: https://fedoramagazine.org/5-cool-tiling-window-managers/

作者：[Clément Verna][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

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

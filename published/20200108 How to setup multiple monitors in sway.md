[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11809-1.html)
[#]: subject: (How to setup multiple monitors in sway)
[#]: via: (https://fedoramagazine.org/how-to-setup-multiple-monitors-in-sway/)
[#]: author: (arte219 https://fedoramagazine.org/author/arte219/)

如何在 Sway 中设置多个显示器
======

![][1]

Sway 是一种平铺式 Wayland 合成器，具有与 [i3 X11 窗口管理器][2]相同的功能、外观和工作流程。由于 Sway 使用 Wayland 而不是 X11，因此就不能一如既往地使用设置 X11 的工具。这包括 `xrandr` 之类的工具，这些工具在 X11 窗口管理器或桌面中用于设置显示器。这就是为什么必须通过编辑 Sway 配置文件来设置显示器的原因，这就是本文的目的。

### 获取你的显示器 ID

首先，你必须获得 Sway 用来指代显示器的名称。你可以通过运行以下命令进行操作：

```
$ swaymsg -t get_outputs
```

你将获得所有显示器的相关信息，每个显示器都用空行分隔。

你必须查看每个部分的第一行，以及 `Output` 之后的内容。例如，当你看到 `Output DVI-D-1 'Philips Consumer Electronics Company'` 之类的行时，则该输出 ID 为 `DVI-D-1`。注意这些 ID 及其所属的物理监视器。

### 编辑配置文件

如果你之前没有编辑过 Sway 配置文件，则必须通过运行以下命令将其复制到主目录中：

```
cp -r /etc/sway/config ~/.config/sway/config
```

现在，默认配置文件位于 `~/.config/sway` 中，名为 `config`。你可以使用任何文本编辑器进行编辑。

现在你需要做一点数学。想象有一个网格，其原点在左上角。X 和 Y 坐标的单位是像素。Y 轴反转。这意味着，例如，如果你从原点开始，向右移动 100 像素，向下移动 80 像素，则坐标将为 `(100, 80)`。

你必须计算最终显示在此网格上的位置。显示器的位置由左上方的像素指定。例如，如果我们要使用名称为“HDMI1”且分辨率为 1920×1080 的显示器，并在其右侧使用名称为 “eDP1” 且分辨率为 1600×900 的笔记本电脑显示器，则必须在配置文件中键入 ：

```
output HDMI1 pos 0 0
output eDP1 pos 1920 0
```

你还可以使用 `res` 选项手动指定分辨率：

```
output HDMI1 pos 0 0 res 1920x1080
output eDP1 pos 1920 0 res 1600x900
```

### 将工作空间绑定到显示器上

与多个监视器一起使用 Sway 在工作区管理中可能会有些棘手。幸运的是，你可以将工作区绑定到特定的显示器上，因此你可以轻松地切换到该显示器并更有效地使用它。只需通过配置文件中的 `workspace` 命令即可完成。例如，如果要绑定工作区 1 和 2 到显示器 “DVI-D-1”，绑定工作区 8 和 9 到显示器 “HDMI-A-1”，则可以使用以下方法：

```
workspace 1 output DVI-D-1
workspace 2 output DVI-D-1
```

```
workspace 8 output HDMI-A-1
workspace 9 output HDMI-A-1
```

就是这样。这就在  Sway 中多显示器设置的基础知识。可以在 <https://github.com/swaywm/sway/wiki#Wiki#Multihead> 中找到更详细的指南。

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/how-to-setup-multiple-monitors-in-sway/

作者：[arte219][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/arte219/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2020/01/sway-multiple-monitors-816x345.png
[2]: https://fedoramagazine.org/getting-started-i3-window-manager/

[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11310-1.html)
[#]: subject: (Change your Linux terminal color theme)
[#]: via: (https://opensource.com/article/19/8/add-color-linux-terminal)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

如何更改 Linux 终端颜色主题
======

> 你可以用丰富的选项来定义你的终端主题。

![](https://img.linux.net.cn/data/attachment/album/201909/06/070600ztd434ppd99df99d.jpg)

如果你大部分时间都盯着终端，那么你很自然地希望它看起来能赏心悦目。美与不美，全在观者，自 CRT 串口控制台以来，终端已经经历了很多变迁。因此，你的软件终端窗口有丰富的选项，可以用来定义你看到的主题，不管你如何定义美，这总是件好事。

### 设置

包括 GNOME、KDE 和 Xfce 在内的流行的软件终端应用，它们都提供了更改其颜色主题的选项。调整主题就像调整应用首选项一样简单。Fedora、RHEL 和 Ubuntu 默认使用 GNOME，因此本文使用该终端作为示例，但对 Konsole、Xfce 终端和许多其他终端的设置流程类似。

首先，进入到应用的“首选项”或“设置”面板。在 GNOME 终端中，你可以通过屏幕顶部或窗口右上角的“应用”菜单访问它。

在“首选项”中，单击“配置文件” 旁边的加号（“+”）来创建新的主题配置文件。在新配置文件中，单击“颜色”选项卡。

![GNOME Terminal preferences][2]

在“颜色”选项卡中，取消选择“使用系统主题中的颜色”选项，以使窗口的其余部分变为可选状态。最开始，你可以选择内置的颜色方案。这些包括浅色主题，它有明亮的背景和深色的前景文字；还有深色主题，它有深色背景和浅色前景文字。

当没有其他设置（例如 `dircolors` 命令的设置）覆盖它们时，“默认颜色”色板将同时定义前景色和背景色。“调色板”设置 `dircolors` 命令定义的颜色。这些颜色由终端以 `LS_COLORS` 环境变量的形式使用，以在 [ls][3] 命令的输出中添加颜色。如果这些颜色不吸引你，请在此更改它们。

如果对主题感到满意，请关闭“首选项”窗口。

要将终端更改为新的配置文件，请单击“应用”菜单，然后选择“配置文件”。选择新的配置文件，接着享受自定义主题。

![GNOME Terminal profile selection][4]

### 命令选项

如果你的终端没有合适的设置窗口，它仍然可以在启动命令中提供颜色选项。xterm 和 rxvt 终端（旧的和启用 Unicode 的变体，有时称为 urxvt 或 rxvt-unicode）都提供了这样的选项，因此即使没有桌面环境和大型 GUI 框架，你仍然可以设置终端模拟器的主题。

两个明显的选项是前景色和背景色，分别用 `-fg` 和 `-bg` 定义。每个选项的参数是*颜色名*而不是它的 ANSI 编号。例如：

```
$ urxvt -bg black -fg green
```

这些会设置默认的前景和背景。如果有任何其他规则会控制特定文件或设备类型的颜色，那么就使用这些颜色。有关如何设置它们的信息，请参阅 [dircolors][5] 命令。

你还可以使用 `-cr` 设置文本光标（而不是鼠标光标）的颜色：

```
$ urxvt -bg black -fg green -cr teal
```

![Setting color in urxvt][6]

你的终端模拟器可能还有更多选项，如边框颜色（rxvt 中的 `-bd`）、光标闪烁（urxvt 中的 `-bc` 和 `+bc`），甚至背景透明度。请参阅终端的手册页，了解更多的功能。

要使用你选择的颜色启动终端，你可以将选项添加到用于启动终端的命令或菜单中（例如，在你的 Fluxbox 菜单文件、`$HOME/.local/share/applications` 目录中的 `.desktop` 或者类似的）。或者，你可以使用 [xrdb][7] 工具来管理与 X 相关的资源（但这超出了本文的范围）。

### 家是可定制的地方

自定义 Linux 机器并不意味着你需要学习如何编程。你可以而且应该进行小而有意义的更改，来使你的数字家庭感觉更舒适。而且没有比终端更好的起点了！

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/8/add-color-linux-terminal

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/terminal_command_linux_desktop_code.jpg?itok=p5sQ6ODE (Terminal command prompt on orange background)
[2]: https://opensource.com/sites/default/files/uploads/gnome-terminal-preferences.jpg (GNOME Terminal preferences)
[3]: https://opensource.com/article/19/7/master-ls-command
[4]: https://opensource.com/sites/default/files/uploads/gnome-terminal-profile-select.jpg (GNOME Terminal profile selection)
[5]: http://man7.org/linux/man-pages/man1/dircolors.1.html
[6]: https://opensource.com/sites/default/files/uploads/urxvt-color.jpg (Setting color in urxvt)
[7]: https://www.x.org/releases/X11R7.7/doc/man/man1/xrdb.1.xhtml

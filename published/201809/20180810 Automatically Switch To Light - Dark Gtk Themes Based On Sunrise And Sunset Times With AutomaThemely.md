基于日出和日落时间自动切换到明/暗 Gtk 主题
======

如果你在寻找一种基于日出和日落时间自动更改 Gtk 主题的简单方法，请尝试一下 [AutomaThemely][3]。

![](https://4.bp.blogspot.com/-LS0XNNflbp0/W2q8zAwhUdI/AAAAAAAABUY/l8fVbjt-tHExYxPHsyVv74iUhV4O9UXLwCLcBGAs/s640/automathemely-settings.png)

AutomaThemely 是一个 Python 程序，它可以根据光亮和黑暗时间自动更改 Gnome 主题，如果你想在夜间使用黑暗的 Gtk 主题并在白天使用明亮的 Gtk 主题，那么它非常有用。

**虽然该程序是为 Gnome 桌面制作的，但它也适用于 Unity**。AutomaThemely 不支持不使用 `org.gnome.desktop.interface Gsettings` 的桌面环境，如 Cinnamon，的 Gtk 主题，或者更改图标主题，至少现在还不行。它也不支持设置 Gnome Shell 主题。

除了自动更改 Gtk3 主题外，**AutomaThemely 还可以自动切换 Atom 编辑器和 VSCode 的明暗主题，以及 Atom 编辑器的明暗语法高亮。**这显然也是基于一天中的时间完成的。

[![AutomaThemely Atom VSCode][1]][2] 

*AutomaThemely Atom 和 VSCode 主题/语法设置*

程序使用你的 IP 地址来确定你的位置，以便检索日出和日落时间，并且需要有可用的 Internet 连接。但是，你可以从程序用户界面禁用自动定位，并手动输入你的位置。

在 AutomaThemely 用户界面中，你还可以输入日出和日落时间的偏移（以分钟为单位），并启用或禁用主题更改的通知。

### 下载/安装 AutomaThemely

- [下载 AutomaThemely][4]

**Ubuntu 18.04**：使用上面的链接，下载包含依赖项的 Python 3.6 DEB（`python3.6-automathemely_1.2_all.deb`）。

**Ubuntu 16.04**：你需要下载并安装 AutomaThemely Python 3.5 DEB，它不包含依赖项（`python3.5-no_deps-automathemely_1.2_all.deb`），并使用 PIP3 分别安装依赖项（`requests`、`astral `、`pytz`、`tzlocal` 和 `schedule`）：

```
sudo apt install python3-pip
python3 -m pip install --user requests astral pytz tzlocal schedule
```

AutomaThemely 下载页面还包含 Python 3.5 或 3.6 的 RPM 包，有包含和不包含依赖项两种。安装适合你的 Python 版本的软件包。如果你下载了包含依赖项的包但无法在你的系统上使用，请下载 “no_deps” 包并如上所述使用 PIP3 安装 Python3 依赖项。

### 使用 AutomaThemely 根据太阳时间更改明亮/黑暗 Gtk 主题

安装完成后，运行 AutomaThemely 一次以生成配置文件。单击 AutomaThemely 菜单条目或在终端中运行：

```
automathemely
```

这不会运行任何 GUI，它只生成配置文件。

使用 AutomaThemely 有点反直觉。你将在菜单中看到 AutomaThemely 图标，但单击它不会打开任何窗口/GUI。如果你使用支持列表跳转/快捷列表的 Gnome 或其他基于 Gnome 的桌面，你可以右键单击菜单中的 AutomaThemely 图标（或者你可以将其固定为 Dash/dock 并在那里右键单击它）并选择 Manage Settings 启动GUI：

![](https://2.bp.blogspot.com/-7YWj07q0-M0/W2rACrCyO_I/AAAAAAAABUs/iaN_LEyRSG8YGM0NB6Aw9PLKmRU4NxzMACLcBGAs/s320/automathemely-jumplists.png)

你还可以使用以下命令从命令行启动 AutomaThemely GUI：

```
automathemely --manage
```

**配置要使用的主题后，你需要更新太阳的时间并重新启动 AutomaThemely 调度器**。你可以通过右键单击 AutomaThemely 图标（应该在 Unity/Gnome 中可用）并选择 “Update sun times” 来更新太阳时间，然后选择 “Restart the scheduler” 来重启调度器完成此操作。你也可以使用以下命令从终端执行此操作：

```
automathemely --update
automathemely --restart
```


--------------------------------------------------------------------------------

via: https://www.linuxuprising.com/2018/08/automatically-switch-to-light-dark-gtk.html

作者：[Logix][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://plus.google.com/118280394805678839070
[1]:https://4.bp.blogspot.com/-K2-1K_MIWv0/W2q9GEWYA6I/AAAAAAAABUg/-z_gTMSHlxgN-ZXDvUGIeTQ8I72WrRq0ACLcBGAs/s640/automathemely-settings_2.png (AutomaThemely Atom VSCode)
[2]:https://4.bp.blogspot.com/-K2-1K_MIWv0/W2q9GEWYA6I/AAAAAAAABUg/-z_gTMSHlxgN-ZXDvUGIeTQ8I72WrRq0ACLcBGAs/s1600/automathemely-settings_2.png
[3]:https://github.com/C2N14/AutomaThemely
[4]:https://github.com/C2N14/AutomaThemely/releases

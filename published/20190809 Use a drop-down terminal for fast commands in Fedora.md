[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11216-1.html)
[#]: subject: (Use a drop-down terminal for fast commands in Fedora)
[#]: via: (https://fedoramagazine.org/use-a-drop-down-terminal-for-fast-commands-in-fedora/)
[#]: author: (Guilherme Schelp https://fedoramagazine.org/author/schelp/)

在 Fedora 下使用下拉式终端更快输入命令
======

![][1]

下拉式终端可以一键打开，并快速输入桌面上的任何命令。通常它会以平滑的方式创建终端，有时会带有下拉效果。本文演示了如何使用 Yakuake、Tilda、Guake 和 GNOME 扩展等下拉式终端来改善和加速日常任务。

### Yakuake

[Yakuake][2] 是一个基于 KDE Konsole 技术的下拉式终端模拟器。它以 GNU GPLv2 条款分发。它包括以下功能：

* 从屏幕顶部平滑地滚下
* 标签式界面
* 尺寸和动画速度可配置
* 换肤
* 先进的 D-Bus 接口

要安装 Yakuake，请使用以下命令：

```
$ sudo dnf install -y yakuake
```

#### 启动和配置

如果你运行 KDE，请打开系统设置，然后转到“启动和关闭”。将“yakuake”添加到“自动启动”下的程序列表中，如下所示：

![][3]

Yakuake 运行时很容易配置，首先在命令行启动该程序：

```
$ yakuake &
```

随后出现欢迎对话框。如果标准的快捷键和你已经使用的快捷键冲突，你可以设置一个新的。

![][4]

点击菜单按钮，出现如下帮助菜单。接着，选择“配置 Yakuake……”访问配置选项。

![][5]

你可以自定义外观选项，例如透明度、行为（例如当鼠标指针移过它们时聚焦终端）和窗口（如大小和动画）。在窗口选项中，你会发现当你使用两个或更多监视器时最有用的选项之一：“在鼠标所在的屏幕上打开”。

#### 使用 Yakuake

主要的快捷键有：

  * `F12` = 打开/撤回 Yakuake
  * `Ctrl+F11` = 全屏模式
  * `Ctrl+)` = 上下分割
  * `Ctrl+(` = 左右分割
  * `Ctrl+Shift+T` = 新会话
  * `Shift+Right` = 下一个会话
  * `Shift+Left` = 上一个会话
  * `Ctrl+Alt+S` = 重命名会话

以下是 Yakuake 像[终端多路复用器][6]一样分割会话的示例。使用此功能，你可以在一个会话中运行多个 shell。

![][7]

### Tilda

[Tilda][8] 是一个下拉式终端，可与其他流行的终端模拟器相媲美，如 GNOME 终端、KDE 的 Konsole、xterm 等等。

它具有高度可配置的界面。你甚至可以更改终端大小和动画速度等选项。Tilda 还允许你启用热键，以绑定到各种命令和操作。

要安装 Tilda，请运行以下命令：

```
$ sudo dnf install -y tilda
```

#### 启动和配置

大多数用户更喜欢在登录时就在后台运行一个下拉式终端。要设置此选项，请首先转到桌面上的应用启动器，搜索 Tilda，然后将其打开。

接下来，打开 Tilda 配置窗口。 选择“隐藏启动 Tilda”，即启动时不会立即显示终端。

![][9]

接下来，你要设置你的桌面自动启动 Tilda。如果你使用的是 KDE，请转到“系统设置 > 启动与关闭 > 自动启动”并“添加一个程序”。

![][10]

如果你正在使用 GNOME，则可以在终端中运行此命令：

```
$ ln -s /usr/share/applications/tilda.desktop ~/.config/autostart/
```

当你第一次运行它时，会出现一个向导来设置首选项。如果需要更改设置，请右键单击终端并转到菜单中的“首选项”。

![][11]

你还可以创建多个配置文件，并绑定其他快捷键以在屏幕上的不同位置打开新终端。为此，请运行以下命令：

```
$ tilda -C
```

每次使用上述命令时，Tilda 都会在名为 `~/.config/tilda/` 文件夹中创建名为 `config_0`、`config_1` 之类的新配置文件。然后，你可以映射组合键以打开具有一组特定选项的新 Tilda 终端。

#### 使用 Tilda

主要快捷键有：

  * `F1` = 拉下终端 Tilda（注意：如果你有多个配置文件，快捷方式是 F1、F2、F3 等）
  * `F11` = 全屏模式
  * `F12` = 切换透明模式
  * `Ctrl+Shift+T` = 添加标签
  * `Ctrl+Page Up` = 下一个标签
  * `Ctrl+Page Down` = 上一个标签

### GNOME 扩展

Drop-down Terminal [GNOME 扩展][12]允许你在 GNOME Shell 中使用这个有用的工具。它易于安装和配置，使你可以快速访问终端会话。

#### 安装

打开浏览器并转到[此 GNOME 扩展的站点][12]。启用扩展设置为“On”，如下所示：

![][13]

然后选择“Install”以在系统上安装扩展。

![][14]

执行此操作后，无需设置任何自动启动选项。只要你登录 GNOME，扩展程序就会自动运行！

#### 配置

安装后，将打开 Drop-down Terminal 配置窗口以设置首选项。例如，可以设置终端大小、动画、透明度和使用滚动条。

![][15]

如果你将来需要更改某些首选项，请运行 `gnome-shell-extension-prefs` 命令并选择“Drop Down Terminal”。

#### 使用该扩展

快捷键很简单：

  * 反尖号 （通常是 `Tab` 键上面的一个键) = 打开/撤回终端
  * `F12` （可以定制） = 打开/撤回终端

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/use-a-drop-down-terminal-for-fast-commands-in-fedora/

作者：[Guilherme Schelp][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/schelp/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2019/07/dropdown-terminals-816x345.jpg
[2]: https://kde.org/applications/system/org.kde.yakuake
[3]: https://fedoramagazine.org/wp-content/uploads/2019/07/auto_start-1024x723.png
[4]: https://fedoramagazine.org/wp-content/uploads/2019/07/yakuake_config-1024x419.png
[5]: https://fedoramagazine.org/wp-content/uploads/2019/07/yakuake_config_01.png
[6]: https://fedoramagazine.org/4-cool-terminal-multiplexers/
[7]: https://fedoramagazine.org/wp-content/uploads/2019/07/yakuake_usage.gif
[8]: https://github.com/lanoxx/tilda
[9]: https://fedoramagazine.org/wp-content/uploads/2019/07/tilda_startup.png
[10]: https://fedoramagazine.org/wp-content/uploads/2019/07/tilda_startup_alt.png
[11]: https://fedoramagazine.org/wp-content/uploads/2019/07/tilda_config.png
[12]: https://extensions.gnome.org/extension/442/drop-down-terminal/
[13]: https://fedoramagazine.org/wp-content/uploads/2019/07/gnome-shell-install_2-1024x455.png
[14]: https://fedoramagazine.org/wp-content/uploads/2019/07/gnome-shell-install_3.png
[15]: https://fedoramagazine.org/wp-content/uploads/2019/07/gnome-shell-install_4.png

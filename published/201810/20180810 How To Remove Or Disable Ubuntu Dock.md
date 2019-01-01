如何移除或禁用 Ubuntu Dock
======

![](https://1.bp.blogspot.com/-pClnjEJfPQc/W21nHNzU2DI/AAAAAAAABV0/HGXuQOYGzokyrGYQtRFeF_hT3_3BKHupQCLcBGAs/s640/ubuntu-dock.png)

> 如果你想用其它 dock（例如 Plank dock）或面板来替换 Ubuntu 18.04 中的 Dock，或者你想要移除或禁用 Ubuntu Dock，本文会告诉你如何做。

Ubuntu Dock - 屏幕左侧栏，可用于固定应用程序或访问已安装的应用程序。使用默认的 Ubuntu 会话时，[无法][1]使用 Gnome Tweaks 禁用它（禁用无效）。但是如果你需要，还是有几种方法来摆脱它的。下面我将列出 4 种方法可以移除或禁用 Ubuntu Dock，以及每个方法的缺点（如果有的话），还有如何撤销每个方法的更改。本文还包括在没有 Ubuntu Dock 的情况下访问<ruby>活动概览<rt>Activities Overview</rt></ruby>和已安装应用程序列表的其它方法。

### 如何在没有 Ubuntu Dock 的情况下访问活动概览

如果没有 Ubuntu Dock，你可能无法访问活动的或已安装的应用程序列表（可以通过单击 Dock 底部的“显示应用程序”按钮从 Ubuntu Dock 访问）。例如，如果你想使用 Plank Dock 就是这样。

显然，如果你安装了 Dash to Panel 扩展来替代 Ubuntu Dock，那么还好。因为 Dash to Panel 提供了一个按钮来访问活动概览或已安装的应用程序。

根据你计划用来替代 Ubuntu Dock 的软件，如果无法访问活动概览，那么你可以启用“活动概览热角”选项，只需将鼠标移动到屏幕的左上角即可打开活动概览。访问已安装的应用程序列表的另一种方法是使用快捷键：`Super + A`。

如果要启用“活动概览热角”，使用以下命令：

```
gsettings set org.gnome.shell enable-hot-corners true
```

如果以后要撤销此操作并禁用该热角，那么你需要使用以下命令：

```
gsettings set org.gnome.shell enable-hot-corners false
```

你可以使用 Gnome Tweaks 应用程序（该选项位于 Gnome Tweaks 的 “Top Bar” 部分）启用或禁用“活动概览热角” 选项，可以使用以下命令进行安装它：

```
sudo apt install gnome-tweaks
```

### 如何移除或禁用 Ubuntu Dock

下面你将找到 4 种摆脱 Ubuntu Dock 的方法，环境在 Ubuntu 18.04 下。

#### 方法 1: 移除 Gnome Shell Ubuntu Dock 包

摆脱 Ubuntu Dock 的最简单方法就是删除包。

这将会从你的系统中完全移除 Ubuntu Dock 扩展，但同时也移除了 `ubuntu-desktop` 元数据包。如果你移除 `ubuntu-desktop` 元数据包，不会马上出现问题，因为它本身没有任何作用。`ubuntu-desktop ` 元数据包依赖于组成 Ubuntu 桌面的大量包。它的依赖关系不会被删除，也不会被破坏。问题是如果你以后想升级到新的 Ubuntu 版本，那么将不会安装任何新的 `ubuntu-desktop` 依赖项。

为了解决这个问题，你可以在升级到较新的 Ubuntu 版本之前安装 `ubuntu-desktop` 元数据包（例如，如果你想从 Ubuntu 18.04 升级到 18.10）。

如果你对此没有意见，并且想要从系统中删除 Ubuntu Dock 扩展包，使用以下命令：

```
sudo apt remove gnome-shell-extension-ubuntu-dock
```

如果以后要撤消更改，只需使用以下命令安装扩展：

```
sudo apt install gnome-shell-extension-ubuntu-dock
```

或者重新安装 `ubuntu-desktop` 元数据包（这将会安装你可能已删除的任何 `ubuntu-desktop` 依赖项，包括 Ubuntu Dock），你可以使用以下命令：

```
sudo apt install ubuntu-desktop
```

#### 方法 2：安装并使用 vanilla Gnome 会话而不是默认的 Ubuntu 会话

摆脱 Ubuntu Dock 的另一种方法是安装和使用原生 Gnome 会话。安装 原生 Gnome 会话还将安装此会话所依赖的其它软件包，如 Gnome 文档、地图、音乐、联系人、照片、跟踪器等。

通过安装原生 Gnome 会话，你还将获得默认 Gnome GDM 登录和锁定屏幕主题，而不是 Ubuntu 默认的 Adwaita Gtk 主题和图标。你可以使用 Gnome Tweaks 应用程序轻松更改 Gtk 和图标主题。

此外，默认情况下将禁用 AppIndicators 扩展（因此使用 AppIndicators 托盘的应用程序不会显示在顶部面板上），但你可以使用 Gnome Tweaks 启用此功能（在扩展中，启用 Ubuntu appindicators 扩展）。

同样，你也可以从原生 Gnome 会话启用或禁用 Ubuntu Dock，这在 Ubuntu 会话中是不可能的（使用 Ubuntu 会话时无法从 Gnome Tweaks 禁用 Ubuntu Dock）。

如果你不想安装原生 Gnome 会话所需的这些额外软件包，那么这个移除 Ubuntu Dock 的这个方法不适合你，请查看其它方法。

如果你对此没有意见，以下是你需要做的事情。要在 Ubuntu 中安装原生的 Gnome 会话，使用以下命令：

```
sudo apt install vanilla-gnome-desktop
```

安装完成后，重启系统。在登录屏幕上，单击用户名，单击 “Sign in” 按钮旁边的齿轮图标，然后选择 “GNOME” 而不是 “Ubuntu”，之后继续登录。

![](https://4.bp.blogspot.com/-mc-6H2MZ0VY/W21i_PIJ3pI/AAAAAAAABVo/96UvmRM1QJsbS2so1K8teMhsu7SdYh9zwCLcBGAs/s640/vanilla-gnome-session-ubuntu-login-screen.png)

如果要撤销此操作并移除原生 Gnome 会话，可以使用以下命令清除原生 Gnome 软件包，然后删除它安装的依赖项（第二条命令）：

```
sudo apt purge vanilla-gnome-desktop
sudo apt autoremove
```

然后重新启动，并以相同的方式从 GDM 登录屏幕中选择 Ubuntu。

#### 方法 3：从桌面上永久隐藏 Ubuntu Dock，而不是将其移除

如果你希望永久隐藏 Ubuntu Dock，不让它显示在桌面上，但不移除它或使用原生 Gnome 会话，你可以使用 Dconf 编辑器轻松完成此操作。这样做的缺点是 Ubuntu Dock 仍然会使用一些系统资源，即使你没有在桌面上使用它，但你也可以轻松恢复它而无需安装或移除任何包。

Ubuntu Dock 只对你的桌面隐藏，当你进入叠加模式（活动）时，你仍然可以看到并从那里使用 Ubuntu Dock。

要永久隐藏 Ubuntu Dock，使用 Dconf 编辑器导航到 `/org/gnome/shell/extensions/dash-to-dock` 并禁用以下选项（将它们设置为 `false`）：`autohide`、`dock-fixed` 和 `intellihide`。

如果你愿意，可以从命令行实现此目的，运行以下命令：

```
gsettings set org.gnome.shell.extensions.dash-to-dock autohide false
gsettings set org.gnome.shell.extensions.dash-to-dock dock-fixed false
gsettings set org.gnome.shell.extensions.dash-to-dock intellihide false
```

如果你改变主意了并想撤销此操作，你可以使用 Dconf 编辑器从 `/org/gnome/shell/extensions/dash-to-dock` 中启动 `autohide`、 `dock-fixed` 和 `intellihide`（将它们设置为 `true`），或者你可以使用以下这些命令：

```
gsettings set org.gnome.shell.extensions.dash-to-dock autohide true
gsettings set org.gnome.shell.extensions.dash-to-dock dock-fixed true
gsettings set org.gnome.shell.extensions.dash-to-dock intellihide true
```

#### 方法 4：使用 Dash to Panel 扩展

[Dash to Panel][2] 是 Gnome Shell 的一个高度可配置面板，是 Ubuntu Dock 或 Dash to Dock 的一个很好的替代品（Ubuntu Dock 是从 Dash to Dock 分叉而来的）。安装和启动 Dash to Panel 扩展会禁用 Ubuntu Dock，因此你无需执行其它任何操作。

你可以从 [extensions.gnome.org][3] 来安装 Dash to Panel。

如果你改变主意并希望重新使用 Ubuntu Dock，那么你可以使用 Gnome Tweaks 应用程序禁用 Dash to Panel，或者通过单击以下网址旁边的 X 按钮完全移除 Dash to Panel:  https://extensions.gnome.org/local/ 。

--------------------------------------------------------------------------------

via: https://www.linuxuprising.com/2018/08/how-to-remove-or-disable-ubuntu-dock.html

作者：[Logix][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[MjSeven](https://github.com/MjSeven)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://plus.google.com/118280394805678839070
[1]:https://bugs.launchpad.net/ubuntu/+source/gnome-tweak-tool/+bug/1713020
[2]:https://www.linuxuprising.com/2018/05/gnome-shell-dash-to-panel-v14-brings.html
[3]:https://extensions.gnome.org/extension/1160/dash-to-panel/

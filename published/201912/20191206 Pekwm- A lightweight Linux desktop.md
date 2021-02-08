[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11670-1.html)
[#]: subject: (Pekwm: A lightweight Linux desktop)
[#]: via: (https://opensource.com/article/19/12/pekwm-linux-desktop)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

Pekwm：一个轻量级的 Linux 桌面
======

> 本文是 24 天 Linux 桌面特别系列的一部分。如果你是一个觉得传统桌面会妨碍你的极简主义者，那么试试 Pekwm Linux 桌面。

![](https://img.linux.net.cn/data/attachment/album/201912/13/133626l5t2z2awjstu9zbe.png)

假设你想要一个轻量级桌面环境，它只需要能在屏幕上显示图形、四处移动窗口，而别无杂物。你会发现传统桌面的通知、任务栏和系统托盘会妨碍你的工作。你想主要通过终端工作，但也希望运行图形应用。如果听起来像是你的想法，那么 [Pekwm][2] 可能是你一直在寻找的东西。

Pekwm 的灵感大概来自于 Window Maker 和 Fluxbox 等。它提供了一个应用菜单、窗口装饰、而不是一大堆其他东西。它非常适合极简主义者，即那些希望节省资源的用户和喜欢在终端工作的用户。

从发行版仓库安装 Pekwm。安装后，请先退出当前桌面会话，以便可以登录到新桌面。默认情况下，会话管理器（KDM、GDM、LightDM 或 XDM，具体取决于你的设置）将继续登录到以前的桌面，因此需要在登录之前修改它。

在 GDM 中覆盖之前的桌面：

![Selecting your desktop in GDM][3]

在 KDM 中：

![Selecting your desktop in KDM][4]

第一次登录 Pekwm 时，你可能会看到黑屏。可能难以置信，但这是正常的。你看到的是一个空白桌面，没有背景壁纸。你可以使用 `feh` 命令设置壁纸（你可能需要从仓库中安装它）。此命令有几个用于设置背景的选项，包括 `--bg-fill` 用壁纸填充屏幕，`--bg-scale` 缩放到合适大小，等等。

```
$ feh --bg-fill ~/Pictures/wallpapers/mybackground.jpg
```

### 应用菜单

默认情况下，Pekwm 自动生成一个菜单，可在桌面上的任意位置右键单击，从而可让你运行应用。此菜单还提供一些首选项设置，例如选择主题和注销 Pekwm 会话。

![Pekwm running on Fedora][5]

### 配置

Pekwm 主要通过保存在 `$HOME/.pekwm` 下的文本配置文件来配置。`menu` 文件定义你的应用菜单，`keys` 文件定义键盘快捷键，等等。

`start` 文件是在 Pekwm 启动后执行的 shell 脚本。它类似于传统 Unix 系统上的 `rc.local`。它故意放在最后执行的，因此这里的东西将覆盖之前的一切。这是一个重要文件，它可能是你要设置背景的地方，以便*你的*选择会覆盖正在使用的主题的默认值。

`start` 文件也是可以启动 dockapp 的地方。dockapp 是一种小程序，它在 Window Maker 和 Fluxbox 引起了人们的关注。它们通常有网络监视器、时钟、音频设置，和其它你可能会在系统托盘或作为一个 KDE plasmoid 或者完整桌面环境中看到的小部件。你可能会在发行版仓库中找到一些 dockapp，或者可以在 [dockapps.net][6] 上在线查找它们。

你可以在启动时运行 dockapp，将它们列在 `start` 文件中，跟上 `&` 符号：


```
feh --bg-fill ~/Pictures/wallpapers/mybackground.jpg
wmnd &amp;
bubblemon -d &amp;
```

`start` 文件必须[设置为可执行][7]，才能在 Pekwm 启动时运行。

```
$ chmod +x $HOME/.pekwm/start
```

### 功能

Pekwm 的功能不多，但这就是它的美。如果你希望在桌面上运行额外的服务，那么由你来启动这些服务。如果你仍在学习 Linux，这是了解那些与完整的桌面环境捆绑在一起时通常不会注意到的微小 GUI 组件的好方法（像是[任务栏][8]）。这也习惯一些 Linux 命令（例如 [nmcli][9]）的好方法。

Pekwm 是一个有趣的窗口管理器。它分散、简洁、轻巧。请试试看！

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/12/pekwm-linux-desktop

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/linux_penguin_green.png?itok=ENdVzW22 (Penguin with green background)
[2]: http://www.pekwm.org/
[3]: https://opensource.com/sites/default/files/uploads/advent-gdm_1.jpg (Selecting your desktop in GDM)
[4]: https://opensource.com/sites/default/files/uploads/advent-enlightenment-kdm_0.jpg (Selecting your desktop in KDM)
[5]: https://opensource.com/sites/default/files/uploads/advent-pekwm.jpg (Pekwm running on Fedora)
[6]: http://dockapps.net
[7]: https://opensource.com/article/19/6/understanding-linux-permissions
[8]: https://opensource.com/article/19/1/productivity-tool-tint2
[9]: https://opensource.com/article/19/5/set-static-network-connection-linux

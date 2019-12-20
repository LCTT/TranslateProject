[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11698-1.html)
[#]: subject: (How to configure Openbox for your Linux desktop)
[#]: via: (https://opensource.com/article/19/12/openbox-linux-desktop)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

如何为 Linux 桌面配置 Openbox
======

> 本文是 24 天 Linux 桌面特别系列的一部分。Openbox 窗口管理器占用很小的系统资源、易于配置、使用愉快。

![](https://img.linux.net.cn/data/attachment/album/201912/20/102327hdl3gcychsc53y3m.jpg)

你可能不知道你使用过 [Openbox][2] 桌面：尽管 Openbox 本身是一个出色的窗口管理器，但它还是 LXDE 和 LXQT 等桌面环境的窗口管理器“引擎”，它甚至可以管理 KDE 和 GNOME。除了作为多个桌面的基础之外，Openbox 可以说是最简单的窗口管理器之一，可以为那些不想学习那么多配置选项的人配置。通过使用基于菜单的 obconf 的配置应用，可以像在 GNOME 或 KDE 这样的完整桌面中一样轻松地设置所有常用首选项。

### 安装 Openbox

你可能会在 Linux 发行版的软件仓库中找到 Openbox，也可以在 [Openbox.org][3] 中找到它。如果你已经在运行其他桌面，那么可以安全地在同一系统上安装 Openbox，因为 Openbox 除了几个配置面板之外，不包括任何捆绑的应用。

安装后，退出当前桌面会话，以便你可以登录 Openbox 桌面。默认情况下，会话管理器（KDM、GDM、LightDM 或 XDM，这取决于你的设置）将继续登录到以前的桌面，因此你必须在登录之前覆盖该选择。

要使用 GDM 覆盖它：

![Select your desktop session in GDM][4]

要使用 SDDM 覆盖它：

![Select your desktop session with KDM][5]

### 配置 Openbox 桌面

默认情况下，Openbox 包含 obconf 应用，你可以使用它来选择和安装主题、修改鼠标行为、设置桌面首选项等。你可能会在仓库中发现其他配置应用，如 obmenu，用于配置窗口管理器的其他部分。

![Openbox Obconf configuration application][6]

构建你自己的桌面环境相对容易。它有一些所有常见的桌面组件，例如系统托盘 [stalonetray][7]、任务栏 [Tint2][8] 或 [Xfce4-panel][9] 等几乎你能想到的。任意组合应用，直到拥有梦想的开源桌面为止。

![Openbox][10]

### 为何使用 Openbox

Openbox 占用的系统资源很小、易于配置、使用起来很愉悦。它基本不会让你感觉到阻碍，会是一个容易熟悉的系统。你永远不会知道你面前的桌面环境秘密使用了 Openbox 作为窗口管理器（知道如何自定义它会不会很高兴？）。如果开源吸引你，那么试试看 Openbox。

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/12/openbox-linux-desktop

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/osdc_general_openfield.png?itok=MeVN97oy (open with sky and grass)
[2]: http://openbox.org
[3]: http://openbox.org/wiki/Openbox:Download
[4]: https://opensource.com/sites/default/files/advent-gdm_0.jpg (Select your desktop session in GDM)
[5]: https://opensource.com/sites/default/files/advent-kdm.jpg (Select your desktop session with KDM)
[6]: https://opensource.com/sites/default/files/uploads/advent-openbox-obconf_675px.jpg (Openbox Obconf configuration application)
[7]: https://sourceforge.net/projects/stalonetray/
[8]: https://opensource.com/article/19/1/productivity-tool-tint2
[9]: http://xfce.org
[10]: https://opensource.com/sites/default/files/uploads/advent-openbox_675px.jpg (Openbox)

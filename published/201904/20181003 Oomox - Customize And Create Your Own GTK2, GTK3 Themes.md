[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10683-1.html)
[#]: subject: (Oomox – Customize And Create Your Own GTK2, GTK3 Themes)
[#]: via: (https://www.ostechnix.com/oomox-customize-and-create-your-own-gtk2-gtk3-themes/)
[#]: author: (EDITOR https://www.ostechnix.com/author/editor/)

Oomox：定制和创建你自己的 GTK2、GTK3 主题
======

![](https://www.ostechnix.com/wp-content/uploads/2018/10/Oomox-720x340.png)

主题和可视化定制是 Linux 的主要优势之一。由于所有代码都是开源的，因此你可以比 Windows/Mac OS 更大程度上地改变 Linux 系统的外观和行为方式。GTK 主题可能是人们定制 Linux 桌面的最流行方式。GTK 工具包被各种桌面环境使用，如 Gnome、Cinnamon、Unity、XFC E和 budgie。这意味着为 GTK 制作的单个主题只需很少的修改就能应用于任何这些桌面环境。

有很多非常高品质的流行 GTK 主题，例如 **Arc**、**Numix** 和 **Adapta**。但是如果你想自定义这些主题并创建自己的视觉设计，你可以使用 **Oomox**。

Oomox 是一个图形应用，可以完全使用自己的颜色、图标和终端风格自定义和创建自己的 GTK 主题。它自带几个预设，你可以在 Numix、Arc 或 Materia 主题样式上创建自己的 GTK 主题。

### 安装 Oomox

在 Arch Linux 及其衍生版中：

Oomox 可以在 [AUR][1] 中找到，所以你可以使用任何 AUR 助手程序安装它，如 [yay][2]。

```
$ yay -S oomox
```

在 Debian/Ubuntu/Linux Mint 中，在[这里][3]下载 `oomox.deb` 包并按如下所示进行安装。在写本指南时，最新版本为 `oomox_1.7.0.5.deb`。

```
$ sudo dpkg -i oomox_1.7.0.5.deb
$ sudo apt install -f
```

在 Fedora 上，Oomox 可以在第三方 **COPR** 仓库中找到。

```
$ sudo dnf copr enable tcg/themes
$ sudo dnf install oomox
```

Oomox 也有 [Flatpak 应用][4]。确保已按照[本指南][5]中的说明安装了 Flatpak。然后，使用以下命令安装并运行 Oomox：

```
$ flatpak install flathub com.github.themix_project.Oomox
$ flatpak run com.github.themix_project.Oomox
```

对于其他 Linux 发行版，请进入 Github 上的 Oomox 项目页面（本指南末尾给出链接），并从源代码手动编译和安装。

### 自定义并创建自己的 GTK2、GTK3 主题

#### 主题定制

![](https://www.ostechnix.com/wp-content/uploads/2018/10/Oomox-1-1.png)

你可以更改几乎每个 UI 元素的颜色，例如：

1. 标题
2. 按钮
3. 标题内的按钮
4. 菜单
5. 选定的文字

在左边，有许多预设主题，如汽车主题、现代主题，如 Materia 和 Numix，以及复古主题。在窗口的顶部，有一个名为**主题样式**的选项，可让你设置主题的整体视觉样式。你可以在 Numix、Arc 和 Materia 之间进行选择。

使用某些像 Numix 这样的样式，你甚至可以更改标题渐变，边框宽度和面板透明度等内容。你还可以为主题添加黑暗模式，该模式将从默认主题自动创建。

![](https://www.ostechnix.com/wp-content/uploads/2018/10/Oomox-2.png)

#### 图标集定制

你可以自定义用于主题图标的图标集。有两个选项：Gnome Colors 和 Archdroid。你可以更改图标集的基础和笔触颜色。

#### 终端定制

你还可以自定义终端颜色。该应用有几个预设，但你可以为每个颜色，如红色，绿色，黑色等自定义确切的颜色代码。你还可以自动交换前景色和背景色。

#### Spotify 主题

这个应用的一个独特功能是你可以根据喜好定义 spotify 主题。你可以更改 spotify 的前景色、背景色和强调色来匹配整体的 GTK 主题。

然后，只需按下“应用 Spotify 主题”按钮，你就会看到这个窗口：

![](https://www.ostechnix.com/wp-content/uploads/2018/10/Oomox-3.png)

点击应用即可。

#### 导出主题

根据自己的喜好自定义主题后，可以通过单击左上角的重命名按钮重命名主题：

![](https://www.ostechnix.com/wp-content/uploads/2018/10/Oomox-4.png)

然后，只需点击“导出主题”将主题导出到你的系统。

![](https://www.ostechnix.com/wp-content/uploads/2018/10/Oomox-5.png)

你也可以只导出图标集或终端主题。

之后你可以打开桌面环境中的任何可视化自定义应用，例如基于 Gnome 桌面的 Tweaks，或者 “XFCE 外观设置”。选择你导出的 GTK 或者 shell 主题。

### 总结

如果你是一个 Linux 主题迷，并且你确切知道系统中的每个按钮、每个标题应该怎样，Oomox 值得一试。 对于极致的定制者，它可以让你几乎更改系统外观的所有内容。对于那些只想稍微调整现有主题的人来说，它有很多很多预设，所以你可以毫不费力地得到你想要的东西。

你试过吗？ 你对 Oomox 有什么看法？ 请在下面留言！

### 资源

- [Oomox GitHub 仓库](https://github.com/themix-project/oomox)

--------------------------------------------------------------------------------

via: https://www.ostechnix.com/oomox-customize-and-create-your-own-gtk2-gtk3-themes/

作者：[EDITOR][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.ostechnix.com/author/editor/
[1]: https://aur.archlinux.org/packages/oomox/
[2]: https://www.ostechnix.com/yay-found-yet-another-reliable-aur-helper/
[3]: https://github.com/themix-project/oomox/releases
[4]: https://flathub.org/apps/details/com.github.themix_project.Oomox
[5]: https://www.ostechnix.com/flatpak-new-framework-desktop-applications-linux/

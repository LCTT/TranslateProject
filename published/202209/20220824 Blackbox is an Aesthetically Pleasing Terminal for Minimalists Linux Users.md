[#]: subject: "Blackbox is an Aesthetically Pleasing Terminal for Minimalists Linux Users"
[#]: via: "https://itsfoss.com/blackbox-terminal/"
[#]: author: "Anuj Sharma https://itsfoss.com/author/anuj/"
[#]: collector: "lkxed"
[#]: translator: "geekpi"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14992-1.html"

Blackbox：极简主义 Linux 用户的美观终端
======

![](https://img.linux.net.cn/data/attachment/album/202209/01/230823b2n8vhe6jn5vz5uq.jpg)

有 [许多可用于 Linux 的终端仿真器][1]。从 Terminator 到 Tilix，你有多种终端可供选择。

但这并没有阻止新终端应用的到来。你最近已经见过了 [GNOME Console][2] 吧，今天，我将向你介绍 Blackbox。

### Blackbox 终端：概述和功能

Blackbox 是一个支持 GTK4 的终端仿真器。开发者为了他可以在 Linux 上使用外观优美的终端应用而创建了这个项目。

所以，不要指望它有很多功能。它只是一个使用 GTK4 工具包并支持主题的终端仿真器。

换句话说，它更多注重的是关于外观而不是功能。

以下是 Blackbox 的主要亮点：

* 可设置主题（支持 [Tilix][3] 兼容的配色方案）
* 主题与窗口装饰的融合
* 自定义字体
* 各种可自定义的 UI 设置
* 标签
* 可切换的标题栏
* 点击打开链接
* 文件拖放支持

谈到外观，让我们来看看它提供的不同外观。默认窗口将类似于下面的截图。

![Default look of Blackbox terminal][4]

#### 没有标题栏

你也可以取消标题栏，如下所示。这是 GTK4 应用程序中最“流行”的功能之一。

![Blackbox without header bar][5]

你还可以在无标题栏模式下启用浮动控件。

![Floating controls with no header bar mode][6]

#### 轻松复制和粘贴（不要抗拒）

`Ctrl+C` 和 `Ctrl+V` 就像复制粘贴的通用键盘快捷键。

但是古老的 Unix 在宇宙之前就存在了，因此它使用 [Ctrl+C 键来终止终端中正在运行的程序][7]。

但是，有些人发现不能使用他们最喜欢的快捷键来 [在终端中复制粘贴][8] 有点不方便。

Blackbox 允许你通过启用“轻松复制和粘贴”设置来更改它。启用此设置后，你可以使用 `Ctrl+C` 和 `Ctrl+v` 进行复制粘贴操作。

不用担心。`Ctrl+C` 仍可用于停止正在运行的命令。

![Easy copy-paste mode allows using Ctrl+C and Ctrl+V keys][9]

#### 主题

你还可以从设置中选择不同的主题。有几个浅色和深色主题可供选择。你还可以使用 Tilix 风格的主题。

![Available themes for Blackbox][10]

让我们看看它在 Yaru 主题和不扩展选项卡的情况下的外观，这与默认的 Blackbox 行为不同。

![Blackbox with a changed theme][11]

#### 重置为默认

还有一些更方便的功能，例如记住窗口大小、按像素滚动等。

好消息是，如果你对设置进行了太多更改，你可以将它们全部还原并重置为默认设置。

该选项在“<ruby>首选项<rt>Preferences</rt></ruby>”的“<ruby>高级<rt>Advance</rt></ruby>”选项卡中可用。

![reset blackbox settings to default][12]

### 安装 Blackbox 终端

请记住，**Blackbox 处于开发的早期阶段**。我在切换主题时出现过崩溃。

要安装 Blackbox 终端，你应该在系统中安装 [Flatpak 并启用 Flathub 仓库][13]。

使用此命令在你的系统上安装 Blackbox：

```
flatpak install flathub com.raggesilver.BlackBox
```

在 Fedora 和其他一些与 Flatpak 集成的发行版上，你可以从软件中心安装 Blackbox。

![Blackbox can also be installed in GNOME Software Center][14]

安装后，你可以从应用菜单启动它。

#### 卸载 Blackbox 终端

如果你不喜欢 Blackbox 并想将其删除，请输入以下命令将其删除。

```
flatpak uninstall flathub com.raggesilver.BlackBox
```

### 结论

在我看来，Blackbox 是一个不错的终端模拟器。在不支持 GTK4 的发行版上，你可以获得 GTK4 所能提供的所有精彩内容。它提供的功能足以应付日常工作。

最后，这一切都取决于个人喜好。你可能会喜欢它，也可能不喜欢它。如果你喜欢体验，请尝试一下，并在评论栏与我们分享你的经验。

--------------------------------------------------------------------------------

via: https://itsfoss.com/blackbox-terminal/

作者：[Anuj Sharma][a]
选题：[lkxed][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/anuj/
[b]: https://github.com/lkxed
[1]: https://itsfoss.com/linux-terminal-emulators/
[2]: https://itsfoss.com/gnome-console/
[3]: https://github.com/gnunn1/tilix
[4]: https://itsfoss.com/wp-content/uploads/2022/08/blackbox-default.png
[5]: https://itsfoss.com/wp-content/uploads/2022/08/blackbox-noheader.png
[6]: https://itsfoss.com/wp-content/uploads/2022/08/blackbox-floating-controls.png
[7]: https://itsfoss.com/stop-program-linux-terminal/
[8]: https://itsfoss.com/copy-paste-linux-terminal/
[9]: https://itsfoss.com/wp-content/uploads/2022/08/blackbox-easy-copy-paste.png
[10]: https://itsfoss.com/wp-content/uploads/2022/08/blackbox-theme-selection.png
[11]: https://itsfoss.com/wp-content/uploads/2022/08/blackbox-yaru.png
[12]: https://itsfoss.com/wp-content/uploads/2022/08/blackbox-reset.png
[13]: https://itsfoss.com/flatpak-guide/
[14]: https://itsfoss.com/wp-content/uploads/2022/08/blackbox-install.png

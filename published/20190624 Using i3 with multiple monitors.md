[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11031-1.html)
[#]: subject: (Using i3 with multiple monitors)
[#]: via: (https://fedoramagazine.org/using-i3-with-multiple-monitors/)
[#]: author: (Adam Šamalík https://fedoramagazine.org/author/asamalik/)

将 i3 与多个显示器配合使用
======

![][1]

你在 Linux 工作站上使用多个显示器吗？一次看到很多东西可能是有益的。但在我们的工作中通常有比实际显示器更多的窗口 —— 这是一件好事，因为一次看到太多东西可能会分散注意力。因此能够切换我们在单个显示器上看到的内容似乎很重要。

让我们来看看 i3，它是一个流行的平铺窗口管理器，可以与多个显示器配合使用。并且有许多其他窗口管理器没有的便利功能，它能够独立地在各个显示器上切换工作区。

### 快速介绍 i3

大约三年前，[Fedora Magazine 已经写了一篇关于 i3 的文章][2]。这是有史以来最受欢迎的文章之一！虽然情况并非总是如此，但 i3 非常稳定，而且那篇文章如今也很准确。所以，这次不会重复太多内容，本篇只涵盖了让 i3 启动和运行的极少内容，如果你是 i3 的新手，想要了解更多基础知识的话，欢迎你继续阅读。

要在系统上安装 i3，请运行以下命令：

```
$ sudo dnf install i3
```

完成后，注销，然后在登录屏幕上选择 i3 作为窗口管理器，然后重新登录。

当你第一次运行 i3 时，系统会询问你是否要继续进行自动配置 —— 在此处回答是。之后，你将被要求选择 “mod 键”。如果你不确定，只需接受默认值，即将 Windows/Super 键设置为 mod 键。你将主要使用此键用于窗口管理器中的快捷方式。

此时，你应该在底部看到一个小条和一个空白屏幕。我们来看看一些基本的快捷方式。

打开终端：

```
$mod + enter
```

切换到第二个工作区：

```
$mod + 2
```

通过以下两个步骤打开 firefox，首先：

```
$mod + d
```

然后输入 “firefox” 并按回车键。

将其移动到第一个工作区：

```
$mod + shift + 1
```

切换到第一个工作区：

```
$mod + 1
```

此时，你将并排看到一个终端和一个 firefox 窗口。要关闭窗口，请按：

```
$mod + shift + q
```

还有更多的快捷方式，但这些足够让你开始使用 i3。

要退出 i3（并退出登录）按：

```
$mod + shift + e
```

然后在右上角使用鼠标确认。

### 同时让多个屏幕工作

现在我们已经启动并运行了 i3，让我们把所有这些屏幕都用到！

为此，我们需要使用命令行，因为 i3 非常轻量级，并且没有 GUI 来管理其他屏幕。如果这听起来很难也不用担心，它实际上非常简单！

我们将使用的命令称为 `xrandr`。如果你的系统上没有 `xrandr`，请运行以下命令安装：

```
$ sudo dnf install xrandr
```

当它安装完毕后，让我们继续运行它：

```
$ xrandr
```

输出列出了所有可用输出设备，并通过显示支持的分辨率指示哪些输出连接了屏幕（通过电缆连接的显示器）。好消息是，我们不需要关心使它们工作的分辨率。

这个例子显示了笔记本电脑的主屏幕（名为 eDP1），以及连接到 HDMI-2 输出的第二个显示器，它位于笔记本电脑的右侧。要打开它，请运行以下命令：

```
$ xrandr --output HDMI-2 --auto --right-of eDP1
```

就是这样！你的屏幕现已激活。

![第二个屏幕激活。截屏上显示命令与文章中略有不同，它设置了更小的分辨率以使截屏适合阅读][3]

### 在多个屏幕上管理工作区

在多个屏幕上切换工作区和创建新工作区非常类似于只有一个屏幕的情况。新工作区会在当前处于活动状态（鼠标光标所在位置）的屏幕上创建。

因此，要切换到特定工作区（或在不存在的情况下创建新工作区），请按：

```
$mod + NUMBER
```

你可以独立切换各个显示器上的工作区！

![工作空间 2 在左侧屏幕，工作空间 4 在右侧屏幕][4]

![左侧屏幕切换为工作空间 3，右侧屏幕仍为工作空间 4][5]

![右侧屏幕切换为工作空间 5，左侧屏幕仍为空间空间 3][6]

### 在显示器之间移动工作区

我们可以通过以下命令将窗口移动到不同的工作区：

```
$mod + shift + NUMBER
```

我们也可以将工作区移动到不同的屏幕。但是，此操作没有默认快捷方式，因此我们必须先创建它。

要创建自定义快捷方式，你需要在你选择的文本编辑器中打开配置文件（本文使用 `vim`）：

```
$ vim ~/.config/i3/config
```

并将以下行添加到配置文件的最底部：

```
# Moving workspaces between screens
bindsym $mod+p move workspace to output right
```

保存、关闭并重新加载以使配置生效，按下：

```
$mod + shift + r
```

现在你可以将活跃的工作区移动到第二个显示器：

```
$mod + p
```

![打开火狐浏览器的工作空间 2 在左侧][7]

![打开火狐浏览器的工作空间 2 移动到第二个屏幕][8]

就是这些了！享受你的新多显示器体验，并了解更多 i3，欢迎阅读 Fedora Magazine 上之前关于 i3 的文章，或者查看官方 i3 文档。

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/using-i3-with-multiple-monitors/

作者：[Adam Šamalík][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/asamalik/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2019/06/i3-title-816x345.jpg
[2]: https://fedoramagazine.org/getting-started-i3-window-manager/
[3]: https://fedoramagazine.org/wp-content/uploads/2019/06/0-1-1024x384.png
[4]: https://fedoramagazine.org/wp-content/uploads/2019/06/1-1-1024x384.png
[5]: https://fedoramagazine.org/wp-content/uploads/2019/06/1-2-1024x384.png
[6]: https://fedoramagazine.org/wp-content/uploads/2019/06/1-3-1024x384.png
[7]: https://fedoramagazine.org/wp-content/uploads/2019/06/2-1-1024x384.png
[8]: https://fedoramagazine.org/wp-content/uploads/2019/06/2-2-1024x384.png

[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10544-1.html)
[#]: subject: (4 Unique Terminal Emulators for Linux)
[#]: via: (https://www.linux.com/blog/learn/2018/12/4-unique-terminals-linux)
[#]: author: (Jack Wallen https://www.linux.com/users/jlwallen)

4 个独特的 Linux 终端模拟器
======

> 这四个不同的终端模拟器 —— 不仅可以完成工作，还可以增加一些乐趣。

![](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/terminals_main.jpg?itok=e6av-5VO)

让我们面对现实，如果你是 Linux 管理员，那么你要用命令行来工作。为此，你将使用终端模拟器（LCTT 译注：常简称为“终端”，与终端本身的原意不同）。最有可能的是，你选择的发行版预先安装了一个可以完成工作的默认终端模拟器。但这是有很多选择可供选择的 Linux，所以这种思想自然也适用于终端模拟器。实际上，如果你打开发行版的图形界面的包管理器（或从命令行搜索），你将找到大量可能的选择。其中许多是非常简单的工具；然而，有些是真正独特的。

在本文中，我将重点介绍四个这样的终端模拟器，它们不仅可以完成工作，而且可以使工作变得更有趣或更好玩。那么，让我们来看看这些终端。

### Tilda

[Tilda][1] 是为 Gtk 设计的，是一种酷炫的下拉终端。这意味着该终端始终运行在后台，可以随时从显示器顶部拉下来（就像 Guake 和 Yakuake）。让 Tilda 超越许多其他产品的原因是该终端可用的配置选项数量（图 1）。

![](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/terminals_1.jpg?itok=bra6qb6X)

可以从标准的软件库安装 Tilda。在基于 Ubuntu（或 Debian）的发行版上，安装非常简单：

```
sudo apt-get install tilda -y
```

安装完成后，从桌面菜单中打开 Tilda，这也将打开其配置窗口。根据你的喜好配置应用程序，然后关闭配置窗口。然后，你可以通过点击 `F1` 热键来打开和关闭 Tilda。对使用 Tilda 的一个警告是，在第一次运行后，你将找不到有关如何打开配置向导的任何提示。别担心。只要运行命令 `tilda -C`，它将打开配置窗口，同时仍会保留你之前设置的选项。

可用选项包括：

* 终端大小和位置
* 字体和颜色配置
* 自动隐藏
* 标题
* 自定义命令
* URL 处理
* 透明度
* 动画
* 滚动
* 等等

我喜欢这些类型的终端是因为当你不需要时它们很容易就会消失，只需按一下按钮即可。对于那些不断进出于终端的人来说，像 Tilda 这样的工具是理想的选择。

### Aterm

Aterm 在我心中占有特殊的位置，因为它是我第一次使用的终端之一，它让我意识到 Linux 的灵活性。 这要回到 AfterStep 成为我选择的窗口管理器时（没用了太久），而且那时我是命令行新手。Aterm 提供的是一个高度可定制的终端仿真器，同时帮助我了解了使用终端的细节（如何给命令添加选项和开关）。或许你会问：“你觉得怎么样？”。因为 Aterm 从未有过用于定制选项的图形界面。要使用任何特殊选项运行 Aterm，必须以命令选项的方式运行。例如，假设你要启用透明度、绿色文本、白色高亮和无滚动条。为此，请运行以下命令：

```
aterm -tr -fg green -bg white +xb
```

最终结果（`top` 命令运行用于说明）看起来如图 2 所示。

![Aterm][3]

*图 2：使用了一些定制选项的 Aterm*

当然，你必须先安装 Aterm。幸运的是，这个应用程序仍然可以在标准软件库中找到，因此在 Ubuntu 上安装就像下面这样简单：

```
sudo apt-get install aterm -y
```

如果你想总是用这些选项打开 Aterm，最好的办法是在 `~/.bashrc` 文件中创建一个别名，如下所示：

```
alias=”aterm -tr -fg green -bg white +sb”
```

保存该文件，当你运行命令 `aterm` 时，它将始终打开这些选项。有关创建别名的更多信息，请查看[这个教程][5]。

### Eterm

Eterm 是第二个真正告诉我 Linux 命令行可以带来多少乐趣的终端。Eterm 是 Enlightenment 桌面的默认终端模拟器。当我最终从 AfterStep 迁移到 Enlightenment 时（那时早在 20 世纪初），我担心我会失去所有那些很酷的美学选择。结果并非如此。实际上，Eterm 提供了许多独特的选项，同时使用终端工具栏使任务变得更容易。使用 Eterm，你可以通过从 “Background > Pixmap” 菜单条目中轻松地从大量背景图像中选择一个背景（如果你需要一个的话，图 3）。

![Eterm][7]

*图 3：从大量的背景图中为 Eterm 选择一个。*

还有许多其他配置选项（例如字体大小、映射警报、切换滚动条、亮度、对比度和背景图像的透明度等）。 你要确定的一件事是，在你配置 Eterm 以满足你的口味后，需要单击 “Eterm > Save User Settings”（否则，关闭应用程序时所有设置都将丢失）。

可以从标准软件库安装 Eterm，其命令如下：

```
sudo apt-get install eterm
```

### Extraterm

[Extraterm][8] 应该可以赢得当今终端窗口项目最酷功能集的一些奖项。Extraterm 最独特的功能是能够以彩色框来包装命令（蓝色表示成功命令，红色表示失败命令。图 4）。

![Extraterm][10]

*图 4：Extraterm 显示有两个失败的命令框。*

在运行命令时，Extraterm 会将命令包装在一个单独的颜色框中。如果该命令成功，则该颜色框将以蓝色轮廓显示。如果命令失败，框将以红色标出。

无法通过标准软件库安装 Extraterm。事实上，在 Linux 上运行 Extraterm（目前）的唯一方法是从该项目的 GitHub 页面[下载预编译的二进制文件][11]，解压缩文件，切换到新创建的目录，然后运行命令 `./extraterm`。

当该应用程序运行后，要启用颜色框，你必须首先启用 Bash 集成功能。为此，请打开 Extraterm，然后右键单击窗口中的任意位置以显示弹出菜单。滚动，直到看到 “Inject Bash shell Integration” 的条目（图 5）。选择该条目，然后你可以开始使用这个颜色框选项。

![Extraterm][13]

*图 5：为 Extraterm 插入 Bash 集成。。*

如果你运行了一个命令，并且看不到颜色框，则可能必须为该命令创建一个新的颜色框（因为 Extraterm 仅附带一些默认颜色框）。为此，请单击 “Extraterm” 菜单按钮（窗口右上角的三条水平线），选择 “Settings”，然后单击 “Frames” 选项卡。在此窗口中，向下滚动并单击 “New Rule” 按钮。 然后，你可以添加要使用颜色框的命令（图 6）。

![frames][15]

*图 6：为颜色框添加新规则。*

如果在此之后仍然没有看到颜色框出现，请从[下载页面][11]下载 `extraterm-commands` 文件，解压缩该文件，切换到新创建的目录，然后运行命令 `sh setup_extraterm_bash.sh`。这应该可以为 Extraterm 启用颜色框。

还有更多可用于 Extraterm 的选项。我相信，一旦你开始在终端窗口上玩这个新花招，你就不会想回到标准终端了。希望开发人员可以尽快将这个应用程序提供给标准软件库（因为它很容易就可以成为最流行的终端窗口之一）。

### 更多

正如你可能预期的那样，Linux 有很多可用的终端。这四个代表四个独特的终端（至少对我来说），每个都可以帮助你运行 Linux 管理员需要运行的命令。如果你对其中一个不满意，用你的包管理器找找有什么可用的软件包。你一定会找到适合你的东西。

--------------------------------------------------------------------------------

via: https://www.linux.com/blog/learn/2018/12/4-unique-terminals-linux

作者：[Jack Wallen][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.linux.com/users/jlwallen
[b]: https://github.com/lujun9972
[1]: http://tilda.sourceforge.net/tildadoc.php
[2]: https://www.linux.com/files/images/terminals2jpg
[3]: https://www.linux.com/sites/lcom/files/styles/rendered_file/public/terminals_2.jpg?itok=gBkRLwDI (Aterm)
[4]: https://www.linux.com/licenses/category/used-permission
[5]: https://www.linux.com/blog/learn/2018/12/aliases-diy-shell-commands
[6]: https://www.linux.com/files/images/terminals3jpg
[7]: https://www.linux.com/sites/lcom/files/styles/rendered_file/public/terminals_3.jpg?itok=RVPTJAtK (Eterm)
[8]: http://extraterm.org
[9]: https://www.linux.com/files/images/terminals4jpg
[10]: https://www.linux.com/sites/lcom/files/styles/rendered_file/public/terminals_4.jpg?itok=2n01qdwO (Extraterm)
[11]: https://github.com/sedwards2009/extraterm/releases
[12]: https://www.linux.com/files/images/terminals5jpg
[13]: https://www.linux.com/sites/lcom/files/styles/rendered_file/public/terminals_5.jpg?itok=FdaE1Mpf (Extraterm)
[14]: https://www.linux.com/files/images/terminals6jpg
[15]: https://www.linux.com/sites/lcom/files/styles/rendered_file/public/terminals_6.jpg?itok=lQ1Zv5wq (frames)

[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12964-1.html)
[#]: subject: (How to use this KDE Plasma text editor)
[#]: via: (https://opensource.com/article/20/12/kwrite-kde-plasma)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

如何使用这个 KDE Plasma 文本编辑器？
======

> 作为流行的 KDE Plasma 桌面的一部分，KWrite 在一个简单易用的界面中隐藏了大量有用的功能。

![](https://img.linux.net.cn/data/attachment/album/202012/29/010557o53b649j66a1snjv.jpg)

KWrite 是一款适用于 KDE Plasma 桌面的文本编辑器。它的目的是成为一个通用的应用，任何人都可以在他们需要快速做笔记、写一篇学校论文、做一些编程，和/或任何其他你能想到的文本编辑器能做的事时用上它。它使用 [Kate 编辑器][2]的组件来创建一个简单的界面，但它利用这些相同的组件来提供了大量有用的功能。

### 安装

KWrite 不可用于所有环境，它是 [KDE Plasma 桌面][3]的一个组件，所以如果你正在运行 Plasma，那么你已经有了 KWrite。

如果你没有运行 Plasma，那么你可以安装 Plasma，这样你可以将它和 KWrite 一起开始使用，或者根据需要使用 KWrite。然而，它是作为 Plasma 桌面的默认文本编辑器，所以如果你真的想把它作为一个独立应用使用，那么安装 Kate 可能更容易。

### 使用 KWrite

当你启动 KWrite 时，你会看到期望的编辑器的样子：一大块用于输入的区域，顶部有一个菜单栏和工具栏，底部有一个状态栏。这就是你在开始之前需要了解的全部内容。KWrite 是一个直观的应用，工具栏按钮用于重要的动作，如打开和保存文件，简单的菜单系统用于更高级的编辑任务。

![Kwrite terminal containing dark gray html code on white background][4]

KWrite 的许多功能都是潜在的，不需要你自己去激活它们就会发生。例如，如果你打开一个用 HTML 编写的文件，那么 KWrite 会高亮显示关键字（如 `class` 和 `id`）和识别代码标签（如 `<p>` 或 `<div>`），并将它们与自然语言的单词区别对待。当你加载一个用 Python 编写的文件时，也会发生同样的情况，而对于主要用自然语言编写的文件，则不会发生任何事情。

当然，你不必只选择 HTML、Python 和你的母语。KWrite 支持很多语言和格式（对于很多语言和格式，它甚至有自动完成选项）。

对于那些想要除了自动加载功能之外更多功能的用户，在编辑、视图和工具菜单中都有一些选项。例如，你可以激活动态的拼写检查、运行脚本、调出命令行、注释或取消注释一行、调整缩进、显示行号等等。

当从终端启动 KWrite 时，也有一些有趣的选项。例如，如果你知道要到文件中的哪一行，你可以用行号参数启动 KWrite：

```
$ kwrite --line 101 example.txt
```

你也可以使用 `--stdin` （或简写 `-i`）选项方便地将命令的输出通过管道到 KWrite。例如，这个命令下载 [example.com][5] 的首页，并在一个新的 KWrite 窗口中显示 HTML：

```
$ curl http://example.com | kwrite --stdin
```

### 尝试 KWrite

我一直觉得 KDE 的优势之一就是它的复杂性很灵活。如果你想要一个简单的桌面，你基本上可以选择忽略任何你不想要的功能。KWrite 就是这种灵活性也适用于开发人员的一个例子。由于 Kate 具有许多功能，所以开发者有能够重用这些功能的一个子集来创建一个更干净、更专注的应用版本。

KWrite 是一个单文档编辑器。它没有标签，也没有任何“项目”的意识。它的目的是为那些想一次只处理一个文档的人准备的，他们希望基本的功能在默认情况下是激活的，在需要的时候可以选择强大的编辑工具。安装优秀的 Plasma 桌面，今天就来试试吧！

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/12/kwrite-kde-plasma

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/code_computer_laptop_hack_work.png?itok=aSpcWkcl (Coding on a computer)
[2]: https://opensource.com/article/20/12/kate-text-editor
[3]: https://opensource.com/article/19/12/linux-kde-plasma
[4]: https://opensource.com/sites/default/files/uploads/kwrite-31_days_kwrite-opensource.png (Kwrite terminal containing dark gray html code on white background)
[5]: http://example.com

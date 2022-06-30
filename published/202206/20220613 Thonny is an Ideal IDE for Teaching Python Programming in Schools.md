[#]: subject: "Thonny is an Ideal IDE for Teaching Python Programming in Schools"
[#]: via: "https://itsfoss.com/thonny-python-ide/"
[#]: author: "Abhishek Prakash https://itsfoss.com/author/abhishek/"
[#]: collector: "lkxed"
[#]: translator: "geekpi"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14717-1.html"

Thonny：在学校教授 Python 编程的理想 IDE
======

在 Linux 中运行一个 Python 程序只需要简单地在终端中执行 Python 文件就行。

但这对人们来说不是很方便，也不能帮助你调试你的程序。太原始了。

有几个 IDE 和文本编辑器可以用于 Python 开发。Linux 用户可以使用 [PyCharm 社区版][1]。

我最近发现了另一个专门为 Python 初学者制作的 IDE。我喜欢这个应用的想法，因此我在这里与你分享。

### Thonny 是一个跨平台、开源的 Python IDE，适合初学者使用

[Thonny][2] 在用户界面和用户体验方面，感觉就像 Python 版本的 Eclipse。考虑到大多数 C++ 和 Java 的初学者都是从 Eclipse 开始的，而且许多人后来一直使用它，这也不完全是一件坏事。

它不是一个新的工具。它已经出现好几年了。我没有用 Python 进行编码，所以直到最近才发现它。

Thonny 专注于 Python，提供了帮助 Python 初学者了解其程序行为的功能。让我们来看看这些功能。

#### 即装即用

Thonny 自带 Python，所以你不需要为安装 Python 做额外的努力。这对 Linux 用户来说不是什么大事，因为大多数发行版都默认安装了 Python。

界面很简单。它给你一个编辑器，你可以写你的 Python 程序，然后点击运行按钮或使用 `F5` 键来运行程序。输出显示在底部。

![thonny hello world][3]

#### 查看变量

在 “<ruby>查看<rt>View</rt></ruby>-><ruby>变量<rt>Variables</rt></ruby>”，你可以看到所有变量的值。不需要将它们全部打印出来。

![thonny variable pane][4]

#### 内置调试器

通过使用调试器一步步运行你的程序。你可以从顶部的菜单或使用 `Ctrl + F5` 键访问它。在这里你甚至不需要设置断点。你可以用 `F6` 进入大步骤，或用 `F7` 进入小步骤。

![thonny step by step f6][5]

在小步骤中，你可以看到 Python 是如何看待你的表达式的。这对新的程序员理解他们的程序为什么以某种方式表现非常有帮助。

![thonny step by step f7][6]

不止这样。对于函数调用，它会打开一个新的窗口，里面有独立的局部变量表和代码指针。超级酷!

#### 语法错误高亮

初学者经常会犯一些简单的语法错误，如缺少小括号、引号等。Thonny 会在编辑器中立即指出来。

本地变量也可以从视觉上与全局变量区分开来。

#### 自动补全

你不需要输入所有的东西。Thonny 支持自动补全代码，这有助于加快编码。

![thonny auto complete][7]

#### 访问系统 shell

在工具中，你可以访问系统 shell。在这里你可以安装新的 Python 包或学习从命令行处理 Python。

![thonny shell terminal][8]

请注意，如果你使用 Flatpak 或 Snap，Thonny 可能无法访问系统 shell。

#### 从 GUI 管理 Pip

进入工具和管理包。它会打开一个窗口，你可以从这个 GUI 中安装 Pip 软件包。

![thonny manage packages][9]

对于学习 Python 来说，功能足够好，对吗？让我们看看如何安装它。

### 在 Linux 上安装 Thonny

Thonny 是一个跨平台的应用。它可用于 Windows、macOS 和 Linux。

它是一个流行的应用，你可以在大多数 Linux 发行版的仓库中找到它。只要在你的系统的软件中心寻找它。

另外，你也可以随时使用你的 Linux 发行版的包管理器。

在 Debian 和基于 Ubuntu 的发行版上，你可以使用 `apt` 命令来安装它。

```
sudo apt install thonny
```

它会下载一堆依赖关系和大约 300MB 的软件包。

安装后，你可以在菜单中搜索它，并从那里安装它。

### 总结

Thonny 对于初级 Python 程序员来说是个不错的工具。不是说专家不能使用它，但它更适合在学校和学院使用。学生们会发现它有助于学习 Python 和理解他们的代码是如何以某种方式表现出来的。事实上，它最初是在爱沙尼亚的塔尔图大学开发的。

总的来说，对于 Python 学习者来说是一个很好的软件。

--------------------------------------------------------------------------------

via: https://itsfoss.com/thonny-python-ide/

作者：[Abhishek Prakash][a]
选题：[lkxed][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lkxed
[1]: https://itsfoss.com/install-pycharm-ubuntu/
[2]: https://thonny.org/
[3]: https://itsfoss.com/wp-content/uploads/2022/06/thonny-hello-world.png
[4]: https://itsfoss.com/wp-content/uploads/2022/06/thonny-variable-pane.png
[5]: https://itsfoss.com/wp-content/uploads/2022/06/thonny-step-by-step-f6.png
[6]: https://itsfoss.com/wp-content/uploads/2022/06/thonny-step-by-step-f7.png
[7]: https://itsfoss.com/wp-content/uploads/2022/06/thonny-auto-complete.png
[8]: https://itsfoss.com/wp-content/uploads/2022/06/thonny-shell-terminal.png
[9]: https://itsfoss.com/wp-content/uploads/2022/06/thonny-manage-packages.png

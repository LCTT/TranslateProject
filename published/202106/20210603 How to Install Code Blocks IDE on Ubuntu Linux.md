[#]: subject: (How to Install Code Blocks IDE on Ubuntu Linux)
[#]: via: (https://itsfoss.com/install-code-blocks-ubuntu/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)
[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13484-1.html)

如何在 Ubuntu Linux 上安装 Code Blocks IDE
======

![](https://img.linux.net.cn/data/attachment/album/202106/14/164807ov99wdi2m7pmgz2j.jpg)

Code Blocks 是一个用 C++ 编写的开源 IDE，非常适合 C、C++ 和 Fortran 开发。它是跨平台的，可以在 Linux、macOS 和 Windows 上运行。

Code Blocks 是轻量级和快速的。它支持工作区、多目标项目、工作区内的项目间依赖关系。

你可以得到语法高亮、代码折叠、标签式界面、类浏览器、智能缩进等功能。你还可以通过插件扩展 IDE 的功能。

在本教程中，你将学习如何在基于 Ubuntu 的 Linux 发行版上安装 Code Blocks。

> 注意
>
> Code Blocks 也可以在 Ubuntu 软件中心找到。然而，从 Ubuntu 21.04 开始，从 Ubuntu 软件中心以图形方式安装 Code Blocks 会安装一个 codeblocks-common 软件包，而不是图形化 IDE。因而你不能看到安装在你系统上的 Code Blocks 以运行。由于这个原因，我建议采取终端的方式在 Ubuntu 上安装 Code Blocks。

### 在基于 Ubuntu 的 Linux 发行版上安装 Code Blocks

[Code Blocks IDE][1] 在所有 Ubuntu 版本的 universe 库中都有。虽然它通常是默认启用的，但先[启用 universe 仓库][2]也无妨：

```
sudo add-apt-repository universe
```

更新软件包缓存，这样系统就能知道新添加的仓库中的额外软件包的可用性：

```
sudo apt update
```

最后，你可以使用 `apt install` 命令在基于 Ubuntu 的发行版上安装 Code Blocks：

```
sudo apt install codeblocks
```

![][3]

建议你也安装额外的插件，以便从 Code Blocks IDE 中获得更多。你可以使用 `codeblocks-contrib` 包来安装它们：

```
sudo apt install codeblocks-contrib
```

### 如何使用 Code Blocks

在系统菜单中搜索 “Code Blocks”。这是在 Ubuntu 默认的 GNOME 版本中的样子：

![][4]

当你第一次启动 Code Blocks 时，它会寻找你系统中所有可用的编译器，并将其添加到路径中，这样你就不用自己去配置它了。

在我的例子中，我的 Ubuntu 系统上已经安装了 gcc，Code Blocks 很好地识别了它。

![][5]

Code Blocks 的用户界面绝对不够现代，但请记住，这个 IDE 是轻量级的，它几乎消耗不到 50MB 的内存。

如果你曾经使用过像 Eclipse 这样的其他 IDE，你就不会觉得使用 Code Block 有什么困难。你可以写你的代码并把它们组织在项目中。

构建、运行并构建和运行按钮一起放在顶部。

![][6]

当你运行代码时，它会打开一个新的终端窗口来显示输出。

![][7]

这就是你需要的关于 Code Blocks 的最少信息。剩下的留给你，你可以通过浏览它的 [维基][8] 和[用户手册][9] 来进一步探索它。

拥有一个 IDE 可以使 [在 Linux 上运行 C 或 C++ 程序][10] 更容易。Eclipse 是一个很好的 IDE，但它比 Code Blocks 要消耗更多的系统资源。当然，最后，重要的是你的选择。

--------------------------------------------------------------------------------

via: https://itsfoss.com/install-code-blocks-ubuntu/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://www.codeblocks.org/
[2]: https://itsfoss.com/ubuntu-repositories/
[3]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/05/install-code-blocks-ubuntu.png?resize=800%2C445&ssl=1
[4]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/06/code-blocks-ubuntu.jpg?resize=800%2C231&ssl=1
[5]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/05/code-blocks-ide-first-run.png?resize=800%2C529&ssl=1
[6]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/06/code-blocks-ide.png?resize=800%2C543&ssl=1
[7]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/06/code-blocks-code-run-terminal.png?resize=504%2C371&ssl=1
[8]: https://wiki.codeblocks.org/index.php/Main_Page
[9]: https://www.codeblocks.org/user-manual/
[10]: https://itsfoss.com/c-plus-plus-ubuntu/

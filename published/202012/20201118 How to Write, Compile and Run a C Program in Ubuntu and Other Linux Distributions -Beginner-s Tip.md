[#]: collector: (lujun9972)
[#]: translator: (robsean)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12939-1.html)
[#]: subject: (How to Write, Compile and Run a C Program in Ubuntu and Other Linux Distributions [Beginner’s Tip])
[#]: via: (https://itsfoss.com/run-c-program-linux/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

如何在 Ubuntu/Debian Linux 上编写、编译和运行一个 C 程序
======

![][2]

你是如何在 Linux 上使用 C 编写你的程序的？它确实是非常简单的，由三个简单的步骤组成。

**步骤 1**: 编写你的 C 程序，并使用一个 `.c` 的扩展名进行保存。例如，`my_program.c` 。

**步骤 2**: 在一个终端中使用 `gcc` 编译器来编译程序并生成目标文件，像这样：

```
gcc -o my_program my_program.c
```

**步骤 3**: 在 Linux 中，你可以以运行生成的对象文件的方式来运行你的 C 程序：

```
./my_program
```

![][1]

这只是如何在 Linux 中编译和运行 C 程序的简要总结。假设你是 C 语言或 Linux 系统的新手，我将仔细演示这些步骤，以便你能在 Linux 环境中舒服地编写 C 程序。

事实上，我将讨论如何在 Linux 终端中以及在代码编辑器中运行 C 程序的两种方式。

### 方法 1: 在 Linux 终端中运行 C 程序

为了在 Linux 中运行一个 C 程序，你需要在你的系统上有一个 C 编译器。最流行的编译器是 `gcc`（<ruby>[GNU 编译器套件][3]<rt>GNU Compiler Collection</rt></ruby>）。

你可以使用你发行版的软件包管理器来安装 `gcc` 。在基于 Debian 和 Ubuntu 的 Linux 发行版中，使用 `apt` 命令：

```
sudo apt install gcc
```

切换到保存你的 C 程序的目录（或者提供路径），然后通过编译程序生成对象文件：

```
gcc -o my_program my_program.c
```

记住，提供输出对象文件（`-o my_program`）是可选的。如果你不提供，那么将自动生成一个名称为 `a.out` 的对象文件。但是这样并不好，因为编译每个 C 程序都会覆盖它，而且你也不知道这个 `a.out` 对象文件究竟属于哪个程序。

在你的对象文件生成后，运行它来运行 C 程序。它已经能够执行了。像这样简单地使用它：

```
./my_program
```

接下来，如果你的程序是正确的，它将显示出你所期望的输出。正如你所看到的，这和 [在 Linux 中运行 C++ 程序][4] 没什么不同。

*每更改一次你的程序，你都必须先重新编译它，然后再次运行生成的对象文件来运行这个新的 C 程序。*

### 方法 2: 如何在 Linux 中使用一个诸如 VSCode 之类的代码编辑器来运行 C 程序

并不是每一个人都能适应命令行和终端，我完全理解这一点。

你可以使用一个诸如 Eclipse 或 Code Blocks 之类的真正的 C/C++ IDE ，但是它们是很重量级的程序，通常更适合于大型的项目。

我建议使用一个开源的代码编辑器，像 VSCode 或 Atom 。它们基本上是文本编辑器，但是你可以通过安装附加组件来直接在图形化的代码编辑器中编译和运行程序。

在这个示例中，我使用 [VSCode][5] 编辑器。它是一个来自微软的 [非常流行的开源的代码编辑器][6] 。

首先，在 Ubuntu 的 [软件中心中安装 VSCode][7] 。对于其它发行版来说，请检查你的 Linux 发行版的软件包管理器或软件中心。你可以参看它的官方网站来查看更多的信息。

启动 VSCode ，打开或创建一个工程，在这里创建你的 C 程序。我使用一个简单的 Hello World 程序作为示例。

![][8]

你必须确保你已经在你的 Linux 系统上安装了 `gcc` 编译器。

```
sudo apt install gcc
```

接下来你要做的事是使用一个允许你运行 C 代码的扩展。微软可能会提示你安装它的 C/C++ 程序扩展，但它的设置很复杂，因此我不推荐。

相反，我建议你使用 Code Runner 扩展。它是一个简单直接的扩展，你可以在不使用额外配置的情况下轻松地运行 C 和 C++ 代码。

转到扩展标签页，在其中搜索和安装 “Code Runner” 。

![安装 Code Runner 扩展来运行 C/C++ 程序][9]

重新启动 VSCode 。现在，你能够使用下面方法中的其中一个来运行 C 代码：

  * 使用快捷键 `Ctrl+Alt+N` 。
  * 按下 `F1` ，接下来选择或输入 “Run Code” 。
  * 在文本编辑器中右键单击，从上下文菜单中单击 “Run code” 。

![右键单击程序文件，然后选择 Run Code][10]

当你运行这个 C 程序时，它将会被自动编译和运行。你可以在编辑器底部打开的终端中看到输出。还有比这更好的事情吗？

![程序输出显示在编辑器的底部][11]

你更喜欢哪一种方法？

在 Linux 命令行中运行一些 C 程序是没有问题的，但是使用一个代码编辑器会更容易一些，而且会节省时间。你不觉得吗？

你可以自己决定想使用哪一种方法。

--------------------------------------------------------------------------------

via: https://itsfoss.com/run-c-program-linux/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[robsean](https://github.com/robsean)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/11/running-c-program-linux.png?resize=795%2C399&ssl=1
[2]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/11/Run-C-Program-Linux.png?resize=800%2C450&ssl=1
[3]: https://gcc.gnu.org/
[4]: https://itsfoss.com/c-plus-plus-ubuntu/
[5]: https://code.visualstudio.com
[6]: https://itsfoss.com/best-modern-open-source-code-editors-for-linux/
[7]: https://itsfoss.com/install-visual-studio-code-ubuntu/
[8]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/11/c-program-visual-studio-code-linux.png?resize=800%2C441&ssl=1
[9]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/11/running-c-program-in-linux-with-visual-studio-code.png?resize=800%2C500&ssl=1
[10]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/11/running-c-program-in-linux-with-visual-studio-code.jpg?resize=800%2C500&ssl=1
[11]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/11/run-c-program-in-linux-with-visual-studio-code.jpg?resize=800%2C500&ssl=1

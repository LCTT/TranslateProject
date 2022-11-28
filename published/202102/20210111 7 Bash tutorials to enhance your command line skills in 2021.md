[#]: collector: (lujun9972)
[#]: translator: (Chao-zhi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13090-1.html)
[#]: subject: (7 Bash tutorials to enhance your command line skills in 2021)
[#]: via: (https://opensource.com/article/21/1/bash)
[#]: author: (Jim Hall https://opensource.com/users/jim-hall)

7 个 Bash 教程，提高你的命令行技能（2021 版）
======

> Bash 是大多数 Linux 系统上的默认命令行 shell。所以你为什么不试着学习如何最大限度地利用它呢？

![](https://img.linux.net.cn/data/attachment/album/202102/06/001837cujo0ql3utfobrrj.jpg)

Bash 是大多数 Linux 系统上的默认命令行 shell。所以你为什么不试着学习如何最大限度地利用它呢？今年，我们推荐了许多很棒的文章来帮助你充分利用 Bash shell 的强大功能。以下是一些关于 Bash 阅读次数最多的文章：

### 《通过重定向在 Linux 终端任意读写数据》

输入和输出重定向是任何编程或脚本语言的基础功能。从技术上讲，只要你与电脑互动，它就会自然而然地发生。输入从 stdin（标准输入，通常是你的键盘或鼠标）读取，输出到 stdout（标准输出，一般是文本或数据流），而错误被发送到 stderr（标准错误，一般和标准输出是一个位置）。了解这些数据流的存在，使你能够在使用 Bash 等 shell 时控制信息的去向。Seth Kenlon [分享][2]了这些很棒的技巧，可以让你在不需要大量鼠标移动和按键的情况下从一个地方获取数据。你可能不经常使用重定向，但学习使用它可以为你节省大量不必要的打开文件和复制粘贴数据的时间。

### 《系统管理员 Bash 脚本入门》

Bash 是自由开源软件，所以任何人都可以安装它，不管他们运行的是 Linux、BSD、OpenIndiana、Windows 还是 macOS。Seth Kenlon [帮助][3]你学习如何使用 Bash 的命令和特性，使其成为最强大的 shell 之一。

### 《针对大型文件系统可以试试此 Bash 脚本》

你是否曾经想列出一个目录中的所有文件，只显示其中的文件，不包括其他内容？或者只显示目录？如果你有，那么 Nick Clifton 的[文章][4]可能正是你正在寻找的。Nick 分享了一个漂亮的 Bash 脚本，它可以列出目录、文件、链接或可执行文件。该脚本使用 `find` 命令进行搜索，然后运行 `ls` 显示详细信息。对于管理大型 Linux 系统的人来说，这是一个漂亮的解决方案。

### 《用 Bash 工具对你的 Linux 系统配置进行快照》

你可能想与他人分享你的 Linux 配置，原因有很多。你可能需要帮助排除系统上的一个问题，或者你对自己创建的环境非常自豪，想向其他开源爱好者展示它。Don Watkins 向我们[展示][5]了 screenFetch 和 Neofetch 来捕获和分享你的系统配置。

### 《6 个方便的 Git 脚本》

Git 已经成为一个无处不在的代码管理系统。了解如何管理 Git 存储库可以简化你的开发体验。Bob Peterson [分享][6]了 6 个 Bash 脚本，它们将使你在使用 Git 存储库时更加轻松。`gitlog` 打印当前补丁的简略列表，并与主版本相对照。这个脚本的不同版本可以显示补丁的 SHA1 id 或在一组补丁中搜索字符串。

### 《改进你 Bash 脚本的 5 种方法》

系统管理员通常编写各种或长或短的 Bash 脚本，以完成各种任务。Alan Formy-Duval [解释][7]了如何使 Bash 脚本更简单、更健壮、更易于阅读和调试。我们可能会考虑到我们需要使用诸如 Python、C 或 Java 之类的语言来实现更高的功能，但其实也不一定需要。因为 Bash 脚本语言就已经非常强大。要最大限度地发挥它的效用，还有很多东西要学。

### 《我珍藏的 Bash 秘籍》

Katie McLaughlin 帮助你提高你的工作效率，用别名和其他快捷方式解决你经常忘记的事情。当你整天与计算机打交道时，找到可重复的命令并标记它们以方便以后使用是非常美妙的。Katie [总结][8]了一些有用的 Bash 特性和帮助命令，可以节省你的时间。

这些 Bash 小技巧将一个已经很强大的 shell 提升到一个全新的级别。也欢迎分享你自己的建议。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/1/bash

作者：[Jim Hall][a]
选题：[lujun9972][b]
译者：[Chao-zhi](https://github.com/Chao-zhi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jim-hall
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/terminal_command_linux_desktop_code.jpg?itok=p5sQ6ODE (Terminal command prompt on orange background)
[2]: https://linux.cn/article-12385-1.html
[3]: https://opensource.com/article/20/4/bash-sysadmins-ebook
[4]: https://linux.cn/article-12025-1.html
[5]: https://opensource.com/article/20/1/screenfetch-neofetch
[6]: https://linux.cn/article-11797-1.html
[7]: https://opensource.com/article/20/1/improve-bash-scripts
[8]: https://linux.cn/article-11841-1.html

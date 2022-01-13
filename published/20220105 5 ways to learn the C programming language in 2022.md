[#]: subject: "5 ways to learn the C programming language in 2022"
[#]: via: "https://opensource.com/article/22/1/c-programming"
[#]: author: "Jim Hall https://opensource.com/users/jim-hall"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14175-1.html"

2021 总结：学习 C 语言编程的 5 种方法
======

> 只需掌握一点 C 语言的知识，你就可以做很多事情。

![](https://img.linux.net.cn/data/attachment/album/202201/13/192104tb962skk0mm4r44q.jpg)

我精通几种编程语言，但我最喜欢的是 C 语言。C 语言开发于 20 世纪 70 年代，作为一种系统编程语言，在 2021 年仍然是最受欢迎的编程语言之一。如果你想探索 C 语言的几个特点，可以从去年的这些热门文章开始：

### 在 C 语言中使用 getopt 进行短选项解析

如果你的程序每次运行时都能对用户作出反应，你就可以使它变得更加灵活。让你的用户告诉你的程序使用什么文件或如何以不同的方式做事情。为此，你需要读取命令行。[这篇文章][2] 告诉你如何使用 `argv` 直接读取命令行，并使用 `getopt` 读取短命令行选项。

### 在 Linux 中用 ncurses 定位屏幕上的文本

大多数 Linux 工具只是从屏幕的底部滚动文本。但如果你想在屏幕上定位文本，比如游戏或数据显示，该怎么办？这就是 [ncurses][3] 的作用。

### 用 DOS conio 开始编程

C 语言并不只适用于 Linux。你可以在许多操作系统上找到 C，包括 DOS。许多 C 程序员控制控制台输入和输出的标准方法是使用 `conio` 库。学习如何 [使用 conio` 来更新 DOS 程序的控制台][4]，包括文本颜色和文本窗口。

### 使用位域和掩码编写国际象棋游戏

在 C 语言程序中关联信息的标准方法是使用一个结合了两个或多个相关字段的结构体。例如，你可以用一个结构体来跟踪棋盘上的棋子。但是有一种更直接的方法来跟踪同样的信息，同时使用更少的数据和内存。使用 [二进制位域和掩码][5]，你可以存储一个单一的值来识别每个方格中的棋子和颜色。

### C 语言编程中的 5 个常见错误以及如何修复它们

即使是最好的程序员也会产生编程错误。根据你的程序所做的事情，这些 bug 可能会引入安全漏洞，导致程序崩溃，或产生意外的行为。但是，通过一点额外的代码，你可以避免最常见和最严重的 C 语言编程错误。这里有 [五个可能破坏你的应用的 bug 以及你如何避免它们][6]。

只需一点 C 语言知识，你就可以做很多事情。探索新的方法，为你的下一个 C 语言编程项目增加功能。

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/1/c-programming

作者：[Jim Hall][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jim-hall
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/coffee_tea_laptop_computer_work_desk.png?itok=D5yMx_Dr (Person drinking a hot drink at the computer)
[2]: https://opensource.com/article/21/8/short-option-parsing-c
[3]: https://opensource.com/article/21/8/ncurses-linux
[4]: https://opensource.com/article/21/9/programming-dos-conio
[5]: https://opensource.com/article/21/8/binary-bit-fields-masks
[6]: https://opensource.com/article/21/10/programming-bugs

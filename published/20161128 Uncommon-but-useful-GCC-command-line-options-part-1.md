不常见但是很有用的 gcc 命令行选项（一）
===================================================

在本文中，你可以学习到：

1. [在每个编译阶段查看中间代码的输出][1]
2. [让你的代码可调试和可分析][2]
3. [结论][3]

软件工具通常情况下会提供多个功能以供选择，但是如你所知的，不是所有的功能都能被每个人用到的。公正地讲，这并不是设计上的错误，因为每个用户都会有自己的需求，他们只在他们的领域内使用该工具。然而，深入了解你所使用的工具也是很有益处的，因为你永远不知道它的某个功能会在什么时候派上用场，从而节省下你宝贵的时间。

举一个例子：编译器。一个优秀的编程语言编译器总是会提供极多的选项，但是用户一般只知道和使用其中很有限的一部分功能。更具体点来说，比如你是 C 语言开发人员，并将 Linux 作为你的开发平台，那么你很有可能会用到 gcc 编译器，这个编译器提供了 (几乎) 数不清的命令行选项列表。

你知道，你可以让 gcc 保存每个编译阶段的输出吗？你知道用于生成警告的 `-Wall` 选项，它并不会包含一些特殊的警告吗？gcc 的很多命令行选项都不会经常用到，但是它们在某些特定的情况下会变得非常有用，例如，当你在调试代码的时候。

所以在本文中，我们会介绍这样的几个选项，提供所有必要的细节，并通过简单易懂的例子来解释它们。

但是在开始前，请注意本文中所有的例子所使用的环境：基于 Ubuntu 16.04 LTS 操作系统，gcc 版本为 5.4.0。

### 在每个编译阶段查看中间代码的输出

你知道在通过 gcc 编译 c 语言代码的时候大体上共分为四个阶段吗？分别为预处理 -> 编译 -> 汇编 -> 链接。在每个阶段之后，gcc 都会产生一个将移交给下一个阶段的临时输出文件。但是生成的都是临时文件，因此我们并不能看到它们——我们所看到的只是我们发起编译命令，然后它生成的我们可以直接运行的二进制文件或可执行文件。

但是比如说在预处理阶段，如果调试时需要查看代码是如何进行处理的，你要怎么做呢？好消息是 gcc 编译器提供了相应的命令行选项，你可以在标准编译命令中使用这些选项获得原本被编译器删除的中间文件。我们所说的选项就是`-sava-temps`。

以下是 [gcc 手册][4]中对该选项的介绍：

> 永久存储临时的中间文件，将它们放在当前的文件夹下并根据源文件名称为其命名。因此，用 `-c -save-temps` 命令编译 foo.c 文件时会生成 foo.i foo.s 和 foo.o 文件。即使现在编译器大多使用的是集成的预处理器，这命令也会生成预处理输出文件 foo.i。

> 当与 `-x` 命令行选项结合使用时，`-save-temps` 命令会避免覆写与中间文件有着相同扩展名的输入源文件。相应的中间文件可以通过在使用 `-save-temps` 命令之前重命名源文件获得。

以下是怎样使用这个选项的例子：

```
gcc -Wall -save-temps test.c -o test-exec
```

下图为该命令的执行结果，验证其确实产生了中间文件：

[
 ![](https://www.howtoforge.com/images/uncommon-but-useful-gcc-command-line-options/gcc-save-temps.png)
][5]

因此，在截图中你所看到的 test.i、test.s、 test.o 文件都是由 `-save-temps` 选项产生的。这些文件分别对应于预处理、编译和链接阶段。

### 让你的代码可调试和可分析

你可以使用专有的工具调试和分析代码。如 [gdb][6] 就是专用于调试的工具，而 [gprof][7] 则是热门的分析工具。但你知道 gcc 特定的命令行选项也可以让你的代码可调试和可分析吗？

让我们开始调试之路吧！为了能在代码调试中使用 gdb，你需要在编译代码的时候使用 gcc 编译器提供的 `-g` 选项。这个选项让 gcc 生成 gdb 需要的调试信息从而能成功地调试程序。

如果你想要使用此选项，建议您详细阅读 [gcc 手册][8]提供的有关此选项的详细信息——在某些情况下，其中的一些内容可能是至关重要的。 例如，以下是从手册页中摘录的内容：

> GCC 允许在使用 `-g` 选项的时候配合使用 `-O` 选项。优化代码采用的便捷方式有时可能会产生意想不到的结果：某些你声明的变量可能不复存在；控制流可能会突然跳转到你未曾预期的位置；一些语句也许不会执行，因为它们已经把常量结果计算了或值已经被保存；一些语句可能会在不同地方执行，因为它们已经被移出循环。

> 然而优化的输出也是可以调试的。这就使得让优化器可以合理地优化或许有 bug 的代码。

不只是 gdb，使用 `-g` 选项编译代码，还可以开启使用 Valgrind 内存检测工具，从而完全发挥出该选项的潜力。或许还有一些人不知道，mencheck 工具被程序员们用来检测代码中是否存在内存泄露。你可以在[这里][9]参见这个工具的用法。

继续往下，为了能够在代码分析中使用 gprof 工具，你需要使用 `-pg` 命令行选项来编译代码。这会让 gcc 生成额外的代码来写入分析信息，gprof 工具需要这些信息来进行代码分析。[gcc 手册][10] 中提到：当编译你需要数据的源文件时，你必须使用这个选项，当然链接时也需要使用它。为了能了解 gprof 分析代码时具体是如何工作的，你可以转到我们的网站[专用教程][11]进行了解。

**注意**：`-g` 和 `-pg` 选项的用法类似于上一节中使用 `-save-temps` 选项的方式。

### 结论

我相信除了 gcc 的专业人士，都可以在这篇文章中得到了一些启发。尝试一下这些选项，然后观察它们是如何工作的。同时，请期待本教程系列的[下一部分][12]，我们将会讨论更多有趣和有用的 gcc 命令行选项。

--------------------------------------------------------

via: https://www.howtoforge.com/tutorial/uncommon-but-useful-gcc-command-line-options/

作者：[Ansh][a]
译者：[dongdongmian](https://github.com/dongdongmian)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://twitter.com/howtoforgecom
[1]:https://www.howtoforge.com/tutorial/uncommon-but-useful-gcc-command-line-options/#see-intermediate-output-during-each-compilation-stage
[2]:https://www.howtoforge.com/tutorial/uncommon-but-useful-gcc-command-line-options/#make-your-code-debugging-and-profiling-ready
[3]:https://www.howtoforge.com/tutorial/uncommon-but-useful-gcc-command-line-options/#conclusion
[4]:https://linux.die.net/man/1/gcc
[5]:https://www.howtoforge.com/images/uncommon-but-useful-gcc-command-line-options/big/gcc-save-temps.png
[6]:https://www.gnu.org/software/gdb/
[7]:https://sourceware.org/binutils/docs/gprof/
[8]:https://linux.die.net/man/1/gcc
[9]:http://valgrind.org/docs/manual/mc-manual.html
[10]:https://linux.die.net/man/1/gcc
[11]:https://www.howtoforge.com/tutorial/how-to-install-and-use-profiling-tool-gprof/
[12]:https://www.howtoforge.com/tutorial/uncommon-but-useful-gcc-command-line-options-2/

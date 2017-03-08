在 Linux 中如何使用 gdb 调试 C 程序
============================================================

无论多么有经验的程序员，开发的任何软件都不可能完全没有 bug。因此，排查及修复 bug 成为软件开发周期中最重要的任务之一。有许多办法可以排查 bug（测试、代码自审等等），但是还有一些专用软件（称为调试器）可以帮助准确定位问题的所在，以便进行修复。

如果你是 C/C++ 程序员，或者使用 Fortran 和 Modula-2 编程语言开发软件，那么你将会很乐意知道有这么一款优秀的调试器 - [GDB][4] - 可以帮你更轻松地调试代码 bug 以及其它问题。在这篇文章中，我们将讨论一下 GDB 调试器的基础知识，包括它提供的一些有用的功能/选项。

在我们开始之前，值得一提的是，文章中的所有说明和示例都已经在 Ubuntu 14.04 LTS 中测试过。教程中的示例代码都是 C 语言写的；使用的 shell 为 bash（4.3.11）；GDB 版本为 7.7.1。

### GDB 调试器基础

通俗的讲，GDB 可以让你看到程序在执行过程时的内部流程，并帮你明确问题的所在。我们将在下一节通过一个有效的示例来讨论 GDB 调试器的用法，但在此之前，我们先来探讨一些之后对你有帮助的基本要点。

首先，为了能够顺利使用类似 GDB 这样的调试器，你必须以指定的方式编译程序，让编译器产生调试器所需的调试信息。例如，在使用 gcc 编译器（我们将在本教程之后的章节用它来编译 C 程序示例）编译代码的时候，你需要使用 `-g` 命令行选项。

想要了解 gcc 编译器手册页中关于 `-g` 命令行选项相关的内容，请看[这里][5]。

下一步，确保在你的系统中已经安装 GDB 调试器。如果没有安装，而且你使用的是基于 Debian 的系统（如 Ubuntu），那么你就可以使用以下命令轻松安装该工具：

```
sudo apt-get install gdb
```

在其他发行版上的安装方法，请看[这里][6]。

现在，当你按照上述的方式编译完程序（`gcc -g` 命令行选项），同时也已经安装好 GDB 调试器，那么你就可以使用以下命令让程序在调试模式中运行：

```
gdb [可执行程序的名称]
```

这样做会初始化 GDB 调试器，但你的可执行程序此时还不会被启动。在这个时候你就可以定义调试相关的设置。例如，你可以在特定行或函数中设置一个断点让 GDB 在该行暂停程序的执行。

接着，为了启动你的程序，你必须输入执行以下 gdb 命令：

```
run
```

在这里，值得一提的是，如果你的程序需要一些命令行参数，那么你可以在这里指定这些参数。例如：

```
run [arguments]
```

GDB 提供了很多有用的命令，在调试的时候总是能派的上用场。我们将在下一节讨论其中一部分命令。

### GDB 调试器用例

现在我们对 GDB 及其用法有了基本的概念。因此，让我们举例来应用所学的知识。这是一段示例代码：

```
#include <stdio.h>

int main()
{
    int out = 0, tot = 0, cnt = 0;
    int val[] = {5, 54, 76, 91, 35, 27, 45, 15, 99, 0};

    while(cnt < 10)
    {
        out = val[cnt];
        tot = tot + 0xffffffff/out;
        cnt++;
    }

    printf("\n Total = [%d]\n", tot);
    return 0;
}
```

简单说明一下这段代码要做什么事。获取 `val` 数组中每一个值，将其赋值给 `out` 变量，然后将 `tot` 之前的值与 `0xffffffff/out` 的结果值累加，赋值给 `tot` 变量。

这里遇到的问题是，当执行这段代码编译后的可执行程序时，产生以下错误：

```
$ ./gdb-test 
Floating point exception (core dumped)
```

因此，要调试这段代码，第一步是使用 `-g` 选项编译程序。命令如下：

```
gcc -g -Wall gdb-test.c -o gdb-test
```

接着，让我们运行 GDB 调试器并指定要调试的可执行程序。命令如下：

```
gdb ./gdb-test 
```

现在，我刚才得到的错误是 `Floating point exception`，大部分人可能已经知道，这是因为  `n % x`，当 x 为 0 时导致的错误。所以，考虑到这一点，我在 11 行代码除法运算的位置处添加了一个断点。如下：

```
(gdb) break 11
```

注意 `(gdb)` 是调试器的提示信息，我只输入了 `break 11` 命令。

现在，让 GDB 开始运行程序：

```
run
```

当断点第一次被命中时，GDB 显示如下输出：

```
Breakpoint 1, main () at gdb-test.c:11
11 tot = tot + 0xffffffff/out;
(gdb)
```

正如你所看到的那样，调试器会显示断点所在的行代码。现在，让我们打印出此时 `out` 的值。如下：

```
(gdb) print out
$1 = 5
(gdb)
```

如上所示，值 `5` 被打印出来了。这个时候一切都还是正常的。让调试器继续执行程序直到命中下一个断点，可以通过使用 `c` 命令来完成：

```
c  
```

重复上述操作，直到 `out` 值变为 `0` 时。

```
...
...
...
Breakpoint 1, main () at gdb-test.c:11
11 tot = tot + 0xffffffff/out;
(gdb) print out
$2 = 99
(gdb) c
Continuing.

Breakpoint 1, main () at gdb-test.c:11
11 tot = tot + 0xffffffff/out;
(gdb) print out
$3 = 0
(gdb)
```

现在，为了进一步确认问题，我使用 GDB 的 `s`（或 `step`） 命令代替 `c` 命令。因为，我只想让当前程序在第 11 行之后暂停，再一步步执行，看看这个时候是否会发生崩溃。

以下是执行之后输出信息：

```
(gdb) s

Program received signal SIGFPE, Arithmetic exception.
0x080484aa in main () at gdb-test.c:11
11 tot = tot + 0xffffffff/out;
```

是的，如上输出的第一行内容所示，这就是抛出异常的地方。当我再次尝试运行 `s` 命令时，问题最终也得到了确认：

```
(gdb) s

Program terminated with signal SIGFPE, Arithmetic exception.
The program no longer exists.
```

通过这种方式，你就可以使用 GDB 调试你的程序。

### 总结

GDB 提供了很多功能供用户研究和使用，在这里，我们仅仅只介绍了很少一部分内容。通过 GDB 的手册页可以进一步了解这个工具，当你在调试代码的时候，尝试使用一下它。GDB 调试器有一定的学习难度，但是它很值得你下功夫学习。


--------------------------------------------------------------------------------

via: https://www.howtoforge.com/tutorial/how-to-debug-c-programs-in-linux-using-gdb/

作者：[Ansh][a]
译者：[zhb127](https://github.com/zhb127)
校对：[jasminepeng](https://github.com/jasminepeng)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.howtoforge.com/tutorial/how-to-debug-c-programs-in-linux-using-gdb/
[1]:https://www.howtoforge.com/tutorial/how-to-debug-c-programs-in-linux-using-gdb/#gdb-debugger-basics
[2]:https://www.howtoforge.com/tutorial/how-to-debug-c-programs-in-linux-using-gdb/#gdb-usage-example
[3]:https://www.howtoforge.com/tutorial/how-to-debug-c-programs-in-linux-using-gdb/#conclusion
[4]:https://www.sourceware.org/gdb/
[5]:https://linux.die.net/man/1/gcc
[6]:https://www.sourceware.org/gdb/download/

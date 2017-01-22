Translating by zhb127
How to debug C programs in Linux using gdb
在 Linux 中如何使用 gdb 调试 C 程序
============================================================

### 内容介绍

1.  [GDB 调试器基础][1]
2.  [GDB 使用示例][2]
3.  [总结][3]

Regardless of how experienced a coder you are, any software you develop can't be completely free of bugs. So, identifying bugs and fixing them is one of the most important tasks in the software development cycle. While there are many ways of identifying bugs (testing, self review of code, and more), there are dedicated software - dubbed debuggers - that help you understand exactly where the problem is, so that you can easily fix it.
无论你是一名多么有经验的程序员，你开发的任何软件都不可能完全没 bug。因此，排查及修复 bug 成为软件开发周期中最重要的任务之一。虽然，有许多办法可以排查 bug（测试、代码自审等等），但是有一些专用软件（称为调试器）可以帮你清楚了解问题的所在，以便你可以轻松解决问题。

If you are a C/C++ programmer or develop software using the Fortran and Modula-2 programming languages, you'll be glad to know there exists an excellent debugger - dubbed [GDB][4] - that lets you easily debug your code for bugs and other problems. In this article, we will discuss the basics of GDB, including some of the useful features/options it provides.
如果你是一名 C/C++ 程序员或者你使用 Fortran 和 Modula-2 编程语言开发软件，那么你将会很乐意知道有这么一款优秀的调试器 -[GDB][4]- 可以帮你轻松调试代码 bug 及其他问题。在这篇文章中，我们将探讨 GDB 调试器基础，包括它提供的一些有用的特性/选项。

But before we move ahead, it's worth mentioning that all the instructions as well examples presented in this article have been tested on Ubuntu 14.04LTS. The example code used in the tutorial is written in C language; the command line shell we've used is bash (version  4.3.11); and the GDB version we've used is 7.7.1.
在我们开始之前，值得一提的是，本文中介绍的所有说明和示例都已经在 Ubuntu 14.04LTS 中测试过。教程中所使用的示例代码都是使用 C 语言编写的；我们使用的 shell 是 bash（4.3.11）；GDB 版本为 7.7.1。

### GDB debugger basics
### GDB 调试器基础知识

In layman's terms, GDB lets you peek inside a program while the program is executing, something that lets you help identify where exactly the problem is. We'll discuss the usage of the GDB debugger through a working example in the next section, but before that, here, we'll discuss a few basic points that'll help you later on.
通俗来讲，GDB 可以让你查看到程序内部执行过程，并帮你确定问题出在哪里。我们将在下一节通过一个可用示例来探讨一下 GDB 调试的用法，但在此之前，我们将一起来探讨一些之后对你有用的基本要点。

Firstly, in order to successfully use debuggers like GDB, you have to compile your program in such a way that the compiler also produces debugging information that's required by debuggers. For example, in case of the gcc compiler, which we'll be using to compile the example C program later on this tutorial, you need to use the -g command line option while compiling your code.
首先，为了成功使用类似 GDB 这样的调试器，你必须以这样一种方式编译程序，编译器也会产生调试器所需要的调试信息。例如，在 gcc 编译器（我们将在本教程之后的章节用来编译示例 C 程序）的情况下，你需要使用 -g 选项来编译代码。

To know what the gcc compiler's manual page says about this command line option, head [here][5].
想要知道 gcc 编译器手册页中命令行选项相关的内容，看[这里][5]。

Next step is to make sure that you have GDB installed on your system. If that's not the case, and you're on a Debian-based system like Ubuntu, you can easily install the tool using the following command:
下一步是确保系统已经安装 GDB 调试器。如果没有安装，但你使用的是像 Ubuntu 这样的 Debian-based 系统，那么你就可以很轻松的使用以下命令来安装 GDB 调试器：

```
sudo apt-get install gdb
```

For installation on any other distro, head [here][6].
在其他发行版中安装，看[这里][6]。

Now, once you've compiled your program in a way that it's debugging-ready, and GDB is there on your system, you can execute your program in debugging mode using the following command:
现在，一旦你编译完程序，使它的调试就绪，并且系统已经安装 GDB 调试器，那么你就可以使用下面的命令在调试模式中执行你的程序：

```
gdb [prog-executable-name]
```

While this will initiate the GDB debugger, your program executable won't be launched at this point. This is the time where you can define your debugging-related settings. For example, you can define a breakpoint that tells GDB to pause the program execution at a particular line number or function.
虽然这样会初始化 GDB 调试器，但你的可执行程序不会在这个时候被启动。这个时候你就可以设置调试相关的配置。例如，你可以在特定行或函数中设置一个断点来让 GDB 暂停程序的执行。

Moving on, to actually launch your program, you'll have to execute the following gdb command:
继续，真正启动你的程序，你将执行以下 gdb 命令：

```
run
```

It's worth mentioning here that if your program requires some command line arguments to be passed to it, you can specify them here. For example:
值得一提的是，如果你的程序需要一些命令行参数，那么你可以在这里指定它们。例如：

```
run [arguments]
```

GDB provides many useful commands that come in handy while debugging. We'll discuss some of them in the example in next section.
GDB 提供了很多有用的命令，在调试的时候派的上用场。我们将在下一节讨论部分命令。

### GDB usage example
### GDB 用法示例

Now we have a basic idea about GDB as well as its usage. So let's take an example and apply the knowledge there. Here's an example code:
现在我们对 GDB 及其它的用法有了基本概念。因此，让我们举个例子并应用所学的知识。这是一个示例代码：

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

So basically, what this code does is, it picks each value contained in the 'val' array, assigns it to the 'out' integer, and then calculates 'tot' by summing up the variable's previous value and the result of '0xffffffff/out.'
简单来讲，这段代码所做的事情是，遍历 'val' 数组，将数组元素赋值给 'out' 变量，并将每一次 '0xffffffff/out' 表达式的结果值累加赋值给 'tot' 变量。

The problem here is that when the code is run, it produces the following error:
这里的问题是，当代码执行时，产生以下错误：

```
$ ./gdb-test 
Floating point exception (core dumped)
```

So, to debug the code, the first step would be to compile the program with -g. Here's the command:
因此，为了调试这段代码，首先使用 -g 选项编译程序。命令如下：

```
gcc -g -Wall gdb-test.c -o gdb-test
```

Next up, let's run GDB and let it know which executable we want to debug. Here's the command for that:
接着，让我们运行 GDB 调试器并指定要调试的可执行程序。命令如下：

```
gdb ./gdb-test 
```

Now, the error I am getting is 'floating point exception,' and as most of you might already know, it's caused by n % x, when x is 0\. So, with that in mind, I put a break point at line number 11, where the division is taking place. This was done in the following way:
现在，我得到的错误是 `floating point exception`，大多数人可能已经知道，这是因为 n%x，当 x 为 0 时导致的错误。所以，考虑到这一点，我在 11 行执行除法运算的位置添加了一个断点。这是通过以下方式完成的：

```
(gdb) **break 11**
```

Note that '(gdb)' is the debugger's prompt, I just wrote the 'break' command.
注意 `(gdb)` 是调试器的提示信息，我只输入 `break` 命令。

Now, I asked GDB to start the execution of the program:
现在，我让 GDB 开始执行程序：

```
run
```

So, when the breakpoint was hit for the first time, here's what GDB showed in the output:
这样，当断点第一次被命中时，GDB 显示如下输出：

```
Breakpoint 1, main () at gdb-test.c:11
11 tot = tot + 0xffffffff/out;
(gdb)
```

As you can see in the output above, the debugger showed the line where the breakpoint was put. Now, let's print the current value of 'out.' This can be done in the following way:
正如你所看到的，调试器会显示断点所在的行。现在，让我们打印出 `out` 此时的值。如下：

```
(gdb)** print out**
**$1 = 5**
(gdb)
```

As you can see that the value '5' was printed. So, things are fine at the moment. I asked the debugger to continue the execution of the program until the next breakpoint, something which can be done using the 'c' command.
如上所示，值 `5` 被打印出来了。所以，这个时候一切还是正常的。我让调试器继续执行程序直到命中下一个断点，可以使用 `c` 命令来完成：

```
c  
```

I kept on doing this work, until I saw that the value of 'out' was zero.
继续重复上述操作，直到 `out` 值为 0 时。

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

Now, to confirm that this is the exact problem, I used GDB's 's' (or 'step') command instead of 'c' this time. Reason being, I just wanted line 11, where the program execution currently stands paused, to execute, and see if crash occurs at this point.
现在，为了确认这是确切的问题，我使用  GDB 的 `s`（或 `step`） 命令代替 `c` 命令。这是因为，我只想让当前程序一直执行到第 11 行之后暂停，再执行，看看这个时候是否发生崩溃。

Here's what happened:
以下是执行之后输出信息：

```
(gdb) s

Program received signal SIGFPE, Arithmetic exception.
0x080484aa in main () at gdb-test.c:11
11 tot = tot + 0xffffffff/out;
```

Yes, as confirmed by the highlighted output above, this is where the exception was thrown. The final confirmation came when I tried running the 's' command once again:
是的，如上高亮输出所确认的，这就是异常抛出的地方。当我再次尝试运行 `s` 命令时，最终可以确认：

```
(gdb) s

Program terminated with signal SIGFPE, Arithmetic exception.
The program no longer exists.
```

So this way, you can debug your programs using GDB.
这样，你就可以使用 GDB 调试你的程序了。

### Conclusion
### 总结

We've just scratched the surface here, as GDB offers a lot of features for users to explore and use. Go through the man page of GDB to know more about the tool, and try using it whenever you're debugging something in your code. The debugger has a bit of learning curve associated with it, but it's worth the hard work.
GDB 提供了很多功能供用户发现和使用，在这里，我们仅仅只接触了很少一部分内容。通过 GDB 的手册页进一步了解这个工具，当你在调试代码的时候，尝试使用一下它。GDB 调试器的学习曲线有点陡，但是它值得你下功夫去学习。


--------------------------------------------------------------------------------

via: https://www.howtoforge.com/tutorial/how-to-debug-c-programs-in-linux-using-gdb/

作者：[Ansh][a]
译者：[zhb127](https://github.com/zhb127)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.howtoforge.com/tutorial/how-to-debug-c-programs-in-linux-using-gdb/
[1]:https://www.howtoforge.com/tutorial/how-to-debug-c-programs-in-linux-using-gdb/#gdb-debugger-basics
[2]:https://www.howtoforge.com/tutorial/how-to-debug-c-programs-in-linux-using-gdb/#gdb-usage-example
[3]:https://www.howtoforge.com/tutorial/how-to-debug-c-programs-in-linux-using-gdb/#conclusion
[4]:https://www.sourceware.org/gdb/
[5]:https://linux.die.net/man/1/gcc
[6]:https://www.sourceware.org/gdb/download/

[#]: subject: (Learn to debug code with the GNU Debugger)
[#]: via: (https://opensource.com/article/21/3/debug-code-gdb)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)
[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13203-1.html)

学习使用 GDB 调试代码
======

> 使用 GNU 调试器来解决你的代码问题。

![](https://img.linux.net.cn/data/attachment/album/202103/14/210547k3q5lek8j9qspkks.jpg)

GNU 调试器常以它的命令 `gdb` 称呼它，它是一个交互式的控制台，可以帮助你浏览源代码、分析执行的内容，其本质上是对错误的应用程序中出现的问题进行逆向工程。

故障排除的麻烦在于它很复杂。[GNU 调试器][2] 并不是一个特别复杂的应用程序，但如果你不知道从哪里开始，甚至不知道何时和为何你可能需要求助于 GDB 来进行故障排除，那么它可能会让人不知所措。如果你一直使用 `print`、`echo` 或 [printf 语句][3]来调试你的代码，当你开始思考是不是还有更强大的东西时，那么本教程就是为你准备的。

### 有错误的代码

要开始使用 GDB，你需要一些代码。这里有一个用 C++ 写的示例应用程序（如果你一般不使用 C++ 编写程序也没关系，在所有语言中原理都是一样的），其来源于 [猜谜游戏系列][4] 中的一个例子。

```
#include <iostream>
#include <stdlib.h> //srand
#include <stdio.h>  //printf

using namespace std;

int main () {

srand (time(NULL));
int alpha = rand() % 8;
cout << "Hello world." << endl;
int beta = 2;

printf("alpha is set to is %s\n", alpha);
printf("kiwi is set to is %s\n", beta);

 return 0;
} // main
```

这个代码示例中有一个 bug，但它确实可以编译（至少在 GCC 5 的时候）。如果你熟悉 C++，你可能已经看到了，但这是一个简单的问题，可以帮助新的 GDB 用户了解调试过程。编译并运行它就可以看到错误：

```
$ g++ -o buggy example.cpp
$ ./buggy
Hello world.
Segmentation fault
```

### 排除段故障

从这个输出中，你可以推测变量 `alpha` 的设置是正确的，因为否则的话，你就不会看到它*后面*的那行代码执行。当然，这并不总是正确的，但这是一个很好的工作理论，如果你使用 `printf` 作为日志和调试器，基本上也会得出同样的结论。从这里，你可以假设 bug 在于成功打印的那一行之后的*某行*。然而，不清楚错误是在下一行还是在几行之后。

GNU 调试器是一个交互式的故障排除工具，所以你可以使用 `gdb` 命令来运行错误的代码。为了得到更好的结果，你应该从包含有*调试符号*的源代码中重新编译你的错误应用程序。首先，看看 GDB 在不重新编译的情况下能提供哪些信息：

```
$ gdb ./buggy
Reading symbols from ./buggy...done.
(gdb) start
Temporary breakpoint 1 at 0x400a44
Starting program: /home/seth/demo/buggy

Temporary breakpoint 1, 0x0000000000400a44 in main ()
(gdb)
```

当你以一个二进制可执行文件作为参数启动 GDB 时，GDB 会加载该应用程序，然后等待你的指令。因为这是你第一次在这个可执行文件上运行 GDB，所以尝试重复这个错误是有意义的，希望 GDB 能够提供进一步的见解。很直观，GDB 用来启动它所加载的应用程序的命令就是 `start`。默认情况下，GDB 内置了一个*断点*，所以当它遇到你的应用程序的 `main` 函数时，它会暂停执行。要让 GDB 继续执行，使用命令 `continue`：

```
(gdb) continue
Continuing.
Hello world.

Program received signal SIGSEGV, Segmentation fault.
0x00007ffff71c0c0b in vfprintf () from /lib64/libc.so.6
(gdb)
```

毫不意外：应用程序在打印 “Hello world” 后不久就崩溃了，但 GDB 可以提供崩溃发生时正在发生的函数调用。这有可能就足够你找到导致崩溃的 bug，但为了更好地了解 GDB 的功能和一般的调试过程，想象一下，如果问题还没有变得清晰，你想更深入地挖掘这段代码发生了什么。

### 用调试符号编译代码

要充分利用 GDB，你需要将调试符号编译到你的可执行文件中。你可以用 GCC 中的 `-g` 选项来生成这个符号：

```
$ g++ -g -o debuggy example.cpp
$ ./debuggy
Hello world.
Segmentation fault
```

将调试符号编译到可执行文件中的结果是得到一个大得多的文件，所以通常不会分发它们，以增加便利性。然而，如果你正在调试开源代码，那么用调试符号重新编译测试是有意义的：

```
$ ls -l *buggy* *cpp
-rw-r--r--    310 Feb 19 08:30 debug.cpp
-rwxr-xr-x  11624 Feb 19 10:27 buggy*
-rwxr-xr-x  22952 Feb 19 10:53 debuggy*
```

### 用 GDB 调试

加载新的可执行文件（本例中为 `debuggy`）以启动 GDB：

```
$ gdb ./debuggy
Reading symbols from ./debuggy...done.
(gdb) start
Temporary breakpoint 1 at 0x400a44
Starting program: /home/seth/demo/debuggy

Temporary breakpoint 1, 0x0000000000400a44 in main ()
(gdb)
```

如前所述，使用 `start` 命令进行：

```
(gdb) start
Temporary breakpoint 1 at 0x400a48: file debug.cpp, line 9.
Starting program: /home/sek/demo/debuggy

Temporary breakpoint 1, main () at debug.cpp:9
9       srand (time(NULL));
(gdb)
```

这一次，自动的 `main` 断点可以指明 GDB 暂停的行号和该行包含的代码。你可以用 `continue` 恢复正常操作，但你已经知道应用程序在完成之前就会崩溃，因此，你可以使用 `next` 关键字逐行步进检查你的代码：

```
(gdb) next
10  int alpha = rand() % 8;
(gdb) next
11  cout << "Hello world." << endl;
(gdb) next
Hello world.
12  int beta = 2;
(gdb) next
14      printf("alpha is set to is %s\n", alpha);
(gdb) next

Program received signal SIGSEGV, Segmentation fault.
0x00007ffff71c0c0b in vfprintf () from /lib64/libc.so.6
(gdb)
```

从这个过程可以确认，崩溃不是发生在设置 `beta` 变量的时候，而是执行 `printf` 行的时候。这个 bug 在本文中已经暴露了好几次（破坏者：向 `printf` 提供了错误的数据类型），但暂时假设解决方案仍然不明确，需要进一步调查。

### 设置断点

一旦你的代码被加载到 GDB 中，你就可以向 GDB 询问到目前为止代码所产生的数据。要尝试数据自省，通过再次发出 `start` 命令来重新启动你的应用程序，然后进行到第 11 行。一个快速到达 11 行的简单方法是设置一个寻找特定行号的断点：

```
(gdb) start
The program being debugged has been started already.
Start it from the beginning? (y or n) y
Temporary breakpoint 2 at 0x400a48: file debug.cpp, line 9.
Starting program: /home/sek/demo/debuggy

Temporary breakpoint 2, main () at debug.cpp:9
9       srand (time(NULL));
(gdb) break 11
Breakpoint 3 at 0x400a74: file debug.cpp, line 11.
```

建立断点后，用 `continue` 继续执行：

```
(gdb) continue
Continuing.

Breakpoint 3, main () at debug.cpp:11
11      cout << "Hello world." << endl;
(gdb)
```

现在暂停在第 11 行，就在 `alpha` 变量被设置之后，以及 `beta` 被设置之前。

### 用 GDB 进行变量自省

要查看一个变量的值，使用 `print` 命令。在这个示例代码中，`alpha` 的值是随机的，所以你的实际结果可能与我的不同：

```
(gdb) print alpha
$1 = 3
(gdb)
```

当然，你无法看到一个尚未建立的变量的值：

```
(gdb) print beta
$2 = 0
```


### 使用流程控制

要继续进行，你可以步进代码行来到达将 `beta` 设置为一个值的位置：

```
(gdb) next
Hello world.
12  int beta = 2;
(gdb) next
14  printf("alpha is set to is %s\n", alpha);
(gdb) print beta
$3 = 2
```

另外，你也可以设置一个观察点，它就像断点一样，是一种控制 GDB 执行代码流程的方法。在这种情况下，你知道 `beta` 变量应该设置为 `2`，所以你可以设置一个观察点，当 `beta` 的值发生变化时提醒你：

```
(gdb) watch beta > 0
Hardware watchpoint 5: beta > 0
(gdb) continue
Continuing.

Breakpoint 3, main () at debug.cpp:11
11      cout << "Hello world." << endl;
(gdb) continue
Continuing.
Hello world.

Hardware watchpoint 5: beta > 0

Old value = false
New value = true
main () at debug.cpp:14
14      printf("alpha is set to is %s\n", alpha);
(gdb)
```

你可以用 `next` 手动步进完成代码的执行，或者你可以用断点、观察点和捕捉点来控制代码的执行。

### 用 GDB 分析数据

你可以以不同格式查看数据。例如，以八进制值查看 `beta` 的值：

```
(gdb) print /o beta
$4 = 02
```

要查看其在内存中的地址：

```
(gdb) print /o &beta
$5 = 0x2
```

你也可以看到一个变量的数据类型：

```
(gdb) whatis beta
type = int
```

### 用 GDB 解决错误

这种自省不仅能让你更好地了解什么代码正在执行，还能让你了解它是如何执行的。在这个例子中，对变量运行的 `whatis` 命令给了你一个线索，即你的 `alpha` 和 `beta` 变量是整数，这可能会唤起你对 `printf` 语法的记忆，使你意识到在你的 `printf` 语句中，你必须使用 `%d` 来代替 `%s`。做了这个改变，就可以让应用程序按预期运行，没有更明显的错误存在。

当代码编译后发现有 bug 存在时，特别令人沮丧，但最棘手的 bug 就是这样，如果它们很容易被发现，那它们就不是 bug 了。使用 GDB 是猎取并消除它们的一种方法。

### 下载我们的速查表

生活的真相就是这样，即使是最基本的编程，代码也会有 bug。并不是所有的错误都会导致应用程序无法运行（甚至无法编译），也不是所有的错误都是由错误的代码引起的。有时，bug 是基于一个特别有创意的用户所做的意外的选择组合而间歇性发生的。有时，程序员从他们自己的代码中使用的库中继承了 bug。无论原因是什么，bug 基本上无处不在，程序员的工作就是发现并消除它们。

GNU 调试器是一个寻找 bug 的有用工具。你可以用它做的事情比我在本文中演示的要多得多。你可以通过 GNU Info 阅读器来了解它的许多功能：

```
$ info gdb
```

无论你是刚开始学习 GDB 还是专业人员的，提醒一下你有哪些命令是可用的，以及这些命令的语法是什么，都是很有帮助的。

- [下载 GDB 速查表][5]

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/3/debug-code-gdb

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/mistake_bug_fix_find_error.png?itok=PZaz3dga (magnifying glass on computer screen, finding a bug in the code)
[2]: https://www.gnu.org/software/gdb/
[3]: https://opensource.com/article/20/8/printf
[4]: https://linux.cn/article-12985-1.html
[5]: https://opensource.com/downloads/gnu-debugger-cheat-sheet

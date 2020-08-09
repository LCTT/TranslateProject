[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11647-1.html)
[#]: subject: (5 tips for GNU Debugger)
[#]: via: (https://opensource.com/article/19/9/tips-gnu-debugger)
[#]: author: (Tim Waugh https://opensource.com/users/twaugh)

5 个鲜为人知 GNU 调试器（GDB）技巧
======

> 了解如何使用 gdb 的一些鲜为人知的功能来检查和修复代码。

![](https://img.linux.net.cn/data/attachment/album/201912/05/203701ss8onfvpsnvnsnn5.jpg)

[GNU 调试器][2]（`gdb`）是一种宝贵的工具，可用于在开发程序时检查正在运行的进程并解决问题。

你可以在特定位置（按函数名称、行号等）设置断点、启用和禁用这些断点、显示和更改变量值，并执行所有调试器希望执行的所有标准操作。但是它还有许多其它你可能没有尝试过的功能。这里有五个你可以尝试一下。

### 条件断点

设置断点是学习使用 GNU 调试器的第一步。程序在达到断点时停止，你可以运行 `gdb` 的命令对其进行检查或更改变量，然后再允许该程序继续运行。

例如，你可能知道一个经常调用的函数有时会崩溃，但仅当它获得某个参数值时才会崩溃。你可以在该函数的开始处设置一个断点并运行程序。每次碰到该断点时都会显示函数参数，并且如果未提供触发崩溃的参数值，则可以继续操作，直到再次调用该函数为止。当这个惹了麻烦的参数触发崩溃时，你可以单步执行代码以查看问题所在。


```
(gdb) break sometimes_crashes
Breakpoint 1 at 0x40110e: file prog.c, line 5.
(gdb) run
[...]
Breakpoint 1, sometimes_crashes (f=0x7fffffffd1bc) at prog.c:5
5      fprintf(stderr,
(gdb) continue
Breakpoint 1, sometimes_crashes (f=0x7fffffffd1bc) at prog.c:5
5      fprintf(stderr,
(gdb) continue
```

为了使此方法更具可重复性，你可以在你感兴趣的特定调用之前计算该函数被调用的次数，并在该断点处设置一个计数器（例如，`continue 30` 以使其在接下来的 29 次到达该断点时忽略它）。

但是断点真正强大的地方在于它们在运行时评估表达式的能力，这使你可以自动化这种测试。

```
break [LOCATION] if CONDITION

(gdb) break sometimes_crashes if !f
Breakpoint 1 at 0x401132: file prog.c, line 5.
(gdb) run
[...]
Breakpoint 1, sometimes_crashes (f=0x0) at prog.c:5
5      fprintf(stderr,
(gdb)
```

条件断点使你不必让 `gdb` 每次调用该函数时都去问你要做什么，而是让条件断点仅在特定表达式的值为 `true` 时才使 `gdb` 停止在该位置。如果执行到达条件断点的位置，但表达式的计算结果为 `false`，调试器会自动使程序继续运行，而无需询问用户该怎么做。

### 断点命令

GNU 调试器中断点的一个甚至更复杂的功能是能够编写对到达断点的响应的脚本。断点命令使你可以编写一系列 GNU 调试器命令，以在到达该断点时运行。

我们可以使用它来规避在 `sometimes_crashes` 函数中我们已知的错误，并在它提供空指针时使其无害地从该函数返回。

我们可以使用 `silent` 作为第一行，以更好地控制输出。否则，每次命中断点时，即使在运行断点命令之前，也会显示堆栈帧。

```
(gdb) break sometimes_crashes
Breakpoint 1 at 0x401132: file prog.c, line 5.
(gdb) commands 1
Type commands for breakpoint(s) 1, one per line.
End with a line saying just "end".
>silent
>if !f
 >frame
 >printf "Skipping call\n"
 >return 0
 >continue
 >end
>printf "Continuing\n"
>continue
>end
(gdb) run
Starting program: /home/twaugh/Documents/GDB/prog
warning: Loadable section ".note.gnu.property" outside of ELF segments
Continuing
Continuing
Continuing
#0  sometimes_crashes (f=0x0) at prog.c:5
5      fprintf(stderr,
Skipping call
[Inferior 1 (process 9373) exited normally]
(gdb)
```

### 转储二进制内存

GNU 调试器内置支持使用 `x` 命令以各种格式检查内存，包括八进制、十六进制等。但是我喜欢并排看到两种格式：左侧为十六进制字节，右侧为相同字节表示的 ASCII 字符。

当我想逐字节查看文件的内容时，经常使用 `hexdump -C`（`hexdump` 来自 [util-linux][3] 软件包）。这是 `gdb` 的 `x` 命令显示的十六进制字节：

```
(gdb) x/33xb mydata
0x404040 <mydata>   :    0x02    0x01    0x00    0x02    0x00    0x00    0x00    0x01
0x404048 <mydata+8> :    0x01    0x47    0x00    0x12    0x61    0x74    0x74    0x72
0x404050 <mydata+16>:    0x69    0x62    0x75    0x74    0x65    0x73    0x2d    0x63
0x404058 <mydata+24>:    0x68    0x61    0x72    0x73    0x65    0x75    0x00    0x05
0x404060 <mydata+32>:    0x00
```

如果你想让 `gdb` 像 `hexdump` 一样显示内存怎么办？这是可以的，实际上，你可以将这种方法用于你喜欢的任何格式。

通过使用 `dump` 命令以将字节存储在文件中，结合 `shell` 命令以在文件上运行 `hexdump` 以及`define` 命令，我们可以创建自己的新的 `hexdump` 命令来使用 `hexdump` 显示内存内容。

```
(gdb) define hexdump
Type commands for definition of "hexdump".
End with a line saying just "end".
>dump binary memory /tmp/dump.bin $arg0 $arg0+$arg1
>shell hexdump -C /tmp/dump.bin
>end
```

这些命令甚至可以放在 `~/.gdbinit` 文件中，以永久定义 `hexdump` 命令。以下是它运行的例子：

```
(gdb) hexdump mydata sizeof(mydata)
00000000  02 01 00 02 00 00 00 01  01 47 00 12 61 74 74 72  |.........G..attr|
00000010  69 62 75 74 65 73 2d 63  68 61 72 73 65 75 00 05  |ibutes-charseu..|
00000020  00                                                |.|
00000021
```

### 行内反汇编

有时你想更多地了解导致崩溃的原因，而源代码还不够。你想查看在 CPU 指令级别发生了什么。

`disassemble` 命令可让你查看实现函数的 CPU 指令。但是有时输出可能很难跟踪。通常，我想查看与该函数源代码的特定部分相对应的指令。为此，请使用 `/s` 修饰符在反汇编中包括源代码行。

```
(gdb) disassemble/s main
Dump of assembler code for function main:
prog.c:
11    {
   0x0000000000401158 <+0>:    push   %rbp
   0x0000000000401159 <+1>:    mov      %rsp,%rbp
   0x000000000040115c <+4>:    sub      $0x10,%rsp

12      int n = 0;
   0x0000000000401160 <+8>:    movl   $0x0,-0x4(%rbp)

13      sometimes_crashes(&n);
   0x0000000000401167 <+15>:    lea     -0x4(%rbp),%rax
   0x000000000040116b <+19>:    mov     %rax,%rdi
   0x000000000040116e <+22>:    callq  0x401126 <sometimes_crashes>
[...snipped...]
```

这里，用 `info` 寄存器查看所有 CPU 寄存器的当前值，以及用如 `stepi` 这样命令一次执行一条指令，可以使你对程序有了更详细的了解。

### 反向调试

有时，你希望自己可以逆转时间。想象一下，你已经达到了变量的监视点。监视点像是一个断点，但不是在程序中的某个位置设置，而是在表达式上设置（使用 `watch` 命令）。每当表达式的值更改时，执行就会停止，并且调试器将获得控制权。

想象一下你已经达到了这个监视点，并且由该变量使用的内存已更改了值。事实证明，这可能是由更早发生的事情引起的。例如，内存已释放，现在正在重新使用。但是它是何时何地被释放的呢？

GNU 调试器甚至可以解决此问题，因为你可以反向运行程序！

它通过在每个步骤中仔细记录程序的状态来实现此目的，以便可以恢复以前记录的状态，从而产生时间倒流的错觉。

要启用此状态记录，请使用 `target record-full` 命令。然后，你可以使用一些听起来不太可行的命令，例如：

* `reverse-step`，倒退到上一个源代码行
* `*reverse-next`，它倒退到上一个源代码行，向后跳过函数调用
* `reverse-finish`，倒退到当前函数即将被调用的时刻
* `reverse-continue`，它返回到程序中的先前状态，该状态将（现在）触发断点（或其他导致断点停止的状态）

这是运行中的反向调试的示例：

```
(gdb) b main
Breakpoint 1 at 0x401160: file prog.c, line 12.
(gdb) r
Starting program: /home/twaugh/Documents/GDB/prog
[...]

Breakpoint 1, main () at prog.c:12
12      int n = 0;
(gdb) target record-full
(gdb) c
Continuing.

Program received signal SIGSEGV, Segmentation fault.
0x0000000000401154 in sometimes_crashes (f=0x0) at prog.c:7
7      return *f;
(gdb) reverse-finish
Run back to call of #0  0x0000000000401154 in sometimes_crashes (f=0x0)
        at prog.c:7
0x0000000000401190 in main () at prog.c:16
16      sometimes_crashes(0);
```

这些只是 GNU 调试器可以做的一些有用的事情。还有更多有待发现。你最喜欢 `gdb` 的哪个隐藏的、鲜为人知或令人吃惊的功能？请在评论中分享。

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/9/tips-gnu-debugger

作者：[Tim Waugh][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/twaugh
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/bug_software_issue_tracking_computer_screen.jpg?itok=6qfIHR5y (Bug tracking magnifying glass on computer screen)
[2]: https://www.gnu.org/software/gdb/
[3]: https://en.wikipedia.org/wiki/Util-linux

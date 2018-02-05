开发一个 Linux 调试器（十）：高级主题
============================================================ 

我们终于来到这个系列的最后一篇文章！这一次，我将对调试中的一些更高级的概念进行高层的概述：远程调试、共享库支持、表达式计算和多线程支持。这些想法实现起来比较复杂，所以我不会详细说明如何做，但是如果你有问题的话，我很乐意回答有关这些概念的问题。

### 系列索引

1.  [准备环境][1]
2.  [断点][2]
3.  [寄存器和内存][3]
4.  [Elves 和 dwarves][4]
5.  [源码和信号][5]
6.  [源码层逐步执行][6]
7.  [源码层断点][7]
8.  [调用栈][8]
9.  [处理变量][9]
10. [高级主题][10]

### 远程调试

远程调试对于嵌入式系统或对不同环境进行调试非常有用。它还在高级调试器操作和与操作系统和硬件的交互之间设置了一个很好的分界线。事实上，像 GDB 和 LLDB 这样的调试器即使在调试本地程序时也可以作为远程调试器运行。一般架构是这样的：

![debugarch](https://blog.tartanllama.xyz/assets/debugarch.png)

调试器是我们通过命令行交互的组件。也许如果你使用的是 IDE，那么在其上有另一个层可以通过_机器接口_与调试器进行通信。在目标机器上（可能与本机一样）有一个<ruby>调试存根<rt>debug stub</rt></ruby> ，理论上它是一个非常小的操作系统调试库的包装程序，它执行所有的低级调试任务，如在地址上设置断点。我说“在理论上”，因为如今调试存根变得越来越大。例如，我机器上的 LLDB 调试存根大小是 7.6MB。调试存根通过使用一些特定于操作系统的功能（在我们的例子中是 `ptrace`）和被调试进程以及通过远程协议的调试器通信。

最常见的远程调试协议是 GDB 远程协议。这是一种基于文本的数据包格式，用于在调试器和调试存根之间传递命令和信息。我不会详细介绍它，但你可以在[这里][11]进一步阅读。如果你启动 LLDB 并执行命令 `log enable gdb-remote packets`，那么你将获得通过远程协议发送的所有数据包的跟踪信息。在 GDB 上，你可以用 `set remotelogfile <file>` 做同样的事情。

作为一个简单的例子，这是设置断点的数据包：

```
$Z0,400570,1#43
```

`$` 标记数据包的开始。`Z0` 是插入内存断点的命令。`400570` 和 `1` 是参数，其中前者是设置断点的地址，后者是特定目标的断点类型说明符。最后，`#43` 是校验值，以确保数据没有损坏。

GDB 远程协议非常易于扩展自定义数据包，这对于实现平台或语言特定的功能非常有用。

### 共享库和动态加载支持

调试器需要知道被调试程序加载了哪些共享库，以便它可以设置断点、获取源代码级别的信息和符号等。除查找被动态链接的库之外，调试器还必须跟踪在运行时通过 `dlopen` 加载的库。为了达到这个目的，动态链接器维护一个 _交汇结构体_。该结构体维护共享库描述符的链表，以及一个指向每当更新链表时调用的函数的指针。这个结构存储在 ELF 文件的 `.dynamic` 段中，在程序执行之前被初始化。

一个简单的跟踪算法：

*   追踪程序在 ELF 头中查找程序的入口（或者可以使用存储在 `/proc/<pid>/aux` 中的辅助向量）。
*   追踪程序在程序的入口处设置一个断点，并开始执行。
*   当到达断点时，通过在 ELF 文件中查找 `.dynamic` 的加载地址找到交汇结构体的地址。
*   检查交汇结构体以获取当前加载的库的列表。
*   链接器更新函数上设置断点。
*   每当到达断点时，列表都会更新。
*   追踪程序无限循环，继续执行程序并等待信号，直到追踪程序信号退出。

我给这些概念写了一个小例子，你可以在[这里][12]找到。如果有人有兴趣，我可以将来写得更详细一点。

### 表达式计算

表达式计算是程序的一项功能，允许用户在调试程序时对原始源语言中的表达式进行计算。例如，在 LLDB 或 GDB 中，可以执行 `print foo()` 来调用 `foo` 函数并打印结果。

根据表达式的复杂程度，有几种不同的计算方法。如果表达式只是一个简单的标识符，那么调试器可以查看调试信息，找到该变量并打印出该值，就像我们在本系列最后一部分中所做的那样。如果表达式有点复杂，则可能将代码编译成中间表达式 （IR） 并解释来获得结果。例如，对于某些表达式，LLDB 将使用 Clang 将表达式编译为 LLVM IR 并将其解释。如果表达式更复杂，或者需要调用某些函数，那么代码可能需要 JIT 到目标并在被调试者的地址空间中执行。这涉及到调用 `mmap` 来分配一些可执行内存，然后将编译的代码复制到该块并执行。LLDB 通过使用 LLVM 的 JIT 功能来实现。

如果你想更多地了解 JIT 编译，我强烈推荐 [Eli Bendersky 关于这个主题的文章][13]。

### 多线程调试支持

本系列展示的调试器仅支持单线程应用程序，但是为了调试大多数真实程序，多线程支持是非常需要的。支持这一点的最简单的方法是跟踪线程的创建，并解析 procfs 以获取所需的信息。

Linux 线程库称为 `pthreads`。当调用 `pthread_create` 时，库会使用 `clone` 系统调用来创建一个新的线程，我们可以用 `ptrace` 跟踪这个系统调用（假设你的内核早于 2.5.46）。为此，你需要在连接到调试器之后设置一些 `ptrace` 选项：

```
ptrace(PTRACE_SETOPTIONS, m_pid, nullptr, PTRACE_O_TRACECLONE);
```

现在当 `clone` 被调用时，该进程将收到我们的老朋友 `SIGTRAP` 信号。对于本系列中的调试器，你可以将一个例子添加到 `handle_sigtrap` 来处理新线程的创建：

```
case (SIGTRAP | (PTRACE_EVENT_CLONE << 8)):
    //get the new thread ID
    unsigned long event_message = 0;
    ptrace(PTRACE_GETEVENTMSG, pid, nullptr, message);

    //handle creation
    //...
```

一旦收到了，你可以看看 `/proc/<pid>/task/` 并查看内存映射之类来获得所需的所有信息。

GDB 使用 `libthread_db`，它提供了一堆帮助函数，这样你就不需要自己解析和处理。设置这个库很奇怪，我不会在这展示它如何工作，但如果你想使用它，你可以去阅读[这个教程][14]。

多线程支持中最复杂的部分是调试器中线程状态的建模，特别是如果你希望支持[不间断模式][15]或当你计算中涉及不止一个 CPU 的某种异构调试。

### 最后！

呼！这个系列花了很长时间才写完，但是我在这个过程中学到了很多东西，我希望它是有帮助的。如果你有关于调试或本系列中的任何问题，请在 Twitter [@TartanLlama][16]或评论区联系我。如果你有想看到的其他任何调试主题，让我知道我或许会再发其他的文章。

--------------------------------------------------------------------------------

via: https://blog.tartanllama.xyz/writing-a-linux-debugger-advanced-topics/

作者：[Simon Brand][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.twitter.com/TartanLlama
[1]:https://linux.cn/article-8626-1.html
[2]:https://linux.cn/article-8645-1.html
[3]:https://linux.cn/article-8663-1.html
[4]:https://linux.cn/article-8719-1.html
[5]:https://linux.cn/article-8812-1.html
[6]:https://linux.cn/article-8813-1.html
[7]:https://linux.cn/article-8890-1.html
[8]:https://linux.cn/article-8930-1.html
[9]:https://linux.cn/article-8936-1.html
[10]:https://blog.tartanllama.xyz/writing-a-linux-debugger-advanced-topics/
[11]:https://sourceware.org/gdb/onlinedocs/gdb/Remote-Protocol.html
[12]:https://github.com/TartanLlama/dltrace
[13]:http://eli.thegreenplace.net/tag/code-generation
[14]:http://timetobleed.com/notes-about-an-odd-esoteric-yet-incredibly-useful-library-libthread_db/
[15]:https://sourceware.org/gdb/onlinedocs/gdb/Non_002dStop-Mode.html
[16]:https://twitter.com/TartanLlama

[调试器如何工作: Part 2 - 断点][26]
============================================================
这是调试器如何工作系列文章的第二部分，阅读本文前，请确保你已经读过[第一部分][27]。

### 关于本文

我不会去说明调试器如何打断点。断点是调试的两大利器之一，另一个是可以在调试进程的内存中检查变量值。我们在系列的第一部分已经预览过值检查啦，但是断点对我们来说依然神秘。不过本文过后，他们就不再如此了。

### 软件中断

为了在 x86 架构机器上实现断点，软件中断（也被称作 陷阱）被派上用场。在我们深入细节之前，我想先大致解释一下中断和陷阱的概念。

一个 CPU 有一条单独的执行流，一条指令接一条的执行 [[1]][19]。为了能够处理异步的事件，如 IO 和 硬件定时器，CPU 使用了中断。一个硬件中断通常是一个特定的电子信号，并附加了一个特别的”响应电路”。该电路通知中断激活，并让 CPU 停止当前执行，保存状态，然后跳转到一个预定义的地址，也就是处理中断程序的位置。当处理程序完成其工作后，CPU 又从之前停止的地方重新恢复运行。

软件中断在规则上与硬件相似，但实际操作中有些不同。CPU 支持一些特殊的指令，来允许软件模拟出一个中断。当这样的一个指令被执行时，CPU 像对待一个硬件中断那样 ———— 停止正常的执行流，保存状态，然后跳转到一个处理程序。这种 ”陷阱” 使得许多现代操作系统的惊叹设计得以高效地实现（如任务调度，虚拟内存，内存保护，调试）

许多编程错误（如被 0 除）也被 CPU 当做陷阱对待，常常也叫做”异常”， 这时候硬件和软件中断之间的界限就模糊了，很难说这种异常到底是硬件中断还是软件中断。但我已经偏离今天主题太远了，所以现在让我们回到断点上来。

### int 3 理论

前面说了很多，现在简单来说断点就是一个部署在 CPU 上的特殊陷阱，叫 int 3。int 是一个 “陷阱指令”的 x86 术语，该指令是对一个预定义中断处理的调用。x86 支持 8 位的 int 指令操作数，决定了中断的数量，所以理论上可以支持 256 个陷阱。前 32 个陷阱为 CPU 自己保留，and number 3 is the one we're interested in here - it's called "trap to debugger".

避免更深的解释，我将引用理论本身一段话[[2]][20]。

> The INT 3 instruction generates a special one byte opcode (CC) that is intended for calling the debug exception handler. (This one byte form is valuable because it can be used to replace the first byte of any instruction with a breakpoint, including other one byte instructions, without over-writing other code).

上述引用非常重要，但是目前去解释它还是为时过早。本文后面我们会回过头再看。

### int 3 实践

没错，知道事物背后的理论非常不错，不过，这些理论到底意思是啥？我们怎样使用 int 3 部署断点？或者怎么翻译成通用的编程术语 ———— _请给我看代码！_

实际上，实现非常简单。一旦你的程序执行了 int 3 指令，操作系统就会停止程序 [[3]][21]。在 Linux（这也是本文比较关心的地方） 上，操作系统会发送给进程一个信号 ——  SIGTRAP。


That's all there is to it - honest! Now recall from the first part of the series that a tracing (debugger) process gets notified of all the signals its child (or the process it attaches to for debugging) gets, and you can start getting a feel of where we're going.

That's it, no more computer architecture 101 jabber. It's time for examples and code.

### 手动设置断点

现在我要演示在程序里设置断点的代码。我要使用的程序如下：

```
section    .text
    ; The _start symbol must be declared for the linker (ld)
    global _start

_start:

    ; Prepare arguments for the sys_write system call:
    ;   - eax: system call number (sys_write)
    ;   - ebx: file descriptor (stdout)
    ;   - ecx: pointer to string
    ;   - edx: string length
    mov     edx, len1
    mov     ecx, msg1
    mov     ebx, 1
    mov     eax, 4

    ; Execute the sys_write system call
    int     0x80

    ; Now print the other message
    mov     edx, len2
    mov     ecx, msg2
    mov     ebx, 1
    mov     eax, 4
    int     0x80

    ; Execute sys_exit
    mov     eax, 1
    int     0x80

section    .data

msg1    db      'Hello,', 0xa
len1    equ     $ - msg1
msg2    db      'world!', 0xa
len2    equ     $ - msg2
```

我现在在使用汇编语言，是为了当我们面对 C 代码的时候，能清楚一些编译细节。上面代码做的事情非常简单，就是在一行打印出“hello,”，然后在下一行打印出“world!”。这与之前文章中的程序非常类似。

现在我想在第一次打印和第二次打印之间设置一个断点。我们看到在第一条 int 0x80 后面，指令 mov edx, len2。首先，我们需要知道该指令所映射的地址。运行 objdump -d:

```
traced_printer2:     file format elf32-i386

Sections:
Idx Name          Size      VMA       LMA       File off  Algn
  0 .text         00000033  08048080  08048080  00000080  2**4
                  CONTENTS, ALLOC, LOAD, READONLY, CODE
  1 .data         0000000e  080490b4  080490b4  000000b4  2**2
                  CONTENTS, ALLOC, LOAD, DATA

Disassembly of section .text:

08048080 <.text>:
 8048080:     ba 07 00 00 00          mov    $0x7,%edx
 8048085:     b9 b4 90 04 08          mov    $0x80490b4,%ecx
 804808a:     bb 01 00 00 00          mov    $0x1,%ebx
 804808f:     b8 04 00 00 00          mov    $0x4,%eax
 8048094:     cd 80                   int    $0x80
 8048096:     ba 07 00 00 00          mov    $0x7,%edx
 804809b:     b9 bb 90 04 08          mov    $0x80490bb,%ecx
 80480a0:     bb 01 00 00 00          mov    $0x1,%ebx
 80480a5:     b8 04 00 00 00          mov    $0x4,%eax
 80480aa:     cd 80                   int    $0x80
 80480ac:     b8 01 00 00 00          mov    $0x1,%eax
 80480b1:     cd 80                   int    $0x80
```

所以，我们要设置断点的地址是 0x8048096\。等等，这不是调试器工作的真是姿势，不是吗？真正的调试器是在代码行和函数上设置断点，而不是赤裸裸的内存地址？完全正确，但是目前我们仍然还没到那一步，为了更像_真正的_调试器一样设置断点，我们仍不得不首先理解一些符号和调试信息。所以现在，我们就得面对内存地址。

在这点上，我真想又偏离一下主题。所以现在你有两个选择，如果你真的感兴趣想知道_为什么_那个地址应该是 0x8048096，它代表着什么，那就看下面的部分。否则你只是想了解断点，你可以跳过这部分。

### 题外话 —— 程序地址和入口

坦白说，0x8048096 本身没多大意义，仅仅是偏移可执行 text 部分开端的一些字节。如果你看上面导出来的列表，你会看到 text 部分从地址 0x08048080\ 开始。这告诉操作系统在分配给进程的虚拟地址空间里，将该地址映射到 text 部分开始的地方。在 Linux 上面，这些地址可以是绝对地址（i.e. 当这些），因为通过虚拟地址系统，每个进程获得自己的一块内存，并且将整个 32 位地址空间看着自己的（称为 “线性” 地址）。

如果我们使用 readelf 命令检查 ELF 文件头部，我们会看到：

```
$ readelf -h traced_printer2
ELF Header:
  Magic:   7f 45 4c 46 01 01 01 00 00 00 00 00 00 00 00 00
  Class:                             ELF32
  Data:                              2's complement, little endian
  Version:                           1 (current)
  OS/ABI:                            UNIX - System V
  ABI Version:                       0
  Type:                              EXEC (Executable file)
  Machine:                           Intel 80386
  Version:                           0x1
  Entry point address:               0x8048080
  Start of program headers:          52 (bytes into file)
  Start of section headers:          220 (bytes into file)
  Flags:                             0x0
  Size of this header:               52 (bytes)
  Size of program headers:           32 (bytes)
  Number of program headers:         2
  Size of section headers:           40 (bytes)
  Number of section headers:         4
  Section header string table index: 3
```

注意头部里的 "entry point address"，它同样指向 0x8048080\。所以我们在系统层面解释该 elf 文件的编码信息，它意思是：
1. 映射 text 部分（包含所给的内容）到地址 0x8048080
2. 从入口 —— 地址 0x8048080 处开始执行

但是，为什么是 0x8048080 呢？事实证明是一些历史原因。一些 google 的结果把我引向源头，声明每个进程的地址空间的前 128M 是保留在栈里的。128M 对应为 0x8000000，该地址是可执行程序其他部分可能开始的地方。而 0x8048080，比较特别，是 Linux ld 链接器用作默认的入口地址。该入口可以通过给 ld 传递 -Ttextargument 参数改变。

总结一下，这地址没啥特别的，我们可以随意修改它。只要 ELF 可执行文件被合理的组织，并且头部里的入口地址与真正的程序代码（text 部分）开始的地址匹配，一切都没问题。




--------------------------------------------------------------------------------

via: http://eli.thegreenplace.net/2011/01/27/how-debuggers-work-part-2-breakpoints

作者：[Eli Bendersky][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://eli.thegreenplace.net/
[1]:http://eli.thegreenplace.net/2011/01/27/how-debuggers-work-part-2-breakpoints#id1
[2]:http://en.wikipedia.org/wiki/Out-of-order_execution
[3]:http://eli.thegreenplace.net/2011/01/27/how-debuggers-work-part-2-breakpoints#id2
[4]:http://eli.thegreenplace.net/2011/01/27/how-debuggers-work-part-2-breakpoints#id3
[5]:http://eli.thegreenplace.net/2011/01/27/how-debuggers-work-part-2-breakpoints#id4
[6]:http://eli.thegreenplace.net/2011/01/27/how-debuggers-work-part-2-breakpoints#id5
[7]:http://en.wikipedia.org/wiki/Executable_and_Linkable_Format
[8]:http://eli.thegreenplace.net/2011/01/27/how-debuggers-work-part-2-breakpoints#id6
[9]:http://eli.thegreenplace.net/tag/articles
[10]:http://eli.thegreenplace.net/tag/debuggers
[11]:http://eli.thegreenplace.net/tag/programming
[12]:http://www.alexonlinux.com/how-debugger-works
[13]:http://www.linuxforums.org/articles/understanding-elf-using-readelf-and-objdump_125.html
[14]:http://mainisusuallyafunction.blogspot.com/2011/01/implementing-breakpoints-on-x86-linux.html
[15]:http://www.nasm.us/xdoc/2.09.04/html/nasmdoc0.html
[16]:http://stackoverflow.com/questions/2187484/elf-binary-entry-point
[17]:http://news.ycombinator.net/item?id=2131894
[18]:http://www.deansys.com/doc/gdbInternals/gdbint_toc.html
[19]:http://eli.thegreenplace.net/2011/01/27/how-debuggers-work-part-2-breakpoints#id7
[20]:http://eli.thegreenplace.net/2011/01/27/how-debuggers-work-part-2-breakpoints#id8
[21]:http://eli.thegreenplace.net/2011/01/27/how-debuggers-work-part-2-breakpoints#id9
[22]:http://eli.thegreenplace.net/2011/01/27/how-debuggers-work-part-2-breakpoints#id10
[23]:http://eli.thegreenplace.net/2011/01/27/how-debuggers-work-part-2-breakpoints#id11
[24]:http://eli.thegreenplace.net/2011/01/27/how-debuggers-work-part-2-breakpoints#id12
[25]:https://github.com/eliben/code-for-blog/tree/master/2011/debuggers_part2_code
[26]:http://eli.thegreenplace.net/2011/01/27/how-debuggers-work-part-2-breakpoints
[27]:http://eli.thegreenplace.net/2011/01/23/how-debuggers-work-part-1/

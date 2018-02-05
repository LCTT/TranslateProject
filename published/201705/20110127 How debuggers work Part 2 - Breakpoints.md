调试器工作原理（二）：断点
============================================================

这是调试器工作原理系列文章的第二部分，阅读本文前，请确保你已经读过[第一部分][27]。

### 关于本文

我将会演示如何在调试器中实现断点。断点是调试的两大利器之一，另一个是可以在被调试进程的内存中检查变量值。我们在系列的第一部分已经了解过值检查，但是断点对我们来说依然神秘。不过本文过后，它们就不再如此了。

### 软件中断

为了在 x86 架构机器上实现断点，软件中断（也被称作“陷阱”）被会派上用场。在我们深入细节之前，我想先大致解释一下中断和陷阱的概念。

CPU 有一条单独的执行流，一条指令接一条的执行（在更高的层面看是这样的，但是在底层的细节上来说，现在的许多 CPU 都会并行执行多个指令，这其中的一些指令就不是按照原本的顺序执行的）。为了能够处理异步的事件，如 IO 和 硬件定时器，CPU 使用了中断。硬件中断通常是一个特定的电子信号，并附加了一个特别的”响应电路”。该电路通知中断激活，并让 CPU 停止当前执行，保存状态，然后跳转到一个预定义的地址，也就是中断处理程序的位置。当处理程序完成其工作后，CPU 又从之前停止的地方重新恢复运行。

软件中断在规则上与硬件相似，但实际操作中有些不同。CPU 支持一些特殊的指令，来允许软件模拟出一个中断。当这样的一个指令被执行时，CPU 像对待一个硬件中断那样 —— 停止正常的执行流，保存状态，然后跳转到一个处理程序。这种“中断”使得许多现代 OS 的惊叹设计得以高效地实现（如任务调度，虚拟内存，内存保护，调试）。

许多编程错误（如被 0 除）也被 CPU 当做中断对待，常常也叫做“异常”， 这时候硬件和软件中断之间的界限就模糊了，很难说这种异常到底是硬件中断还是软件中断。但我已经偏离今天主题太远了，所以现在让我们回到断点上来。

### int 3 理论

前面说了很多，现在简单来说断点就是一个部署在 CPU 上的特殊中断，叫 `int 3`。`int` 是一个 “中断指令”的 x86 术语，该指令是对一个预定义中断处理的调用。x86 支持 8 位的 int 指令操作数，这决定了中断的数量，所以理论上可以支持 256 个中断。前 32 个中断为 CPU 自己保留，而 int 3 就是本文关注的 —— 它被叫做 “调试器专用中断”。

避免更深的解释，我将引用“圣经”里一段话（这里说的“圣经”，当然指的是英特尔的体系结构软件开发者手册, 卷 2A）。

> INT 3 指令生成一个以字节操作码（CC），用于调用该调试异常处理程序。（这个一字节格式是非常有用的，因为它可以用于使用断点来替换任意指令的第一个字节 ，包括哪些一字节指令，而不会覆写其它代码）

上述引用非常重要，但是目前去解释它还是为时过早。本文后面我们会回过头再看。

### int 3 实践

没错，知道事物背后的理论非常不错，不过，这些理论到底意思是啥？我们怎样使用 `int 3` 部署断点？或者怎么翻译成通用的编程术语 —— _请给我看代码！_

实际上，实现非常简单。一旦你的程序执行了 `int 3` 指令， OS 就会停止程序（ OS 是怎么做到像这样停止进程的？ OS 注册其 int 3 的控制程序到 CPU 即可，就这么简单）。在 Linux（这也是本文比较关心的地方） 上， OS 会发送给进程一个信号 ——  `SIGTRAP`。

就是这样，真的。现在回想一下本系列的第一部分, 追踪进程（调试程序） 会得到其子进程（或它所连接的被调试进程）所得到的所有信号的通知，接下来你就知道了。

就这样, 没有更多的电脑架构基础术语了。该是例子和代码的时候了。

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

我现在在使用汇编语言，是为了当我们面对 C 代码的时候，能清楚一些编译细节。上面代码做的事情非常简单，就是在一行打印出 “hello,”，然后在下一行打印出 “world!”。这与之前文章中的程序非常类似。

现在我想在第一次打印和第二次打印之间设置一个断点。我们看到在第一条 `int 0x80` ，其后指令是 `mov edx, len2`。（等等，再次 int？是的，Linux 使用 `int 0x80` 来实现用户进程到系统内核的系统调用。用户将系统调用的号码及其参数放到寄存器，并执行 `int 0x80`。然后 CPU 会跳到相应的中断处理程序，其中， OS 注册了一个过程，该过程查看寄存器并决定要执行的系统调用。）首先，我们需要知道该指令所映射的地址。运行 `objdump -d`:

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

所以，我们要设置断点的地址是 `0x8048096`。等等，这不是调试器工作的真实姿势，对吧？真正的调试器是在代码行和函数上设置断点，而不是赤裸裸的内存地址？完全正确，但是目前我们仍然还没到那一步，为了更像_真正的_调试器一样设置断点，我们仍不得不首先理解一些符号和调试信息。所以现在，我们就得面对内存地址。

在这点上，我真想又偏离一下主题。所以现在你有两个选择，如果你真的感兴趣想知道_为什么_那个地址应该是 `0x8048096`，它代表着什么，那就看下面的部分。否则你只是想了解断点，你可以跳过这部分。

### 题外话 —— 程序地址和入口

坦白说，`0x8048096` 本身没多大意义，仅仅是可执行程序的 text 部分开端偏移的一些字节。如果你看上面导出来的列表，你会看到 text 部分从地址 `0x08048080` 开始。这告诉 OS 在分配给进程的虚拟地址空间里，将该地址映射到 text 部分开始的地方。在 Linux 上面，这些地址可以是绝对地址（例如，当可执行程序加载到内存中时它不做重定位），因为通过虚拟地址系统，每个进程获得自己的一块内存，并且将整个 32 位地址空间看做自己的（称为 “线性” 地址）。

如果我们使用 `readelf` 命令检查 ELF 文件头部（ELF，可执行和可链接格式，是 Linux 上用于对象文件、共享库和可执行程序的文件格式），我们会看到：

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

注意头部里的 `Entry point address`，它同样指向 `0x8048080`。所以我们在系统层面解释该 elf 文件的编码信息，它意思是：

1. 映射 text 部分（包含所给的内容）到地址 `0x8048080`
2. 从入口 —— 地址 `0x8048080` 处开始执行

但是，为什么是 `0x8048080` 呢？事实证明是一些历史原因。一些 Google 的结果把我引向源头，宣传每个进程的地址空间的前 128M 是保留在栈里的。128M 对应为 `0x8000000`，该地址是可执行程序其他部分可以开始的地方。而 `0x8048080`，比较特别，是 Linux `ld` 链接器使用的默认入口地址。该入口可以通过给 `ld` 传递 `-Ttext` 参数改变。

总结一下，这地址没啥特别的，我们可以随意修改它。只要 ELF 可执行文件被合理的组织，并且头部里的入口地址与真正的程序代码（text 部分）开始的地址匹配，一切都没问题。

### 用 int 3 在调试器中设置断点

为了在被追踪进程的某些目标地址设置一个断点，调试器会做如下工作：

1. 记住存储在目标地址的数据
2. 用 int 指令替换掉目标地址的第一个字节

然后，当调试器要求 OS 运行该进程的时候（通过上一篇文章中提过的 `PTRACE_CONT`），进程就会运行起来直到遇到 `int 3`，此处进程会停止运行，并且 OS 会发送一个信号给调试器。调试器会收到一个信号表明其子进程（或者说被追踪进程）停止了。调试器可以做以下工作：

1. 在目标地址，用原来的正常执行指令替换掉 int 3 指令
2. 将被追踪进程的指令指针回退一步。这是因为现在指令指针位于刚刚执行过的 int 3 之后。
3. 允许用户以某些方式与进程交互，因为该进程仍然停止在特定的目标地址。这里你的调试器可以让你取得变量值，调用栈等等。
4. 当用户想继续运行，调试器会小心地把断点放回目标地址去（因为它在第 1 步时被移走了），除非用户要求取消该断点。

让我们来看看，这些步骤是如何翻译成具体代码的。我们会用到第一篇里的调试器 “模板”（fork 一个子进程并追踪它）。无论如何，文末会有一个完整样例源代码的链接

```
/* Obtain and show child's instruction pointer */
ptrace(PTRACE_GETREGS, child_pid, 0, &regs);
procmsg("Child started. EIP = 0x%08x\n", regs.eip);

/* Look at the word at the address we're interested in */
unsigned addr = 0x8048096;
unsigned data = ptrace(PTRACE_PEEKTEXT, child_pid, (void*)addr, 0);
procmsg("Original data at 0x%08x: 0x%08x\n", addr, data);
```

这里调试器从被追踪的进程中取回了指令指针，也检查了在 `0x8048096` 的字。当开始追踪运行文章开头的汇编代码，将会打印出：

```
[13028] Child started. EIP = 0x08048080
[13028] Original data at 0x08048096: 0x000007ba
```

目前为止都看起来不错。接下来：

```
/* Write the trap instruction 'int 3' into the address */
unsigned data_with_trap = (data & 0xFFFFFF00) | 0xCC;
ptrace(PTRACE_POKETEXT, child_pid, (void*)addr, (void*)data_with_trap);

/* See what's there again... */
unsigned readback_data = ptrace(PTRACE_PEEKTEXT, child_pid, (void*)addr, 0);
procmsg("After trap, data at 0x%08x: 0x%08x\n", addr, readback_data);
```

注意到 `int 3` 是如何被插入到目标地址的。此处打印：

```
[13028] After trap, data at 0x08048096: 0x000007cc
```

正如预料的那样 —— `0xba` 被 `0xcc` 替换掉了。现在调试器运行子进程并等待它在断点处停止：

```
/* Let the child run to the breakpoint and wait for it to
** reach it
*/
ptrace(PTRACE_CONT, child_pid, 0, 0);

wait(&wait_status);
if (WIFSTOPPED(wait_status)) {
    procmsg("Child got a signal: %s\n", strsignal(WSTOPSIG(wait_status)));
}
else {
    perror("wait");
    return;
}

/* See where the child is now */
ptrace(PTRACE_GETREGS, child_pid, 0, &regs);
procmsg("Child stopped at EIP = 0x%08x\n", regs.eip);
```

这里打印出：

```
Hello,
[13028] Child got a signal: Trace/breakpoint trap
[13028] Child stopped at EIP = 0x08048097
```

注意到 “Hello,” 在断点前打印出来了 —— 完全如我们计划的那样。同时注意到子进程停止的地方 —— 刚好就是单字节中断指令后面。

最后，如早先诠释的那样，为了让子进程继续运行，我们得做一些工作。我们用原来的指令替换掉中断指令，并且让进程从这里继续之前的运行。

```
/* Remove the breakpoint by restoring the previous data
** at the target address, and unwind the EIP back by 1 to
** let the CPU execute the original instruction that was
** there.
*/
ptrace(PTRACE_POKETEXT, child_pid, (void*)addr, (void*)data);
regs.eip -= 1;
ptrace(PTRACE_SETREGS, child_pid, 0, &regs);

/* The child can continue running now */
ptrace(PTRACE_CONT, child_pid, 0, 0);
```

这会使子进程继续打印出 “world！”，然后退出。

注意，我们在这里没有恢复断点。通过在单步调试模式下，运行原来的指令，然后将中断放回去，并且只在运行 PTRACE_CONT 时做到恢复断点。文章稍后会展示 debuglib 如何做到这点。

### 更多关于 int 3

现在可以回过头去看看 `int 3` 和因特尔手册里那个神秘的说明，原文如下：


> 这个一字节格式是非常有用的，因为它可以用于使用断点来替换任意指令的第一个字节 ，包括哪些一字节指令，而不会覆写其它代码

int 指令在 x86 机器上占两个字节 —— `0xcd` 紧跟着中断数（细心的读者可以在上面列出的转储中发现 `int 0x80` 翻译成了 `cd 80`）。`int 3` 被编码为 `cd 03`，但是为其还保留了一个单字节指令 —— `0xcc`。

为什么这样呢？因为这可以允许我们插入一个断点，而不需要重写多余的指令。这非常重要，考虑下面的代码：

```
    .. some code ..
    jz    foo
    dec   eax
foo:
    call  bar
    .. some code ..
```

假设你想在 `dec eax` 这里放置一个断点。这对应一个单字节指令（操作码为 `0x48`）。由于替换断点的指令长于一个字节，我们不得不强制覆盖掉下个指令（`call`）的一部分，这就会篡改 `call` 指令，并很可能导致一些完全不合理的事情发生。这样一来跳转到 `foo` 分支的 `jz foo` 指令会导致什么？就会不在 dec eax 这里停止，CPU 径直去执行后面一些无效的指令了。

而有了单字节的 `int 3` 指令，这个问题就解决了。 1 字节是在 x86 上面所能找到的最短指令，这样我们可以保证仅改变我们想中断的指令。

### 封装一些晦涩的细节

很多上述章节样例代码的底层细节，都可以很容易封装在方便使用的 API 里。我已经做了很多封装的工作，将它们都放在一个叫做 debuglib 的通用库里 —— 文末可以去下载。这里我仅仅是想展示它的用法示例，但是绕了一圈。下面我们将追踪一个用 C 写的程序。

### 追踪一个 C 程序地址和入口

目前为止，为了简单，我把注意力放在了目标汇编代码。现在是时候往上一个层次，去看看我们如何追踪一个 C 程序。

事实证明并不是非常难 —— 找到放置断点位置有一点难罢了。考虑下面样例程序：

```
#include <stdio.h>

void do_stuff()
{
    printf("Hello, ");
}

int main()
{
    for (int i = 0; i < 4; ++i)
        do_stuff();
    printf("world!\n");
    return 0;
}
``` 

假设我想在 `do_stuff` 入口处放置一个断点。我会先使用 `objdump` 反汇编一下可执行文件，但是打印出的东西太多。尤其看到很多无用，也不感兴趣的 C 程序运行时的初始化代码。所以我们仅看一下 `do_stuff` 部分：

```
080483e4 <do_stuff>:
 80483e4:     55                      push   %ebp
 80483e5:     89 e5                   mov    %esp,%ebp
 80483e7:     83 ec 18                sub    $0x18,%esp
 80483ea:     c7 04 24 f0 84 04 08    movl   $0x80484f0,(%esp)
 80483f1:     e8 22 ff ff ff          call   8048318 <puts@plt>
 80483f6:     c9                      leave
 80483f7:     c3                      ret
```

那么，我们将会把断点放在 `0x080483e4`，这是 `do_stuff` 第一条指令执行的地方。而且，该函数是在循环里面调用的，我们想要在断点处一直停止执行直到循环结束。我们将会使用 debuglib 来简化该流程，下面是完整的调试函数：

```
void run_debugger(pid_t child_pid)
{
    procmsg("debugger started\n");

    /* Wait for child to stop on its first instruction */
    wait(0);
    procmsg("child now at EIP = 0x%08x\n", get_child_eip(child_pid));

    /* Create breakpoint and run to it*/
    debug_breakpoint* bp = create_breakpoint(child_pid, (void*)0x080483e4);
    procmsg("breakpoint created\n");
    ptrace(PTRACE_CONT, child_pid, 0, 0);
    wait(0);

    /* Loop as long as the child didn't exit */
    while (1) {
        /* The child is stopped at a breakpoint here. Resume its
        ** execution until it either exits or hits the
        ** breakpoint again.
        */
        procmsg("child stopped at breakpoint. EIP = 0x%08X\n", get_child_eip(child_pid));
        procmsg("resuming\n");
        int rc = resume_from_breakpoint(child_pid, bp);

        if (rc == 0) {
            procmsg("child exited\n");
            break;
        }
        else if (rc == 1) {
            continue;
        }
        else {
            procmsg("unexpected: %d\n", rc);
            break;
        }
    }

    cleanup_breakpoint(bp);
}
```

为了避免修改 EIP 标志位和目的进程的内存空间的麻烦，我们仅需要调用 `create_breakpoint`，`resume_from_breakpoint` 和 `cleanup_breakpoint`。让我们来看看追踪上面的 C 代码样例会输出什么：

```
$ bp_use_lib traced_c_loop
[13363] debugger started
[13364] target started. will run 'traced_c_loop'
[13363] child now at EIP = 0x00a37850
[13363] breakpoint created
[13363] child stopped at breakpoint. EIP = 0x080483E5
[13363] resuming
Hello,
[13363] child stopped at breakpoint. EIP = 0x080483E5
[13363] resuming
Hello,
[13363] child stopped at breakpoint. EIP = 0x080483E5
[13363] resuming
Hello,
[13363] child stopped at breakpoint. EIP = 0x080483E5
[13363] resuming
Hello,
world!
[13363] child exited
```

如预期一样！

### 样例代码

[这里是][25]本文用到的完整源代码文件。在归档中你可以找到：

*   debuglib.h 和 debuglib.c - 封装了调试器的一些内部工作的示例库
*   bp_manual.c -  这篇文章开始部分介绍的“手动”设置断点的方法。一些样板代码使用了 debuglib 库。
*   bp_use_lib.c - 大部分代码使用了 debuglib 库，用于在第二个代码范例中演示在 C 程序的循环中追踪。

### 引文

在准备本文的时候，我搜集了如下的资源和文章：

*   [How debugger works][12]
*   [Understanding ELF using readelf and objdump][13]
*   [Implementing breakpoints on x86 Linux][14]
*   [NASM manual][15]
*   [SO discussion of the ELF entry point][16]
*   [This Hacker News discussion][17] of the first part of the series
*   [GDB Internals][18]


--------------------------------------------------------------------------------

via: http://eli.thegreenplace.net/2011/01/27/how-debuggers-work-part-2-breakpoints

作者：[Eli Bendersky][a]
译者：[wi-cuckoo](https://github.com/wi-cuckoo)
校对：[wxy](https://github.com/wxy)

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
[27]:https://linux.cn/article-8418-1.html

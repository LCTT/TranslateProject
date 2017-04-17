调试器的工作原理（一）：基础篇
============================================================

这是调试器工作原理系列文章的第一篇，我不确定这个系列会有多少篇文章，会涉及多少话题，但我仍会从这篇基础开始。

### 这一篇会讲什么

我将为大家展示 Linux 中调试器的主要构成模块 - `ptrace` 系统调用。这篇文章所有代码都是基于 32 位 Ubuntu 操作系统。值得注意的是，尽管这些代码是平台相关的，将它们移植到其它平台应该并不困难。

### 缘由

为了理解我们要做什么，让我们先考虑下调试器为了完成调试都需要什么资源。调试器可以开始一个进程并调试这个进程，又或者将自己同某个已经存在的进程关联起来。调试器能够单步执行代码，设定断点并且将程序执行到断点，检查变量的值并追踪堆栈。许多调试器有着更高级的特性，例如在调试器的地址空间内执行表达式或者调用函数，甚至可以在进程执行过程中改变代码并观察效果。

尽管现代的调试器都十分的复杂（我没有检查，但我确信 gdb 的代码行数至少有六位数），但它们的工作的原理却是十分的简单。调试器的基础是操作系统与编译器 / 链接器提供的一些基础服务，其余的部分只是[简单的编程][14]而已。

### Linux 的调试 - ptrace

Linux 调试器中的瑞士军刀便是 `ptrace` 系统调用（使用 man 2 ptrace 命令可以了解更多）。这是一种复杂却强大的工具，可以允许一个进程控制另外一个进程并从<ruby>内部替换<rt>Peek and poke</rt></ruby>被控制进程的内核镜像的值（Peek and poke 在系统编程中是很知名的叫法，指的是直接读写内存内容）。

接下来会深入分析。

### 执行进程的代码

我将编写一个示例，实现一个在“跟踪”模式下运行的进程。在这个模式下，我们将单步执行进程的代码，就像机器码（汇编代码）被 CPU 执行时一样。我将分段展示、讲解示例代码，在文章的末尾也有完整 c 文件的下载链接，你可以编译、执行或者随心所欲的更改。

更进一步的计划是实现一段代码，这段代码可以创建可执行用户自定义命令的子进程，同时父进程可以跟踪子进程。首先是主函数：

```
int main(int argc, char** argv)
{
    pid_t child_pid;

    if (argc < 2) {
        fprintf(stderr, "Expected a program name as argument\n");
        return -1;
    }

    child_pid = fork();
    if (child_pid == 0)
        run_target(argv[1]);
    else if (child_pid > 0)
        run_debugger(child_pid);
    else {
        perror("fork");
        return -1;
    }

    return 0;
}
```

看起来相当的简单：我们用 `fork` 创建了一个新的子进程（这篇文章假定读者有一定的 Unix/Linux 编程经验。我假定你知道或至少了解 fork、exec 族函数与 Unix 信号）。if 语句的分支执行子进程（这里称之为 “target”），`else if` 的分支执行父进程（这里称之为 “debugger”）。

下面是 target 进程的代码：

```
void run_target(const char* programname)
{
    procmsg("target started. will run '%s'\n", programname);

    /* Allow tracing of this process */
    if (ptrace(PTRACE_TRACEME, 0, 0, 0) < 0) {
        perror("ptrace");
        return;
    }

    /* Replace this process's image with the given program */
    execl(programname, programname, 0);
}
```

这段代码中最值得注意的是 `ptrace` 调用。在 `sys/ptrace.h` 中，`ptrace` 是如下定义的：

```
long ptrace(enum __ptrace_request request, pid_t pid,
                 void *addr, void *data);
```

第一个参数是 `_request_`，这是许多预定义的 `PTRACE_*` 常量中的一个。第二个参数为请求分配进程 ID。第三个与第四个参数是地址与数据指针，用于操作内存。上面代码段中的 `ptrace` 调用发起了 `PTRACE_TRACEME` 请求，这意味着该子进程请求系统内核让其父进程跟踪自己。帮助页面上对于 request 的描述很清楚： 

> 意味着该进程被其父进程跟踪。任何传递给该进程的信号（除了 `SIGKILL`）都将通过 `wait()` 方法阻塞该进程并通知其父进程。**此外，该进程的之后所有调用 `exec()` 动作都将导致 `SIGTRAP` 信号发送到此进程上，使得父进程在新的程序执行前得到取得控制权的机会**。如果一个进程并不需要它的的父进程跟踪它，那么这个进程不应该发送这个请求。（pid、addr 与 data 暂且不提）

我高亮了这个例子中我们需要注意的部分。在 `ptrace` 调用后，`run_target` 接下来要做的就是通过 `execl` 传参并调用。如同高亮部分所说明，这将导致系统内核在 `execl` 创建进程前暂时停止，并向父进程发送信号。

是时候看看父进程做什么了。

```
void run_debugger(pid_t child_pid)
{
    int wait_status;
    unsigned icounter = 0;
    procmsg("debugger started\n");

    /* Wait for child to stop on its first instruction */
    wait(&wait_status);

    while (WIFSTOPPED(wait_status)) {
        icounter++;
        /* Make the child execute another instruction */
        if (ptrace(PTRACE_SINGLESTEP, child_pid, 0, 0) < 0) {
            perror("ptrace");
            return;
        }

        /* Wait for child to stop on its next instruction */
        wait(&wait_status);
    }

    procmsg("the child executed %u instructions\n", icounter);
}
```

如前文所述，一旦子进程调用了 `exec`，子进程会停止并被发送 `SIGTRAP` 信号。父进程会等待该过程的发生并在第一个 `wait()` 处等待。一旦上述事件发生了，`wait()` 便会返回，由于子进程停止了父进程便会收到信号（如果子进程由于信号的发送停止了，`WIFSTOPPED` 就会返回 `true`）。

父进程接下来的动作就是整篇文章最需要关注的部分了。父进程会将 `PTRACE_SINGLESTEP` 与子进程 ID 作为参数调用 `ptrace` 方法。这就会告诉操作系统，“请恢复子进程，但在它执行下一条指令前阻塞”。周而复始地，父进程等待子进程阻塞，循环继续。当 `wait()` 中传出的信号不再是子进程的停止信号时，循环终止。在跟踪器（父进程）运行期间，这将会是被跟踪进程（子进程）传递给跟踪器的终止信号（如果子进程终止 `WIFEXITED` 将返回 `true`）。

`icounter` 存储了子进程执行指令的次数。这么看来我们小小的例子也完成了些有用的事情 - 在命令行中指定程序，它将执行该程序并记录它从开始到结束所需要的 cpu 指令数量。接下来就让我们这么做吧。

### 测试

我编译了下面这个简单的程序并利用跟踪器运行它：

```
#include <stdio.h>

int main()
{
    printf("Hello, world!\n");
    return 0;
}

```

令我惊讶的是，跟踪器花了相当长的时间，并报告整个执行过程共有超过 100,000 条指令执行。仅仅是一条输出语句？什么造成了这种情况？答案很有趣（至少你同我一样痴迷与机器/汇编语言）。Linux 的 gcc 默认会动态的将程序与 c 的运行时库动态地链接。这就意味着任何程序运行前的第一件事是需要动态库加载器去查找程序运行所需要的共享库。这些代码的数量很大 - 别忘了我们的跟踪器要跟踪每一条指令，不仅仅是主函数的，而是“整个进程中的指令”。

所以当我将测试程序使用静态编译时（通过比较，可执行文件会多出 500 KB 左右的大小，这部分是 C 运行时库的静态链接），跟踪器提示只有大概 7000 条指令被执行。这个数目仍然不小，但是考虑到在主函数执行前 libc 的初始化以及主函数执行后的清除代码，这个数目已经是相当不错了。此外，`printf` 也是一个复杂的函数。

仍然不满意的话，我需要的是“可以测试”的东西 - 例如可以完整记录每一个指令运行的程序执行过程。这当然可以通过汇编代码完成。所以我找到了这个版本的 “Hello, world!” 并编译了它。


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
    mov    edx, len
    mov    ecx, msg
    mov    ebx, 1
    mov    eax, 4

    ; Execute the sys_write system call
    int    0x80

    ; Execute sys_exit
    mov    eax, 1
    int    0x80

section   .data
msg db    'Hello, world!', 0xa
len equ    $ - msg
```


当然，现在跟踪器提示 7 条指令被执行了，这样一来很容易区分它们。

### 深入指令流

上面那个汇编语言编写的程序使得我可以向你介绍 `ptrace` 的另外一个强大的用途 - 详细显示被跟踪进程的状态。下面是 `run_debugger` 函数的另一个版本：

```
void run_debugger(pid_t child_pid)
{
    int wait_status;
    unsigned icounter = 0;
    procmsg("debugger started\n");

    /* Wait for child to stop on its first instruction */
    wait(&wait_status);

    while (WIFSTOPPED(wait_status)) {
        icounter++;
        struct user_regs_struct regs;
        ptrace(PTRACE_GETREGS, child_pid, 0, &regs);
        unsigned instr = ptrace(PTRACE_PEEKTEXT, child_pid, regs.eip, 0);

        procmsg("icounter = %u.  EIP = 0x%08x.  instr = 0x%08x\n",
                    icounter, regs.eip, instr);

        /* Make the child execute another instruction */
        if (ptrace(PTRACE_SINGLESTEP, child_pid, 0, 0) < 0) {
            perror("ptrace");
            return;
        }

        /* Wait for child to stop on its next instruction */
        wait(&wait_status);
    }

    procmsg("the child executed %u instructions\n", icounter);
}
```

不同仅仅存在于 `while` 循环的开始几行。这个版本里增加了两个新的 `ptrace` 调用。第一条将进程的寄存器值读取进了一个结构体中。 `sys/user.h` 定义有 `user_regs_struct`。如果你查看头文件，头部的注释这么写到：

```
/* 这个文件只为了 GDB 而创建
   不用详细的阅读.如果你不知道你在干嘛，
   不要在除了 GDB 以外的任何地方使用此文件  */
```


不知道你做何感想，但这让我觉得我们找对地方了。回到例子中，一旦我们在 `regs` 变量中取得了寄存器的值，我们就可以通过将 `PTRACE_PEEKTEXT` 作为参数、 `regs.eip`（x86 上的扩展指令指针）作为地址，调用 `ptrace` ，读取当前进程的当前指令（警告：如同我上面所说，文章很大程度上是平台相关的。我简化了一些设定 - 例如，x86 指令集不需要调整到 4 字节，我的32位 Ubuntu unsigned int 是 4 字节。事实上，许多平台都不需要。从内存中读取指令需要预先安装完整的反汇编器。我们这里没有，但实际的调试器是有的）。下面是新跟踪器所展示出的调试效果：

```
$ simple_tracer traced_helloworld
[5700] debugger started
[5701] target started. will run 'traced_helloworld'
[5700] icounter = 1\.  EIP = 0x08048080\.  instr = 0x00000eba
[5700] icounter = 2\.  EIP = 0x08048085\.  instr = 0x0490a0b9
[5700] icounter = 3\.  EIP = 0x0804808a.  instr = 0x000001bb
[5700] icounter = 4\.  EIP = 0x0804808f.  instr = 0x000004b8
[5700] icounter = 5\.  EIP = 0x08048094\.  instr = 0x01b880cd
Hello, world!
[5700] icounter = 6\.  EIP = 0x08048096\.  instr = 0x000001b8
[5700] icounter = 7\.  EIP = 0x0804809b.  instr = 0x000080cd
[5700] the child executed 7 instructions
```


现在，除了 `icounter`，我们也可以观察到指令指针与它每一步所指向的指令。怎么来判断这个结果对不对呢？使用 `objdump -d` 处理可执行文件：

```
$ objdump -d traced_helloworld

traced_helloworld:     file format elf32-i386

Disassembly of section .text:

08048080 <.text>:
 8048080:     ba 0e 00 00 00          mov    $0xe,%edx
 8048085:     b9 a0 90 04 08          mov    $0x80490a0,%ecx
 804808a:     bb 01 00 00 00          mov    $0x1,%ebx
 804808f:     b8 04 00 00 00          mov    $0x4,%eax
 8048094:     cd 80                   int    $0x80
 8048096:     b8 01 00 00 00          mov    $0x1,%eax
 804809b:     cd 80                   int    $0x80
```

这个结果和我们跟踪器的结果就很容易比较了。

###　将跟踪器关联到正在运行的进程

如你所知，调试器也能关联到已经运行的进程。现在你应该不会惊讶，`ptrace` 通过以 `PTRACE_ATTACH` 为参数调用也可以完成这个过程。这里我不会展示示例代码，通过上文的示例代码应该很容易实现这个过程。出于学习目的，这里使用的方法更简便（因为我们在子进程刚开始就可以让它停止）。

### 代码

上文中的简单的跟踪器（更高级的，可以打印指令的版本）的完整c源代码可以在[这里][20]找到。它是通过 4.4 版本的 gcc 以 `-Wall -pedantic --std=c99` 编译的。 

### 结论与计划

诚然，这篇文章并没有涉及很多内容 - 我们距离亲手完成一个实际的调试器还有很长的路要走。但我希望这篇文章至少可以使得调试这件事少一些神秘感。`ptrace` 是功能多样的系统调用，我们目前只展示了其中的一小部分。

单步调试代码很有用，但也只是在一定程度上有用。上面我通过 C 的 “Hello World!” 做了示例。为了执行主函数，可能需要上万行代码来初始化 C 的运行环境。这并不是很方便。最理想的是在 `main` 函数入口处放置断点并从断点处开始分步执行。为此，在这个系列的下一篇，我打算展示怎么实现断点。

### 参考

撰写此文时参考了如下文章

*   [Playing with ptrace, Part I][11]
*   [How debugger works][12]

--------------------------------------------------------------------------------

via: http://eli.thegreenplace.net/2011/01/23/how-debuggers-work-part-1

作者：[Eli Bendersky][a]
译者：[YYforymj](https://github.com/YYforymj)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://eli.thegreenplace.net/
[1]:http://eli.thegreenplace.net/2011/01/23/how-debuggers-work-part-1#id1
[2]:http://eli.thegreenplace.net/2011/01/23/how-debuggers-work-part-1#id2
[3]:http://eli.thegreenplace.net/2011/01/23/how-debuggers-work-part-1#id3
[4]:http://www.jargon.net/jargonfile/p/peek.html
[5]:http://eli.thegreenplace.net/2011/01/23/how-debuggers-work-part-1#id4
[6]:http://eli.thegreenplace.net/2011/01/23/how-debuggers-work-part-1#id5
[7]:http://eli.thegreenplace.net/2011/01/23/how-debuggers-work-part-1#id6
[8]:http://eli.thegreenplace.net/tag/articles
[9]:http://eli.thegreenplace.net/tag/debuggers
[10]:http://eli.thegreenplace.net/tag/programming
[11]:http://www.linuxjournal.com/article/6100?page=0,1
[12]:http://www.alexonlinux.com/how-debugger-works
[13]:http://eli.thegreenplace.net/2011/01/23/how-debuggers-work-part-1#id7
[14]:http://en.wikipedia.org/wiki/Small_matter_of_programming
[15]:http://eli.thegreenplace.net/2011/01/23/how-debuggers-work-part-1#id8
[16]:http://eli.thegreenplace.net/2011/01/23/how-debuggers-work-part-1#id9
[17]:http://eli.thegreenplace.net/2011/01/23/how-debuggers-work-part-1#id10
[18]:http://eli.thegreenplace.net/2011/01/23/how-debuggers-work-part-1#id11
[19]:http://eli.thegreenplace.net/2011/01/23/how-debuggers-work-part-1#id12
[20]:https://github.com/eliben/code-for-blog/blob/master/2011/simple_tracer.c
[21]:http://eli.thegreenplace.net/2011/01/23/how-debuggers-work-part-1

translating by sunxi
How debuggers really work

调试器到底怎样工作
======

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/annoyingbugs.png?itok=ywFZ99Gs)

Image by : opensource.com

供图：opensource.com

A debugger is one of those pieces of software that most, if not every, developer uses at least once during their software engineering career, but how many of you know how they actually work? During my talk at [linux.conf.au 2018][1] in Sydney, I will be talking about writing a debugger from scratch... in [Rust][2]!

调试器是那些大多数（即使不是每个）开发人员在软件工程职业生涯中至少使用过一次的软件之一，但是你们中有多少人知道它们到底是如何工作的？我在悉尼 [linux.conf.au 2018][1] 的演讲中，将讨论从头开始编写调试器...使用 [Rust][2]！

In this article, the terms debugger/tracer are interchangeably. "Tracee" refers to the process being traced by the tracer.

在本文中，术语调试器/跟踪器可以互换。 “被跟踪者”是指跟踪者正在跟踪的进程。

### The ptrace system call

### ptrace 系统调用

Most debuggers heavily rely on a system call known as `ptrace(2)`, which has the prototype:

大多数调试器严重依赖称为 ptrace(2) 的系统调用，其原型如下：

```
long ptrace(enum __ptrace_request request, pid_t pid, void *addr, void *data);
```

This is a system call that can manipulate almost all aspects of a process; however, before the debugger can attach to a process, the "tracee" has to call `ptrace` with the request `PTRACE_TRACEME`. This tells Linux that it is legitimate for the parent to attach via `ptrace` to this process. But... how do we coerce a process into calling `ptrace`? Easy-peasy! `fork/execve` provides an easy way of calling `ptrace` after `fork` but before the tracee really starts using `execve`. Conveniently, `fork` will also return the `pid` of the tracee, which is required for using `ptrace` later.

这是一个系统调用，可以操纵进程的几乎所有方面；但是，在调试器可以attach到进程之前，被跟踪者必须以请求 PTRACE_TRACEME 调用 ptrace。这告诉 Linux，父进程通过 ptrace attach到这个进程是合法的。但是......我们如何强制一个进程调用 ptrace？十分简单！fork / execve 提供了在 fork 之后但在被跟踪者真正开始使用 execve 之前调用 ptrace 的简单方法。很方便，fork 还会返回被跟踪者的 pid，这是以后使用 ptrace 所必需的。

Now that the tracee can be traced by the debugger, important changes take place:

现在被调试者可以被调试器追踪，重要的变化发生了：

  * Every time a signal is delivered to the tracee, it stops and a wait-event is delivered to the tracer that can be captured by the `wait` family of system calls.
  * 每当一个信号被传送到被调试者时，它就会停止，并且一个等待事件被传送给跟踪器，以便于可以被 wait 系列系统调用捕获。
  * Each `execve` system call will cause a `SIGTRAP` to be delivered to the tracee. (Combined with the previous item, this means the tracee is stopped before an `execve` can fully take place.)
  * 每个 execve 系统调用都会导致 SIGTRAP 被传递给被跟踪者。 （与之前的项目相结合，这意味着被跟踪者在 execve 完全发生之前停止。）

This means that, once we issue the `PTRACE_TRACEME` request and call the `execve` system call to actually start the program in the tracee, the tracee will immediately stop, since `execve` delivers a `SIGTRAP`, and that is caught by a wait-event in the tracer. How do we continue? As one would expect, `ptrace` has a number of requests that can be used for telling the tracee it's fine to continue:

这意味着，一旦我们发出 PTRACE_TRACEME 请求并调用 execve 系统调用来实际在被跟踪者（进程上下文）中启动程序，被跟踪者将立即停止，因为 execve 会传递一个 SIGTRAP，并且会被跟踪器中的等待事件捕获。我们如何继续？正如人们所期望的那样，ptrace 有大量的请求可以用来告诉被跟踪者可以继续：


  * `PTRACE_CONT`: This is the simplest. The tracee runs until it receives a signal, at which point a wait-event is delivered to the tracer. This is most commonly used to implement "continue-until-breakpoint" and "continue-forever" options of a real-world debugger. Breakpoints will be covered below.
  * `PTRACE_CONT`：这是最简单的。 被跟踪者运行，直到它接收到一个信号，此时等待事件被传递给跟踪器。这通常用于实现真实世界调试器的“继续直至断点”和“永远继续”选项。断点将在下面介绍。
  * `PTRACE_SYSCALL`: Very similar to `PTRACE_CONT`, but stops before a system call is entered and also before a system call returns to userspace. It can be used in combination with other requests (which we will cover later in this article) to monitor and modify a system call's arguments or return value. `strace`, the system call tracer, uses this request heavily to figure out what system calls are made by a process.
  * `PTRACE_SYSCALL`：与 PTRACE_CONT 非常相似，但在进入系统调用之前以及在系统调用返回到用户空间之前停止。它可以与其他请求（我们将在本文后面介绍）结合使用来监视和修改系统调用的参数或返回值。系统调用追踪程序 strace 很大程度上使用这个请求来获知进程发起了哪些系统调用。
  * `PTRACE_SINGLESTEP`: This one is pretty self-explanatory. If you used a debugger before, this request executes the next instruction, but stops immediately after.
  * `PTRACE_SINGLESTEP`：这个很好理解。如果您之前使用过调试器（你会知道），此请求会执行下一条指令，但会在之后立即停止。



We can stop the process with a variety of requests, but how do we get the state of the tracee? The state of a process is mostly captured by its registers, so of course `ptrace` has a request to get (or modify!) the registers:

我们可以停止过程与各种各样的请求，但我们如何获得被调试者的状态？进程的状态大多是通过其寄存器捕获的，所以当然 ptrace 有一个请求来获得（或修改）寄存器：

  * `PTRACE_GETREGS`: This request will give the registers' state as it was when a tracee was stopped.
  * `PTRACE_GETREGS`：这个请求将给出被跟踪者刚刚被停止时的寄存器的状态。
  * `PTRACE_SETREGS`: If the tracer has the values of registers from a previous call to `PTRACE_GETREGS`, it can modify the values in that structure and set the registers to the new values via this request.
  * `PTRACE_SETREGS`：如果跟踪器之前通过调用 PTRACE_GETREGS 得到了寄存器的值，它可以在参数结构中修改相应寄存器的值并使用 PTRACE_SETREGS 将寄存器设为新值。（增加译注）
  * `PTRACE_PEEKUSER` and `PTRACE_POKEUSER`: These allow reading from the tracee's `USER` area, which holds the registers and other useful information. This can be used to modify a single register, without the more heavyweight `PTRACE_{GET,SET}REGS`.
  * `PTRACE_PEEKUSER` 和 `PTRACE_POKEUSER`：这些允许从tracee的用户区读取信息，这里保存了寄存器和其他有用的信息。 这可以用来修改单一寄存器，而避免使用更重的PTRACE_{GET,SET}REGS。



Modifying the registers isn't always sufficient in a debugger. A debugger will sometimes need to read some parts of the memory or even modify it. The GNU Project Debugger (GDB) can use `print` to get the value of a memory location or a variable. `ptrace` has the functionality to implement this:

在调试器仅仅修改寄存器是不够的。调试器有时需要读取一部分内存，甚至对其进行修改。gdb可以使用 `print` 到得到一个内存位置或变量的值。`ptrace` 通过下面的方法实现这个功能：

  * `PTRACE_PEEKTEXT` and `PTRACE_POKETEXT`: These allow reading and writing a word in the address space of the tracee. Of course, the tracee has to be stopped for this to work.
  * `PTRACE_PEEKTEXT` 和 `PTRACE_POKETEXT`：这些允许读取和写入被跟踪者地址空间中的一个字。当然，使用这个功能时被跟踪者要被暂停。



Real-world debuggers also have features like breakpoints and watchpoints. In the next section, I'll dive into the architectural details of debugging support. For the purposes of clarity and conciseness, this article will consider x86 only.

真实世界的调试器也有类似断点和 watchpoints 的功能。 在接下来的部分中，我将深入体系结构对调试器支持的细节。为了清晰和简洁，本文将只考虑x86。

### Architectural support

### 体系结构的支持

`ptrace` is all cool, but how does it work? In the previous section, we've seen that `ptrace` has quite a bit to do with signals: `SIGTRAP` can be delivered during single-stepping, before `execve` and before or after system calls. Signals can be generated a number of ways, but we will look at two specific examples that can be used by debuggers to stop a program (effectively creating a breakpoint!) at a given location:

`ptrace` 很酷，但它是如何工作？ 在前面的部分中，我们已经看到 `ptrace` 跟信号有很大关系：`SIGTRAP` 可以在单步跟踪、`execve` 之前以及系统调用前后被传送。 信号可以通过一些方式产生，但我们将研究两个具体的例子，以展示信号可以被调试器用来在给定的位置停止程序（有效地创建一个断点！）


  * **Undefined instructions:** When a process tries to execute an undefined instruction, an exception is raised by the CPU. This exception is handled via a CPU interrupt, and a handler corresponding to the interrupt in the kernel is called. This will result in a `SIGILL` being sent to the process. This, in turn, causes the process to stop, and the tracer is notified via a wait-event. It can then decide what to do. On x86, an instruction `ud2` is guaranteed to be always undefined.
  * **未定义的指令**：当一个进程中会尝试执行一个未定义的指令，CPU 将产生一个异常。 此异常通过 CPU 中断处理，内核中相应的中断处理程序被调用。 这将导致一个 `SIGILL` 信号被发送给进程。 这依次导致进程被停止，跟踪器通过一个等待事件被通知，然后它可以决定做什么。 在 x86 上，指令 `ud2` 被确保始终是未定义的。

  * **Debugging interrupt:** The problem with the previous approach is that the `ud2` instruction takes two bytes of machine code. A special instruction exists that takes one byte and raises an interrupt. It's `int $3` and the machine code is `0xCC`. When this interrupt is raised, the kernel sends a `SIGTRAP` to the process and, just as before, the tracer is notified.
  * **调试中断**：前面的方法的问题是，`ud2` 指令需要两个字节的机器码。存在一条特殊的单字节指令触发一个中断，它是 `int $3`，机器码是 `0xCC`。 当该中断发出时，内核给进程发送一个 `SIGTRAP`，如前所述，跟踪器被通知。



This is fine, but how do we coerce the tracee to execute these instructions? Easy: `ptrace` has `PTRACE_POKETEXT`, which can override a word at a memory location. A debugger would read the original word at the location using `PTRACE_PEEKTEXT` and replace it with `0xCC`, remembering the original byte and the fact that it is a breakpoint in its internal state. The next time the tracee executes at the location, it is automatically stopped by the virtue of a `SIGTRAP`. The debugger's end user can then decide how to continue (for instance, inspect the registers).

这很好，但如何做我们胁迫的被跟踪者执行这些指令？ 这很简单：利用 `ptrace` 的 `PTRACE_POKETEXT` 请求，它可以覆盖内存中的一个字。 调试器将使用 `PTRACE_PEEKTEXT` 读取该位置原来的值并替换为 `0xCC` ，然后在其内部状态中记录该处原来的值，以及它是一个断点的事实。 下次被跟踪者执行到该位置时，它将被通过 `SIGTRAP` 信号自动停止。 然后调试器的最终用户可以决定如何继续（例如，检查寄存器）。

Okay, we've covered breakpoints, but what about watchpoints? How does a debugger stop a program when a certain memory location is read or written? Surely you wouldn't just overwrite every instruction with `int $3` that could read or write some memory location. Meet debug registers, a set of registers designed to fulfill this goal more efficiently:

好吧，我们已经讲过了断点，那watchpoints呢？ 当一个特定的内存位置被读或写，调试器如何停止程序？ 当然你不可能为了能够读或写内存而去把每一个指令都覆盖为 `int $3`。有一组调试寄存器为了更有效的满足这个目的而被设计出来：


  * `DR0` to `DR3`: Each of these registers contains an address (a memory location), where the debugger wants the tracee to stop for some reason. The reason is specified as a bitmask in `DR7`.
  * `DR0` 到 `DR3`：这些寄存器中的每个都包含一个地址（内存位置），调试器因为某种原因希望被跟踪者在那些地址那里停止。 其原因以掩码方式被设定在 `DR7` 寄存器中。
  * `DR4` and `DR5`: These obsolete aliases to `DR6` and `DR7`, respectively.
  * `DR4` 和 `DR5`：这些分别是 `DR6` 和 `DR7`过时的别名。
  * `DR6`: Debug status. Contains information about which `DR0` to `DR3` caused the debugging exception to be raised. This is used by Linux to figure out the information passed along with the `SIGTRAP` to the tracee.
  * `DR6`：调试状态。包含有关 `DR0` 到 `DR3` 中的哪个寄存器导致调试异常被引发的信息。这被 Linux 用来计算与 `SIGTRAP` 信号一起传递给被跟踪者的信息。
  * `DR7`: Debug control. Using the bits in these registers, the debugger can control how the addresses specified in `DR0` to `DR3` are interpreted. A bitmask controls the size of the watchpoint (whether 1, 2, 4, or 8 bytes are monitored) and whether to raise an exception on execution, reading, writing, or either of reading and writing.
  * `DR7`：调试控制。通过使用这些寄存器中的位，调试器可以控制如何解释DR0至DR3中指定的地址。位掩码控制监视点的尺寸（监视1,2,4或8个字节）以及是否在执行，读取，写入或读取和写入时引发异常。



Because the debug registers form part of the `USER` area of a process, the debugger can use `PTRACE_POKEUSER` to write values into the debug registers. The debug registers are only relevant to a specific process and are thus restored to the value at preemption before the process regains control of the CPU.

由于调试寄存器是进程的 `USER` 区域的一部分，调试器可以使用 `PTRACE_POKEUSER` 将值写入调试寄存器。调试寄存器只与特定进程相关，因此在进程抢占并重新获得 CPU 控制权之前，调试寄存器会被恢复。

### Tip of the iceberg

### 冰山一角

We've glanced at the iceberg a debugger is: we've covered `ptrace`, went over some of its functionality, then we had a look at how `ptrace` is implemented. Some parts of `ptrace` can be implemented in software, but other parts have to be implemented in hardware, otherwise they'd be very expensive or even impossible.

我们已经浏览了一个调试器的“冰山”：我们已经介绍了 `ptrace`，了解了它的一些功能，然后我们看到了 `ptrace` 是如何实现的。 `ptrace` 的某些部分可以用软件实现，但其他部分必须用硬件来实现，否则实现代价会非常高甚至无法实现。

There's plenty that we didn't cover, of course. Questions, like "how does a debugger know where a variable is in memory?" remain open due to space and time constraints, but I hope you've learned something from this article; if it piqued your interest, there are plenty of resources available online to learn more.

当然有很多我们没有涉及。例如“调试器如何知道变量在内存中的位置？”等问题由于空间和时间限制而尚未解答，但我希望你从本文中学到了一些东西；如果它激起你的兴趣，网上有很多资源可以了解更多。

For more, attend Levente Kurusa's talk, [Let's Write a Debugger!][3], at [linux.conf.au][1], which will be held January 22-26 in Sydney.

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/1/how-debuggers-really-work

作者：[Levente Kurusa][a]
译者：[译者ID](https://github.com/stephenxs)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/lkurusa
[1]:https://linux.conf.au/index.html
[2]:https://www.rust-lang.org
[3]:https://rego.linux.conf.au/schedule/presentation/91/

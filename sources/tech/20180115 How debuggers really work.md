How debuggers really work
======

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/annoyingbugs.png?itok=ywFZ99Gs)

Image by : opensource.com

A debugger is one of those pieces of software that most, if not every, developer uses at least once during their software engineering career, but how many of you know how they actually work? During my talk at [linux.conf.au 2018][1] in Sydney, I will be talking about writing a debugger from scratch... in [Rust][2]!

In this article, the terms debugger/tracer are interchangeably. "Tracee" refers to the process being traced by the tracer.

### The ptrace system call

Most debuggers heavily rely on a system call known as `ptrace(2)`, which has the prototype:
```


long ptrace(enum __ptrace_request request, pid_t pid, void *addr, void *data);
```

This is a system call that can manipulate almost all aspects of a process; however, before the debugger can attach to a process, the "tracee" has to call `ptrace` with the request `PTRACE_TRACEME`. This tells Linux that it is legitimate for the parent to attach via `ptrace` to this process. But... how do we coerce a process into calling `ptrace`? Easy-peasy! `fork/execve` provides an easy way of calling `ptrace` after `fork` but before the tracee really starts using `execve`. Conveniently, `fork` will also return the `pid` of the tracee, which is required for using `ptrace` later.

Now that the tracee can be traced by the debugger, important changes take place:

  * Every time a signal is delivered to the tracee, it stops and a wait-event is delivered to the tracer that can be captured by the `wait` family of system calls.
  * Each `execve` system call will cause a `SIGTRAP` to be delivered to the tracee. (Combined with the previous item, this means the tracee is stopped before an `execve` can fully take place.)



This means that, once we issue the `PTRACE_TRACEME` request and call the `execve` system call to actually start the program in the tracee, the tracee will immediately stop, since `execve` delivers a `SIGTRAP`, and that is caught by a wait-event in the tracer. How do we continue? As one would expect, `ptrace` has a number of requests that can be used for telling the tracee it's fine to continue:

  * `PTRACE_CONT`: This is the simplest. The tracee runs until it receives a signal, at which point a wait-event is delivered to the tracer. This is most commonly used to implement "continue-until-breakpoint" and "continue-forever" options of a real-world debugger. Breakpoints will be covered below.
  * `PTRACE_SYSCALL`: Very similar to `PTRACE_CONT`, but stops before a system call is entered and also before a system call returns to userspace. It can be used in combination with other requests (which we will cover later in this article) to monitor and modify a system call's arguments or return value. `strace`, the system call tracer, uses this request heavily to figure out what system calls are made by a process.
  * `PTRACE_SINGLESTEP`: This one is pretty self-explanatory. If you used a debugger before, this request executes the next instruction, but stops immediately after.



We can stop the process with a variety of requests, but how do we get the state of the tracee? The state of a process is mostly captured by its registers, so of course `ptrace` has a request to get (or modify!) the registers:

  * `PTRACE_GETREGS`: This request will give the registers' state as it was when a tracee was stopped.
  * `PTRACE_SETREGS`: If the tracer has the values of registers from a previous call to `PTRACE_GETREGS`, it can modify the values in that structure and set the registers to the new values via this request.
  * `PTRACE_PEEKUSER` and `PTRACE_POKEUSER`: These allow reading from the tracee's `USER` area, which holds the registers and other useful information. This can be used to modify a single register, without the more heavyweight `PTRACE_{GET,SET}REGS`.



Modifying the registers isn't always sufficient in a debugger. A debugger will sometimes need to read some parts of the memory or even modify it. The GNU Project Debugger (GDB) can use `print` to get the value of a memory location or a variable. `ptrace` has the functionality to implement this:

  * `PTRACE_PEEKTEXT` and `PTRACE_POKETEXT`: These allow reading and writing a word in the address space of the tracee. Of course, the tracee has to be stopped for this to work.



Real-world debuggers also have features like breakpoints and watchpoints. In the next section, I'll dive into the architectural details of debugging support. For the purposes of clarity and conciseness, this article will consider x86 only.

### Architectural support

`ptrace` is all cool, but how does it work? In the previous section, we've seen that `ptrace` has quite a bit to do with signals: `SIGTRAP` can be delivered during single-stepping, before `execve` and before or after system calls. Signals can be generated a number of ways, but we will look at two specific examples that can be used by debuggers to stop a program (effectively creating a breakpoint!) at a given location:

  * **Undefined instructions:** When a process tries to execute an undefined instruction, an exception is raised by the CPU. This exception is handled via a CPU interrupt, and a handler corresponding to the interrupt in the kernel is called. This will result in a `SIGILL` being sent to the process. This, in turn, causes the process to stop, and the tracer is notified via a wait-event. It can then decide what to do. On x86, an instruction `ud2` is guaranteed to be always undefined.

  * **Debugging interrupt:** The problem with the previous approach is that the `ud2` instruction takes two bytes of machine code. A special instruction exists that takes one byte and raises an interrupt. It's `int $3` and the machine code is `0xCC`. When this interrupt is raised, the kernel sends a `SIGTRAP` to the process and, just as before, the tracer is notified.




This is fine, but how do we coerce the tracee to execute these instructions? Easy: `ptrace` has `PTRACE_POKETEXT`, which can override a word at a memory location. A debugger would read the original word at the location using `PTRACE_PEEKTEXT` and replace it with `0xCC`, remembering the original byte and the fact that it is a breakpoint in its internal state. The next time the tracee executes at the location, it is automatically stopped by the virtue of a `SIGTRAP`. The debugger's end user can then decide how to continue (for instance, inspect the registers).

Okay, we've covered breakpoints, but what about watchpoints? How does a debugger stop a program when a certain memory location is read or written? Surely you wouldn't just overwrite every instruction with `int $3` that could read or write some memory location. Meet debug registers, a set of registers designed to fulfill this goal more efficiently:

  * `DR0` to `DR3`: Each of these registers contains an address (a memory location), where the debugger wants the tracee to stop for some reason. The reason is specified as a bitmask in `DR7`.
  * `DR4` and `DR5`: These obsolete aliases to `DR6` and `DR7`, respectively.
  * `DR6`: Debug status. Contains information about which `DR0` to `DR3` caused the debugging exception to be raised. This is used by Linux to figure out the information passed along with the `SIGTRAP` to the tracee.
  * `DR7`: Debug control. Using the bits in these registers, the debugger can control how the addresses specified in `DR0` to `DR3` are interpreted. A bitmask controls the size of the watchpoint (whether 1, 2, 4, or 8 bytes are monitored) and whether to raise an exception on execution, reading, writing, or either of reading and writing.



Because the debug registers form part of the `USER` area of a process, the debugger can use `PTRACE_POKEUSER` to write values into the debug registers. The debug registers are only relevant to a specific process and are thus restored to the value at preemption before the process regains control of the CPU.

### Tip of the iceberg

We've glanced at the iceberg a debugger is: we've covered `ptrace`, went over some of its functionality, then we had a look at how `ptrace` is implemented. Some parts of `ptrace` can be implemented in software, but other parts have to be implemented in hardware, otherwise they'd be very expensive or even impossible.

There's plenty that we didn't cover, of course. Questions, like "how does a debugger know where a variable is in memory?" remain open due to space and time constraints, but I hope you've learned something from this article; if it piqued your interest, there are plenty of resources available online to learn more.

For more, attend Levente Kurusa's talk, [Let's Write a Debugger!][3], at [linux.conf.au][1], which will be held January 22-26 in Sydney.

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/1/how-debuggers-really-work

作者：[Levente Kurusa][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/lkurusa
[1]:https://linux.conf.au/index.html
[2]:https://www.rust-lang.org
[3]:https://rego.linux.conf.au/schedule/presentation/91/

使用 Ptrace 去拦截和仿真 Linux 系统调用
======

`ptrace(2)`（“<ruby>进程跟踪<rt>process trace</rt></ruby>）系统调用通常都与调试有关。它是类 Unix 系统上通过原生调试器监测被调试进程的主要机制。它也是实现 [strace][1]（<ruby>系统调用跟踪<rt>system call trace</rt></ruby>）的常见方法。使用 Ptrace，跟踪器可以暂停被跟踪进程，[检查和设置寄存器和内存][2]，监视系统调用，甚至可以<ruby>拦截<rt>intercepting</rt></ruby>系统调用。

通过拦截功能，意味着跟踪器可以篡改系统调用参数，篡改系统调用的返回值，甚至阻塞某些系统调用。言外之意就是，一个跟踪器本身完全可以提供系统调用服务。这是件非常有趣的事，因为这意味着**一个跟踪器可以仿真一个完整的外部操作系统**，而这些都是在没有得到内核任何帮助的情况下由 Ptrace 实现的。

问题是，在同一时间一个进程只能被一个跟踪器附着，因此在那个进程的调试期间，不可能再使用诸如 GDB 这样的工具去仿真一个外部操作系统。另外的问题是，仿真系统调用的开销非常高。

在本文中，我们将专注于 x86-64 [Linux 的 Ptrace][3]，并将使用一些 Linux 专用的扩展。同时，在本文中，我们将忽略掉一些错误检查，但是完整的源代码仍然会包含这些错误检查。

本文中的可直接运行的示例代码在这里：<https://github.com/skeeto/ptrace-examples>

### strace

在进入到最有趣的部分之前，我们先从回顾 strace 的基本实现来开始。它[不是 DTrace][4]，但 strace 仍然非常有用。

Ptrace 一直没有被标准化。它的接口在不同的操作系统上非常类似，尤其是在核心功能方面，但是在不同的系统之间仍然存在细微的差别。`ptrace(2)` 的原型基本上应该像下面这样，但特定的类型可能有些差别。

```
long ptrace(int request, pid_t pid, void *addr, void *data);
```

`pid` 是被跟踪进程的 ID。虽然**同一个时间**只有一个跟踪器可以附着到该进程上，但是一个跟踪器可以附着跟踪多个进程。

`request` 字段选择一个具体的 Ptrace 函数，比如 `ioctl(2)` 接口。对于 strace，只需要两个：

* `PTRACE_TRACEME`：这个进程被它的父进程跟踪。
* `PTRACE_SYSCALL`：继续跟踪，但是在下一下系统调用入口或出口时停止。
* `PTRACE_GETREGS`：取得被跟踪进程的寄存器内容副本。

另外两个字段，`addr` 和 `data`，作为所选的 Ptrace 函数的一般参数。一般情况下，可以忽略一个或全部忽略，在那种情况下，传递零个参数。

strace 接口实质上是前缀到另一个命令之前。

```
$ strace [strace options] program [arguments]
```

最小化的 strace 不需要任何选项，因此需要做的第一件事情是 —— 假设它至少有一个参数 —— 在 `argv` 尾部的 `fork(2)` 和 `exec(2)` 被跟踪进程。但是在加载目标程序之前，新的进程将告知内核，目标程序将被它的父进程继续跟踪。被跟踪进程将被这个 Ptrace 系统调用暂停。

```
pid_t pid = fork();
switch (pid) {
    case -1: /* error */
        FATAL("%s", strerror(errno));
    case 0:  /* child */
        ptrace(PTRACE_TRACEME, 0, 0, 0);
        execvp(argv[1], argv + 1);
        FATAL("%s", strerror(errno));
}
```

父进程使用 `wait(2)` 等待子进程的 `PTRACE_TRACEME`，当 `wait(2)` 返回后，子进程将被暂停。

```
waitpid(pid, 0, 0);
```

在允许子进程继续运行之前，我们告诉操作系统，被跟踪进程和它的父进程应该一同被终止。一个真实的 strace 实现可能会设置其它的选择，比如： `PTRACE_O_TRACEFORK`。

```
ptrace(PTRACE_SETOPTIONS, pid, 0, PTRACE_O_EXITKILL);
```

剩余部分就是一个简单的、无休止的循环了，每循环一次捕获一个系统调用。循环体总共有四步：

1. 等待进程进入下一个系统调用。
2. 输出系统调用的一个描述。
3. 允许系统调用去运行并等待返回。
4. 输出系统调用返回值。

这个 `PTRACE_SYSCALL` 请求被用于等待下一个系统调用时开始，和等待那个系统调用退出。和前面一样，需要一个 `wait(2)` 去等待被跟踪进程进入期望的状态。

```
ptrace(PTRACE_SYSCALL, pid, 0, 0);
waitpid(pid, 0, 0);
```

当 `wait(2)` 返回时，进行了系统调用的线程的寄存器中写入了该系统调用的系统调用号及其参数。尽管如此，*操作系统仍然没有为这个系统调用提供服务*。这个细节对后续操作很重要。

接下来的一步是采集系统调用信息。这是各个系统架构不同的地方。在 x86-64 上，[系统调用号是在 `rax` 中传递的][5]，而参数（最多 6 个）是在 `rdi`、`rsi`、`rdx`、`r10`、`r8` 和 `r9` 中传递的。这些寄存器是由另外的 Ptrace 调用读取的，不过这里再也不需要 `wait(2)` 了，因为被跟踪进程的状态再也不会发生变化了。

```
struct user_regs_struct regs;
ptrace(PTRACE_GETREGS, pid, 0, &regs);
long syscall = regs.orig_rax;

fprintf(stderr, "%ld(%ld, %ld, %ld, %ld, %ld, %ld)",
        syscall,
        (long)regs.rdi, (long)regs.rsi, (long)regs.rdx,
        (long)regs.r10, (long)regs.r8,  (long)regs.r9);
```

这里有一个警告。由于 [内核的内部用途][6]，系统调用号是保存在 `orig_rax` 中而不是 `rax` 中。而所有的其它系统调用参数都是非常简单明了的。

接下来是它的另一个 `PTRACE_SYSCALL` 和 `wait(2)`，然后是另一个 `PTRACE_GETREGS` 去获取结果。结果保存在 `rax` 中。

```
ptrace(PTRACE_GETREGS, pid, 0, &regs);
fprintf(stderr, " = %ld\n", (long)regs.rax);
```

这个简单程序的输出也是非常粗糙的。这里的系统调用都没有符号名，并且所有的参数都是以数字形式输出，甚至是一个指向缓冲区的指针也是如此。更完整的 strace 输出将能知道哪个参数是指针，并使用 `process_vm_readv(2)` 从被跟踪进程中读取哪些缓冲区，以便正确输出它们。

然而，这些仅仅是系统调用拦截的基础工作。

### 系统调用拦截

假设我们想使用 Ptrace 去实现如 OpenBSD 的 [`pledge(2)`][7] 这样的功能，它是 [一个进程<ruby>承诺<rt>pledge</rt></ruby>只使用一套受限的系统调用][8]。初步想法是，许多程序一般都有一个初始化阶段，这个阶段它们都需要进行许多的系统访问（比如，打开文件、绑定套接字、等等）。初始化完成以后，它们进行一个主循环，在主循环中它们处理输入，并且仅使用所需的、很少的一套系统调用。

在进入主循环之前，一个进程可以限制它自己只能运行所需要的几个操作。如果 [程序有缺陷][9]，能够通过恶意的输入去利用该缺陷，这个**承诺**可以有效地限制漏洞利用的实现。

使用与 strace 相同的模型，但不是输出所有的系统调用，我们既能够阻塞某些系统调用，也可以在它的行为异常时简单地终止被跟踪进程。终止它很容易：只需要在跟踪器中调用 `exit(2)`。因此，它也可以被设置为去终止被跟踪进程。阻塞系统调用和允许子进程继续运行都只是些雕虫小技而已。

最棘手的部分是**当系统调用启动后没有办法去中断它**。当跟踪器在入口从 `wait(2)` 中返回到系统调用时，从一开始停止一个系统调用的仅有方式是，终止被跟踪进程。

然而，我们不仅可以“搞乱”系统调用的参数，也可以改变系统调用号本身，将它修改为一个不存在的系统调用。返回时，在 `errno` 中 [通过正常的内部信号][10]，我们就可以报告一个“友好的”错误信息。

```
for (;;) {
    /* Enter next system call */
    ptrace(PTRACE_SYSCALL, pid, 0, 0);
    waitpid(pid, 0, 0);

    struct user_regs_struct regs;
    ptrace(PTRACE_GETREGS, pid, 0, &regs);

    /* Is this system call permitted? */
    int blocked = 0;
    if (is_syscall_blocked(regs.orig_rax)) {
        blocked = 1;
        regs.orig_rax = -1; // set to invalid syscall
        ptrace(PTRACE_SETREGS, pid, 0, &regs);
    }

    /* Run system call and stop on exit */
    ptrace(PTRACE_SYSCALL, pid, 0, 0);
    waitpid(pid, 0, 0);

    if (blocked) {
        /* errno = EPERM */
        regs.rax = -EPERM; // Operation not permitted
        ptrace(PTRACE_SETREGS, pid, 0, &regs);
    }
}
```

这个简单的示例只是检查了系统调用是否违反白名单或黑名单。而它们在这里并没有差别，比如，允许文件以只读而不是读写方式打开（`open(2)`），允许匿名内存映射但不允许非匿名映射等等。但是这里仍然没有办法去动态撤销被跟踪进程的权限。

跟踪器与被跟踪进程如何沟通？使用人为的系统调用！

### 创建一个人为的系统调用

对于我的这个类似于 pledge 的系统调用 —— 我可以通过调用 `xpledge()` 将它与真实的系统调用区分开 —— 我设置 10000 作为它的系统调用号，这是一个非常大的数字，真实的系统调用中从来不会用到它。

```
#define SYS_xpledge 10000
```

为演示需要，我同时构建了一个非常小的接口，这在实践中并不是个好主意。它与 OpenBSD 的 `pledge(2)` 稍有一些相似之处，它使用了一个 [字符串接口][11]。*事实上*，设计一个健壮且安全的权限集是非常复杂的，正如在 `pledge(2)` 的手册页面上所显示的那样。下面是对被跟踪进程的系统调用的完整接口*和*实现：

```
#define _GNU_SOURCE
#include <unistd.h>

#define XPLEDGE_RDWR (1 << 0)
#define XPLEDGE_OPEN (1 << 1)

#define xpledge(arg) syscall(SYS_xpledge, arg)
```

如果给它传递个参数 0 ，仅允许一些基本的系统调用，包括那些用于去分配内存的系统调用（比如 `brk(2)`）。 `PLEDGE_RDWR` 位允许 [各种][12] 读和写的系统调用（`read(2)`、`readv(2)`、`pread(2)`、`preadv(2)` 等等）。`PLEDGE_OPEN` 位允许 `open(2)`。

为防止发生提升权限的行为，`pledge()` 会拦截它自己 —— 但这样也防止了权限撤销，以后再细说这方面内容。

在 xpledge 跟踪器中，我需要去检查这个系统调用：

```
/* Handle entrance */
switch (regs.orig_rax) {
    case SYS_pledge:
        register_pledge(regs.rdi);
        break;
}
```

操作系统将返回 `ENOSYS`（函数尚未实现），因为它不是一个*真实的*系统调用。为此在退出时我用一个 `success(0)` 去覆写它。

```
/* Handle exit */
switch (regs.orig_rax) {
    case SYS_pledge:
        ptrace(PTRACE_POKEUSER, pid, RAX * 8, 0);
        break;
}
```

我写了一小段测试程序去打开 `/dev/urandom`，做一个读操作，尝试去承诺后，然后试着第二次打开 `/dev/urandom`，然后确认它能够读取原始的 `/dev/urandom` 文件描述符。在没有承诺跟踪器的情况下运行，输出如下：

```
$ ./example
fread("/dev/urandom")[1] = 0xcd2508c7
XPledging...
XPledge failed: Function not implemented
fread("/dev/urandom")[2] = 0x0be4a986
fread("/dev/urandom")[1] = 0x03147604
```

做一个无效的系统调用并不会让应用程序崩溃。它只是失败，这是一个很方便的返回方式。当它在跟踪器下运行时，它的输出如下：

```
$ ./xpledge ./example
fread("/dev/urandom")[1] = 0xb2ac39c4
XPledging...
fopen("/dev/urandom")[2]: Operation not permitted
fread("/dev/urandom")[1] = 0x2e1bd1c4
```

这个承诺很成功，第二次的 `fopen(3)` 并没有进行，因为跟踪器用一个 `EPERM` 阻塞了它。

可以将这种思路进一步发扬光大，比如，改变文件路径或返回一个假的结果。一个跟踪器可以很高效地 chroot 它的被跟踪进程，通过一个系统调用将任意路径传递给 root 从而实现 chroot 路径。它甚至可以对用户进行欺骗，告诉用户它以 root 运行。事实上，这些就是 [Fakeroot NG][13] 程序所做的事情。

### 仿真外部系统

假设你不满足于仅拦截一些系统调用，而是想拦截*全部*系统调用。你就会有了 [一个打算在其它操作系统上运行的二进制程序][14]，无需系统调用，这个二进制程序可以一直运行。

使用我在前面所描述的这些内容你就可以管理这一切。跟踪器可以使用一个假冒的东西去代替系统调用号，允许它失败，以及为系统调用本身提供服务。但那样做的效率很低。其实质上是对每个系统调用做了三个上下文切换：一个是在入口上停止，一个是让系统调用总是以失败告终，还有一个是在系统调用退出时停止。

从 2005 年以后，对于这个技术，PTrace 的 Linux 版本有更高效的操作：`PTRACE_SYSEMU`。PTrace 仅在每个系统调用发出时停止*一次*，在允许被跟踪进程继续运行之前，由跟踪器为系统调用提供服务。

```
for (;;) {
    ptrace(PTRACE_SYSEMU, pid, 0, 0);
    waitpid(pid, 0, 0);

    struct user_regs_struct regs;
    ptrace(PTRACE_GETREGS, pid, 0, &regs);

    switch (regs.orig_rax) {
        case OS_read:
            /* ... */

        case OS_write:
            /* ... */

        case OS_open:
            /* ... */

        case OS_exit:
            /* ... */

        /* ... and so on ... */
    }
}
```

从任何具有（足够）稳定的系统调用 ABI（LCTT 译注：应用程序二进制接口），在相同架构的机器上运行一个二进制程序时，你只需要 `PTRACE_SYSEMU` 跟踪器、一个加载器（用于代替 `exec(2)`），和这个二进制程序所需要（或仅运行静态的二进制程序）的任何系统库即可。

事实上，这听起来有点像一个有趣的周末项目。

**参见**

- [给 Linux 内核克隆实现一个 OpenBSD 承诺][15]

--------------------------------------------------------------------------------

via: http://nullprogram.com/blog/2018/06/23/

作者：[Chris Wellons][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[qhwdw](https://github.com/qhwdw)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: http://nullprogram.com
[1]: https://blog.plover.com/Unix/strace-groff.html
[2]: http://nullprogram.com/blog/2016/09/03/
[3]: http://man7.org/linux/man-pages/man2/ptrace.2.html
[4]: http://nullprogram.com/blog/2018/01/17/
[5]: http://nullprogram.com/blog/2015/05/15/
[6]: https://stackoverflow.com/a/6469069
[7]: https://man.openbsd.org/pledge.2
[8]: http://www.openbsd.org/papers/hackfest2015-pledge/mgp00001.html
[9]: http://nullprogram.com/blog/2017/07/19/
[10]: http://nullprogram.com/blog/2016/09/23/
[11]: https://www.tedunangst.com/flak/post/string-interfaces
[12]: http://nullprogram.com/blog/2017/03/01/
[13]: https://fakeroot-ng.lingnu.com/index.php/Home_Page
[14]: http://nullprogram.com/blog/2017/11/30/
[15]: https://www.youtube.com/watch?v=uXgxMDglxVM

开发一个 Linux 调试器（四）：源码和信号
============================================================

在上一部分我们学习了关于 DWARF 的信息，以及它如何被用于读取变量和将被执行的机器码与我们的高级语言的源码联系起来。在这一部分，我们将进入实践，实现一些我们调试器后面会使用的 DWARF 原语。我们也会利用这个机会，使我们的调试器可以在命中一个断点时打印出当前的源码上下文。

### 系列文章索引

随着后面文章的发布，这些链接会逐渐生效。

1.  [准备环境][1]
2.  [断点][2]
3.  [寄存器和内存][3]
4.  [Elves 和 dwarves][4]
5.  [源码和信号][5]
6.  [源码级逐步执行][6]
7.  源码级断点
8.  调用栈展开
9.  读取变量
10.  下一步

### 设置我们的 DWARF 解析器

正如我在这系列文章开始时备注的，我们会使用 [libelfin][7] 来处理我们的 DWARF 信息。希望你已经在[第一部分][1]设置好了这些，如果没有的话，现在做吧，确保你使用我仓库的 `fbreg` 分支。

一旦你构建好了 `libelfin`，就可以把它添加到我们的调试器。第一步是解析我们的 ELF 可执行程序并从中提取 DWARF 信息。使用 `libelfin` 可以轻易实现，只需要对`调试器`作以下更改：

```
class debugger {
public:
    debugger (std::string prog_name, pid_t pid)
         : m_prog_name{std::move(prog_name)}, m_pid{pid} {
        auto fd = open(m_prog_name.c_str(), O_RDONLY);

        m_elf = elf::elf{elf::create_mmap_loader(fd)};
        m_dwarf = dwarf::dwarf{dwarf::elf::create_loader(m_elf)};
    }
    //...

private:
    //...
    dwarf::dwarf m_dwarf;
    elf::elf m_elf;
};
```

我们使用了 `open` 而不是 `std::ifstream`，因为 elf 加载器需要传递一个 UNIX 文件描述符给  `mmap`，从而可以将文件映射到内存而不是每次读取一部分。

### 调试信息原语

下一步我们可以实现从程序计数器的值中提取行条目（line entry）以及函数 DWARF 信息条目（function DIE）的函数。我们从 `get_function_from_pc` 开始：

```
dwarf::die debugger::get_function_from_pc(uint64_t pc) {
    for (auto &cu : m_dwarf.compilation_units()) {
        if (die_pc_range(cu.root()).contains(pc)) {
            for (const auto& die : cu.root()) {
                if (die.tag == dwarf::DW_TAG::subprogram) {
                    if (die_pc_range(die).contains(pc)) {
                        return die;
                    }
                }
            }
        }
    }

    throw std::out_of_range{"Cannot find function"};
}
```

这里我采用了朴素的方法，迭代遍历编译单元直到找到一个包含程序计数器的，然后迭代遍历它的子节点直到我们找到相关函数（`DW_TAG_subprogram`）。正如我在上一篇中提到的，如果你想要的话你可以处理类似的成员函数或者内联等情况。

接下来是 `get_line_entry_from_pc`：

```
dwarf::line_table::iterator debugger::get_line_entry_from_pc(uint64_t pc) {
    for (auto &cu : m_dwarf.compilation_units()) {
        if (die_pc_range(cu.root()).contains(pc)) {
            auto &lt = cu.get_line_table();
            auto it = lt.find_address(pc);
            if (it == lt.end()) {
                throw std::out_of_range{"Cannot find line entry"};
            }
            else {
                return it;
            }
        }
    }

    throw std::out_of_range{"Cannot find line entry"};
}
```

同样，我们可以简单地找到正确的编译单元，然后查询行表获取相关的条目。

### 打印源码

当我们命中一个断点或者逐步执行我们的代码时，我们会想知道处于源码中的什么位置。

```
void debugger::print_source(const std::string& file_name, unsigned line, unsigned n_lines_context) {
    std::ifstream file {file_name};

    //获得一个所需行附近的窗口
    auto start_line = line <= n_lines_context ? 1 : line - n_lines_context;
    auto end_line = line + n_lines_context + (line < n_lines_context ? n_lines_context - line : 0) + 1;

    char c{};
    auto current_line = 1u;
    //跳过 start_line 之前的行
    while (current_line != start_line && file.get(c)) {
        if (c == '\n') {
            ++current_line;
        }
    }

    //如果我们在当前行则输出光标
    std::cout << (current_line==line ? "> " : "  ");

    //输出行直到 end_line
    while (current_line <= end_line && file.get(c)) {
        std::cout << c;
        if (c == '\n') {
            ++current_line;
            //如果我们在当前行则输出光标
            std::cout << (current_line==line ? "> " : "  ");
        }
    }

    //输出换行确保恰当地清空了流
    std::cout << std::endl;
}
```

现在我们可以打印出源码了，我们需要将这些通过钩子添加到我们的调试器。实现这个的一个好地方是当调试器从一个断点或者（最终）逐步执行得到一个信号时。到了这里，我们可能想要给我们的调试器添加一些更好的信号处理。

### 更好的信号处理

我们希望能够得知什么信号被发送给了进程，同样我们也想知道它是如何产生的。例如，我们希望能够得知是否由于命中了一个断点从而获得一个 `SIGTRAP`，还是由于逐步执行完成、或者是产生了一个新线程等等导致的。幸运的是，我们可以再一次使用 `ptrace`。可以给 `ptrace` 的一个命令是 `PTRACE_GETSIGINFO`，它会给你被发送给进程的最后一个信号的信息。我们类似这样使用它：

```
siginfo_t debugger::get_signal_info() {
    siginfo_t info;
    ptrace(PTRACE_GETSIGINFO, m_pid, nullptr, &info);
    return info;
}
```

这会给我们一个 `siginfo_t` 对象，它能提供以下信息：

```
siginfo_t {
    int      si_signo;     /* 信号编号 */
    int      si_errno;     /* errno 值 */
    int      si_code;      /* 信号代码 */
    int      si_trapno;    /* 导致生成硬件信号的陷阱编号
                              （大部分架构中都没有使用） */
    pid_t    si_pid;       /* 发送信号的进程 ID */
    uid_t    si_uid;       /* 发送信号进程的用户 ID */
    int      si_status;    /* 退出值或信号 */
    clock_t  si_utime;     /* 消耗的用户时间 */
    clock_t  si_stime;     /* 消耗的系统时间 */
    sigval_t si_value;     /* 信号值 */
    int      si_int;       /* POSIX.1b 信号 */
    void    *si_ptr;       /* POSIX.1b 信号 */
    int      si_overrun;   /* 计时器 overrun 计数;
                              POSIX.1b 计时器 */
    int      si_timerid;   /* 计时器 ID; POSIX.1b 计时器 */
    void    *si_addr;      /* 导致错误的内存地址 */
    long     si_band;      /* Band event (在 glibc 2.3.2 和之前版本中是 int 类型) */
    int      si_fd;        /* 文件描述符 */
    short    si_addr_lsb;  /* 地址的最不重要位
                              (自 Linux 2.6.32) */
    void    *si_lower;     /* 出现地址违规的下限 (自 Linux 3.19) */
    void    *si_upper;     /* 出现地址违规的上限 (自 Linux 3.19) */
    int      si_pkey;      /* PTE 上导致错误的保护键 (自 Linux 4.6) */
    void    *si_call_addr; /* 系统调用指令的地址
                              (自 Linux 3.5) */
    int      si_syscall;   /* 系统调用尝试次数
                              (自 Linux 3.5) */
    unsigned int si_arch;  /* 尝试系统调用的架构
                              (自 Linux 3.5) */
}
```

我只需要使用 `si_signo` 就可以找到被发送的信号，使用 `si_code` 来获取更多关于信号的信息。放置这些代码的最好位置是我们的 `wait_for_signal` 函数：

```
void debugger::wait_for_signal() {
    int wait_status;
    auto options = 0;
    waitpid(m_pid, &wait_status, options);

    auto siginfo = get_signal_info();

    switch (siginfo.si_signo) {
    case SIGTRAP:
        handle_sigtrap(siginfo);
        break;
    case SIGSEGV:
        std::cout << "Yay, segfault. Reason: " << siginfo.si_code << std::endl;
        break;
    default:
        std::cout << "Got signal " << strsignal(siginfo.si_signo) << std::endl;
    }
}
```

现在再来处理 `SIGTRAP`。知道当命中一个断点时会发送 `SI_KERNEL` 或 `TRAP_BRKPT`，而逐步执行结束时会发送 `TRAP_TRACE` 就足够了：

```
void debugger::handle_sigtrap(siginfo_t info) {
    switch (info.si_code) {
    //如果命中了一个断点其中的一个会被设置
    case SI_KERNEL:
    case TRAP_BRKPT:
    {
        set_pc(get_pc()-1); //将程序计数器的值设置为它应该指向的地方
        std::cout << "Hit breakpoint at address 0x" << std::hex << get_pc() << std::endl;
        auto line_entry = get_line_entry_from_pc(get_pc());
        print_source(line_entry->file->path, line_entry->line);
        return;
    }
    //如果信号是由逐步执行发送的，这会被设置
    case TRAP_TRACE:
        return;
    default:
        std::cout << "Unknown SIGTRAP code " << info.si_code << std::endl;
        return;
    }
}
```

这里有一大堆不同风格的信号你可以处理。查看 `man sigaction` 获取更多信息。

由于当我们收到 `SIGTRAP` 信号时我们已经修正了程序计数器的值，我们可以从 `step_over_breakpoint` 中移除这些代码，现在它看起来类似：

```
void debugger::step_over_breakpoint() {
    if (m_breakpoints.count(get_pc())) {
        auto& bp = m_breakpoints[get_pc()];
        if (bp.is_enabled()) {
            bp.disable();
            ptrace(PTRACE_SINGLESTEP, m_pid, nullptr, nullptr);
            wait_for_signal();
            bp.enable();
        }
    }
}
```

### 测试

现在你应该可以在某个地址设置断点，运行程序然后看到打印出了源码，而且正在被执行的行被光标标记了出来。

后面我们会添加设置源码级别断点的功能。同时，你可以从[这里][8]获取该博文的代码。

--------------------------------------------------------------------------------

via: https://blog.tartanllama.xyz/c++/2017/04/24/writing-a-linux-debugger-source-signal/

作者：[Simon Brand][a]
译者：[ictlyh](https://github.com/ictlyh)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.twitter.com/TartanLlama
[1]:https://linux.cn/article-8626-1.html
[2]:https://linux.cn/article-8645-1.html
[3]:https://linux.cn/article-8663-1.html
[4]:https://linux.cn/article-8719-1.html
[5]:https://blog.tartanllama.xyz/c++/2017/04/24/writing-a-linux-debugger-source-signal/
[6]:https://blog.tartanllama.xyz/c++/2017/05/06/writing-a-linux-debugger-dwarf-step/
[7]:https://github.com/TartanLlama/libelfin/tree/fbreg
[8]:https://github.com/TartanLlama/minidbg/tree/tut_source

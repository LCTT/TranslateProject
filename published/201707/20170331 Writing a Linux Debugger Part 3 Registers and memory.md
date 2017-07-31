开发一个 Linux 调试器（三）：寄存器和内存
============================================================ 

上一篇博文中我们给调试器添加了一个简单的地址断点。这次，我们将添加读写寄存器和内存的功能，这将使我们能够使用我们的程序计数器、观察状态和改变程序的行为。

### 系列文章索引

随着后面文章的发布，这些链接会逐渐生效。

1. [准备环境][3]
2.  [断点][4]
3.  [寄存器和内存][5]
4.  [Elves 和 dwarves][6]
5.  [源码和信号][7]
6.  [源码级逐步执行][8]
7.  源码级断点
8.  调用栈展开
9.  读取变量
10.  下一步

### 注册我们的寄存器

在我们真正读取任何寄存器之前，我们需要告诉调试器一些关于我们的目标平台的信息，这里是 x86_64 平台。除了多组通用和专用目的寄存器，x86_64 还提供浮点和向量寄存器。为了简化，我将跳过后两种寄存器，但是你如果喜欢的话也可以选择支持它们。x86_64 也允许你像访问 32、16 或者 8 位寄存器那样访问一些 64 位寄存器，但我只会介绍 64 位寄存器。由于这些简化，对于每个寄存器我们只需要它的名称、它的 DWARF 寄存器编号以及 `ptrace` 返回结构体中的存储地址。我使用范围枚举引用这些寄存器，然后我列出了一个全局寄存器描述符数组，其中元素顺序和 `ptrace` 中寄存器结构体相同。

```
enum class reg {
    rax, rbx, rcx, rdx,
    rdi, rsi, rbp, rsp,
    r8,  r9,  r10, r11,
    r12, r13, r14, r15,
    rip, rflags,    cs,
    orig_rax, fs_base,
    gs_base,
    fs, gs, ss, ds, es
};

constexpr std::size_t n_registers = 27;

struct reg_descriptor {
    reg r;
    int dwarf_r;
    std::string name;
};

const std::array<reg_descriptor, n_registers> g_register_descriptors {{
    { reg::r15, 15, "r15" },
    { reg::r14, 14, "r14" },
    { reg::r13, 13, "r13" },
    { reg::r12, 12, "r12" },
    { reg::rbp, 6, "rbp" },
    { reg::rbx, 3, "rbx" },
    { reg::r11, 11, "r11" },
    { reg::r10, 10, "r10" },
    { reg::r9, 9, "r9" },
    { reg::r8, 8, "r8" },
    { reg::rax, 0, "rax" },
    { reg::rcx, 2, "rcx" },
    { reg::rdx, 1, "rdx" },
    { reg::rsi, 4, "rsi" },
    { reg::rdi, 5, "rdi" },
    { reg::orig_rax, -1, "orig_rax" },
    { reg::rip, -1, "rip" },
    { reg::cs, 51, "cs" },
    { reg::rflags, 49, "eflags" },
    { reg::rsp, 7, "rsp" },
    { reg::ss, 52, "ss" },
    { reg::fs_base, 58, "fs_base" },
    { reg::gs_base, 59, "gs_base" },
    { reg::ds, 53, "ds" },
    { reg::es, 50, "es" },
    { reg::fs, 54, "fs" },
    { reg::gs, 55, "gs" },
}};
```

如果你想自己看看的话，你通常可以在 `/usr/include/sys/user.h` 找到寄存器数据结构，另外 DWARF 寄存器编号取自 [System V x86_64 ABI][11]。

现在我们可以编写一堆函数来和寄存器交互。我们希望可以读取寄存器、写入数据、根据 DWARF 寄存器编号获取值，以及通过名称查找寄存器，反之类似。让我们先从实现 `get_register_value` 开始：

```
uint64_t get_register_value(pid_t pid, reg r) {
    user_regs_struct regs;
    ptrace(PTRACE_GETREGS, pid, nullptr, &regs);
    //...
}
```

`ptrace` 使得我们可以轻易获得我们想要的数据。我们只需要构造一个 `user_regs_struct` 实例并把它和 `PTRACE_GETREGS` 请求传递给 `ptrace`。

现在根据要请求的寄存器，我们要读取 `regs`。我们可以写一个很大的 switch 语句，但由于我们 `g_register_descriptors` 表的布局顺序和 `user_regs_struct` 相同，我们只需要搜索寄存器描述符的索引，然后作为 `uint64_t` 数组访问 `user_regs_struct` 就行。（你也可以重新排序 `reg` 枚举变量，然后使用索引把它们转换为底层类型，但第一次我就使用这种方式编写，它能正常工作，我也就懒得改它了。）

```
        auto it = std::find_if(begin(g_register_descriptors), end(g_register_descriptors),
                               [r](auto&& rd) { return rd.r == r; });

        return *(reinterpret_cast<uint64_t*>(&regs) + (it - begin(g_register_descriptors)));
```

到 `uint64_t` 的转换是安全的，因为 `user_regs_struct` 是一个标准布局类型，但我认为指针算术技术上是<ruby>未定义的行为<rt>undefined behavior</rt></ruby>。当前没有编译器会对此产生警告，我也懒得修改，但是如果你想保持最严格的正确性，那就写一个大的 switch 语句。

`set_register_value` 非常类似，我们只是写入该位置并在最后写回寄存器：

```
void set_register_value(pid_t pid, reg r, uint64_t value) {
    user_regs_struct regs;
    ptrace(PTRACE_GETREGS, pid, nullptr, &regs);
    auto it = std::find_if(begin(g_register_descriptors), end(g_register_descriptors),
                           [r](auto&& rd) { return rd.r == r; });

    *(reinterpret_cast<uint64_t*>(&regs) + (it - begin(g_register_descriptors))) = value;
    ptrace(PTRACE_SETREGS, pid, nullptr, &regs);
}
```

下一步是通过 DWARF 寄存器编号查找。这次我会真正检查一个错误条件以防我们得到一些奇怪的 DWARF 信息。

```
uint64_t get_register_value_from_dwarf_register (pid_t pid, unsigned regnum) {
    auto it = std::find_if(begin(g_register_descriptors), end(g_register_descriptors),
                           [regnum](auto&& rd) { return rd.dwarf_r == regnum; });
    if (it == end(g_register_descriptors)) {
        throw std::out_of_range{"Unknown dwarf register"};
    }

    return get_register_value(pid, it->r);
}
```

就快完成啦，现在我们已经有了寄存器名称查找：

```
std::string get_register_name(reg r) {
    auto it = std::find_if(begin(g_register_descriptors), end(g_register_descriptors),
                           [r](auto&& rd) { return rd.r == r; });
    return it->name;
}

reg get_register_from_name(const std::string& name) {
    auto it = std::find_if(begin(g_register_descriptors), end(g_register_descriptors),
                           [name](auto&& rd) { return rd.name == name; });
    return it->r;
}
```

最后我们会添加一个简单的帮助函数用于导出所有寄存器的内容：

```
void debugger::dump_registers() {
    for (const auto& rd : g_register_descriptors) {
        std::cout << rd.name << " 0x"
                  << std::setfill('0') << std::setw(16) << std::hex << get_register_value(m_pid, rd.r) << std::endl;
    }
}
```

正如你看到的，iostreams 有非常精确的接口用于美观地输出十六进制数据（啊哈哈哈哈哈哈）。如果你喜欢你也可以通过 I/O 操纵器来摆脱这种混乱。

这些已经足够支持我们在调试器接下来的部分轻松地处理寄存器，所以我们现在可以把这些添加到我们的用户界面。

### 显示我们的寄存器

这里我们要做的就是给 `handle_command` 函数添加一个命令。通过下面的代码，用户可以输入 `register read rax`、 `register write rax 0x42` 以及类似的语句。

```
    else if (is_prefix(command, "register")) {
        if (is_prefix(args[1], "dump")) {
            dump_registers();
        }
        else if (is_prefix(args[1], "read")) {
            std::cout << get_register_value(m_pid, get_register_from_name(args[2])) << std::endl;
        }
        else if (is_prefix(args[1], "write")) {
            std::string val {args[3], 2}; //assume 0xVAL
            set_register_value(m_pid, get_register_from_name(args[2]), std::stol(val, 0, 16));
        }
    }
```


### 接下来做什么？

设置断点的时候我们已经读取和写入内存，因此我们只需要添加一些函数用于隐藏 `ptrace` 调用。

```
uint64_t debugger::read_memory(uint64_t address) {
    return ptrace(PTRACE_PEEKDATA, m_pid, address, nullptr);
}

void debugger::write_memory(uint64_t address, uint64_t value) {
    ptrace(PTRACE_POKEDATA, m_pid, address, value);
}
```

你可能想要添加支持一次读取或者写入多个字节，你可以在每次希望读取另一个字节时通过递增地址来实现。如果你需要的话，你也可以使用  [`process_vm_readv` 和 `process_vm_writev`][12] 或 `/proc/<pid>/mem` 代替 `ptrace`。

现在我们会给我们的用户界面添加命令：

```
    else if(is_prefix(command, "memory")) {
        std::string addr {args[2], 2}; //assume 0xADDRESS

        if (is_prefix(args[1], "read")) {
            std::cout << std::hex << read_memory(std::stol(addr, 0, 16)) << std::endl;
        }
        if (is_prefix(args[1], "write")) {
            std::string val {args[3], 2}; //assume 0xVAL
            write_memory(std::stol(addr, 0, 16), std::stol(val, 0, 16));
        }
    }
```

### 给  `continue_execution` 打补丁

在我们测试我们的更改之前，我们现在可以实现一个更健全的 `continue_execution` 版本。由于我们可以获取程序计数器，我们可以检查我们的断点映射来判断我们是否处于一个断点。如果是的话，我们可以停用断点并在继续之前跳过它。

为了清晰和简洁起见，首先我们要添加一些帮助函数：

```
uint64_t debugger::get_pc() {
    return get_register_value(m_pid, reg::rip);
}

void debugger::set_pc(uint64_t pc) {
    set_register_value(m_pid, reg::rip, pc);
}
```

然后我们可以编写函数来跳过断点：

```
void debugger::step_over_breakpoint() {
    // - 1 because execution will go past the breakpoint
    auto possible_breakpoint_location = get_pc() - 1;

    if (m_breakpoints.count(possible_breakpoint_location)) {
        auto& bp = m_breakpoints[possible_breakpoint_location];

        if (bp.is_enabled()) {
            auto previous_instruction_address = possible_breakpoint_location;
            set_pc(previous_instruction_address);

            bp.disable();
            ptrace(PTRACE_SINGLESTEP, m_pid, nullptr, nullptr);
            wait_for_signal();
            bp.enable();
        }
    }
}
```

首先我们检查当前程序计算器的值是否设置了一个断点。如果有，首先我们把执行返回到断点之前，停用它，跳过原来的指令，再重新启用断点。

`wait_for_signal` 封装了我们常用的 `waitpid` 模式：

```
void debugger::wait_for_signal() {
    int wait_status;
    auto options = 0;
    waitpid(m_pid, &wait_status, options);
}
```

最后我们像下面这样重写 `continue_execution`：

```
void debugger::continue_execution() {
    step_over_breakpoint();
    ptrace(PTRACE_CONT, m_pid, nullptr, nullptr);
    wait_for_signal();
}
```

### 测试效果

现在我们可以读取和修改寄存器了，我们可以对我们的 hello world 程序做一些有意思的更改。类似第一次测试，再次尝试在 `call` 指令处设置断点然后从那里继续执行。你可以看到输出了 `Hello world`。现在是有趣的部分，在输出调用后设一个断点、继续、将 `call` 参数设置代码的地址写入程序计数器（`rip`）并继续。由于程序计数器操纵，你应该再次看到输出了  `Hello world`。为了以防你不确定在哪里设置断点，下面是我上一篇博文中的 `objdump` 输出：


```
0000000000400936 <main>:
  400936:	55                   	push   rbp
  400937:	48 89 e5             	mov    rbp,rsp
  40093a:	be 35 0a 40 00       	mov    esi,0x400a35
  40093f:	bf 60 10 60 00       	mov    edi,0x601060
  400944:	e8 d7 fe ff ff       	call   400820 <_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@plt>
  400949:	b8 00 00 00 00       	mov    eax,0x0
  40094e:	5d                   	pop    rbp
  40094f:	c3                   	ret

```

你要将程序计数器移回 `0x40093a` 以便正确设置 `esi` 和 `edi` 寄存器。

在下一篇博客中，我们会第一次接触到 DWARF 信息并给我们的调试器添加一系列逐步调试的功能。之后，我们会有一个功能工具，它能逐步执行代码、在想要的地方设置断点、修改数据以及其它。一如以往，如果你有任何问题请留下你的评论！

你可以在[这里][13]找到这篇博文的代码。
 
--------------------------------------------------------------------------------

via: https://blog.tartanllama.xyz/c++/2017/03/31/writing-a-linux-debugger-registers/

作者：[Simon Brand][a]
译者：[ictlyh](https://github.com/ictlyh)
校对：[jasminepeng](https://github.com/jasminepeng)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.twitter.com/TartanLlama
[1]:https://blog.tartanllama.xyz/c++/2017/03/31/writing-a-linux-debugger-registers/#fnref:2
[2]:https://blog.tartanllama.xyz/c++/2017/03/31/writing-a-linux-debugger-registers/#fnref:1
[3]:https://linux.cn/article-8626-1.html
[4]:https://linux.cn/article-8645-1.html
[5]:https://blog.tartanllama.xyz/c++/2017/03/31/writing-a-linux-debugger-registers/
[6]:https://blog.tartanllama.xyz/c++/2017/04/05/writing-a-linux-debugger-elf-dwarf/
[7]:https://blog.tartanllama.xyz/c++/2017/04/24/writing-a-linux-debugger-source-signal/
[8]:https://blog.tartanllama.xyz/c++/2017/05/06/writing-a-linux-debugger-dwarf-step/
[9]:https://blog.tartanllama.xyz/c++/2017/03/31/writing-a-linux-debugger-registers/#fn:2
[10]:https://blog.tartanllama.xyz/c++/2017/03/31/writing-a-linux-debugger-registers/#fn:1
[11]:https://www.uclibc.org/docs/psABI-x86_64.pdf
[12]:http://man7.org/linux/man-pages/man2/process_vm_readv.2.html
[13]:https://github.com/TartanLlama/minidbg/tree/tut_registers

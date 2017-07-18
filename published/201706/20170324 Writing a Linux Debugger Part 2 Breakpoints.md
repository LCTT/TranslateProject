开发一个 Linux 调试器（二）：断点
============================================================

在该系列的第一部分，我们写了一个小的进程启动器，作为我们调试器的基础。在这篇博客中，我们会学习在 x86 Linux 上断点是如何工作的，以及如何给我们工具添加设置断点的能力。

### 系列文章索引

随着后面文章的发布，这些链接会逐渐生效。

1.	[准备环境][2]
2.	[断点][3]
3.	寄存器和内存
4.	Elves 和 dwarves
5. 源码和信号
6. 源码层逐步执行
7. 源码层断点
8. 调用栈
9. 读取变量
10.之后步骤

### 断点是如何形成的？

有两种类型的断点：硬件和软件。硬件断点通常涉及到设置与体系结构相关的寄存器来为你产生断点，而软件断点则涉及到修改正在执行的代码。在这篇文章中我们只会关注软件断点，因为它们比较简单，而且可以设置任意多断点。在 x86 机器上任一时刻你最多只能有 4 个硬件断点，但是它们能让你在读取或者写入给定地址时触发，而不是只有当代码执行到那里的时候。

我前面说软件断点是通过修改正在执行的代码实现的，那么问题就来了：

*	我们如何修改代码？
*	为了设置断点我们要做什么修改？
*	如何告知调试器？

第一个问题的答案显然是 `ptrace`。我们之前已经用它为我们的程序设置跟踪并继续程序的执行，但我们也可以用它来读或者写内存。

当执行到断点时，我们的更改要让处理器暂停并给程序发送信号。在 x86 机器上这是通过 `int 3` 重写该地址上的指令实现的。x86 机器有个中断向量表（interrupt vector table），操作系统能用它来为多种事件注册处理程序，例如页故障、保护故障和无效操作码。它就像是注册错误处理回调函数，但是是在硬件层面的。当处理器执行 `int 3` 指令时，控制权就被传递给断点中断处理器，对于 Linux 来说，就是给进程发送 `SIGTRAP` 信号。你可以在下图中看到这个进程，我们用 `0xcc` 覆盖了 `mov` 指令的第一个字节，它是 `init 3` 的指令代码。

 ![断点](http://blog.tartanllama.xyz/assets/breakpoint.png) 

谜题的最后一个部分是调试器如何被告知中断的。如果你回顾前面的文章，我们可以用 `waitpid` 来监听被发送给被调试的程序的信号。这里我们也可以这样做：设置断点、继续执行程序、调用 `waitpid` 并等待直到发生 `SIGTRAP`。然后就可以通过打印已运行到的源码位置、或改变有图形用户界面的调试器中关注的代码行，将这个断点传达给用户。

### 实现软件断点

我们会实现一个 `breakpoint` 类来表示某个位置的断点，我们可以根据需要启用或者停用该断点。

```
class breakpoint {
public:
    breakpoint(pid_t pid, std::intptr_t addr)
        : m_pid{pid}, m_addr{addr}, m_enabled{false}, m_saved_data{}
    {}

    void enable();
    void disable();

    auto is_enabled() const -> bool { return m_enabled; }
    auto get_address() const -> std::intptr_t { return m_addr; }

private:
    pid_t m_pid;
    std::intptr_t m_addr;
    bool m_enabled;
    uint64_t m_saved_data; //data which used to be at the breakpoint address
};
```

这里的大部分代码都是跟踪状态；真正神奇的地方是 `enable` 和 `disable` 函数。

正如我们上面学到的，我们要用 `int 3` 指令 - 编码为 `0xcc` - 替换当前指定地址的指令。我们还要保存该地址之前的值，以便后面恢复该代码；我们不想忘了执行用户（原来）的代码。

```
void breakpoint::enable() {
    m_saved_data = ptrace(PTRACE_PEEKDATA, m_pid, m_addr, nullptr);
    uint64_t int3 = 0xcc;
    uint64_t data_with_int3 = ((m_saved_data & ~0xff) | int3); //set bottom byte to 0xcc
    ptrace(PTRACE_POKEDATA, m_pid, m_addr, data_with_int3);

    m_enabled = true;
}
```

`PTRACE_PEEKDATA` 请求告知 `ptrace` 如何读取被跟踪进程的内存。我们给它一个进程 ID 和一个地址，然后它返回给我们该地址当前的 64 位内容。 `(m_saved_data & ~0xff)` 把这个数据的低位字节置零，然后我们用它和我们的 `int 3` 指令按位或（`OR`）来设置断点。最后我们通过 `PTRACE_POKEDATA` 用我们的新数据覆盖那部分内存来设置断点。 

`disable` 的实现比较简单，我们只需要恢复用 `0xcc` 所覆盖的原始数据。

```
void breakpoint::disable() {
    ptrace(PTRACE_POKEDATA, m_pid, m_addr, m_saved_data);
    m_enabled = false;
}
```

### 在调试器中增加断点

为了支持通过用户界面设置断点，我们要在 debugger 类修改三个地方：

1.	给 `debugger` 添加断点存储数据结构
2.	添加 `set_breakpoint_at_address` 函数
3.	给我们的 `handle_command` 函数添加 `break` 命令

我会将我的断点保存到 `std::unordered_map<std::intptr_t, breakpoint>` 结构，以便能简单快速地判断一个给定的地址是否有断点，如果有的话，取回该 breakpoint 对象。

```
class debugger {
    //...
    void set_breakpoint_at_address(std::intptr_t addr);
    //...
private:
    //...
    std::unordered_map<std::intptr_t,breakpoint> m_breakpoints;
}
```

在 `set_breakpoint_at_address` 函数中我们会新建一个 breakpoint 对象，启用它，把它添加到数据结构里，并给用户打印一条信息。如果你喜欢的话，你可以重构所有的输出信息，从而你可以将调试器作为库或者命令行工具使用，为了简便，我把它们都整合到了一起。

```
void debugger::set_breakpoint_at_address(std::intptr_t addr) {
    std::cout << "Set breakpoint at address 0x" << std::hex << addr << std::endl;
    breakpoint bp {m_pid, addr};
    bp.enable();
    m_breakpoints[addr] = bp;
}
```

现在我们会在我们的命令处理程序中增加对我们新函数的调用。

```
void debugger::handle_command(const std::string& line) {
    auto args = split(line,' ');
    auto command = args[0];

    if (is_prefix(command, "cont")) {
        continue_execution();
    }
    else if(is_prefix(command, "break")) {
        std::string addr {args[1], 2}; //naively assume that the user has written 0xADDRESS
        set_breakpoint_at_address(std::stol(addr, 0, 16));
    }
    else {
        std::cerr << "Unknown command\n";
    }
}
```

我删除了字符串中的前两个字符并对结果调用 `std::stol`，你也可以让该解析更健壮一些。`std::stol` 可以将字符串按照所给基数转化为整数。

### 从断点继续执行

如果你尝试这样做，你可能会发现，如果你从断点处继续执行，不会发生任何事情。这是因为断点仍然在内存中，因此一直被重复命中。简单的解决办法就是停用这个断点、运行到下一步、再次启用这个断点、然后继续执行。不过我们还需要更改程序计数器，指回到断点前面，这部分内容会留到下一篇关于操作寄存器的文章中介绍。

### 测试它

当然，如果你不知道要在哪个地址设置，那么在某些地址设置断点并非很有用。后面我们会学习如何在函数名或者代码行设置断点，但现在我们可以通过手动实现。

测试你调试器的简单方法是写一个 hello world 程序，这个程序输出到 `std::err`（为了避免缓存），并在调用输出操作符的地方设置断点。如果你继续执行被调试的程序，执行很可能会停止而不会输出任何东西。然后你可以重启调试器并在调用之后设置一个断点，现在你应该看到成功地输出了消息。

查找地址的一个方法是使用 `objdump`。如果你打开一个终端并执行 `objdump -d <your program>`，然后你应该看到你的程序的反汇编代码。你就可以找到 `main` 函数并定位到你想设置断点的 `call` 指令。例如，我编译了一个 hello world 程序，反汇编它，然后得到了如下的 `main` 的反汇编代码：

```
0000000000400936 <main>:
  400936:	55                   	push   %rbp
  400937:	48 89 e5             	mov    %rsp,%rbp
  40093a:	be 35 0a 40 00       	mov    $0x400a35,%esi
  40093f:	bf 60 10 60 00       	mov    $0x601060,%edi
  400944:	e8 d7 fe ff ff       	callq  400820 <_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@plt>
  400949:	b8 00 00 00 00       	mov    $0x0,%eax
  40094e:	5d                   	pop    %rbp
  40094f:	c3                   	retq
```

正如你看到的，要没有输出，我们要在 `0x400944` 设置断点，要看到输出，要在 `0x400949` 设置断点。

### 总结

现在你应该有了一个可以启动程序、允许在内存地址上设置断点的调试器。后面我们会添加读写内存和寄存器的功能。再次说明，如果你有任何问题请在评论框中告诉我。

你可以在[这里][3] 找到该项目的代码。

--------------------------------------------------------------------------------

via: http://blog.tartanllama.xyz/c++/2017/03/24/writing-a-linux-debugger-breakpoints/

作者：[Simon Brand][a]
译者：[ictlyh](https://github.com/ictlyh)
校对：[jasminepeng](https://github.com/jasminepeng)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://blog.tartanllama.xyz/
[1]:http://blog.tartanllama.xyz/c++/2017/03/21/writing-a-linux-debugger-setup/
[2]:https://linux.cn/article-8626-1.html
[3]:https://github.com/TartanLlama/minidbg/tree/tut_break

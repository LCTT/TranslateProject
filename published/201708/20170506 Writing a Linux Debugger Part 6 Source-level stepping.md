开发一个 Linux 调试器（六）：源码级逐步执行
============================================================ 

在前几篇博文中我们学习了 DWARF 信息以及它如何使我们将机器码和上层源码联系起来。这一次我们通过为我们的调试器添加源码级逐步调试将该知识应用于实际。

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

### 揭秘指令级逐步执行

我们正在超越了自我。首先让我们通过用户接口揭秘指令级单步执行。我决定将它切分为能被其它部分代码利用的 `single_step_instruction` 和确保是否启用了某个断点的 `single_step_instruction_with_breakpoint_check` 两个函数。

```
void debugger::single_step_instruction() {
    ptrace(PTRACE_SINGLESTEP, m_pid, nullptr, nullptr);
    wait_for_signal();
}

void debugger::single_step_instruction_with_breakpoint_check() {
    //首先，检查我们是否需要停用或者启用某个断点
    if (m_breakpoints.count(get_pc())) {
        step_over_breakpoint();
    }
    else {
        single_step_instruction();
    }
}
```

正如以往，另一个命令被集成到我们的 `handle_command` 函数：

```
else if(is_prefix(command, "stepi")) {
    single_step_instruction_with_breakpoint_check();
    auto line_entry = get_line_entry_from_pc(get_pc());
    print_source(line_entry->file->path, line_entry->line);
 }
```

利用新增的这些函数我们可以开始实现我们的源码级逐步执行函数。

### 实现逐步执行

我们打算编写这些函数非常简单的版本，但真正的调试器有 _thread plan_ 的概念，它封装了所有的单步信息。例如，调试器可能有一些复杂的逻辑去决定断点的位置，然后有一些回调函数用于判断单步操作是否完成。这其中有非常多的基础设施，我们只采用一种朴素的方法。我们可能会意外地跳过断点，但如果你愿意的话，你可以花一些时间把所有的细节都处理好。

对于跳出 `step_out`，我们只是在函数的返回地址处设一个断点然后继续执行。我暂时还不想考虑调用栈展开的细节 - 这些都会在后面的部分介绍 - 但可以说返回地址就保存在栈帧开始的后 8 个字节中。因此我们会读取栈指针然后在内存相对应的地址读取值：

```
void debugger::step_out() {
    auto frame_pointer = get_register_value(m_pid, reg::rbp);
    auto return_address = read_memory(frame_pointer+8);

    bool should_remove_breakpoint = false;
    if (!m_breakpoints.count(return_address)) {
        set_breakpoint_at_address(return_address);
        should_remove_breakpoint = true;
    }

    continue_execution();

    if (should_remove_breakpoint) {
        remove_breakpoint(return_address);
    }
}
```

`remove_breakpoint` 是一个小的帮助函数：

```
void debugger::remove_breakpoint(std::intptr_t addr) {
    if (m_breakpoints.at(addr).is_enabled()) {
        m_breakpoints.at(addr).disable();
    }
    m_breakpoints.erase(addr);
}
```

接下来是跳入 `step_in`。一个简单的算法是继续逐步执行指令直到新的一行。

```
void debugger::step_in() {
   auto line = get_line_entry_from_pc(get_pc())->line;

    while (get_line_entry_from_pc(get_pc())->line == line) {
        single_step_instruction_with_breakpoint_check();
    }

    auto line_entry = get_line_entry_from_pc(get_pc());
    print_source(line_entry->file->path, line_entry->line);
}
```

跳过 `step_over` 对于我们来说是三个中最难的。理论上，解决方法就是在下一行源码中设置一个断点，但下一行源码是什么呢？它可能不是当前行后续的那一行，因为我们可能处于一个循环、或者某种条件结构之中。真正的调试器一般会检查当前正在执行什么指令然后计算出所有可能的分支目标，然后在所有分支目标中设置断点。对于一个小的项目，我不打算实现或者集成一个 x86 指令模拟器，因此我们要想一个更简单的解决办法。有几个可怕的选择，一个是一直逐步执行直到当前函数新的一行，或者在当前函数的每一行都设置一个断点。如果我们是要跳过一个函数调用，前者将会相当的低效，因为我们需要逐步执行那个调用图中的每个指令，因此我会采用第二种方法。

```
void debugger::step_over() {
    auto func = get_function_from_pc(get_pc());
    auto func_entry = at_low_pc(func);
    auto func_end = at_high_pc(func);

    auto line = get_line_entry_from_pc(func_entry);
    auto start_line = get_line_entry_from_pc(get_pc());

    std::vector<std::intptr_t> to_delete{};

    while (line->address < func_end) {
        if (line->address != start_line->address && !m_breakpoints.count(line->address)) {
            set_breakpoint_at_address(line->address);
            to_delete.push_back(line->address);
        }
        ++line;
    }

    auto frame_pointer = get_register_value(m_pid, reg::rbp);
    auto return_address = read_memory(frame_pointer+8);
    if (!m_breakpoints.count(return_address)) {
        set_breakpoint_at_address(return_address);
        to_delete.push_back(return_address);
    }

    continue_execution();

    for (auto addr : to_delete) {
        remove_breakpoint(addr);
    }
}
```

这个函数有一点复杂，我们将它拆开来看。

```
    auto func = get_function_from_pc(get_pc());
    auto func_entry = at_low_pc(func);
    auto func_end = at_high_pc(func);
```

`at_low_pc` 和 `at_high_pc` 是 `libelfin` 中的函数，它们能给我们指定函数 DWARF 信息条目的最小和最大程序计数器值。

```
    auto line = get_line_entry_from_pc(func_entry);
    auto start_line = get_line_entry_from_pc(get_pc());

    std::vector<std::intptr_t> breakpoints_to_remove{};

    while (line->address < func_end) {
        if (line->address != start_line->address && !m_breakpoints.count(line->address)) {
            set_breakpoint_at_address(line->address);
            breakpoints_to_remove.push_back(line->address);
        }
        ++line;
    }
```

我们需要移除我们设置的所有断点，以便不会泄露出我们的逐步执行函数，为此我们把它们保存到一个 `std::vector` 中。为了设置所有断点，我们循环遍历行表条目直到找到一个不在我们函数范围内的。对于每一个，我们都要确保它不是我们当前所在的行，而且在这个位置还没有设置任何断点。

```
    auto frame_pointer = get_register_value(m_pid, reg::rbp);
    auto return_address = read_memory(frame_pointer+8);
    if (!m_breakpoints.count(return_address)) {
        set_breakpoint_at_address(return_address);
        to_delete.push_back(return_address);
    }
```

这里我们在函数的返回地址处设置一个断点，正如跳出 `step_out`。

```
    continue_execution();

    for (auto addr : to_delete) {
        remove_breakpoint(addr);
    }
```

最后，我们继续执行直到命中它们中的其中一个断点，然后移除所有我们设置的临时断点。

它并不美观，但暂时先这样吧。

当然，我们还需要将这个新功能添加到用户界面：

```
    else if(is_prefix(command, "step")) {
        step_in();
    }
    else if(is_prefix(command, "next")) {
        step_over();
    }
    else if(is_prefix(command, "finish")) {
        step_out();
    }
```

### 测试

我通过实现一个调用一系列不同函数的简单函数来进行测试：

```
void a() {
    int foo = 1;
}

void b() {
    int foo = 2;
    a();
}

void c() {
    int foo = 3;
    b();
}

void d() {
    int foo = 4;
    c();
}

void e() {
    int foo = 5;
    d();
}

void f() {
    int foo = 6;
    e();
}

int main() {
    f();
}
```

你应该可以在 `main` 地址处设置一个断点，然后在整个程序中跳入、跳过、跳出函数。如果你尝试跳出 `main` 函数或者跳入任何动态链接库，就会出现意料之外的事情。

你可以在[这里][7]找到这篇博文的相关代码。下次我们会利用我们新的 DWARF 技巧来实现源码级断点。

--------------------------------------------------------------------------------

via: https://blog.tartanllama.xyz/c++/2017/05/06/writing-a-linux-debugger-dwarf-step/

作者：[Simon Brand][a]
译者：[ictlyh](https://github.com/ictlyh)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.twitter.com/TartanLlama
[1]:https://linux.cn/article-8626-1.html
[2]:https://linux.cn/article-8645-1.html
[3]:https://linux.cn/article-8579-1.html
[4]:https://linux.cn/article-8719-1.html
[5]:https://linux.cn/article-8812-1.html
[6]:https://blog.tartanllama.xyz/c++/2017/05/06/writing-a-linux-debugger-dwarf-step/
[7]:https://github.com/TartanLlama/minidbg/tree/tut_dwarf_step

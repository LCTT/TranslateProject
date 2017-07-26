编写 Linux 调试器第 8 部分：堆栈展开
============================================================ 

有时你需要知道的最重要的信息是什么，你当前的程序状态是如何到达那里的。这有一个 `backtrace` 命令，它给你提供了程序当前的函数调用链。这篇文章将向你展示如何在 x86_64 上实现堆栈展开以生成这样的回溯。


* * *

### 系列索引

这些链接将会随着其他帖子的发布而上线。

1.  [设置][1]

2.  [断点][2]

3.  [寄存器和内存][3]

4.  [ELF 和 DWARF][4]

5.  [源和信号][5]

6.  [源码级单步调试][6]

7.  [源码级断点][7]

8.  [堆栈展开][8]

9.  读取变量

10.  下一步

* * *

用下面的程序作为例子：

```
void a() {
    //stopped here
}

void b() {
     a();
}

void c() {
     a();
}

int main() {
    b();
    c();
}
```

如果调试器停在 `//stopped here' 这行，那么有两种方法可以达到：`main->b->a` 或 `main->c->a`。如果我们用 LLDB 设置一个断点，继续并请求一个回溯，那么我们将得到以下内容：

```
* frame #0: 0x00000000004004da a.out`a() + 4 at bt.cpp:3
  frame #1: 0x00000000004004e6 a.out`b() + 9 at bt.cpp:6
  frame #2: 0x00000000004004fe a.out`main + 9 at bt.cpp:14
  frame #3: 0x00007ffff7a2e830 libc.so.6`__libc_start_main + 240 at libc-start.c:291
  frame #4: 0x0000000000400409 a.out`_start + 41

```

这说明我们目前在函数 `a` 中，`a` 从函数 `b` 中跳转，`b` 从 `main` 中跳转等等。最后两个帧是编译器如何引导 `main` 函数。

现在的问题是我们如何在 x86_64 上实现。最稳定的方法是解析 ELF 文件的 `.eh_frame` 部分，并解决如何从那里展开堆栈，但这会很痛苦。你可以使用 `libunwind` 或类似的来做，但这很无聊。相反，我们假设编译器以某种方式设置了堆栈，我们将手动进行。为了做到这一点，我们首先需要了解堆栈的布局。

```
            High
        |   ...   |
        +---------+
     +24|  Arg 1  |
        +---------+
     +16|  Arg 2  |
        +---------+
     + 8| Return  |
        +---------+
EBP+--> |Saved EBP|
        +---------+
     - 8|  Var 1  |
        +---------+
ESP+--> |  Var 2  |
        +---------+
        |   ...   |
            Low

```

你可以看到，最后一个堆栈帧的帧指针存储在当前堆栈帧的开始处，创建一个链接的指针列表。按照这个链表解开堆栈。我们可以通过查找 DWARF 信息中的返回地址来找出列表中下一帧的函数。一些编译器将忽略跟踪 `EBP` 的帧基址，因为这可以表示为 `ESP` 的偏移量，并可以释放一个额外的寄存器。即使启用了优化，传递 `-fno-omit-frame-pointer` 到 GCC 或 Clang 会强制它遵循我们依赖的约定。

我们将在 `print_backtrace` 函数中完成所有的工作：

```
void debugger::print_backtrace() {
```

首先要决定的是使用什么格式打印出帧信息。我用了一个 lambda 来推出这个方法：

```
    auto output_frame = [frame_number = 0] (auto&& func) mutable {
        std::cout << "frame #" << frame_number++ << ": 0x" << dwarf::at_low_pc(func)
                  << ' ' << dwarf::at_name(func) << std::endl;
    };
```

打印输出的第一帧是当前正在执行的帧。我们可以通过查找 DWARF 中的当前程序计数器来获取此帧的信息：

```
    auto current_func = get_function_from_pc(get_pc());
    output_frame(current_func);
```

接下来我们需要获取当前函数的帧指针和返回地址。帧指针存储在 `rbp` 寄存器中，返回地址从帧指针堆栈起的 8 字节。

```
    auto frame_pointer = get_register_value(m_pid, reg::rbp);
    auto return_address = read_memory(frame_pointer+8);
```

现在我们拥有了展开堆栈所需的所有信息。我只需要继续展开，直到调试器命中 `main`，但是当帧指针为 `0x0`时，你也可以选择停止，这些是你在调用 `main` 函数之前调用的函数。我们将从每帧抓取帧指针和返回地址，并打印出信息。

```
    while (dwarf::at_name(current_func) != "main") {
        current_func = get_function_from_pc(return_address);
        output_frame(current_func);
        frame_pointer = read_memory(frame_pointer);
        return_address = read_memory(frame_pointer+8);
    }
}
```

就是这样！以下是整个函数：

```
void debugger::print_backtrace() {
    auto output_frame = [frame_number = 0] (auto&& func) mutable {
        std::cout << "frame #" << frame_number++ << ": 0x" << dwarf::at_low_pc(func)
                  << ' ' << dwarf::at_name(func) << std::endl;
    };

    auto current_func = get_function_from_pc(get_pc());
    output_frame(current_func);

    auto frame_pointer = get_register_value(m_pid, reg::rbp);
    auto return_address = read_memory(frame_pointer+8);

    while (dwarf::at_name(current_func) != "main") {
        current_func = get_function_from_pc(return_address);
        output_frame(current_func);
        frame_pointer = read_memory(frame_pointer);
        return_address = read_memory(frame_pointer+8);
    }
}
```

### 添加命令

当然，我们必须向用户公开这个命令。

```
    else if(is_prefix(command, "backtrace")) {
        print_backtrace();
    }
```

### 测试

测试此功能的一个方法是通过编写一个测试程序与一堆互相调用的小函数。设置几个断点，跳在代码附近，并确保你的回溯是准确的。

* * *

我们已经从一个只能产生并附加到其他程序的程序走了很长的路。本系列的倒数第二篇文章将通过支持读写变量来完成调试器的实现。在此之前，你可以在[这里][9]找到这个帖子的代码。

--------------------------------------------------------------------------------

via: https://blog.tartanllama.xyz/c++/2017/06/24/writing-a-linux-debugger-unwinding/

作者：[Simon Brand][a]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://twitter.com/TartanLlama
[1]:https://blog.tartanllama.xyz/c++/2017/03/21/writing-a-linux-debugger-setup/
[2]:https://blog.tartanllama.xyz/c++/2017/03/24/writing-a-linux-debugger-breakpoints/
[3]:https://blog.tartanllama.xyz/c++/2017/03/31/writing-a-linux-debugger-registers/
[4]:https://blog.tartanllama.xyz/c++/2017/04/05/writing-a-linux-debugger-elf-dwarf/
[5]:https://blog.tartanllama.xyz/c++/2017/04/24/writing-a-linux-debugger-source-signal/
[6]:https://blog.tartanllama.xyz/c++/2017/05/06/writing-a-linux-debugger-dwarf-step/
[7]:https://blog.tartanllama.xyz/c++/2017/06/19/writing-a-linux-debugger-source-break/
[8]:https://blog.tartanllama.xyz/c++/2017/06/24/writing-a-linux-debugger-unwinding/
[9]:https://github.com/TartanLlama/minidbg/tree/tut_unwind

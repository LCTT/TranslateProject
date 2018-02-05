开发一个 Linux 调试器（一）：准备环境
============================================================

任何写过比 hello world 复杂一些的程序的人都应该使用过调试器（如果你还没有，那就停下手头的工作先学习一下吧）。但是，尽管这些工具已经得到了广泛的使用，却并没有太多的资源告诉你它们的工作原理以及如何开发，尤其是和其它那些比如编译器等工具链技术相比而言。

> 此处有一些其它的资源可以参考：

> - http://eli.thegreenplace.net/2011/01/23/how-debuggers-work-part-1

> - https://t-a-w.blogspot.co.uk/2007/03/how-to-code-debuggers.html

> - https://www.codeproject.com/Articles/43682/Writing-a-basic-Windows-debugger

> - http://system.joekain.com/debugger/ 

我们将会支持以下功能：

*	启动、暂停、继续执行
*	在不同地方设置断点
	*	内存地址
	*	源代码行
	*	函数入口
*	读写寄存器和内存
*	单步执行
	*	指令
	*	进入函数
	*	跳出函数
	*	跳过函数
*	打印当前代码地址
*	打印函数调用栈
*	打印简单变量的值

在最后一部分，我还会大概介绍如何给你的调试器添加下面的功能：

*	远程调试
*	共享库和动态库支持
*	表达式计算
*	多线程调试支持

在本项目中我会将重点放在 C 和 C++，但对于那些将源码编译为机器码并输出标准 DWARE 调试信息的语言也应该能起作用（如果你还不知道这些东西是什么，别担心，马上就会介绍到啦）。另外，我只关注如何将程序运行起来并在大部分情况下能正常工作，为了简便，会避开类似健壮错误处理方面的东西。

### 系列文章索引

随着后面文章的发布，这些链接会逐渐生效。

1.	[准备环境][2]
2.	[断点][3]
3.	寄存器和内存
4.	Elves 和 dwarves
5.	源码和信号
6.	源码层逐步执行
7.	源码层断点
8.	调用栈
9.	读取变量
10.	之后步骤

LCTT 译注：ELF —— <ruby>可执行文件格式<rt>[Executable and Linkable Format](https://en.wikipedia.org/wiki/Executable_and_Linkable_Format "Executable and Linkable Format")</rt></ruby>；DWARF（一种广泛使用的调试数据格式，参考 [WIKI](https://en.wikipedia.org/wiki/DWARF "DWARF WIKI")）。

### 准备环境

在我们正式开始之前，我们首先要设置环境。在这篇文章中我会依赖两个工具：[Linenoise][4] 用于处理命令行输入，[libelfin][5] 用于解析调试信息。你也可以使用更传统的 libdwarf 而不是 libelfin，但是界面没有那么友好，另外 libelfin 还提供了基本完整的 DWARF 表达式求值器，当你想读取变量的值时这能帮你节省很多时间。确认你使用的是 libelfin 我的 fbreg 分支，因为它提供 x86 上读取变量的额外支持。

一旦你在系统上安装或者使用你喜欢的编译系统编译好了这些依赖工具，就可以开始啦。我在 CMake 文件中把它们设置为和我其余的代码一起编译。

### 启动可执行程序

在真正调试任何程序之前，我们需要启动被调试的程序。我们会使用经典的 `fork`/`exec` 模式。

```
int main(int argc, char* argv[]) {
    if (argc < 2) {
        std::cerr << "Program name not specified";
        return -1;
    }

    auto prog = argv[1];

    auto pid = fork();
    if (pid == 0) {
        //we're in the child process
        //execute debugee

    }
    else if (pid >= 1)  {
        //we're in the parent process
        //execute debugger
    }
```

我们调用 `fork` 把我们的程序分成两个进程。如果我们是在子进程，`fork` 返回 0，如果我们是在父进程，它会返回子进程的进程 ID。

如果我们是在子进程，我们要用希望调试的程序替换正在执行的程序。

```
   ptrace(PTRACE_TRACEME, 0, nullptr, nullptr);
   execl(prog.c_str(), prog.c_str(), nullptr);
```

这里我们第一次遇到了 `ptrace`，它会在我们编写调试器的时候经常遇到。`ptrace` 通过读取寄存器、内存、逐步调试等让我们观察和控制另一个进程的执行。其 API 非常简单；你需要给这个简单函数提供一个枚举值指定你想要进行的操作，然后是一些取决于你所提供的值可能会被使用也可能会被忽略的参数。函数原型看起来类似：

```
long ptrace(enum __ptrace_request request, pid_t pid,
            void *addr, void *data);
```

`request` 是我们想对被跟踪进程进行的操作；`pid` 是被跟踪进程的进程 ID；`addr` 是一个内存地址，用于在一些调用中指定被跟踪程序的地址；`data` 是 `request` 相应的资源。返回值通常是一些错误信息，因此在你实际的代码中你也许应该检查返回值；为了简洁我这里就省略了。你可以查看 man 手册获取更多（关于 ptrace）的信息。

上面代码中我们发送的请求 `PTRACE_TRACEME` 表示这个进程应该允许父进程跟踪它。所有其它参数都会被忽略，因为 API 设计并不是很重要，哈哈。

下一步，我们会调用 `execl`，这是很多诸多的 `exec` 函数格式之一。我们执行指定的程序，通过命令行参数传递它的名称，然后用一个 `nullptr` 终止列表。如果你愿意，你还可以传递其它执行你的程序所需的参数。

在完成这些后，我们就会和子进程一起结束；在我们结束它之前它会一直执行。

### 添加调试循环

现在我们已经启动了子进程，我们想要能够和它进行交互。为此，我们会创建一个 `debugger` 类，循环监听用户输入，然后在我们父进程的 `main` 函数中启动它。

```
else if (pid >= 1)  {
    //parent
    debugger dbg{prog, pid};
    dbg.run();
}
```

```
class debugger {
public:
    debugger (std::string prog_name, pid_t pid)
        : m_prog_name{std::move(prog_name)}, m_pid{pid} {}

    void run();

private:
    std::string m_prog_name;
    pid_t m_pid;
};
```

在 `run` 函数中，我们需要等待，直到子进程完成启动，然后一直从 `linenoise` 获取输入直到收到 `EOF`（`CTRL+D`）。

```
void debugger::run() {
    int wait_status;
    auto options = 0;
    waitpid(m_pid, &wait_status, options);

    char* line = nullptr;
    while((line = linenoise("minidbg> ")) != nullptr) {
        handle_command(line);
        linenoiseHistoryAdd(line);
        linenoiseFree(line);
    }
}
```

当被跟踪的进程启动时，会发送一个 `SIGTRAP` 信号给它，这是一个跟踪或者断点中断。我们可以使用 `waitpid` 函数等待这个信号发送。

当我们知道进程可以被调试之后，我们监听用户输入。`linenoise` 函数它自己会用一个窗口显示和处理用户输入。这意味着我们不需要做太多的工作就会有一个支持历史记录和导航命令的命令行。当我们获取到输入时，我们把命令发给我们写的小程序 `handle_command`，然后我们把这个命令添加到 `linenoise` 历史并释放资源。

### 处理输入

我们的命令类似 gdb 以及 lldb 的格式。要继续执行程序，用户需要输入 `continue` 或 `cont` 甚至只需 `c`。如果他们想在一个地址中设置断点，他们会输入 `break 0xDEADBEEF`，其中 `0xDEADBEEF` 就是所需地址的 16 进制格式。让我们来增加对这些命令的支持吧。

```
void debugger::handle_command(const std::string& line) {
    auto args = split(line,' ');
    auto command = args[0];

    if (is_prefix(command, "continue")) {
        continue_execution();
    }
    else {
        std::cerr << "Unknown command\n";
    }
}
```

`split` 和 `is_prefix` 是一对有用的小程序：

```
std::vector<std::string> split(const std::string &s, char delimiter) {
    std::vector<std::string> out{};
    std::stringstream ss {s};
    std::string item;

    while (std::getline(ss,item,delimiter)) {
        out.push_back(item);
    }

    return out;
}

bool is_prefix(const std::string& s, const std::string& of) {
    if (s.size() > of.size()) return false;
    return std::equal(s.begin(), s.end(), of.begin());
}
```

我们会把 `continue_execution` 函数添加到 `debuger` 类。

```
void debugger::continue_execution() {
    ptrace(PTRACE_CONT, m_pid, nullptr, nullptr);

    int wait_status;
    auto options = 0;
    waitpid(m_pid, &wait_status, options);
}
```

现在我们的 `continue_execution` 函数会用 `ptrace` 告诉进程继续执行，然后用 `waitpid` 等待直到收到信号。

* * *

### 总结

现在你应该编译一些 C 或者 C++ 程序，然后用你的调试器运行它们，看它是否能在函数入口暂停、从调试器中继续执行。在下一篇文章中，我们会学习如何让我们的调试器设置断点。如果你遇到了任何问题，在下面的评论框中告诉我吧！

你可以在[这里][6]找到该项目的代码。

--------------------------------------------------------------------------------

via: http://blog.tartanllama.xyz/c++/2017/03/21/writing-a-linux-debugger-setup/

作者：[Simon Brand][a]
译者：[ictlyh](https://github.com/ictlyh)
校对：[jasminepeng](https://github.com/jasminepeng)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linkedin.com/in/simon-brand-36520857
[1]:http://blog.tartanllama.xyz/c++/2017/03/21/writing-a-linux-debugger-setup/#fn:1
[2]:http://blog.tartanllama.xyz/c++/2017/03/21/writing-a-linux-debugger-setup/
[3]:http://blog.tartanllama.xyz/c++/2017/03/24/writing-a-linux-debugger-breakpoints/
[4]:https://github.com/antirez/linenoise
[5]:https://github.com/TartanLlama/libelfin/tree/fbreg
[6]:https://github.com/TartanLlama/minidbg/tree/tut_setup

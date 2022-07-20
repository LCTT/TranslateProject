[#]: subject: "A hands-on tutorial for using the GNU Project Debugger"
[#]: via: "https://opensource.com/article/21/1/gnu-project-debugger"
[#]: author: "Stephan Avenwedde https://opensource.com/users/hansic99"
[#]: collector: "lkxed"
[#]: translator: "Maisie-x"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

手把手教你使用 GNU 调试器
======
GNU 调试器是一个发现程序缺陷的强大工具。

![magnifying glass on computer screen, finding a bug in the code][1]

图片来源：Opensource.com

如果您是一个想在您的软件增加某些功能的程序员，您首先考虑实现它的方法：例如写一个method、定义一个class或者创建新的数据类型。然后您用一种编译器或解释器可以理解的编程语言来实现这个功能。但是，如果您觉得您所有代码都正确，但是编译器或解释器依然无法理解您的指令怎么办？如果软件大多数情况下都运行良好，但是在某些环境下出现缺陷怎么办？这种情况下，您得知道如何正确使用调试器找到问题的根源。

GNU调试器([GDB][2]) 是一个发现项目缺陷的强大工具。它通过追踪程序运行过程中发生了什么来帮助您发现程序错误或崩溃的原因。

本文是GDB使用的基础教程。请跟随示例，打开命令行并克隆此仓库：

```
git clone https://github.com/hANSIc99/core_dump_example.git
```

### 快捷方式

GDB的每条命令都可以缩短。例如：`info break` ,表示设置断点，可以被缩短为 `i break`。您可能在其他地方看到过这种缩写，但在本文中，为了清晰展现使用的函数，我将所写出所有命令。

### 命令行参数

您可以将GDB附加到每个可执行文件。进入您克隆的仓库（core_dump_example），运行 `make`进行编译。您现在能看到一个名为**coredump**的可执行文件。（更多信息，请参考我的文章 [创建和调试Linux的dump文件][3] 。）

要将GDB附加到执行文件，请输入: `gdb coredump`。

您的输出应如下所示：

![gdb coredump output][4]


返回结果显示没有找到调试符号。

调试信息是目标文件（可执行文件）的组成部分，调试信息包括数据类型、函数签名、源代码和操作码之间的关系。此时，您有两种选择：

* 继续调试程序集（参见下文[无符号调试](#Debug_without_symbols)）
* 使用调试信息进行编译，参见下一节内容

### 使用调试信息进行编译

为了在二进制文件中包含调试信息，您必须重新编译。打开**Makefile**，删除第9行的(`#`) 标签后结果如下：

```
CFLAGS =-Wall -Werror -std=c++11 -g
```

`g`表示编译器包含调试信息。运行`make clean`，接着运行 `make`，然后再次调用GDB。您得到如下输出后就可以调试代码了：

![GDB output with symbols][5]

新增的调试信息会增加可执行文件的大小。在这种情况下，执行文件增加了2.5倍（从26,088 字节 增加到 65,480 字节）。

输入`run -c1`，使用`-c1`开关启动程序。当程序为 `State_4` 时，程序将启动并崩溃：

![gdb output crash on c1 switch][6]

您可以检索有关程序的其他信息， `info source`命令提供了当前文件的信息：

![gdb info source output][7]

* 101 行
* 语言: C++
* 编译器（版本、调优、架构、调试标志、语言标准)
* 调试格式：[DWARF 2][8]
* 没有预处理器宏指令（使用 GCC 编译时，宏仅在 [使用 `-g3` 标志编译][9] 时可用）。

 `info shared`命令在启动时加载的虚拟地址空间中打印动态库列表及动态库地址，以便程序运行：

![gdb info shared output][10]

如果你想了解Linux库处理，请参见我的文章 [如何在Linux中处理动态库和静态库][11]。

### 调试程序

您可能已经注意到，您可以在 GDB 中使用 `run` 命令启动程序。 `run` 命令接受命令行参数，就像从控制台启动程序一样。 `-c1` 开关会导致程序在第 4 阶段崩溃。要从头开始运行程序，您不用退出 GDB，只需再次运行'run'命令。如果没有 `-c1` 开关，程序将陷入死循环，您必须使用 **Ctrl+C** 来结束死循环。

![gdb output stopped by sigint][12]

您也可以一步一步运行程序。在 C/C++ 中，入口是 `main` 函数。使用 `list main`命令打开显示部分 `main` 函数的源代码：

![gdb output list main][13]

`main` 函数在第 33 行，因此输入`break 33` 在33行添加断点:

![gdb output breakpoint added][14]

输入 `run` 运行程序。正如预期的那样，程序在 `main` 函数处停止。输入 `layout src` 并行查看源代码：

![gdb output break at main][15]

您现在处于 GDB 的文本用户界面 (TUI) 模式。使用键盘向上和向下箭头键滚动查看源代码。

GDB 高亮显示当前行。通过输入 `next` (n)，您可以输入 `next` (n)命令逐行查看命令。如果您一直输入`next` (n)命令，GBD 会一直高亮显示到最后一个命令。要逐行运行代码，只需按 **Enter** 键。

有时，您会发现文本的输出有点显示不正常：

![gdb output corrupted][16]

如果发生这种情况，请按 **Ctrl+L** 重置屏幕。

使用**Ctrl+X+A**随意进入和退出TUI模式。您可以在手册中找到[绑定其他键][17] 。

要退出 GDB，只需输入 `quit`。

### 设置监察点

这个示例程序的核心是一个在无限循环中运行的状态机。 `n_state`变量枚举了当前所有状态：

```
while(true){
        switch(n_state){
        case State_1:
                std::cout << "State_1 reached" << std::flush;
                n_state = State_2;
                break;
        case State_2:
                std::cout << "State_2 reached" << std::flush;
                n_state = State_3;
                break;
        
        (.....)
        
        }
}
```

如果您想`n_state` 为 `State_5` 值时停止程序。为此，请在 `main` 函数处停止程序并为 `n_state` 设置监察点：

```
watch n_state == State_5
```

只有当所需的变量在当前上下文中可用时，使用变量名设置监察点才有效。

当您输入 `continue` 继续运行程序时，您会得到如下输出：

![gdb output stop on watchpoint_1][18]

如果您继续运行程序，当监察点表达式评估为 `false` 时 GDB 将停止：

![gdb output stop on watchpoint_2][19]

您可以自定义监察点的一般值、特定值，读取或写入权限。

### 更改断点和监察点

输入 `info watchpoints` 打印先前设置的监察点列表：

![gdb output info watchpoints][20]

#### 删除断点和监察点

如您所见，监察点就是数字。要删除特定的监察点，请先输入`delete`后输入监察点的编号。例如，我的监察点编号为 2；要删除此监察点，输入 `delete 2`。

*注意：* 如果您使用 `delete` 而没有指定数字，*所有* 监察点和断点将被删除。

这同样适用于断点。在下面的截屏中，我添加了几个断点，输入 `info breakpoint` 打印断点列表：

![gdb output info breakpoints][21]

要删除单个断点，请先输入`delete`后输入监察点的编号。另外一种方式：您可以通过指定断点的行号来删除断点。例如，`clear 78`命令将删除第 78 行设置的断点号 7。

#### 禁用或启用断点和监察点

除了删除断点或监察点之外，您可以通过先输入`disable`，后输入编号禁用断点或监察点。在下文中，断点 3 和 4 被禁用，并在代码窗口中用减号标记：

![disabled breakpoints][22]

也可以通过输入类似 `disable 2 - 4`修改某个范围内的断点或监察点。如果要重新激活这些点，请先输入`enable`，然后输入它们的编号。

### 条件断点

首先，输入 `delete` 删除所有断点和监察点。如果您不想指定行号而是通过直接命名函数来添加断点这种方式使程序在 `main` 函数处停止。输入 `break main` 从而在 `main` 函数处添加断点。

输入`run`从头开始运行程序，程序将在`main`函数处停止。

`main` 函数包括变量 `n_state_3_count`，当状态机达到状态 3 时，该变量会递增。

基于 `n_state_3_count` 的值添加条件断点，请输入：

```
break 54 if n_state_3_count == 3
```

![Set conditional breakpoint][23]

继续运行程序。程序将在第 54 行停止之前运行状态机 3 次。要检查 `n_state_3_count` 的值，请输入：

```
print n_state_3_count
```

![print variable][24]

#### 使断点成为条件断点

您也可以使现有断点成为条件断点。用 `clear 54` 命令删除最近添加的断点，并通过输入 `break 54`命令添加一个简单的断点。您可以输入以下内容使此断点成为条件断点：

```
condition 3 n_state_3_count == 9
```

`3` 指的是断点编号。

![modify breakpoint][25]

#### 在其他源文件中设置断点

如果您的程序由多个源文件组成，您可以在行号前指定文件名来设置断点，例如，`break main. cpp:54`。

#### 捕捉断点

除了断点和监察点之外，您还可以设置捕获点。捕获点适用于执行系统调用、加载共享库或引发异常等事件。

要捕获用于写入 STDOUT 的 `write` 系统调用，请输入：

```
catch syscall write
```

![catch syscall write output][26]

每当程序写入控制台输出时，GDB将中断执行。

在手册中，您可以找到一整章 [断点、监察点和捕捉点][27] 的内容。

### 评估和操作符号

用`print`命令打印变量的值。一般语法是`print <表达式> <值>`。修改变量的值，请输入：

```
set variable <variable-name> <new-value>.
```

在下面的截屏中，我将变量 `n_state_3_count` 的值设为 *123*。

![catch syscall write output][28]

`/x` 表达式以十六进制打印值；使用 `&` 运算符，您可以打印虚拟地址空间内的地址。

如果您不确定某个符号的数据类型，可以使用 `whatis` 来查明。

![whatis output][29]

如果您要列出 `main` 函数范围内可用的所有变量，请输入`info scope main` :

![info scope main output][30]

`DW_OP_fbreg` 值是指基于当前子程序的堆栈偏移量。

或者，如果您已经在一个函数中并且想要列出当前堆栈帧上的所有变量，您可以使用 `info locals` :

![info locals output][31]

查看手册以了解更多[检查符号][32]的内容。

### 调试正在运行的进程

`gdb attach <process-id>`命令允许您通过指定进程ID（PID）调试已经在运行的进程。幸运的是，`coredump` 程序将其当前 PID 打印到屏幕上，因此您不必使用 [ps][33] 或 [top][34] 手动查找PID。

启动 coredump 应用程序的一个实例：

```
./coredump
```

![coredump application][35]

操作系统显示PID为 `2849`。打开一个单独的控制台窗口，移动到 coredump 应用程序的根目录，然后调试GDB：
```
gdb attach 2849
```

![attach GDB to coredump][36]

当你调试 GDB 时，GDB会立即停止运行。输入 `layout src` 和 `backtrace` 来检查调用堆栈：

![layout src and backtrace output][37]

输出显示在`main.cpp`第92行运行 `std::this_thread::sleep_for<...>(. ..) `函数时进程中断。

只要您退出 GDB，该进程将继续运行。

您可以在 GDB 手册中找到有关 [调试正在运行的进程][38] 的更多信息。

#### 在堆栈中移动

在命令窗口，输入`up` 两次可以在堆栈中向上移动到 `main.cpp` :

![moving up the stack to main.cpp][39]

通常，编译器将为每个函数或方法创建一个子程序。每个子程序都有自己的栈帧，所以在栈帧中向上移动意味着在调用栈中向上移动。

您可以在手册中找到有关 [堆栈计算][40] 的更多信息。

#### 指定源文件

当调试一个已经在运行的进程时，GDB 将在当前工作目录中寻找源文件。您也可以使用 [目录命令][41] 手动指定源目录。

### 评估dump文件

阅读 [创建和调试Linux的dump文件][42] 了解有关此主题的信息。

参考文章太长，没看的看下文:

1. 假设您使用的是最新版本的 Fedora
2. 使用 c1 开关调用 coredump：`coredump -c1`

![Crash meme][44]

3. 使用 GDB 加载最新的dump文件：`coredumpctl debug`
4. 打开 TUI 模式并输入 `layout src`

![coredump output][45]

`backtrace` 的输出显示崩溃发生在距离 `main.cpp` 五个堆栈帧之外。回车直接跳转到`main.cpp`中的错误代码行：

![up 5 output][46]

看源码发现程序试图释放一个内存管理函数没有返回的指针。这会导致未定义的行为并引起`SIGABRT`。

### <a id="Debug_without_symbols">无符号调试</a>

如果没有可用的资源，事情会变得非常困难。当我在尝试解决逆向工程的挑战时，我第一次体验到了这一点。了解一些 [汇编语言][47] 的知识会很有用。

我们用例子看看它是如何运行的。

找到根目录，打开 **Makefile**，然后像下面一样编辑第 9 行：

```
CFLAGS =-Wall -Werror -std=c++11 #-g
```

要重新编译程序，先运行 `make clean`  ，再运行 `make` ，最后启动 GDB。该程序不再有任何调试符号来引导源代码。

![no debugging symbols][48]

`info file`命令显示二进制文件的内存区域和入口点：

![info file output][49]

`.text`区段始终从入口点开始，其中包含实际的操作码。要在入口点添加断点，输入 `break *0x401110` 然后输入 `run` 开始运行程序：

![breakpoint at the entry point][50]

要在某个地址设置断点，使用取消引用运算符`*`指定地址。

#### 选择反汇编程序风格

在深入研究汇编之前，您可以选择要使用的 [汇编风格][51] 。 GDB 默认是 AT&T，但我更喜欢 Intel 语法。变更风格如下：

```
set disassembly-flavor intel
```
![changing assembly flavor][52]

现在输入 `layout asm` 调出汇编代码窗口，输入 `layout reg` 调出寄存器窗口。您现在应该看到如下输出：

![layout asm and layout reg output][53]

#### 保存配置文件

尽管您已经输入了许多命令，但实际上还没有开始调试。如果您正在大量调试应用程序或尝试解决逆向工程的难题，则将 GDB 特定设置保存在文件中会很有用。

该项目的 GitHub 存储库中的 [config file gdbinit][54] 包含最近使用的命令：

```
set disassembly-flavor intel
set write on
break *0x401110
run -c2
layout asm
layout reg
```

`set write on` 命令使您能够在程序运行期间修改二进制文件。

退出 GDB 并使用配置文件重新启动 GDB ： `gdb -x gdbinit coredump`

#### 阅读指令

应用 `c2` 开关后，程序将崩溃。程序在入口函数处停止，因此您必须编写 `continue` 才能继续运行：

![continuing execution after crash][55]

`idiv` 指令进行整数除法运算： `RAX` 寄存器中为被除数，指定参数为除数。商被加载到 `RAX` 寄存器中，余数被加载到 `RDX` 中。

从寄存器角度，您可以看到 `RAX` 包含 *5*，因此您必须找出存储堆栈中位置为 `RBP-0x4` 的值。

#### 读取内存

要读取原始内存内容，您必须指定比读取符号更多的参数。在汇编输出中向上滚动一点，可以看到堆栈的划分：

![stack division output][56]

您最感兴趣的应该是 `rbp-0x4` 的值，因为它是 `idiv` 的存储参数。您可以从截图中看到`rbp-0x8`位置的下一个变量，所以`rbp-0x4`位置的变量是4字节宽。

在 GDB 中，您可以使用 `x` 命令*检查*任何内存内容：


> `x/` < 可选参数 `n` `f` `u` > < 内存地址 `addr` >

可选参数：

* n: 单元大小的重复计数（默认值：1）
* f：格式说明符，如 [printf][57]
* u：单元大小
  * b：字节
  * h：2个字节
  * w: 4个字节(默认)
  * g: 8个字节

要打印 `rbp-0x4` 的值，请输入 `x/u $rbp-4` :

![print value][58]

如果您能记住这种模式，则可以直接检查内存。检查手册中的 [查看内存][59] 部分。

#### 操作程序集

子程序 `zeroDivide()` 发生运算异常。当你用向上箭头键向上滚动一点时，您会找到下面信息：

```
0x401211 <_Z10zeroDividev>              push   rbp
0x401212 <_Z10zeroDividev+1>            mov    rbp,rsp
```

这被称为 [函数前言][60 ]：

1. 调用函数的基指针（rbp）存放在栈上
2. 栈指针（rsp）的值被加载到基指针（rbp）

完全跳过这个子程序。您可以使用 `backtrace` 检查调用堆栈。在 `main` 函数之前只有一个堆栈帧，所以您可以用一次 `up` 回到 `main` :

![Callstack assembly][61]

在您的 `main` 函数中，你会找到下面信息:

```
0x401431 <main+497>     cmp    BYTE PTR [rbp-0x12],0x0
0x401435 <main+501>     je     0x40145f <main+543>
0x401437 <main+503>     call   0x401211<_Z10zeroDividev>
```

子程序 `zeroDivide()` 仅在 `jump equal (je)` 为 `true` 时输入。您可以轻松地将其替换为 `jump-not-equal (jne)` 指令，该指令的操作码为“0x75”（假设您使用的是 x86/64 架构；其他架构上的操作码不同）。输入 `run` 重新启动程序。当程序在入口函数处停止时，设置操作码：

```
set *(unsigned char*)0x401435 = 0x75
```

最后，输入 `continue` 。该程序将跳过子程序 `zeroDivide()` 并且不会再崩溃。

### 总结

您会在许多集成开发环境 (IDE) 中发现 GDB 在后台运行，包括 Qt Creator 和 VSCodium 的扩展 [本地调试][62]  。

![GDB in VSCodium][63]

了解如何充分利用 GDB 的功能很有用。一般情况下，并非所有 GDB 的功能都可以在 IDE 中使用，因此您可以从命令行使用 GDB 的经验中受益。


--------------------------------------------------------------------------------

via: https://opensource.com/article/21/1/gnu-project-debugger

作者：[Stephan Avenwedde][a]
选题：[lkxed][b]
译者：[Maisie-x](https://github.com/Maisie-x)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/hansic99
[b]: https://github.com/lkxed
[1]: https://opensource.com/sites/default/files/lead-images/mistake_bug_fix_find_error.png
[2]: https://www.gnu.org/software/gdb/
[3]: https://opensource.com/article/20/8/linux-dump
[4]: https://opensource.com/sites/default/files/uploads/gdb_output_no_dbg_symbols.png
[5]: https://opensource.com/sites/default/files/uploads/gdb_output_with_symbols.png
[6]: https://opensource.com/sites/default/files/uploads/gdb_output_crash_on_c1_switch.png
[7]: https://opensource.com/sites/default/files/uploads/gdb_output_info_source.png
[8]: http://dwarfstd.org/
[9]: https://sourceware.org/gdb/current/onlinedocs/gdb/Compilation.html#Compilation
[10]: https://opensource.com/sites/default/files/uploads/gdb_output_info_shared.png
[11]: https://opensource.com/article/20/6/linux-libraries
[12]: https://opensource.com/sites/default/files/uploads/gdb_output_stopped_by_sigint.png
[13]: https://opensource.com/sites/default/files/uploads/gdb_output_list_main.png
[14]: https://opensource.com/sites/default/files/uploads/gdb_output_breakpoint_added.png
[15]: https://opensource.com/sites/default/files/uploads/gdb_output_break_at_main.png
[16]: https://opensource.com/sites/default/files/images/gdb_output_screen_corrupted.png
[17]: https://sourceware.org/gdb/onlinedocs/gdb/TUI-Keys.html#TUI-Keys
[18]: https://opensource.com/sites/default/files/uploads/gdb_output_stop_on_watchpoint_1.png
[19]: https://opensource.com/sites/default/files/uploads/gdb_output_stop_on_watchpoint_2.png
[20]: https://opensource.com/sites/default/files/uploads/gdb_output_info_watchpoints.png
[21]: https://opensource.com/sites/default/files/uploads/gdb_output_info_breakpoints.png
[22]: https://opensource.com/sites/default/files/uploads/gdb_output_disabled_breakpoints.png
[23]: https://opensource.com/sites/default/files/uploads/gdb_output_set_conditional_breakpoint.png
[24]: https://opensource.com/sites/default/files/uploads/gdb_output_print_variable.png
[25]: https://opensource.com/sites/default/files/uploads/gdb_output_modify_breakpoint.png
[26]: https://opensource.com/sites/default/files/uploads/gdb_output_syscall_catch.png
[27]: https://sourceware.org/gdb/current/onlinedocs/gdb/Breakpoints.html#Breakpoints
[28]: https://opensource.com/sites/default/files/uploads/gdb_output_print_and_modify.png
[29]: https://opensource.com/sites/default/files/uploads/gdb_output_whatis.png
[30]: https://opensource.com/sites/default/files/uploads/gdb_output_info_scope_main.png
[31]: https://opensource.com/sites/default/files/uploads/gdb_output_info_locals_main.png
[32]: https://sourceware.org/gdb/current/onlinedocs/gdb/Symbols.html
[33]: https://man7.org/linux/man-pages/man1/ps.1.html
[34]: https://man7.org/linux/man-pages/man1/top.1.html
[35]: https://opensource.com/sites/default/files/uploads/coredump_running.png
[36]: https://opensource.com/sites/default/files/uploads/gdb_output_attaching_to_process.png
[37]: https://opensource.com/sites/default/files/uploads/gdb_output_backtrace.png
[38]: https://sourceware.org/gdb/current/onlinedocs/gdb/Attach.html#Attach
[39]: https://opensource.com/sites/default/files/uploads/gdb_output_stackframe_up.png
[40]: https://sourceware.org/gdb/current/onlinedocs/gdb/Stack.html#Stack
[41]: https://ftp.gnu.org/old-gnu/Manuals/gdb/html_node/gdb_48.html#SEC49
[42]: https://opensource.com/article/20/8/linux-dump
[43]: https://creativecommons.org/licenses/by-sa/4.0/
[44]: https://opensource.com/sites/default/files/uploads/crash.png
[45]: https://opensource.com/sites/default/files/uploads/gdb_output_coredump.png
[46]: https://opensource.com/sites/default/files/uploads/gdb_output_up_five.png
[47]: https://en.wikipedia.org/wiki/Assembly_language
[48]: https://opensource.com/sites/default/files/uploads/gdb_output_no_debugging_symbols.png
[49]: https://opensource.com/sites/default/files/uploads/gdb_output_info_file.png
[50]: https://opensource.com/sites/default/files/uploads/gdb_output_break_at_start.png
[51]: https://en.wikipedia.org/wiki/X86_assembly_language#Syntax
[52]: https://opensource.com/sites/default/files/uploads/gdb_output_disassembly_flavor.png
[53]: https://opensource.com/sites/default/files/uploads/gdb_output_layout_reg_asm.png
[54]: https://github.com/hANSIc99/core_dump_example/blob/master/gdbinit
[55]: https://opensource.com/sites/default/files/uploads/gdb_output_asm_div_zero.png
[56]: https://opensource.com/sites/default/files/uploads/gdb_output_stack_division.png
[57]: https://en.wikipedia.org/wiki/Printf_format_string#Type_field
[58]: https://opensource.com/sites/default/files/uploads/gdb_output_examine_1.png
[59]: https://sourceware.org/gdb/current/onlinedocs/gdb/Memory.html
[60]: https://en.wikipedia.org/wiki/Function_prologue
[61]: https://opensource.com/sites/default/files/uploads/gdb_output_callstack_assembly_0.png
[62]: https://github.com/WebFreak001/code-debug
[63]: https://opensource.com/sites/default/files/uploads/vs_codium_native_debug.png

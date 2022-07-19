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
GNU 调试器是一个强大的发现程序缺陷的工具。

![magnifying glass on computer screen, finding a bug in the code][1]

图片来源：Opensource.com

如果您是一个想在您的软件增加某些功能的程序员，您首先考虑实现它的方法：例如写一个method、定义一个class或者创建新的数据类型。然后您用一种编译器或解释器可以理解的编程语言来实现这个功能。但是，如果您觉得您所有代码都正确，但是编译器或解释器依然无法理解您的指令怎么办？如果软件大多数情况下都运行良好，但是在某些环境下出现缺陷怎么办？这种情况下，您得知道如何正确使用调试器找到问题的根源。

GNU调试器([GDB][2]) 是一个发现项目缺陷的强大工具。它通过追踪程序运行过程中发生了什么来帮助您发现程序错误或崩溃的原因。
本文是GDB使用的基础教程。请跟随示例，打开命令行并克隆此仓库：
```
git clone https://github.com/hANSIc99/core_dump_example.git
```

### 快捷方式
GDB的每条命令都可以缩短。例如：“info break”,表示设置断点，可以被缩短为“i break”。您可能在其他地方看到过这种缩写，但在本文中，为了清晰展现使用的函数，我将所写出所有命令。


### 命令行参数

您可以将GDB附加到每个可执行文件。进入您克隆的仓库（core_dump_example），运行'make'进行编译。您现在能看到一个名为**coredump**的可执行文件。（更多信息，请参考我的文章 [Creating and debugging Linux dump files][3] 。）


要将GDB附加到执行文件，请输入: `gdb coredump`。

您的输出应如下所示：

![gdb coredump output][4]


返回结果显示没有找到调试符号。

调试信息是目标文件（可执行文件）的组成部分，调试信息包括数据类型、函数签名、源代码和操作码之间的关系。此时，您有两种选择：

* 继续调试程序集（参见下文"Debug without symbols"）
* 使用调试信息进行编译，参见下一节内容

### Compile with debug information使用调试信息进行编译

为了在二进制文件中包含调试信息，您必须重新编译。打开**Makefile**，删除第9行的(`#`) 标签后结果如下：

```
CFLAGS =-Wall -Werror -std=c++11 -g
```

'g'表示编译器包含调试信息。运行'make clean'，接着运行 'make'，然后再次调用GDB。您得到如下输出后就可以调试代码了：

![GDB output with symbols][5]

新增的调试信息会增加可执行文件的大小。在这种情况下，执行文件增加了2.5倍（从26,088 字节 增加到 65,480 字节）。

输入“run -c1”，使用“-c1”开关启动程序。当程序为 `State_4` 时，程序将启动并崩溃：

![gdb output crash on c1 switch][6]

您可以检索有关程序的其他信息， `info source`命令提供了当前文件的信息：

![gdb info source output][7]


* 101 行
* 语言: C++
* 编译器（版本、调优、架构、调试标志、语言标准)
* 调试格式: [DWARF 2][8]
* 没有预处理器宏指令（使用 GCC 编译时，宏仅在 [使用 `-g3` 标志编译][9] 时可用）。



 `info shared`命令在启动时加载的虚拟地址空间中打印动态库列表及动态库地址，以便程序运行：

![gdb info shared output][10]

如果你想了解Linux库处理，请参见我的文章 [How to handle dynamic and static libraries in Linux][11].

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
GDB highlights the line to be executed. By typing `next` (n), you can execute the commands line by line. GBD executes the last command if you don't specify a new one. To step through the code, just hit the **Enter** key.

有时，您会发现文本的输出有点显示不正常：

![gdb output corrupted][16]

如果发生这种情况，请按 **Ctrl+L** 重置屏幕。

使用**Ctrl+X+A**随意进入和退出TUI模式。您可以在手册中找到[other key bindings][17] 。

要退出 GDB，只需输入 `quit`。

###设置观察点

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

如果您想`n_state` 为 `State_5` 值时停止程序。为此，请在 `main` 函数处停止程序并为 `n_state` 设置观察点：

```
watch n_state == State_5
```

只有当所需的变量在当前上下文中可用时，使用变量名设置观察点才有效。

当您输入 `continue` 继续运行程序时，您会得到如下输出：

![gdb output stop on watchpoint_1][18]

如果您继续运行程序，当观察点表达式评估为 `false` 时 GDB 将停止：

![gdb output stop on watchpoint_2][19]

您可以自定义观察点的一般值、特定值，读取或写入权限。You can specify watchpoints for general value changes, specific values, and read or write access.

### 更改断点和观察点

Type `info watchpoints` to print a list of previously set watchpoints:

![gdb output info watchpoints][20]

#### Delete breakpoints and watchpoints

As you can see, watchpoints are numbers. To delete a specific watchpoint, type `delete` followed by the number of the watchpoint. For example, my watchpoint has the number 2; to remove this watchpoint, enter `delete 2`.

*Caution:* If you use `delete` without specifying a number, *all* watchpoints and breakpoints will be deleted.

The same applies to breakpoints. In the screenshot below, I added several breakpoints and printed a list of them by typing `info breakpoint` :

![gdb output info breakpoints][21]

To remove a single breakpoint, type `delete` followed by its number. Alternatively, you can remove a breakpoint by specifying its line number. For example, the command `clear 78` will remove breakpoint number 7, which is set on line 78.

#### Disable or enable breakpoints and watchpoints

Instead of removing a breakpoint or watchpoint, you can disable it by typing `disable` followed by its number. In the following, breakpoints 3 and 4 are disabled and are marked with a minus sign in the code window:

![disabled breakpoints][22]

It is also possible to modify a range of breakpoints or watchpoints by typing something like `disable 2 - 4`. If you want to reactivate the points, type `enable` followed by their numbers.

### Conditional breakpoints

First, remove all breakpoints and watchpoints by typing `delete`. You still want the program to stop at the `main` function, but instead of specifying a line number, add a breakpoint by naming the function directly. Type `break main` to add a breakpoint at the `main` function.

Type `run` to start the execution from the beginning, and the program will stop at the `main` function.

The `main` function includes the variable `n_state_3_count`, which is incremented when the state machine hits state 3.

To add a conditional breakpoint based on the value of `n_state_3_count` type:

```
break 54 if n_state_3_count == 3
```

![Set conditional breakpoint][23]

Continue the execution. The program will execute the state machine three times before it stops at line 54. To check the value of `n_state_3_count`, type:

```
print n_state_3_count
```

![print variable][24]

#### Make breakpoints conditional

It is also possible to make an existing breakpoint conditional. Remove the recently added breakpoint with `clear 54`, and add a simple breakpoint by typing `break 54`. You can make this breakpoint conditional by typing:

```
condition 3 n_state_3_count == 9
```

The `3` refers to the breakpoint number.

![modify breakpoint][25]

#### Set breakpoints in other source files

If you have a program that consists of several source files, you can set breakpoints by specifying the file name before the line number, e.g., `break main.cpp:54`.

#### Catchpoints

In addition to breakpoints and watchpoints, you can also set catchpoints. Catchpoints apply to program events like performing syscalls, loading shared libraries, or raising exceptions.

To catch the `write` syscall, which is used to write to STDOUT, enter:

```
catch syscall write
```

![catch syscall write output][26]

Each time the program writes to the console output, GDB will interrupt execution.

In the manual, you can find a whole chapter [covering break-, watch-, and catchpoints][27].

### Evaluate and manipulate symbols

Printing the values of variables is done with the `print` command. The general syntax is `print <expression> <value>`. The value of a variable can be modified by typing:

```
set variable <variable-name> <new-value>.
```

In the screenshot below, I gave the variable `n_state_3_count` the value *123*.

![catch syscall write output][28]

The `/x` expression prints the value in hexadecimal; with the `&` operator, you can print the address within the virtual address space.

If you are not sure of a certain symbol's data type, you can find it with `whatis` :

![whatis output][29]

If you want to list all variables that are available in the scope of the `main` function, type `info scope main` :

![info scope main output][30]

The `DW_OP_fbreg` values refer to the stack offset based on the current subroutine.

Alternatively, if you are already inside a function and want to list all variables on the current stack frame, you can use `info locals` :

![info locals output][31]

Check the manual to learn more about [examining symbols][32].

### Attach to a running process

The command `gdb attach <process-id>` allows you to attach to an already running process by specifying the process ID (PID). Luckily, the `coredump` program prints its current PID to the screen, so you don't have to manually find it with [ps][33] or [top][34].

Start an instance of the coredump application:

```
./coredump
```

![coredump application][35]

The operating system gives the PID `2849`. Open a separate console window, move to the coredump application's source directory, and attach GDB:

```
gdb attach 2849
```

![attach GDB to coredump][36]

GDB immediately stops the execution when you attach it. Type `layout src` and `backtrace` to examine the call stack:

![layout src and backtrace output][37]

The output shows the process interrupted while executing the `std::this_thread::sleep_for<...>(...)` function that was called in line 92 of `main.cpp`.

As soon as you quit GDB, the process will continue running.

You can find more information about [attaching to a running process][38] in the GDB manual.

#### Move through the stack

Return to the program by using `up` two times to move up in the stack to `main.cpp` :

![moving up the stack to main.cpp][39]

Usually, the compiler will create a subroutine for each function or method. Each subroutine has its own stack frame, so moving upwards in the stackframe means moving upwards in the callstack.

You can find out more about [stack evaluation][40] in the manual.

#### Specify the source files

When attaching to an already running process, GDB will look for the source files in the current working directory. Alternatively, you can specify the source directories manually with the [directory command][41].

### Evaluate dump files

Read [Creating and debugging Linux dump files][42] for information about this topic.

TL;DR:

1. I assume you're working with a recent version of Fedora
2. Invoke coredump with the c1 switch: `coredump -c1`
3. Load the latest dumpfile with GDB: `coredumpctl debug`
4. Open TUI mode and enter `layout src`

![Crash meme][44]

![coredump output][45]

The output of `backtrace` shows that the crash happened five stack frames away from `main.cpp`. Enter to jump directly to the faulty line of code in `main.cpp` :

![up 5 output][46]

A look at the source code shows that the program tried to free a pointer that was not returned by a memory management function. This results in undefined behavior and caused the `SIGABRT`.

### Debug without symbols

If there are no sources available, things get very hard. I had my first experience with this when trying to solve reverse-engineering challenges. It is also useful to have some knowledge of [assembly language][47].

Check out how it works with this example.

Go to the source directory, open the **Makefile**, and edit line 9 like this:

```
CFLAGS =-Wall -Werror -std=c++11 #-g
```

To recompile the program, run `make clean`  followed by `make` and start GDB. The program no longer has any debugging symbols to lead the way through the source code.

![no debugging symbols][48]

The command `info file` reveals the memory areas and entry point of the binary:

![info file output][49]

The entry point corresponds with the beginning of the `.text` area, which contains the actual opcode. To add a breakpoint at the entry point, type `break *0x401110` then start execution by typing `run` :

![breakpoint at the entry point][50]

To set up a breakpoint at a certain address, specify it with the dereferencing operator `*`.

#### Choose the disassembler flavor

Before digging deeper into assembly, you can choose which [assembly flavor][51] to use. GDB's default is AT&T, but I prefer the Intel syntax. Change it with:

```
set disassembly-flavor intel
```

![changing assembly flavor][52]

Now open the assembly and register the window by typing `layout asm` and `layout reg`. You should now see output like this:

![layout asm and layout reg output][53]

#### Save configuration files

Although you have already entered many commands, you haven't actually started debugging. If you are heavily debugging an application or trying to solve a reverse-engineering challenge, it can be useful to save your GDB-specific settings in a file.

The [config file gdbinit][54] in this project's GitHub repository contains the recently used commands:

```
set disassembly-flavor intel
set write on
break *0x401110
run -c2
layout asm
layout reg
```

The `set write on` command enables you to modify the binary during execution.

Quit GDB and reopen it with the configuration file: `gdb -x gdbinit coredump`.

#### Read instructions

With the `c2` switch applied, the program will crash. The program stops at the entry function, so you have to write `continue` to proceed with execution:

![continuing execution after crash][55]

The `idiv` instruction performs an integer division with the dividend in the `RAX` register and the divisor specified as an argument. The quotient is loaded into the `RAX` register, and the remainder is loaded into `RDX`.

From the register overview, you can see the `RAX` contains *5*, so you have to find out which value is stored on the stack at position `RBP-0x4`.

#### Read memory

To read raw memory content, you must specify a few more parameters than for reading symbols. When you scroll up a bit in the assembly output, you can see the division of the stack:

![stack division output][56]

You're most interested in the value of `rbp-0x4` because this is the position where the argument for `idiv` is stored. From the screenshot, you can see that the next variable is located at `rbp-0x8`, so the variable at `rbp-0x4` is 4 bytes wide.

In GDB, you can use the `x` command to *examine* any memory content:

> `x/` < optional parameter `n` `f` `u` > < memory address `addr` >

Optional parameters:

* n: Repeat count (default: 1) refers to the unit size
* f: Format specifier, like in [printf][57]
* u: Unit size
  * b: `b`ytes
h: `h`alf `w`ords (2 bytes)
w: word (4 bytes)(default)
  * g: `g`iant word (8 bytes)

To print out the value at `rbp-0x4`, type `x/u $rbp-4` :

![print value][58]

If you keep this pattern in mind, it's straightforward to examine the memory. Check the [examining memory][59] section in the manual.

#### Manipulate the assembly

The arithmetic exception happened in the subroutine `zeroDivide()`. When you scroll a bit upward with the Up arrow key, you can find this pattern:

```
0x401211 <_Z10zeroDividev>              push   rbp
0x401212 <_Z10zeroDividev+1>            mov    rbp,rsp
```

This is called the [function prologue][60]:

1. The base pointer (rbp) of the calling function is stored on the stack
2. The value of the stack pointer (rsp) is loaded to the base pointer (rbp)

Skip this subroutine completely. You can check the call stack with `backtrace`. You are only one stack frame ahead of your `main` function, so you can go back to `main` with a single `up` :

![Callstack assembly][61]

In your `main` function, you can find this pattern:

```
0x401431 <main+497>     cmp    BYTE PTR [rbp-0x12],0x0
0x401435 <main+501>     je     0x40145f <main+543>
0x401437 <main+503>     call   0x401211<_Z10zeroDividev>
```

The subroutine `zeroDivide()` is entered only when `jump equal (je)` evaluates to `true`. You can easily replace this with a `jump-not-equal (jne)` instruction, which has the opcode `0x75` (provided you are on an x86/64 architecture; the opcodes are different on other architectures). Restart the program by typing `run`. When the program stops at the entry function, manipulate the opcode by typing:

```
set *(unsigned char*)0x401435 = 0x75
```

Finally, type `continue`. The program will skip the subroutine `zeroDivide()` and won't crash anymore.

### Conclusion

You can find GDB working in the background in many integrated development environments (IDEs), including Qt Creator and the [Native Debug][62] extension for VSCodium.

![GDB in VSCodium][63]

It's useful to know how to leverage GDB's functionality. Usually, not all of GDB's functions can be used from the IDE, so you benefit from having experience using GDB from the command line.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/1/gnu-project-debugger

作者：[Stephan Avenwedde][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
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

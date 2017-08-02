开发一个 Linux 调试器（四）：Elves 和 dwarves
============================================================ 

到目前为止，你已经偶尔听到了关于 dwarves、调试信息、一种无需解析就可以理解源码方式。今天我们会详细介绍源码级的调试信息，作为本指南后面部分使用它的准备。

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

### ELF 和 DWARF 简介

ELF 和 DWARF 可能是两个你没有听说过，但可能大部分时间都在使用的组件。ELF（[Executable and Linkable Format](https://en.wikipedia.org/wiki/Executable_and_Linkable_Format "Executable and Linkable Format")，可执行和可链接格式）是 Linux 系统中使用最广泛的目标文件格式；它指定了一种存储二进制文件的所有不同部分的方式，例如代码、静态数据、调试信息以及字符串。它还告诉加载器如何加载二进制文件并准备执行，其中包括说明二进制文件不同部分在内存中应该放置的地点，哪些位需要根据其它组件的位置固定（_重分配_）以及其它。在这些博文中我不会用太多篇幅介绍 ELF，但是如果你感兴趣的话，你可以查看[这个很好的信息图][7]或[该标准][8]。

[DWARF](https://en.wikipedia.org/wiki/DWARF "DWARF WIKI")是通常和 ELF 一起使用的调试信息格式。它不一定要绑定到 ELF，但它们两者是一起发展的，一起工作得很好。这种格式允许编译器告诉调试器最初的源代码如何和被执行的二进制文件相关联。这些信息分散到不同的 ELF 部分，每个部分都衔接有一份它自己的信息。下面不同部分的定义，信息取自这个稍有过时但非常重要的 [DWARF 调试格式简介][9]：

*   `.debug_abbrev` `.debug_info` 部分使用的缩略语
*   `.debug_aranges` 内存地址和编译的映射
*   `.debug_frame` 调用帧信息
*   `.debug_info` 包括 DWARF 信息条目（DIEs：DWARF Information Entries）的核心 DWARF 数据
*   `.debug_line` 行号程序
*   `.debug_loc` 位置描述
*   `.debug_macinfo` 宏描述
*   `.debug_pubnames` 全局对象和函数查找表
*   `.debug_pubtypes` 全局类型查找表
*   `.debug_ranges` DIEs 的引用地址范围
*   `.debug_str` `.debug_info` 使用的字符串列表
*   `.debug_types` 类型描述

我们最关心的是 `.debug_line` 和 `.debug_info` 部分，让我们来看一个简单程序的 DWARF 信息。

```
int main() {
    long a = 3;
    long b = 2;
    long c = a + b;
    a = 4;
}
```

### DWARF 行表

如果你用 `-g` 选项编译这个程序，然后将结果传递给 `dwarfdump` 执行，在行号部分你应该可以看到类似这样的东西：

```
.debug_line: line number info for a single cu
Source lines (from CU-DIE at .debug_info offset 0x0000000b):

            NS new statement, BB new basic block, ET end of text sequence
            PE prologue end, EB epilogue begin
            IS=val ISA number, DI=val discriminator value
<pc>        [lno,col] NS BB ET PE EB IS= DI= uri: "filepath"
0x00400670  [   1, 0] NS uri: "/home/simon/play/MiniDbg/examples/variable.cpp"
0x00400676  [   2,10] NS PE
0x0040067e  [   3,10] NS
0x00400686  [   4,14] NS
0x0040068a  [   4,16]
0x0040068e  [   4,10]
0x00400692  [   5, 7] NS
0x0040069a  [   6, 1] NS
0x0040069c  [   6, 1] NS ET

```

前面几行是一些如何理解 dump 的信息 - 主要的行号数据从以 `0x00400670` 开头的行开始。实际上这是一个代码内存地址到文件中行列号的映射。`NS` 表示地址标记一个新语句的开始，这通常用于设置断点或逐步执行。`PE` 表示函数序言（LCTT 译注：在汇编语言中，[function prologue](https://en.wikipedia.org/wiki/Function_prologue "function prologue") 是程序开始的几行代码，用于准备函数中用到的栈和寄存器）的结束，这对于设置函数断点非常有帮助。`ET` 表示转换单元的结束。信息实际上并不像这样编码；真正的编码是一种非常节省空间的排序程序，可以通过执行它来建立这些行信息。

那么，假设我们想在 `variable.cpp` 的第 4 行设置断点，我们该怎么做呢？我们查找和该文件对应的条目，然后查找对应的行条目，查找对应的地址，在那里设置一个断点。在我们的例子中，条目是：

```
0x00400686  [   4,14] NS

```

假设我们想在地址 `0x00400686` 处设置断点。如果你想尝试的话你可以在已经编写好的调试器上手动实现。

反过来也是如此。如果我们已经有了一个内存地址 - 例如说，一个程序计数器值 - 想找到它在源码中的位置，我们只需要从行表信息中查找最接近的映射地址并从中抓取行号。

### DWARF 调试信息

`.debug_info` 部分是 DWARF 的核心。它给我们关于我们程序中存在的类型、函数、变量、希望和梦想的信息。这部分的基本单元是 DWARF 信息条目（DWARF Information Entry），我们亲切地称之为 DIEs。一个 DIE 包括能告诉你正在展现什么样的源码级实体的标签，后面跟着一系列该实体的属性。这是我上面展示的简单事例程序的 `.debug_info` 部分：

```
.debug_info

COMPILE_UNIT<header overall offset = 0x00000000>:
< 0><0x0000000b>  DW_TAG_compile_unit
                    DW_AT_producer              clang version 3.9.1 (tags/RELEASE_391/final)
                    DW_AT_language              DW_LANG_C_plus_plus
                    DW_AT_name                  /super/secret/path/MiniDbg/examples/variable.cpp
                    DW_AT_stmt_list             0x00000000
                    DW_AT_comp_dir              /super/secret/path/MiniDbg/build
                    DW_AT_low_pc                0x00400670
                    DW_AT_high_pc               0x0040069c

LOCAL_SYMBOLS:
< 1><0x0000002e>    DW_TAG_subprogram
                      DW_AT_low_pc                0x00400670
                      DW_AT_high_pc               0x0040069c
                      DW_AT_frame_base            DW_OP_reg6
                      DW_AT_name                  main
                      DW_AT_decl_file             0x00000001 /super/secret/path/MiniDbg/examples/variable.cpp
                      DW_AT_decl_line             0x00000001
                      DW_AT_type                  <0x00000077>
                      DW_AT_external              yes(1)
< 2><0x0000004c>      DW_TAG_variable
                        DW_AT_location              DW_OP_fbreg -8
                        DW_AT_name                  a
                        DW_AT_decl_file             0x00000001 /super/secret/path/MiniDbg/examples/variable.cpp
                        DW_AT_decl_line             0x00000002
                        DW_AT_type                  <0x0000007e>
< 2><0x0000005a>      DW_TAG_variable
                        DW_AT_location              DW_OP_fbreg -16
                        DW_AT_name                  b
                        DW_AT_decl_file             0x00000001 /super/secret/path/MiniDbg/examples/variable.cpp
                        DW_AT_decl_line             0x00000003
                        DW_AT_type                  <0x0000007e>
< 2><0x00000068>      DW_TAG_variable
                        DW_AT_location              DW_OP_fbreg -24
                        DW_AT_name                  c
                        DW_AT_decl_file             0x00000001 /super/secret/path/MiniDbg/examples/variable.cpp
                        DW_AT_decl_line             0x00000004
                        DW_AT_type                  <0x0000007e>
< 1><0x00000077>    DW_TAG_base_type
                      DW_AT_name                  int
                      DW_AT_encoding              DW_ATE_signed
                      DW_AT_byte_size             0x00000004
< 1><0x0000007e>    DW_TAG_base_type
                      DW_AT_name                  long int
                      DW_AT_encoding              DW_ATE_signed
                      DW_AT_byte_size             0x00000008

```

第一个 DIE 表示一个编译单元（CU），实际上是一个包括了所有 `#includes` 和类似语句的源文件。下面是带含义注释的属性：

```
DW_AT_producer   clang version 3.9.1 (tags/RELEASE_391/final)    <-- 产生该二进制文件的编译器
DW_AT_language   DW_LANG_C_plus_plus                             <-- 原编程语言
DW_AT_name       /super/secret/path/MiniDbg/examples/variable.cpp  <-- 该 CU 表示的文件名称
DW_AT_stmt_list  0x00000000                                      <-- 跟踪该 CU 的行表偏移
DW_AT_comp_dir   /super/secret/path/MiniDbg/build                  <-- 编译目录
DW_AT_low_pc     0x00400670                                      <-- 该 CU 的代码起始
DW_AT_high_pc    0x0040069c                                      <-- 该 CU 的代码结尾

```

其它的 DIEs 遵循类似的模式，你也很可能推测出不同属性的含义。

现在我们可以根据新学到的 DWARF 知识尝试和解决一些实际问题。

### 当前我在哪个函数？

假设我们有一个程序计数器值然后想找到当前我们在哪一个函数。一个解决该问题的简单算法：

```
for each compile unit:
    if the pc is between DW_AT_low_pc and DW_AT_high_pc:
        for each function in the compile unit:
            if the pc is between DW_AT_low_pc and DW_AT_high_pc:
                return function information

```

这对于很多目的都有效，但如果有成员函数或者内联（inline），就会变得更加复杂。假如有内联，一旦我们找到其范围包括我们的程序计数器（PC）的函数，我们需要递归遍历该 DIE 的所有孩子检查有没有内联函数能更好地匹配。在我的代码中，我不会为该调试器处理内联，但如果你想要的话你可以添加该功能。

### 如何在一个函数上设置断点？

再次说明，这取决于你是否想要支持成员函数、命名空间以及类似的东西。对于简单的函数你只需要迭代遍历不同编译单元中的函数直到你找到一个合适的名字。如果你的编译器能够填充 `.debug_pubnames` 部分，你可以更高效地做到这点。

一旦找到了函数，你可以在 `DW_AT_low_pc` 给定的内存地址设置一个断点。不过那会在函数序言处中断，但更合适的是在用户代码处中断。由于行表信息可以指定序言的结束的内存地址，你只需要在行表中查找 `DW_AT_low_pc` 的值，然后一直读取直到被标记为序言结束的条目。一些编译器不会输出这些信息，因此另一种方式是在该函数第二行条目指定的地址处设置断点。

假如我们想在我们示例程序中的 `main` 函数设置断点。我们查找名为 `main` 的函数，获取到它的 DIE：

```
< 1><0x0000002e>    DW_TAG_subprogram
                      DW_AT_low_pc                0x00400670
                      DW_AT_high_pc               0x0040069c
                      DW_AT_frame_base            DW_OP_reg6
                      DW_AT_name                  main
                      DW_AT_decl_file             0x00000001 /super/secret/path/MiniDbg/examples/variable.cpp
                      DW_AT_decl_line             0x00000001
                      DW_AT_type                  <0x00000077>
                      DW_AT_external              yes(1)

```

这告诉我们函数从 `0x00400670` 开始。如果我们在行表中查找这个，我们可以获得条目：

```
0x00400670  [   1, 0] NS uri: "/super/secret/path/MiniDbg/examples/variable.cpp"

```

我们希望跳过序言，因此我们再读取一个条目：

```
0x00400676  [   2,10] NS PE

```

Clang 在这个条目中包括了序言结束标记，因此我们知道在这里停止，然后在地址 `0x00400676` 处设一个断点。

### 我如何读取一个变量的内容？

读取变量可能非常复杂。它们是难以捉摸的东西，可能在整个函数中移动、保存在寄存器中、被放置于内存、被优化掉、隐藏在角落里，等等。幸运的是我们的简单示例是真的很简单。如果我们想读取变量 `a` 的内容，我们需要看它的 `DW_AT_location` 属性：

```
DW_AT_location              DW_OP_fbreg -8

```

这告诉我们内容被保存在以栈帧基（base of the stack frame）偏移为 `-8` 的地方。为了找到栈帧基，我们查找所在函数的 `DW_AT_frame_base` 属性。

```
DW_AT_frame_base            DW_OP_reg6

```

从 [System V x86_64 ABI][10] 我们可以知道 `reg6` 在 x86 中是帧指针寄存器。现在我们读取帧指针的内容，从中减去 `8`，就找到了我们的变量。如果我们知道它具体是什么，我们还需要看它的类型：

```
< 2><0x0000004c>      DW_TAG_variable
                        DW_AT_name                  a
                        DW_AT_type                  <0x0000007e>

```

如果我们在调试信息中查找该类型，我们得到下面的 DIE：

```
< 1><0x0000007e>    DW_TAG_base_type
                      DW_AT_name                  long int
                      DW_AT_encoding              DW_ATE_signed
                      DW_AT_byte_size             0x00000008

```

这告诉我们该类型是 8 字节（64 位）有符号整型，因此我们可以继续并把这些字节解析为 `int64_t` 并向用户显示。

当然，类型可能比那要复杂得多，因为它们要能够表示类似 C++ 的类型，但是这能给你它们如何工作的基本认识。

再次回到帧基（frame base），Clang 可以通过帧指针寄存器跟踪帧基。最近版本的 GCC 倾向于使用 `DW_OP_call_frame_cfa`，它包括解析 `.eh_frame` ELF 部分，那是一个我不会去写的另外一篇完全不同的文章。如果你告诉 GCC 使用 DWARF 2 而不是最近的版本，它会倾向于输出位置列表，这更便于阅读：

```
DW_AT_frame_base            <loclist at offset 0x00000000 with 4 entries follows>
 low-off : 0x00000000 addr  0x00400696 high-off  0x00000001 addr 0x00400697>DW_OP_breg7+8
 low-off : 0x00000001 addr  0x00400697 high-off  0x00000004 addr 0x0040069a>DW_OP_breg7+16
 low-off : 0x00000004 addr  0x0040069a high-off  0x00000031 addr 0x004006c7>DW_OP_breg6+16
 low-off : 0x00000031 addr  0x004006c7 high-off  0x00000032 addr 0x004006c8>DW_OP_breg7+8

```

位置列表取决于程序计数器所处的位置给出不同的位置。这个例子告诉我们如果程序计数器是在 `DW_AT_low_pc` 偏移量为 `0x0` 的位置，那么帧基就在和寄存器 7 中保存的值偏移量为 8 的位置，如果它是在 `0x1` 和 `0x4` 之间，那么帧基就在和相同位置偏移量为 16 的位置，以此类推。

### 休息一会

这里有很多的信息需要你的大脑消化，但好消息是在后面的几篇文章中我们会用一个库替我们完成这些艰难的工作。理解概念仍然很有帮助，尤其是当出现错误或者你想支持一些你使用的 DWARF 库所没有实现的 DWARF 概念时。

如果你想了解更多关于 DWARF 的内容，那么你可以从[这里][11]获取其标准。在写这篇博客时，刚刚发布了 DWARF 5，但更普遍支持 DWARF 4。

--------------------------------------------------------------------------------

via: https://blog.tartanllama.xyz/c++/2017/04/05/writing-a-linux-debugger-elf-dwarf/

作者：[Simon Brand][a]
译者：[ictlyh](https://github.com/ictlyh)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.twitter.com/TartanLlama
[1]:https://linux.cn/article-8626-1.html
[2]:https://linux.cn/article-8645-1.html
[3]:https://linux.cn/article-8663-1.html
[4]:https://blog.tartanllama.xyz/c++/2017/04/05/writing-a-linux-debugger-elf-dwarf/
[5]:https://blog.tartanllama.xyz/c++/2017/04/24/writing-a-linux-debugger-source-signal/
[6]:https://blog.tartanllama.xyz/c++/2017/05/06/writing-a-linux-debugger-dwarf-step/
[7]:https://github.com/corkami/pics/raw/master/binary/elf101/elf101-64.pdf
[8]:http://www.skyfree.org/linux/references/ELF_Format.pdf
[9]:http://www.dwarfstd.org/doc/Debugging%20using%20DWARF-2012.pdf
[10]:https://www.uclibc.org/docs/psABI-x86_64.pdf
[11]:http://dwarfstd.org/Download.php

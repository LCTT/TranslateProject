调试器工作原理（三）：调试信息
============================================================

这是调试器的工作原理系列文章的第三篇。阅读这篇文章之前应当先阅读[第一篇][26]与[第二篇][27]。

### 这篇文章的主要内容

本文将解释调试器是如何在机器码中查找它将 C 语言源代码转换成机器语言代码时所需要的 C 语言函数、变量、与数据。

### 调试信息

现代编译器能够将有着各种缩进或嵌套的程序流程、各种数据类型的变量的高级语言代码转换为一大堆称之为机器码的 0/1 数据，这么做的唯一目的是尽可能快的在目标 CPU 上运行程序。通常来说一行 C 语言代码能够转换为若干条机器码。变量被分散在机器码中的各个部分，有的在堆栈中，有的在寄存器中，或者直接被优化掉了。数据结构与对象在机器码中甚至不“存在”，它们只是用于将数据按一定的结构编码存储进缓存。

那么调试器怎么知道，当你需要在某个函数入口处暂停时，程序要在哪停下来呢？它怎么知道当你查看某个变量值时，它怎么找到这个值？答案是，调试信息。

编译器在生成机器码时同时会生成相应的调试信息。调试信息代表了可执行程序与源代码之间的关系，并以一种提前定义好的格式，同机器码存放在一起。过去的数年里，人们针对不同的平台与可执行文件发明了很多种用于存储这些信息的格式。不过我们这篇文章不会讲这些格式的历史，而是将阐述这些调试信息是如何工作的，所以我们将专注于一些事情，比如 `DWARF`。`DWARF` 如今十分广泛的用作 Linux 和类 `Unix` 平台上的可执行文件的调试格式。

### ELF 中的 DWARF

![](http://eli.thegreenplace.net/images/2011/02/dwarf_logo.gif) 

根据[它的维基百科][17] 所描述，虽然 `DWARF` 是同 `ELF` 一同设计的（`DWARF` 是由 `DWARF` 标准委员会推出的开放标准。上文中展示的图标就来自这个网站。），但 `DWARF` 在理论上来说也可以嵌入到其他的可执行文件格式中。

`DWARF` 是一种复杂的格式，它吸收了过去许多年各种不同的架构与操作系统的格式的经验。正是因为它解决了一个在任何平台与 ABI （应用二进制接口）上为任意高级语言产生调试信息这样棘手的难题，它也必须很复杂。想要透彻的讲解 `DWARF` 仅仅是通过这单薄的一篇文章是远远不够的，说实话我也并没有充分地了解 `DWARF` 到每一个微小的细节，所以我也不能十分透彻的讲解 （如果你感兴趣的话，文末有一些能够帮助你的资源。建议从 `DWARF` 教程开始上手）。这篇文章中我将以浅显易懂的方式展示 `DWARF`，以说明调试信息是如何实际工作的。

### ELF 文件中的调试部分

首先让我们看看 `DWARF` 处在 ELF 文件中的什么位置。`ELF` 定义了每一个生成的目标文件中的每一节。 <ruby>节头表<rt>section header table</rt></ruby> 声明并定义了每一节及其名字。不同的工具以不同的方式处理不同的节，例如连接器会寻找连接器需要的部分，调试器会查找调试器需要的部分。

我们本文的实验会使用从这个 C 语言源文件构建的可执行文件，编译成 `tracedprog2`：


```
#include <stdio.h>

void do_stuff(int my_arg)、
{
    int my_local = my_arg + 2;
    int i;

    for (i = 0; i < my_local; ++i)
        printf("i = %d\n", i);
}

int main()
{
    do_stuff(2);
    return 0;
}
```


使用 `objdump -h` 命令检查 `ELF` 可执行文件中的<ruby>节头<rt>section header</rt></ruby>，我们会看到几个以 `.debug_`  开头的节，这些就是 `DWARF` 的调试部分。

```
26 .debug_aranges 00000020  00000000  00000000  00001037
                 CONTENTS, READONLY, DEBUGGING
27 .debug_pubnames 00000028  00000000  00000000  00001057
                 CONTENTS, READONLY, DEBUGGING
28 .debug_info   000000cc  00000000  00000000  0000107f
                 CONTENTS, READONLY, DEBUGGING
29 .debug_abbrev 0000008a  00000000  00000000  0000114b
                 CONTENTS, READONLY, DEBUGGING
30 .debug_line   0000006b  00000000  00000000  000011d5
                 CONTENTS, READONLY, DEBUGGING
31 .debug_frame  00000044  00000000  00000000  00001240
                 CONTENTS, READONLY, DEBUGGING
32 .debug_str    000000ae  00000000  00000000  00001284
                 CONTENTS, READONLY, DEBUGGING
33 .debug_loc    00000058  00000000  00000000  00001332
                 CONTENTS, READONLY, DEBUGGING
```

每个节的第一个数字代表了该节的大小，最后一个数字代表了这个节开始位置距离 `ELF` 的偏移量。调试器利用这些信息从可执行文件中读取节。

现在让我们看看一些在 `DWARF` 中查找有用的调试信息的实际例子。

### 查找函数

调试器的最基础的任务之一，就是当我们在某个函数处设置断点时，调试器需要能够在入口处暂停。为此，必须为高级代码中的函数名称与函数在机器码中指令开始的地址这两者之间建立起某种映射关系。

为了获取这种映射关系，我们可以查找 `DWARF` 中的 `.debug_info` 节。在我们深入之前，需要一点基础知识。`DWARF` 中每一个描述类型被称之为调试信息入口（`DIE`）。每个 `DIE` 都有关于它的类型、属性之类的标签。`DIE` 之间通过兄弟节点或子节点相互连接，属性的值也可以指向其它的 `DIE`。

运行以下命令：

```
objdump --dwarf=info tracedprog2
```

输出文件相当的长，为了方便举例我们只关注这些行（从这里开始，无用的冗长信息我会以 （...）代替，方便排版）：

```
<1><71>: Abbrev Number: 5 (DW_TAG_subprogram)
    <72>   DW_AT_external    : 1
    <73>   DW_AT_name        : (...): do_stuff
    <77>   DW_AT_decl_file   : 1
    <78>   DW_AT_decl_line   : 4
    <79>   DW_AT_prototyped  : 1
    <7a>   DW_AT_low_pc      : 0x8048604
    <7e>   DW_AT_high_pc     : 0x804863e
    <82>   DW_AT_frame_base  : 0x0      (location list)
    <86>   DW_AT_sibling     : <0xb3>

<1><b3>: Abbrev Number: 9 (DW_TAG_subprogram)
    <b4>   DW_AT_external    : 1
    <b5>   DW_AT_name        : (...): main
    <b9>   DW_AT_decl_file   : 1
    <ba>   DW_AT_decl_line   : 14
    <bb>   DW_AT_type        : <0x4b>
    <bf>   DW_AT_low_pc      : 0x804863e
    <c3>   DW_AT_high_pc     : 0x804865a
    <c7>   DW_AT_frame_base  : 0x2c     (location list)
```

上面的代码中有两个带有 `DW_TAG_subprogram` 标签的入口，在 `DWARF` 中这是对函数的指代。注意，这是两个节的入口，其中一个是 `do_stuff` 函数的入口，另一个是主（`main`）函数的入口。这些信息中有很多值得关注的属性，但其中最值得注意的是 `DW_AT_low_pc`。它代表了函数开始处程序指针的值（在 x86 平台上是 `EIP`）。此处 `0x8048604` 代表了 `do_stuff` 函数开始处的程序指针。下面我们将利用 `objdump -d` 命令对可执行文件进行反汇编。来看看这块地址中都有什么：

```
08048604 <do_stuff>:
 8048604:       55           push   ebp
 8048605:       89 e5        mov    ebp,esp
 8048607:       83 ec 28     sub    esp,0x28
 804860a:       8b 45 08     mov    eax,DWORD PTR [ebp+0x8]
 804860d:       83 c0 02     add    eax,0x2
 8048610:       89 45 f4     mov    DWORD PTR [ebp-0xc],eax
 8048613:       c7 45 (...)  mov    DWORD PTR [ebp-0x10],0x0
 804861a:       eb 18        jmp    8048634 <do_stuff+0x30>
 804861c:       b8 20 (...)  mov    eax,0x8048720
 8048621:       8b 55 f0     mov    edx,DWORD PTR [ebp-0x10]
 8048624:       89 54 24 04  mov    DWORD PTR [esp+0x4],edx
 8048628:       89 04 24     mov    DWORD PTR [esp],eax
 804862b:       e8 04 (...)  call   8048534 <printf@plt>
 8048630:       83 45 f0 01  add    DWORD PTR [ebp-0x10],0x1
 8048634:       8b 45 f0     mov    eax,DWORD PTR [ebp-0x10]
 8048637:       3b 45 f4     cmp    eax,DWORD PTR [ebp-0xc]
 804863a:       7c e0        jl     804861c <do_stuff+0x18>
 804863c:       c9           leave
 804863d:       c3           ret
```

显然，`0x8048604` 是 `do_stuff` 的开始地址，这样一来，调试器就可以建立函数与其在可执行文件中的位置间的映射关系。

### 查找变量

假设我们当前在 `do_staff` 函数中某个位置上设置断点停了下来。我们想通过调试器取得 `my_local` 这个变量的值。调试器怎么知道在哪里去找这个值呢？很显然这要比查找函数更为困难。变量可能存储在全局存储区、堆栈、甚至是寄存器中。此外，同名变量在不同的作用域中可能有着不同的值。调试信息必须能够反映所有的这些变化，当然，`DWARF` 就能做到。

我不会逐一去将每一种可能的状况，但我会以调试器在 `do_stuff` 函数中查找 `my_local` 变量的过程来举个例子。下面我们再看一遍 `.debug_info` 中 `do_stuff` 的每一个入口，这次连它的子入口也要一起看。
  
```
<1><71>: Abbrev Number: 5 (DW_TAG_subprogram)
    <72>   DW_AT_external    : 1
    <73>   DW_AT_name        : (...): do_stuff
    <77>   DW_AT_decl_file   : 1
    <78>   DW_AT_decl_line   : 4
    <79>   DW_AT_prototyped  : 1
    <7a>   DW_AT_low_pc      : 0x8048604
    <7e>   DW_AT_high_pc     : 0x804863e
    <82>   DW_AT_frame_base  : 0x0      (location list)
    <86>   DW_AT_sibling     : <0xb3>
 <2><8a>: Abbrev Number: 6 (DW_TAG_formal_parameter)
    <8b>   DW_AT_name        : (...): my_arg
    <8f>   DW_AT_decl_file   : 1
    <90>   DW_AT_decl_line   : 4
    <91>   DW_AT_type        : <0x4b>
    <95>   DW_AT_location    : (...)       (DW_OP_fbreg: 0)
 <2><98>: Abbrev Number: 7 (DW_TAG_variable)
    <99>   DW_AT_name        : (...): my_local
    <9d>   DW_AT_decl_file   : 1
    <9e>   DW_AT_decl_line   : 6
    <9f>   DW_AT_type        : <0x4b>
    <a3>   DW_AT_location    : (...)      (DW_OP_fbreg: -20)
<2><a6>: Abbrev Number: 8 (DW_TAG_variable)
    <a7>   DW_AT_name        : i
    <a9>   DW_AT_decl_file   : 1
    <aa>   DW_AT_decl_line   : 7
    <ab>   DW_AT_type        : <0x4b>
    <af>   DW_AT_location    : (...)      (DW_OP_fbreg: -24)
```

看到每个入口处第一对尖括号中的数字了吗？这些是嵌套的等级，在上面的例子中，以 `<2>` 开头的入口是以 `<1>` 开头的子入口。因此我们得知 `my_local` 变量（以 `DW_TAG_variable` 标签标记）是 `do_stuff` 函数的局部变量。除此之外，调试器也需要知道变量的数据类型，这样才能正确的使用与显示变量。上面的例子中 `my_local` 的变量类型指向另一个 `DIE` `<0x4b>`。如果使用 `objdump` 命令查看这个 `DIE` 的话，我们会发现它是一个有符号 4 字节整型数据。
 
而为了在实际运行的程序内存中查找变量的值，调试器需要使用到 `DW_AT_location` 属性。对于 `my_local` 而言，是 `DW_OP_fbreg: -20`。这个代码段的意思是说 `my_local` 存储在距离它所在函数起始地址偏移量为 `-20` 的地方。

`do_stuff` 函数的 `DW_AT_frame_base` 属性值为 `0x0 (location list)`。这意味着这个属性的值需要在 `location list` 中查找。下面我们来一起看看。

```
$ objdump --dwarf=loc tracedprog2

tracedprog2:     file format elf32-i386

Contents of the .debug_loc section:

    Offset   Begin    End      Expression
    00000000 08048604 08048605 (DW_OP_breg4: 4 )
    00000000 08048605 08048607 (DW_OP_breg4: 8 )
    00000000 08048607 0804863e (DW_OP_breg5: 8 )
    00000000 <End of list>
    0000002c 0804863e 0804863f (DW_OP_breg4: 4 )
    0000002c 0804863f 08048641 (DW_OP_breg4: 8 )
    0000002c 08048641 0804865a (DW_OP_breg5: 8 )
    0000002c <End of list>
```

我们需要关注的是第一列（`do_stuff` 函数的 `DW_AT_frame_base` 属性包含 `location list` 中 `0x0` 的偏移量。而 `main` 函数的相同属性包含 `0x2c` 的偏移量，这个偏移量是第二套地址列表的偏移量）。对于调试器可能定位到的每一个地址，它都会指定当前栈帧到变量间的偏移量，而这个偏移就是通过寄存器来计算的。对于 x86 平台而言，`bpreg4` 指向 `esp`，而 `bpreg5` 指向 `ebp`。

让我们再看看 `do_stuff` 函数的头几条指令。

```
08048604 <do_stuff>:
 8048604:       55          push   ebp
 8048605:       89 e5       mov    ebp,esp
 8048607:       83 ec 28    sub    esp,0x28
 804860a:       8b 45 08    mov    eax,DWORD PTR [ebp+0x8]
 804860d:       83 c0 02    add    eax,0x2
 8048610:       89 45 f4    mov    DWORD PTR [ebp-0xc],eax
```

只有当第二条指令执行后，`ebp` 寄存器才真正存储了有用的值。当然，前两条指令的基址是由上面所列出来的地址信息表计算出来的。一但 `ebp` 确定了，计算偏移量就十分方便了，因为尽管 `esp` 在操作堆栈的时候需要移动，但 	`ebp` 作为栈底并不需要移动。

究竟我们应该去哪里找 `my_local` 的值呢？在 `0x8048610` 这块地址后， `my_local` 的值经过在 `eax` 中的计算后被存在了内存中，从这里开始我们才需要关注 `my_local` 的值。调试器会利用 `DW_OP_breg5: 8` 这个栈帧来查找。我们回想下，`my_local` 的 `DW_AT_location` 属性值为 `DW_OP_fbreg: -20`。所以应当从基址中 `-20` ，同时由于 `ebp` 寄存器需要 `+8`，所以最终结果为 `ebp - 12`。现在再次查看反汇编代码，来看看数据从 `eax` 中被移动到哪里了。当然，这里 `my_local` 应当被存储在了 `ebp - 12` 的地址中。

### 查看行号

当我们谈到在调试信息寻找函数的时候，我们利用了些技巧。当调试 C 语言源代码并在某个函数出放置断点的时候，我们并不关注第一条“机器码”指令（函数的调用准备工作已经完成而局部变量还没有初始化）。我们真正关注的是函数的第一行“C 代码”。

这就是 `DWARF` 完全覆盖映射 C 源代码中的行与可执行文件中机器码地址的原因。下面是 `.debug_line` 节中所包含的内容，我们将其转换为可读的格式展示如下。

```
$ objdump --dwarf=decodedline tracedprog2

tracedprog2:     file format elf32-i386

Decoded dump of debug contents of section .debug_line:

CU: /home/eliben/eli/eliben-code/debugger/tracedprog2.c:
File name           Line number    Starting address
tracedprog2.c                5           0x8048604
tracedprog2.c                6           0x804860a
tracedprog2.c                9           0x8048613
tracedprog2.c               10           0x804861c
tracedprog2.c                9           0x8048630
tracedprog2.c               11           0x804863c
tracedprog2.c               15           0x804863e
tracedprog2.c               16           0x8048647
tracedprog2.c               17           0x8048653
tracedprog2.c               18           0x8048658
```

很容易就可以看出其中 C 源代码与反汇编代码之间的对应关系。第 5 行指向 `do_stuff` 函数的入口，`0x8040604`。第 6 行，指向 `0x804860a` ，正是调试器在调试 `do_stuff` 函数时需要停下来的地方。这里已经完成了函数调用的准备工作。上面的这些信息形成了行号与地址间的双向映射关系。

* 当在某一行设置断点的时候，调试器会利用这些信息去查找相应的地址来做断点工作（还记得上篇文章中的 `int 3` 指令吗？）
* 当指令造成段错误时，调试器会利用这些信息来查看源代码中发生问题的行。

### libdwarf - 用 DWARF 编程

尽管使用命令行工具来获得 `DWARF` 很有用，但这仍然不够易用。作为程序员，我们希望知道当我们需要这些调试信息时应当怎么编程来获取这些信息。

自然我们想到的第一种方法就是阅读 `DWARF` 规范并按规范操作阅读使用。有句话说的好，分析 HTML 应当使用库函数，永远不要手工分析。对于 `DWARF` 来说正是如此。`DWARF` 比 HTML 要复杂得多。上面所展示出来的只是冰山一角。更糟糕的是，在实际的目标文件中，大部分信息是以非常紧凑的压缩格式存储的，分析起来更加复杂（信息中的某些部分，例如位置信息与行号信息，在某些虚拟机下是以指令的方式编码的）。

所以我们要使用库来处理 `DWARF`。下面是两种我熟悉的主要的库（还有些不完整的库这里没有写）

1. `BFD` （libbfd），包含了 `objdump` （对，就是这篇文章中我们一直在用的这货），`ld`（`GNU` 连接器）与 `as`（`GNU` 编译器）。`BFD` 主要用于 [GNU binutils][11]。
2. `libdwarf` ，同它的哥哥 `libelf` 一同用于 `Solaris` 与 `FreeBSD` 中的调试信息分析。

相比较而言我更倾向于使用 `libdwarf`，因为我对它了解的更多，并且 `libdwarf` 的开源协议更开放（`LGPL` 对比 `GPL`）。

因为 `libdwarf` 本身相当复杂，操作起来需要相当多的代码，所以我在这不会展示所有代码。你可以在 [这里][24] 下载代码并运行试试。运行这些代码需要提前安装 `libelfand` 与 `libdwarf` ，同时在使用连接器的时候要使用参数 `-lelf` 与 `-ldwarf`。

这个示例程序可以接受可执行文件并打印其中的函数名称与函数入口地址。下面是我们整篇文章中使用的 C 程序经过示例程序处理后的输出。

```
$ dwarf_get_func_addr tracedprog2
DW_TAG_subprogram: 'do_stuff'
low pc  : 0x08048604
high pc : 0x0804863e
DW_TAG_subprogram: 'main'
low pc  : 0x0804863e
high pc : 0x0804865a
```

`libdwarf` 的文档很棒，如果你花些功夫，利用 `libdwarf` 获得这篇文章中所涉及到的 `DWARF` 信息应该并不困难。

### 结论与计划

原理上讲，调试信息是个很简单的概念。尽管实现细节可能比较复杂，但经过了上面的学习我想你应该了解了调试器是如何从可执行文件中获取它需要的源代码信息的了。对于程序员而言，程序只是代码段与数据结构；对可执行文件而言，程序只是一系列存储在内存或寄存器中的指令或数据。但利用调试信息，调试器就可以将这两者连接起来，从而完成调试工作。

此文与这系列的前两篇，一同介绍了调试器的内部工作过程。利用这里所讲到的知识，再敲些代码，应该可以完成一个 Linux 中最简单、基础但也有一定功能的调试器。

下一步我并不确定要做什么，这个系列文章可能就此结束，也有可能我要讲些堆栈调用的事情，又或者讲 Windows 下的调试。你们有什么好的点子或者相关材料，可以直接评论或者发邮件给我。

### 参考

*   objdump 参考手册
*   [ELF][12] 与 [DWARF][13] 的维基百科
*   [Dwarf Debugging Standard 主页][14]，这里有很棒的 DWARF 教程与 DWARF 标准，作者是 Michael Eager。第二版基于 GCC 也许更能吸引你。
*   [libdwarf 主页][15]，这里可以下载到 libwarf 的完整库与参考手册
*   [BFD 文档][16]

* * *

--------------------------------------------------------------------------------

via: http://eli.thegreenplace.net/2011/02/07/how-debuggers-work-part-3-debugging-information

作者：[Eli Bendersky][a]
译者：[YYforymj](https://github.com/YYforymj)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://eli.thegreenplace.net/
[1]:http://eli.thegreenplace.net/2011/02/07/how-debuggers-work-part-3-debugging-information#id1
[2]:http://dwarfstd.org/
[3]:http://eli.thegreenplace.net/2011/02/07/how-debuggers-work-part-3-debugging-information#id2
[4]:http://eli.thegreenplace.net/2011/02/07/how-debuggers-work-part-3-debugging-information#id3
[5]:http://eli.thegreenplace.net/2011/02/07/how-debuggers-work-part-3-debugging-information#id4
[6]:http://eli.thegreenplace.net/2011/02/07/how-debuggers-work-part-3-debugging-information#id5
[7]:http://eli.thegreenplace.net/2011/02/07/how-debuggers-work-part-3-debugging-information#id6
[8]:http://eli.thegreenplace.net/tag/articles
[9]:http://eli.thegreenplace.net/tag/debuggers
[10]:http://eli.thegreenplace.net/tag/programming
[11]:http://www.gnu.org/software/binutils/
[12]:http://en.wikipedia.org/wiki/Executable_and_Linkable_Format
[13]:http://en.wikipedia.org/wiki/DWARF
[14]:http://dwarfstd.org/
[15]:http://reality.sgiweb.org/davea/dwarf.html
[16]:http://sourceware.org/binutils/docs-2.21/bfd/index.html
[17]:http://en.wikipedia.org/wiki/DWARF
[18]:http://eli.thegreenplace.net/2011/02/07/how-debuggers-work-part-3-debugging-information#id7
[19]:http://eli.thegreenplace.net/2011/02/07/how-debuggers-work-part-3-debugging-information#id8
[20]:http://eli.thegreenplace.net/2011/02/07/how-debuggers-work-part-3-debugging-information#id9
[21]:http://eli.thegreenplace.net/2011/02/07/how-debuggers-work-part-3-debugging-information#id10
[22]:http://eli.thegreenplace.net/2011/02/07/how-debuggers-work-part-3-debugging-information#id11
[23]:http://eli.thegreenplace.net/2011/02/07/how-debuggers-work-part-3-debugging-information#id12
[24]:https://github.com/eliben/code-for-blog/blob/master/2011/dwarf_get_func_addr.c
[25]:http://eli.thegreenplace.net/2011/02/07/how-debuggers-work-part-3-debugging-information
[26]:https://linux.cn/article-8552-1.html
[27]:https://linux.cn/article-8418-1.html

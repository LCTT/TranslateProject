[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13074-1.html)
[#]: subject: (Explore binaries using this full-featured Linux tool)
[#]: via: (https://opensource.com/article/21/1/linux-radare2)
[#]: author: (Gaurav Kamathe https://opensource.com/users/gkamathe)

全功能的二进制文件分析工具 Radare2 指南
======

> Radare2 是一个为二进制分析定制的开源工具。

![](https://img.linux.net.cn/data/attachment/album/202102/01/112611baw4gpqlch10ps1c.jpg)

在《[Linux 上分析二进制文件的 10 种方法][2]》中，我解释了如何使用 Linux 上丰富的原生工具集来分析二进制文件。但如果你想进一步探索你的二进制文件，你需要一个为二进制分析定制的工具。如果你是二进制分析的新手，并且大多使用的是脚本语言，这篇文章《[GNU binutils 里的九种武器][3]》可以帮助你开始学习编译过程和什么是二进制。

### 为什么我需要另一个工具？

如果现有的 Linux 原生工具也能做类似的事情，你自然会问为什么需要另一个工具。嗯，这和你用手机做闹钟、做笔记、做相机、听音乐、上网、偶尔打电话和接电话的原因是一样的。以前，使用单独的设备和工具处理这些功能 —— 比如拍照的实体相机，记笔记的小记事本，起床的床头闹钟等等。对用户来说，有一个设备来做多件（但相关的）事情是*方便的*。另外，杀手锏就是独立功能之间的*互操作性*。

同样，即使许多 Linux 工具都有特定的用途，但在一个工具中捆绑类似（和更好）的功能是非常有用的。这就是为什么我认为 [Radare2][4] 应该是你需要处理二进制文件时的首选工具。

根据其 [GitHub 简介][5]，Radare2（也称为 r2）是一个“类 Unix 系统上的逆向工程框架和命令行工具集”。它名字中的 “2” 是因为这个版本从头开始重写的，使其更加模块化。

### 为什么选择 Radare2？

有大量（非原生的）Linux 工具可用于二进制分析，为什么要选择 Radare2 呢？我的理由很简单。

首先，它是一个开源项目，有一个活跃而健康的社区。如果你正在寻找新颖的功能或提供着 bug 修复的工具，这很重要。

其次，Radare2 可以在命令行上使用，而且它有一个功能丰富的图形用户界面（GUI）环境，叫做 Cutter，适合那些对 GUI 比较熟悉的人。作为一个长期使用 Linux 的用户，我对习惯于在 shell 上输入。虽然熟悉 Radare2 的命令稍微有一点学习曲线，但我会把它比作 [学习 Vim][6]。你可以先学习基本的东西，一旦你掌握了它们，你就可以继续学习更高级的东西。很快，它就变成了肌肉记忆。

第三，Radare2 通过插件可以很好的支持外部工具。例如，最近开源的 [Ghidra][7] 二进制分析和<ruby>逆向工具<rt>reversing tool</rt></ruby>很受欢迎，因为它的反编译器功能是逆向软件的关键要素。你可以直接从 Radare2 控制台安装 Ghidra 反编译器并使用，这很神奇，让你两全其美。

### 开始使用 Radare2

要安装 Radare2，只需克隆其存储库并运行 `user.sh` 脚本。如果你的系统上还没有一些预备软件包，你可能需要安装它们。一旦安装完成，运行 `r2 -v` 命令来查看 Radare2 是否被正确安装：

```
$ git clone https://github.com/radareorg/radare2.git
$ cd radare2
$ ./sys/user.sh

# version

$ r2 -v
radare2 4.6.0-git 25266 @ linux-x86-64 git.4.4.0-930-g48047b317
commit: 48047b3171e6ed0480a71a04c3693a0650d03543 build: 2020-11-17__09:31:03
$
```

#### 获取二进制测试样本

现在 `r2` 已经安装好了，你需要一个样本二进制程序来试用它。你可以使用任何系统二进制文件（`ls`、`bash` 等），但为了使本教程的内容简单，请编译以下 C 程序：

```
$ cat adder.c
```

```
#include <stdio.h>

int adder(int num) {
        return num + 1;
}

int main() {
        int res, num1 = 100;
        res = adder(num1);
        printf("Number now is  : %d\n", res);
        return 0;
}
```

```
$ gcc adder.c -o adder
$ file adder
adder: ELF 64-bit LSB executable, x86-64, version 1 (SYSV), dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2, for GNU/Linux 3.2.0, BuildID[sha1]=9d4366f7160e1ffb46b14466e8e0d70f10de2240, not stripped
$ ./adder
Number now is  : 101
```

#### 加载二进制文件

要分析二进制文件，你必须在 Radare2 中加载它。通过提供文件名作为 `r2` 命令的一个命令行参数来加载它。你会进入一个独立的 Radare2 控制台，这与你的 shell 不同。要退出控制台，你可以输入 `Quit` 或 `Exit` 或按 `Ctrl+D`：

```
$ r2 ./adder
 -- Learn pancake as if you were radare!
[0x004004b0]> quit
$
```

#### 分析二进制

在你探索二进制之前，你必须让 `r2` 为你分析它。你可以通过在 `r2` 控制台中运行 `aaa` 命令来实现：

```
$ r2 ./adder
 -- Sorry, radare2 has experienced an internal error.
[0x004004b0]>
[0x004004b0]>
[0x004004b0]> aaa
[x] Analyze all flags starting with sym. and entry0 (aa)
[x] Analyze function calls (aac)
[x] Analyze len bytes of instructions for references (aar)
[x] Check for vtables
[x] Type matching analysis for all functions (aaft)
[x] Propagate noreturn information
[x] Use -AA or aaaa to perform additional experimental analysis.
[0x004004b0]>
```

这意味着每次你选择一个二进制文件进行分析时，你必须在加载二进制文件后输入一个额外的命令 `aaa`。你可以绕过这一点，在命令后面跟上 `-A` 来调用 `r2`；这将告诉 `r2` 为你自动分析二进制：

```
$ r2 -A ./adder
[x] Analyze all flags starting with sym. and entry0 (aa)
[x] Analyze function calls (aac)
[x] Analyze len bytes of instructions for references (aar)
[x] Check for vtables
[x] Type matching analysis for all functions (aaft)
[x] Propagate noreturn information
[x] Use -AA or aaaa to perform additional experimental analysis.
 -- Already up-to-date.
[0x004004b0]>
```

#### 获取一些关于二进制的基本信息

在开始分析一个二进制文件之前，你需要一些背景信息。在许多情况下，这可以是二进制文件的格式（ELF、PE 等）、二进制的架构（x86、AMD、ARM 等），以及二进制是 32 位还是 64 位。方便的 `r2` 的 `iI` 命令可以提供所需的信息：

```
[0x004004b0]> iI
arch     x86
baddr    0x400000
binsz    14724
bintype  elf
bits     64
canary   false
class    ELF64
compiler GCC: (GNU) 8.3.1 20190507 (Red Hat 8.3.1-4)
crypto   false
endian   little
havecode true
intrp    /lib64/ld-linux-x86-64.so.2
laddr    0x0
lang     c
linenum  true
lsyms    true
machine  AMD x86-64 architecture
maxopsz  16
minopsz  1
nx       true
os       linux
pcalign  0
pic      false
relocs   true
relro    partial
rpath    NONE
sanitiz  false
static   false
stripped false
subsys   linux
va       true

[0x004004b0]>
[0x004004b0]>
```

### 导入和导出

通常情况下，当你知道你要处理的是什么样的文件后，你就想知道二进制程序使用了什么样的标准库函数，或者了解程序的潜在功能。在本教程中的示例 C 程序中，唯一的库函数是 `printf`，用来打印信息。你可以通过运行 `ii` 命令看到这一点，它显示了该二进制所有导入的库：

```
[0x004004b0]> ii
[Imports]
nth vaddr      bind   type   lib name
―――――――――――――――――――――――――――――――――――――
1   0x00000000 WEAK   NOTYPE     _ITM_deregisterTMCloneTable
2   0x004004a0 GLOBAL FUNC       printf
3   0x00000000 GLOBAL FUNC       __libc_start_main
4   0x00000000 WEAK   NOTYPE     __gmon_start__
5   0x00000000 WEAK   NOTYPE     _ITM_registerTMCloneTable
```

该二进制也可以有自己的符号、函数或数据。这些函数通常显示在 `Exports` 下。这个测试的二进制导出了两个函数：`main` 和 `adder`。其余的函数是在编译阶段，当二进制文件被构建时添加的。加载器需要这些函数来加载二进制文件（现在不用太关心它们）：

```
[0x004004b0]>
[0x004004b0]> iE
[Exports]

nth paddr       vaddr      bind   type   size lib name
――――――――――――――――――――――――――――――――――――――――――――――――――――――
82   0x00000650 0x00400650 GLOBAL FUNC   5        __libc_csu_fini
85   ---------- 0x00601024 GLOBAL NOTYPE 0        _edata
86   0x00000658 0x00400658 GLOBAL FUNC   0        _fini
89   0x00001020 0x00601020 GLOBAL NOTYPE 0        __data_start
90   0x00000596 0x00400596 GLOBAL FUNC   15       adder
92   0x00000670 0x00400670 GLOBAL OBJ    0        __dso_handle
93   0x00000668 0x00400668 GLOBAL OBJ    4        _IO_stdin_used
94   0x000005e0 0x004005e0 GLOBAL FUNC   101      __libc_csu_init
95   ---------- 0x00601028 GLOBAL NOTYPE 0        _end
96   0x000004e0 0x004004e0 GLOBAL FUNC   5        _dl_relocate_static_pie
97   0x000004b0 0x004004b0 GLOBAL FUNC   47       _start
98   ---------- 0x00601024 GLOBAL NOTYPE 0        __bss_start
99   0x000005a5 0x004005a5 GLOBAL FUNC   55       main
100  ---------- 0x00601028 GLOBAL OBJ    0        __TMC_END__
102  0x00000468 0x00400468 GLOBAL FUNC   0        _init

[0x004004b0]>
```

### 哈希信息

如何知道两个二进制文件是否相似？你不能只是打开一个二进制文件并查看里面的源代码。在大多数情况下，二进制文件的哈希值（md5sum、sha1、sha256）是用来唯一识别它的。你可以使用 `it` 命令找到二进制的哈希值：

```
[0x004004b0]> it
md5 7e6732f2b11dec4a0c7612852cede670
sha1 d5fa848c4b53021f6570dd9b18d115595a2290ae
sha256 13dd5a492219dac1443a816ef5f91db8d149e8edbf26f24539c220861769e1c2
[0x004004b0]>
```

### 函数

代码按函数分组；要列出二进制中存在的函数，请运行 `afl` 命令。下面的列表显示了 `main` 函数和 `adder` 函数。通常，以 `sym.imp` 开头的函数是从标准库（这里是 glibc）中导入的：

```
[0x004004b0]> afl
0x004004b0    1 46           entry0
0x004004f0    4 41   -> 34   sym.deregister_tm_clones
0x00400520    4 57   -> 51   sym.register_tm_clones
0x00400560    3 33   -> 32   sym.__do_global_dtors_aux
0x00400590    1 6            entry.init0
0x00400650    1 5            sym.__libc_csu_fini
0x00400658    1 13           sym._fini
0x00400596    1 15           sym.adder
0x004005e0    4 101          loc..annobin_elf_init.c
0x004004e0    1 5            loc..annobin_static_reloc.c
0x004005a5    1 55           main
0x004004a0    1 6            sym.imp.printf
0x00400468    3 27           sym._init
[0x004004b0]>
```

### 交叉引用

在 C 语言中，`main` 函数是一个程序开始执行的地方。理想情况下，其他函数都是从 `main` 函数调用的，在退出程序时，`main` 函数会向操作系统返回一个退出状态。这在源代码中是很明显的，然而，二进制程序呢？如何判断 `adder` 函数的调用位置呢？

你可以使用 `axt` 命令，后面加上函数名，看看 `adder` 函数是在哪里调用的；如下图所示，它是从 `main` 函数中调用的。这就是所谓的<ruby>交叉引用<rt>cross-referencing</rt></ruby>。但什么调用 `main` 函数本身呢？从下面的 `axt main` 可以看出，它是由 `entry0` 调用的（关于 `entry0` 的学习我就不说了，留待读者练习）。

```
[0x004004b0]> axt sym.adder
main 0x4005b9 [CALL] call sym.adder
[0x004004b0]>
[0x004004b0]> axt main
entry0 0x4004d1 [DATA] mov rdi, main
[0x004004b0]>
```

### 寻找定位

在处理文本文件时，你经常通过引用行号和行或列号在文件内移动；在二进制文件中，你需要使用地址。这些是以 `0x` 开头的十六进制数字，后面跟着一个地址。要找到你在二进制中的位置，运行 `s` 命令。要移动到不同的位置，使用 `s` 命令，后面跟上地址。

函数名就像标签一样，内部用地址表示。如果函数名在二进制中（未剥离的），可以使用函数名后面的 `s` 命令跳转到一个特定的函数地址。同样，如果你想跳转到二进制的开始，输入 `s 0`：

```
[0x004004b0]> s
0x4004b0
[0x004004b0]>
[0x004004b0]> s main
[0x004005a5]>
[0x004005a5]> s
0x4005a5
[0x004005a5]>
[0x004005a5]> s sym.adder
[0x00400596]>
[0x00400596]> s
0x400596
[0x00400596]>
[0x00400596]> s 0
[0x00000000]>
[0x00000000]> s
0x0
[0x00000000]>
```

### 十六进制视图

通常情况下，原始二进制没有意义。在十六进制模式下查看二进制及其等效的 ASCII 表示法会有帮助：

```
[0x004004b0]> s main
[0x004005a5]>
[0x004005a5]> px
- offset -   0 1  2 3  4 5  6 7  8 9  A B  C D  E F  0123456789ABCDEF
0x004005a5  5548 89e5 4883 ec10 c745 fc64 0000 008b  UH..H....E.d....
0x004005b5  45fc 89c7 e8d8 ffff ff89 45f8 8b45 f889  E.........E..E..
0x004005c5  c6bf 7806 4000 b800 0000 00e8 cbfe ffff  ..x.@...........
0x004005d5  b800 0000 00c9 c30f 1f40 00f3 0f1e fa41  .........@.....A
0x004005e5  5749 89d7 4156 4989 f641 5541 89fd 4154  WI..AVI..AUA..AT
0x004005f5  4c8d 2504 0820 0055 488d 2d04 0820 0053  L.%.. .UH.-.. .S
0x00400605  4c29 e548 83ec 08e8 57fe ffff 48c1 fd03  L).H....W...H...
0x00400615  741f 31db 0f1f 8000 0000 004c 89fa 4c89  t.1........L..L.
0x00400625  f644 89ef 41ff 14dc 4883 c301 4839 dd75  .D..A...H...H9.u
0x00400635  ea48 83c4 085b 5d41 5c41 5d41 5e41 5fc3  .H...[]A\A]A^A_.
0x00400645  9066 2e0f 1f84 0000 0000 00f3 0f1e fac3  .f..............
0x00400655  0000 00f3 0f1e fa48 83ec 0848 83c4 08c3  .......H...H....
0x00400665  0000 0001 0002 0000 0000 0000 0000 0000  ................
0x00400675  0000 004e 756d 6265 7220 6e6f 7720 6973  ...Number now is
0x00400685  2020 3a20 2564 0a00 0000 0001 1b03 3b44    : %d........;D
0x00400695  0000 0007 0000 0000 feff ff88 0000 0020  ...............
[0x004005a5]>
```

### 反汇编

如果你使用的是编译后的二进制文件，则无法查看源代码。编译器将源代码转译成 CPU 可以理解和执行的机器语言指令；其结果就是二进制或可执行文件。然而，你可以查看汇编指令（的助记词）来理解程序正在做什么。例如，如果你想查看 `main` 函数在做什么，你可以使用 `s main` 寻找 `main` 函数的地址，然后运行 `pdf` 命令来查看反汇编的指令。

要理解汇编指令，你需要参考体系结构手册（这里是 x86），它的应用二进制接口（ABI，或调用惯例），并对堆栈的工作原理有基本的了解：

```
[0x004004b0]> s main
[0x004005a5]>
[0x004005a5]> s
0x4005a5
[0x004005a5]>
[0x004005a5]> pdf
            ; DATA XREF from entry0 @ 0x4004d1
┌ 55: int main (int argc, char **argv, char **envp);
│           ; var int64_t var_8h @ rbp-0x8
│           ; var int64_t var_4h @ rbp-0x4
│           0x004005a5      55             push rbp
│           0x004005a6      4889e5         mov rbp, rsp
│           0x004005a9      4883ec10       sub rsp, 0x10
│           0x004005ad      c745fc640000.  mov dword [var_4h], 0x64    ; 'd' ; 100
│           0x004005b4      8b45fc         mov eax, dword [var_4h]
│           0x004005b7      89c7           mov edi, eax
│           0x004005b9      e8d8ffffff     call sym.adder
│           0x004005be      8945f8         mov dword [var_8h], eax
│           0x004005c1      8b45f8         mov eax, dword [var_8h]
│           0x004005c4      89c6           mov esi, eax
│           0x004005c6      bf78064000     mov edi, str.Number_now_is__:__d ; 0x400678 ; "Number now is  : %d\n" ; const char *format
│           0x004005cb      b800000000     mov eax, 0
│           0x004005d0      e8cbfeffff     call sym.imp.printf         ; int printf(const char *format)
│           0x004005d5      b800000000     mov eax, 0
│           0x004005da      c9             leave
└           0x004005db      c3             ret
[0x004005a5]>
```

这是 `adder` 函数的反汇编结果：

```
[0x004005a5]> s sym.adder
[0x00400596]>
[0x00400596]> s
0x400596
[0x00400596]>
[0x00400596]> pdf
            ; CALL XREF from main @ 0x4005b9
┌ 15: sym.adder (int64_t arg1);
│           ; var int64_t var_4h @ rbp-0x4
│           ; arg int64_t arg1 @ rdi
│           0x00400596      55             push rbp
│           0x00400597      4889e5         mov rbp, rsp
│           0x0040059a      897dfc         mov dword [var_4h], edi     ; arg1
│           0x0040059d      8b45fc         mov eax, dword [var_4h]
│           0x004005a0      83c001         add eax, 1
│           0x004005a3      5d             pop rbp
└           0x004005a4      c3             ret
[0x00400596]>
```

### 字符串

查看二进制中存在哪些字符串可以作为二进制分析的起点。字符串是硬编码到二进制中的，通常会提供重要的提示，可以让你将重点转移到分析某些区域。在二进制中运行 `iz` 命令来列出所有的字符串。这个测试二进制中只有一个硬编码的字符串：

```
[0x004004b0]> iz
[Strings]
nth paddr      vaddr      len size section type  string
―――――――――――――――――――――――――――――――――――――――――――――――――――――――
0   0x00000678 0x00400678 20  21   .rodata ascii Number now is  : %d\n

[0x004004b0]>
```

### 交叉引用字符串

和函数一样，你可以交叉引用字符串，看看它们是从哪里被打印出来的，并理解它们周围的代码：

```
[0x004004b0]> ps @ 0x400678
Number now is  : %d

[0x004004b0]>
[0x004004b0]> axt 0x400678
main 0x4005c6 [DATA] mov edi, str.Number_now_is__:__d
[0x004004b0]>
```

### 可视模式

当你的代码很复杂，有多个函数被调用时，很容易迷失方向。如果能以图形或可视化的方式查看哪些函数被调用，根据某些条件采取了哪些路径等，会很有帮助。在移动到感兴趣的函数后，可以通过 `VV` 命令来探索 `r2` 的可视化模式。例如，对于 `adder` 函数：

```
[0x004004b0]> s sym.adder
[0x00400596]>
[0x00400596]> VV
```

![Radare2 Visual mode][8]

*(Gaurav Kamathe, [CC BY-SA 4.0][9])*

### 调试器

到目前为止，你一直在做的是静态分析 —— 你只是在看二进制文件中的东西，而没有运行它，有时你需要执行二进制文件，并在运行时分析内存中的各种信息。`r2` 的内部调试器允许你运行二进制文件、设置断点、分析变量的值、或者转储寄存器的内容。

用 `-d` 标志启动调试器，并在加载二进制时添加 `-A` 标志进行分析。你可以通过使用 `db <function-name>` 命令在不同的地方设置断点，比如函数或内存地址。要查看现有的断点，使用 `dbi` 命令。一旦你放置了断点，使用 `dc` 命令开始运行二进制文件。你可以使用 `dbt` 命令查看堆栈，它可以显示函数调用。最后，你可以使用 `drr` 命令转储寄存器的内容：

```
$ r2 -d -A ./adder
Process with PID 17453 started...
= attach 17453 17453
bin.baddr 0x00400000
Using 0x400000
asm.bits 64
[x] Analyze all flags starting with sym. and entry0 (aa)
[x] Analyze function calls (aac)
[x] Analyze len bytes of instructions for references (aar)
[x] Check for vtables
[x] Type matching analysis for all functions (aaft)
[x] Propagate noreturn information
[x] Use -AA or aaaa to perform additional experimental analysis.
 -- git checkout hamster
[0x7f77b0a28030]>
[0x7f77b0a28030]> db main
[0x7f77b0a28030]>
[0x7f77b0a28030]> db sym.adder
[0x7f77b0a28030]>
[0x7f77b0a28030]> dbi
0 0x004005a5 E:1 T:0
1 0x00400596 E:1 T:0
[0x7f77b0a28030]>
[0x7f77b0a28030]> afl | grep main
0x004005a5    1 55           main
[0x7f77b0a28030]>
[0x7f77b0a28030]> afl | grep sym.adder
0x00400596    1 15           sym.adder
[0x7f77b0a28030]>
[0x7f77b0a28030]> dc
hit breakpoint at: 0x4005a5
[0x004005a5]>
[0x004005a5]> dbt
0  0x4005a5           sp: 0x0                 0    [main]  main sym.adder+15
1  0x7f77b0687873     sp: 0x7ffe35ff6858      0    [??]  section..gnu.build.attributes-1345820597
2  0x7f77b0a36e0a     sp: 0x7ffe35ff68e8      144  [??]  map.usr_lib64_ld_2.28.so.r_x+65034
[0x004005a5]> dc
hit breakpoint at: 0x400596
[0x00400596]> dbt
0  0x400596           sp: 0x0                 0    [sym.adder]  rip entry.init0+6
1  0x4005be           sp: 0x7ffe35ff6838      0    [main]  main+25
2  0x7f77b0687873     sp: 0x7ffe35ff6858      32   [??]  section..gnu.build.attributes-1345820597
3  0x7f77b0a36e0a     sp: 0x7ffe35ff68e8      144  [??]  map.usr_lib64_ld_2.28.so.r_x+65034
[0x00400596]>
[0x00400596]>
[0x00400596]> dr
rax = 0x00000064
rbx = 0x00000000
rcx = 0x7f77b0a21738
rdx = 0x7ffe35ff6948
r8 = 0x7f77b0a22da0
r9 = 0x7f77b0a22da0
r10 = 0x0000000f
r11 = 0x00000002
r12 = 0x004004b0
r13 = 0x7ffe35ff6930
r14 = 0x00000000
r15 = 0x00000000
rsi = 0x7ffe35ff6938
rdi = 0x00000064
rsp = 0x7ffe35ff6838
rbp = 0x7ffe35ff6850
rip = 0x00400596
rflags = 0x00000202
orax = 0xffffffffffffffff
[0x00400596]>
```

### 反编译器

能够理解汇编是二进制分析的前提。汇编语言总是与二进制建立和预期运行的架构相关。一行源代码和汇编代码之间从来没有 1:1 的映射。通常，一行 C 源代码会产生多行汇编代码。所以，逐行读取汇编代码并不是最佳的选择。

这就是反编译器的作用。它们试图根据汇编指令重建可能的源代码。这与用于创建二进制的源代码绝不完全相同，它是基于汇编的源代码的近似表示。另外，要考虑到编译器进行的优化，它会生成不同的汇编代码以加快速度，减小二进制的大小等，会使反编译器的工作更加困难。另外，恶意软件作者经常故意混淆代码，让恶意软件的分析人员望而却步。

Radare2 通过插件提供反编译器。你可以安装任何 Radare2 支持的反编译器。使用 `r2pm -l` 命令可以查看当前插件。使用 `r2pm install` 命令来安装一个示例的反编译器 `r2dec`：

```
$ r2pm  -l
$
$ r2pm install r2dec
Cloning into 'r2dec'...
remote: Enumerating objects: 100, done.
remote: Counting objects: 100% (100/100), done.
remote: Compressing objects: 100% (97/97), done.
remote: Total 100 (delta 18), reused 27 (delta 1), pack-reused 0
Receiving objects: 100% (100/100), 1.01 MiB | 1.31 MiB/s, done.
Resolving deltas: 100% (18/18), done.
Install Done For r2dec
gmake: Entering directory '/root/.local/share/radare2/r2pm/git/r2dec/p'
[CC] duktape/duktape.o
[CC] duktape/duk_console.o
[CC] core_pdd.o
[CC] core_pdd.so
gmake: Leaving directory '/root/.local/share/radare2/r2pm/git/r2dec/p'
$
$ r2pm  -l
r2dec
$
```

### 反编译器视图

要反编译一个二进制文件，在 `r2` 中加载二进制文件并自动分析它。在本例中，使用 `s sym.adder` 命令移动到感兴趣的 `adder` 函数，然后使用 `pdda` 命令并排查看汇编和反编译后的源代码。阅读这个反编译后的源代码往往比逐行阅读汇编更容易：

```
$ r2 -A ./adder
[x] Analyze all flags starting with sym. and entry0 (aa)
[x] Analyze function calls (aac)
[x] Analyze len bytes of instructions for references (aar)
[x] Check for vtables
[x] Type matching analysis for all functions (aaft)
[x] Propagate noreturn information
[x] Use -AA or aaaa to perform additional experimental analysis.
 -- What do you want to debug today?
[0x004004b0]>
[0x004004b0]> s sym.adder
[0x00400596]>
[0x00400596]> s
0x400596
[0x00400596]>
[0x00400596]> pdda
    ; assembly                               | /* r2dec pseudo code output */
                                             | /* ./adder @ 0x400596 */
                                             | #include &lt;stdint.h>
                                             |  
    ; (fcn) sym.adder ()                     | int32_t adder (int64_t arg1) {
                                             |     int64_t var_4h;
                                             |     rdi = arg1;
    0x00400596 push rbp                      |    
    0x00400597 mov rbp, rsp                  |    
    0x0040059a mov dword [rbp - 4], edi      |     *((rbp - 4)) = edi;
    0x0040059d mov eax, dword [rbp - 4]      |     eax = *((rbp - 4));
    0x004005a0 add eax, 1                    |     eax++;
    0x004005a3 pop rbp                       |    
    0x004005a4 ret                           |     return eax;
                                             | }
[0x00400596]>
```

### 配置设置

随着你对 Radare2 的使用越来越熟悉，你会想改变它的配置，以适应你的工作方式。你可以使用 `e` 命令查看 `r2` 的默认配置。要设置一个特定的配置，在 `e` 命令后面添加 `config = value`：

```
[0x004005a5]> e | wc -l
593
[0x004005a5]> e | grep syntax
asm.syntax = intel
[0x004005a5]>
[0x004005a5]> e asm.syntax = att
[0x004005a5]>
[0x004005a5]> e | grep syntax
asm.syntax = att
[0x004005a5]>
```

要使配置更改永久化，请将它们放在 `r2` 启动时读取的名为 `.radare2rc` 的启动文件中。这个文件通常在你的主目录下，如果没有，你可以创建一个。一些示例配置选项包括：

```
$ cat ~/.radare2rc
e asm.syntax = att
e scr.utf8 = true
eco solarized
e cmd.stack = true
e stack.size = 256
$
```

### 探索更多

你已经看到了足够多的 Radare2 功能，对这个工具有了一定的了解。因为 Radare2 遵循 Unix 哲学，即使你可以从它的主控台做各种事情，它也会在下面使用一套独立的二进制来完成它的任务。

探索下面列出的独立二进制文件，看看它们是如何工作的。例如，用 `iI` 命令在控制台看到的二进制信息也可以用 `rabin2 <binary>` 命令找到：

```
$ cd bin/
$
$ ls
prefix  r2agent    r2pm  rabin2   radiff2  ragg2    rarun2   rasm2
r2      r2-indent  r2r   radare2  rafind2  rahash2  rasign2  rax2
$
```

你觉得 Radare2 怎么样？请在评论中分享你的反馈。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/1/linux-radare2

作者：[Gaurav Kamathe][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/gkamathe
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/binary_code_computer_screen.png?itok=7IzHK1nn (Binary code on a computer screen)
[2]: https://linux.cn/article-12187-1.html
[3]: https://linux.cn/article-11441-1.html
[4]: https://rada.re/n/
[5]: https://github.com/radareorg/radare2
[6]: https://opensource.com/article/19/3/getting-started-vim
[7]: https://ghidra-sre.org/
[8]: https://opensource.com/sites/default/files/uploads/radare2_visual-mode_0.png (Radare2 Visual mode)
[9]: https://creativecommons.org/licenses/by-sa/4.0/

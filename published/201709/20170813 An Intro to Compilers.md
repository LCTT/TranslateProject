编译器简介： 在 Siri 前时代如何与计算机对话
============================================================

![了解在编译器的世界里前端和后端的新意义](https://pbs.twimg.com/media/C_5qf8aXkAAvSXC.jpg)

简单说来，一个<ruby>编译器<rt>compiler</rt></ruby>不过是一个可以翻译其他程序的程序。传统的编译器可以把源代码翻译成你的计算机能够理解的可执行机器代码。（一些编译器将源代码翻译成别的程序语言，这样的编译器称为源到源翻译器或<ruby>转化器<rt>transpilers</rt></ruby>。）[LLVM][7] 是一个广泛使用的编译器项目，包含许多模块化的编译工具。

传统的编译器设计包含三个部分：

![](https://nicoleorchard.com/img/blog/compilers/compiler1.jpg)

*   <ruby>前端<rt>Frontend</rt></ruby>将源代码翻译为<ruby>中间表示<rt>intermediate representation </rt></ruby> (IR)* 。[clang][1] 是 LLVM 中用于 C 家族语言的前端工具。
*   <ruby>优化器<rt>Optimizer</rt></ruby>分析 IR 然后将其转化为更高效的形式。[opt][2] 是 LLVM 的优化工具。
*   <ruby>后端<rt>Backend</rt></ruby>通过将 IR 映射到目标硬件指令集从而生成机器代码。[llc][3] 是 LLVM 的后端工具。

注：LLVM 的 IR 是一种和汇编类似的低级语言。然而，它抽离了特定硬件信息。

### Hello, Compiler

下面是一个打印 “Hello, Compiler!” 到标准输出的简单 C 程序。C 语法是人类可读的，但是计算机却不能理解，不知道该程序要干什么。我将通过三个编译阶段使该程序变成机器可执行的程序。

```
// compile_me.c
// Wave to the compiler. The world can wait.

#include <stdio.h>

int main() {
  printf("Hello, Compiler!\n");
  return 0;
}
```

#### 前端

正如我在上面所提到的，`clang` 是 LLVM 中用于 C 家族语言的前端工具。Clang 包含 <ruby>C 预处理器<rt>C preprocessor</rt></ruby>、<ruby>词法分析器<rt>lexer</rt></ruby>、<ruby>语法解析器<rt>parser</rt></ruby>、<ruby>语义分析器<rt>semantic analyzer</rt></ruby>和 <ruby>IR 生成器<rt>IR generator</rt></ruby>。

**C 预处理器**在将源程序翻译成 IR 前修改源程序。预处理器处理外部包含文件，比如上面的 `#include <stdio.h>`。 它将会把这一行替换为 `stdio.h` C 标准库文件的完整内容，其中包含 `printf` 函数的声明。

通过运行下面的命令来查看预处理步骤的输出：

```
clang -E compile_me.c -o preprocessed.i
```
	
**词法分析器**（或<ruby>扫描器<rt>scanner</rt></ruby>或<ruby>分词器<rt>tokenizer</rt></ruby>）将一串字符转化为一串单词。每一个单词或<ruby>记号<rt>token</rt></ruby>，被归并到五种语法类别之一：标点符号、关键字、标识符、文字或注释。

compile_me.c 的分词过程：

![](https://nicoleorchard.com/img/blog/compilers/lexer.jpg)

**语法分析器**确定源程序中的单词流是否组成了合法的句子。在分析记号流的语法后，它会输出一个<ruby>抽象语法树<rt>abstract syntax tree</rt></ruby>（AST）。Clang 的 AST 中的节点表示声明、语句和类型。

compile_me.c 的语法树：

![](https://nicoleorchard.com/img/blog/compilers/tree.jpg)

**语义分析器**会遍历抽象语法树，从而确定代码语句是否有正确意义。这个阶段会检查类型错误。如果 `compile_me.c` 的 main 函数返回 `"zero"`而不是 `0`， 那么语义分析器将会抛出一个错误，因为 `"zero"` 不是 `int` 类型。

**IR 生成器**将抽象语法树翻译为 IR。

对 compile_me.c 运行 clang 来生成 LLVM IR：

```
clang -S -emit-llvm -o llvm_ir.ll compile_me.c
```
    
在 `llvm_ir.ll` 中的 main 函数：

```
; llvm_ir.ll
@.str = private unnamed_addr constant [18 x i8] c"Hello, Compiler!\0A\00", align 1

define i32 @main() {
  %1 = alloca i32, align 4 ; <- memory allocated on the stack
  store i32 0, i32* %1, align 4
  %2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i32 0, i32 0))
  ret i32 0
}

declare i32 @printf(i8*, ...)
```

#### 优化程序

优化程序的工作是基于其对程序的运行时行为的理解来提高代码效率。优化程序将 IR 作为输入，然后生成改进后的 IR 作为输出。LLVM 的优化工具 `opt` 将会通过标记 `-O2`（大写字母 `o`，数字 2）来优化处理器速度，通过标记 `Os`（大写字母 `o`，小写字母 `s`）来减少指令数目。

看一看上面的前端工具生成的 LLVM IR 代码和运行下面的命令生成的结果之间的区别：

```
opt -O2 -S llvm_ir.ll -o optimized.ll
```

在 `optimized.ll` 中的 main 函数：

```
optimized.ll

@str = private unnamed_addr constant [17 x i8] c"Hello, Compiler!\00"

define i32 @main() {
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @str, i64 0, i64 0))
  ret i32 0
}

declare i32 @puts(i8* nocapture readonly)
```

优化后的版本中， main 函数没有在栈中分配内存，因为它不使用任何内存。优化后的代码中调用 `puts` 函数而不是 `printf` 函数，因为程序中并没有使用 `printf` 函数的格式化功能。

当然，优化程序不仅仅知道何时可以把 `printf` 函数用 `puts` 函数代替。优化程序也能展开循环并内联简单计算的结果。考虑下面的程序，它将两个整数相加并打印出结果。

```
// add.c
#include <stdio.h>

int main() {
  int a = 5, b = 10, c = a + b;
  printf("%i + %i = %i\n", a, b, c);
}
```

下面是未优化的 LLVM IR：

```
@.str = private unnamed_addr constant [14 x i8] c"%i + %i = %i\0A\00", align 1

define i32 @main() {
  %1 = alloca i32, align 4 ; <- allocate stack space for var a
  %2 = alloca i32, align 4 ; <- allocate stack space for var b
  %3 = alloca i32, align 4 ; <- allocate stack space for var c
  store i32 5, i32* %1, align 4  ; <- store 5 at memory location %1
  store i32 10, i32* %2, align 4 ; <- store 10 at memory location %2
  %4 = load i32, i32* %1, align 4 ; <- load the value at memory address %1 into register %4
  %5 = load i32, i32* %2, align 4 ; <- load the value at memory address %2 into register %5
  %6 = add nsw i32 %4, %5 ; <- add the values in registers %4 and %5\. put the result in register %6
  store i32 %6, i32* %3, align 4 ; <- put the value of register %6 into memory address %3
  %7 = load i32, i32* %1, align 4 ; <- load the value at memory address %1 into register %7
  %8 = load i32, i32* %2, align 4 ; <- load the value at memory address %2 into register %8
  %9 = load i32, i32* %3, align 4 ; <- load the value at memory address %3 into register %9
  %10 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str, i32 0, i32 0), i32 %7, i32 %8, i32 %9)
  ret i32 0
}

declare i32 @printf(i8*, ...)
```

下面是优化后的 LLVM IR：

```
@.str = private unnamed_addr constant [14 x i8] c"%i + %i = %i\0A\00", align 1

define i32 @main() {
  %1 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str, i64 0, i64 0), i32 5, i32 10, i32 15)
  ret i32 0
}

declare i32 @printf(i8* nocapture readonly, ...)
```

优化后的 main 函数本质上是未优化版本的第 17 行和 18 行，伴有变量值内联。`opt` 计算加法，因为所有的变量都是常数。很酷吧，对不对？

#### 后端

LLVM 的后端工具是 `llc`。它分三个阶段将 LLVM IR 作为输入生成机器代码。

*   **指令选择**是将 IR 指令映射到目标机器的指令集。这个步骤使用虚拟寄存器的无限名字空间。
*   **寄存器分配**是将虚拟寄存器映射到目标体系结构的实际寄存器。我的 CPU 是 x86 结构，它只有 16 个寄存器。然而，编译器将会尽可能少的使用寄存器。
*   **指令安排**是重排操作，从而反映出目标机器的性能约束。

运行下面这个命令将会产生一些机器代码：

```
llc -o compiled-assembly.s optimized.ll
```

```
_main:
	pushq	%rbp
	movq	%rsp, %rbp
	leaq	L_str(%rip), %rdi
	callq	_puts
	xorl	%eax, %eax
	popq	%rbp
	retq
L_str:
	.asciz	"Hello, Compiler!"
```

这个程序是 x86 汇编语言，它是计算机所说的语言，并具有人类可读语法。某些人最后也许能理解我。

* * *

相关资源：

1.  [设计一个编译器][4]
2.  [开始探索 LLVM 核心库][5]

--------------------------------------------------------------------------------

via: https://nicoleorchard.com/blog/compilers

作者：[Nicole Orchard][a]
译者：[ucasFL](https://github.com/ucasFL)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://nicoleorchard.com/
[1]:http://clang.llvm.org/
[2]:http://llvm.org/docs/CommandGuide/opt.html
[3]:http://llvm.org/docs/CommandGuide/llc.html
[4]:https://www.amazon.com/Engineering-Compiler-Second-Keith-Cooper/dp/012088478X
[5]:https://www.amazon.com/Getting-Started-LLVM-Core-Libraries/dp/1782166920
[6]:https://twitter.com/norchard/status/864246049266958336
[7]:http://llvm.org/
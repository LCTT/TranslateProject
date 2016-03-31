【Translating by cposture 2016-03-01】
* * *

#  GCC 内联汇编 HOWTO

v0.1, 01 March 2003.
* * *

_本 HOWTO 文档将讲解 GCC 提供的内联汇编特性的用途和用法。对于阅读这篇文章，这里只有两个前提要求，很明显，就是 x86 汇编语言和 C 语言的基本认识。_

* * *

## 1. 简介

## 1.1 版权许可

Copyright (C)2003 Sandeep S.

本文档自由共享；你可以重新发布它，并且/或者在遵循自由软件基金会发布的 GNU 通用公共许可证下修改它；或者该许可证的版本 2 ，或者（按照你的需求）更晚的版本。

发布这篇文档是希望它能够帮助别人，但是没有任何保证；甚至不包括可售性和适用于任何特定目的的保证。关于更详细的信息，可以查看 GNU 通用许可证。

## 1.2 反馈校正

请将反馈和批评一起提交给 [Sandeep.S](mailto:busybox@sancharnet.in) 。我将感谢任何一个指出本文档中错误和不准确之处的人；一被告知，我会马上改正它们。

## 1.3 致谢

我对提供如此棒的特性的 GNU 人们表示真诚的感谢。感谢 Mr.Pramode C E 所做的所有帮助。感谢在 Govt Engineering College 和 Trichur 的朋友们的精神支持和合作，尤其是 Nisha Kurur 和 Sakeeb S 。 感谢在 Gvot Engineering College 和 Trichur 的老师们的合作。

另外，感谢 Phillip ,  Brennan Underwood 和 colin@nyx.net ；这里的许多东西都厚颜地直接取自他们的工作成果。

* * *

## 2. 概览

在这里，我们将学习 GCC 内联汇编。这内联表示的是什么呢？

我们可以要求编译器将一个函数的代码插入到调用者代码中函数被实际调用的地方。这样的函数就是内联函数。这听起来和宏差不多？这两者确实有相似之处。

内联函数的优点是什么呢？

这种内联方法可以减少函数调用开销。同时如果所有实参的值为常量，它们的已知值可以在编译期允许简化，因此并非所有的内联函数代码都需要被包含。代码大小的影响是不可预测的，这取决于特定的情况。为了声明一个内联函数，我们必须在函数声明中使用 `inline` 关键字。

现在我们正处于一个猜测内联汇编到底是什么的点上。它只不过是一些写为内联函数的汇编程序。在系统编程上，它们方便、快速并且极其有用。我们主要集中学习（GCC）内联汇编函数的基本格式和用法。为了声明内联汇编函数，我们使用 `asm` 关键词。

内联汇编之所以重要，主要是因为它可以操作并且使其输出通过 C 变量显示出来。正是因为此能力， "asm" 可以用作汇编指令和包含它的 C 程序之间的接口。 

* * *

## 3. GCC 汇编语法

GCC , Linux上的 GNU C 编译器，使用 **AT&T** / **UNIX** 汇编语法。在这里，我们将使用 AT&T 语法 进行汇编编码。如果你对 AT&T 语法不熟悉的话，请不要紧张，我会教你的。AT&T 语法和 Intel 语法的差别很大。我会给出主要的区别。

1.  源操作数和目的操作数顺序 

	AT&T 语法的操作数方向和 Intel 语法的刚好相反。在Intel 语法中，第一操作数为目的操作数，第二操作数为源操作数，然而在 AT&T 语法中，第一操作数为源操作数，第二操作数为目的操作数。也就是说，

	Intel 语法中的 "Op-code dst src" 变为 
	
	AT&T 语法中的 "Op-code src dst"。

2.  寄存器命名 

	寄存器名称有 % 前缀，即如果必须使用 eax，它应该用作 %eax。

3.  立即数

    AT&T 立即数以 ’$’ 为前缀。静态 "C" 变量 也使用 ’$’ 前缀。在 Intel 语法中，十六进制常量以 ’h’ 为后缀，然而AT&T不使用这种语法，这里我们给常量添加前缀 ’0x’。所以，对于十六进制，我们首先看到一个 ’$’，然后是 ’0x’，最后才是常量。

4.  操作数大小

	在 AT&T 语法中，存储器操作数的大小取决于操作码名字的最后一个字符。操作码后缀 ’b’ 、’w’、’l’分别指明了字节（byte）（8位）、字（word）（16位）、长型（long）（32位）存储器引用。Intel 语法通过给存储器操作数添加’byte ptr’、 ’word ptr’ 和 ’dword ptr’前缀来实现这一功能。

	因此，Intel的 "mov al, byte ptr foo" 在 AT&T 语法中为 "movb foo, %al"。

5.	存储器操作数
	
	在 Intel 语法中，基址寄存器包含在 ’[’ 和 ’]’ 中，然而在 AT&T 中，它们变为 ’(’ 和 ’)’。另外，在 Intel 语法中， 间接内存引用为

    section:[base + index*scale + disp], 在 AT&T中变为 

    section:disp(base, index, scale)。

	需要牢记的一点是，当一个常量用于 disp 或 scale，不能添加’$’前缀。

现在我们看到了 Intel 语法和 AT&T 语法之间的一些主要差别。我仅仅写了它们差别的一部分而已。关于更完整的信息，请参考 GNU 汇编文档。现在为了更好地理解，我们可以看一些示例。

> `
> 
> <pre>+------------------------------+------------------------------------+
> |       Intel Code             |      AT&T Code                     |
> +------------------------------+------------------------------------+
> | mov     eax,1                |  movl    $1,%eax                   |   
> | mov     ebx,0ffh             |  movl    $0xff,%ebx                |   
> | int     80h                  |  int     $0x80                     |   
> | mov     ebx, eax             |  movl    %eax, %ebx                |
> | mov     eax,[ecx]            |  movl    (%ecx),%eax               |
> | mov     eax,[ebx+3]          |  movl    3(%ebx),%eax              | 
> | mov     eax,[ebx+20h]        |  movl    0x20(%ebx),%eax           |
> | add     eax,[ebx+ecx*2h]     |  addl    (%ebx,%ecx,0x2),%eax      |
> | lea     eax,[ebx+ecx]        |  leal    (%ebx,%ecx),%eax          |
> | sub     eax,[ebx+ecx*4h-20h] |  subl    -0x20(%ebx,%ecx,0x4),%eax |
> +------------------------------+------------------------------------+
> </pre>
> 
> `

* * *

## 4. 基本内联

基本内联汇编的格式非常直接了当。它的基本格式为

`asm("汇编代码");`

示例

> `
> 
> * * *
> 
> <pre>asm("movl %ecx %eax"); /* 将 ecx 寄存器的内容移至 eax  */
> __asm__("movb %bh (%eax)"); /* 将 bh 的一个字节数据 移至 eax 寄存器指向的内存 */
> </pre>
> 
> * * *
> 
> `

你可能注意到了这里我使用了 `asm ` 和 `__asm__`。这两者都是有效的。如果关键词 `asm` 和我们程序的一些标识符冲突了，我们可以使用 `__asm__`。如果我们的指令多余一条，我们可以写成一行，并用括号括起，也可以为每条指令添加 ’\n’ 和 ’\t’ 后缀。这是因为gcc将每一条当作字符串发送给 **as**（GAS）（ GAS 即 GNU 汇编器 ——译者注），并且通过使用换行符/制表符发送正确地格式化行给汇编器。

示例

> `
> 
> * * *
> 
> <pre> __asm__ ("movl %eax, %ebx\n\t"
>           "movl $56, %esi\n\t"
>           "movl %ecx, $label(%edx,%ebx,$4)\n\t"
>           "movb %ah, (%ebx)");
> </pre>
> 
> * * *
> 
> `

如果在代码中，我们涉及到一些寄存器（即改变其内容），但在没有固定这些变化的情况下从汇编中返回，这将会导致一些不好的事情。这是因为 GCC 并不知道寄存器内容的变化，这会导致问题，特别是当编译器做了某些优化。在没有告知 GCC 的情况下，它将会假设一些寄存器存储了我们可能已经改变的变量的值，它会像什么事都没发生一样继续运行（什么事都没发生一样是指GCC不会假设寄存器装入的值是有效的，当退出改变了寄存器值的内联汇编后，寄存器的值不会保存到相应的变量或内存空间 ——译者注）。我们所可以做的是使用这些没有副作用的指令，或者当我们退出时固定这些寄存器，或者等待程序崩溃。这是为什么我们需要一些扩展功能。扩展汇编正好给我们提供了那样的功能。

* * *

## 5. 扩展汇编

在基本内联汇编中，我们只有指令。然而在扩展汇编中，我们可以同时指定操作数。它允许我们指定输入寄存器、输出寄存器以及修饰寄存器列表。GCC 不强制用户必须指定使用的寄存器。我们可以把头疼的事留给 GCC ，这可能可以更好地适应 GCC 的优化。不管怎樣，基本格式为：

> `
> 
> * * *
> 
> <pre>       asm ( 汇编程序模板 
>            : 输出操作数					/* 可选的 */
>            : 输入操作数                   /* 可选的 */
>            : 修饰寄存器列表			    /* 可选的 */
>            );
> </pre>
> 
> * * *
> 
> `

汇编程序模板由汇编指令组成.每一个操作数由一个操作数约束字符串所描述，其后紧接一个括弧括起的 C 表达式。冒号用于将汇编程序模板和第一个输出操作数分开，另一个（冒号）用于将最后一个输出操作数和第一个输入操作数分开，如果存在的话。逗号用于分离每一个组内的操作数。总操作数的数目限制在10个，或者机器描述中的任何指令格式中的最大操作数数目，以较大者为准。

如果没有输出操作数但存在输入操作数，你必须将两个连续的冒号放置于输出操作数原本会放置的地方周围。

示例：

> `
> 
> * * *
> 
> <pre>        asm ("cld\n\t"
>              "rep\n\t"
>              "stosl"
>              : /* 无输出寄存器 */
>              : "c" (count), "a" (fill_value), "D" (dest)
>              : "%ecx", "%edi" 
>              );
> </pre>
> 
> * * *
> 
> `

现在，这段代码是干什么的？以上的内联汇编是将 `fill_value` 值 连续 `count` 次 拷贝到 寄存器 `edi` 所指位置（每执行stosl一次，寄存器 edi 的值会递增或递减，这取决于是否设置了 direction 标志，因此以上代码实则初始化一个内存块 ——译者注）。 它也告诉 gcc 寄存器 `ecx` 和 `edi` 一直无效（原文为 eax ，但代码修饰寄存器列表中为 ecx，因此这可能为作者的纰漏 ——译者注）。为了使扩展汇编更加清晰，让我们再看一个示例。

> `
> 
> * * *
> 
> <pre>        
>         int a=10, b;
>         asm ("movl %1, %%eax; 
>               movl %%eax, %0;"
>              :"=r"(b)        /* 输出 */
>              :"r"(a)         /* 输入 */
>              :"%eax"         /* 修饰寄存器 */
>              );       
> </pre>
> 
> * * *
> 
> `

这里我们所做的是使用汇编指令使 ’b’ 变量的值等于 ’a’ 变量的值。一些有意思的地方是：

*	"b" 为输出操作数，用 %0 引用，并且 "a" 为输入操作数，用 %1 引用。
*	"r" 为操作数约束。之后我们会更详细地了解约束（字符串）。目前，"r" 告诉 GCC 可以使用任一寄存器存储操作数。输出操作数约束应该有一个约束修饰符 "=" 。这修饰符表明它是一个只读的输出操作数。
*	寄存器名字以两个%为前缀。这有利于 GCC 区分操作数和寄存器。操作数以一个 % 为前缀。
*	第三个冒号之后的修饰寄存器 %eax 告诉 GCC %eax的值将会在 "asm" 内部被修改，所以 GCC 将不会使用此寄存器存储任何其他值。

当 "asm" 执行完毕， "b" 变量会映射到更新的值，因为它被指定为输出操作数。换句话说， "asm" 内 "b" 变量的修改 应该会被映射到 "asm" 外部。

现在，我们可以更详细地看看每一个域。

## 5.1 汇编程序模板

汇编程序模板包含了被插入到 C 程序的汇编指令集。其格式为：每条指令用双引号圈起，或者整个指令组用双引号圈起。同时每条指令应以分界符结尾。有效的分界符有换行符（\n）和逗号（;）。’\n’ 可以紧随一个制表符（\t）。我们应该都明白使用换行符或制表符的原因了吧？和 C 表达式对应的操作数使用 %0、%1 ... 等等表示。

## 5.2 操作数

C 表达式用作 "asm" 内的汇编指令操作数。作为第一双引号内的操作数约束，写下每一操作数。对于输出操作数，在引号内还有一个约束修饰符，其后紧随一个用于表示操作数的 C 表达式。即，

"约束字符串"(C 表达式)，它是一个通用格式。对于输出操作数，还有一个额外的修饰符。约束字符串主要用于决定操作数的寻找方式，同时也用于指定使用的寄存器。

如果我们使用的操作数多于一个，那么每一个操作数用逗号隔开。

在汇编程序模板，每个操作数用数字引用。编号方式如下。如果总共有 n 个操作数（包括输入和输出操作数），那么第一个输出操作数编号为 0 ，逐项递增，并且最后一个输入操作数编号为 n - 1 。操作数的最大数目为前一节我们所看到的那样。

输出操作数表达式必须为左值。输入操作数的要求不像这样严格。它们可以为表达式。扩展汇编特性常常用于编译器自己不知道其存在的机器指令 ;-)。如果输出表达式无法直接寻址（例如，它是一个位域），我们的约束字符串必须给定一个寄存器。在这种情况下，GCC 将会使用该寄存器作为汇编的输出，然后存储该寄存器的内容到输出。

正如前面所陈述的一样，普通的输出操作数必须为只写的； GCC 将会假设指令前的操作数值是死的，并且不需要被（提前）生成。扩展汇编也支持输入-输出或者读-写操作数。

所以现在我们来关注一些示例。我们想要求一个数的5次方结果。为了计算该值，我们使用 `lea` 指令。

> `
> 
> * * *
> 
> <pre>        asm ("leal (%1,%1,4), %0"
>              : "=r" (five_times_x)
>              : "r" (x) 
>              );
> </pre>
> 
> * * *
> 
> `

这里我们的输入为x。我们不指定使用的寄存器。 GCC 将会选择一些输入寄存器，一个输出寄存器，并且做我们期望的事。如果我们想要输入和输出存在于同一个寄存器里，我们可以要求 GCC 这样做。这里我们使用那些读-写操作数类型。这里我们通过指定合适的约束来实现它。

> `
> 
> * * *
> 
> <pre>        asm ("leal (%0,%0,4), %0"
>              : "=r" (five_times_x)
>              : "0" (x) 
>              );
> </pre>
> 
> * * *
> 
> `

现在输出和输出操作数位于同一个寄存器。但是我们无法得知是哪一个寄存器。现在假如我们也想要指定操作数所在的寄存器，这里有一种方法。

> `
> 
> * * *
> 
> <pre>        asm ("leal (%%ecx,%%ecx,4), %%ecx"
>              : "=c" (x)
>              : "c" (x) 
>              );
> </pre>
> 
> * * *
> 
> `

在以上三个示例中，我们并没有添加任何寄存器到修饰寄存器里，为什么？在头两个示例， GCC 决定了寄存器并且它知道发生了什么改变。在最后一个示例，我们不必将 'ecx' 添加到修饰寄存器列表（原文修饰寄存器列表拼写有错，这里已修正 ——译者注）， gcc 知道它表示x。因此，因为它可以知道 `ecx` 的值，它就不被当作修饰的（寄存器）了。

## 5.3 修饰寄存器列表

一些指令会破坏一些硬件寄存器。我们不得不在修饰寄存器中列出这些寄存器，即汇编函数内第三个 ’**:**’ 之后的域。这可以通知 gcc 我们将会自己使用和修改这些寄存器。所以 gcc 将不会假设存入这些寄存器的值是有效的。我们不用在这个列表里列出输入输出寄存器。因为 gcc 知道 "asm" 使用了它们（因为它们被显式地指定为约束了）。如果指令隐式或显式地使用了任何其他寄存器，（并且寄存器不能出现在输出或者输出约束列表里），那么不得不在修饰寄存器列表中指定这些寄存器。

如果我们的指令可以修改状态寄存器，我们必须将 "cc" 添加进修饰寄存器列表。

如果我们的指令以不可预测的方式修改了内存，那么需要将 "memory" 添加进修饰寄存器列表。这可以使 GCC 不会在汇编指令间保持缓存于寄存器的内存值。如果被影响的内存不在汇编的输入或输出列表中，我们也必须添加 **volatile** 关键词。

我们可以按我们的需求多次读写修饰寄存器。考虑一个模板内的多指令示例；它假设子例程 _foo 接受寄存器 `eax` 和 `ecx` 里的参数。

> `
> 
> * * *
> 
> <pre>        asm ("movl %0,%%eax;
>               movl %1,%%ecx;
>               call _foo"
>              : /* no outputs */
>              : "g" (from), "g" (to)
>              : "eax", "ecx"
>              );
> </pre>
> 
> * * *
> 
> `

## 5.4 Volatile ...?

如果你熟悉内核源码或者其他像内核源码一样漂亮的代码，你一定见过许多声明为 `volatile` 或者 `__volatile__`的函数，其跟着一个 `asm` 或者 `__asm__`。我之前提过关键词 `asm` 和 `__asm__`。那么什么是 `volatile`呢？

如果我们的汇编语句必须在我们放置它的地方执行（即，不能作为一种优化被移出循环语句），将关键词 `volatile` 放置在 asm 后面，()的前面。因为为了防止它被移动、删除或者其他操作，我们将其声明为

`asm volatile ( ... : ... : ... : ...);`

当我们必须非常谨慎时，请使用 `__volatile__`。

如果我们的汇编只是用于一些计算并且没有任何副作用，不使用 `volatile` 关键词会更好。不使用 `volatile` 可以帮助 gcc 优化代码并使代码更漂亮。


在 `Some Useful Recipes` 一节中，我提供了多个内联汇编函数的例子。这儿我们详细查看修饰寄存器列表。

* * *

## 6. 更多关于约束

到这个时候，你可能已经了解到约束和内联汇编有很大的关联。但我们很少说到约束。约束用于表明一个操作数是否可以位于寄存器和位于哪个寄存器；是否操作数可以为一个内存引用和哪种地址；是否操作数可以为一个立即数和为哪一个可能的值（即值的范围）。它可以有...等等。

## 6.1 常用约束

在许多约束中，只有小部分是常用的。我们将看看这些约束。

1.  **寄存器操作数约束（r）**

	当使用这种约束指定操作数时，它们存储在通用寄存器（GPR）中。请看下面示例：

    `asm ("movl %%eax, %0\n" :"=r"(myval));`

	这里，变量 myval 保存在寄存器中，寄存器 eax 的值被复制到该寄存器中，并且myval的值从寄存器更新到了内存。当指定 "r" 约束时， gcc 可以将变量保存在任何可用的 GPR 中。为了指定寄存器，你必须使用特定寄存器约束直接地指定寄存器的名字。它们为：

    > `
    > 
    > <pre>+---+--------------------+
    > | r |    Register(s)     |
    > +---+--------------------+
    > | a |   %eax, %ax, %al   |
    > | b |   %ebx, %bx, %bl   |
    > | c |   %ecx, %cx, %cl   |
    > | d |   %edx, %dx, %dl   |
    > | S |   %esi, %si        |
    > | D |   %edi, %di        |
    > +---+--------------------+
    > </pre>
    > 
    > `

2.	**内存操作数约束（m）**

	当操作数位于内存时，任何对它们的操作将直接发生在内存位置，这与寄存器约束相反，后者首先将值存储在要修改的寄存器中，然后将它写回到内存位置。但寄存器约束通常用于一个指令必须使用它们或者它们可以大大提高进程速度的地方。当需要在 "asm" 内更新一个 C 变量，而又不想使用寄存器去保存它的只，使用内存最为有效。例如， idtr 的值存储于内存位置：

    `asm("sidt %0\n" : :"m"(loc));`

3.	**匹配（数字）约束**

	在某些情况下，一个变量可能既充当输入操作数，也充当输出操作数。可以通过使用匹配约束在 "asm" 中指定这种情况。

    `asm ("incl %0" :"=a"(var):"0"(var));`

	在操作数子节中，我们也看到了一些类似的示例。在这个匹配约束的示例中，寄存器 "%eax" 既用作输入变量，也用作输出变量。 var 输入被读进 %eax ，并且更新的 %eax 再次被存储进 var。这里的 "0" 用于指定与第0个输出变量相同的约束。也就是，它指定 var 输出实例应只被存储在 "%eax" 中。该约束可用于：

	*	在输入从变量读取或变量修改后，修改被写回同一变量的情况
	*	在不需要将输入操作数实例和输出操作数实例分开的情况

	使用匹配约束最重要的意义在于它们可以导致有效地使用可用寄存器。

其他一些约束：

1.	"m" : 允许一个内存操作数使用机器普遍支持的任一种地址。
2.	"o" : 允许一个内存操作数，但只有当地址是可偏移的。即，该地址加上一个小的偏移量可以得到一个地址。
3.  "V" : A memory operand that is not offsettable. In other words, anything that would fit the `m’ constraint but not the `o’constraint.
4.	"i" : 允许一个（带有常量）的立即整形操作数。这包括其值仅在汇编时期知道的符号常量。
5.	"n" : 允许一个带有已知数字的立即整形操作数。许多系统不支持汇编时期的常量，因为操作数少于一个字宽。对于此种操作数，约束应该使用 'n' 而不是'i'。 
6.	"g" : 允许任一寄存器、内存或者立即整形操作数，不包括通用寄存器之外的寄存器。


以下约束为x86特有。

1.	"r" : 寄存器操作数约束，查看上面给定的表格。
2.	"q" : 寄存器 a、b、c 或者 d。
3.	"I" : 范围从 0 到 31 的常量（对于 32 位移位）。
4.  "J" : 范围从 0 到 63 的常量（对于 64 位移位）。
5.	"K" : 0xff。
6.  "L" : 0xffff。
7.  "M" : 0, 1, 2, or 3 （lea 指令的移位）。
8.  "N" : 范围从 0 到 255 的常量（对于 out 指令）。
9.  "f" : 浮点寄存器
10.  "t" : 第一个（栈顶）浮点寄存器
11.  "u" : 第二个浮点寄存器
12.  "A" : 指定 `a` 或 `d` 寄存器。这主要用于想要返回 64 位整形数，使用 `d` 寄存器保存最高有效位和 `a` 寄存器保存最低有效位。

## 6.2 约束修饰符

当使用约束时，对于更精确的控制超越了约束作用的需求，GCC 给我们提供了约束修饰符。最常用的约束修饰符为：

1.  "=" : 意味着对于这条指令，操作数为只写的；旧值会被忽略并被输出数据所替换。
2.  "&" : 意味着这个操作数为一个早期的改动操作数，其在该指令完成前通过使用输入操作数被修改了。因此，这个操作数不可以位于一个被用作输出操作数或任何内存地址部分的寄存器。如果在旧值被写入之前它仅用作输入而已，一个输入操作数可以为一个早期改动操作数。

	约束的列表和解释是决不完整的。示例可以给我们一个关于内联汇编的用途和用法的更好的理解。在下一节，我们会看到一些示例，在那里我们会发现更多关于修饰寄存器列表的东西。

* * *

## 7. Some Useful Recipes.

Now we have covered the basic theory about GCC inline assembly, now we shall concentrate on some simple examples. It is always handy to write inline asm functions as MACRO’s. We can see many asm functions in the kernel code. (/usr/src/linux/include/asm/*.h).

1.  First we start with a simple example. We’ll write a program to add two numbers.

    > `
    > 
    > * * *
    > 
    > <pre>int main(void)
    > {
    >         int foo = 10, bar = 15;
    >         __asm__ __volatile__("addl  %%ebx,%%eax"
    >                              :"=a"(foo)
    >                              :"a"(foo), "b"(bar)
    >                              );
    >         printf("foo+bar=%d\n", foo);
    >         return 0;
    > }
    > </pre>
    > 
    > * * *
    > 
    > `

    Here we insist GCC to store foo in %eax, bar in %ebx and we also want the result in %eax. The ’=’ sign shows that it is an output register. Now we can add an integer to a variable in some other way.

    > `
    > 
    > * * *
    > 
    > <pre> __asm__ __volatile__(
    >                       "   lock       ;\n"
    >                       "   addl %1,%0 ;\n"
    >                       : "=m"  (my_var)
    >                       : "ir"  (my_int), "m" (my_var)
    >                       :                                 /* no clobber-list */
    >                       );
    > </pre>
    > 
    > * * *
    > 
    > `

    This is an atomic addition. We can remove the instruction ’lock’ to remove the atomicity. In the output field, "=m" says that my_var is an output and it is in memory. Similarly, "ir" says that, my_int is an integer and should reside in some register (recall the table we saw above). No registers are in the clobber list.

2.  Now we’ll perform some action on some registers/variables and compare the value.

    > `
    > 
    > * * *
    > 
    > <pre> __asm__ __volatile__(  "decl %0; sete %1"
    >                       : "=m" (my_var), "=q" (cond)
    >                       : "m" (my_var) 
    >                       : "memory"
    >                       );
    > </pre>
    > 
    > * * *
    > 
    > `

    Here, the value of my_var is decremented by one and if the resulting value is `0` then, the variable cond is set. We can add atomicity by adding an instruction "lock;\n\t" as the first instruction in assembler template.

    In a similar way we can use "incl %0" instead of "decl %0", so as to increment my_var.

    Points to note here are that (i) my_var is a variable residing in memory. (ii) cond is in any of the registers eax, ebx, ecx and edx. The constraint "=q" guarantees it. (iii) And we can see that memory is there in the clobber list. ie, the code is changing the contents of memory.

3.  How to set/clear a bit in a register? As next recipe, we are going to see it.

    > `
    > 
    > * * *
    > 
    > <pre>__asm__ __volatile__(   "btsl %1,%0"
    >                       : "=m" (ADDR)
    >                       : "Ir" (pos)
    >                       : "cc"
    >                       );
    > </pre>
    > 
    > * * *
    > 
    > `

    Here, the bit at the position ’pos’ of variable at ADDR ( a memory variable ) is set to `1` We can use ’btrl’ for ’btsl’ to clear the bit. The constraint "Ir" of pos says that, pos is in a register, and it’s value ranges from 0-31 (x86 dependant constraint). ie, we can set/clear any bit from 0th to 31st of the variable at ADDR. As the condition codes will be changed, we are adding "cc" to clobberlist.

4.  Now we look at some more complicated but useful function. String copy.

    > `
    > 
    > * * *
    > 
    > <pre>static inline char * strcpy(char * dest,const char *src)
    > {
    > int d0, d1, d2;
    > __asm__ __volatile__(  "1:\tlodsb\n\t"
    >                        "stosb\n\t"
    >                        "testb %%al,%%al\n\t"
    >                        "jne 1b"
    >                      : "=&S" (d0), "=&D" (d1), "=&a" (d2)
    >                      : "0" (src),"1" (dest) 
    >                      : "memory");
    > return dest;
    > }
    > </pre>
    > 
    > * * *
    > 
    > `

    The source address is stored in esi, destination in edi, and then starts the copy, when we reach at **0**, copying is complete. Constraints "&S", "&D", "&a" say that the registers esi, edi and eax are early clobber registers, ie, their contents will change before the completion of the function. Here also it’s clear that why memory is in clobberlist.

    We can see a similar function which moves a block of double words. Notice that the function is declared as a macro.

    > `
    > 
    > * * *
    > 
    > <pre>#define mov_blk(src, dest, numwords) \
    > __asm__ __volatile__ (                                          \
    >                        "cld\n\t"                                \
    >                        "rep\n\t"                                \
    >                        "movsl"                                  \
    >                        :                                        \
    >                        : "S" (src), "D" (dest), "c" (numwords)  \
    >                        : "%ecx", "%esi", "%edi"                 \
    >                        )
    > </pre>
    > 
    > * * *
    > 
    > `

    Here we have no outputs, so the changes that happen to the contents of the registers ecx, esi and edi are side effects of the block movement. So we have to add them to the clobber list.

5.  In Linux, system calls are implemented using GCC inline assembly. Let us look how a system call is implemented. All the system calls are written as macros (linux/unistd.h). For example, a system call with three arguments is defined as a macro as shown below.

    > `
    > 
    > * * *
    > 
    > type name(type1 arg1,type2 arg2,type3 arg3) \
    > { \
    > long __res; \
    > __asm__ volatile (  "int $0x80" \
    >                   : "=a" (__res) \
    >                   : "0" (__NR_##name),"b" ((long)(arg1)),"c" ((long)(arg2)), \
    >                     "d" ((long)(arg3))); \
    > __syscall_return(type,__res); \
    > }
    > </pre>
    > 
    > * * *
    > 
    > `

    Whenever a system call with three arguments is made, the macro shown above is used to make the call. The syscall number is placed in eax, then each parameters in ebx, ecx, edx. And finally "int 0x80" is the instruction which makes the system call work. The return value can be collected from eax.

    Every system calls are implemented in a similar way. Exit is a single parameter syscall and let’s see how it’s code will look like. It is as shown below.

    > `
    > 
    > * * *
    > 
    > <pre>{
    >         asm("movl $1,%%eax;         /* SYS_exit is 1 */
    >              xorl %%ebx,%%ebx;      /* Argument is in ebx, it is 0 */
    >              int  $0x80"            /* Enter kernel mode */
    >              );
    > }
    > </pre>
    > 
    > * * *
    > 
    > `

    The number of exit is "1" and here, it’s parameter is 0\. So we arrange eax to contain 1 and ebx to contain 0 and by `int $0x80`, the `exit(0)` is executed. This is how exit works.

* * *

## 8. Concluding Remarks.

This document has gone through the basics of GCC Inline Assembly. Once you have understood the basic concept it is not difficult to take steps by your own. We saw some examples which are helpful in understanding the frequently used features of GCC Inline Assembly.

GCC Inlining is a vast subject and this article is by no means complete. More details about the syntax’s we discussed about is available in the official documentation for GNU Assembler. Similarly, for a complete list of the constraints refer to the official documentation of GCC.

And of-course, the Linux kernel use GCC Inline in a large scale. So we can find many examples of various kinds in the kernel sources. They can help us a lot.

If you have found any glaring typos, or outdated info in this document, please let us know.

* * *

## 9. References.

1.  [Brennan’s Guide to Inline Assembly](http://www.delorie.com/djgpp/doc/brennan/brennan_att_inline_djgpp.html)
2.  [Using Assembly Language in Linux](http://linuxassembly.org/articles/linasm.html)
3.  [Using as, The GNU Assembler](http://www.gnu.org/manual/gas-2.9.1/html_mono/as.html)
4.  [Using and Porting the GNU Compiler Collection (GCC)](http://gcc.gnu.org/onlinedocs/gcc_toc.html)
5.  [Linux Kernel Source](http://ftp.kernel.org/)

* * *
via: http://www.ibiblio.org/gferg/ldp/GCC-Inline-Assembly-HOWTO.html

  作者：[Sandeep.S](mailto:busybox@sancharnet.in) 译者：[](https://github.com/) 校对：[]()

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[#]: collector: (lujun9972)
[#]: translator: (chen-ni)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11021-1.html)
[#]: subject: (A short primer on assemblers, compilers, and interpreters)
[#]: via: (https://opensource.com/article/19/5/primer-assemblers-compilers-interpreters)
[#]: author: (Erik O'Shaughnessy https://opensource.com/users/jnyjny/users/shawnhcorey/users/jnyjny/users/jnyjny)

浅谈汇编器、编译器和解释器
======

> 简单介绍一下编程方式的历史演变。

![](https://img.linux.net.cn/data/attachment/album/201906/26/181309vdouxdfktr344rm4.jpg)

在计算机诞生不久的早期年代，硬件非常昂贵，而程序员比较廉价。这些廉价程序员甚至都没有“程序员”这个头衔，并且常常是由数学家或者电气工程师来充当这个角色的。早期的计算机被用来快速解决复杂的数学问题，所以数学家天然就适合“编程”工作。

### 什么是程序？

首先来看一点背景知识。计算机自己是做不了任何事情的，它们的任何行为都需要程序来引导。你可以把程序看成是非常精确的菜谱，这种菜谱读取一个输入，然后生成对应的输出。菜谱里的各个步骤由操作数据的指令构成。听上去有点儿复杂，不过你或许知道下面这个语句是什么意思：

```
1 + 2 = 3
```

其中的加号是“指令”，而数字 1 和 2 是数据。数学上的等号意味着等式两边的部分是“等价”的，不过在大部分编程语言中对变量使用等号是“赋值”的意思。如果计算机执行上面这个语句，它会把这个加法的结果（也就是“3”）储存在内存中的某个地方。

计算机知道如何使用数字进行数学运算，以及如何在内存结构中移动数据。在这里就不对内存进行展开了，你只需要知道内存一般分为两大类：“速度快/空间小”和“速度慢/空间大”。CPU 寄存器的读写速度非常快，但是空间非常小，相当于一个速记便签。主存储器通常有很大的空间，但是读写速度就比寄存器差远了。在程序运行的时候，CPU 不断将它所需要用到的数据从主存储器挪动到寄存器，然后再把结果放回到主存储器。

### 汇编器

当时的计算机很贵，而人力比较便宜。程序员需要耗费很多时间把手写的数学表达式翻译成计算机可以执行的指令。最初的计算机只有非常糟糕的用户界面，有些甚至只有前面板上的拨动开关。这些开关就代表一个内存“单元”里的一个个 “0” 和 “1”。程序员需要配置一个内存单元，选择好储存位置，然后把这个单元提交到内存里。这是一个既耗时又容易出错的过程。

![Programmers operate the ENIAC computer][2]

*程序员[Betty Jean Jennings][3] (左) 和 [Fran Bilas][4] (右) 在操作 [ENIAC][5] 的主控制面板*

后来有一名 [电气工程师][6] 认为自己的时间很宝贵，就写了一个程序，能够把人们可以读懂的“菜谱”一样的输入转换成计算机可以读懂的版本。这就是最初的“汇编器”，在当时引起了不小的争议。这些昂贵机器的主人不希望把计算资源浪费在人们已经能做的任务上（虽然又慢又容易出错）。不过随着时间的推移，人们逐渐发现使用汇编器在速度和准确性上都胜于人工编写机器语言，并且计算机完成的“实际工作量”增加了。

尽管汇编器相比在机器面板上切换比特的状态已经是很大的进步了，这种编程方式仍然非常专业。上面加法的例子在汇编语言中看起来差不多是这样的：

```
01 MOV R0, 1
02 MOV R1, 2
03 ADD R0, R1, R2
04 MOV 64, R0
05 STO R2, R0
```

每一行都是一个计算机指令，前面是一个指令的简写，后面是指令所操作的数据。这个小小的程序首先会将数值 1 “移动”到寄存器 R0，然后把 2 移动到寄存器 R1。03 行把 R0 和 R1 两个寄存器里的数值相加，然后将结果储存在 R2 寄存器里。最后，04 行和 05 行决定结果应该被放在主存储器里的什么位置（在这里是地址 64）。管理内存中存储数据的位置是编程过程中最耗时也最容易出错的部分之一。

### 编译器

汇编器已经比手写计算机指令要好太多了，不过早期的程序员还是渴望能够按照他们所习惯的方式，像书写数学公式一样地去写程序。这种需求推动了高级编译语言的发展，其中有一些已经成为历史，另一些如今还在使用。比如 [ALGO][7] 就已经成为历史了，但是像 [Fortran][8] 和 [C][9] 这样的语言仍然在不断解决实际问题。

![Genealogy tree of ALGO and Fortran][10]

*ALGO 和 Fortran 编程语言的谱系树*

这些“高级”语言使得程序员可以用更简单的方式编写程序。在 C 语言中，我们的加法程序就变成了这样：

```
int x;
x = 1 + 2;
```

第一个语句描述了该程序将要使用的一块内存。在这个例子中，这块内存应该占一个整数的大小，名字是 `x`。第二个语句是加法，虽然是倒着写的。一个 C 语言的程序员会说这是 “X 被赋值为 1 加 2 的结果”。需要注意的是，程序员并不需要决定在内存的什么位置储存 `x`，这个任务交给编译器了。

这种被称为“编译器”的新程序可以把用高级语言写的程序转换成汇编语言，再使用汇编器把汇编语言转换成机器可读的程序。这种程序组合常常被称为“工具链”，因为一个程序的输出就直接成为另一个程序的输入。

编译语言相比汇编语言的优势体现在从一台计算机迁移到不同型号或者品牌的另一台计算机上的时候。在计算机的早期岁月里，包括 IBM、DEC、德州仪器、UNIVAC 以及惠普在内的很多公司都在制造除了大量不同类型的计算机硬件。这些计算机除了都需要连接电源之外就没有太多共同点了。它们在内存和 CPU 架构上的差异相当大，当时经常需要人们花费数年来将一台计算机的程序翻译成另一台计算机的程序。

有了高级语言，我们只需要把编译器工具链迁移到新的平台就行了。只要有可用的编译器，高级语言写的程序最多只需要经过小幅修改就可以在新的计算机上被重新编译。高级语言的编译是一个真正的革命性成果。

![IBM PC XT][11]

*1983 发布的 IBM PC XT 是硬件价格下降的早期例子。*

程序员们的生活得到了很好的改善。相比之下，通过高级语言表达他们想要解决的问题让事情变得轻松很多。由于半导体技术的进步以及集成芯片的发明，计算机硬件的价格急剧下降。计算机的速度越来越快，能力也越来越强，并且还便宜了很多。从某个时间点往后（也许是 80 年代末期吧），事情发生了反转，程序员变得比他们所使用的硬件更值钱了。

### 解释器

随着时间的推移，一种新的编程方式兴起了。一种被称为“解释器”的特殊程序可以直接读取一个程序将其转换成计算机指令以立即执行。和编译器差不多，解释器读取程序并将它转换成一个中间形态。但和编译器不同的是，解释器直接执行程序的这个中间形态。解释型语言在每一次执行的时候都要经历这个过程；而编译程序只需要编译一次，之后计算机每次只需要执行编译好的机器指令就可以了。

顺便说一句，这个特性就是导致人们感觉解释型程序运行得比较慢的原因。不过现代计算机的性能出奇地强大，以至于大多数人无法区分编译型程序和解释型程序。 

解释型程序（有时也被成为“脚本”）甚至更容易被移植到不同的硬件平台上。因为脚本并不包含任何机器特有的指令，同一个版本的程序可以不经过任何修改就直接在很多不同的计算机上运行。不过当然了，解释器必须得先移植到新的机器上才行。

一个很流行的解释型语言是 [perl][12]。用 perl 完整地表达我们的加法问题会是这样的：

```
$x = 1 + 2
```

虽然这个程序看起来和 C 语言的版本差不多，运行上也没有太大区别，但却缺少了初始化变量的语句。其实还有一些其它的区别（超出这篇文章的范围了），但你应该已经注意到，我们写计算机程序的方式已经和数学家用纸笔手写数学表达式非常接近了。

### 虚拟机

最新潮的编程方式要数虚拟机（经常简称 VM）了。虚拟机分为两大类：系统虚拟机和进程虚拟机。这两种虚拟机都提供一种对“真实的”计算硬件的不同级别的抽象，不过它们的作用域不同。系统虚拟机是一个提供物理硬件的替代品的软件，而进程虚拟机则被设计用来以一种“系统独立”的方式执行程序。所以在这个例子里，进程虚拟机（往后我所说的虚拟机都是指这个类型）的作用域和解释器的比较类似，因为也是先将程序编译成一个中间形态，然后虚拟机再执行这个中间形态。

虚拟机和解释器的主要区别在于，虚拟机创造了一个虚拟的 CPU，以及一套虚拟的指令集。有了这层抽象，我们就可以编写前端工具来把不同语言的程序编译成虚拟机可以接受的程序了。也许最流行也最知名的虚拟机就是 Java 虚拟机（JVM）了。JVM 最初在 1990 年代只支持 Java 语言，但是如今却可以运行 [许多][13] 流行的编程语言，包括 Scala、Jython、JRuby、Clojure，以及 Kotlin 等等。还有其它一些不太常见的例子，在这里就不说了。我也是最近才知道，我最喜欢的语言 Python 并不是一个解释型语言，而是一个 [运行在虚拟机上的语言][15]！

虚拟机仍然在延续这样一个历史趋势：让程序员在使用特定领域的编程语言解决问题的时候，所需要的对特定计算平台的了解变得越来越少了。

### 就是这样了

希望你喜欢这篇简单介绍软件背后运行原理的短文。有什么其它话题是你想让我接下来讨论的吗？在评论里告诉我吧。

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/5/primer-assemblers-compilers-interpreters

作者：[Erik O'Shaughnessy][a]
选题：[lujun9972][b]
译者：[chen-ni](https://github.com/chen-ni)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jnyjny/users/shawnhcorey/users/jnyjny/users/jnyjny
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/programming_keyboard_coding.png?itok=E0Vvam7A (keyboard with connected dots)
[2]: https://opensource.com/sites/default/files/uploads/two_women_operating_eniac.gif (Programmers operate the ENIAC computer)
[3]: https://en.wikipedia.org/wiki/Jean_Bartik (Jean Bartik)
[4]: https://en.wikipedia.org/wiki/Frances_Spence (Frances Spence)
[5]: https://en.wikipedia.org/wiki/ENIAC
[6]: https://en.wikipedia.org/wiki/Nathaniel_Rochester_%28computer_scientist%29
[7]: https://en.wikipedia.org/wiki/ALGO
[8]: https://en.wikipedia.org/wiki/Fortran
[9]: https://en.wikipedia.org/wiki/C_(programming_language)
[10]: https://opensource.com/sites/default/files/uploads/algolfortran_family-by-borkowski.png (Genealogy tree of ALGO and Fortran)
[11]: https://opensource.com/sites/default/files/uploads/639px-ibm_px_xt_color.jpg (IBM PC XT)
[12]: www.perl.org
[13]: https://en.wikipedia.org/wiki/List_of_JVM_languages
[14]: /resources/python
[15]: https://opensource.com/article/18/4/introduction-python-bytecode
[16]: https://pybit.es/python-interpreters.html

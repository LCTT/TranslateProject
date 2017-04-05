借助开源书籍掌握 C++ 编程
==============

书籍是非常主观和私人的财产，编程书籍也不例外。但是不管 C++ 编程书籍的风格、关注点或者节奏如何，好书总可以带领读者走过一段引人入胜的旅程，揭示编程语言的能力，还能向读者描绘如何使用编程语言来实现各种事物。

分享是一种美德，我精心挑选了九本值得一读的优质 C++ 书籍，这些书籍均基于开源协议发布。在这之前，我会给出一份 C++ 的简短介绍。

C++ 是由 Bjarne Stroustrup 设计，初次发布于 1983 年。它是一种静态类型、格式自由、多重范式、可移植、编译式的通用编程语言。它被认为是中级语言，同时包含有高级与初级编程语言的特性。C++ 设计用于实现系统级与应用的编程，它拓展了 C 编程语言，因此其名字中的使用了自增运算符 ++。

C++ 仍是一种流行的编程语言。例如，它被广泛应用于嵌入式系统、银行以及通讯业。它作为 C 的超集保留了 C 标志性的简洁与高效，同时提供强类型检查、多重继承、数据抽象、异常处理操作符重载、泛型编程，以及面向对象编程等功能。C++ 不仅影响了 C 语言的发展，同时也影响到了包括 C#、Java 在内的许多其他编程语言。

### 《Boost C++ 类库（The Boost C++ Libraries）》

![The Boost C++ Libraries](https://i1.wp.com/www.ossblog.org/wp-content/uploads/2017/02/BoostC.jpeg?resize=200%2C245&ssl=1) 

作者 Boris Schäling (570页)

《[Boost C++ 类库（The Boost C++ Libraries）][3]》被认为在 C++ 世界中极其重要并有深远影响。书中这些可移植的库提供对多种任务和结构体的支持，包括多线程、容器、字符串和文本处理、迭代器、线性代数、伪随机数产生、元程序设计模板、并发程序设计、数据结构、图像处理、正则表达式和单元测试。Boost 可以在几乎所有现代操作系统上工作，包括 Linux 和 Windows 及其衍生，并且支持绝大多数现代编译器。

这本书介绍了 72 个 Boost 库，提供了广泛并且实用的功能。它们能够帮助程序员更轻松的管理内存和处理字符串。这些库提供多种容器以及其它数据结构来拓展标准库。使用这些库可以轻松实现平台无关的网络应用程序。

本书是一颗值得添加到各类收藏中的明珠。430 份源代码例子生动形象地阐释了这些库的功能。

本书前面的章节审视了内存管理、字符串处理、容器、数据结构、算法、通信、文件与流以及时间。后续章节进一步探索了函数式编程、并行编程和泛型编程。以对语言拓展、错误与数字处理、应用程序库、设计模式以及其他库的大部分内容。

本书采用[知识共享署名-非商业性使用-禁止演绎 4.0 国际许可协议](http://creativecommons.org/licenses/by-nc-nd/4.0/)进行许可。如果你喜欢实体书，可以在亚马逊上购买纸质书，也可选择如 kindle、E-book 和 PD F格式的电子书。

### 《C++ 注释（C++ Annotations）》

![C++ Annotations](
https://i2.wp.com/www.ossblog.org/wp-content/uploads/2017/02/CAnnotations.png?resize=470%2C663&ssl=1)

作者 Frank B. Brokken (1029页)

《[C++ 注释（C++ Annotations）][4]》提供了关于 C++ 编程语言的一份全面的教程。它可以被当做一门 C++ 课程的教材。本书面向已掌握 C 语言或其他类 C 语法知识的使用者。

本书主要章节有：

* 命名空间
* 字符串——C 提供的是最基础的字符串支持
* I/O 流库——提供了一个基于类概念的输入/输出库
* 类——C 提供了两种结构化不同类型数据的方法。C 语言的结构体包含多种类型的数据成员，而 C 语言的共用体（union）同样可以定义不同类型的数据成员。本章介绍的类，也是一种结构体但是它的内容对外部世界来说是默认不可访问的。
* 静态数据和函数
* 内存管理——审视 C++ 中能够操作内存分配的操作符
* 异常——允许 C++ 程序执行受控的非本地返回命令，避免了使用 longjmp（非局部跳转）和 setjmp（激活非局部跳转）函数的缺陷。
* 操作符重载——介绍通用的操作符重载
* 抽象容器
* 继承——派生的另外一个特性。 本章演示基类指针可能被用来指向派生类的对象。
* 多态——继承的一种特殊形态
* 友元机制——介绍 friend 关键词以及它的使用原则
* 成员指针——定义成员指针及其用法，静态成员指针，指针长度
* 嵌套类——当嵌套类与其外围类有概念上的紧密联系时会被使用
* 标准模板库（STL）——包含容器、通用算法、迭代器、函数对象、分配器、适配器和数据结构的通用库。这些算法使用的数据结构都是抽象意义的，因此算法实际上可以使用任何数据类型。
* 泛型算法——涵盖标准模板库中的泛型算法
* 函数模板——探索模板独特的句法。介绍模板类型参数与模板非类型参数和函数模板等概念并且提供模板的多个案例。
* 类模板——讨论构建与使用类模板
* 进阶模板用法——一份简短的模板元编程主要特性与模板的微妙关系的介绍

本书有HTML、PDF、PostScript 和 txt 版本。它可以自由分发，基于 GNU GPL 协议发布。


### 《通过 C++ 和 Qt4 了解设计模式（An Introduction to Design Patterns in C++ with Qt 4）》

![Introduction to Design Patterns in C++ with Qt 4, An](https://i1.wp.com/www.ossblog.org/wp-content/uploads/2017/02/DesignPatternsQt4.jpeg?resize=200%2C264&ssl=1) 

作者 Alan Ezust, Paul Ezust (656页)

《[通过 C++ 和 Qt4 了解设计模式（An Introduction to Design Patterns in C++ with Qt 4）][5]》从介绍 C++ 基础知识、面向对象概念、UML（统一建模语言）和核心 Qt 类开始。进而转向更高级的编程概念如 Qt modules 和设计模式。最后严密地印证了重要的 C++ 特性。其中涵盖了非常优秀的对函数、继承和多态的讲解。

本书不需要具备任何 C 或者 C++ 编程经验前提，并且被设计为普适用途。它也为教学工作者准备了 Qt 案例、练习、答案以及课程 PPT。

本书是 Bruce Perens 开源系列中的一部分。所有在此系列中的书籍都是基于 Open Publication License V1.0 及其后版本发布的。

### 《像计算机科学家一样思考：C++（How to Think Like a Computer Scientist: C++）》

![How to Think Like a Computer Scientist: C++](https://i1.wp.com/www.ossblog.org/wp-content/uploads/2017/02/ComputerScientistC.jpg?resize=200%2C250&ssl=1) 

作者 Allen B. Downey (191页)

《[像计算机科学家一样思考：C++（How to Think Like a Computer Scientist: C++）][6]》是使用 C++ 编程语言进行软件设计的一本简洁友好的介绍性书籍。本书的目的是通过讲解最基础的概念并且以读者容易接受的节奏逐步增加新内容来把没有编程经验的读者培养成为未来的开发者。

本书提供的有价值的内容包括：

* 变量、表达式和语句
* 函数
* 条件语句与递归
* 丰富的函数
* 迭代
* 字符串
* 向量
* 成员函数
* 对象的向量
* 向量的对象
* 类与不变量
* 文件输入输出和 apmatrixes

本书是一本在[知识共享署名-非商业性使用-3.0 未本地化版本](https://creativecommons.org/licenses/by-nc/3.0/)协议下发布的免费书籍。

### 《C++ Qt3 图形界面编程（C++ GUI Programming with Qt 3）》

![C++ GUI Programming with Qt 3](https://i0.wp.com/www.ossblog.org/wp-content/uploads/2017/02/CQt3.jpeg?resize=200%2C262&ssl=1) 

作者 Jasmin Blanchette, Mark Summerfield (464 页)

最新发布的 Qt 稳定版本是 5.8，而《[C++ Qt3 图形界面编程（C++ GUI Programming with Qt 3）][7]》指导读者如何使用 Qt3 编写 GUI 程序，Qt3 最近一次更新是 2004 年，但是本书仍然有大部分内容对 Qt4 和 Qt5 有效。

本书不是一本面向初学者的书，需要读者对 C++ 有基本的理解。

本书向读者介绍了使用 Qt 进行 GUI 应用编程所有的概念和需要的练习。本书不仅详尽的讲述了核心内容，而且也提供了一些特别的和高阶的学习材料。

本书是 Bruce Perens 开源系列中的一部分。所有在此系列中的书籍都是基于 Open Publication License V1.0及之后版本发布的。


### 《开放数据结构（C++ 版）（Open Data Structures (in C++)）》

 ![Open Data Structures (in C++)](https://i2.wp.com/www.ossblog.org/wp-content/uploads/2017/02/OpenDataStructures.jpg?resize=200%2C300&ssl=1) 
 
 作者 Pat Morin (336页)

《[开放数据结构（C++ 版）（Open Data Structures (in C++)）][1]》教导读者设计和分析基础数据结构以及如何使用 C++ 实现。 它涵盖了对如下数据结构的分析和实现：序列（列表）、队列、优先队列、无序字典、有序字典以及图。作者的意图在于向大学计算机科学的学生提供一条学习数据结构的免费的途径，但是并不打算成为介绍 C++ 编程语言或者 C++ 标准模板库的一本书。不过它可以帮助程序员理解标准模板库的数据结构是如何实现的以及这种实现为何如此高效。

章节内容覆盖了基于数组的列表、链表、分级链表、哈希表、二叉树（又包含了随机二叉搜索树、替罪羊树、红黑树）。之后的章节还包括堆、排序算法（比较、计数和基数排序）、图、整数的数据结构和外部存储器搜索。

本书基于[知识共享署名](http://creativecommons.org/licenses/by/4.0/) 协议发布。免费的 HTML、PDF 均已发布，本书的 LaTeX 版本，Java/C++/Python 源代码都可以从 GitHub 下载。也有纸质书版本可供购买。本书已被翻译为斯罗维尼亚语和土耳其语。


### 《使用 wxWidgets 进行跨平台 GUI 编程（Cross-Platform GUI Programming with wxWidgets）》

![Cross-Platform GUI Programming with wxWidgets](https://i1.wp.com/www.ossblog.org/wp-content/uploads/2017/02/wxWidgets.jpeg?resize=200%2C264&ssl=1) 

作者 Julian Smart，Kevin Hock和Stefan CsomorBrifll (744 页)

wxWidgets 是一个流行的 C++ 库，可供开发者使用单一的代码基础为 Windosw、Mac OS、Linux 和其他平台创建应用。它支持非常广泛的图形处理库。

这本书《[使用 wxWidgets 进行跨平台 GUI 编程（Cross-Platform GUI Programming with wxWidgets）][8]》从简单的介绍和起步章节开始，主要内容包括：

* 事件处理
* 窗口基础
* 画图
* 输入事件处理
* 使用 sizers 进行窗口布局
* 使用标准对话框
* 创建自定义对话框
* 图像编程
* 剪贴板与拖放动作
* 高阶窗口类
* 文件和数据流
* 内存管理，调试和错误检查
* 编写国际化应用
* 编写多线程应用
* wxSocket 编程
* 处理文档和视图
* 日臻完美你的应用

本书是 Bruce Perens 开源系列中的一部分。所有在此系列中的书籍都是基于 Open Publication License V1.0及其后版本发布的。


### 《Rook 的 C++ 指南（The Rook’s Guide to C++）》

![The Rook's Guide to C++](https://i0.wp.com/www.ossblog.org/wp-content/uploads/2017/02/RooksGuide.jpg?resize=200%2C300&ssl=1) 

作者 Jeremy Hansen (160页)

《[Rook 的 C++ 指南（The Rook’s Guide to C++）][2]》的章节中包含变量、常量、输入输出、数据类型和转换、条件判断语句（if、else 和 else if、switch 语句）、字符串、循环、数组、块、函数和作用域。之后的章节主要集中解决问题和定位问题，包括预处理器、高等代数、文件输入输出、指针、动态数据、类和抽象、分离编译和标准模板库。

本书大部分都是由 25 位 Norwich 大学的学生于一个黑客马拉松周末写成。当然不敢说毫无缺点，但还是一本相当不错的书。它被基于[知识共享署名-非商业性使用-相同方式共享 3.0 未本地化版本](https://creativecommons.org/licenses/by-nc-sa/3.0/deed.zh)协议发布。同时在亚马逊也有本书的纸质版可供购买。


### 《GCC 简介（An Introduction to GCC）》

![An Introduction to GCC](https://i1.wp.com/www.ossblog.org/wp-content/uploads/2017/01/IntroductionGCC.png?resize=200%2C300&ssl=1) 

作者 Brian Gough (144页)

《[GCC 简介（An Introduction to GCC）][9]》介绍了 GCC，同时介绍了 GNU C 和 C++ 编译器：gcc 和 g++，均属于 GNU 编译器集合（GCC）。

本书解释了如何单独使用编译器。作者通过数年对邮件列表中发表的问题的观察，撰写本书带领读者直接接触 GCC 最重要的部分。

章节简介：

* 介绍
* 编译一个 C 程序——描述了如何使用 gcc 编译 C 程序。程序可能是由单独文件或者多个文件编译而成，也可能使用系统库和头文件。
* 编译选项——描述gcc中可以使用的编译器中常用的选项。这些选项可以修改本地库和包含文件的搜索路径，配置额外的 warning 和调试信息，预处理器宏指令和 C 方言。
* 使用预处理——描述了属于 GCC 包内的 GNU C 预处理 cpp 程序的用途。预处理将宏定义在源代码被编译前展开。预处理会在 GCC 编译 C 或者 C++ 程序时自动被调用。
* 以调试为目的编译——提供 -g 选项使目标文件和可执行文件中存储额外的调试信息。当出现错误时，这些调试信息允许从特定的机器指令回溯到源代码中相应的行。
* 优化编译——GCC 是一个优化编译器。它提供了大量的选项来使其生成的可执行文件的速度得到提升，并尽量减小可执行文件的大小。
* 编译一个 C++ 程序——描述了如何使用 GCC 来编译以 C++ 编写的程序，以及针对这门语言特定的命令行选项。
* 平台相关的选项——描述了一些通用平台上可用的选项，如 Intel 和 AMD x86 选项、x86 拓展选项、x86 64 位处理器选项、DEC Alpha 选项、SPARC 选项、POWER/powerPC 选项、复合架构支持以及浮点相关问题。
* 问题定位——GCC 提供了几项帮助和诊断选项来帮助用户在编译过程中定位问题。
* 编译器相关工具——介绍了大量能够用于和 GCC 组合使用的工具。包括：用来创建库的 GNU 压缩器 ar，以及 GNU 性能和覆盖测试工具：gprof 和 gcov。
* 编译器如何工作——描述了关于 GCC 如何将源代码转换为可执行程序的更多细节。编译是一个涉及到多种工具的多级过程，包括 GNU 编译器自身（通过 gcc 或者 g++ 前端）、GNU 汇编器 as 以及 GNU 链接器 ld。编译过程中一个完整的工具集合被称之为工具链。
* 检查编译后的文件——描述了多种有用的工具来检查可执行文件和目标文件的内容。
* 常见错误消息——描述了 gcc 和 g++ 产生的最常见的错误和警告信息。每一个案例都伴随着错误和警告产生的原因，相应的例子和可能解决问题的建议。
* 获得帮助——如果读者碰到了本书中未能涵盖的问题，还有多种参考手册更详细的描述了 GCC 和编程语言相关的主题。

本书是基于 GNU Free Documentation 协议出版的。

此外还有一些 C++ 书籍可以免费下载，但是那些并不是基于开源协议发布的，或者作者没有指定一个协议。这类书籍包括：

- [Thinking in C++，第二版，卷一、卷二][14] – 作者 Bruce Eckel (卷二作者增加了 Chuck Allison)
- [C++ In Action:Industrial Strength Programming][15]– 作者 Bartosz Milewski

最后，我对刚入门的 C++ 新手的建议一定是 [编程原理与体验（C++ 版）（Programming — Principles and Practice Using C++） (第二版)][16]。普遍认为这是最合适的入门书籍，由 C++ 的创始人书写，物超所值。

--------------------------------------------------------------------------------

via: https://www.ossblog.org/master-c-programming-with-open-source-books/

作者：[Steve Emms][a]
译者：[xiaow6](https://github.com/xiaow6)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ossblog.org/author/steve/
[1]:http://opendatastructures.org/ods-cpp/
[2]:https://rooksguide.org/
[3]:https://theboostcpplibraries.com/
[4]:http://www.icce.rug.nl/documents/cplusplus/
[5]:http://www.informit.com/store/introduction-to-design-patterns-in-c-plus-plus-with-9780131879058
[6]:http://greenteapress.com/thinkcpp/index.html
[7]:http://www.informit.com/store/c-plus-plus-gui-programming-with-qt-3-9780131240728
[8]:http://www.informit.com/store/cross-platform-gui-programming-with-wxwidgets-9780131473812
[9]:http://www.network-theory.co.uk/docs/gccintro/
[10]:https://www.ossblog.org/author/steve/
[11]:https://www.ossblog.org/master-c-programming-with-open-source-books/#comments
[12]:https://www.ossblog.org/category/books/
[13]:https://www.ossblog.org/category/programming/
[14]:http://mindview.net/Books/TICPP/ThinkingInCPP2e.html
[15]:http://www.relisoft.com/book/
[16]:http://stroustrup.com/Programming/
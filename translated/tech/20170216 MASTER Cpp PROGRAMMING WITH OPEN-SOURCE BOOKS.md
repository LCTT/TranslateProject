# C++专家编程与开源书籍

书籍是非常主观和私人的财产，编程书籍也不例外。但是不管C++编程书籍的风格、关注点或者节奏如何，好书总可以带领读者走过一段引人入胜的旅程，对编程语言的能力大开眼界，还能向读者描绘如何使用编程语言来实现任何事。

我精心挑选了九本引人入胜的优质C++书籍，均基于开源协议发布。在这之前，我会给出一份C++的简短介绍。

C++是由Bjarne Stroustrup设计，于1983年初次发布的。它是静态类型、自由形态、多重范式、可移植、已编译、通用的编程语言。它被认为是中级语言，同时包含有高级与初级编程语言的特性。C++被设计实现系统与应用编程，拓展了C编程语言。因此C++的名字中使用了自增运算符++。

C++仍然保持为一种流行的编程语言。例如，它被广泛应用于嵌入式系统，银行系统以及通讯行业。它作为C的超集保留了C标志性的简洁与高效，同时提供更健壮的类型检查，多重继承，数据抽象，异常处理操作符重载，泛型编程，以及面向对象编程等功能。C++不仅影响了C语言的发展也包括许多其他编程语言包括C#、Java。



 ![The Boost C++ Libraries](https://i1.wp.com/www.ossblog.org/wp-content/uploads/2017/02/BoostC.jpeg?resize=200%2C245&ssl=1) 

### [The Boost C++ Libraries][3]

作者 Boris Schäling (570页)

《The Boost C++ libraries》被认为在C++世界中极其重要并有深远影响。书中这些可移植的库提供对多种任务和结构体的支持，包括多线程、容器、字符串和文本处理、迭代器、线性代数、伪随机数产生、元程序设计模板、并发程序设计、数据结构、图像处理、正则表达式和单元测试。Boost可以在几乎所有现代操作系统上工作，包括Linux和Windows及其衍生，并且支持绝大多数现代编译器。

这本书介绍了72个Boost库，提供了广泛并且实用的功能。它们能够帮助程序员更轻松的管理内存和处理字符串。这些库提供多种容器以及其它数据结构来拓展标准库。使用这些库可以轻松实现平台无关的网络应用程序。

本书是一颗值得添加到各类收藏中的明珠。430份源代码例子生动形象地阐释了这些库的功能。

本书前面的章节审视了内存管理，字符串处理，容器，数据结构，算法，通信，文件与流以及时间。后续章节进一步探索了函数式、并行和泛型编程。以对语言拓展，错误与数字处理，应用程序库，设计模式以及其他库的大部分内容。

本书采用知识共享组织署名-非营利性-禁止演绎4.0国际许可协议。如果你喜欢实体书，可以在亚马逊上购买纸质书，也可选择如kindle，E-book，PDF格式的电子书。

  ![C++ Annotations](https://i2.wp.com/www.ossblog.org/wp-content/uploads/2017/02/CAnnotations.png?resize=470%2C663&ssl=1) 

### [C++ Annotations][4]

作者 Frank B. Brokken (1029页)

《C++ Annotations》提供了关于C++编程语言涉及全面的一份教程。它可以被当做一门C++课程的教材。本书面向已掌握C语言或其他类C语法知识的使用者。

本书主要章节有：

* 命名空间
* 字符串——C提供的是最基础的字符串支持
* I/O流库——提供了一个基于类概念的输入/输出库
* 类——C提供了两种结构化不同类型数据的方法。C语言的结构体包含多种类型的数据成员，而C语言的共用体同样可以定义不同类型的数据成员。本章介绍的类，也是一种结构体但是它的内容对外部世界来说是默认不可访问的。
* 静态数据和函数
* 内存管理——审视C++中能够操作内存分配的操作符
* 异常——允许C++程序执行受控的非本地返回命令，避免了使用longjmp（非局部跳转）和setjmp（激活非局部跳转）函数的缺陷。
* 操作符重载——介绍通用的操作符重载
* 抽象容器
* 继承——派生的另外一个特性。 本章演示基类指针可能被用来指向派生类的对象。
* 多态——继承的一种特殊形态
* 友元机制——介绍friend关键词以及它的使用原则
* 成员指针——定义成员指针及其用法，静态成员指针，指针长度
* 嵌套类——当嵌套类与其外围类有概念上的紧密联系时会被使用
* 标准模板库（STL）——包含容器、通用算法、迭代器、函数对象、分配器、适配器和数据结构的通用库。这些算法使用的数据结构都是抽象意义的，因此算法实际上可以使用任何数据类型。
* 泛型算法——涵盖标准模板库中的泛型算法
* 函数模板——探索模板独特的句法。介绍模板类型参数与模板非类型参数和函数模板等概念并且提供模板的多个案例。
* 类模板——讨论构建与使用类模板
* 进阶模板用法——一份简短的模板元编程主要特性与模板的微妙关系的介绍

本书有HTML，PDF，PostScript和txt版本。它是基于GNU General Public协议发布的免费书籍。

 ![Introduction to Design Patterns in C++ with Qt 4, An](https://i1.wp.com/www.ossblog.org/wp-content/uploads/2017/02/DesignPatternsQt4.jpeg?resize=200%2C264&ssl=1) 


### [An Introduction to Design Patterns in C++ with Qt 4][5]

作者Alan Ezust, Paul Ezust (656页)

本书从介绍C++基础知识，面向对象概念，UML（统一建模语言）和核心Qt类开始。进而转向更高级的编程概念如Qt modules和设计模式。最后严苛的印证了重要的C++特性。其中涵盖了非常优秀的对函数、继承和多态的讲解。

本书不需要具备任何C或者C++编程经验前提，并且被设计为普适用途。它也为教学工作者准备了Qt案例，练习，答案以及课程PPT.

本书是Bruce Perens开源系列中的一部分。所有在此系列中的书籍都是基于Open Publication License V1.0及更新版本发布的。

 ![How to Think Like a Computer Scientist: C++](https://i1.wp.com/www.ossblog.org/wp-content/uploads/2017/02/ComputerScientistC.jpg?resize=200%2C250&ssl=1) 


### [How to Think Like a Computer Scientist: C++][6]

作者 Allen B. Downey (191页)

本书是使用C++编程语言进行软件设计的一本简洁并友好的介绍书籍。本书的目的是通过讲解最最基础的概念并且以读者轻易接受的节奏逐步增加新内容来培养没有编程经验的读者成为未来的开发者。

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
* 文件输入输出和apmatrixes

本书是一本基于Creative Commons Attribution-NonCommercial 3.0 Unported协议下的免费书籍。

 ![C++ GUI Programming with Qt 3](https://i0.wp.com/www.ossblog.org/wp-content/uploads/2017/02/CQt3.jpeg?resize=200%2C262&ssl=1) 

### [C++ GUI Programming with Qt 3][7]

作者 Jasmin Blanchette, Mark Summerfield (464 页)

最新发布的稳定Qt版本是5.8. 本书指导读者如何使用Qt3编写GUI程序，虽然Qt3最近一次更新是2004年，但是本书仍然有大部分内容对Qt4和Qt5有效。

本书不是一本面向初学者的书，需要读者对C++有基本的理解。

本书向读者介绍了使用Qt进行GUI应用编程所有的概念和需要的练习。本书不仅详尽的对待核心内容，而且也提供了特别并高阶的学习材料。

本书是Bruce Perens开源系列中的一部分。所有在此系列中的书籍都是基于Open Publication License V1.0及更新版本发布的。

 ![Open Data Structures (in C++)](https://i2.wp.com/www.ossblog.org/wp-content/uploads/2017/02/OpenDataStructures.jpg?resize=200%2C300&ssl=1) 


### [Open Data Structures (in C++)][1]

作者 Pat Morin (336页)

本书教导读者设计和分析基础数据结构以及如何使用C++实现。 它涵盖了对如下数据结构的分析和实现：序列（列表），队列，优先队列，无序辞典，有序词典以及图。作者的动力在于向大学计算机科学的学生提供一条免费的途径来学习数据结构。但是并不打算成为介绍C++编程语言或者C++标准模板库的一本书。不过它可以帮助程序员理解标准模板库的数据结构是如何实现的以及这种实现为何如此高效。

章节内容覆盖了基于数组的列表，链表，分级链表，哈希表，二叉树（又包含了随机二叉搜索树，替罪羊树，红黑树）。之后的章节还包括堆，排序算法（比较、计数和基数排序），图，整数的数据结构和外部存储器搜索。

本书基于Creative Commons Attribution协议发布。免费的HTML,PDF均已发布，本书的LaTeX版本，Java/C++/Python源代码都可以从GitHub下载。也有纸质书版本可供购买。本书已被翻译为斯罗维尼亚语和土耳其语。

 ![Cross-Platform GUI Programming with wxWidgets](https://i1.wp.com/www.ossblog.org/wp-content/uploads/2017/02/wxWidgets.jpeg?resize=200%2C264&ssl=1) 

### [Cross-Platform GUI Programming with wxWidgets][8]

作者 Julian Smart，Kevin Hock和Stefan CsomorBrifll (744 页)

wxWidgets是一个流行的C++库供开发者使用单一的代码基础为Windosw，Mac OS ，Linux和其他平台创建应用。它可以支持非常广泛的图形处理库。

本书从简单的介绍和准备开始章节开始，主要内容包括：

* 事件处理
* 窗口基础
* 画图
* 输入事件处理
* 使用sizers进行窗口布局
* 使用标准对话框
* 创建自定义对话框
* 图像编程
* 剪贴板与拖放动作
* 高阶窗口类
* 文件和数据流
* 内存管理，调试和错误检查
* 编写国际通用应用
* 编写多线程应用
* wxSocket编程
* 处理文档和浏览
* 日臻完美你的应用

本书是Bruce Perens开源系列中的一部分。所有在此系列中的书籍都是基于Open Publication License V1.0及更新版本发布的。

 ![The Rook's Guide to C++](https://i0.wp.com/www.ossblog.org/wp-content/uploads/2017/02/RooksGuide.jpg?resize=200%2C300&ssl=1) 


### [The Rook’s Guide to C++][2]

作者 Jeremy Hansen (160页)

章节中包含变量，常量，输入输出，数据类型和转换，条件判断语句（if，else和else if, switch语句），字符串，循环，数组，块，函数和作用域。之后的章节主要集中解决问题和定位问题，包括预处理器、高等代数、文件输入输出、指针、动态数据、类和抽象、分离编译和标准模板库。

本书大部分都是由25位Norwich大学的学生于一个黑客马拉松周末写成。当然不敢说毫无缺点，但还是一本相当不错的书。它被基于Creative Commons Attribution-NonCommercial-ShareAlike 3.0 Unported协议发布。同时在亚马逊也有本书的纸质版可供购买。

 ![An Introduction to GCC](https://i1.wp.com/www.ossblog.org/wp-content/uploads/2017/01/IntroductionGCC.png?resize=200%2C300&ssl=1) 


### [An Introduction to GCC][9]

作者 Brian Gough (144页)

本书介绍了GCC，同时介绍了GNU C和C++编译器：gcc和g++，均属于GNU编译器集合（GCC）。

本书解释了如何单独使用编译器。作者通过数年对邮件列表中发表的问题的观察，撰写本书带领读者直接接触GCC最重要的选项。

章节简介：

* 介绍
* 编译一个C程序——描述了如何使用gcc编译C程序。程序可能是由单独文件或者多个文件编译而成，也可能使用系统库和头文件。
* 编译选项——描述gcc中可以使用的编译器中常用的选项。这些选项可以修改本地库和包含文件的搜索路径，配置额外的warning和调试信息，使能预处理器宏指令和C特有语言。
* 使用预处理——描述了属于GCC包内的GNU C预处理C++程序的用途。 预处理将宏定义在源代码被编译前展开。预处理会在GCC编译C或者C++程序时自动被调用。
* 以调试为目的编译——提供-g选项使目标文件和可执行文件中存储额外的调试信息。当出现错误时，这些调试信息允许从特定的机器指令回溯到源代码中相应的行。
* 优化编译——GCC是一个不断优化的编译器。它提供了大量的选项来使其生成的可执行文件的速度得到提升，并尽量减小可执行文件的大小。
* 编译一个C++程序——描述了如何使用GCC来编译使用C++编写的程序，以及针对这门语言特定的命令行选项。
* 平台相关的选项——描述了一些通用平台上可用的选项，如Intel和AMD x86选项，x86拓展选项，x86 64位处理器选项，DEC Alpha选项，SPARC选项，POWER/powerPC选项，复合架构支持以及浮点相关问题。
* 问题定位——GCC提供了几项帮助和诊断选项来帮助用户在编译过程中定位问题。
* 编译器相关工具——介绍了大量能够和GCC组合使用的有效工具。包括： 用来创建库的GNU压缩器ar,以及GNU性能和覆盖测试工具：gprof和gcov。
* 编译器如何工作——描述了关于GCC如何将源代码转换为可执行程序的更多细节。编译是一个涉及到多种工具的多级过程，包括GNU编译器自身（通过gcc或者g++前端），GNU汇编器as以及GNU链接器ld。编译过程中一个完整的工具集合被称为是工具链。
* 检查编译后的文件——描述了多种有用的工具来检查可执行文件和目标文件的内容。
* 常见错误消息——描述了gcc和g++产生的最常见的错误和警告信息。每一个案例都伴随着错误和警告产生的原因，相应的例子和可能解决问题的建议。
* 获得帮助——如果读者碰到了本书中未能涵盖的问题，还有多种参考手册更详细的描述了GCC和编程语言相关的主题。

本书是基于GNU Free Documentation协议出版的。

此外还有一些C++书籍可以免费下载，但是那些并不是基于开源协议发布的，或者作者没有指定一个协议。这类书籍包括：

[Thinking in C++, 第二版, 卷一，卷二][14] – 作者Bruce Eckel (卷二增加了Chuck Allison)

[C++ In Action:Industrial Strength Programming ][15]– 作者Bartosz Milewski

最后，我对刚入门的C++新手的建议一定是 [Programming — Principles and Practice Using C++ (第二版)][16]。普遍认为这是最合适的入门书籍，由C++的创始人书写，物超所值。

--------------------------------------------------------------------------------

via: https://www.ossblog.org/master-c-programming-with-open-source-books/

作者：[Steve Emms][a]
译者：[xiaow6](https://github.com/xiaow6)
校对：[校对者ID](https://github.com/校对者ID)

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
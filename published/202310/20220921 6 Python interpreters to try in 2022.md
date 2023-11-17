[#]: subject: "6 Python interpreters to try in 2022"
[#]: via: "https://opensource.com/article/22/9/python-interpreters-2022"
[#]: author: "Stephan Avenwedde https://opensource.com/users/hansic99"
[#]: collector: "lkxed"
[#]: translator: "ChatGPT"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-16294-1.html"

六大 Python 解释器
======

![][0]

> 观察你的代码在其他解释器下运行的表现或许是一项有趣的尝试。

作为最受欢迎的编程语言之一，Python 需要一个解释器来执行其代码所定义的命令。与其他可直接编译成机器代码的语言不同，Python 代码需要解释器读取它并把它转译给进行相关操作的 CPU。那么，哪些解释器有哪些呢？本文将对其中几种进行介绍。 

### 解释器简介

提到 Python 解释器，我们通常会想到 `/usr/bin/python` 这个二进制文件。它使你能够执行 `.py` 文件。然而，解释操作仅仅是其中一环。在 Python 代码真正被 CPU 执行之前，都需要经过以下四个步骤：

1. 词法分析 - 将人类编写的源代码转换为一序列逻辑实体，被称为 <ruby>词法标记<rt>lexical token</rt></ruby>。
2. 解析 - 解析器会检查词法标记的语法和语义规则生成 <ruby>抽象语法树<rt>abstract syntax tree</rt></ruby>（AST）。
3. 编译 - 编译器会根据 AST 创建 Python 字节码，这些字节码由非常基础的，和平台无关的指令组成。
4. 解释 - 解释器处理字节码并执行特定的操作。

如你所见，在任何实质性的操作发生之前，我们需要走过这些步骤。这也解释了深入研究不同解释器的重要性。

### 1、CPython

作为 Python 的参考实现，[CPython][2] 默认地被许多系统所采用。如其名称所示，CPython 是用 C 语言编写的。这也意味着，我们可以 [以 C 语言编写扩展][3]，从而让 Python 打通到广泛使用的 C 语言库代码。CPython 广泛应用于各种平台，包括 ARM 和 RISC。然而，作为 Python 的参考实现，CPython 更注重精细的优化，而非运行速度。

### 2、Pyston

[Pyston][4] 是一个从 CPython 解释器衍生出的分支，其中实现了性能优化。该项目定位自己为标准 CPython 解释器在处理大型、真实世界应用时的替代品，并有可能加速高达 30%。由于缺乏兼容的二进制包，Pyston 在下载过程中需要重新编译。

### 3、PyPy

采用了 RPython 编写的 [PyPy][5] 是一个专为 Python 配备的 [即时（JIT）][6] 编译器，RPython 是 Python 的一个静态类型的子集。不同于 CPython 解释器，PyPy 对源代码进行编译，生成 CPU 可直接执行的机器码。PyPy 是 Python 开发者的实验室，在这里他们能更容易地测试新特性。

相较于 CPython，PyPy 的执行速度更快。由于 JIT 编译器的特性，长时间运行的应用更能从缓存中受益。PyPy 可以被视为 CPython 的有效替代。虽然其中存在一些缺点，大部分的 C 扩展模块在 PyPy 中也得到支持，但运行速度会相对慢一些。PyPy 扩展模块使用 Python（而不是 C）编写，这使 JIT 编译器能够对其进行优化。只要你的应用程序不依赖于不兼容的模块，PyPy 就是替换 CPython 的理想选择。你可以在项目官网找到一个专门的页面，详细描述 PyPy 与 CPython 的不同之处：[PyPy 与 CPython 的差异][7]

### 4、RustPython

顾名思义，[RustPython][8] 是一个由 Rust 编写的 Python 解释器。尽管 Rust 如今还是一个相对年轻的编程语言，但因其优良特性已逐步受到开发者的推崇，甚至被视为 C 和 C++ 的可能接班人。默认情况下，RustPython 的行为与 CPython 的解释器类似，但它也可以选择启用 JIT 编译器。值得一提的是，Rust 工具链能直接编译为 [WebAssembly][9] ，进而允许在浏览器中全面运行解释器。你可以在 [这里][10] 看到它的在线演示。

### 5、Stackless Python

[Stackless Python][11] 自称是 Python 编程语言的增强版本。该项目基本上是 CPython 解释器衍生的一个项目，其为该语言添加了微线程、通道和调度器。微线程可以帮助你将代码组织成可以并行运行的 “<ruby>小任务<rt>tasklet</rt></ruby>”。这与采用 [greenlet][12] 模块的绿色线程模型相似。通道可以用作 “小任务” 之间的双向通信。Stackless Python 的一个知名用户是大型多人在线角色扮演游戏 [Eve Online][13]。

### 6、Micro Python

如果你的目标平台是微控制器，那么 [MicroPython][14] 将是你的首选。它是一种极简的实现，只需要 16kB 的内存和 256kB 的存储空间。由于其主要面向的是嵌入式环境，MicroPython 的标准库只包含 CPython 丰富的 STL 的一部分。对于开发和测试，或者作为轻量级替代品，MicroPython 也可以在普通的 x86 和 x64 系统上运行。MicroPython 支持 Linux、Windows，以及多种微控制器。

### 性能

就其设计而言，Python 本质上是一种运行速度不够快的语言。根据任务性质的不同，各种解释器间存在明显的性能差异。要想弄清楚哪种解释器最适合特定任务，可以参考 [pybenchmarks.org][15]。与使用解释器相比，另一种选择是直接将 Python 二进制代码编译成机器码，例如，[Nuitka][16] 就是能够完成这种工作的项目之一，它可以将 Python 代码编译成 C 代码，然后将 C 代码通过常规的 C 编译器编译成机器码。Python 编译器的主题范围广泛，值得一篇独立的文章来详述。

### 总结

Python 是构建快速原型和自动化任务的优秀语言，同时它又易于学习，对初学者友好。如果你平时维持使用 CPython，那么尝试看看你的代码在另一解释器上运行会是什么样子也许会很有趣。如果你是 Fedora 用户，你可以轻松地测试几种其他解释器，因为其包管理器已经提供了需要的二进制文件。你可以在 [fedora.developer.org][17] 上查找更多信息。

*（题图：MJ/9b24f27b-bd2b-4916-9f33-bcfb9e2b1d33）*

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/9/python-interpreters-2022

作者：[Stephan Avenwedde][a]
选题：[lkxed][b]
译者：[ChatGPT](https://linux.cn/lctt/ChatGPT)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/hansic99
[b]: https://github.com/lkxed
[1]: https://opensource.com/sites/default/files/lead-images/python-programming-code-keyboard.png
[2]: https://github.com/python/cpython#general-information
[3]: https://opensource.com/article/21/4/cython
[4]: https://github.com/pyston/pyston
[5]: https://foss.heptapod.net/pypy/pypy
[6]: https://en.wikipedia.org/wiki/Just-in-time_compilation
[7]: https://doc.pypy.org/en/latest/cpython_differences.html
[8]: https://github.com/RustPython/RustPython
[9]: https://opensource.com/article/21/3/webassembly-firefox
[10]: https://rustpython.github.io/demo/
[11]: https://github.com/stackless-dev/stackless
[12]: https://pypi.org/project/greenlet/
[13]: https://www.eveonline.com/
[14]: https://micropython.org
[15]: https://pybenchmarks.org/
[16]: https://github.com/Nuitka/Nuitka
[17]: https://developer.fedoraproject.org/tech/languages/python/multiple-pythons.html
[0]: https://img.linux.net.cn/data/attachment/album/202310/17/232316oa6pjbza2az2b5hv.jpg
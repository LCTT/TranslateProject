Go 编译器介绍
======

`cmd/compile` 包含构成 Go 编译器主要的包。编译器在逻辑上可以被分为四个阶段，我们将简要介绍这几个阶段以及包含相应代码的包的列表。

在谈到编译器时，有时可能会听到<ruby>前端<rt>front-end</rt></ruby>和<ruby>后端<rt>back-end</rt></ruby>这两个术语。粗略地说，这些对应于我们将在此列出的前两个和后两个阶段。第三个术语<ruby>中间端<rt>middle-end</rt></ruby>通常指的是第二阶段执行的大部分工作。

请注意，`go/parser` 和 `go/types` 等 `go/*` 系列的包与编译器无关。由于编译器最初是用 C 编写的，所以这些 `go/*` 包被开发出来以便于能够写出和 `Go` 代码一起工作的工具，例如 `gofmt` 和 `vet`。

需要澄清的是，名称 “gc” 代表 “<ruby>Go 编译器<rt>Go compiler</rt></ruby>”，与大写 GC 无关，后者代表<ruby>垃圾收集<rt>garbage collection</rt></ruby>。

### 1、解析

* `cmd/compile/internal/syntax`（<ruby>词法分析器<rt>lexer</rt></ruby>、<ruby>解析器<rt>parser</rt></ruby>、<ruby>语法树<rt>syntax tree</rt></ruby>）

在编译的第一阶段，源代码被标记化（词法分析）、解析（语法分析），并为每个源文件构造语法树（LCTT 译注：这里标记指 token，它是一组预定义的、能够识别的字符串，通常由名字和值构成，其中名字一般是词法的类别，如标识符、关键字、分隔符、操作符、文字和注释等；语法树，以及下文提到的<ruby>抽象语法树<rt>Abstract Syntax Tree</rt></ruby>（AST），是指用树来表达程序设计语言的语法结构，通常叶子节点是操作数，其它节点是操作码）。

每个语法树都是相应源文件的确切表示，其中节点对应于源文件的各种元素，例如表达式、声明和语句。语法树还包括位置信息，用于错误报告和创建调试信息。

### 2、类型检查和 AST 变换

* `cmd/compile/internal/gc`（创建编译器 AST，<ruby>类型检查<rt>type-checking</rt></ruby>，<ruby>AST 变换<rt>AST transformation</rt></ruby>）

gc 包中包含一个继承自（早期）C 语言实现的版本的 AST 定义。所有代码都是基于它编写的，所以 gc 包必须做的第一件事就是将 syntax 包（定义）的语法树转换为编译器的 AST 表示法。这个额外步骤可能会在将来重构。

然后对 AST 进行类型检查。第一步是名字解析和类型推断，它们确定哪个对象属于哪个标识符，以及每个表达式具有的类型。类型检查包括特定的额外检查，例如“声明但未使用”以及确定函数是否会终止。

特定变换也基于 AST 完成。一些节点被基于类型信息而细化，例如把字符串加法从算术加法的节点类型中拆分出来。其它一些例子是<ruby>死代码消除<rt>dead code elimination</rt></ruby>，<ruby>函数调用内联<rt>function call inlining</rt></ruby>和<ruby>逃逸分析<rt>escape analysis</rt></ruby>（LCTT 译注：逃逸分析是一种分析指针有效范围的方法）。

### 3、通用 SSA

* `cmd/compile/internal/gc`（转换成 SSA）
* `cmd/compile/internal/ssa`（SSA 相关的<ruby>环节<rt>pass</rt></ruby>和规则）

（LCTT 译注：许多常见高级语言的编译器无法通过一次扫描源代码或 AST 就完成所有编译工作，取而代之的做法是多次扫描，每次完成一部分工作，并将输出结果作为下次扫描的输入，直到最终产生目标代码。这里每次扫描称作一个<ruby>环节<rt>pass</rt></ruby>；最后一个环节之前所有的环节得到的结果都可称作中间表示法，本文中 AST、SSA 等都属于中间表示法。SSA，静态单赋值形式，是中间表示法的一种性质，它要求每个变量只被赋值一次且在使用前被定义）。

在此阶段，AST 将被转换为<ruby>静态单赋值<rt>Static Single Assignment</rt></ruby>（SSA）形式，这是一种具有特定属性的低级<ruby>中间表示法<rt>intermediate representation</rt></ruby>，可以更轻松地实现优化并最终从它生成机器码。

在这个转换过程中，将完成<ruby>内置函数<rt>function intrinsics</rt></ruby>的处理。这些是特殊的函数，编译器被告知逐个分析这些函数并决定是否用深度优化的代码替换它们（LCTT 译注：内置函数指由语言本身定义的函数，通常编译器的处理方式是使用相应实现函数的指令序列代替对函数的调用指令，有点类似内联函数）。

在 AST 转化成 SSA 的过程中，特定节点也被低级化为更简单的组件，以便于剩余的编译阶段可以基于它们工作。例如，内建的拷贝被替换为内存移动，`range` 循环被改写为 `for` 循环。由于历史原因，目前这里面有些在转化到 SSA 之前发生，但长期计划则是把它们都移到这里（转化 SSA）。

然后，一系列机器无关的规则和编译环节会被执行。这些并不考虑特定计算机体系结构，因此对所有 `GOARCH` 变量的值都会运行。

这类通用的编译环节的一些例子包括，死代码消除、移除不必要的空值检查，以及移除无用的分支等。通用改写规则主要考虑表达式，例如将一些表达式替换为常量，优化乘法和浮点操作。

### 4、生成机器码

* `cmd/compile/internal/ssa`（SSA 低级化和架构特定的环节）
* `cmd/internal/obj`（机器码生成）

编译器中机器相关的阶段开始于“低级”的编译环节，该阶段将通用变量改写为它们的特定的机器码形式。例如，在 amd64 架构中操作数可以在内存中操作，这样许多<ruby>加载-存储<rt>load-store</rt></ruby>操作就可以被合并。

注意低级的编译环节运行所有机器特定的重写规则，因此当前它也应用了大量优化。

一旦 SSA 被“低级化”并且更具体地针对目标体系结构，就要运行最终代码优化的编译环节了。这包含了另外一个死代码消除的环节，它将变量移动到更靠近它们使用的地方，移除从来没有被读过的局部变量，以及<ruby>寄存器<rt>register</rt></ruby>分配。

本步骤中完成的其它重要工作包括<ruby>堆栈布局<rt>stack frame layout</rt></ruby>，它将堆栈偏移位置分配给局部变量，以及<ruby>指针活性分析<rt>pointer liveness analysis</rt></ruby>，后者计算每个垃圾收集安全点上的哪些堆栈上的指针仍然是活动的。

在 SSA 生成阶段结束时，Go 函数已被转换为一系列 `obj.Prog` 指令。它们被传递给汇编程序（`cmd/internal/obj`），后者将它们转换为机器码并输出最终的目标文件。目标文件还将包含反射数据，导出数据和调试信息。

### 扩展阅读

要深入了解 SSA 包的工作方式，包括它的环节和规则，请转到 [cmd/compile/internal/ssa/README.md][1]。

--------------------------------------------------------------------------------

via: https://github.com/golang/go/blob/master/src/cmd/compile/README.md

作者：[mvdan][a]
译者：[stephenxs](https://github.com/stephenxs)
校对：[pityonline](https://github.com/pityonline), [wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://github.com/mvdan
[1]: https://github.com/golang/go/blob/master/src/cmd/compile/internal/ssa/README.md

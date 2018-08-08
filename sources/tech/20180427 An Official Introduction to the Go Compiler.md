
// Copyright 2018 The Go Authors. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

## Introduction to the Go compiler

## Go编译器介绍

`cmd/compile` contains the main packages that form the Go compiler. The compiler
may be logically split in four phases, which we will briefly describe alongside
the list of packages that contain their code.

`cmd/compile` 包含构成 Go 编译器主要的包。编译器在逻辑上可以被分为四个阶段，我们将简要介绍这几个阶段以及包含相应代码的包的列表。

You may sometimes hear the terms "front-end" and "back-end" when referring to
the compiler. Roughly speaking, these translate to the first two and last two
phases we are going to list here. A third term, "middle-end", often refers to
much of the work that happens in the second phase.

在谈到编译器时，有时可能会听到“前端”和“后端”这两个术语。粗略地说，这些对应于我们将在此列出的前两个和后两个阶段。第三个术语“中间端”通常指的是第二阶段执行的大部分工作。

Note that the `go/*` family of packages, such as `go/parser` and `go/types`,
have no relation to the compiler. Since the compiler was initially written in C,
the `go/*` packages were developed to enable writing tools working with Go code,
such as `gofmt` and `vet`.

请注意，`go/parser` 和 `go/types` 等 `go/*` 系列包与编译器无关。由于编译器最初是用C编写的，所以这些 `go/*` 包被开发出来以便于能够写出和 `Go` 代码一起工作的工具，例如 `gofmt` 和 `vet`。

It should be clarified that the name "gc" stands for "Go compiler", and has
little to do with uppercase GC, which stands for garbage collection.

需要澄清的是，名称“gc”代表“Go 编译器”，与大写 GC 无关，后者代表垃圾收集。

### 1. Parsing

### 1. 解析

* `cmd/compile/internal/syntax` (lexer, parser, syntax tree)

* `cmd/compile/internal/syntax` （词法分析器、解析器、语法树）

In the first phase of compilation, source code is tokenized (lexical analysis),
parsed (syntactic analyses), and a syntax tree is constructed for each source
file.

在编译的第一阶段，源代码被标记化（词法分析），解析（语法分析），并为每个源文件构造语法树（译注：这里标记指token，它是一组预定义、能够识别的字符串，通常由名字和值构成，其中名字一般是词法的类别，如标识符、关键字、分隔符、操作符、文字和注释等）。

Each syntax tree is an exact representation of the respective source file, with
nodes corresponding to the various elements of the source such as expressions,
declarations, and statements. The syntax tree also includes position information
which is used for error reporting and the creation of debugging information.

每棵语法树都是相应源文件的确切表示，其中节点对应于源文件的各种元素，例如表达式，声明和语句。语法树还包括位置信息，用于错误报告和创建调试信息。

### 2. Type-checking and AST transformations

### 2. 类型检查和AST变形

* `cmd/compile/internal/gc` (create compiler AST, type checking, AST transformations)

* `cmd/compile/internal/gc` （创建编译器AST，类型检查，AST变形）

The gc package includes an AST definition carried over from when it was written
in C. All of its code is written in terms of it, so the first thing that the gc
package must do is convert the syntax package's syntax tree to the compiler's
AST representation. This extra step may be refactored away in the future.

gc 包中包含一个继承自（早期）C 语言实现的版本的 AST 定义。所有代码都是根据该 AST 编写的，所以 gc 包必须做的第一件事就是将 syntax 包（定义）的语法树转换为编译器的 AST 表示法。这个额外步骤可能会在将来重构（译注：AST，Abstract Syntax Tree，抽象语法树，用树来表达程序设计语言的语法结构，通常叶子节点是操作数，其它节点是操作码）。

The AST is then type-checked. The first steps are name resolution and type
inference, which determine which object belongs to which identifier, and what
type each expression has. Type-checking includes certain extra checks, such as
"declared and not used" as well as determining whether or not a function
terminates.

然后对 AST 进行类型检查。第一步是名字解析和类型推断，它们确定哪个对象属于哪个标识符，以及每个表达式具有的类型。类型检查包括特定的额外检查，例如“声明但未使用”以及确定函数是否会终止。

Certain transformations are also done on the AST. Some nodes are refined based
on type information, such as string additions being split from the arithmetic
addition node type. Some other examples are dead code elimination, function call
inlining, and escape analysis.

特定转换也基于 AST 上完成。一些节点被基于类型信息而细化，例如把字符串加法从算术加法的节点类型中拆分出来。其他一些例子是死代码消除，函数调用内联和逃逸分析（译注：逃逸分析是一种分析指针有效范围的方法）。

### 3. Generic SSA

### 3. 通用SSA

* `cmd/compile/internal/gc` (converting to SSA)

* `cmd/compile/internal/gc` （转换成 SSA）

* `cmd/compile/internal/ssa` (SSA passes and rules)

* `cmd/compile/internal/ssa` （SSA 相关的遍和规则）

（译注：许多常见高级语言的编译器无法通过一次扫描源代码或 AST 就完成所有编译工作，取而代之的做法是多次扫描，每次完成一部分工作，并将输出结果作为下次扫描的输入，直到最终产生目标代码。这里每次扫描称作一遍，即pass；最后一遍之前所有的遍数得到的结果都可称作中间表示法，本文中 AST、SSA 等都属于中间表示法）。

In this phase, the AST is converted into Static Single Assignment (SSA) form, a
lower-level intermediate representation with specific properties that make it
easier to implement optimizations and to eventually generate machine code from
it.

在此阶段，AST 将被转换为静态单赋值形式（SSA）形式，这是一种具有特定属性的低级中间表示法，可以更轻松地实现优化并最终从它生成机器代码（译注：静态单赋值形式SSA是中间表示法的一种性质，它要求每个变量只被赋值一次且在使用前被定义，补充如何轻松实现优化）。

During this conversion, function intrinsics are applied. These are special
functions that the compiler has been taught to replace with heavily optimized
code on a case-by-case basis.

在这个转换过程中，将完成内置函数的处理。 这些是特殊的函数，编译器被告知逐个分析这些函数并决定是否用深度优化的代码替换它们（译注：内置函数指由语言本身定义的函数，通常编译器的处理方式是使用相应实现函数的指令序列代替对函数的调用指令，有点类似内联函数）。

Certain nodes are also lowered into simpler components during the AST to SSA
conversion, so that the rest of the compiler can work with them. For instance,
the copy builtin is replaced by memory moves, and range loops are rewritten into
for loops. Some of these currently happen before the conversion to SSA due to
historical reasons, but the long-term plan is to move all of them here.

在 AST 转化成 SSA 的过程中，特定节点也被低级化为更简单的组件，以便于剩余的编译阶段可以基于它们工作。例如，内建的拷贝被替换为内存移动，range循环被改写为for循环(range需要翻译！！！）。由于历史原因，这里面有些目前在转化到 SSA 之前发生，但长期计划则是把它们都移到这里（转化 SSA）。

Then, a series of machine-independent passes and rules are applied. These do not
concern any single computer architecture, and thus run on all `GOARCH` variants.

然后，一系列机器无关的规则和遍会被执行。这些并不考虑特定计算机体系结构，因此对所有 `GOARCH` 变量的值都会运行。

Some examples of these generic passes include dead code elimination, removal of
unneeded nil checks, and removal of unused branches. The generic rewrite rules
mainly concern expressions, such as replacing some expressions with constant
values, and optimizing multiplications and float operations.

这类通用的遍的一些例子包括，死代码消除，移除不必要的空指针检查，以及移除无用的分支等。通用改写规则主要考虑表达式，例如将一些表达式替换为常量，优化乘法和浮点操作。

### 4. Generating machine code

* `cmd/compile/internal/ssa` (SSA lowering and arch-specific passes)
* `cmd/internal/obj` (machine code generation)

The machine-dependent phase of the compiler begins with the "lower" pass, which
rewrites generic values into their machine-specific variants. For example, on
amd64 memory operands are possible, so many load-store operations may be combined.

Note that the lower pass runs all machine-specific rewrite rules, and thus it
currently applies lots of optimizations too.

Once the SSA has been "lowered" and is more specific to the target architecture,
the final code optimization passes are run. This includes yet another dead code
elimination pass, moving values closer to their uses, the removal of local
variables that are never read from, and register allocation.

Other important pieces of work done as part of this step include stack frame
layout, which assigns stack offsets to local variables, and pointer liveness
analysis, which computes which on-stack pointers are live at each GC safe point.

At the end of the SSA generation phase, Go functions have been transformed into
a series of obj.Prog instructions. These are passed to the assembler
(`cmd/internal/obj`), which turns them into machine code and writes out the
final object file. The object file will also contain reflect data, export data,
and debugging information.

### Further reading

To dig deeper into how the SSA package works, including its passes and rules,
head to `cmd/compile/internal/ssa/README.md`.



--------------------------------------------------------------------------------

via: https://github.com/golang/go/blob/master/src/cmd/compile/README.md

作者：[mvdan ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://github.com/mvdan

[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11337-1.html)
[#]: subject: (Why I use Java)
[#]: via: (https://opensource.com/article/19/9/why-i-use-java)
[#]: author: (Chris Hermansen https://opensource.com/users/clhermansen)

我为什么使用 Java
======

> 根据你的工作需要，可能有比 Java 更好的语言，但是我还没有看到任何能把我拉走的语言。

![](https://img.linux.net.cn/data/attachment/album/201909/13/171223bf7noo4bbnkxbkdk.jpg)

我记得我是从 1997 年开始使用 Java 的，就在 [Java 1.1 刚刚发布][2]不久之后。从那时起，总的来说，我非常喜欢用 Java 编程；虽然我得承认，这些日子我经常像在 Java 中编写“严肃的代码”一样编写 [Groovy][3] 脚本。

来自 [FORTRAN][4]、[PL/1][5]、[Pascal][6] 以及最后的 [C 语言][7] 背景，我发现了许多让我喜欢 Java 的东西。Java 是我[面向对象编程][8]的第一次重要实践经验。到那时，我已经编程了大约 20 年，而且可以说我对什么重要、什么不重要有了一些看法。

### 调试是一个关键的语言特性

我真的很讨厌浪费时间追踪由我的代码不小心迭代到数组末尾而导致的模糊错误，特别是在 IBM 大型机上的 FORTRAN 编程时代。另一个不时出现的隐晦问题是调用一个子程序时，该子程序带有一个四字节整数参数，而预期有两个字节；在小端架构上，这通常是一个良性的错误，但在大端机器上，前两个字节的值通常并不总是为零。

在那种批处理环境中进行调试也非常不便，通过核心转储或插入打印语句进行调试，这些语句本身会移动错误的位置甚至使它们消失。

所以我使用 Pascal 的早期体验，先是在 [MTS][9] 上，然后是在 [IBM OS/VS1][10] 上使用相同的 MTS 编译器，让我的生活变得更加轻松。Pascal 的[强类型和静态类型][11]是取得这种胜利的重要组成部分，我使用的每个 Pascal 编译器都会在数组的边界和范围上插入运行时检查，因此错误可以在发生时检测到。当我们在 20 世纪 80 年代早期将大部分工作转移到 Unix 系统时，移植 Pascal 代码是一项简单的任务。

### 适量的语法

但是对于我所喜欢的 Pascal 来说，我的代码很冗长，而且语法似乎要比代码还要多；例如，使用：

```
if ... then begin ... end else ... end
```

而不是 C 或类似语言中的：

```
if (...) { ... } else { ... }
```

另外，有些事情在 Pascal 中很难完成，在 C 中更容易。但是，当我开始越来越多地使用 C 时，我发现自己遇到了我曾经在 FORTRAN 中遇到的同样类型的错误，例如，超出数组边界。在原始的错误点未检测到数组结束，而仅在程序执行后期才会检测到它们的不利影响。幸运的是，我不再生活在那种批处理环境中，并且手头有很好的调试工具。不过，C 对于我来说有点太灵活了。

当我遇到 [awk][12] 时，我发现它与 C 相比又是另外一种样子。那时，我的很多工作都涉及转换字段数据并创建报告。我发现用 `awk` 加上其他 Unix 命令行工具，如 `sort`、`sed`、`cut`、`join`、`paste`、`comm` 等等，可以做到事情令人吃惊。从本质上讲，这些工具给了我一个像是基于文本文件的关系数据库管理器，这种文本文件具有列式结构，是我们很多字段数据的保存方式。或者，即便不是这种格式，大部分时候也可以从关系数据库或某种二进制格式导出到列式结构中。

`awk` 支持的字符串处理、[正则表达式][13]和[关联数组][14]，以及 `awk` 的基本特性（它实际上是一个数据转换管道），非常符合我的需求。当面对二进制数据文件、复杂的数据结构和关键性能需求时，我仍然会转回到 C；但随着我越来越多地使用 `awk`，我发现 C 的非常基础的字符串支持越来越令人沮丧。随着时间的推移，更多的时候我只会在必须时才使用 C，并且在其余的时候里大量使用 `awk`。

### Java 的抽象层级合适

然后是 Java。它看起来相当不错 —— 相对简洁的语法，让人联想到 C，或者这种相似性至少要比 Pascal 或其他任何早期的语言更为明显。它是强类型的，因此很多编程错误会在编译时被捕获。它似乎并不需要过多的面向对象的知识就能起步，这是一件好事，因为我当时对 [OOP 设计模式][15]毫不熟悉。但即使在刚刚开始，我也喜欢它的简化[继承模型][16]背后的思想。（Java 允许使用提供的接口进行单继承，以在某种程度上丰富范例。）

它似乎带有丰富的功能库（即“自备电池”的概念），在适当的水平上直接满足了我的需求。最后，我发现自己很快就会想到将数据和行为在对象中组合在一起的想法。这似乎是明确控制数据之间交互的好方法 —— 比大量的参数列表或对全局变量的不受控制的访问要好得多。

从那以后，Java 在我的编程工具箱中成为了 Helvetic 军刀。我仍然偶尔会在 `awk` 中编写程序，或者使用 Linux 命令行实用程序（如 `cut`、`sort` 或 `sed`），因为它们显然是解决手头问题的直接方法。我怀疑过去 20 年我可能没写过 50 行的 C 语言代码；Java 完全满足了我的需求。

此外，Java 一直在不断改进。首先，它变得更加高效。并且它添加了一些非常有用的功能，例如[可以用 try 来测试资源][17]，它可以很好地清理在文件 I/O 期间冗长而有点混乱的错误处理代码；或 [lambda][18]，它提供了声明函数并将其作为参数传递的能力，而旧方法需要创建类或接口来“托管”这些函数；或[流][19]，它在函数中封装了迭代行为，可以创建以链式函数调用形式实现的高效数据转换管道。

### Java 越来越好

许多语言设计者研究了从根本上改善 Java 体验的方法。对我来说，其中大部分没有引起我的太多兴趣；再次，这更多地反映了我的典型工作流程，并且（更多地）减少了这些语言带来的功能。但其中一个演化步骤已经成为我的编程工具中不可或缺的一部分：[Groovy][20]。当我遇到一个小问题，需要一个简单的解决方案时，Groovy 已经成为了我的首选。而且，它与 Java 高度兼容。对我来说，Groovy 填补了 Python 为许多其他人所提供的相同用处 —— 它紧凑、DRY（不要重复自己）和具有表达性（列表和词典有完整的语言支持）。我还使用了 [Grails][21]，它使用 Groovy 为非常高性能和有用的 Java Web 应用程序提供简化的 Web 框架。

### Java 仍然开源吗？

最近，对 [OpenJDK][22] 越来越多的支持进一步提高了我对 Java 的舒适度。许多公司以各种方式支持 OpenJDK，包括 [AdoptOpenJDK、Amazon 和 Red Hat][23]。在我的一个更大、更长期的项目中，我们使用 AdoptOpenJDK [来在几个桌面平台上生成自定义的运行时环境][24]。

有没有比 Java 更好的语言？我确信有，这取决于你的工作需要。但我一直对 Java 非常满意，我还没有遇到任何可能会让我失望的东西。

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/9/why-i-use-java

作者：[Chris Hermansen][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/clhermansen
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/java-coffee-beans.jpg?itok=3hkjX5We (Coffee beans)
[2]: https://en.wikipedia.org/wiki/Java_version_history
[3]: https://en.wikipedia.org/wiki/Apache_Groovy
[4]: https://en.wikipedia.org/wiki/Fortran
[5]: https://en.wikipedia.org/wiki/PL/I
[6]: https://en.wikipedia.org/wiki/Pascal_(programming_language)
[7]: https://en.wikipedia.org/wiki/C_(programming_language)
[8]: https://en.wikipedia.org/wiki/Object-oriented_programming
[9]: https://en.wikipedia.org/wiki/Michigan_Terminal_System
[10]: https://en.wikipedia.org/wiki/OS/VS1
[11]: https://stackoverflow.com/questions/11889602/difference-between-strong-vs-static-typing-and-weak-vs-dynamic-typing
[12]: https://en.wikipedia.org/wiki/AWK
[13]: https://en.wikipedia.org/wiki/Regular_expression
[14]: https://en.wikipedia.org/wiki/Associative_array
[15]: https://opensource.com/article/19/7/understanding-software-design-patterns
[16]: https://www.w3schools.com/java/java_inheritance.asp
[17]: https://www.baeldung.com/java-try-with-resources
[18]: https://www.baeldung.com/java-8-lambda-expressions-tips
[19]: https://www.tutorialspoint.com/java8/java8_streams
[20]: https://groovy-lang.org/
[21]: https://grails.org/
[22]: https://openjdk.java.net/
[23]: https://en.wikipedia.org/wiki/OpenJDK
[24]: https://opensource.com/article/19/4/java-se-11-removing-jnlp

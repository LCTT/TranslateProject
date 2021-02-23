[#]: collector: (lujun9972)
[#]: translator: (MjSeven)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10769-1.html)
[#]: subject: (Which programming languages should you learn?)
[#]: via: (https://opensource.com/article/19/2/which-programming-languages-should-you-learn)
[#]: author: (Marty Kalin https://opensource.com/users/mkalindepauledu)

你应该学习哪种编程语言？
======

> 学习一门新的编程语言是在你的职业生涯中继续前进的好方法，但是应该学习哪一门呢？

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/search_find_code_issue_bug_programming.png?itok=XPrh7fa0)

如果你想要开始你的编程生涯或继续前进，那么学习一门新语言是一个聪明的主意。但是，大量活跃使用的语言引发了一个问题：哪种编程语言是最好的？要回答这个问题，让我们从一个简单的问题开始：你想做什么样的程序？

如果你想在客户端进行网络编程，那么特定语言 HTML、CSS 和 JavaScript（看似无穷无尽的方言之一）是必须要学习的。

如果你想在服务器端进行 Web 编程，那么选择包括常见的通用语言：C++、Golang、Java、C#、 Node.js、Perl、Python、Ruby 等等。当然，服务器程序与数据存储（例如关系数据库和其他数据库）打交道，这意味着 SQL 等查询语言可能会发挥作用。

如果你正在为移动设备编写原生应用程序，那么了解目标平台非常重要。对于 Apple 设备，Swift 已经取代 Objective C 成为首选语言。对于 Android 设备，Java（带有专用库和工具集）仍然是主要语言。有一些特殊语言，如与 C# 一起使用的 Xamarin，可以为 Apple、Android 和 Windows 设备生成特定于平台的代码。

那么通用语言呢？通常有各种各样的选择。在*动态*或*脚本*语言（如 Perl、Python 和 Ruby）中，有一些新东西，如 Node.js。而 Java 和 C# 的相似之处比它们的粉丝愿意承认的还要多，仍然是针对虚拟机（分别是 JVM 和 CLR）的主要*静态编译*语言。在可以编译为*原生可执行文件*的语言中，C++ 仍在使用，还有后来出现的 Golang 和 Rust 等。通用的*函数式*语言比比皆是（如 Clojure、Haskell、Erlang、F#、Lisp 和 Scala），它们通常都有热情投入的社区。值得注意的是，面向对象语言（如 Java 和 C#）已经添加了函数式构造（特别是 lambdas），而动态语言从一开始就有函数式构造。

让我以 C 语言结尾，它是一种小巧、优雅、可扩展的语言，不要与 C++ 混淆。现代操作系统主要用 C 语言编写，其余部分用汇编语言编写。任何平台上的标准库大多数都是用 C 语言编写的。例如，任何打印 `Hello, world!` 这种问候都是通过调用名为 `write` 的 C 库函数来实现的。

C 作为一种可移植的汇编语言，公开了其他高级语言有意隐藏的底层系统的详细信息。因此，理解 C 可以更好地掌握程序如何竞争执行所需的共享系统资源（如处理器、内存和 I/O 设备）。C 语言既高级又接近硬件，因此在性能方面无与伦比，当然，汇编语言除外。最后，C 是编程语言中的通用语言，几乎所有通用语言都支持某种形式的 C 调用。

有关现代 C 语言的介绍，参考我的书籍 《[C 语言编程：可移植的汇编器介绍][1]》。无论你怎么做，学习 C 语言，你会学到比另一种编程语言多得多的东西。

你认为学习哪些编程语言很重要？你是否同意这些建议？在评论告知我们！

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/2/which-programming-languages-should-you-learn

作者：[Marty Kalin][a]
选题：[lujun9972][b]
译者：[MjSeven](https://github.com/MjSeven)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/mkalindepauledu
[b]: https://github.com/lujun9972
[1]: https://www.amazon.com/dp/1977056954?ref_=pe_870760_150889320

[#]: collector: "lujun9972"
[#]: translator: "zzzzzzmj"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-10485-1.html"
[#]: subject: "The History of Hello World"
[#]: via: "https://www.thesoftwareguild.com/blog/the-history-of-hello-world/"
[#]: author: "thussong https://www.thesoftwareguild.com/blog/author/thussong/"

Hello World 的由来
=========

资深软件开发人员都知道 [Hello World][2] 程序，这是一个能在设备显示器上输出某种变体的 “Hello, World!” 的程序，是学习编程的第一步。在这个编程中只涉及到一些最基本语法的程序，可以用大多数编程语言了来编写。事实上，路易斯安纳理工学院计算机协会（ACM）在最近统计[发现][3]这个程序至少有 204 个版本。

传统意义上，Hello World 程序是用于说明编码过程是如何工作的，以及确保编程语言或系统能正常运行。它们经常是新手程序员学习的第一个程序，因为即使是经验很少或者没有经验的人也能轻松正确的执行 Hello World。

首先，Hello World 简单，这就是为什么它经常被用做程序执行成功的晴雨表。如果 Hello World 在该框架中无法有效执行，那么其它更复杂的程序中也可能会失败。正如 [Win-Vector][4] 的一位专家所说，Hello World 实际上是一个对抗性程序。“该作者还说道，‘你的计算机系统能不能工作并不是一目了然，除非我能看到它至少能打印一行文字，否则我不会在上面浪费太多时间。’” Win-Vector 博主 John Mount 说。

但是这个两词短语在计算机科学领域有着重大的影响。以 Hello World 为基础，新手程序员可以轻松的理解计算机科学原理或元素，而拥有多年编码经验的程序员可以用它来学习编程语言的工作原理，特别是在结构与语法方面。这样的一个小程序，在任何难度的应用程序和几乎所有语言中都有着悠久的历史。

### 用途

以上概括了 Hello World 程序的主要用途：这是新手程序员熟悉新语言的一种方式。然而，这些程序不仅仅是对编码世界的介绍。例如，Hello World 可以作为测试，以确保语言的组件（编译器、开发和运行环境）安装正确。因为配置完整的编程工具链的过程复杂而漫长，所以像 Hello World 这样简单的程序通常用作新工具链的首次运行测试。

根据 Cunningham & Cunningham（C2）的编程顾问所说，在系统设计人员并不预期可以执行代码的地方，黑客经常使用 Hello World 程序作为一个可以通过漏洞执行任意代码的概念验证（POC）。事实上，它是在设备上使用自制内容或者“自酿”的第一步，当[有经验的编码人员][5]正在配置环境或在学习新事物时，他们会通过 Hello World 来验证其行为是否正确。

它也作为调试过程的一部分，允许程序员检查他们是否正确地编辑了可在运行时修改的程序并重新加载。

Hello World 的一个更常用的用途是作为基础比较。根据 C2 的 wiki 所讲，程序员可以“比较语言生成的可执行文件的大小，以及程序背后必须存在多少支持的基础设施才能执行。”

### 开端

虽然 Hello World 的起源还有些不太明了，不过人们普遍认为它作为测试用语，最早出现在 Brian Kernigham 在 1972 年发布的《<ruby>B 语言简介教程<rt>A Tutorial Introduction to the Language B</rt></ruby>》中。在此文中，该程序的第一个已知版本用于说明外部变量。因为该教程中的前一个例子在终端上打印了 “hi!”，而需要更多的字符常量来表达相对复杂的 “hello,world!”，这是学习过程的下一步。

在那以后，它还被用于 1974 年的贝尔实验室备忘录，以及 1987 年的《<ruby>C 语言程序设计<rt>The C Programming Language</rt></ruby>》。这两篇著名的文字是让 Hello World 闻名于世的主要原因。在书中的一个例子（第一个，也是最著名的例子）打印了没有大写字母和感叹号的 “hello,world”。此时的 Hello World 几乎只是用于说明语言的一些功能，而不是测试系统是否正常运行。

在 Kernigham 的关于 B 语言和 C 语言的开创性文章之前，没有真正意义上的第一个程序，甚至直到 1974 年，它也没被广泛使用。著名的 BASIC 教程 “<ruby>我的电脑喜欢我用 BASIC 跟它讲话<rt>My Computer Likes Me，When I Speak BASIC</rt></ruby>”，从一个写一行文本的简单程序开始，不过那句话是 “MY HUMAN UNDERSTANDS ME”，跟如今程序员侃侃而谈的这个双词问候语差的有点远。不过，当 Hello World 被发明后，它就迅速传播，并在 20 世纪 70 年代后变成了众所周知。直到今天它也依然受欢迎。

### 一个声明，多种语言

以下是目前正在被使用的一些流行的编程语言中的 Hello World 代码。

#### Java

```
class HelloWorld {
    public static void main(String[] args) {
        System.out.println("Hello, world!");
    }
}
```

#### C# 

```
using System;
class Program
{
    public static void Main(string[] args)
    {
        Console.WriteLine("Hello, world!");
    }
}
```

#### Python

```
print("Hello, world!")
```

#### Ruby

```
puts "Hello, world!"
```

#### Scala

```
object HelloWorld extends App {
    println("Hello, world!")
}
```

#### ASP.NET

```
Response.Write("Hello World!");
```

#### Lisp

```
(princ "Hello, world!")
```

#### Haskell

```
main = putStrLn "Hello, world!"
```

#### Malbolge

```
('&%:9]!~}|z2Vxwv-,POqponl$Hjig%eB@@>}=<M:9wv6WsU2T|nm-,jcL(I&%$#"
`CB]V?Tx<uVtT`Rpo3NlF.Jh++FdbCBA@?]!~|4XzyTT43Qsqq(Lnmkj"Fhg${z@>
```

#### Go

```
package main
import "fmt"
func main() {
    fmt.Println("Hello, world!")
}
```

### 如今的 Hello world：各种形式下的标准实践

在现在的编程语言中，Hello World 有着不同的复杂程度。例如，Go 语言中引入一个多语言版的 Hello World 程序，XL 则会提供一个具有图形、可旋转的 3D 版本。一些编程语言，像 Ruby、Python，仅仅需要一个语句去打印“Hello World”，但是低级汇编语言则需要几个命令才能做到这样。现在的编程语言还引入对标点符号和大小写的变化，包括是否有逗号或者感叹号，以及两个词的大写形式。举个例子，当系统只支持大写字母，会呈现像“HELLO WORLD”的短语。值得纪念的第一个 Malbolge 程序打印出了“HEllO WORld”（LCTT 译注：Malbolge 是最难的编程语言之一。事实上，在它诞生后，花了 2 年时间才完成第一个 Malbolge 程序）。它的变体跨越了原本的字面意思。像 Lisp、Haskell 这样函数语言，用阶乘程序替代了 Hello World，从而注重递归技术。这与原来的示例不同，后者更强调 I/O 以及产生的副作用。

随着现在的编程语言越来越复杂，Hello World 比以往显得更加重要。作为测试和教学工具，它已经成为程序员测试配置的编程环境的标准方法。没有人能确切说出为什么 Hello World 能在快速创新著称的行业中经受住时间的考验，但是它又确实留下来了。

--------------------------------------------------------------------------------

via: https://www.thesoftwareguild.com/blog/the-history-of-hello-world/

作者：[thussong][a]
选题：[lujun9972][b]
译者：[zzzzzzmj](https://github.com/zzzzzzmj)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.thesoftwareguild.com/blog/author/thussong/
[b]: https://github.com/lujun9972
[1]: https://www.linkedin.com/shareArticle?mini=true&url=https%3A%2F%2Fwww.thesoftwareguild.com%2Fblog%2Fthe-history-of-hello-world%2F&title=The%20History%20of%20Hello%20World
[2]: http://en.wikipedia.org/wiki/%22Hello,_World!%22_program
[3]: http://whatis.techtarget.com/definition/Hello-World
[4]: http://www.win-vector.com/blog/2008/02/hello-world-an-instance-rhetoric-in-computer-science/
[5]: http://c2.com/cgi/wiki?HelloWorld

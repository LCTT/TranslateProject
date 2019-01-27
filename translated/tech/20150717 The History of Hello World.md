[#]: collector: "lujun9972"
[#]: translator: "zzzzzzmj"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "
[#]: subject: "The History of Hello World"
[#]: via: "https://www.thesoftwareguild.com/blog/the-history-of-hello-world/"
[#]: author: "thussong https://www.thesoftwareguild.com/blog/author/thussong/"



# Hello World 的由来

资深软件开发人员都知道[Hello world](2)程序，一个能被输出多种"Hello, World!"的程序，是学习编程的第一步。这个编程中只涉及到一些最基本语法的程序，可以被大多数语言输出在显示器上。事实上，路易斯安纳理工学院计算机协会（ACM）在最近统计[发现](3)这个项目至少有204个版本。

传统意义上，Hello World程序是用于说明编码过程是如何工作的，以及确保语言或系统能正常运行。它们经常是新手程序员学习的第一个程序，因为即使是经验很少或者没有经验的人也能轻松正确的执行Hello World。

首先，Hello World 简单，这就是为什么它经常被用做程序执行成功的晴雨表。如果Hello World在框架中无法有效执行，那么在其他更复杂的程序中也可能会失败。正如[Win-Vector](4)的一位专家所说，"Hello World实际上是一个对抗性程序"。该作者还说道，"你的计算机系统没有工作并不起眼，所有我们不会花很多时间在上面，不过我要看到它至少能打印一行文字"。

但是 这个两词短语在计算机科学领域有着重大的影响。以Hello World为基础，新手程序员可以轻松的去理解计算机科学原理，而拥有多年编码经验的程序员可以用它来学习编程语言的工作原理，特别是在结构与语言方面。这样的一个小程序，在任何难度和几乎所有的语言的应用程序中都有着悠久的历史。

### 用途

上文中一句话概括Hello World程序的主要用途：这是新手程序员熟悉新语言的一种方式。然而，这些程序不仅仅是对编码世界的介绍。例如，Hello World 可以作为测试，以确保语言的组件（编译器，开发和运行环境）安装正确。因为配置完整的编程工具链的过程复杂而漫长，所以像Hello World这样简单的程序通常用作新工具的首次运行测试。

根据Cunningham & Cunningham （C2）的编程顾问所说， 黑客经常使用Hello World程序， 来证明猜想，因为任何代码都可以通过漏洞执行，而系统设计人员并不允许执行代码。事实上，它是在设备上使用自制内容或者“home brew”的第一步， 当[有经验的编码人员](5)正在配置环境或在学习新事物时，他们会Hello World 来验证动作是否正确。

它也是作为调试的一部分，允许程序员在程序运行时检查他么编辑修改了的地方是否正确，然后重新加载。

Hello World的一个更常用的用途是作为基础的比较。根据C2的wiki所讲，程序员可以比较语言生成的可执行文件的大小，以及程序背后必须存在多少支持基础结构才能执行。

### 开端

虽然Hello World 的起源还有些不太明了，不过人们普遍认为它是作为测试用语，最早出现在Brian Kernigham 在1972年发布的B语言教程简介中。在此文中，该程序的第一个已知版本用于说明外部变量。因为教程中的前一个例子在终端上打印了“hi!”，而需要更多字符常量来表达相对复杂的“hello,world!”，是学习过程的下一步。

在那以后，它还被用于1974年的贝尔实验室备忘录，以及1987年的C语言程序设计。这两篇著名的文章是让Hello World闻名于世的主要原因。在书中的一个例子（第一个也是最著名的例子）打印了没有大写字母和感叹号的“hello,world”，此时的Hello World几乎只是用于说明语言的一些功能，而不是测试系统是否正常运行。

在Kernigham的关于B语言和C语言的开创性文章之前，没有真正意义上的第一个程序，甚至直到1974年，它也没被广泛使用。著名的BASIC教程“My Computer Likes Me，When I Speak BASIC”，从一个写一行文本的简单程序开始，不过那句话是“MY HUMAN UNDERSTANDS ME”，跟如今程序员侃侃而谈的双词问候语差的有点远。不过，当Hello World被发明后，它就迅速传播，并在20世纪70年代后从所周知。直到今天它也依然受欢迎。

### 一个声明， 多种语言

以下是目前正在被使用的一些流行的编程语言中的Hello World 代码

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



### 如今的 Hello world: 各种形式下的标准实践

在现在的编程语言中，Hello world有着不同的复杂程度。例如，Go语言中引入一个多语言的Hello World程序，XL则会提供一个具有图形、可旋转的3D版本。一些编程语言，像Ruby，Python，仅仅需要一个声明去打印"Hello World"，但是低级汇编语言则需要几个命令才能做到这样。现在的编程语言还引入对标点符号的支持，包括逗号或者感叹号是否存在，以及两个词的大写。举个例子，当系统只支持大写字母，会呈现像"HELLO WORLD"的短语。第一个不平凡的Malbolge程序打印出了"HEllO WORld"，跨域了原本的字面意思。功能语言像Lisp、Haskell，阶乘程序替代了Hello World，从而注重递归技术。这与原来的示例不同，后者更强调I/O以及产生的副作用。

随着现在的编程语言越来越复杂，Hello World 比以往显得更加重要。同样作为测试和教学工具，它已经成为程序员测试配置的编程环境的标准方法。没有人能确切说出为什么Hello World能在快速创新著称的行业中经受住时间的考验，但是它又确实留下来了。

--------------------------------------------------------------------------------

via: https://www.thesoftwareguild.com/blog/the-history-of-hello-world/

作者：[thussong][a]
选题：[lujun9972][b]
译者：[zzzzzzmj](https://github.com/zzzzzzmj)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.thesoftwareguild.com/blog/author/thussong/
[b]: https://github.com/lujun9972
[1]: https://www.linkedin.com/shareArticle?mini=true&url=https%3A%2F%2Fwww.thesoftwareguild.com%2Fblog%2Fthe-history-of-hello-world%2F&title=The%20History%20of%20Hello%20World
[2]: http://en.wikipedia.org/wiki/%22Hello,_World!%22_program
[3]: http://whatis.techtarget.com/definition/Hello-World
[4]: http://www.win-vector.com/blog/2008/02/hello-world-an-instance-rhetoric-in-computer-science/
[5]: http://c2.com/cgi/wiki?HelloWorld

[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (The History of Hello World)
[#]: via: (https://www.thesoftwareguild.com/blog/the-history-of-hello-world/)
[#]: author: (thussong https://www.thesoftwareguild.com/blog/author/thussong/)

The History of Hello World
======


Veteran software developers know the [Hello World][2] program as the first step in learning to code. The program, which outputs some variant of “Hello, World!” on a device’s display, can be created in most languages, making it some of the most basic syntax involved in the coding process. In fact, a recent project at the Association for Computing Machinery (ACM) at Louisiana Tech [found][3] that there are at least 204 versions of the program.

Traditionally, Hello World programs are used to illustrate how the process of coding works, as well as to ensure that a language or system is operating correctly. They are usually the first programs that new coders learn, because even those with little or no experience can execute Hello World both easily and correctly.

Above all, Hello World is simple. That’s why it is so often used as a barometer of program success. If Hello World does not work effectively within the framework, then it is likely that other, more complex programs will also fail. As one expert at [Win-Vector][4] puts it, Hello World is actually a confrontational program. “The author is saying ‘it isn’t obvious your computer system will work, so I am not going to invest a lot of time in it until I see it can at least print one line of text,’” Win-Vector blogger John Mount says.

But this two-word phrase has big implications for the field of computer science. With Hello World as a foundation, novice programmers can easily understand computer science principles or elements. And professionals with years of coding experience can use it to learn how a given programming language works, especially in terms of structure and syntax. With applications at all skill levels and in almost every language, there is a long history behind such a short program.

### Uses

The main use for Hello World programs was outlined above: It is a way for rookie coders to become acquainted with a new language. However, the applications of these programs go beyond an introduction to the coding world. Hello World can, for example, be used as a sanity test to make sure that the components of a language (its compiler, development and run-time environment) have been correctly installed. Because the process involved in configuring a complete programming toolchain is lengthy and complex, a simple program like Hello World is often used as a first-run test on a new toolchain.

Hackers also use Hello World “as proof of concept that arbitrary code can be executed through an exploit where the system designers did not intend code to be executed,” according to programming consultants at Cunningham & Cunningham (C2). In fact, it’s the first step in using homemade content, or “home brew” on a device. When [experienced coders][5] are configuring an environment or learning a previously unknown one, they verify that Hello World behaves correctly.

It is also used as part of the debugging process, allowing programmers to check that they are editing the right aspect of a modifiable program at runtime and that it is being reloaded.

One more popular use for Hello World is as a basis for comparison. Coders can “compare the size of the executable that the language generates, and how much supporting infrastructure must exist behind the program for it to execute,” according to C2’s wiki.

### Beginnings

Though the origins of Hello World remain somewhat unclear, its use as a test phrase is widely believed to have begun with Brian Kernigham’s 1972 book, A Tutorial Introduction to the Language B. In this text, the first known version of the program was used to illustrate external variables. Because the previous example in the tutorial printed “hi!” on the terminal, the more complex “hello, world!” required more character constants for expression and was the next step in the learning process.

From there, it was used in a Bell Laboratories memo in 1974, as well as The C Programming Language in 1978. This popular text is what made Hello World famous. The example from that book (the first, and most pure, example) printed “hello, world,” with no capital letters or exclamation point. At this time, Hello World was used almost solely to illustrate a few functions of a language— not to test whether the system was running.

Before Kernigham’s seminal texts on B and C, there was no standard first program. Even as late as 1972, it was not widely in use. The popular BASIC tutorial, “My Computer Likes Me, When I Speak in Basic,” starts with a simple program that writes a line of text. However, this message was “MY HUMAN UNDERSTANDS ME,” far from the two-word greeting programmers use today. But once Hello World was invented, it spread quickly, becoming well-known by the late 1970s. Its popularity continues to this day.

### One Statement, Many Languages

Here’s what the code for Hello World looks like in some of the most popular programming languages currently in use.

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

`Response.Write("Hello World!");`

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

### Hello World Today: A Standard Practice in Varied Forms

In modern coding languages, Hello World is deployed at different levels of sophistication. For example, the Go language introduced a multilingual Hello World program, and XL features a spinning, 3D version complete with graphics. Some languages, like Ruby and Python, need only a single statement to print “hello world,” but a low-level assembly language could require several commands to do so. Modern languages also introduce variations in punctuation and casing. These include the presence or absence of the comma and exclamation point, as well as the capitalization of both words. For example, when systems only support capital letters, the phrase appears as “HELLO WORLD.” The first nontrivial Malbolge program printed “HEllO WORld.” Variations go beyond the literal as well. In functional languages like Lisp and Haskell, factorial programs are substituted for Hello World to emphasize recursive techniques. This is different from the original examples, which emphasized I/O and produced side effects.

With the increasing complexity of modern coding languages, Hello World is more important than ever. Both as a test and a teaching tool, it has become a standardized way of allowing programmers to configure their environment. No one can be sure why Hello World has stood the test of time in an industry known for rapid-fire innovation, but it is here to stay.

--------------------------------------------------------------------------------

via: https://www.thesoftwareguild.com/blog/the-history-of-hello-world/

作者：[thussong][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.thesoftwareguild.com/blog/author/thussong/
[b]: https://github.com/lujun9972
[1]: https://www.linkedin.com/shareArticle?mini=true&url=https%3A%2F%2Fwww.thesoftwareguild.com%2Fblog%2Fthe-history-of-hello-world%2F&title=The%20History%20of%20Hello%20World
[2]: http://en.wikipedia.org/wiki/%22Hello,_World!%22_program
[3]: http://whatis.techtarget.com/definition/Hello-World
[4]: http://www.win-vector.com/blog/2008/02/hello-world-an-instance-rhetoric-in-computer-science/
[5]: http://c2.com/cgi/wiki?HelloWorld

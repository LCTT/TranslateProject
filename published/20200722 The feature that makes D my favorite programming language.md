[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12489-1.html)
[#]: subject: (The feature that makes D my favorite programming language)
[#]: via: (https://opensource.com/article/20/7/d-programming)
[#]: author: (Lawrence Aberba https://opensource.com/users/aberba)

我最喜欢的 D 语言功能
======

> UFCS 能让你能够编写自然的可重用代码而不会牺牲便利性。

![](https://img.linux.net.cn/data/attachment/album/202008/05/215524d9j62oui7mgm7ms9.jpg)

早在 2017 年，我就写过为什么 [D 语言是开发的绝佳选择][2]的文章。但是 D 语言中有一个出色的功能我没有充分的展开介绍：<ruby>[通用函数调用语法][3]<rt>Universal Function Call Syntax</rt></ruby>（UFCS）。UFCS 是 D 语言中的一种[语法糖][4]，它可以在类型（字符串、数字、布尔值等）上链接任何常规函数，就像该类型的成员函数一样。

如果你尚未安装 D 语言，请[安装 D 语言编译器][5]，以便你可以自己[运行 D 代码][6]。

看一下以下示例代码：

```
// file: ufcs_demo.d

module ufcs_demo;

import std.stdio : writeln;

int[] evenNumbers(int[] numbers)
{
    import std.array : array;
    import std.algorithm : filter;

    return numbers.filter!(n => n % 2 == 0).array;
}

void main()
{
    writeln(evenNumbers([1, 2, 3, 4]));
}
```

使用你喜欢的 D 语言编译器进行编译，查看这个简单示例应用做了什么：

```
$ dmd ufcs_demo.d
$ ./ufcs_demo
[2, 4]
```

但是，使用作为 D 语言的内置功能的 UFCS ，你还可以自然方式编写代码：

```
...
writeln([1, 2, 3, 4].evenNumbers());
...
```

或完全删除现在多余的括号，使 `evenNumbers` 看起来像是一个属性：

```
...
writeln([1, 2, 3, 4].evenNumbers); // prints 2, 4
...
```

因此，完整的代码现在变为：

```
// file: ufcs_demo.d

module ufcs_demo;

import std.stdio : writeln;

int[] evenNumbers(int[] numbers)
{
    import std.array : array;
    import std.algorithm : filter;

    return numbers.filter!(n => n % 2 == 0).array;
}

void main()
{
    writeln([1, 2, 3, 4].evenNumbers);
}
```

使用你最喜欢的 D 语言编译器进行编译，然后尝试一下。 如预期的那样，它产生相同的输出：

```
$ dmd ufcs_demo.d
$ ./ufcs_demo
[2, 4]
```

在编译过程中，编译器*自动地*将数组作为函数的第一个参数。这是一个常规模式，使得使用 D 语言成为一种乐趣，因此，它与你自然而然考虑代码的感觉非常相似。结果就是函数式编程。

你可能会猜出这打印的是什么：

```
//file: cool.d
import std.stdio : writeln;
import std.uni : asLowerCase, asCapitalized;

void main()
{
    string mySentence = "D IS COOL";
    writeln(mySentence.asLowerCase.asCapitalized);
}
```

确认一下：


```
$ dmd cool.d
$ ./cool
D is cool
```

结合[其他 D 语言的功能][7]，UFCS 使你能够编写可重用的代码，并在不牺牲便利性的情况下自然地进行编写。

### 是时候尝试 D 语言了

就像我之前写的那样，D 语言是一种很棒的开发语言。从 [D 语言的下载页面][8]可以很容易地进行安装，因此请下载编译器，查看示例，并亲自体验 D 语言。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/7/d-programming

作者：[Lawrence Aberba][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/aberba
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/code_computer_laptop_hack_work.png?itok=aSpcWkcl (Coding on a computer)
[2]: https://opensource.com/article/17/5/d-open-source-software-development
[3]: http://ddili.org/ders/d.en/ufcs.html
[4]: https://en.wikipedia.org/wiki/Syntactic_sugar
[5]: https://tour.dlang.org/tour/en/welcome/install-d-locally
[6]: https://tour.dlang.org/tour/en/welcome/run-d-program-locally
[7]: https://dlang.org/comparison.html
[8]: https://dlang.org/download.html

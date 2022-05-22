[#]: subject: (Teach anyone how to code with Hedy)
[#]: via: (https://opensource.com/article/21/4/hedy-teach-code)
[#]: author: (Joshua Allen Holm https://opensource.com/users/holmja)
[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13290-1.html)

用 Hedy 教人编程
======

> Hedy 是一种专门为教人编程而设计的新型编程语言。

![](https://img.linux.net.cn/data/attachment/album/202104/12/111814w62da2sannsd2q76.jpg)

学习编程既要学习编程逻辑，又要学习特定编程语言的语法。我在大学上第一堂编程课的时候，教的语言是 C++。第一个代码例子是基本的 “Hello World” 程序，就像下面的例子。

```
#include <iostream>

int main() {
    std::cout << "Hello World!";
    return 0;
}
```

老师直到几节课后才会解释大部分的代码。我们的期望是，我们只需输入代码，并最终了解为什么需要这些东西以及它们如何工作。

C++（以及其他类似的语言）的复杂语法是为什么 Python 经常被建议作为一种更容易的编程教学语言。下面是 Python 中的同一个例子：

```
print("Hello World!")
```

虽然 Python 中的 “Hello World” 基础例子要简单得多，但它仍然有复杂而精确的语法规则。`print` 函数需要在字符串周围加括号和引号。这对于没有编程经验的人来说，还是会感到困惑。Python 比 C++ 少了 “我以后再解释” 的语法问题，但还是有一些。

[Hedy][2] 是一种专门为编码教学而设计的新语言，它通过在语言中将复杂性分成多个关卡来解决语法复杂性的问题。Hedy 没有马上提供语言的全部功能，而是采取循序渐进的方式，随着学生在 Hedy 的学习的通关，慢慢变得更加复杂。随着关卡的进展，该语言获得了新的功能，最终变得更像 Python。目前有七个关卡，但更多的关卡正在计划中。

在第 1 关，Hedy 程序除了打印（`print`）一条语句（不需要引号或括号），提出（`ask`）一个问题，并回传（`echo`）一个答案外，不能做任何事情。第 1 关没有变量，没有循环，结构极精简。回传的工作原理几乎和变量一样，但只针对用户的最后一个输入。这可以让学生对基本概念感到舒适，而不必一下子学习所有的东西。

这是一个第 1 关的 Hedy “Hello World” 程序：

```
print Hello World
```

第 2 关引入了变量，但由于 `print` 函数没有使用引号，可能会出现一些有趣的结果。如果用来存储一个人的名字的变量是 `name`，那么就不可能打印输出 `Your name is [name]`，因为 `name` 的第一次使用（本意是字符串）和第二次使用（是变量）都被解释为变量。如果将 `name` 设置为（`is`） `John Doe`，那么 `print Your name is name.` 的输出就会是 `Your John Doe is John Doe`。虽然这听起来很奇怪，但这是一个引入变量概念的好方法，这恰好是第 3 关中增加的一个功能。

第 3 关要求在字符串周围加引号，这使得变量的功能就像在 Python 中一样。现在可以输出与变量相结合的字符串，做出复杂的语句，而不用担心变量名和字符串中的单词之间的冲突。这个级别取消了 “回传”（`echo`）函数，这看起来确实是一个可能会让一些学习者感到沮丧的东西。他们应该使用变量，这是更好的代码，但如果一个 `ask`/`echo` 代码块变成无效语法，可能会让人感到困惑。

第 4 关增加了基本的 `if`/`else` 功能。学生可以从简单的问/答代码转向复杂的交互。例如，一个问“你最喜欢的颜色是什么？”的提示可以根据用户输入的内容接受不同的回复。如果他们输入绿色，回答可以是“绿色！这也是我最喜欢的颜色。”如果他们输入其他的东西，回复可以是不同的。`if`/`else` 块是一个基本的编程概念，Hedy 引入了这个概念，而不必担心复杂的语法或过于精确的格式。

第 5 关有一个 `repeat` 函数，在现有的功能上增加了一个基本的循环。这个循环只能多次重复同一个命令，所以它没有 Python 中的循环那么强大，但它让学生习惯了重复命令的一般概念。这是多介绍了一个编程概念，而不会用无谓的复杂来拖累。学生们可以先掌握概念的基础知识，然后再继续学习同一事物的更强大、更复杂的版本。

在第 6 关，Hedy 现在可以进行基本的数学计算。加法、减法、乘法和除法都支持，但更高级的数学功能不支持。不能使用指数、模数或其他任何 Python 和其他语言能处理的东西。目前，Hedy 还没有更高关卡的产品增加更复杂的数学功能。

第 7 关引入了 Python 风格的缩进，这意味着 `repeat` 可以处理多行代码。学生在这之前都是逐行处理代码，但现在他们可以处理代码块。这个 Hedy 关卡与非教学型编程语言能做的事情相比还是有很大的差距，但它可以教会学生很多东西。

开始学习 Hedy 最简单的方法是访问 Hedy 网站上的 [课程][3]，目前有荷兰语、英语、法语、德语、葡萄牙语和西班牙语。这样一来，任何有网页浏览器的人都可以进入学习过程。也可以从 [GitHub][4] 下载 Hedy，并从命令行运行解释器，或者运行 Hedy 网站的本地副本及其交互式课程。基于网页的版本更容易使用，但网页版本和命令行版本都支持运行针对不同复杂程度的 Hedy 程序。

Hedy 永远不会与 Python、C++ 或其他语言竞争，成为现实世界项目编码的首选语言，但它是编码教学的绝佳方式。作为学习过程的一部分，学生编写的程序是真实的，甚至可能是复杂的。Hedy 可以促进学生的学习和创造力，而不会让学生在学习过程中过早地被过多的信息所迷惑。就像数学课一样，在进入微积分之前很久要从学习计数、相加等开始（这个过程需要数年时间），编程也不必一开始就对编程语言的语法问题“我稍后再解释”、精确地遵循这些语法问题，才能产生哪怕是最基本的语言程序。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/4/hedy-teach-code

作者：[Joshua Allen Holm][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/holmja
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/5538035618_4e19c9787c_o.png?itok=naiD1z1S (Teacher or learner?)
[2]: https://www.hedycode.com/
[3]: https://www.hedycode.com/hedy?lang=en
[4]: https://github.com/felienne/hedy

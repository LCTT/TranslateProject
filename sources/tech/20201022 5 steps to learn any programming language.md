[#]: collector: "lujun9972"
[#]: translator: "xiao-song-123"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "
[#]: subject: "5 steps to learn any programming language"
[#]: via: "https://opensource.com/article/20/10/learn-any-programming-language"
[#]: author: "Seth Kenlon https://opensource.com/users/seth"

学习任何编程语言的 5 个步骤
======
只需一点编程经验，您就可以在几天内（有时更少）学习一种新语言。
![Learning to program][1]

有些人喜欢学习新的编程语言，也有一些人连学习一种都是可望不可即的事情。在本文中，我将向您展示如何像程序员一样思考，以便您可以自信地学习所需的任何编程语言。

事实上，一旦您学会了如何编程，您使用的语言就不再是一个障碍，而更像是一种形式。这只是教育家们倡导 [让孩子尽早学习编程][2] 的众多原因之一。不管他们的入门语言有多简单，这种编程的逻辑和儿童(或成人学习者)以后可能遇到的其他东西的逻辑有着相同之处。

只需有一点编程经验(您可以从 Opensource.com 上的任何一篇介绍性文章中获得)，您就可以在几天内(有时更短)学习任何编程语言。这并不是魔法，现在您也必须要为此付出一些努力。诚然，学习一种语言每个的可用库，或者学习打包代码以及进行交付的细微差别，需要的时间远远不止几天。但是，就入门来说，比您想像中的要容易许多，剩下的则要通过不断练习来完成。

当有经验的程序员静下心来学习一门新的编程语言时，他们会寻找五样东西。只要您知道了这五件事，您就可以开始编码了。

### 1\. 语法

![Syntax][3]

(Seth Kenlon, [CC BY-SA 4.0][4])

语言的语法描述了代码的结构。这包括如何逐行编写代码，以及用于构造代码语句的实际单词。

例如，[Python][5] 因使用缩进来指示一个代码块在哪里结束以及另一代码块在哪里开始而闻名：


```
while j &lt; rows:
    while k &lt; columns:
        tile = Tile(k * w)
        board.add(tile)
        k += 1
    j += 1
    k = 0
```

[Lua][6] 只是使用关键字 `end`:


```
for i,obj in ipairs(hit) do
  if obj.moving == 1 then
     obj.x,obj.y = v.mouse.getPosition()
  end
end
```

[Java][7], [C][8], C++, 和类似的编程语言使用花括号:


```
while (std::getline(e,r)) {
  wc++;
  }
```

编程语言的语法还包括包括库、设置变量和终止行等内容。通过练习，您将学会在阅读示例代码时下意识地识别语法需求(和惯例)。

#### 实践

当学习一门新的编程语言时，要努力理解它的语法。您不需要去记住它，只需要知道如果忘记了以后去哪里看。使用好的 [IDE][9] 也很有帮助，因为很多 IDE 在出现语法错误时会提醒您。

### 2\. 内置函数和条件

![built-in words][10]

(Seth Kenlon, [CC BY-SA 4.0][4])

就像自然语言一样，编程语言可以识别的合法单词是有限的。这个词汇表可以使用其他库进行扩展，但是核心语言知道一组特定的关键字。大多数语言并没有您想的那么多关键字。即使在像 C 语言这样非常低级的语言中，也只有 32 个关键字，比如 `for`, `do`, `while`, `int`, `float`, `char`, `break` 等等。

了解了这些关键字，您就可以编写基本的表达式，也就是构建程序的代码块。许多内置的关键字能帮助您构建条件语句，这些条件语句影响整个程序的流程。例如，如果您想编写一个允许单击和拖动图标的程序，那么您的代码就必须检测用户的鼠标指针何时位于图标上。只有当鼠标光标位于图标外部边缘相同的坐标时，才执行导致使鼠标抓取图标的代码。这是一个经典的 if / then 语句，不同的语言可以用不同的方式表达。

Python 使用 `if`, `elif `和 `else` 的组合来实现条件语句，但是并不显式的关闭语句：


```
if var == 1:
    # action
elif var == 2:
    # some action
else:
    # some other action
```

[Bash][11] 使用 `if`, `elif`, `else`, 并且使用 `fi` 来结束语句:


```
if [ "$var" = "foo" ]; then
   # action
elif [ "$var" = "bar" ]; then
   # some action
else
   # some other action
fi
```

然而 C 和 Java,  使用 `if`, `else` 和 `else if`, 用花括号把它们括起来:


```
if (boolean) {
   // action
} else if (boolean) {
   // some action
} else {
   // some other action
}
```

各种编程语言虽然在关键字的选择和语法上有细微的变化，但基本是相同的。学习如何在所学的编程语言中定义条件语句，包括  `if/then`, `do...while` 和 `case` 语句。

#### 实践

要去熟悉编程语言能够理解的关键字集。在实践中，您的代码将不仅仅包含一种语言的关键字。可以肯定的是，有许多库中包含一些简单的函数，它们可以帮助您完成诸如将输出打印到屏幕或显示窗口之类的操作。然而，驱动这些库的逻辑始于编程语言的内置关键字。

### 3\. 数据类型

![Data types][12]

(Seth Kenlon, [CC BY-SA 4.0][4])

代码是用来处理数据的，因此您必须学习编程语言如何识别不同类型的数据。所有编程语言都能理解整数，大多数的语言能理解小数和单个字符 (a, b, c 等等)。它们通常被表示为 `int` ,  `float`，`double` 和 `char`, 当然，语言的内置词汇表会告诉您如何引用这些实体。

有时候，在编程语言中内置了一些额外的数据类型，也有时是通过引用库来启用复杂的数据类型。例如，Python 可以识别关键字为 `str` 的字符串，但是 C 语言的代码中必须包含 `string.h`  头文件才能实现字符串特性。

#### 实践

库可以为您的代码解锁所有类型的数据，但是学习编程语言中包含的基本数据类型是一个明智的起点。

### 4\. 运算符和解析器

![Operators][13]

(Seth Kenlon, [CC BY-SA 4.0][4])

Once you understand the types of data a programming language deals in, you can learn how to analyze that data. Luckily, the discipline of mathematics is pretty stable, so math operators are often the same (or at least very similar) across many languages. For instance, adding two integers is usually done with a `+` symbol, and testing whether one integer is greater than another is usually done with the `>` symbol. Testing for equality is usually done with `==` (yes, that's two equal symbols, because a single equal symbol is usually reserved to _set_ a value).

There are notable exceptions to the obvious in languages like Lisp and Bash, but as with everything else, it's just a matter of mental transliteration. Once you know _how_ the expression is different, it's trivial for you to adapt. A quick review of a language's math operators is usually enough to get a feel for how math is done.

You also need to know how to compare and operate on non-numerical data, such as characters and strings. These are often done with a language's core libraries. For instance, Python features the `split()` method, while C requires `string.h` to provide the `strtok()` function.

#### Take action

Learn the basic functions and keywords for manipulating basic data types, and look for core libraries that help you accomplish complex actions.

### 5\. Functions

![Class][14]

(Seth Kenlon, [CC BY-SA 4.0][4])

Code usually isn't just a to-do list for a computer. Typically when you write code, you're looking to present a computer with a set of theoretical conditions and a set of instructions for actions that must be taken when each condition is met. While flow control with conditional statements and math and logic operators can do a lot, code is a lot more efficient once functions and classes are introduced because they let you define subroutines. For instance, should an application require a confirmation dialogue box very frequently, it's a lot easier to write that box _once_ as an instance of a class rather than re-writing it each time you need it to appear throughout your code.

You need to learn how classes and functions are defined in the programming language you're learning. More precisely, first, you need to learn whether classes and functions are available in the programming language. Most modern languages do support functions, but classes are specialized constructs common to object-oriented languages.

#### Take action

Learn the constructs available in a language that help you write and use code efficiently.

### You can learn anything

Learning a programming language is, in itself, a sort of subroutine of the coding process. Once you understand the theory behind how code works, the language you use is just a medium for delivering logic. The process of learning a new language is almost always the same: learn syntax through simple exercises, learn vocabulary so you can build up to performing complex actions, and then practice, practice, practice.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/10/learn-any-programming-language

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/learn-programming-code-keyboard.png?itok=xaLyptT4 "Learning to program"
[2]: https://opensource.com/article/20/9/scratch
[3]: https://opensource.com/sites/default/files/uploads/syntax_0.png "Syntax"
[4]: https://creativecommons.org/licenses/by-sa/4.0/
[5]: https://opensource.com/downloads/cheat-sheet-python-37-beginners
[6]: https://opensource.com/article/20/2/lua-cheat-sheet
[7]: https://opensource.com/downloads/java-cheat-sheet
[8]: https://opensource.com/downloads/c-programming-cheat-sheet
[9]: https://opensource.com/resources/what-ide
[10]: https://opensource.com/sites/default/files/uploads/builtin.png "built-in words"
[11]: https://opensource.com/downloads/bash-cheat-sheet
[12]: https://opensource.com/sites/default/files/uploads/type.png "Data types"
[13]: https://opensource.com/sites/default/files/uploads/operator.png "Operators"
[14]: https://opensource.com/sites/default/files/uploads/class.png "Class"

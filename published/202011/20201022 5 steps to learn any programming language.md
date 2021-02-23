[#]: collector: "lujun9972"
[#]: translator: "xiao-song-123"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-12842-1.html"
[#]: subject: "5 steps to learn any programming language"
[#]: via: "https://opensource.com/article/20/10/learn-any-programming-language"
[#]: author: "Seth Kenlon https://opensource.com/users/seth"

五步学会任何编程语言
======

> 只需一点编程经验，你就可以在短短几天内（有时更少）学会一种新编程语言。

![](https://img.linux.net.cn/data/attachment/album/202011/19/225851j7miw3kd17joowa7.jpg)

有些人喜欢学习新的编程语言，也有一些人觉得学习一种都是可望不可及的事情。在本文中，我将向你展示如何像程序员一样思考，这样你就可以自信地学习任何一门你想要学习的编程语言。

事实上，一旦你学会了如何编程，你使用的编程语言就不再是一个障碍，而更像是一种形式。实际上，这就是教育家们倡导 [让孩子尽早学习编程][2] 的众多原因之一。不管他们的入门语言有多简单，这种编程的逻辑和儿童们（或成人学习者）以后可能遇到的其他语言的逻辑有着想通之处。

只需有一点编程经验（你可以从我们这里的几篇介绍性文章中获得），你就可以在短短几天内（有时更短）学习任何编程语言。这并不是魔法，你也确实要为此付出一些努力。诚然，学习一种编程语言每个的可用库，或者学习打包代码以及进行交付的细微差别，需要的时间远远不止几天。但是，就入门来说，比你想像中的要容易许多，剩下的则要通过不断练习来完成。

当有经验的程序员静下心来学习一门新的编程语言时，他们会寻找五样东西。只要你知道了这五件事，你就可以开始编码了。

### 1、语法

![Syntax][3]

语言的语法描述了代码的结构。这包括如何逐行编写代码，以及用于构造代码语句的实际单词。

例如，[Python][5] 以使用缩进来指示一个代码块在哪里结束以及另一代码块在哪里开始而闻名：

```
while j < rows:
    while k < columns:
        tile = Tile(k * w)
        board.add(tile)
        k += 1
    j += 1
    k = 0
```

[Lua][6] 只是使用关键字 `end`：

```
for i,obj in ipairs(hit) do
  if obj.moving == 1 then
     obj.x,obj.y = v.mouse.getPosition()
  end
end
```

[Java][7]、[C][8]、C++ 之类的编程语言使用花括号：

```
while (std::getline(e,r)) {
  wc++;
  }
```

编程语言的语法还包括包括库、设置变量和终止行等内容。通过练习，你将学会在阅读示例代码时下意识地识别语法需求（和惯例）。

#### 实践

当学习一门新的编程语言时，要努力理解它的语法。你不需要去记住它，只需要知道如果忘记了以后去哪里查找。使用好的 [IDE][9] 也很有帮助，因为很多 IDE 在出现语法错误时会提醒你。

### 2、内置函数和条件

![built-in words][10]

就像自然语言一样，编程语言可以识别的合法单词是有限的。这个词汇表可以使用其他库进行扩展，但是核心语言知道一组特定的关键字。大多数语言并没有你想的那么多关键字。即使在像 C 语言这样非常低级的语言中，也只有 32 个关键字，比如 `for`、`do`、`while`、`int`、`float`、`char`、`break` 等等。

了解了这些关键字，你就可以编写基本的表达式，也就是构建程序的代码块。许多内置的关键字能帮助你构建条件语句，这些条件语句影响整个程序的流程。例如，如果你想编写一个允许单击和拖动图标的程序，那么你的代码就必须检测用户的鼠标指针何时位于图标上。只有当鼠标光标位于图标外部边缘相同的坐标时，才执行导致使鼠标抓取图标的代码。这是一个经典的 `if` / `then` 语句，但不同的语言可以用不同的方式表达。

Python 使用 `if`、`elif `和 `else` 的组合来实现条件语句，但是并不显式的关闭语句：

```
if var == 1:
    # action
elif var == 2:
    # some action
else:
    # some other action
```

[Bash][11] 使用 `if`、`elif`、`else`，并且使用 `fi` 来结束语句：

```
if [ "$var" = "foo" ]; then
   # action
elif [ "$var" = "bar" ]; then
   # some action
else
   # some other action
fi
```

然而 C 和 Java,  使用 `if`、`else` 和 `else if`，用花括号把它们括起来：

```
if (boolean) {
   // action
} else if (boolean) {
   // some action
} else {
   // some other action
}
```

各种编程语言虽然在关键字的选择和语法上有细微的变化，但基本是相同的。学习如何在编程语言中定义条件语句，包括 `if` / `then`、`do...while` 和 `case` 语句。

#### 实践

要熟悉编程语言能够理解的关键字集。在实践中，你的代码将不仅仅包含编程语言的关键字，可以肯定的是，有包含很多简单函数的库来帮助你做一些事情，诸如将输出打印到屏幕或显示窗口之类。然而，驱动这些库的逻辑始于编程语言的内置关键字。

### 3、数据类型

![Data types][12]

代码是用来处理数据的，因此你必须学习编程语言如何识别不同类型的数据。所有编程语言都能理解整数，大多数的语言能理解小数和单个字符（`a`、`b`、`c` 等等）。它们通常被表示为 `int`、 `float`、`double` 和 `char`，当然，语言的内置词汇表会告诉你如何引用这些实体。

有时候，在编程语言中内置了一些额外的数据类型，也有时是通过引用库来启用复杂的数据类型。例如，Python 可以识别关键字为 `str` 的字符串，但是 C 语言的代码中必须包含 `string.h`  头文件才能实现字符串特性。

#### 实践

库可以为你的代码解锁各种类型的数据，但是学习编程语言中包含的基本数据类型是一个明智的起点。

### 4、运算符和解析器

![Operators][13]

一旦你理解了编程语言可处理的数据类型，就可以学习如何分析这些数据了。幸运的是，数学这门学科是相当稳定的，所以算数运算符在许多语言中通常是相同的（或至少非常相似）。例如，两个整数相加通常用 `+` 符号完成，而测试一个整数是否大于另一个整数通常用 `>` 符号完成。测试是否相等通常使用 `==` 来完成（是的，是两个等号，因为通常一个等号用来赋值）。

当然也有一些例外，比如像 Lisp 和 Bash 语言算数运算符就不是如此，但与其他语言一样，这只是一个心理翻译的问题。一旦你了解了表达方式有何不同，很快就可以适应它。快速浏览一下一门编程语言的算数运算符通常足以让你了解算数操作是如何完成的。

你还需要知道如何比较和操作非数值数据，比如字符和字符串。这些通常是通过编程语言的核心库来进行的的。例如，Python 提供了 `split()` 方法，而 C 语言需要引入头文件 `string.h` 来提供 `strtok()` 函数。

#### 实践

了解用于处理基本数据类型的基本函数和关键字，并寻找可帮助你完成复杂操作的核心库。

### 5、函数

![Class][14]

代码不只是计算机的待办清单。通常情况下，在编写代码时你往往希望向计算机提供一组理论条件和一组操作指令，当满足每个条件时计算机就会采取这些操作。尽管使用条件语句以及数学和逻辑运算符进行流控制可以做很多事情，但是引入了函数和类之后，代码会变得更加高效，因为它们使你可以定义子程序。例如，如果应用程序非常频繁地需要一个确认对话框，那么将其作为类的实例编写一次要比每次需要它时重新编写实现起来要容易得多。

你需要学习如何在编程语言中定义类和函数。更准确地说，你首先需要了解编程语言中是否支持类和函数。大多数现代语言都支持函数，但是类是面向对象的编程语言中所特有的。

#### 实践

学习语言中可用的结构，这些结构可以帮助你高效地编写和使用代码。

### 你可以学到任何东西

学习编程语言，就其本身而言，是一种编码过程中的子程序。一旦理解了代码如何工作，你所使用的语言就只是一种传递逻辑的媒介。学习一门新编程语言的过程几乎都是一样的：通过简单的练习来学习语法，通过学习词汇来积累进行复杂动作的能力，然后练习、练习、再练习。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/10/learn-any-programming-language

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[xiao-song-123](https://github.com/xiao-song-123)
校对：[wxy](https://github.com/wxy)

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

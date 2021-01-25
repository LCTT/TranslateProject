[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12973-1.html)
[#]: subject: (Learn Python by coding a simple game)
[#]: via: (https://opensource.com/article/20/12/learn-python)
[#]: author: (Moshe Zadka https://opensource.com/users/moshez)

编写一个简单的游戏来学习 Python
======

> 通过编写一个“猜数字”游戏来探索 Python（和其他编程语言）。

![](https://img.linux.net.cn/data/attachment/album/202101/01/105156uwwgx3tw2otntoow.jpg)

在这个系列中，我们要用不同的编程语言编写相同的应用，以比较各种语言是如何工作的，并说明使用标准测试程序是学习新编程好方法。

当你学习一门新的编程语言时，关注它们的共同点是件好事。变量、表达式和语句是大多数编程语言的基础。一旦你理解了这些概念，你就可以开始弄清楚其余的东西。

因为编程语言有许多相似之处，一旦你知道一种语言，你通常可以通过观察它与你所知道的语言的不同之处来学习另一种语言的基础知识。使用你用其他语言编写的标准测试程序，可以让你专注于语言，而不是程序的逻辑。

为了证明这点，我们正在测试如何用多种语言编写一个“猜数字”程序。计算机选择一个 1 到 100 之间的数字，然后让你猜。程序循环，直到你猜出正确答案。

“猜数字”程序练习了编程语言的几个概念：

  * 变量
  * 输入
  * 输出
  * 条件判断
  * 循环

这是一个很好的学习新编程语言的实践实验。

### 用 Python 猜数字

用 [Python 软件基金会][2]的话来说。“Python 是一种解释性的、交互式的、面向对象的程序设计语言，它包含了模块、异常、动态类型、非常高层的动态数据类型和类。”它是一种很好的通用编程语言，从简单的脚本到复杂的 GUI 应用都很适用。

你可以通过编写一个版本的“猜数字”游戏来探索 Python。这是我的实现：

```
import random as randomlib
random = randomlib.randint(1, 100)
print("Guess a number between 1 and 100")
while True:
    guess = int(input())
    if guess &lt; random:
        print("Too low")
    elif guess &gt; random:
        print("Too high")
    else:
        print("That's right!")
        break
```

要给一个变量赋值，请列出变量的名称，然后是 `=` 号。例如，语句 `random = 0` 给 `random` 变量分配了一个零值。

脚本的第一行就导入了 `random` 模块。由于本系列中的所有程序都使用 `random` 作为变量的名称，你可以使用 `import random as randomlib` 以别名导入它，以避免命名冲突。

很少有函数被内置到 Python 中，大多数函数必须从标准库中显式导入。`random` 标准库模块有生成各种随机值的功能。

脚本的第二行读取函数 `randint()` 的结果，并将其赋值给名为 `random` 的变量。函数需要两个参数：一个最小值和一个最大值。在本例中，范围是 `1` 到 `100`，以使游戏具有足够的挑战性。

你可以使用 `input()` 函数提示用户输入一个值。如果你写 `guess = int(input())`，Python 会等待用户输入一些文本，将其转换为一个整数，然后将值存储在 `guess` 变量中。

Python 支持条件表达式和循环等流程控制。在“猜数字”游戏中，只要 `guess` 中的值不等于 `random`，Python 就会继续循环。

如果猜测值小于随机数，Python 会打印 `Too low`，如果猜测值大于这个数字，Python 会打印 `Too high`。

### 示例输出

现在你已经写好了 Python 程序，运行它来玩“猜数字”游戏。每次运行程序，Python 都会随机选取一个不同的数字。为了完成这个游戏，你需要猜测，直到找到正确的数字：

```
$ python guess.py
Guess a number between 1 and 100
 50
Too high
 25
Too high
 12
Too high
 7
Too high
 3
Too low
 5
Too low
 6
That's right!
```

在学习一门新的编程语言时，这个“猜数字”游戏是一个很好的入门程序，因为它以一种相当直接的方式练习了几个常见的编程概念。通过在不同的编程语言中实现这个简单的游戏，你可以展示不同编程语言的一些核心概念，并比较每种语言的细节。

你有喜欢的编程语言吗？你会如何编写“猜数字”游戏？请关注本系列文章，看看你可能感兴趣的其他编程语言的例子吧！

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/12/learn-python

作者：[Moshe Zadka][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/moshez
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/python_programming_question.png?itok=cOeJW-8r (Python programming language logo with question marks)
[2]: https://docs.python.org/3/faq/general.html#general-information

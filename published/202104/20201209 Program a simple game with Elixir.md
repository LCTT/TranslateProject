[#]: collector: (lujun9972)
[#]: translator: (tt67wq)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13292-1.html)
[#]: subject: (Program a simple game with Elixir)
[#]: via: (https://opensource.com/article/20/12/elixir)
[#]: author: (Moshe Zadka https://opensource.com/users/moshez)

使用 Elixir 语言编写一个小游戏
======

> 通过编写“猜数字”游戏来学习 Elixir 编程语言，并将它与一个你熟知的语言做对比。

![](https://img.linux.net.cn/data/attachment/album/202104/12/223351t68886wmza1m9jnt.jpg)

为了更好的学习一门新的编程语言，最好的方法是去关注主流语言的一些共有特征：

  * 变量
  * 表达式
  * 语句

这些概念是大多数编程语言的基础。因为这些相似性，只要你通晓了一门编程语言，你可以通过对比差异来熟知另一门编程语言。

另外一个学习新编程语言的好方法是开始编写一个简单标准的程序。它可以让你集中精力在语言上而非程序的逻辑本身。在这个系列的文章中，我们使用“猜数字”程序来实现，在这个程序中，计算机会选择一个介于 1 到 100 之间的数字，并要求你来猜测它。程序会循环执行，直到你正确猜出该数字为止。

“猜数字”这个程序使用了编程语言的以下概念：

  * 变量
  * 输入
  * 输出
  * 条件判断
  * 循环

这是一个学习新编程语言的绝佳实践。

### 猜数字的 Elixir 实现

[Elixir][2] 是一门被设计用于构建稳定可维护应用的动态类型的函数式编程语言。它与 [Erlang][3] 运行于同一虚拟机之上，吸纳了 Erlang 的众多长处的同时拥有更加简单的语法。

你可以编写一个 Elixir 版本的“猜数字”游戏来体验这门语言。

这是我的实现方法：

```
defmodule Guess do
  def guess() do
     random = Enum.random(1..100)
     IO.puts "Guess a number between 1 and 100"
     Guess.guess_loop(random)
  end
  def guess_loop(num) do
    data = IO.read(:stdio, :line)
    {guess, _rest} = Integer.parse(data)
    cond do
      guess < num ->
        IO.puts "Too low!"
        guess_loop(num)
      guess > num ->
        IO.puts "Too high!"
        guess_loop(num)
      true ->
        IO.puts "That's right!"
    end
  end
end

Guess.guess()
```

Elixir 通过列出变量的名称后面跟一个 `=` 号来为了给变量分配一个值。举个例子，表达式 `random = 0` 给 `random` 变量分配一个数值 0。

代码以定义一个模块开始。在 Elixir 语言中，只有模块可以包含命名函数。

紧随其后的这行代码定义了入口函数 `guess()`，这个函数：

  * 调用 `Enum.random()` 函数来获取一个随机整数
  * 打印游戏提示
  * 调用循环执行的函数

剩余的游戏逻辑实现在 `guess_loop()` 函数中。

`guess_loop()` 函数利用 [尾递归][4] 来实现循环。Elixir 中有好几种实现循环的方法，尾递归是比较常用的一种方式。`guess_loop()` 函数做的最后一件事就是调用自身。

`guess_loop()` 函数的第一行读取用户输入。下一行调用 `parse()` 函数将输入转换成一个整数。

`cond` 表达式是 Elixir 版本的多重分支表达式。与其他语言中的 `if/elif` 或者 `if/elsif` 表达式不同，Elixir 对于的首个分支或者最后一个没有分支并没有区别对待。

这个 `cond` 表达式有三路分支：猜测的结果可以比随机数大、小或者相等。前两个选项先输出不等式的方向然后递归调用 `guess_loop()`，循环返回至函数开始。最后一个选项输出 `That's right`，然后这个函数就完成了。

### 输出例子

现在你已经编写了你的 Elixir 代码，你可以运行它来玩“猜数字”的游戏。每次你执行这个程序，Elixir 会选择一个不同的随机数，你可以一直猜下去直到你找到正确的答案：

```
$ elixir guess.exs
Guess a number between 1 and 100
50
Too high
30
Too high
20
Too high
10
Too low
15
Too high
13
Too low
14
That's right!
```

“猜数字”游戏是一个学习一门新编程语言的绝佳入门程序，因为它用了非常直接的方法实践了常用的几个编程概念。通过用不同语言实现这个简单的小游戏，你可以实践各个语言的核心概念并且比较它们的细节。

你是否有你最喜爱的编程语言？你将怎样用它来编写“猜数字”这个游戏？关注这个系列的文章来看看其他你可能感兴趣的语言实现。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/12/elixir

作者：[Moshe Zadka][a]
选题：[lujun9972][b]
译者：[tt67wq](https://github.com/tt67wq)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/moshez
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/dice_tabletop_board_gaming_game.jpg?itok=y93eW7HN (A die with rainbow color background)
[2]: https://elixir-lang.org/
[3]: https://www.erlang.org/
[4]: https://en.wikipedia.org/wiki/Tail_call

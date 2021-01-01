[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12962-1.html)
[#]: subject: (Learn Bash by writing an interactive game)
[#]: via: (https://opensource.com/article/20/12/learn-bash)
[#]: author: (Jim Hall https://opensource.com/users/jim-hall)

通过编写互动游戏学习 Bash
======

> 编程一个简单的游戏是练习一门新语言并与其他你掌握的语言进行比较的好方法。

![](https://img.linux.net.cn/data/attachment/album/202012/28/010432yq3vgsqtiol9zzi6.jpg)

学习一门新的编程语言是很有趣的。每当我尝试学习一门新的语言时，我都会专注于定义变量、编写语句和评估表达式。一旦我对这些概念有了大致的了解，我通常可以自己弄清楚其余的概念。大多数编程语言都有一些相似之处，所以一旦你了解了一种编程语言，学习下一种编程语言就是要弄清楚其独特的细节，认识到其中的差异。

为了帮助我练习一种新的编程语言，我喜欢写一些测试程序。我经常写的一个示例程序是一个简单的“猜数字”程序，电脑在 1 到 100 之间选一个数字，让我猜这个数字。程序会一直循环，直到我猜对为止。

“猜数字”程序锻炼了编程语言中的几个概念：如何给变量赋值，如何写语句，如何进行条件判断和循环。对于学习一门新的编程语言来说，这是一个很好的实践实验。

### 用 Bash 猜数字

[Bash][2] 是大多数 Linux 系统的标准 shell。除了提供丰富的命令行用户界面外，Bash 还以*脚本*的形式支持完整的编程语言。

如果你对 Bash 不熟悉，我推荐你看这些介绍：

  * [什么是 Bash？][3]。
  * [开始使用 Bash 编程][4]
  * [系统管理员的 Bash 脚本入门][5]
  * [如何在 Bash 中编写函数][6]
  * [阅读更多关于 Bash 的信息][7]

你可以通过编写一个 Bash 版本的“猜数字”游戏来探索它。这是我的实现：

```
#!/bin/bash

number=$(( $RANDOM % 100 + 1 ))

echo "Guess a number between 1 and 100"

guess=0

while [ "0$guess" -ne $number ] ; do
        read guess
        [ "0$guess" -lt $number ] && echo "Too low"
        [ "0$guess" -gt $number ] && echo "Too high"
done

echo "That's right!"
exit 0
```

### 拆解这个脚本

脚本中的第一行，`#!/bin/bash` 告诉 Linux 使用 Bash shell 来运行这个脚本。每个脚本都以 `#!` 字符对（LCTT 译注：释伴）开始，这表示它是一个 shell 脚本。紧跟在`#!` 后面的是要运行的 shell。在本例中，`/bin/bash` 是指 Bash shell。

要给一个变量赋值，在变量名后面列出 `=` 号。例如，语句 `guess=0` 给 `guess` 变量分配一个零值。

你也可以使用 `read` 语句提示用户输入一个值。如果你写了 `read guess` 语句，Bash 会等待用户输入一些文本，然后把这个值存储在 `guess` 变量中。

要引用一个变量的值，在变量名前使用 `$`。所以, 在 `guess` 变量中存储了一个值后, 你可以使用 `$guess` 来检索它。

你可以使用任何你喜欢的变量名称，但是 Bash 为自己保留了一些特殊的变量名称。一个特殊的变量是 `RANDOM`，每次引用它都会产生一个很大的随机数。

如果你想在存储一个值的同时执行一个操作，你需要用特殊的括号把语句括起来。这将告诉 Bash 先执行该语句，而 `=` 则将结果值存储在变量中。要评估一个数学表达式，使用 `$(())` 围在你的语句上。双括号表示一个*算术表达式*。在我的例子中，`number=$(( $RANDOM % 100 + 1 ))` 评估表达式 `$RANDOM % 100 + 1`，然后将值存储在 `number` 变量中。

标准的算术运算符，如 `+`（加）、`-`（减）、`*`（乘）、`/`（除）和 `%`（模）都适用。

这意味着语句 `number=$(( $RANDOM % 100 + 1 ))` 产生一个 1 到 100 之间的随机数。模数运算符（`%`）返回两个数相除后的余数。在这种情况下，Bash 将一个随机数除以 100，剩下的余数范围是 0 到 99，通过在这个值上加 1，你可以得到一个介于 1 和 100 之间的随机数。

Bash 支持像循环这样的*条件表达式*和*流程控制*。在“猜数字”的游戏中，只要 `guess` 中的值不等于 `number`，Bash 就会继续循环。如果猜的数小于随机数，Bash 就会打印“太低”，如果猜的数大于数字，Bash 就会打印“太高”。

### 它是如何工作的

现在你已经写好了你的 Bash 脚本，你可以运行它来玩“猜数字”游戏。一直猜，直到你找到正确的数字：

```
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

每次运行这个脚本，Bash 都会随机选择一个不同的数字。

这个“猜数字”游戏是学习新的编程语言时的一个很好的入门程序，因为它以一种很直接的方式锻炼了几个常见的编程概念。通过在不同的编程语言中实现这个简单的游戏，你可以展示一些核心概念，并比较每种语言的细节。

你有喜欢的编程语言吗？你会如何用它来写“猜数字”游戏呢？请关注本系列文章，看看你可能感兴趣的其他编程语言的例子。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/12/learn-bash

作者：[Jim Hall][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jim-hall
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/bash_command_line.png?itok=k4z94W2U (bash logo on green background)
[2]: https://en.wikipedia.org/wiki/Bash_(Unix_shell)
[3]: https://opensource.com/resources/what-bash
[4]: https://opensource.com/article/20/4/bash-programming-guide
[5]: https://opensource.com/article/20/4/bash-sysadmins-ebook
[6]: https://opensource.com/article/20/6/bash-functions
[7]: https://opensource.com/tags/bash

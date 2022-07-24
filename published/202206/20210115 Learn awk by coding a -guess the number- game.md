[#]: collector: (lujun9972)
[#]: translator: (FYJNEVERFOLLOWS)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-14668-1.html)
[#]: subject: (Learn awk by coding a "guess the number" game)
[#]: via: (https://opensource.com/article/21/1/learn-awk)
[#]: author: (Chris Hermansen https://opensource.com/users/clhermansen)

通过编写“猜数字”游戏来学习 Awk
======

> 编程语言往往具有许多共同特征。学习一门新语言的好方法是去写一个熟悉的程序。在本文中，我将会使用 Awk 编写一个“猜数字”程序来展示熟悉的概念。

![](https://img.linux.net.cn/data/attachment/album/202206/03/130545jthh1vtoadahwahd.jpg)

当你学习一门新的编程语言时，最好把重点放在大多数编程语言都有的共同点上:

  * 变量 —— 存储信息的地方
  * 表达式 —— 计算的方法
  * 语句 —— 在程序中表示状态变化的方法

这些概念是大多是编程语言的基础。

一旦你理解了这些概念，你就可以开始把其他的弄清楚。例如，大多数语言都有由其设计所支持的“处理方式”，这些方式在不同语言之间可能有很大的不同。这些方法包括模块化（将相关功能分组在一起）、声明式与命令式、面向对象、低级与高级语法特性等等。许多程序员比较熟悉的是编程“仪式”，即，在处理问题之前设置场景所需花费的工作。据说 Java 编程语言有一个源于其设计的重要仪式要求，就是所有代码都在一个类中定义。

但从根本上讲，编程语言通常有相似之处。一旦你掌握了一种编程语言，就可以从学习另一种语言的基本知识开始，品味这种新语言的不同之处。
 
一个好方法是创建一组基本的测试程序。有了这些，就可以从这些相似之处开始学习。

你可以选择创建的一个测试程序是“猜数字”程序。电脑从 1 到 100 之间选择一个数字，让你猜这个数字。程序一直循环，直到你猜对为止。

“猜数字”程序练习了编程语言中的几个概念:
 
  * 变量
  * 输入
  * 输出
  * 条件判断
  * 循环

这是学习一门新的编程语言的一个很好的实践实验。

**注**：本文改编自 Moshe Zadka 在 [Julia][2] 中使用这种方法和 Jim Hall在 [Bash][3] 中使用这种方法的文章。

### 在 awk 程序中猜数

让我们编写一个实现“猜数字”游戏的 Awk 程序。

Awk 是动态类型的，这是一种面向数据转换的脚本语言，并且对交互使用有着令人惊讶的良好支持。Awk 出现于 20 世纪 70 年代，最初是 Unix 操作系统的一部分。如果你不了解 Awk，但是喜欢电子表格，这就是一个你可以 [去学习 Awk][4] 的信号！

您可以通过编写一个“猜数字”游戏版本来开始对 Awk 的探索。

以下是我的实现（带有行号，以便我们可以查看一些特定功能）：

```
     1    BEGIN {
     2        srand(42)
     3        randomNumber = int(rand() * 100) + 1
     4        print "random number is",randomNumber
     5        printf "guess a number between 1 and 100\n"
     6    }
     7    {
     8        guess = int($0)
     9        if (guess &lt; randomNumber) {
    10            printf "too low, try again:"
    11        } else if (guess &gt; randomNumber) {
    12            printf "too high, try again:"
    13        } else {
    14            printf "that's right\n"
    15            exit
    16        }
    17    }
```

我们可以立即看到 Awk 控制结构与 C 或 Java 的相似之处，但与 Python 不同。
在像 `if-then-else`、`while` 这样的语句中，`then`、`else` 和 `while` 部分接受一个语句或一组被 `{` 和 `}` 包围的语句。然而，Awk 有一个很大的区别需要从一开始就了解：

根据设计，Awk 是围绕数据管道构建的。

这是什么意思呢？大多数 Awk 程序都是一些代码片段，它们接收一行输入，对数据做一些处理，然后将其写入输出。认识到这种转换管道的需要，Awk 默认情况下提供了所有的转换管道。让我们通过关于上面程序的一个基本问题来探索：“从控制台读取数据”的结构在哪里？

答案是——“内置的”。特别的，第 7-17 行告诉 Awk 如何处理被读取的每一行。在这种情况下，很容易看到第 1-6 行是在读取任何内容之前被执行的。

更具体地说，第 1 行上的 `BEGIN` 关键字是一种“模式”，在本例中，它指示 Awk 在读取任何数据之前，应该先执行 `{ ... }` 中 `BEGIN` 后面的内容。另一个类似的关键字 `END`，在这个程序中没有被使用，它指示 Awk 在读取完所有内容后要做什么。

回到第 7-17 行，我们看到它们创建了一个类似代码块 `{ ... }` 的片段，但前面没有关键字。因为在 `{` 之前没有任何东西可以让 Awk 匹配，所以它将把这一行用于接收每一行输入。每一行的输入都将由用户输入作为猜测。

让我们看看正在执行的代码。首先，是在读取任何输入之前发生的序言部分。

在第 2 行，我们用数字 42 初始化随机数生成器（如果不提供参数，则使用系统时钟）。为什么要用 42？[当然要选 42！][5] 第 3 行计算 1 到 100 之间的随机数，第 4 行输出该随机数以供调试使用。第 5 行邀请用户猜一个数字。注意这一行使用的是 `printf`，而不是 `print`。和 C 语言一样，`printf` 的第一个参数是一个用于格式化输出的模板。

既然用户知道程序需要输入，她就可以在控制台上键入猜测。如前所述，Awk 将这种猜测提供给第 7-17 行的代码。第 18 行将输入记录转换为整数；`$0` 表示整个输入记录，而 `$1` 表示输入记录的第一个字段，`$2` 表示第二个字段，以此类推。是的，Awk 使用预定义的分隔符（默认为空格）将输入行分割为组成字段。第 9-15 行将猜测结果与随机数进行比较，打印适当的响应。如果猜对了，第 15 行就会从输入行处理管道中提前退出。

就这么简单！

考虑到 Awk 程序不同寻常的结构，代码片段会对特定的输入行配置做出反应，并处理数据，让我们看看另一种结构，看看过滤部分是如何工作的：

```
     1    BEGIN {
     2        srand(42)
     3        randomNumber = int(rand() * 100) + 1
     4        print "random number is",randomNumber
     5        printf "guess a number between 1 and 100\n"
     6    }
     7    int($0) &lt; randomNumber {
     8        printf "too low, try again: "
     9    }
    10    int($0) &gt; randomNumber {
    11        printf "too high, try again: "
    12    }
    13    int($0) == randomNumber {
    14        printf "that's right\n"
    15        exit
    16    }
```

第 1–6 行代码没有改变。但是现在我们看到第 7-9 行是当输入整数值小于随机数时执行的代码，第 10-12 行是当输入整数值大于随机数时执行的代码，第 13-16 行是两者相等时执行的代码。

这看起来“很酷但很奇怪” —— 例如，为什么我们会重复计算 `int($0)`？可以肯定的是，用这种方法来解决问题会很奇怪。但这些模式确实是分离条件处理的非常好的方式，因为它们可以使用正则表达式或 Awk 支持的任何其他结构。

为了完整起见，我们可以使用这些模式将普通的计算与只适用于特定环境的计算分离开来。下面是第三个版本：

```
     1    BEGIN {
     2        srand(42)
     3        randomNumber = int(rand() * 100) + 1
     4        print "random number is",randomNumber
     5        printf "guess a number between 1 and 100\n"
     6    }
     7    {
     8        guess = int($0)
     9    }
    10    guess &lt; randomNumber {
    11        printf "too low, try again: "
    12    }
    13    guess &gt; randomNumber {
    14        printf "too high, try again: "
    15    }
    16    guess == randomNumber {
    17        printf "that's right\n"
    18        exit
    19    }
```

认识到这一点，无论输入的是什么值，都需要将其转换为整数，因此我们创建了第 7-9 行来完成这一任务。现在第 10-12、13-15 和 16-19 行这三组代码，都是指已经定义好的变量 guess，而不是每次都对输入行进行转换。

让我们回到我们想要学习的东西列表:

  * 变量 —— 是的，Awk 有这些；我们可以推断出，输入数据以字符串形式输入，但在需要时可以转换为数值
  * 输入 —— Awk 只是通过它的“数据转换管道”的方式发送输入来读取数据
  * 输出 —— 我们已经使用了 Awk 的 `print` 和 `printf` 函数来将内容写入输出
  * 条件判断 —— 我们已经学习了 Awk 的 `if-then-else` 和对应特定输入行配置的输入过滤器
  * 循环 —— 嗯，想象一下！我们在这里不需要循环，这还是多亏了 Awk 采用的“数据转换管道”方法；循环“就这么发生了”。注意，用户可以通过向 Awk 发送一个文件结束信号（当使用 Linux 终端窗口时可通过快捷键 `CTRL-D`）来提前退出管道。

不需要循环来处理输入的重要性是非常值得的。Awk 能够长期保持存在的一个原因是 Awk 程序是紧凑的，而它们紧凑的一个原因是不需要从控制台或文件中读取的那些格式代码。

让我们运行下面这个程序：

```
$ awk -f guess.awk
random number is 25
guess a number between 1 and 100: 50
too high, try again: 30
too high, try again: 10
too low, try again: 25
that's right
$
```

我们没有涉及的一件事是注释。Awk 注释以 `#` 开头，以行尾结束。

### 总结

Awk 非常强大，这种“猜数字”游戏是入门的好方法。但这不应该是你探索 Awk 的终点。你可以看看 [Awk 和 Gawk（GNU Awk）的历史][6]，Gawk 是 Awk 的扩展版本，如果你在电脑上运行 Linux，可能会有这个。或者，从它的原始开发者那里阅读关于 [最初版本][7] 的各种信息。

你还可以 [下载我们的备忘单][8] 来帮你记录下你所学的一切。

> **[Awk 备忘单][8]**

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/1/learn-awk

作者：[Chris Hermansen][a]
选题：[lujun9972][b]
译者：[FYJNEVERFOLLOWS](https://github.com/FYJNEVERFOLLOWS)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/clhermansen
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/question-mark_chalkboard.jpg?itok=DaG4tje9 (question mark in chalk)
[2]: https://opensource.com/article/20/12/julia
[3]: https://opensource.com/article/20/12/learn-bash
[4]: https://opensource.com/article/20/9/awk-ebook
[5]: https://en.wikipedia.org/wiki/42_(number)#The_Hitchhiker's_Guide_to_the_Galaxy
[6]: https://www.gnu.org/software/gawk/manual/html_node/History.html
[7]: https://archive.org/details/pdfy-MgN0H1joIoDVoIC7
[8]: https://opensource.com/downloads/cheat-sheet-awk-features

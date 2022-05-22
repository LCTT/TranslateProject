[#]: collector: (lujun9972)
[#]: translator: (unigeorge)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13849-1.html)
[#]: subject: (Learn Fortran by writing a "guess the number" game)
[#]: via: (https://opensource.com/article/21/1/fortran)
[#]: author: (Jim Hall https://opensource.com/users/jim-hall)

通过写“猜数字”游戏学习 Fortran
======

> Fortran 是在打孔卡时代编写的语言，因此它的语法非常有限。但你仍然可以用它编写有用和有趣的程序。

![](https://img.linux.net.cn/data/attachment/album/202110/04/125311k6uwzpybabayyoag.jpg)

Fortran 77 是我学习的第一门编译型编程语言。一开始时，我自学了如何在 Apple II 上用 BASIC 编写程序，后来又学会在 DOS 上用 QBasic 编写程序。但是当我去大学攻读物理学时，我又学习了 [Fortran][2]。

Fortran 曾经在科学计算中很常见。曾几何时，所有计算机系统都有一个 Fortran 编译器。Fortran 曾经像今天的 Python 一样无处不在。因此，如果你是像我这样的物理学专业学生，在 1990 年代工作，那你肯定学习了 Fortran。 

我一直认为 Fortran 与 BASIC 有点相似，所以每当我需要编写一个简短程序，来分析实验室数据或执行其他一些数值分析时，我都会很快想到 Fortran。我在空闲时用 Fortran 编写了一个“猜数字”游戏，其中计算机会在 1 到 100 之间选择一个数字，并让我猜这个数字。程序会一直循环，直到我猜对了为止。 

“猜数字”程序练习了编程语言中的几个概念：如何为变量赋值、如何编写语句以及如何执行条件判断和循环。这是学习新编程语言时一个很好的的实践案例。 

### Fortran 编程基础

虽然 Fortran 这些年来一直在更新，但我最熟悉的还是 Fortran 77，这是我多年前学习的实现版本。Fortran 是程序员还在打孔卡上编程的年代创建的，因此“经典” Fortran 仅限于处理可以放在打孔卡上的数据。这意味着你只能编写符合以下限制条件的经典 Fortran 程序（LCTT 译注：后来的 Fortran 95 等版本已经对这些限制做了很大的改进，如有兴趣**建议直接学习新版**）： 

  * 每张卡只允许一行源代码。
  * 仅识别第 1-72 列（最后八列，73-80，保留给卡片分类器）。
  * 行号（“标签”）位于第 1-5 列。
  * 程序语句在第 7-72 列。
  * 要表示跨行，请在第 6 列中输入一个连续字符（通常是 `+`）。
  * 要创建注释行，请在第 1 列中输入 `C` 或 `*`。
  * 只有字符 `A` 到`Z`（大写字母）、`0` 到`9`（数字）和特殊字符 `= + - * / ( ) , . $ ' :` 和空格能够使用。

虽然有这些限制，你仍然可以编写非常有用和有趣的程序。 

### 在 Fortran 中猜数字

通过编写“猜数字”游戏来探索 Fortran。这是我的实现代码：

```
CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
C     PROGRAM TO GUESS A NUMBER 1-100
CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
      PROGRAM GUESSNUM
      INTEGER SEED, NUMBER, GUESS

      PRINT *, 'ENTER A RANDOM NUMBER SEED'
      READ *, SEED
      CALL SRAND(SEED)

      NUMBER = INT( RAND(0) * 100 + 1 )

      PRINT *, 'GUESS A NUMBER BETWEEN 1 AND 100'
 10   READ *, GUESS

      IF (GUESS.LT.NUMBER) THEN
         PRINT *, 'TOO LOW'
      ELSE IF (GUESS.GT.NUMBER) THEN
         PRINT *, 'TOO HIGH'
      ENDIF

      IF (GUESS.NE.NUMBER) GOTO 10

      PRINT *, 'THATS RIGHT!'
      END
```

如果你熟悉其他编程语言，你大概可以通过阅读源代码来弄清楚这个程序在做什么。前三行是注释块，表示程序的功能。第四行 `PROGRAM GUESSNUM` 将其标识为一个 <ruby><rb>程序</rb><rt>program</rt></ruby>，并由最后一行的 `END` 语句关闭。 

定义变量后，程序会提示用户输入随机数种子。Fortran 程序无法从操作系统初始化随机数生成器，因此你必须始终使用“种子”值和 `SRAND` <ruby><rb>子程序</rb><rt>subroutine</rt></ruby> 启动随机数生成器。 

Fortran 使用 `RAND(0)` 函数生成 0 到 0.999…… 之间的随机数。参数 `0` 告诉 `RAND` 函数生成一个随机数。将此随机数乘以 100 以生成 0 到 99.999…… 之间的数字，然后加 1 得到 1 到 100.999…… 之间的值。`INT` 函数将结果截断为整数；因此，变量 `NUMBER` 就是一个介于 1 到 100 之间的随机数。 

程序会给出提示，然后进入一个循环。Fortran 不支持更现代的编程语言中可用的 `while` 或 `do-while` 循环（LCTT 译注：Fortran 95 等新版支持，也因此在一定程度上减少了 `GOTO` 的使用）。相反，你必须使用标签（行号）和 `GOTO` 语句来构建自己的循环。这就是 `READ` 语句有一个行号的原因：你可以在循环末尾使用 `GOTO` 跳转到此标签。

穿孔卡片没有 `<`（小于）和 `>`（大于）符号，因此 Fortran 采用了另一种语法来进行值比较。要测试一个值是否小于另一个值，请使用 `.LT.`（小于）。要测试一个值是否大于另一个值，请使用 `.GT.`（大于）。等于和不等于分别是 `.EQ.` 和 `.NE.`。 

在每次循环中，程序都会验证用户的猜测值。如果用户的猜测值小于随机数，程序打印 `TOO LOW`，如果猜测大于随机数，程序打印 `TOO HIGH`。循环会一直持续，直到用户的猜测值等于目标随机数为止。 

当循环退出时，程序打印 `THATS RIGHT!` 并立即结束运行。 

```
$ gfortran -Wall -o guess guess.f

$ ./guess
 ENTER A RANDOM NUMBER SEED
93759
 GUESS A NUMBER BETWEEN 1 AND 100
50
 TOO LOW
80
 TOO HIGH
60
 TOO LOW
70
 TOO LOW
75
 TOO HIGH
73
 TOO LOW
74
 THATS RIGHT!
```

每次运行程序时，用户都需要输入不同的随机数种子。如果你总是输入相同的种子，程序给出的随机数也会一直不变。

### 在其他语言中尝试 

在学习一门新的编程语言时，这个“猜数字”游戏是一个很好的入门程序，因为它以非常简单的方式练习了几个常见的编程概念。通过用不同的编程语言实现这个简单的游戏，你可以弄清一些核心概念以及比较每种语言的细节。

你有最喜欢的编程语言吗？如何用你最喜欢的语言来编写“猜数字”游戏？跟随本系列文章来查看你可能感兴趣的其他编程语言示例吧。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/1/fortran

作者：[Jim Hall][a]
选题：[lujun9972][b]
译者：[unigeorge](https://github.com/unigeorge)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jim-hall
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/1980s-computer-yearbook.png?itok=eGOYEKK- (Person typing on a 1980's computer)
[2]: https://en.wikipedia.org/wiki/Fortran

[#]: subject: "Learn the Lisp programming language in 2021"
[#]: via: "https://opensource.com/article/21/5/learn-lisp"
[#]: author: "Seth Kenlon https://opensource.com/users/seth"
[#]: collector: "lkxed"
[#]: translator: "lkxed"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

一起来学习 Lisp 编程语言吧！
======
许多大型代码库中都有 Lisp 代码的身影，因此，熟悉一下这门语言是一个明智之举。

![科技和计算领域的女性][1]

图源：kris krüg

Lisp 在 1958 年就被发明出来了，它是世界上第二老的计算机编程语言（LCTT 译注：最老的是 Fortran，诞生于 1957 年）。它有许多现代的衍生品，包括 Common Lisp、Emacs Lisp（Elisp）、Clojure、Racket、Scheme、Fennel 和 GNU Guile 等。

那些喜欢思考编程语言设计的人，往往都喜欢 Lisp，因为它的语法和数据有者相同的结构：Lisp 代码实际上是<ruby>一个列表的列表<rt>a list of lists</rt></ruby>，它的名字其实是 <ruby>“列表处理”<rt>LISt Processing</rt></ruby> 的首字母缩写。那些喜欢思考编程语言美学的人，往往都讨厌 Lisp，因为它经常使用括号来定义范围；事实上，编程界也有一个广为流传的笑话：Lisp 代表的其实是 <ruby>“大量烦人的多余括号”<rt>Lots of Irritating Superfluous Parentheses</rt></ruby>。

不管你是喜欢还是讨厌 Lisp 的设计哲学，你都不得不承认，它都是一门有趣的语言，过去如此，现在亦然（这得归功于现代方言 Clojure 和 Guile）。你可能会感到惊讶，但事实就是，Lisp 在任何行业的大型代码库中都占有一席之地。因此，现在开始学习 Lisp，至少熟悉一下它，不失为一个好主意。

### 安装 Lisp

Lisp 有很多不同的实现。比较流行的开源版本有 [SBCL][2]、[GNU Lisp][3] 和 [GNU Common Lisp][4]（GCL）。你可以使用发行版的包管理器安装它们中的任意一个，在本文中，我是用的是 `clisp`（LCTT 译注：也就是 GNU Lisp，一种 ANSI Common Lisp 的实现）。

以下是在不同的 Linux 发行版中安装 `clisp` 的步骤。

在 Fedora Linux 上，使用 `dnf`：

```
$ sudo dnf install clisp
```

在 Debian 上，使用 `apt`：

```
$ sudo apt install clisp
```

在 macOS 上，使用 [MacPorts][5] 或者 [Homebrew][6]：

```
# 使用 MacPorts
$ sudo port install clisp

# 使用 Homebrew
$ brew install clisp
```

在 Windows 上，你可以使用 [clisp on Cygwin][7] 或者从 [gnu.org/software/gcl][8] 上下载 GCL 的二进制文件。

虽然我使用 `clisp` 命令来运行 Lisp 代码，但是本文中涉及到的大多数语法规则，对任何 Lisp 实现都是适用的。如果你选择使用一个不同的 Lisp 实现，除了用来运行 Lisp 代码的命令会和我不一样外（比如，你可能要用 `gcl` 或 `sbcl` 而不是 `clisp`），其它的所有东西都是相同的。

### 列表处理

Lisp 源代码的基本单元是 <ruby>“表达式”<rt>expression</rt></ruby>，它在形式上是一个列表。举个例子，下面就是一个列表，它由一个操作符（`+`）和两个整数（`1` 和 `2`）组成的：

```
(+ 1 2)
```

同时，它也是一个 Lisp 表达式，内容是一个符号（`+`，会被解析成一个加法函数）和它的两个参数（`1` 和 `2`）。你可以在 Common Lisp 的交互式环境（即 REPL）中运行该表达式和其它表达式。如果你熟悉 Python 的 IDLE，那么你应该会对 Lisp 的 REPL 感到亲切。（LCTT 译注：REPL 的全称是 “Read-Eval-Print Loop”，意思是 “‘读取-求值-输出’循环”，这个名字很好地描述了它的工作过程。）

要进入到 REPL 中，只需运行 Common Lisp 即可：

```
$ clisp
[1]>
```

在 REPL 提示符中，尝试输入一些表达式：

```
[1]> (+ 1 2)
3
[2]> (- 1 2)
-1
[3]> (- 2 1)
1
[4]> (+ 2 3 4)
9
```

### 函数

在了解了 Lisp 表达式的基本结构后，你可以使用函数来做更多有用的事。譬如，`print` 函数可以接受任意数量的参数，然后把它们都显示在你的终端上，`pprint` 函数还可以实现格式化打印。还有更多不同的打印函数，不过，`pprint` 在 REPL 中的效果还挺好的：

```
[1]> (pprint "hello world")

"hello world"

[2]>
```

你可以使用 `defun` 函数来创建一个自定义函数。`defun` 函数需要你提供自定义函数的名称，以及它接受的参数列表：

```
[1]> (defun myprinter (s) (pprint s))
MYPRINTER
[2]> (myprinter "hello world")

"hello world"

[3]>
```

### 变量

你可以使用 `setf` 函数来在 Lisp 中创建变量：

```
[1]> (setf foo "hello world")
"hello world"
[2]> (pprint foo)

"hello world"

[3]>
```

你可以往表达式里嵌套表达式（就像使用某种管道一样）。举个例子，你可以先使用 `string-upcase` 函数，把某个字符串的所有字符转换成大写，然后再使用 `pprint` 函数，将它的内容格式化打印到终端上：

```
[3]> (pprint (string-upcase foo))

"HELLO WORLD"

[4]>
```

Lisp 是动态类型语言，这意味着，你在给变量赋值时不需要声明它的类型。Lisp 默认会把整数当作整数来处理：

```
[1]> (setf foo 2)
[2]> (setf bar 3)
[3]> (+ foo bar)
5
```

如果你想让整数被当作字符串来处理，你可以给它加上引号：


```
[4]> (setf foo "2")
"2"
[5]> (setf bar "3")
"3"
[6]> (+ foo bar)

*** - +: "2" is not a number
The following restarts are available:
USE-VALUE      :R1      Input a value to be used instead.
ABORT          :R2      Abort main loop
Break 1 [7]>
```

在这个示例 REPL 会话中，变量 `foo` 和 `bar` 都被赋值为加了引号的数字，因此，Lisp 会把它们当作字符串来处理。数学运算符不能够用在字符串上，因此 REPL 进入了调试器模式。想要跳出这个调试器，你需要按下 `Ctrl+D` 才行（LCTT 译注：就 `clisp` 而言，使用 `quit` 关键字也可以退出）。

你可以使用 `typep` 函数对一些对象进行类型检查，它可以测试对象是否为某个特定数据类型。返回值 `T` 和 `NIL` 分别代表 `True` 和 `False`。

```
[4]> (typep foo 'string)
NIL
[5]> (typep foo 'integer)
T
```

`string` 和 `integer` 前面加上了一个单引号（`'`），这是为了防止 Lisp（错误地）把这两个单词当作是变量来求值：

```
[6]> (typep foo string)
*** - SYSTEM::READ-EVAL-PRINT: variable STRING has no value
[...]
```

这是一种保护某些术语（LCTT 译注：类似于字符串转义）的简便方法，正常情况下它是用 `quote` 函数来实现的：

```
[7]> (typep foo (quote string))
NIL
[5]> (typep foo (quote integer))
T
```

### 列表

不出人意料，你当然也可以在 Lisp 中创建列表：

```
[1]> (setf foo (list "hello" "world"))
("hello" "world")
```

你可以使用 `nth` 函数来索引列表：

```
[2]> (nth 0 foo)
"hello"
[3]> (pprint (string-capitalize (nth 1 foo)))

"World"
```

### 退出 REPL

要结束一个 REPL 会话，你需要按下键盘上的 `Ctrl+D`，或者是使用 Lisp 的 `quit` 关键字： 

```
[99]> (quit)
$
```

### 编写脚本

Lisp 可以被编译，也可以作为解释型的脚本语言来使用。在你刚开始学习的时候，后者很可能是最容易的选项，特别是当你已经熟悉 Python 或 [Shell 脚本][9] 时。

下面是一个用 Common Lisp 编写的简单的“掷骰子”脚本：

```
#!/usr/bin/clisp

(defun roller (num)  
  (pprint (random (parse-integer (nth 0 num))))
)

(setf userput *args*)
(setf *random-state* (make-random-state t))
(roller userput)
```

脚本的第一行注释告诉了你的 POSIX 终端，该使用什么可执行文件来运行这个脚本。

`roller` 函数使用 `defun` 函数创建，它在内部使用 `random` 函数来打印一个伪随机数，这个伪随机数严格小于 `num` 列表中下标为 0 的元素。在脚本中，这个 `num` 列表还没有被创建，不过没关系，因为只有当脚本被调用时，函数才会执行。

接下来的那一行，我们把运行脚本时提供的任意参数，都赋值给一个叫做 `userput` 的变量。这个 `userput` 变量是一个列表，当它被传递给 `roller` 函数后，它就会变成参数 `num`。

脚本的倒数第二行产生了一个“随机种子”。这为 Lisp 提供了足够的随机性来生成一个几乎随机的数字。

最后一行调用了自定义的 `roller` 函数，并将 `userput` 列表作为唯一的参数传递给它。

将这个文件保存为 `dice.lisp`，并赋予它可执行权限：

```
$ chmod +x dice.lisp
```

最后，运行它，并给它提供一个数字，以作为它选择随机数的最大值：

```
$ ./dice.lisp 21

13
$ ./dice.lisp 21

7
$ ./dice.lisp 21

20
```

看起来还不错！

你或许注意到，你的模拟骰子有可能会是 0，并且永远达不到你提供给它的最大值参数。换句话说，对于一个 20 面的骰子，这个脚本永远投不出 20（除非你把 0 当作 20）。有一个简单的解决办法，它只需要用到在本文中介绍的知识，你能够想到吗？

### 学习 Lisp

无论你是想将 Lisp 作为个人脚本的实用语言，还是为了助力你的职业生涯，抑或是仅仅作为一个有趣的实验，你都可以去看看一年一度（LCTT 译注：应该是两年一度）的 [Lisp <ruby>游戏果酱<rt>Game Jam</rt></ruby>][11]，从而收获一些特别有创意的用途（其中的大多数提交都是开源的，因此你可以查看代码以从中学习）。

Lisp 是一门有趣而独特的语言，它有着不断增长的开发者用户群、足够悠久的历史和新兴的方言，因此，它有能力让从事各个行业的程序员都满意。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/5/learn-lisp

作者：[Seth Kenlon][a]
选题：[lkxed][b]
译者：[lkxed](https://github.com/lkxed)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lkxed
[1]: https://opensource.com/sites/default/files/lead-images/OSDC_women_computing_4.png
[2]: http://sbcl.org
[3]: http://clisp.org
[4]: https://www.gnu.org/software/gcl/
[5]: https://opensource.com/article/20/11/macports
[6]: https://opensource.com/article/20/6/homebrew-linux
[7]: https://cygwin.fandom.com/wiki/Clisp
[8]: http://mirror.lagoon.nc/gnu/gcl/binaries/stable
[9]: https://opensource.com/article/20/4/bash-programming-guide
[10]: https://opensource.com/article/19/7/what-posix-richard-stallman-explains
[11]: https://itch.io/jam/spring-lisp-game-jam-2021

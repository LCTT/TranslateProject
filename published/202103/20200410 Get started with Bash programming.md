[#]: collector: (lujun9972)
[#]: translator: (stevenzdg988)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13210-1.html)
[#]: subject: (Get started with Bash programming)
[#]: via: (https://opensource.com/article/20/4/bash-programming-guide)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

如何入门 Bash 编程
======

> 了解如何在 Bash 中编写定制程序以自动执行重复性操作任务。

![](https://img.linux.net.cn/data/attachment/album/202103/17/110745ctcuzcnt0dv0toi7.jpg)

Unix 最初的希望之一是，让计算机的日常用户能够微调其计算机，以适应其独特的工作风格。几十年来，人们对计算机定制的期望已经降低，许多用户认为他们的应用程序和网站的集合就是他们的 “定制环境”。原因之一是许多操作系统的组件未不开源，普通用户无法使用其源代码。

但是对于 Linux 用户而言，定制程序是可以实现的，因为整个系统都围绕着可通过终端使用的命令啦进行的。终端不仅是用于快速命令或深入排除故障的界面；也是一个脚本环境，可以通过为你处理日常任务来减少你的工作量。

### 如何学习编程

如果你以前从未进行过任何编程，可能面临考虑两个不同的挑战：一个是了解怎样编写代码，另一个是了解要编写什么代码。你可以学习 _语法_，但是如果你不知道 _语言_ 中有哪些可用的关键字，你将无法继续。在实践中，要同时开始学习这两个概念，是因为如果没有关键字的堆砌就无法学习语法，因此，最初你要使用基本命令和基本编程结构来编写简单的任务。一旦熟悉了基础知识，就可以探索更多编程语言的内容，从而使你的程序能够做越来越重要的事情。

在 [Bash][2] 中，你使用的大多数 _关键字_ 是 Linux 命令。 _语法_ 就是 Bash。如果你已经频繁地使用过了 Bash，则向 Bash 编程的过渡相对容易。但是，如果你不曾使用过 Bash，你会很高兴地了解到它是一种为清晰和简单而构建的简单语言。

### 交互设计

有时，学习编程时最难搞清楚的事情就是计算机可以为你做些什么。显然，如果一台计算机可以自己完成你要做的所有操作，那么你就不必再碰计算机了。但是现实是，人类很重要。找到你的计算机可以帮助你的事情的关键是注意到你一周内需要重复执行的任务。计算机特别擅长于重复的任务。

但是，为了能告知计算机为你做某事，你必须知道怎么做。这就是 Bash 擅长的领域：交互式编程。在终端中执行一个动作时，你也在学习如何编写脚本。

例如，我曾经负责将大量 PDF 书籍转换为低墨和友好打印的版本。一种方法是在 PDF 编辑器中打开 PDF，从数百张图像（页面背景和纹理都算作图像）中选择每张图像，删除它们，然后将其保存到新的 PDF中。仅仅是一本书，这样就需要半天时间。

我的第一个想法是学习如何编写 PDF 编辑器脚本，但是经过数天的研究，我找不到可以编写编辑 PDF 应用程序的脚本（除了非常丑陋的鼠标自动化技巧）。因此，我将注意力转向了从终端内找出完成任务的方法。这让我有了几个新发现，包括 GhostScript，它是 PostScript 的开源版本（PDF 基于的打印机语言）。通过使用 GhostScript 处理了几天的任务，我确认这是解决我的问题的方法。

编写基本的脚本来运行命令，只不过是复制我用来从 PDF 中删除图像的命令和选项，并将其粘贴到文本文件中而已。将这个文件作为脚本运行，大概也会产生同样的结果。

### 向 Bash 脚本传参数

在终端中运行命令与在 Shell 脚本中运行命令之间的区别在于前者是交互式的。在终端中，你可以随时进行调整。例如，如果我刚刚处理 `example_1.pdf` 并准备处理下一个文档，以适应我的命令，则只需要更改文件名即可。

Shell 脚本不是交互式的。实际上，Shell _脚本_ 存在的唯一原因是让你不必亲自参与。这就是为什么命令（以及运行它们的 Shell 脚本）会接受参数的原因。

在 Shell 脚本中，有一些预定义的可以反映脚本启动方式的变量。初始变量是 `$0`，它代表了启动脚本的命令。下一个变量是 `$1` ，它表示传递给 Shell 脚本的第一个 “参数”。例如，在命令 `echo hello` 中，命令 `echo` 为 `$0,`，关键字 `hello` 为 `$1`，而 `world` 是 `$2`。

在 Shell 中交互如下所示：

```
$ echo hello world
hello world
```

在非交互式 Shell 脚本中，你 _可以_ 以非常直观的方式执行相同的操作。将此文本输入文本文件并将其另存为 `hello.sh`：

```
echo hello world
```

执行这个脚本：

```
$ bash hello.sh
hello world
```

同样可以，但是并没有利用脚本可以接受输入这一优势。将 `hello.sh` 更改为：

```
echo $1
```

用引号将两个参数组合在一起来运行脚本：

```
$ bash hello.sh "hello bash"
hello bash
```

对于我的 PDF 瘦身项目，我真的需要这种非交互性，因为每个 PDF 都花了几分钟来压缩。但是通过创建一个接受我的输入的脚本，我可以一次将几个 PDF 文件全部提交给脚本。该脚本按顺序处理了每个文件，这可能需要半小时或稍长一点时间，但是我可以用半小时来完成其他任务。

### 流程控制

创建 Bash 脚本是完全可以接受的，从本质上讲，这些脚本是你开始实现需要重复执行任务的准确过程的副本。但是，可以通过控制信息流的方式来使脚本更强大。管理脚本对数据响应的常用方法是：

  * `if`/`then` 选择结构语句
  * `for` 循环结构语句
  * `while` 循环结构语句
  * `case` 语句

计算机不是智能的，但是它们擅长比较和分析数据。如果你在脚本中构建一些数据分析，则脚本会变得更加智能。例如，基本的 `hello.sh` 脚本运行后不管有没有内容都会显示：

```
$ bash hello.sh foo
foo
$ bash hello.sh

$
```

如果在没有接收输入的情况下提供帮助消息，将会更加容易使用。如下是一个 `if`/`then` 语句，如果你以一种基本的方式使用 Bash，则你可能不知道 Bash 中存在这样的语句。但是编程的一部分是学习语言，通过一些研究，你将了解 `if/then` 语句：

```
if [ "$1" = "" ]; then
        echo "syntax: $0 WORD"
        echo "If you provide more than one word, enclose them in quotes."
else
        echo "$1"
fi
```

运行新版本的 `hello.sh` 输出如下：

```
$ bash hello.sh
syntax: hello.sh WORD
If you provide more than one word, enclose them in quotes.
$ bash hello.sh "hello world"
hello world
```

### 利用脚本工作

无论你是从 PDF 文件中查找要删除的图像，还是要管理混乱的下载文件夹，抑或要创建和提供 Kubernetes 镜像，学习编写 Bash 脚本都需要先使用 Bash，然后学习如何将这些脚本从仅仅是一个命令列表变成响应输入的东西。通常这是一个发现的过程：你一定会找到新的 Linux 命令来执行你从未想象过可以通过文本命令执行的任务，你会发现 Bash 的新功能，使你的脚本可以适应所有你希望它们运行的不同方式。

学习这些技巧的一种方法是阅读其他人的脚本。了解人们如何在其系统上自动化死板的命令。看看你熟悉的，并寻找那些陌生事物的更多信息。

另一种方法是下载我们的 [Bash 编程入门][3] 电子书。它向你介绍了特定于 Bash 的编程概念，并且通过学习的构造，你可以开始构建自己的命令。当然，它是免费的，并根据 [创作共用许可证][4] 进行下载和分发授权，所以今天就来获取它吧。

- [下载我们介绍用 Bash 编程的电子书！][3]

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/4/bash-programming-guide

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[stevenzdg988](https://github.com/stevenzdg988)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/command_line_prompt.png?itok=wbGiJ_yg (Command line prompt)
[2]: https://opensource.com/resources/what-bash
[3]: https://opensource.com/downloads/bash-programming-guide
[4]: https://opensource.com/article/20/1/what-creative-commons

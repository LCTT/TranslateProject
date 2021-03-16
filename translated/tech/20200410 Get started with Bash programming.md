[#]: collector: (lujun9972)
[#]: translator: (stevenzdg988)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Get started with Bash programming)
[#]: via: (https://opensource.com/article/20/4/bash-programming-guide)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

开始使用 Bash 编程
======
了解如何在 Bash 中编写定制程序以自动执行重复性操作任务。下载我们的新电子书以开始使用。
![命令行提示符][1]

对 Unix 的最初希望之一是授权给日常的计算机用户能够调整其计算机以适应其独特的工作风格。在过去的几十年中，对计算机定制的期望已经降低，许多用户考虑将他们收集的应用程序和网站作为他们的 “定制环境”。 原因之一是许多操作系统的组件未打开，因此普通用户无法使用其源代码。

但是对于Linux用户而言，定制程序是可以实现的，因为整个系统都基于可通过终端获得的命令。终端不仅是用于快速命令或彻底排除故障的接口；也是一个脚本环境，可以通过为您处理日常任务来减少您的工作量。

### 如何学习编程

如果您以前从未进行过任何编程，可能面临考虑两个不同的挑战：一个是了解怎样编写代码，另一个是了解编写的代码是什么。您可以学习 _语法_，但是如果您不知道 _语言_ 中有哪些可用的关键字，您将无法继续。在实践中，同时开始学习这两个概念，是因为如果没有关键字的整理就无法学习语法，因此，最初您将使用基础命令和基础编程结构编写简单的任务。一旦熟悉基础，就可以探索更多编程语言的内容，从而使您的程序能够做越来越重要的事情。

在 [Bash][2] 中，您使用的大多数 _关键字_ 是 Linux 命令。 _syntax_ 是 Bash。如果您已经频繁使用 Bash，则向 Bash 编程的过渡相对容易。但是，如果您不曾使用过 Bash，您会很高兴地学习到它是为清晰和简单而构建的简单语言。

### 交互设计

有时，学习编程时最难解决的事情就是计算机可以为您做些什么。显然，如果一台计算机可以自己完成你要做的所有操作，那么您就不必再触摸计算机了。但是现实是人类很重要。找到您的计算机可以帮助您的事情的关键是通知整个星期重复执行的任务。计算机对重复的处理特别好。

但是，为了能让(告诉)计算机为你做某事(执行某项操作)，您必须知道怎么做。这是 Bash 擅长的领域：交互式编程。在终端中执行(命令)时，您还将学习如何编写脚本。

例如，我曾经负责将大量 PDF 书籍转换为低墨和友好打印的版本。一种方法是在 PDF 编辑器中打开 PDF ，从数百张图像（算作图像的页面背景和纹理）中选择每张图像，然后删除它们，然后将其保存到新的PDF中。这样一本书只需要半天。从数百张图像中选择每张图像-页面背景和纹理记做图像-删除它们，然后将其保存到一个新的 PDF 文件中。这样一本书就要花半天时间。

我的第一个想法是学习如何编写 PDF 编辑器脚本，但是经过数天的研究，我找不到可以编写编辑 PDF 应用程序的脚本（鼠标自动化的外部技巧）。因此，我将注意力转向了从终端内部找出完成任务的方法。这导致了几个新发现，包括 GhostScript，PostScript 的开源版本（基于 PDF 的打印机语言）。通过使用 GhostScript 处理了几天的任务，我确认这是解决我的问题的方法。

制定基本的脚本来运行命令仅仅是关于复制命令和我用来从 PDF 中删除图像并将其粘贴到文本文件中的选项的问题。据推测，将文件作为脚本运行会产生相同的结果。

### 向 Bash 脚本传参数

在终端中运行命令与在 Shell 脚本中运行命令之间的区别在于前者是交互式的。在终端中，您可以随时进行调整。例如，如果我刚刚处理 **example_1.pdf** 并准备处理下一个文档，以适应我的命令，则只需要更改文件名即可。

Shell 脚本不是交互式的。实际上，Shell _脚本_ 存在的唯一原因是不必亲自参与。这就是为什么命令（以及运行它们的 Shell 脚本）接受参数的原因。

在 Shell 脚本中，有一些预定义的可以反映脚本启动方式的变量。初始变量是 **$0**，它代表发出的启动脚本的命令。下一个变量是 **$1** ，它表示传递给 Shell 脚本的第一个 “参数”。例如，在命令 **echo hello** 中，命令 **echo** 为 **$0,**，关键字 **hello** 为 **$1**。在命令 **echo hello world** 中，命令 **echo** 为 **$0,**，关键字 **hello** 为 **$1**，而 **world** 是 **$2**。

在 Shell 中交互如下所示：

```
$ echo hello world
hello world
```

在非交互式 Shell 脚本中，您 _可以_ 以非常直观的方式执行相同的操作。将此文本输入文本文件并将其另存为**hello.sh**：

```
`echo hello world`
```

执行这个脚本：

```
$ bash hello.sh
hello world
```

同样可以，但是并没有利用脚本可以接受输入这一优势。将 **hello.sh** 更改为：

```
`echo $1`
```

运行带有用引号将两个参数组合在一起的脚本：

```
$ bash hello.sh "hello bash"
hello bash
```

对于我的 PDF 缩减项目，我真的需要这种非交互性，因为每个 PDF 都花了几分钟来压缩。但是通过创建一个接受我的输入的脚本，我可以一次将几个 PDF 文件全部提交给脚本。该脚本按顺序处理了每个文件，这可能需要半小时或稍长一点时间，但是我可以用半小时来完成其他任务。

### 流控制

创建 Bash 脚本是完全可以接受的，从本质上讲，是你开始实现需要重复执行任务的准确过程的副本。但是，可以通过控制信息流的方式来使脚本更强大。管理脚本对数据响应的常用方法是：

  * if/then 选择结构语句
  * for 循环结构语句
  * while 循环结构语句
  * case 语句

计算机不是智能的，但是它们擅长比较和分析数据。如果您在脚本中构建一些数据分析，则脚本会变得更加智能。例如，基本的 **hello.sh** 脚本运行后不管有没有内容都会显示：

```
$ bash hello.sh foo
foo
$ bash hello.sh

$
```

如果在没有接收输入的情况下提供帮助消息，将会更加容易使用。如下是一个 `if/then` 语句，如果您以一种基本的方式使用 Bash，则您可能不知道 Bash 中存在这样的语句。但是编程的一部分是学习语言，通过一些研究，您将了解 `if/then` 语句：

```
if [ "$1" = "" ]; then
        echo "syntax: $0 WORD"
        echo "If you provide more than one word, enclose them in quotes."
else
        echo "$1"
fi
```

运行新版本的 **hello.sh** 输出如下：

```
$ bash hello.sh
syntax: hello.sh WORD
If you provide more than one word, enclose them in quotes.
$ bash hello.sh "hello world"
hello world
```

### 利用脚本工作

无论您从PDF文件中查找要删除的图像，还是要管理混乱的 Downloads (下载)文件夹，还是要创建和提供 Kubernetes 镜像，学习编写 Bash 脚本都需要先使用 Bash，然后再学习采用这些从命令列表到响应输入内容的脚本的方法。通常这是一个发现的过程：您一定会找到新的 Linux 命令来执行您无法想象的可以通过文本命令执行的任务，并且您将找到 Bash 的新功能以使您的脚本适应您想要的所有不同方式来执行。

学习这些技巧的一种方法是阅读其他人的脚本。了解人们如何在其系统上自动化死记硬背的命令。查看您熟悉的，并查找有关陌生事物的更多信息。

另一种方法是下载我们的 [Bash 编程入门][3] 电子书。它向您介绍了特定于 Bash 的编程概念，并且通过学习的构造，您可以开始构建自己的命令。当然，它是免费的，并根据 [创建共享][4] 许可证进行下载和分发许可，因此，请立即获取副本。

### [下载我们介绍利用 Bash 编程的电子书！][3]

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/4/bash-programming-guide

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[stevenzdg988](https://github.com/stevenzdg988)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/command_line_prompt.png?itok=wbGiJ_yg (Command line prompt)
[2]: https://opensource.com/resources/what-bash
[3]: https://opensource.com/downloads/bash-programming-guide
[4]: https://opensource.com/article/20/1/what-creative-commons

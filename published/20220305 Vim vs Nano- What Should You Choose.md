[#]: subject: "Vim vs Nano: What Should You Choose?"
[#]: via: "https://itsfoss.com/vim-vs-nano/"
[#]: author: "Pratham Patel https://itsfoss.com/author/pratham/"
[#]: collector: "lujun9972"
[#]: translator: "wxy"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14328-1.html"

Vim 与 nano：你应该选择哪个？
======

我们需要利用文本编辑器来做笔记、写程序，或者编辑系统配置文件来完成一些事情。

不管你用来做什么，你的 Linux 发行版已经预装了文本编辑器。

你很可能会注意到一些 [最好的现代文本编辑器][1]，如 Gedit、Geany、Kate 等，它们已经预装在你的 Linux 发行版中。然而，这些都是基于 GUI 的程序。

如果你想通过终端访问文本编辑器怎么办？你应该发现它也内置在你的 Linux 发行版中了。

![][2]

Vim 和 nano 是最流行的 [CLI 文本编辑器][3] 之二。

但是，是什么让它们如此受欢迎？你应该选择哪个作为你的文本编辑器？让我指出一下 Vim 和 nano 的区别，以帮助你决定。

### 1、基于终端的编辑器介绍

nano 和 Vim 都提供了大部分的基本功能。虽然 nano 在大多数 Linux 发行版上是内置的，但你必须手动安装 Vim。

为了比较这两者，让我给你简单介绍一下这两者。

#### Vim

![][4]

Vim 是 “Vi” 文本编辑器的改进版，开发于 1991 年。Vim 是 “<ruby>Vi 改进版<rt>Vi IMproved</rt></ruby>” 的意思。

Vi 是一个基于终端的文本编辑器，最初于 1976 年为 Unix 操作系统而开发。Vim 是它的一个具有现代功能的增强版。

考虑到它的各种功能可以帮助编辑程序文件，它也被称为“程序员的文本编辑器”。虽然它提供了一些高级功能，但你也可以用来编辑纯文本文件。

#### GNU nano

![][5]

GNU nano（我们在文章中称它为 “nano”）是一个简单的基于终端的文本编辑器，其灵感来自于 Pico —— 这个基于 Unix 的文本编辑器是华盛顿大学 1989 年开发的 Pine 电子邮件套件的一部分。

Pico 文本编辑器没有 GPL（许可证），这使得它很难被纳入 Linux 发行版。

因此，nano 被开发出来作为它的自由软件替代品。nano 编辑器最初被称为 “tip”，然后在 Richard Stallman 宣布它成为正式的 GNU 程序之前重新命名为 nano。

这个编辑器的亮点是它的易用性和极小的学习曲线。你不一定需要成为程序员才能使用 nano。

### 2、功能差异

下面是 Vim 和 nano 的主要功能差异：

#### Vim 的主要特点

  * 多级撤销
  * 语法高亮
  * 命令行编辑
  * 文件名补完
  * 多窗口和缓冲区
  * 折叠
  * 会话
  * 支持宏

#### nano 的主要特点

  * 打开多个文件
  * 逐行滚动
  * 撤销/重做
  * 语法着色
  * 行号

请注意，一般来说，Vim 提供了更高级的功能。然而，它们都提供了编辑系统配置文件、编程和文本编辑等基本功能。

### 3、用作文本编辑器

在 Vim 或 nano 中打开一个文件很简单，只要输入你想使用的编辑器的名字，然后再输入文件的路径。路径可以是文件的绝对路径，也可以是文件的相对路径。

```
vim Documents/text.txt
```

``` 
nano Documents/text.txt
```

但是，除了用作文本编辑器访问或打开一个文件之外，还有很多功能，对吗？

如果你想快速比较一下，这里有一些基于我的使用情况的比较点：

Vim：

  * 模式驱动的编辑器
  * 在开始时有巨大的学习曲线
  * 会话恢复
  * 语法高亮/着色
  * 提供高级功能

nano：

  * 易于使用（经常使用的功能及其组合键列在底部）
  * 不存在学习曲线
  * 旨在进行快速编辑

nano 和 Vim 的主要区别在于，它们的目标受众非常不同。

#### Vim

Vim 是一个模式驱动的编辑器。这意味着字母、数字和标点符号键在按下时都要做一件独特的事情，而不是在屏幕上打出一个字符。

这些模式包括：

  * 正常模式
  * 视觉模式
  * 插入模式
  * 命令行命令
  * 命令行编辑

默认情况下，当你启动 Vim 时，它以 **正常** 模式打开。每个键都有其独特的功能，不会立即开始输入所按下的字符。

不管什么模式，如果你愿意，你也可以 [把 Vim 配置成一个写作工具][6]。

要知道更多关于这些有趣的事情，你可以参考我们关于 [基本 Vim 命令][7] 以及 [Vim 技巧和窍门][8] 的文章。

![当你启动 Vim（无参数）时的终端屏幕][9]

在正常模式下，按特定的键会移动你的光标。

例如，如果你按下 `l`（小写字母 L），它将把光标向右移动一个字符，按 `h` 键将把光标向左移动一个字符。

如果你想把光标向下移动一行，你就按 `j` 键，如果要把光标向上移动一行，你应该按 `k` 键。

在正常模式下 `l`、`k`、`j`、`h` 是导航键。虽然你可以用方向键来移动，但这样做更有效率。

这些是 Vim 中的基本导航键。

接下来最常用的键是 `w`、`b`、`e`：

  * 按 `w` 键可将光标移到下一个词。如果它已经在一个词的开头，它就会移动到下一个词的开头。
  * 按 `b` 键，光标会移到左边的词的开头。
  * 而 `e` 键，则将光标移到右边的词的末尾。

你甚至可以用这些键混合数字（作为前缀）。例如，按 `6w` 可以将光标向前（向右）移动六个词。

如果你想进入一个模式，你必须按类似的组合键：

  * `i` 为插入模式
  * `CTRL+C` 回到正常模式
  * `:wq` 写入文件并关闭窗口。

最后，我们已经 [列出了退出 Vim 的多种方法][10]，如果你想了解一下的话。

这只是冰山一角。要学习更多关于 Vim 的知识，你可以使用`vimtutor` 命令，它可以给你提供大多数基本命令的信息，如删除、编辑、保存文件等。

![][11]

#### GNU nano

nano 有一个基本的交互界面，在窗口的底部给你提供关键信息。

要想有个初步的了解，你可以参考我们的 [nano 编辑器指南][12]。

![Terminal screen when you launch nano \(without arguments\)] [13]

你不需要参考手册页或任何文档来执行基本操作。这就是为什么与 Vim 相比，nano 被认为是用户友好的。

尽管如此，nano 中使用的一些术语仍然是“旧术语”，一个例子是 “<ruby>写出<rt>Write Out</rt></ruby>”、“<ruby>在哪里<rt>Where Is</rt></ruby>”短语，而不是分别用“<ruby>保存<rt>Save</rt></ruby>”和“<ruby>查找<rt>Find</rt></ruby>”。

但是，这并不是什么大问题。

虽然很容易习惯，但它与使用记事本或 Gedit（GUI 程序）并不完全相同。

例如，在大多数现代编辑器中，执行剪切操作的组合键通常是 `Ctrl + X`，但在 nano 中，它是 `Ctrl + K`。

符号 `^` 是用来表示将 `Ctrl` 键作为修饰键使用，并与旁边的键组合使用。

你还可以找到像 `Ctrl + F`（将光标向前移动）、`Ctrl + B`（将光标向后移动）这样的组合键。一些快捷键包括：

  * `Ctrl + X` 退出
  * `Ctrl + O` 写入（或保存为）
  * `Alt + U` 撤销上一个动作
  * `Ctrl + ←` 向后退一个字
  * `Ctrl + →` 向前进一个字

你可以看看 [GNU nano 的官方速查表][14] 来学习更多的快捷键。

总的来说，nano 是一个更适合初学者的编辑器，当你只想偶尔编辑一个文件时，它可以简单地让你完成。

### 4、学习曲线

考虑到上面的所有信息，你一定已经意识到 Vim 与你所习惯的传统文本编辑器不同。

这是真的，这就是为什么 Vim 在学习的初始阶段会显得很艰难。

然而，对于高级用户来说，使用宏、自动补完等高级能力很重要，可以节省时间。

因此，如果你是一个程序员，或者碰巧经常编辑许多文件，Vim 的学习曲线可能是富有成效的。

另一方面，nano 提供了极小的学习曲线，而且感觉比基于图形用户界面的文本编辑器如 Gedit 或 Notepad 更让你熟悉。

### 哪个是最适合你的？

Vim 和 nano 都是合格的基于终端的文本编辑器。但是，当涉及到你如何与上述编辑器互动和使用时，它们有很大的不同。

Vim 很灵活，可以适应各种工作流程，前提是你已经习惯了它的工作方式。

相比之下，nano 工作起来很简单，可以帮助你编辑任何你想要的东西。

如果你还不确定，我建议先开始使用 nano。而且，如果你认为你需要更快地完成工作，并且想要更多的功能，那么就换成 Vim。

### 常见的问题

继续，让我来谈谈几个问题，这将有助于你获得一个良好的开端。

**Vim 比 nano 好吗？**

从技术上讲，是的。但是，如果你不需要它提供的所有功能，使用起来可能会感到力不从心。

**程序员是否使用 Vim？**

系统管理员和程序员喜欢 Vim 的高级功能。所以，是的，他们倾向于使用它。

**nano 是否更受欢迎？**

可以说是的。nano 是一个基于终端的编辑器，被大多数用户使用。此外，它还内置在大多数 Linux 发行版中。

因此，它在用户中普遍受欢迎，而 Vim 仍然是一个为特定人群服务的编辑器。

--------------------------------------------------------------------------------

via: https://itsfoss.com/vim-vs-nano/

作者：[Pratham Patel][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/pratham/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/best-modern-open-source-code-editors-for-linux/
[2]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2022/01/vim-vs-nano.png?resize=800%2C450&ssl=1
[3]: https://itsfoss.com/command-line-text-editors-linux/
[4]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/07/vim-screenshot.jpg?resize=800%2C520&ssl=1
[5]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/07/nano-editor-screenshot.jpg?resize=800%2C524&ssl=1
[6]: https://news.itsfoss.com/configuring-vim-writing/
[7]: https://linuxhandbook.com/basic-vim-commands/
[8]: https://itsfoss.com/pro-vim-tips/
[9]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2022/01/01_vim_interface.webp?resize=800%2C430&ssl=1
[10]: https://itsfoss.com/how-to-exit-vim/
[11]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2022/03/vimtutor.png?resize=777%2C519&ssl=1
[12]: https://itsfoss.com/nano-editor-guide/
[13]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2022/01/03_nano_interface.webp?resize=800%2C430&ssl=1
[14]: https://www.nano-editor.org/dist/latest/cheatsheet.html

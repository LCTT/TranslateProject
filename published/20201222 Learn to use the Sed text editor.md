[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12992-1.html)
[#]: subject: (Learn to use the Sed text editor)
[#]: via: (https://opensource.com/article/20/12/sed)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

学习使用 Sed 文本编辑器
======

> Sed 缺少通常的文本框，而是按照用户的命令直接写入到文件上。

![](https://img.linux.net.cn/data/attachment/album/202101/07/002353st8vgivu78yzp77v.jpg)

`sed` 命令是为 AT&T 最初的 Unix 操作系统第 7 版创建的，此后，可能每一个 Unix 和 Linux 操作系统都包含了它。`sed` 应用程序是一个 _流编辑器_，与文本编辑器不同的是，它不会打开一个视觉缓冲区，将文件的数据加载到其中进行处理。相反，它根据在终端输入的命令或脚本中的一系列命令，逐行对文件进行操作。

### 安装

如果你使用的是 Linux、BSD 或 macOS，那么你已经安装了 GNU 或 BSD 版的 `sed`。这是两个不同的原始 `sed` 命令的重新实现，虽然它们很相似，但也有一些小的区别。GNU `sed` 通常被认为是功能最丰富的 `sed`，而且它在这些平台上都可以广泛使用。

如果你找不到 GNU `sed`（在非 Linux 系统上通常被称为 `gsed`），那么你可以[从 GNU 网站上下载它的源代码][2]。安装 GNU `sed` 的好处是，可以使用它的额外功能，但它也可以被限制为只符合 `sed` 的 [POSIX][3] 规范，如果你需要移植性的话。

在 Windows 上，你可以用 [Chocolatey][5] 来[安装][4] GNU `sed`。

### Sed 如何工作

`sed` 应用程序一次只处理一行。因为它没有视觉显示，所以它在内存中创建了一个模式空间：一个包含输入流的当前行的空间（去掉任何尾部的换行符）。一旦填充了模式空间，你对 `sed` 的指令就会被执行。有时你的指令是有条件的，有时是无条件的，所以这些指令的结果取决于你如何使用 `sed`。

当命令结束时，`sed` 会将模式空间的内容打印到输出流中。默认的输出流是**标准输出**，但可以将其重定向到一个文件，甚至使用 `--in-place=.bak` 选项重定向到同一个文件中。

然后再从下一个输入行开始循环。

`sed`命令的语法是：

```
$ sed --options [optional SCRIPT] [INPUT FILE or STREAM]
```

#### 找到你要编辑的内容

在可视化编辑器中，你通常不需要考虑太多，就能在文本文件中找到你想要修改的内容。你的眼睛（或屏幕阅读器）会扫描文本，找到你想改变的单词或你想插入或删除文本的地方，然后你就可以开始输入了。而 `sed` 没有交互模式，所以你需要告诉它必须满足什么条件才能运行特定的命令。

在这些例子中，假设一个名为 `example.txt` 的文件包含了这样的文字：

```
hello
world
This is line three.
Here is the final line.
```

#### 行号

指定行号告诉 `sed` 只对文件中的那一行进行操作。

例如，下面这条命令选择文件的第 1 行并打印出来。因为 `sed` 在处理后的默认操作也是打印一行到**标准输出**，这样做的效果就是重复第一行：

```
$ sed '1p' example.txt
hello
hello
world
This is line three.
Here is the final line.
```

你也可以步进式指定行号。例如，`1~2` 表示每两行选择一行（“从第一行开始每两行选择一行”）。指令 `1~3` 表示从第一行开始，每三行选择一行：

```
$ sed '1p' example.txt
hello
hello
world
This is line three.
Here is the final line.
Here is the final line.
```

#### 行定位

你可以通过使用 `$` 作为选择器，只对文件的最后一行进行操作：

```
$ sed '$p' example.txt
hello
world
This is line three.
Here is the final line.
Here is the final line.
```

在 GNU `sed` 中，你可以选择多行（例如，`sed '1,$p'` 打印第一行和最后一行）。

#### 反转

任何数字或位置的选择，你都可以用感叹号（`!`）字符反转。下面这将选择除第一行以外的所有行：

```
$ sed '1!p' example.txt
hello
world
world
This is line three.
This is line three.
Here is the final line.
Here is the final line.
```

#### 模式匹配

你可以把模式匹配想象成文字处理器或浏览器中的**查找**操作。你提供一个词（一个 _模式_），然后选择了结果。模式匹配的语法是 `/pattern/`：

```
$ sed '/hello/p' example.txt
hello
hello
world
This is line three.
Here is the final line.
$ sed '/line/p' example.txt
hello
world
This is line three.
This is line three.
Here is the final line.
Here is the final line.
```

### 用 Sed 编辑

一旦你找到了你要编辑的内容，你就可以执行你想要的任何操作。你可以用 `sed` 中的命令来执行编辑。`sed` 中的命令不是 `sed` 命令本身。如果这样说有帮助的话，可以把它们看作是“动作”或“动词”或“指令”。

`sed` 中的命令是单个字母，例如前面例子中使用的**打印**命令的 `p`。它们一开始可能很难记忆，但和所有事情一样，你会随着练习而了解它们。

#### p 代表打印

`p` 指令打印当前模式空间中的任何内容。

#### d 用于删除

`d` 指令删除模式空间：

```
$ sed '$d' example.txt
hello
world
This is line three.
$ sed '1d' example.txt
world
This is line three.
Here is the final line.
```

#### s 用于搜索和替换

`s` 命令搜索一个模式并将其替换为其他东西。这可能是 `sed` 最流行和最随意的用法，而且它通常是用户学习的第一个（有时也是唯一的）`sed` 命令。几乎可以肯定它是文本编辑中最有用的命令：
 
```
$ sed 's/world/opensource.com/' example.txt
hello
opensource.com
This is line three.
Here is the final line.
```

在你的替换文本中，也可以使用一些特殊的功能。例如，`\L` 将替换文本转换为小写，`\l` 则只转换下一个字符。还有其他一些功能，列在 `sed` 文档中（你可以用 `info sed` 命令查看）。

替换子句中的特殊字符 `&` 指的是匹配到的模式：

```
$ sed 's/is/\U&/' example.txt
hello
world
ThIS is line three.
Here IS the final line.
```

你也可以通过特殊的标志来影响 `s` 如何处理它找到的内容。`g`（应该是指 _全局_）标志告诉 `s` 对行上找到的所有匹配项进行替换，而不仅仅是第一个匹配项：

```
$ sed 's/is/\U&/g' example.txt
hello
world
ThIS IS line three.
Here IS the final line.
```

其他重要的标志还包括用一个数字来表示要影响第几个出现的匹配模式：

```
$ sed 's/is/\U&/2' example.txt
hello
world
This IS line three.
Here is the final line.
```

`w` 标志，后面跟着一个文件名，_只有_在有变化的情况下，才会将匹配的行写入文件：

```
$ sed 's/is/\U&/w sed.log' example.txt
hello
world
ThIS is line three.
Here IS the final line.
$ cat sed.log
ThIS is line three.
Here IS the final line.
```

标志可以组合：

```
$ sed 's/is/\U&/2w sed.log' example.txt
hello
world
This IS line three.
Here is the final line.
$ cat sed.log
This IS line three.
```

### 脚本

有很多很棒的网站都有 `sed` “单行脚本”，它们给你提供了面向任务的 `sed` 命令来解决常见的问题。然而，自己学习 `sed` 可以让你写出自己的单行脚本，而且这些单行脚本可以根据你的具体需求来定制。

`sed` 的脚本可以在终端中写成一行，也可以保存到文件中，然后用 `sed` 本身执行。我倾向于把小脚本写成一个命令，因为我发现自己在现实生活中很少重复使用 `sed` 命令。当我写一个 `sed` 脚本时，通常都是针对一个文件的。例如，在写完这篇文章的初稿后，我用 `sed` 来规范 “sed” 的大小写，而这是我可能永远也不会再做的任务。

你可以向 `sed` 发出一系列不同的命令，用分号（`;`）分开。

```
$ sed '3t ; s/line/\U&/' example.txt
hello
world
This is LINE three.
This is the final line.
```

### 带括号的范围改变

你也可以用大括号（`{}`）限制哪些结果受到影响。当你将 `sed` 命令用大括号括起来时，它们只适用于特定的选择。例如，“line” 字出现在样本文本的两行中。你可以通过声明所需的匹配条件（`$` 表示最后一行），并将你希望执行的 `s` 命令放在紧随其后的括号中，强制 `sed` 只影响最后一行：

```
$ sed '$ {s/line/\U&/}' example.txt
hello
world
This is line three.
This is the final LINE.
```

### 学习 Sed

你可以用 `sed` 做的事情比本文所解释的多得多。我甚至还没有涉及到分支（`b`）、测试（`t`）、保留空格（`H`）和许多其他功能。就像 [ed][6] 一样，`sed` 可能不是你要用来创建文档的文本编辑器，甚至不是你需要做的每一个脚本任务中使用的文本编辑器，但它是你作为 POSIX 用户的一个强大的选择。学习 `sed` 命令的结构以及如何编写简短的脚本可以快速修改大量的文本。阅读 GNU `sed` 的`info` 页面，或者 BSD `sed` 的手册页，看看 `sed` 能为你做什么。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/12/sed

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/command_line_prompt.png?itok=wbGiJ_yg (Command line prompt)
[2]: http://www.gnu.org/software/sed/
[3]: https://opensource.com/article/19/7/what-posix-richard-stallman-explains
[4]: https://chocolatey.org/packages/sed
[5]: https://opensource.com/article/20/3/chocolatey
[6]: https://opensource.com/article/20/12/gnu-ed

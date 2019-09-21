[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10895-1.html)
[#]: subject: (Check your spelling at the command line with Ispell)
[#]: via: (https://opensource.com/article/19/5/spelling-command-line-ispell)
[#]: author: (Scott Nesbitt  https://opensource.com/users/scottnesbitt)

使用 Ispell 在命令行中检查拼写
======

> Ispell 可以帮助你在纯文本中消除超过 50 种语言的拼写错误。

![Command line prompt](https://img.linux.net.cn/data/attachment/album/201905/24/192644wqqv6d0lztmqoqyl.jpg)

好的拼写是一种技巧。它是一项需要时间学习和掌握的技能。也就是说，有些人从来没有完全掌握这种技能，我知道有两三个出色的作家就无法完全掌握拼写。

即使你拼写得很好，偶尔也会输入错字。特别是在最后期限前如果你快速敲击键盘，那就更是如此。无论你的拼写的是什么，通过拼写检查器检查你所写的内容总是一个好主意。

我用[纯文本][2]完成了我的大部分写作，并经常使用名为 [Aspell][3] 的命令行拼写检查器来完成这项工作。Aspell 不是唯一的工具。你可能还想要看下不错的 [Ispell][4]。

### 入门

自 1971 年以来，Ispell 就以各种形式出现过。不要被它的年龄欺骗。Ispell 仍然是一个可以在 21 世纪高效使用的应用。

在开始之前，请打开终端窗口并输入 `which ispell` 来检查计算机上是否安装了 Ispell。如果未安装，请打开发行版的软件包管理器并从那里安装 Ispell。

不要忘记为你使用的语言安装词典。我唯一使用的语言是英语，所以我只需下载美国和英国英语字典。你可以不局限于我的（也是唯一的）母语。Ispell 有[超过 50 种语言的词典][5]。

![Installing Ispell dictionaries][6]

### 使用 Ispell

如果你还没有猜到，Ispell 只能用在文本文件。这包括用 HTML、LaTeX 和 [nroff 或 troff][7] 标记的文档。之后会有更多相关内容。

要开始使用，请打开终端窗口并进入包含要运行拼写检查的文件的目录。输入 `ispell` 后跟文件名，然后按回车键。

![Checking spelling with Ispell][8]

Ispell 高亮了它无法识别的第一个词。如果单词拼写错误，Ispell 通常会提供一个或多个备选方案。按下 `R`，然后按下正确选择旁边的数字。在上面的截图中，我按了 `R` 和 `0` 来修复错误。

另一方面，如果单词拼写正确，请按下 `A` 然后移动到下一个拼写错误的单词。

继续这样做直到到达文件的末尾。Ispell 会保存你的更改，创建你刚检查的文件的备份（扩展名为 `.bak`），然后关闭。

### 其他几个选项

此示例说明了 Ispell 的基本用法。这个程序有[很多选项][9]，有些你*可能*会用到，而另一些你*可能永远*不会使用。让我们快速看下我经常使用的一些。

之前我提到过 Ispell 可以用于某些标记语言。你需要告诉它文件的格式。启动 Ispell 时，为 TeX 或 LaTeX 文件添加 `-t`，为 HTML 文件添加 `-H`，对于 groff 或 troff 文件添加 `-n`。例如，如果输入 `ispell -t myReport.tex`，Ispell 将忽略所有标记。

如果你不想在检查文件后创建备份文件，请将 `-x` 添加到命令行。例如，`ispell -x myFile.txt`。

如果 Ispell 遇到拼写正确但不在其字典中的单词，比如名字，会发生什么？你可以按 `I` 将该单词添加到个人单词列表中。这会将单词保存到 `/home` 目录下的 `.ispell_default` 的文件中。

这些是我在使用 Ispell 时最有用的选项，但请查看 [Ispell 的手册页][9]以了解其所有选项。

Ispell 比 Aspell 或其他命令行拼写检查器更好或者更快么？我会说它不比其他的差或者慢。Ispell 不是适合所有人。它也许也不适合你。但有更多选择也不错，不是么？

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/5/spelling-command-line-ispell

作者：[Scott Nesbitt][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/scottnesbitt
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/command_line_prompt.png?itok=wbGiJ_yg (Command line prompt)
[2]: https://plaintextproject.online
[3]: https://opensource.com/article/18/2/how-check-spelling-linux-command-line-aspell
[4]: https://www.cs.hmc.edu/~geoff/ispell.html
[5]: https://www.cs.hmc.edu/~geoff/ispell-dictionaries.html
[6]: https://opensource.com/sites/default/files/uploads/ispell-install-dictionaries.png (Installing Ispell dictionaries)
[7]: https://opensource.com/article/18/2/how-format-academic-papers-linux-groff-me
[8]: https://opensource.com/sites/default/files/uploads/ispell-checking.png (Checking spelling with Ispell)
[9]: https://www.cs.hmc.edu/~geoff/ispell-man.html

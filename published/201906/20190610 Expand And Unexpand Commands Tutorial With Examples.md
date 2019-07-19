[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10983-1.html)
[#]: subject: (Expand And Unexpand Commands Tutorial With Examples)
[#]: via: (https://www.ostechnix.com/expand-and-unexpand-commands-tutorial-with-examples/)
[#]: author: (sk https://www.ostechnix.com/author/sk/)

expand 与 unexpand 命令实例教程
======

![Expand And Unexpand Commands Explained][1]

本指南通过实际的例子解释两个 Linux 命令，即 `expand` 和 `unexpand`。对于好奇的人，`expand` 和 `unexpand` 命令用于将文件中的 `TAB` 字符替换为空格，反之亦然。在 MS-DOS 中也有一个名为 `expand` 的命令，它用于解压压缩文件。但 Linux 的 `expand` 命令只是将 `TAB` 转换为空格。这两个命令是 GNU coreutils 包的一部分，由 David MacKenzie 编写。

为了演示，我将在本文使用名为 `ostechnix.txt` 的文本文件。下面给出的所有命令都在 Arch Linux 中进行测试。

### expand 命令示例

与我之前提到的一样，`expand` 命令使用空格替换文件中的 `TAB` 字符。

现在，让我们将 `ostechnix.txt` 中的 `TAB` 转换为空格，并将结果写入标准输出：

```
$ expand ostechnix.txt
```

如果你不想在标准输出中显示结果，只需将其写入另一个文件，如下所示。

```
$ expand ostechnix.txt>output.txt
```

我们还可以将标准输入中的 `TAB` 转换为空格。为此，只需运行 `expand` 命令而不带文件名：

```
$ expand
```

只需输入文本并按回车键就能将 `TAB` 转换为空格。按 `CTRL+C` 退出。

如果你不想转换非空白字符后的 `TAB`，请使用 `-i` 标记，如下所示。

```
$ expand -i ostechnix.txt
```

我们还可以设置每个 `TAB` 为指定数字的宽度，而不是 `8`（默认值）。

```
$ expand -t=5 ostechnix.txt
```

我们甚至可以使用逗号分隔指定多个 `TAB` 位置，如下所示。

```
$ expand -t 5,10,15 ostechnix.txt
```

或者，

```
$ expand -t "5 10 15" ostechnix.txt
```

有关更多详细信息，请参阅手册页。

```
$ man expand
```

### unexpand 命令示例

正如你可能已经猜到的那样，`unexpand` 命令将执行与 `expand` 命令相反的操作。即它会将空格转换为 `TAB`。让我向你展示一些例子，以了解如何使用 `unexpand` 命令。

要将文件中的空白（当然是空格）转换为 `TAB` 并将输出写入标准输出，请执行以下操作：

```
$ unexpand ostechnix.txt
```

如果要将输出写入文件而不是仅将其显示到标准输出，请使用以下命令：

```
$ unexpand ostechnix.txt>output.txt
```

从标准输出读取内容，将空格转换为制表符：

```
$ unexpand
```

默认情况下，`unexpand` 命令仅转换初始的空格。如果你想转换所有空格而不是只是一行开头的空格，请使用 `-a` 标志：

```
$ unexpand -a ostechnix.txt
```

仅转换一行开头的空格（请注意它会覆盖 `-a`）：

```
$ unexpand --first-only ostechnix.txt
```

使多少个空格替换成一个 `TAB`，而不是 `8`（会启用 `-a`）：

```
$ unexpand -t 5 ostechnix.txt
```

相似地，我们可以使用逗号分隔指定多个 `TAB` 的位置。

```
$ unexpand -t 5,10,15 ostechnix.txt
```

或者，

```
$ unexpand -t "5 10 15" ostechnix.txt
```

有关更多详细信息，请参阅手册页。

```
$ man unexpand
```

在处理大量文件时，`expand` 和 `unexpand` 命令对于用空格替换不需要的 `TAB` 时非常有用，反之亦然。

--------------------------------------------------------------------------------

via: https://www.ostechnix.com/expand-and-unexpand-commands-tutorial-with-examples/

作者：[sk][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.ostechnix.com/author/sk/
[b]: https://github.com/lujun9972
[1]: https://www.ostechnix.com/wp-content/uploads/2019/05/Expand-And-Unexpand-Commands-720x340.png

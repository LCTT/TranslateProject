[#]: collector: (lujun9972)
[#]: translator: (zero-mk)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10591-1.html)
[#]: subject: (Ampersands and File Descriptors in Bash)
[#]: via: (https://www.linux.com/blog/learn/2019/2/ampersands-and-file-descriptors-bash)
[#]: author: (Paul Brown https://www.linux.com/users/bro66)

Bash 中的 ＆ 符号和文件描述符
======

> 了解如何将 “＆” 与尖括号结合使用，并从命令行中获得更多信息。

![](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/ampersand-coffee.png?itok=yChaT-47)

在我们探究大多数链式 Bash 命令中出现的所有的杂项符号（`&`、`|`、`;`、`>`、`<`、`{`、`[`、`(`、`)`、`]`、`}` 等等）的任务中，[我们一直在仔细研究 & 符号][1]。

[上次，我们看到了如何使用 & 把可能需要很长时间运行的进程放到后台运行][1]。但是，`＆` 与尖括号 `<` 结合使用，也可用于将输出或输出通过管道导向其他地方。

在 [前面的][2] [尖括号教程中][3]，你看到了如何使用 `>`，如下：

```
ls > list.txt
```

将 `ls` 输出传递给 `list.txt` 文件。

现在我们看到的是简写：

```
ls 1> list.txt
```

在这种情况下，`1` 是一个文件描述符，指向标准输出（`stdout`）。

以类似的方式，`2` 指向标准错误输出（`stderr`）：

```
ls 2> error.log
```

所有错误消息都通过管道传递给 `error.log` 文件。

回顾一下：`1>` 是标准输出（`stdout`），`2>` 是标准错误输出（`stderr`）。

第三个标准文件描述符，`0<` 是标准输入（`stdin`）。你可以看到它是一个输入，因为箭头（`<`）指向`0`，而对于 `1` 和 `2`，箭头（`>`）是指向外部的。

### 标准文件描述符有什么用？

如果你在阅读本系列以后，你已经多次使用标准输出（`1>`）的简写形式：`>`。

例如，当（假如）你知道你的命令会抛出一个错误时，像 `stderr`（`2`）这样的东西也很方便，但是 Bash 告诉你的东西是没有用的，你不需要看到它。如果要在 `home/` 目录中创建目录，例如：

```
mkdir newdir
```

如果 `newdir/` 已经存在，`mkdir` 将显示错误。但你为什么要关心这些呢？（好吧，在某些情况下你可能会关心，但并非总是如此。）在一天结束时，`newdir` 会以某种方式让你填入一些东西。你可以通过将错误消息推入虚空（即 ``/dev/null`）来抑制错误消息：

```
mkdir newdir 2> /dev/null
```

这不仅仅是 “让我们不要看到丑陋和无关的错误消息，因为它们很烦人”，因为在某些情况下，错误消息可能会在其他地方引起一连串错误。比如说，你想找到 `/etc` 下所有的 `.service` 文件。你可以这样做：

```
find /etc -iname "*.service"
```

但事实证明，在大多数系统中，`find` 显示的错误会有许多行，因为普通用户对 `/etc` 下的某些文件夹没有读取访问权限。它使读取正确的输出变得很麻烦，如果 `find` 是更大的脚本的一部分，它可能会导致行中的下一个命令排队。

相反，你可以这样做：

```
find /etc -iname "*.service" 2> /dev/null
```

而且你只得到你想要的结果。

### 文件描述符入门

单独的文件描述符 `stdout` 和 `stderr` 还有一些注意事项。如果要将输出存储在文件中，请执行以下操作：

```
find /etc -iname "*.service" 1> services.txt
```

工作正常，因为 `1>` 意味着 “发送标准输出且自身标准输出（非标准错误）到某个地方”。

但这里存在一个问题：如果你想把命令抛出的错误信息记录到文件，而结果中没有错误信息你该怎么**做**？上面的命令并不会这样做，因为它只写入 `find` 正确的结果，而：

```
find /etc -iname "*.service" 2> services.txt
```

只会写入命令抛出的错误信息。

我们如何得到两者？请尝试以下命令：

```
find /etc -iname "*.service" &> services.txt
```

…… 再次和 `&` 打个招呼！

我们一直在说 `stdin`（`0`）、`stdout`（`1`）和 `stderr`（`2`）是“文件描述符”。文件描述符是一种特殊构造，是指向文件的通道，用于读取或写入，或两者兼而有之。这来自于将所有内容都视为文件的旧 UNIX 理念。想写一个设备？将其视为文件。想写入套接字并通过网络发送数据？将其视为文件。想要读取和写入文件？嗯，显然，将其视为文件。

因此，在管理命令的输出和错误的位置时，将目标视为文件。因此，当你打开它们来读取和写入它们时，它们都会获得文件描述符。

这是一个有趣的效果。例如，你可以将内容从一个文件描述符传递到另一个文件描述符：

```
find /etc -iname "*.service" 1> services.txt 2>&1
```

这会将 `stderr` 导向到 `stdout`，而 `stdout` 通过管道被导向到一个文件中 `services.txt` 中。

它再次出现：`&` 发信号通知 Bash `1` 是目标文件描述符。

标准文件描述符的另一个问题是，当你从一个管道传输到另一个时，你执行此操作的顺序有点违反直觉。例如，按照上面的命令。它看起来像是错误的方式。你应该像这样阅读它：“将输出导向到文件，然后将错误导向到标准输出。” 看起来错误输出会在后面，并且在输出到标准输出（`1`）已经完成时才发送。

但这不是文件描述符的工作方式。文件描述符不是文件的占位符，而是文件的输入和（或）输出通道。在这种情况下，当你做 `1> services.txt` 时，你的意思是 “打开一个写管道到 `services.txt` 并保持打开状态”。`1` 是你要使用的管道的名称，它将保持打开状态直到该行的结尾。

如果你仍然认为这是错误的方法，试试这个：

```
find /etc -iname "*.service" 2>&1 1>services.txt
```

并注意它是如何不工作的；注意错误是如何被导向到终端的，而只有非错误的输出（即 `stdout`）被推送到 `services.txt`。

这是因为 Bash 从左到右处理 `find` 的每个结果。这样想：当 Bash 到达 `2>&1` 时，`stdout` （`1`）仍然是指向终端的通道。如果 `find` 给 Bash 的结果包含一个错误，它将被弹出到 `2`，转移到 `1`，然后留在终端！

然后在命令结束时，Bash 看到你要打开 `stdout`（`1`） 作为到 `services.txt` 文件的通道。如果没有发生错误，结果将通过通道 `1` 进入文件。

相比之下，在：

```
find /etc -iname "*.service" 1>services.txt 2>&1
```

`1` 从一开始就指向 `services.txt`，因此任何弹出到 `2` 的内容都会导向到 `1` ，而 `1` 已经指向最终去的位置 `services.txt`，这就是它工作的原因。

在任何情况下，如上所述 `&>` 都是“标准输出和标准错误”的缩写，即 `2>&1`。

这可能有点多，但不用担心。重新导向文件描述符在 Bash 命令行和脚本中是司空见惯的事。随着本系列的深入，你将了解更多关于文件描述符的知识。下周见!

--------------------------------------------------------------------------------

via: https://www.linux.com/blog/learn/2019/2/ampersands-and-file-descriptors-bash

作者：[Paul Brown][a]
选题：[lujun9972][b]
译者：[zero-mk](https://github.com/zero-mk)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.linux.com/users/bro66
[b]: https://github.com/lujun9972
[1]: https://linux.cn/article-10587-1.html
[2]: https://linux.cn/article-10502-1.html
[3]: https://linux.cn/article-10529-1.html

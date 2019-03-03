[#]: collector: "lujun9972"
[#]: translator: "zero-mk "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "
[#]: subject: "Ampersands and File Descriptors in Bash"
[#]: via: "https://www.linux.com/blog/learn/2019/2/ampersands-and-file-descriptors-bash"
[#]: author: "Paul Brown https://www.linux.com/users/bro66"

Bash中的＆符号和文件描述符
======

![](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/ampersand-coffee.png?itok=yChaT-47)

在我们寻求检查所有的clutter（`&`，`|`，`;`，`>`，`<`，`{`，`[`，`(`，） `]`，`}` 等等）是在大多数链式Bash命令中都会出现，[我们一直在仔细研究（`&`）符号][1]。

[上次，我们看到了如何使用`&`把可能需要很长时间运行的进程放到后台运行][1]。但是，`＆`与尖括号`<`结合使用，也可用于管道输出或向其他地方的输入。

在[前面的][2] [尖括号教程中][3]，您看到了如何使用`>`，如下：

```
ls > list.txt
```

将`ls`输出传递给_list.txt_文件。

现在我们看到的是简写

```
ls 1> list.txt
```

在这种情况下，`1`是一个文件描述符，指向标准输出（`stdout`）。

以类似的方式，`2`指向标准error（`stderr`）：

```
ls 2> error.log
```

所有错误消息都通过管道传递给_error.log_文件。

回顾一下：`1>`是标准输出（`stdout`），`2>`标准错误输出（`stderr`）。

第三个标准文件描述符，`0<`标准输入（`stdin`）。您可以看到它是一个输入，因为箭头（`<`）指向`0`，而对于 `1`和`2`，箭头（`>`）是指向外部的。

### 标准文件描述符有什么用？

如果您在阅读本系列以后，您已经多次使用标准输出（`1>`）的简写形式：`>`。

例如，当（假如）你知道你的命令会抛出一个错误时，像`stderr`（`2`）这样的东西也很方便，但是Bash告诉你的东西是没有用的，你不需要看到它。如果要在_home/_目录中创建目录，例如：

```
mkdir newdir
```

如果_newdir/_已经存在，`mkdir`将显示错误。但你为什么要关心？（好吧，在某些情况下你可能会关心，但并非总是如此。）在一天结束时，_newdir_会以某种方式让你填写一些东西。您可以通过将错误消息推入void（即_/dev/null_）来抑制错误消息：

```
mkdir newdir 2> /dev/null
```

这不仅仅是“ _让我们不要看到丑陋和无关的错误消息，因为它们很烦人_ ”，因为在某些情况下，错误消息可能会在其他地方引起一连串错误。比如说，你想找到_/etc_下所有的*.service_文件。你可以这样做：

```
find /etc -iname "*.service"
```

但事实证明，在大多数系统中，`find`显示错误会导致许多行出现问题，因为普通用户对_/etc_下的某些文件夹没有读取访问权限。它使读取正确的输出变得很麻烦，如果`find`是更大的脚本的一部分，它可能会导致行中的下一个命令排队。

相反，你可以这样做：

```
find /etc -iname "*.service" 2> /dev/null
```

而且你只得到你想要的结果。

### 文件描述符入门

单独的文件描述符`stdout`和`stderr`还有一些注意事项。如果要将输出存储在文件中，请执行以下操作：

```
find /etc -iname "*.service" 1> services.txt
```

工作正常，因为`1>`意味着“ _发送标准输出，只有标准输出（非标准错误）_ ”。

但这里存在一个问题：如果你想保留命令抛出的错误信息的和非错误信息你该怎么*做*？上面的说明并不会这样做，因为它只写入`find`正确的结果

```
find /etc -iname "*.service" 2> services.txt
```

只会写入命令抛出的错误信息。

我们如何得到两者？请尝试以下命令：

```
find /etc -iname "*.service" &> services.txt
```

…… 再次和`&`打招呼！

我们一直在说`stdin`（`0`），`stdout`（`1`）和`stderr`（`2`）是_文件描述符_。文件描述符是一种特殊构造，指向文件的通道，用于读取或写入，或两者兼而有之。这来自于将所有内容都视为文件的旧UNIX理念。想写一个设备？将其视为文件。想写入套接字并通过网络发送数据？将其视为文件。想要读取和写入文件？嗯，显然，将其视为文件。

因此，在管理命令的输出和错误的位置时，将目标视为文件。因此，当您打开它们来读取和写入它们时，它们都会获得文件描述符。

这是一个有趣的效果。例如，您可以将内容从一个文件描述符传递到另一个文件描述符：

```
find /etc -iname "*.service" 1> services.txt 2>&1
```

该管道`stderr`以`stdout`与`stdout`通过管道被输送到一个文件中，_services.txt的_。

它再次出现：`&`发信号通知Bash `1`是目标文件描述符。

标准文件描述符的另一个问题是，当你从一个管道传输到另一个时，你执行此操作的顺序有点违反直觉。例如，按照上面的命令。它看起来像是错误的方式。您可能正在阅读它：“ _将输出传输到文件，然后将错误传递给标准输出。_ ”看起来错误输出会很晚，并且在`1`已经完成时发送。

但这不是文件描述符的工作方式。文件描述符不是文件的占位符，而是文件的_输入and/or输出通道_。在这种情况下，当你`1> services.txt`这样做时，你会说“ _打开一个写管道到services.txt并保持打开状态_ ”。`1`是您要使用的管道的名称，它将保持打开状态直到该行的结尾。

如果你仍然认为这是错误的方法，试试这个：

```
find /etc -iname "*.service" 2>&1 1>services.txt
```

并注意它是如何工作的; 注意错误是如何通过管道输送到终端的，所以只有非错误的输出（即`stdout`）被推送到`services.txt`。

这是因为Bash从左到右处理`find`的每个结果。这样想：当Bash到达`2>&1`时，`stdout` (`1`) 仍然是指向终端的通道。如果`find` Bash的结果包含一个错误，它将被弹出到`2`，转移到`1`，然后离开终端！

然后在命令结束时，Bash看到您要打开`stdout`作为_services.txt_文件的通道。如果没有发生错误，结果将`1`进入文件。

相比之下，在

```
find /etc -iname "*.service" 1>services.txt 2>&1
```

`1`从一开始就指向services.txt，因此任何弹出到`2`的内容都会通过`1`进行管道传输，而`1`已经指向services.txt中的最后一个休息位置，这就是它工作的原因。在任何情况下，如上所述`&>`都是“标准输出和标准错误”的缩写，即`2>&1`。

在任何情况下，如上所述`&>`是“_标准输出和标准误差_”的简写，即`2>&1`。

这可能有点多，但不用担心。调整文件描述符在Bash命令行和脚本中是司空见惯的事。随着本系列的深入，您将了解更多关于文件描述符的知识。下周见!

--------------------------------------------------------------------------------

via: https://www.linux.com/blog/learn/2019/2/ampersands-and-file-descriptors-bash

作者：[Paul Brown][a]
选题：[lujun9972][b]
译者：[zero-mk](https://github.com/zero-mk)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.linux.com/users/bro66
[b]: https://github.com/lujun9972
[1]: https://www.linux.com/blog/learn/2019/2/and-ampersand-and-linux
[2]: https://www.linux.com/blog/learn/2019/1/understanding-angle-brackets-bash
[3]: https://www.linux.com/blog/learn/2019/1/more-about-angle-brackets-bash
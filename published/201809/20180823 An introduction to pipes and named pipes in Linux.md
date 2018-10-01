介绍 Linux 中的管道和命名管道
======

> 要在命令间移动数据？使用管道可使此过程便捷。

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/LAW-Internet_construction_9401467_520x292_0512_dc.png?itok=RPkPPtDe)

在 Linux 中，`pipe` 能让你将一个命令的输出发送给另一个命令。管道，如它的名称那样，能重定向一个进程的标准输出、输入和错误到另一个进程，以便于进一步处理。

“管道”（或称“未命名管道”）命令的语法是在两个命令之间加上 `|` 字符：

```
Command-1 | Command-2 | ...| Command-N
```

这里，该管道不能通过另一个会话访问；它被临时创建用于接收 `Command-1` 的执行并重定向标准输出。它在成功执行之后删除。  

![](https://opensource.com/sites/default/files/uploads/pipe.png)

在上面的示例中，`contents.txt` 包含特定目录中所有文件的列表 —— 具体来说，就是 `ls -al` 命令的输出。我们首先通过管道（如图所示）使用 “file” 关键字从 `contents.txt` 中 `grep` 文件名，因此 `cat` 命令的输出作为 `grep` 命令的输入提供。接下来，我们添加管道来执行 `awk` 命令，该命令显示 `grep` 命令的过滤输出中的第 9 列。我们还可以使用 `wc -l` 命令计算 `contents.txt` 中的行数。

只要系统启动并运行或直到它被删除，命名管道就可以持续使用。它是一个遵循 [FIFO][1]（先进先出）机制的特殊文件。它可以像普通文件一样使用。也就是，你可以写入，从中读取，然后打开或关闭它。要创建命名管道，命令为：

```
mkfifo <pipe-name>
```

这将创建一个命名管道文件，它甚至可以在多个 shell 会话中使用。

创建 FIFO 命名管道的另一种方法是使用此命令：

```
mknod p <pipe-name>
```

要重定向任何命令的标准输出到其它命令，请使用 `>` 符号。要重定向任何命令的标准输入，请使用 `<` 符号。

![](https://opensource.com/sites/default/files/uploads/redirection.png)

如上所示，`ls -al` 命令的输出被重定向到 `contents.txt` 并插入到文件中。类似地，`tail` 命令的输入通过 `<` 符号从 `contents.txt` 读取。

![](https://opensource.com/sites/default/files/uploads/create-named-pipe.png)

![](https://opensource.com/sites/default/files/uploads/verify-output.png)

这里，我们创建了一个命名管道 `my-named-pipe`，并将 `ls -al` 命令的输出重定向到命名管道。我们可以打开一个新的 shell 会话并 `cat` 命名管道的内容，如前所述，它显示了 `ls -al` 命令的输出。请注意，命名管道的大小为零，并有一个标志 “p”。

因此，下次你在 Linux 终端上使用命令并在命令之间移动数据时，希望管道使这个过程快速简便。

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/8/introduction-pipes-linux

作者：[Archit Modi][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/architmodi
[1]:https://en.wikipedia.org/wiki/FIFO_(computing_and_electronics)

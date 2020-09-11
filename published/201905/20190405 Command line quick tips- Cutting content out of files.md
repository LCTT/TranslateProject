[#]: collector: (lujun9972)
[#]: translator: (MjSeven)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10809-1.html)
[#]: subject: (Command line quick tips: Cutting content out of files)
[#]: via: (https://fedoramagazine.org/command-line-quick-tips-cutting-content-out-of-files/)
[#]: author: (Stephen Snow https://fedoramagazine.org/author/jakfrost/)

命令行技巧：分割文件内容
======

![][1]

Fedora 发行版是一个功能齐全的操作系统，有出色的图形化桌面环境。用户可以很容易地通过单击动作来完成任何典型任务。所有这些美妙的易用性掩盖了其底层强大的命令行细节。本文是向你展示一些常见命令行实用程序的系列文章的一部分。让我们进入 shell 来看看 `cut`。

通常，当你在命令行中工作时，你处理的是文本文件。有时这些文件可能很长，虽然可以完整地阅读它们，但是可能会耗费大量时间，并且容易出错。在本文中，你将学习如何从文本文件中提取内容，并从中获取你所需的信息。

重要的是要意识到，在 Fedora 中有许多方法可以完成类似的命令行任务。例如，Fedora 仓库含有用于解析和处理文本的完整语言系统。此外，还有多个命令行实用程序可用于 shell 中任何可能的用途。本文只关注使用其中几个实用程序选项，从文件中提取一些信息并以可读的格式呈现。

### cut 使用

为了演示这个例子，在系统上使用一个标准的大文件，如 `/etc/passwd`。正如本系列的前一篇文章所示，你可以执行 `cat` 命令来查看整个文件：

```
$ cat /etc/passwd
root:x:0:0:root:/root:/bin/bash
bin:x:1:1:bin:/bin:/sbin/nologin
daemon:x:2:2:daemon:/sbin:/sbin/nologin
adm:x:3:4:adm:/var/adm:/sbin/nologin
...
```

此文件包含系统上所有所有账户的信息。它有一个特定的格式：

```
name:password:user-id:group-id:comment:home-directory:shell
```

假设你只想要系统上所有账户名的列表，如果你只能从每一行中删除 “name” 值。这就是 `cut` 命令派上用场的地方！它一次处理一行输入，并提取该行的特定部分。

`cut` 命令提供了以不同方式选择一行的部分的选项，在本示例中需要两个，`-d` 和 `-f`。`-d` 选项允许你声明用于分隔行中值的分隔符。在本例中，冒号（`:`）用于分隔值。`-f` 选项允许你选择要提取哪些字段值。因此，在本例中，输入的命令是：

```
$ cut -d: -f1 /etc/passwd
root
bin
daemon
adm
...
```

太棒了，成功了！但是你将输出打印到标准输出，在终端会话中意味着它需要占据屏幕。如果你需要稍后完成另一项任务所需的信息，这该怎么办？如果有办法将 `cut` 命令的输出保存到文本文件中，那就太好了。对于这样的任务，shell 有一个简单的内置功能，重定向功能（`>`）。

```
$ cut -d: -f1 /etc/passwd > names.txt
```

这会将 `cut` 的输出放到一个名为 `names.txt` 的文件中，你可以使用 `cat` 来查看它的内容:

```
$ cat names.txt
root
bin
daemon
adm
...
```

使用两个命令和一个 shell 功能，可以很容易地使用 `cat` 从一个文件进行识别、提取和重定向一些信息，并将其保存到另一个文件以供以后使用。

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/command-line-quick-tips-cutting-content-out-of-files/

作者：[Stephen Snow][a]
选题：[lujun9972][b]
译者：[MjSeven](https://github.com/MjSeven)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/jakfrost/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2019/04/commandline-cutting-816x345.jpg
[2]: https://unsplash.com/photos/tA5eSY_hay8?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[3]: https://unsplash.com/search/photos/command-line?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText

Linux 中一种友好的 find 替代工具
======
> fd 命令提供了一种简单直白的搜索 Linux 文件系统的方式。

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/find-file-linux-code_magnifying_glass_zero.png?itok=E2HoPDg0)

[fd][1] 是一个超快的，基于 [Rust][2] 的 Unix/Linux `find` 命令的替代品。它不提供所有 `find` 的强大功能。但是，它确实提供了足够的功能来覆盖你可能遇到的 80％ 的情况。诸如良好的规划和方便的语法、彩色输出、智能大小写、正则表达式以及并行命令执行等特性使 `fd` 成为一个非常有能力的后继者。

### 安装

进入 [fd][1] GitHub 页面，查看安装部分。它涵盖了如何在[macOS][3]、 [Debian/Ubuntu][4] [Red Hat][5] 和 [Arch Linux][6] 上安装程序。安装完成后，你可以通过运行帮助来获得所有可用命令行选项的完整概述，通过 `fd -h` 获取简明帮助，或者通过 `fd --help` 获取更详细的帮助。

### 简单搜索

`fd` 旨在帮助你轻松找到文件系统中的文件和文件夹。你可以用 `fd` 带上一个参数执行最简单的搜索，该参数就是你要搜索的任何东西。例如，假设你想要找一个 Markdown 文档，其中包含单词 `services` 作为文件名的一部分：

```
$ fd services
downloads/services.md
```

如果仅带一个参数调用，那么 `fd` 递归地搜索当前目录以查找与莫的参数匹配的任何文件和/或目录。使用内置的 `find` 命令的等效搜索如下所示：

```
$ find . -name 'services'
downloads/services.md
```

如你所见，`fd` 要简单得多，并需要更少的输入。在我心中用更少的输入做更多的事情总是对的。

### 文件和文件夹

您可以使用 `-t` 参数将搜索范围限制为文件或目录，后面跟着代表你要搜索的内容的字母。例如，要查找当前目录中文件名中包含 `services` 的所有文件，可以使用：

```
$ fd -tf services
downloads/services.md
```

以及，找到当前目录中文件名中包含 `services` 的所有目录：

```
$ fd -td services
applications/services
library/services
```

如何在当前文件夹中列出所有带 `.md` 扩展名的文档？

```
$ fd .md
administration/administration.md
development/elixir/elixir_install.md
readme.md
sidebar.md
linux.md
```

从输出中可以看到，`fd` 不仅可以找到并列出当前文件夹中的文件，还可以在子文件夹中找到文件。很简单。

你甚至可以使用 `-H` 参数来搜索隐藏文件：

```
fd -H sessions .
.bash_sessions
```

### 指定目录

如果你想搜索一个特定的目录，这个目录的名字可以作为第二个参数传给 `fd`：

```
$ fd passwd /etc
/etc/default/passwd
/etc/pam.d/passwd
/etc/passwd
```

在这个例子中，我们告诉 `fd` 我们要在 `etc` 目录中搜索 `passwd` 这个单词的所有实例。

### 全局搜索

如果你知道文件名的一部分，但不知道文件夹怎么办？假设你下载了一本关于 Linux 网络管理的书，但你不知道它的保存位置。没有问题：

```
fd Administration /
/Users/pmullins/Documents/Books/Linux/Mastering Linux Network Administration.epub
```

### 总结

`fd` 是 `find` 命令的极好的替代品，我相信你会和我一样发现它很有用。要了解该命令的更多信息，只需浏览手册页。

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/6/friendly-alternative-find

作者：[Patrick H. Mullins][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/pmullins
[1]:https://github.com/sharkdp/fd
[2]:https://www.rust-lang.org/en-US/
[3]:https://en.wikipedia.org/wiki/MacOS
[4]:https://www.ubuntu.com/community/debian
[5]:https://www.redhat.com/en
[6]:https://www.archlinux.org/

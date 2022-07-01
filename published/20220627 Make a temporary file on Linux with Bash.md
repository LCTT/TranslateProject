[#]: subject: "Make a temporary file on Linux with Bash"
[#]: via: "https://opensource.com/article/22/6/make-temporary-file-bash"
[#]: author: "Seth Kenlon https://opensource.com/users/seth"
[#]: collector: "lkxed"
[#]: translator: "geekpi"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14783-1.html"

在 Linux 上使用 Bash 创建一个临时文件
======

![](https://img.linux.net.cn/data/attachment/album/202207/01/145110u1ninn1n3idspp71.jpg)

> 基于 Fedora 的系统上的 `mktemp` 命令和基于 Debian 的系统上的 `tempfile` 是专门为减轻这种负担而设计的，它使创建、使用和删除独特的文件变得容易。

使用 Bash 脚本语言进行编程时，有时需要创建一个临时文件。例如，你可能需要一个可以提交到磁盘的中间文件，以便你可以使用另一个命令对其进行处理。创建诸如 `temp` 之类的文件或任何以 `.tmp` 结尾的文件很容易。但是，这些名称很可能是由其他进程生成的，因此你可能会不小心覆盖现有的临时文件。除此之外，你不应该花费脑力想出看起来独特的名字。基于 Fedora 的系统上的 `mktemp` 命令和基于 Debian 的系统上的 `tempfile` 是专门为减轻这种负担而设计的，它使创建、使用和删除独特的文件变得容易。

### 创建一个临时文件

`mktemp` 和 `tempfile` 都创建一个临时文件作为它们的默认操作，并打印文件的名称和位置作为输出：

```
$ tempfile
/tmp/fileR5dt6r

$ mktemp 
/tmp/tmp.ojEfvMaJEp
```

除非你指定不同的路径，否则系统会将临时文件放在 `/tmp` 目录中。

对于 `mktemp`，可以使用 `-p` 选项指定路径：

```
$ mktemp -p ~/Demo
/home/tux/Demo/tmp.i8NuhzbEJN
```

对于 `tempfile`，可以使用 `--directory` 或 `-d` 选项：

```
$ tempfile --directory ~/Demo/
/home/sek/Demo/fileIhg9aX
```

### 找到你的临时文件

使用自动生成的临时文件的问题是你无法知道它的名字是什么。这就是为什么两个命令都返回生成的文件名作为输出的原因。你可以使用 Konsole、GNOME 终端或 [rxvt][2] 等交互式 shell 来使用终端上显示的文件名与文件进行交互。

但是，如果你正在编写脚本，则无法通过读取文件名并在以下命令中使用它来进行干预。

`mktemp` 和 `tempfile` 的作者想到了这个问题，并且有一个简单的解决方法。终端将输出发送到名为“标准输出”的流。你可以通过将变量设置为在子 shell 中启动的命令的结果来捕获标准输出：

```
$ TMPFILE=$(mktemp -p ~/Demo)

$ echo $TMPFILE
/home/tux/Demo/tmp.PjP3g6lCq1
```

引用文件时使用 `$TMPFILE`，它与直接与文件本身交互相同。

### 使用 mktemp 创建一个临时目录

你还可以使用 `mktemp` 命令创建目录而不是文件：

```
$ mktemp --directory -p ~/Demo/
/home/tux/Demo/tmp.68ukbuluqI

$ file /home/tux/Demo/tmp.68ukbuluqI
/home/tux/Demo/tmp.68ukbuluqI: directory
```

### 自定义临时名称

有时你甚至可能希望在伪随机生成的文件名中加入可预测性元素。你可以使用这两个命令自定义临时文件的名称。

使用 `mktemp`，你可以为文件名添加后缀：

```
$ mktemp -p ~/Demo/ --suffix .mine
/home/tux/Demo/tmp.dufLYfwJLO.mine
```

使用 `tempfile`，你可以设置前缀和后缀：

```
$ tempfile --directory ~/Demo/ --prefix tt_ --suffix .mine
/home/tux/Demo/tt_0dfu5q.mine
```

### 把 tempfile 作为 touch 使用

你还可以使用 `tempfile` 设置自定义名称：

```
$ tempfile --name not_random
not_random
```

当你使用 `--name` 选项时，它是绝对的，忽略所有其他形式的自定义。事实上，它甚至忽略了 `--directory` 选项：

```
$ tempfile --directory ~/Demo --prefix this_is_ --suffix .all --name not_random_at
not_random_at
```

在某种程度上，`tempfile` 可以替代 `touch` 和 `test`，因为它拒绝创建已经存在的文件：

```
$ tempfile --name example.txt
open: file exists
```

`tempfile` 命令并非默认安装在所有 Linux 发行版上，因此在将其用作脚本中的 `test` 的 hack 之前，你必须确保它存在。

### 安装 mktemp 和 tempfile

[GNU Core Utils][3] 包括 `mktemp` 命令。主要发行版默认包括 Core Utils（它是包含 `chmod`、`cut`、`du` 和其他基本命令的同一个软件包）。

Debian Utils 软件包包含 `tempfile` 命令，默认安装在大多数基于 Debian 的发行版和 Slackware Linux 上。

### 总结

临时文件很方便，因为不会混淆它们是否可以安全删除。它们是临时的，意在根据需要使用并毫不犹豫地丢弃。在需要时使用它们，并在完成后清除它们。

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/6/make-temporary-file-bash

作者：[Seth Kenlon][a]
选题：[lkxed][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lkxed
[1]: https://opensource.com/sites/default/files/lead-images/bash_command_line.png
[2]: https://opensource.com/article/19/10/why-use-rxvt-terminal
[3]: https://www.gnu.org/software/coreutils/

使用 Ultimate Plumber 即时预览管道命令结果
======

![](https://www.ostechnix.com/wp-content/uploads/2018/10/Ultimate-Plumber-720x340.jpg)

管道命令的作用是将一个命令/程序/进程的输出发送给另一个命令/程序/进程，以便将输出结果进行进一步的处理。我们可以通过使用管道命令把多个命令组合起来，使一个命令的标准输入或输出重定向到另一个命令。两个或多个 Linux 命令之间的竖线字符（`|`）表示在命令之间使用管道命令。管道命令的一般语法如下所示：

```
Command-1 | Command-2 | Command-3 | …| Command-N
```

Ultimate Plumber（简称 UP）是一个命令行工具，它可以用于即时预览管道命令结果。如果你在使用 Linux 时经常会用到管道命令，就可以通过它更好地运用管道命令了。它可以预先显示执行管道命令后的结果，而且是即时滚动地显示，让你可以轻松构建复杂的管道。

下文将会介绍如何安装 UP 并用它将复杂管道命令的编写变得简单。


**重要警告：**

在生产环境中请谨慎使用 UP！在使用它的过程中，有可能会在无意中删除重要数据，尤其是搭配 `rm` 或 `dd` 命令时需要更加小心。勿谓言之不预。

### 使用 Ultimate Plumber 即时预览管道命令

下面给出一个简单的例子介绍 `up` 的使用方法。如果需要将 `lshw` 命令的输出传递给 `up`，只需要在终端中输入以下命令，然后回车：

```
$ lshw |& up
```

你会在屏幕顶部看到一个输入框，如下图所示。

![](https://www.ostechnix.com/wp-content/uploads/2018/10/Ultimate-Plumber.png)

在输入命令的过程中，输入管道符号并回车，就可以立即执行已经输入了的命令。Ultimate Plumber 会在下方的可滚动窗口中即时显示管道命令的输出。在这种状态下，你可以通过 `PgUp`/`PgDn` 键或 `ctrl + ←`/`ctrl + →` 组合键来查看结果。

当你满意执行结果之后，可以使用 `ctrl + x` 组合键退出 `UP`。而退出前编写的管道命令则会保存在当前工作目录的文件中，并命名为 `up1.sh`。如果这个文件名已经被占用，就会命名为 `up2.sh`、`up3.sh` 等等以此类推，直到第 1000 个文件。如果你不需要将管道命令保存输出，只需要使用 `ctrl + c` 组合键退出即可。

通过 `cat` 命令可以查看 `upX.sh` 文件的内容。例如以下是我的 `up2.sh` 文件的输出内容：

```
$ cat up2.sh
#!/bin/bash
grep network -A5 | grep : | cut -d: -f2- | paste - -
```

如果通过管道发送到 `up` 的命令运行时间太长，终端窗口的左上角会显示一个波浪号（~）字符，这就表示 `up` 在等待前一个命令的输出结果作为输入。在这种情况下，你可能需要使用 `ctrl + s` 组合键暂时冻结 `up` 的输入缓冲区大小。在需要解冻的时候，使用 `ctrl + q` 组合键即可。Ultimate Plumber 的输入缓冲区大小一般为 40 MB，到达这个限制之后，屏幕的左上角会显示一个加号。

以下是 `up` 命令的一个简单演示：

![](https://www.ostechnix.com/wp-content/uploads/2018/10/up.gif)

### 安装 Ultimate Plumber

喜欢这个工具的话，你可以在你的 Linux 系统上安装使用。安装过程也相当简单，只需要在终端里执行以下两个命令就可以安装 `up` 了。

首先从 Ultimate Plumber 的[发布页面][1]下载最新的二进制文件，并将放在你系统的某个路径下，例如 `/usr/local/bin/`。

```
$ sudo wget -O /usr/local/bin/up wget https://github.com/akavel/up/releases/download/v0.2.1/up
```

然后向 `up` 二进制文件赋予可执行权限：

```
$ sudo chmod a+x /usr/local/bin/up
```

至此，你已经完成了 `up` 的安装，可以开始编写你的管道命令了。


--------------------------------------------------------------------------------

via: https://www.ostechnix.com/ultimate-plumber-writing-linux-pipes-with-instant-live-preview/

作者：[SK][a]
选题：[lujun9972][b]
译者：[HankChow](https://github.com/HankChow)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.ostechnix.com/author/sk/
[b]: https://github.com/lujun9972
[1]: https://github.com/akavel/up/releases


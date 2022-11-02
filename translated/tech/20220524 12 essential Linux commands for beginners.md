[#]: subject: "12 essential Linux commands for beginners"
[#]: via: "https://opensource.com/article/22/5/essential-linux-commands"
[#]: author: "Don Watkins https://opensource.com/users/don-watkins"
[#]: collector: "lkxed"
[#]: translator: "chai001125"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

新手教程：12 个重要的 Linux 命令
======
我向所有的 Linux 初学者推荐以下这些命令。

![Command line prompt][1]

在使用 Linux 命令行时，很容易就会迷失方向，这可能会导致灾难性的后果：我有一次使用 <ruby> 删除命令<rt> `rm` command </rt> </ruby> 删除文件，然而删除之后我才意识到我刚刚是删除了计算机的引导目录。后来，我学会了使用 `pwd` 命令，来知道当前在文件系统的哪个目录下；并且我使用了 [trashy 和 trash-cli][2] 这一命令行回收站工具，在删除文件时 trash-cli 会充当中间人，将文件先“删除”到桌面上的垃圾箱中，能够通过垃圾箱或通过终端的 `trash` 命令，来恢复垃圾箱中已删除的文件。

当我刚开始使用 Linux 时，我有一个放在桌子上的“作弊小抄”，它就是 <ruby> *《101 条你应该知道的 Linux 命令》*<rt> 101 commands for Linux </rt> </ruby> ，我在管理 Linux 服务器时能参考“作弊小抄”上面的这些命令。随着我越来越熟悉这些命令，我越来越精通服务器管理了。

以下是我认为最有用的 12 个 Linux 命令。

### 1. 打印工作目录（pwd）

`pwd` 命令会打印出你的工作目录。换句话来说，它输出你当前所在目录的路径。`pwd` 命令有两种选项：`-L`(即逻辑路径 logical) 用来打印当前的目录路径（不考虑符号链接），`-P` (即物理路径 physical)会解析符号链接，并打印出物理目录。你可以进一步阅读我们翻译的 [另一篇文章](https://linux.cn/article-4356-1.html)

### 2. 创建目录（mkdir）

使用 `mkdir` 命令来创建一个新目录，是非常容易的。以下命令，创建了一个名为 `example` 目录（若 `example` 已存在，则无法创建）：

```
$ mkdir example
```

你也可以在嵌套地创建目录及其子目录：

```
$ mkdir -p example/one/two
```

如果目录 `example` 和目录 `one` 都已存在，则仅会创建目录 `two`。如果上述目录都不存在，则会创建三个嵌套目录。

### 3. 列出文件（ls）

我最早使用的是 MS-DOS（微软磁盘操作系统），因此我习惯于使用 `dir` 命令，来列出文件。我不记得当时是否能在 Linux 上使用 `dir` 命令，但是如今 `dir` 命令已经包含在 <ruby> GNU 核心实用程序包 <rt> GNU Core Utilities package </rt></ruby> 中了。大多数人会使用 `ls` 命令，来显示目录中的文件及其所有的属性。`ls` 命令有许多选项，包括 `-l` 查看文件的长列表，显示文件所有者和权限等信息。

### 4. 更改当前工作目录（cd）

在 Linux 中经常要更改当前工作目录，这就是 `cd` 命令的功能。例如，以下的示例将让你从 <ruby> 主目录 <rt> home </rt></ruby>进入 `Documents` 目录：

```
$ cd Documents
```

你可以使用 `cd ~`或者`cd`，来快速转换到你的 <ruby> 主目录 <rt> home </rt></ruby>。你可以使用 `cd ..` 来返回到上一级目录。

### 5. 删除文件（rm）

删除文件是很危险的，因为在 Linux 终端上用 `rm` 命令会**彻底地**删除文件，并没有像桌面的垃圾桶那样依旧保存着删除的文件。许多终端用户有一个坏习惯，他们会永久地删除他们认为不再需要的文件。然而，因为没有“取消删除”命令，这个坏习惯可能会导致严重的问题：你会不小心删除了包含重要数据的目录。

Linux 系统为文件删除提供了 `rm` 和 `shred` 命令。要删除文件 `example.txt`，请输入以下内容：

```
$ rm example.txt
```

然而，使用 trash 命令要安全得多，例如[trashy][3] 或者 [trash-cli][4]，它会将文件先“删除”到桌面上的垃圾箱中：

```
$ trash example.txt
```

关于 Trash-Cli 的更多信息可以参考我们翻译的 [另一篇文章](https://linux.cn/article-10029-1.html)。

### 6. 复制文件（cp）

使用 `cp` 命令，来复制文件。`cp` 的语法是从*旧文件*复制到*新文件*。这里有一个例子：

```
$ cp file1.txt newfile1.txt
```

你也可以复制整个目录：

```
$ cp -r dir1 newdirectory
```

### 7. 移动并重命名文件（mv）

重命名和移动文件在功能上是相同的过程。当你移动文件时，从一个目录中取出一个文件，并将其放入一个新目录中；当你重命名文件时，将一个目录中的文件更改为新名称，并放回到同一目录或另一个目录下。无论是重命名还是移动文件，你都可以使用 `mv` 命令：

```
$ mv file1.txt file_001.txt
```

### 8. 创建一个空文件（touch）

使用 `touch` 命令可以简单地创建一个空文件：

```
$ touch one.txt

$ touch two.txt

$ touch three.md
```

### 9. 更改权限（chmod）

使用 `chmod` 命令，来更改文件的权限。`chmod` 最常见的用途是让文件能够执行：

```
$ chmod +x myfile
```

以下的示例展示了如何用 `chmod` 命令给文件赋予权限，这对于脚本来说特别方便。尝试一下这个简单的练习吧：

```
$ echo 'echo Hello $USER' > hello.sh

$ chmod +x hello.sh

$ ./hello.sh
Hello, Don
```

### 10. 提升为 root 权限（sudo）

在管理自己的 Linux 系统时，可能需要提升为超级用户（也称为 root），这就是 `sudo`（即 *super user do*）命令的来源。假设你想要做一些只有管理员（或 root 用户）才能做的事情，只需在命令前加一个 `sudo` 即可：

```
$ touch /etc/os-release && echo "Success"
touch: cannot touch '/etc/os-release': Permission denied

$ sudo touch /etc/os-release && echo "Success"
Success
```

### 11. 关机（poweroff）

`poweroff` 命令的功能和它的字面意思一样：把你的计算机关机。需要在 `poweroff` 前面加一个 `sudo` 才能成功关机。

实际上，还有很多方法可以关闭你的计算机，这些方法有略微的不同。例如，`shutdown` 命令会在指定的时间（例如 60 秒）后关闭计算机：

```
$ sudo shutdown -h 60
```

Or immediately:
或者立即关闭计算机：

```
$ sudo shutdown -h now
```

你也可以用 `sudo shutdown -r now` 或者 `reboot` 来重启计算机。

### 12. 阅读手册（man）

`man` 命令可能是 Linux 中最重要的命令了，你可以通过 `man` 命令查看 Linux 系统上每个命令的官方文档。例如，要阅读更多有关 `mkdir` 的信息，可以输入：

```
$ man mkdir
```

一个与 `man` 相关的命令是 `info` 命令，它提供了一组不同的手册，它通常会提供比简洁的 `man` 页面更详细一点的内容。

### 你最喜欢的 Linux  命令是什么？

There are many more commands on a Linux system—hundreds! What's your favorite command, the one you find yourself using time and time again?
Linux 系统上还有数百个其他命令！你最喜欢使用的 Linux 命令是什么呢？什么命令是你一直反复使用的呢？

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/5/essential-linux-commands

作者：[Don Watkins][a]
选题：[lkxed][b]
译者：[chai001125](https://github.com/chai001125)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/don-watkins
[b]: https://github.com/lkxed
[1]: https://opensource.com/sites/default/files/lead-images/command_line_prompt.png
[2]: https://www.redhat.com/sysadmin/recover-file-deletion-linux
[3]: https://gitlab.com/trashy/trashy
[4]: https://github.com/andreafrancia/trash-cli

[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11159-1.html)
[#]: subject: (Master the Linux 'ls' command)
[#]: via: (https://opensource.com/article/19/7/master-ls-command)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

精通 Linux 的 ls 命令
======

> Linux 的 ls 命令拥有数量惊人的选项，可以提供有关文件的重要信息。

![](https://img.linux.net.cn/data/attachment/album/201907/29/105754ii3874q2ww7lo882.jpg)

`ls` 命令可以列出一个 [POSIX][2] 系统上的文件。这是一个简单的命令，但它经常被低估，不是它能做什么（因为它确实只做了一件事），而是你该如何优化对它的使用。

要知道在最重要的 10 个终端命令中，这个简单的 `ls` 命令可以排进前三，因为 `ls` 不会*只是*列出文件，它还会告诉你有关它们的重要信息。它会告诉你诸如拥有文件或目录的人、每个文件修改的时间、甚至是什么类型的文件。它的附带功能能让你了解你在哪里、附近有些什么，以及你可以用它们做什么。

如果你对 `ls` 的体验仅限于你的发行版在 `.bashrc` 中的别名，那么你可能错失了它。

### GNU 还是 BSD？

在了解 `ls` 的隐藏能力之前，你必须确定你正在运行哪个 `ls` 命令。有两个最流行的版本：包含在 GNU coreutils 包中的 GNU 版本，以及 BSD 版本。如果你正在运行 Linux，那么你很可能已经安装了 GNU 版本的 `ls`（LCTT 译注：几乎可以完全确定）。如果你正在运行 BSD 或 MacOS，那么你有的是 BSD 版本。本文会介绍它们的不同之处。

你可以使用 `--version` 选项找出你计算机上的版本：

```
$ ls --version
```

如果它返回有关 GNU coreutils 的信息，那么你拥有的是 GNU 版本。如果它返回一个错误，你可能正在运行的是 BSD 版本（运行 `man ls | head` 以确定）。

你还应该调查你的发行版可能具有哪些预设选项。终端命令的自定义通常放在 `$HOME/.bashrc` 或 `$HOME/.bash_aliases` 或 `$HOME/.profile` 中，它们是通过将 `ls` 别名化为更复杂的 `ls` 命令来完成的。例如：

```
alias ls='ls --color'
```

发行版提供的预设非常有用，但它们确实很难分辨出哪些是 `ls` 本身的特性，哪些是它的附加选项提供的。你要是想要运行 `ls` 命令本身而不是它的别名，你可以用反斜杠“转义”命令：

```
$ \ls
```

### 分类

单独运行 `ls` 会以适合你终端的列数列出文件：

```
$ ls ~/example
bunko        jdk-10.0.2
chapterize   otf2ttf.ff
despacer     overtar.sh
estimate.sh  pandoc-2.7.1
fop-2.3      safe_yaml
games        tt
```

这是有用的信息，但所有这些文件看起来基本相同，没有方便的图标来快速表示出哪个是目录、文本文件或图像等等。

使用 `-F`（或 GNU 上的长选项 `--classify`）以在每个条目之后显示标识文件类型的指示符：

```
$ ls ~/example
bunko         jdk-10.0.2/
chapterize*   otf2ttf.ff*
despacer*     overtar.sh*
estimate.sh   pandoc@
fop-2.3/      pandoc-2.7.1/
games/        tt*
```

使用此选项，终端中列出的项目使用简写符号来按文件类型分类：

* 斜杠（`/`）表示目录（或“文件夹”）。
* 星号（`*`）表示可执行文件。这包括二进制文件（编译代码）以及脚本（具有[可执行权限][3]的文本文件）。
* 符号（`@`）表示符号链接（或“别名”）。
* 等号（`=`）表示套接字。
* 在 BSD 上，百分号（`%`）表示<ruby>涂改<rt>whiteout</rt></ruby>（某些文件系统上的文件删除方法）。
* 在 GNU 上，尖括号（`>`）表示<ruby>门<rt>door</rt></ruby>（[Illumos][4] 和 Solaris上的进程间通信）。
* 竖线（`|`）表示 [FIFO][5] 管道。
   
这个选项的一个更简单的版本是 `-p`，它只区分文件和目录。

（LCTT 译注：在支持彩色的终端上，使用 `--color` 选项可以以不同的颜色来区分文件类型，但要注意如果将输出导入到管道中，则颜色消失。）

### 长列表

从 `ls` 获取“长列表”的做法是如此常见，以至于许多发行版将 `ll` 别名为 `ls -l`。长列表提供了许多重要的文件属性，例如权限、拥有每个文件的用户、文件所属的组、文件大小（以字节为单位）以及文件上次更改的日期：

```
$ ls -l
-rwxrwx---. 1 seth users         455 Mar  2  2017 estimate.sh
-rwxrwxr-x. 1 seth users         662 Apr 29 22:27 factorial
-rwxrwx---. 1 seth users    20697793 Jun 29  2018 fop-2.3-bin.tar.gz
-rwxrwxr-x. 1 seth users        6210 May 22 10:22 geteltorito
-rwxrwx---. 1 seth users         177 Nov 12  2018 html4mutt.sh
[...]
```

如果你不想以字节为单位，请添加 `-h` 标志（或 GNU 中的 `--human`）以将文件大小转换为更加人性化的表示方法：

```
$ ls --human
-rwxrwx---. 1 seth users    455 Mar  2  2017 estimate.sh
-rwxrwxr-x. 1 seth seth     662 Apr 29 22:27 factorial
-rwxrwx---. 1 seth users    20M Jun 29  2018 fop-2.3-bin.tar.gz
-rwxrwxr-x. 1 seth seth    6.1K May 22 10:22 geteltorito
-rwxrwx---. 1 seth users    177 Nov 12  2018 html4mutt.sh
```

要看到更少的信息，你可以带有 `-o` 选项只显示所有者的列，或带有 `-g` 选项只显示所属组的列：

```
$ ls -o
-rwxrwx---. 1 seth    455 Mar  2  2017 estimate.sh
-rwxrwxr-x. 1 seth    662 Apr 29 22:27 factorial
-rwxrwx---. 1 seth    20M Jun 29  2018 fop-2.3-bin.tar.gz
-rwxrwxr-x. 1 seth   6.1K May 22 10:22 geteltorito
-rwxrwx---. 1 seth    177 Nov 12  2018 html4mutt.sh
```

也可以将两个选项组合使用以显示两者。

### 时间和日期格式

`ls` 的长列表格式通常如下所示：

```
-rwxrwx---. 1 seth users         455 Mar  2  2017 estimate.sh
-rwxrwxr-x. 1 seth users         662 Apr 29 22:27 factorial
-rwxrwx---. 1 seth users    20697793 Jun 29  2018 fop-2.3-bin.tar.gz
-rwxrwxr-x. 1 seth users        6210 May 22 10:22 geteltorito
-rwxrwx---. 1 seth users         177 Nov 12  2018 html4mutt.sh
```

月份的名字不便于排序，无论是通过计算还是识别（取决于你的大脑是否倾向于喜欢字符串或整数）。你可以使用 `--time-style` 选项和格式名称更改时间戳的格式。可用格式为：

* `full-iso`：ISO 完整格式（1970-01-01 21:12:00）
* `long-iso`：ISO 长格式（1970-01-01 21:12）
* `iso`：iso 格式（01-01 21:12）
* `locale`：本地化格式（使用你的区域设置）
* `posix-STYLE`：POSIX 风格（用区域设置定义替换 `STYLE`）

你还可以使用 `date` 命令的正式表示法创建自定义样式。

### 按时间排序

通常，`ls` 命令按字母顺序排序。你可以使用 `-t` 选项根据文件的最近更改的时间（最新的文件最先列出）进行排序。

例如：

```
$ touch foo bar baz
$ ls
bar  baz  foo
$ touch foo
$ ls -t
foo bar baz
```

### 列出方式

`ls` 的标准输出平衡了可读性和空间效率，但有时你需要按照特定方式排列的文件列表。

要以逗号分隔文件列表，请使用 `-m`：

```
ls -m ~/example
bar, baz, foo
```

要强制每行一个文件，请使用 `-1` 选项（这是数字 1，而不是小写的 L）：

```
$ ls -1 ~/bin/
bar
baz
foo
```

要按文件扩展名而不是文件名对条目进行排序，请使用 `-X`（这是大写 X）：

```
$ ls
bar.xfc  baz.txt  foo.asc
$ ls -X
foo.asc  baz.txt  bar.xfc
```

### 隐藏杂项

在某些 `ls` 列表中有一些你可能不关心的条目。例如，元字符 `.` 和 `..` 分别代表“本目录”和“父目录”。如果你熟悉在终端中如何切换目录，你可能已经知道每个目录都将自己称为 `.`，并将其父目录称为 `..`，因此当你使用 `-a` 选项显示隐藏文件时并不需要它经常提醒你。

要显示几乎所有隐藏文件（`.` 和 `..` 除外），请使用 `-A` 选项：

```
$ ls -a
.
..
.android
.atom
.bash_aliases
[...]
$ ls -A
.android
.atom
.bash_aliases
[...]
```

有许多优秀的 Unix 工具有保存备份文件的传统，它们会在保存文件的名称后附加一些特殊字符作为备份文件。例如，在 Vim 中，备份会以在文件名后附加 `~` 字符的文件名保存。

这些类型的备份文件已经多次使我免于愚蠢的错误，但是经过多年享受它们提供的安全感后，我觉得不需要用视觉证据来证明它们存在。我相信 Linux 应用程序可以生成备份文件（如果它们声称这样做的话），我很乐意相信它们存在 —— 而不用必须看到它们。

要隐藏备份文件，请使用 `-B` 或 `--ignore-backups` 隐藏常用备份格式（此选项在 BSD 的 `ls` 中不可用）：

```
$ ls
bar.xfc  baz.txt  foo.asc~  foo.asc
$ ls -B
bar.xfc  baz.txt  foo.asc
```

当然，备份文件仍然存在；它只是过滤掉了，你不必看到它。

除非另有配置，GNU Emacs 在文件名的开头和结尾添加哈希字符（`＃`）来保存备份文件（`#file＃`）。其他应用程序可能使用不同的样式。使用什么模式并不重要，因为你可以使用 `--hide` 选项创建自己的排除项：

```
$ ls
bar.xfc  baz.txt  #foo.asc#  foo.asc
$ ls --hide="#*#"
bar.xfc  baz.txt  foo.asc
```

### 递归地列出目录

除非你在指定目录上运行 `ls`，否则子目录的内容不会与 `ls` 命令一起列出：

```
$ ls -F
example/  quux*  xyz.txt
$ ls -R
quux  xyz.txt

./example:
bar.xfc  baz.txt  #foo.asc#  foo.asc
```

### 使用别名使其永久化

`ls` 命令可能是 shell 会话期间最常使用的命令。这是你的眼睛和耳朵，为你提供上下文信息和确认命令的结果。虽然有很多选项很有用，但 `ls` 之美的一部分就是简洁：两个字符和回车键，你就知道你到底在哪里以及附近有什么。如果你不得不停下思考（更不用说输入）几个不同的选项，它会变得不那么方便，所以通常情况下，即使最有用的选项也不会用了。

解决方案是为你的 `ls` 命令添加别名，以便在使用它时，你可以获得最关心的信息。

要在 Bash shell 中为命令创建别名，请在主目录中创建名为 `.bash_aliases` 的文件（必须在开头包含 `.`）。 在此文件中，列出要创建的别名，然后是要为其创建别名的命令。例如：

```
alias ls='ls -A -F -B --human --color'
```

这一行导致你的 Bash shell 将 `ls` 命令解释为 `ls -A -F -B --human --color`。

你不必仅限于重新定义现有命令，还可以创建自己的别名：

```
alias ll='ls -l'
alias la='ls -A'
alias lh='ls -h'
```

要使别名起作用，shell 必须知道 `.bash_aliases` 配置文件存在。在编辑器中打开 `.bashrc` 文件（如果它不存在则创建它），并包含以下代码块：

```
if [ -e $HOME/.bash_aliases ]; then
    source $HOME/.bash_aliases
fi
```

每次加载 `.bashrc`（这是一个新的 Bash shell 启动的时候），Bash 会将 `.bash_aliases` 加载到你的环境中。你可以关闭并重新启动 Bash 会话，或者直接强制它执行此操作：

```
$ source ~/.bashrc
```

如果你忘了你是否有别名命令，`which` 命令可以告诉你：

```
$ which ls
alias ls='ls -A -F -B --human --color'
        /usr/bin/ls
```

如果你将 `ls` 命令别名为带有选项的 `ls` 命令，则可以通过将反斜杠前缀到 `ls` 前来覆盖你的别名。例如，在示例别名中，使用 `-B` 选项隐藏备份文件，这意味着无法使用 `ls` 命令显示备份文件。 可以覆盖该别名以查看备份文件：

```
$ ls
bar  baz  foo
$ \ls
bar  baz  baz~  foo
```

### 做一件事，把它做好

`ls` 命令有很多选项，其中许多是特定用途的或高度依赖于你所使用的终端。在 GNU 系统上查看 `info ls`，或在 GNU 或 BSD 系统上查看 `man ls` 以了解更多选项。

你可能会觉得奇怪的是，一个以每个工具“做一件事，把它做好”的前提而闻名的系统会让其最常见的命令背负 50 个选项。但是 `ls` 只做一件事：它列出文件，而这 50 个选项允许你控制接收列表的方式，`ls` 的这项工作做得非常、*非常*好。

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/7/master-ls-command

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/sethhttps://opensource.com/users/sambocettahttps://opensource.com/users/scottnesbitthttps://opensource.com/users/sethhttps://opensource.com/users/marcobravohttps://opensource.com/users/sethhttps://opensource.com/users/don-watkinshttps://opensource.com/users/sethhttps://opensource.com/users/jamesfhttps://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/yearbook-haff-rx-linux-file-lead_0.png?itok=-i0NNfDC (Hand putting a Linux file folder into a drawer)
[2]: https://opensource.com/article/19/7/what-posix-richard-stallman-explains
[3]: https://opensource.com/article/19/6/understanding-linux-permissions
[4]: https://www.illumos.org/
[5]: https://en.wikipedia.org/wiki/FIFO_(computing_and_electronics)

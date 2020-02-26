[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11179-1.html)
[#]: subject: (Bash aliases you can’t live without)
[#]: via: (https://opensource.com/article/19/7/bash-aliases)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

不可或缺的 Bash 别名
======

> 厌倦了一遍又一遍地输入相同的长命令？你觉得在命令行上工作效率低吗？Bash 别名可以为你创造一个与众不同的世界。

![](https://img.linux.net.cn/data/attachment/album/201908/03/095855ip0h0jpi5u9t3r00.jpg)

Bash 别名是一种用新的命令补充或覆盖 Bash 命令的方法。Bash 别名使用户可以轻松地在 [POSIX][2] 终端中自定义其体验。它们通常定义在 `$HOME/.bashrc` 或 `$HOME/bash_aliases` 中（它是由 `$HOME/.bashrc` 加载的）。

大多数发行版在新用户帐户的默认 `.bashrc` 文件中至少添加了一些流行的别名。这些可以用来简单演示 Bash 别名的语法：

```
alias ls='ls -F'
alias ll='ls -lh'
```

但并非所有发行版都附带预先添加好的别名。如果你想手动添加别名，则必须将它们加载到当前的 Bash 会话中：

```
$ source ~/.bashrc
```

否则，你可以关闭终端并重新打开它，以便重新加载其配置文件。

通过 Bash 初始化脚本中定义的那些别名，你可以键入 `ll` 而得到 `ls -l` 的结果，当你键入 `ls` 时，得到也不是原来的 [ls][3] 的普通输出。

那些别名很棒，但它们只是浅尝辄止。以下是十大 Bash 别名，一旦你试过它们，你会发现再也不能离开它们。

### 首先设置

在开始之前，创建一个名为 `~/.bash_aliases` 的文件：

```
$ touch ~/.bash_aliases
```

然后，确认这些代码出现在你的 `~/.bashrc` 文件当中：

```
if [ -e $HOME/.bash_aliases ]; then
    source $HOME/.bash_aliases
fi
```

如果你想亲自尝试本文中的任何别名，请将它们输入到 `.bash_aliases` 文件当中，然后使用 `source ~/.bashrc` 命令将它们加载到当前 Bash 会话中。

### 按文件大小排序

如果你一开始使用过 GNOME 中的 Nautilus、MacOS 中的 Finder 或 Windows 中的资源管理器等 GUI 文件管理器，那么你很可能习惯了按文件大小排序文件列表。你也可以在终端上做到这一点，但这条命令不是很简洁。

将此别名添加到 GNU 系统上的配置中：

```
alias lt='ls --human-readable --size -1 -S --classify'
```

此别名将 `lt` 替换为 `ls` 命令，该命令在单个列中显示每个项目的大小，然后按大小对其进行排序，并使用符号表示文件类型。加载新别名，然后试一下：

```
$ source ~/.bashrc
$ lt
total 344K
140K configure*
 44K aclocal.m4
 36K LICENSE
 32K config.status*
 24K Makefile
 24K Makefile.in
 12K config.log
8.0K README.md
4.0K info.slackermedia.Git-portal.json
4.0K git-portal.spec
4.0K flatpak.path.patch
4.0K Makefile.am*
4.0K dot-gitlab.ci.yml
4.0K configure.ac*
   0 autom4te.cache/
   0 share/
   0 bin/
   0 install-sh@
   0 compile@
   0 missing@
   0 COPYING@
```

在 MacOS 或 BSD 上，`ls` 命令没有相同的选项，因此这个别名可以改为：

```
alias lt='du -sh * | sort -h'
```

这个版本的结果稍有不同：

```
$ du -sh * | sort -h
0       compile
0       COPYING
0       install-sh
0       missing
4.0K    configure.ac
4.0K    dot-gitlab.ci.yml
4.0K    flatpak.path.patch
4.0K    git-portal.spec
4.0K    info.slackermedia.Git-portal.json
4.0K    Makefile.am
8.0K    README.md
12K     config.log
16K     bin
24K     Makefile
24K     Makefile.in
32K     config.status
36K     LICENSE
44K     aclocal.m4
60K     share
140K    configure
476K    autom4te.cache
```

实际上，即使在 Linux上，上面这个命令也很有用，因为使用 `ls` 列出的目录和符号链接的大小为 0，这可能不是你真正想要的信息。使用哪个看你自己的喜好。

*感谢 Brad Alexander 提供的这个别名的思路。*

### 只查看挂载的驱动器

`mount` 命令过去很简单。只需一个命令，你就可以获得计算机上所有已挂载的文件系统的列表，它经常用于概览连接到工作站有哪些驱动器。在过去看到超过三、四个条目就会令人印象深刻，因为大多数计算机没有那么多的 USB 端口，因此这个结果还是比较好查看的。

现在计算机有点复杂，有 LVM、物理驱动器、网络存储和虚拟文件系统，`mount` 的结果就很难一目了然：

```
sysfs on /sys type sysfs (rw,nosuid,nodev,noexec,relatime,seclabel)
proc on /proc type proc (rw,nosuid,nodev,noexec,relatime)
devtmpfs on /dev type devtmpfs (rw,nosuid,seclabel,size=8131024k,nr_inodes=2032756,mode=755)
securityfs on /sys/kernel/security type securityfs (rw,nosuid,nodev,noexec,relatime)
[...]
/dev/nvme0n1p2 on /boot type ext4 (rw,relatime,seclabel)
/dev/nvme0n1p1 on /boot/efi type vfat (rw,relatime,fmask=0077,dmask=0077,codepage=437,iocharset=ascii,shortname=winnt,errors=remount-ro)
[...]
gvfsd-fuse on /run/user/100977/gvfs type fuse.gvfsd-fuse (rw,nosuid,nodev,relatime,user_id=100977,group_id=100977)
/dev/sda1 on /run/media/seth/pocket type ext4 (rw,nosuid,nodev,relatime,seclabel,uhelper=udisks2)
/dev/sdc1 on /run/media/seth/trip type ext4 (rw,nosuid,nodev,relatime,seclabel,uhelper=udisks2)
binfmt_misc on /proc/sys/fs/binfmt_misc type binfmt_misc (rw,relatime)
```

要解决这个问题，试试这个别名：

```
alias mnt='mount | awk -F' ' '{ printf "%s\t%s\n",$1,$3; }' | column -t | egrep ^/dev/ | sort'
```

此别名使用 `awk` 按列解析 `mount` 的输出，将输出减少到你可能想要查找的内容（挂载了哪些硬盘驱动器，而不是文件系统）：

```
$ mnt
/dev/mapper/fedora-root  /
/dev/nvme0n1p1           /boot/efi
/dev/nvme0n1p2           /boot
/dev/sda1                /run/media/seth/pocket
/dev/sdc1                /run/media/seth/trip
```

在 MacOS 上，`mount` 命令不提供非常详细的输出，因此这个别名可能过度精简了。但是，如果你更喜欢简洁的报告，请尝试以下方法：

```
alias mnt='mount | grep -E ^/dev | column -t'
```

结果：

```
$ mnt
/dev/disk1s1  on  /                (apfs,  local,  journaled)
/dev/disk1s4  on  /private/var/vm  (apfs,  local,  noexec,     journaled,  noatime,  nobrowse)
```

### 在你的 grep 历史中查找命令

有时你好不容易弄清楚了如何在终端完成某件事，并觉得自己永远不会忘记你刚学到的东西。然后，一个小时过去之后你就完全忘记了你做了什么。

搜索 Bash 历史记录是每个人不时要做的事情。如果你确切地知道要搜索的内容，可以使用 `Ctrl + R` 对历史记录进行反向搜索，但有时你无法记住要查找的确切命令。

这是使该任务更容易的别名：

```
alias gh='history|grep'
```

这是如何使用的例子：

```
$ gh bash
482 cat ~/.bashrc | grep _alias
498 emacs ~/.bashrc
530 emacs ~/.bash_aliases
531 source ~/.bashrc
```

### 按修改时间排序

每个星期一都会这样：你坐在你的电脑前开始工作，你打开一个终端，你发现你已经忘记了上周五你在做什么。你需要的是列出最近修改的文件的别名。

你可以使用 `ls` 命令创建别名，以帮助你找到上次离开的位置：

```
alias left='ls -t -1'
```

输出很简单，但如果你愿意，可以使用 `--long` 选项扩展它。这个别名列出的显示如下：

```
$ left
demo.jpeg
demo.xcf
design-proposal.md
rejects.txt
brainstorm.txt
query-letter.xml
```

### 文件计数

如果你需要知道目录中有多少文件，那么该解决方案是 UNIX 命令构造的最典型示例之一：使用 `ls` 命令列出文件，用`-1` 选项将其输出控制为只有一列，然后输出到 `wc`（单词计数）命令的管道，以计算有多少行。

这是 UNIX 理念如何允许用户使用小型的系统组件构建自己的解决方案的精彩演示。如果你碰巧每天都要做几次，这个命令组合也要输入很多字母，如果没有使用 `-R` 选项，它就不能用于目录，这会为输出引入新行并导致无用的结果。

而这个别名使这个过程变得简单：

```
alias count='find . -type f | wc -l'
```

这个别名会计算文件，忽略目录，但**不会**忽略目录的内容。如果你有一个包含两个目录的项目文件夹，每个目录包含两个文件，则该别名将返回 4，因为整个项目中有 4 个文件。

```
$ ls
foo   bar
$ count
4
```

### 创建 Python 虚拟环境

你用 Python 编程吗？

你用 Python 编写了很多程序吗？

如果是这样，那么你就知道创建 Python 虚拟环境至少需要 53 次击键。

这个数字里有 49 次是多余的，它很容易被两个名为 `ve` 和 `va` 的新别名所解决：

```
alias ve='python3 -m venv ./venv'
alias va='source ./venv/bin/activate'
```

运行 `ve` 会创建一个名为 `venv` 的新目录，其中包含 Python 3 的常用虚拟环境文件系统。`va` 别名在当前 shell 中的激活该环境：

```
$ cd my-project
$ ve
$ va
(venv) $
```

### 增加一个复制进度条

每个人都会吐槽进度条，因为它们似乎总是不合时宜。然而，在内心深处，我们似乎都想要它们。UNIX 的 `cp` 命令没有进度条，但它有一个 `-v` 选项用于显示详细信息，它回显了复制的每个文件名到终端。这是一个相当不错的技巧，但是当你复制一个大文件并且想要了解还有多少文件尚未传输时，它的作用就没那么大了。

`pv` 命令可以在复制期间提供进度条，但它并不常用。另一方面，`rsync` 命令包含在几乎所有的 POSIX 系统的默认安装中，并且它被普遍认为是远程和本地复制文件的最智能方法之一。

更好的是，它有一个内置的进度条。

```
alias cpv='rsync -ah --info=progress2'
```

像使用 `cp` 命令一样使用此别名：

```
$ cpv bigfile.flac /run/media/seth/audio/
          3.83M 6%  213.15MB/s    0:00:00 (xfr#4, to-chk=0/4)
```

使用此命令的一个有趣的副作用是 `rsync` 无需 `-r` 标志就可以复制文件和目录，而 `cp` 则需要。

### 避免意外删除

你不应该使用 `rm` 命令。`rm` 手册甚至这样说：

> **警告：**如果使用 `rm` 删除文件，通常可以恢复该文件的内容。如果你想要更加确保内容真正无法恢复，请考虑使用 `shred`。

如果要删除文件，则应将文件移动到“废纸篓”，就像使用桌面时一样。

POSIX 使这很简单，因为垃圾桶是文件系统中可访问的一个实际位置。该位置可能会发生变化，具体取决于你的平台：在 [FreeDesktop][4] 上，“垃圾桶”位于 `~/.local/share/Trash`，而在 MacOS 上则是 `~/.Trash`，但无论如何，它只是一个目录，你可以将文件藏在那个看不见的地方，直到你准备永久删除它们为止。

这个简单的别名提供了一种从终端将文件扔进垃圾桶的方法：

```
alias tcn='mv --force -t ~/.local/share/Trash '
```

该别名使用一个鲜为人知的 `mv` 标志（`-t`），使你能够提供作为最终移动目标的参数，而忽略了首先列出要移动的文件的通常要求。现在，你可以使用新命令将文件和文件夹移动到系统垃圾桶：

```
$ ls
foo  bar
$ tcn foo
$ ls
bar
```

现在文件已“消失”，只有在你一头冷汗的时候才意识到你还需要它。此时，你可以从系统垃圾桶中抢救该文件；这肯定可以给 Bash 和 `mv` 开发人员提供一些帮助。

**注意：**如果你需要一个具有更好的 FreeDesktop 兼容性的更强大的垃圾桶命令，请参阅 [Trashy][5]。

### 简化 Git 工作流

每个人都有自己独特的工作流程，但无论如何，通常都会有重复的任务。如果你经常使用 Git，那么你可能会发现自己经常重复的一些操作序列。也许你会发现自己回到主分支并整天一遍又一遍地拉取最新的变化，或者你可能发现自己创建了标签然后将它们推到远端，抑或可能完全是其它的什么东西。

无论让你厌倦一遍遍输入的 Git 魔咒是什么，你都可以通过 Bash 别名减轻一些痛苦。很大程度上，由于它能够将参数传递给钩子，Git 拥有着丰富的内省命令，可以让你不必在 Bash 中执行那些丑陋冗长的命令。

例如，虽然你可能很难在 Bash 中找到项目的顶级目录（就 Bash 而言，它是一个完全随意的名称，因为计算机的绝对顶级是根目录），但 Git 可以通过简单的查询找到项目的顶级目录。如果你研究过 Git 钩子，你会发现自己能够找到 Bash 一无所知的各种信息，而你可以利用 Bash 别名来利用这些信息。

这是一个来查找 Git 项目的顶级目录的别名，无论你当前在哪个项目中工作，都可以将目录改变为顶级目录，切换到主分支，并执行 Git 拉取：

```
alias startgit='cd `git rev-parse --show-toplevel` && git checkout master && git pull'
```

这种别名绝不是一个普遍有用的别名，但它演示了一个相对简单的别名如何能够消除大量繁琐的导航、命令和等待提示。

一个更简单，可能更通用的别名将使你返回到 Git 项目的顶级目录。这个别名非常有用，因为当你在一个项目上工作时，该项目或多或少会成为你的“临时家目录”。它应该像回家一样简单，就像回你真正的家一样，这里有一个别名：

```
alias cg='cd `git rev-parse --show-toplevel`'
```

现在，命令 `cg` 将你带到 Git 项目的顶部，无论你下潜的目录结构有多深。

### 切换目录并同时查看目录内容

（据称）曾经一位著名科学家提出过，我们可以通过收集极客输入 `cd` 后跟 `ls` 消耗的能量来解决地球上的许多能量问题。

这是一种常见的用法，因为通常当你更改目录时，你都会有查看周围的内容的冲动或需要。

但是在你的计算机的目录树中移动并不一定是一个走走停停的过程。

这是一个作弊，因为它根本不是别名，但它是探索 Bash 功能的一个很好的借口。虽然别名非常适合快速替换一个命令，但 Bash 也允许你在 `.bashrc` 文件中添加本地函数（或者你加载到 `.bashrc` 中的单独函数文件，就像你的别名文件一样）。

为了保持模块化，创建一个名为 `~/.bash_functions` 的新文件，然后让你的 `.bashrc` 加载它：

```
if [ -e $HOME/.bash_functions ]; then
    source $HOME/.bash_functions
fi
```

在该函数文件中，添加这些代码：

```
function cl() {
    DIR="$*";
        # if no DIR given, go home
        if [ $# -lt 1 ]; then
                DIR=$HOME;
    fi;
    builtin cd "${DIR}" &amp;&amp; \
    # use your preferred ls command
        ls -F --color=auto
}
```

将函数加载到 Bash 会话中，然后尝试：

```
$ source ~/.bash_functions
$ cl Documents
foo bar baz
$ pwd
/home/seth/Documents
$ cl ..
Desktop  Documents  Downloads
[...]
$ pwd
/home/seth
```

函数比别名更灵活，但有了这种灵活性，你就有责任确保代码有意义并达到你的期望。别名是简单的，所以要保持简单而有用。要正式修改 Bash 的行为，请使用保存到 `PATH` 环境变量中某个位置的函数或自定义的 shell 脚本。

附注，有一些巧妙的奇技淫巧来实现 `cd` 和 `ls` 序列作为别名，所以如果你足够耐心，那么即使是一个简单的别名也永无止限。

### 开始别名化和函数化吧

可以定制你的环境使得 Linux 变得如此有趣，提高效率使得 Linux 可以改变生活。开始使用简单的别名，进而使用函数，并在评论中发布你必须拥有的别名！

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/7/bash-aliases

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/bash_command_line.png?itok=k4z94W2U (bash logo on green background)
[2]: https://opensource.com/article/19/7/what-posix-richard-stallman-explains
[3]: https://opensource.com/article/19/7/master-ls-command
[4]: https://www.freedesktop.org/wiki/
[5]: https://gitlab.com/trashy/trashy

[#]: collector: (lujun9972)
[#]: translator: (heguangzhi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11966-1.html)
[#]: subject: (How to find what you’re looking for on Linux with find)
[#]: via: (https://www.networkworld.com/article/3527420/how-to-find-what-you-re-looking-for-on-linux-with-find.html)
[#]: author: (Sandra Henry-Stocker https://www.networkworld.com/author/Sandra-Henry_Stocker/)

通过 find 命令找到你要找的东西
======

> find 命令有巨多的选项可以帮助你准确定位你在 Linux 系统上需要寻找的文件。这篇文章讨论了一系列非常有用的选项。

![](https://img.linux.net.cn/data/attachment/album/202003/06/113842txki5llopb5aagbt.jpg)

在 Linux 系统上有许多用于查找文件的命令，而你在使用它们时也有巨多的选项可以使用。

例如，你不仅可以通过文件的名称来查找文件，还可以通过文件的所有者或者组、它们的创建时间、大小、分配的权限、最后一次访问它们的时间、关联的信息节点，甚至是文件是否属于系统上不再存在的帐户或组等等来查找文件。

你还可以指定搜索从哪里开始，搜索应该深入到文件系统的什么位置，以及搜索结果将告诉你它所找到的文件的数量。

而所有这些要求都可以通过 `find` 命令来处理。

下面提供了根据这些要求查找文件的示例。在某些命令中，错误（例如试图列出你没有读取权限的文件）输出将被发送到 `/dev/null`，以便我们不必查看它。或者，我们可以简单地以 root 身份运行以避免这个问题。

请记住，还有更多的其他选项。这篇文章涵盖了很多内容，但并不是 `find` 命令帮助你定位查找文件的所有方式。

### 选择起点

使用 `find`，你可以选择一个起点或从你所在的位置开始。要选择的搜索的起点，请在单词 `find` 后输入它。例如，`find /usr` 或 `find ./bin` 将在 `/usr` 目录或当前位置下的 `bin` 目录开始搜索，而 `find ~` 将在你的主目录中开始搜索，即使你当前位于当前文件系统中的其他位置。

### 选择你要找的

最常用的搜索策略之一是按名称搜索文件。这需要使用 `-name` 选项。

默认情况下，`find` 会显示找到的文件的完整路径。如果你在命令中添加 `-print`，你会看到同样的结果。如果你想查看与文件相关的详细信息—-例如：文件的长度、权限等，你需要在你的 `find` 命令的末尾添加 `-ls` 参数。

```
$ find ~/bin -name tryme
/home/shs/bin/tryme
$ find ~/bin -name tryme -print
/home/shs/bin/tryme
$ find ~/bin -name tryme -ls
   917528   4 -rwx------   1 shs    shs   139 Apr  8  2019 /home/shs/bin/tryme
```

你也可以使用子字符串来查找文件。例如，如果你将上面示例中的 `tryme` 替换为 `try*`，你将会找到所有名称以 `try` 开头的文件。（LCTT 译注：如果要使用通配符 `*` ，请将搜索字符串放到单引号或双引号内，以避免通配符被 shell 所解释）

按名称查找文件可能是 `find` 命令最典型的用法，不过还有很多其他的方式来查找文件，并且有这样做的需要。下面的部分展示了如何使用其他可用的方式。

此外，当按文件大小、组、索引节点等条件来搜索文件时，你需要确认找到的文件与你要查找的文件是否相匹配。使用 `-ls` 选项来显示细节是非常有用。

### 通过大小查找文件

按大小查找文件需要使用 `-size` 选项并且对相应规范使用一点技巧。例如，如果你指定 `-size 189b`，你将找到 189 个块大小的文件，而不是 189 个字节。（LCTT 译注：如果不跟上单位，默认单位是 `b`。一个块是 512 个字节大小，不足或正好 512 个字节将占据一个块。）对于字节，你需要使用 `--size 189c`（字符）。而且，如果你指定 `--size 200w` ，你将会找到 200 个“<ruby>字<rt>word</rt></ruby>”的文件——以“双字节增量”为单位的字，而不是“我们互相谈论的那些事情”中的单词。你还可以通过以千字节（`k`）、兆字节（`M`）和千兆字节（`G`）为单位提供大小来查找文件。（LCTT 译注：乃至还有 `T`、`P`）

大多数情况下，Linux 用户会搜索比选定大小要大的文件。例如，要查找大于 1 千兆字节的文件，你可以使用这样的命令，其中 `+1G` 表示“大于 1 千兆字节”:

```
$ find -size +1G -ls 2>/dev/null
  787715 1053976 -rw-rw-r-- 1 shs  shs  1079263432 Dec 21  2018 ./backup.zip
  801834 1052556 -rw-rw-r-- 1 shs  shs  1077809525 Dec 21  2018 ./2019/hold.zip
```

### 通过索引节点号查找文件

你可以通过用于维护文件元数据（即除文件内容和文件名之外的所有内容）的索引节点来查找文件。

```
$ find -inum 919674 -ls 2>/dev/null
  919674  4 -rw-rw-r--  1 shs  shs   512 Dec 27 15:25 ./bin/my.log
```

### 查找具有特定文件所有者或组的文件

按所有者或组查找文件也非常简单。这里我们使用 `sudo` 来解决权限问题。

```
$ sudo find /home -user nemo -name "*.png" -ls
 1705219  4 drwxr-xr-x  2 nemo nemo  4096 Jan 28 08:50 /home/nemo/Pictures/me.png
```

在下面这个命令中，我们寻找一个被称为 `admins` 的多用户组拥有的文件。

```
# find /tmp -group admins -ls
   262199      4 -rwxr-x---   1 dory     admins         27 Feb 16 18:57 /tmp/testscript
```

### 查找没有所有者或组的文件

你可以使用如下命令所示的 `-nouser` 选项来查找不属于当前系统上的任何用户的文件。

```
# find /tmp -nouser -ls
262204 4 -rwx------ 1 1016 1016 17 Feb 17 16:42 /tmp/hello
```

请注意，该列表显示了旧用户的 UID 和 GID，这清楚地表明该用户未在系统上定义。这种命令将查找帐户已从系统中删除的用户创建在主目录之外的文件，或者在用户帐户被删除后而未被删除的主目录中创建的文件。类似地，`-nogroup` 选项也会找到这样的文件，尤其是当这些用户是相关组的唯一成员时。

### 按上次更新时间查找文件

在此命令中，我们在特定用户的主目录中查找过去 24 小时内更新过的文件。`sudo` 用于搜索另一个用户的主目录。

```
$ sudo find /home/nemo -mtime -1
/home/nemo
/home/nemo/snap/cheat
/home/nemo/tryme
```

### 按上次更改权限的时间查找文件

`-ctime` 选项可以帮助你查找在某个参考时间范围内状态（如权限）发生更改的文件。以下是查找在最后一天内权限发生更改的文件的示例：

```
$ find . -ctime -1 -ls
   787987   4 -rwxr-xr-x   1 shs   shs     189 Feb 11 07:31 ./tryme
```

请记住，显示的日期和时间只反映了对文件内容进行的最后更新。你需要使用像 `stat` 这样的命令来查看与文件相关联的三个状态（文件创建、修改和状态更改）。

### 按上次访问的时间查找文件

在这个命令中，我们使用 `-atime` 选项查找在过去两天内访问过的本地 pdf 文件。

```
$ find -name "*.pdf" -atime -2
./Wingding_Invites.pdf
```

### 根据文件相对于另一个文件的时间来查找文件

你可以使用 `-newer` 选项来查找比其他文件更新的文件。

```
$ find . -newer dig1 -ls
   786434     68 drwxr-xr-x  67 shs      shs         69632 Feb 16 19:05 .
  1064442      4 drwxr-xr-x   5 shs      shs          4096 Feb 16 11:06 ./snap/cheat
   791846      4 -rw-rw-r--   1 shs      shs           649 Feb 13 14:26 ./dig
```

没有相应的 `-older` 选项，但是你可以用 `! -newer` （即更旧）得到类似的结果，它们基本上一样。

### 按类型查找文件

通过文件类型找到一个文件，你有很多选项——常规文件、目录、块和字符文件等等。以下是文件类型选项列表:

```
b      块特殊文件（缓冲的）
c      字符特殊文件（无缓冲的）
d      目录
p      命名管道（FIFO）
f      常规文件
l      符号链接
s      套接字
```

这里有一个寻找符号链接的例子：

```
$ find . -type l -ls
   805717   0 lrwxrwxrwx   1 shs    shs    11 Apr 10  2019 ./volcano -> volcano.pdf
   918552   0 lrwxrwxrwx   1 shs    shs     1 Jun 16  2018 ./letter -> pers/letter2mom
```

### 限制查找的深度

`-mindepth` 和 `-maxdepth` 选项控制在文件系统中搜索的深度（从当前位置或起始点开始）。

```
$ find -maxdepth 3 -name "*loop"
./bin/save/oldloop
./bin/long-loop
./private/loop
```

### 查找空文件

在这个命令中，我们寻找空文件，但不进入目录及其子目录。

```
$ find . -maxdepth 2 -empty -type f -ls
   917517      0 -rw-rw-r--   1 shs   shs      0 Sep 23 11:00 ./complaints/newfile
   792050      0 -rw-rw-r--   1 shs   shs      0 Oct  4 19:02 ./junk
```

### 按权限查找文件

你可以使用 `-perm` 选项查找具有特定权限集的文件。在下面的示例中，我们只查找常规文件（`-type f`），以避免看到符号链接，默认情况下符号链接被赋予了这种权限，即使它们所引用的文件是受限的。

```
$ find -perm 777 -type f -ls
find: ‘./.dbus’: Permission denied
   798748      4 -rwxrwxrwx   1 shs      shs            15 Mar 28  2019 ./runme
```

### 使用查找来帮助你删除文件

如果使用如下命令，你可以使用 `find` 命令定位并删除文件：

```
$ find . -name runme -exec rm {} \;
```

`{}` 代表根据搜索条件找到的每个文件的名称。

一个非常有用的选项是将 `-exec` 替换为 `-ok`。当你这样做时，`find` 会在删除任何文件之前要求确认。

```
$ find . -name runme -ok rm -rf {} \;
< rm ... ./bin/runme > ?
```

删除文件并不是 `-ok` 和 `-exec` 能为你做的唯一事情。例如，你可以复制、重命名或移动文件。

确实有很多选择可以有效地使用 `find` 命令，毫无疑问还有一些在本文中没有涉及到。我希望你已经找到一些新的，特别有帮助的。

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3527420/how-to-find-what-you-re-looking-for-on-linux-with-find.html

作者：[Sandra Henry-Stocker][a]
选题：[lujun9972][b]
译者：[heguangzhi](https://github.com/heguangzhi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Sandra-Henry_Stocker/
[b]: https://github.com/lujun9972
[1]: https://www.networkworld.com/newsletters/signup.html
[2]: https://www.networkworld.com/article/3440100/take-the-intelligent-route-with-consumption-based-storage.html?utm_source=IDG&utm_medium=promotions&utm_campaign=HPE21620&utm_content=sidebar ( Take the Intelligent Route with Consumption-Based Storage)
[3]: https://www.facebook.com/NetworkWorld/
[4]: https://www.linkedin.com/company/network-world

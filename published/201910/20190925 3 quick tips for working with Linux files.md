[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11445-1.html)
[#]: subject: (3 quick tips for working with Linux files)
[#]: via: (https://www.networkworld.com/article/3440035/3-quick-tips-for-working-with-linux-files.html)
[#]: author: (Sandra Henry-Stocker https://www.networkworld.com/author/Sandra-Henry_Stocker/)

处理 Linux 文件的 3 个技巧
======

> Linux 提供了许多用于查找、计数和重命名文件的命令。这有一些有用的选择。

![](https://img.linux.net.cn/data/attachment/album/201910/11/101136ei4sslezne7esyis.jpg)

Linux 提供了多种用于处理文件的命令，这些命令可以节省你的时间，并使你的工作不那么繁琐。

### 查找文件

当你查找文件时，`find` 可能会是第一个想到的命令，但是有时精心设计的 `ls` 命令会更好。想知道你昨天离开办公室回家前调用的脚本么？简单！使用 `ls` 命令并加上 `-ltr` 选项。最后一个列出的将是最近创建或更新的文件。

```
$ ls -ltr ~/bin | tail -3
-rwx------ 1 shs shs   229 Sep 22 19:37 checkCPU
-rwx------ 1 shs shs   285 Sep 22 19:37 ff
-rwxrw-r-- 1 shs shs  1629 Sep 22 19:37 test2
```

像这样的命令将仅列出今天更新的文件：

```
$ ls -al --time-style=+%D | grep `date +%D`
drwxr-xr-x  60 shs  shs       69632 09/23/19 .
drwxrwxr-x   2 shs  shs     8052736 09/23/19 bin
-rw-rw-r--   1 shs  shs         506 09/23/19 stats
```

如果你要查找的文件可能不在当前目录中，那么 `find` 将比 `ls` 提供更好的选项，但它可能会输出比你想要的更多结果。在下面的命令中，我们*不*搜索以点开头的目录（它们很多一直在更新），指定我们要查找的是文件（即不是目录），并要求仅显示最近一天 （`-mtime -1`）更新过的文件。

```
$ find . -not -path '*/\.*' -type f -mtime -1 -ls
   917517      0 -rwxrw-r--   1 shs      shs          683 Sep 23 11:00 ./newscript
```

注意 `-not` 选项反转了 `-path` 的行为，因此我们不会搜索以点开头的子目录。

如果只想查找最大的文件和目录，那么可以使用类似 `du` 这样的命令，它会按大小列出当前目录的内容。将输出通过管道传输到 `tail`，仅查看最大的几个。

```
$ du -kx | egrep -v "\./.+/" | sort -n | tail -5
918984      ./reports
1053980     ./notes
1217932     ./.cache
31470204    ./photos
39771212    .
```

`-k` 选项让 `du` 以块列出文件大小，而 `x` 可防止其遍历其他文件系统上的目录（例如，通过符号链接引用）。事实上，`du` 会先列出文件大小，这样可以按照大小排序（`sort -n`）。 

### 文件计数

使用 `find` 命令可以很容易地计数任何特定目录中的文件。你只需要记住，`find` 会递归到子目录中，并将这些子目录中的文件与当前目录中的文件一起计数。在此命令中，我们计数一个特定用户（`username`）的家目录中的文件。根据家目录的权限，这可能需要使用 `sudo`。请记住，第一个参数是搜索的起点。这里指定的是用户的家目录。

```
$ find ~username -type f 2>/dev/null | wc -l
35624
```

请注意，我们正在将上面 `find` 命令的错误输出发送到 `/dev/null`，以避免搜索类似 `~username/.cache` 这类无法搜索并且对它的内容也不感兴趣的文件夹。

必要时，你可以使用 `maxdepth 1` 选项将 `find` 限制在单个目录中：

```
$ find /home/shs -maxdepth 1 -type f | wc -l
387
```

### 重命名文件

使用 `mv` 命令可以很容易地重命名文件，但是有时你会想重命名大量文件，并且不想花费大量时间。例如，要将你在当前目录的文件名中找到的所有空格更改为下划线，你可以使用如下命令：

```
$ rename 's/ /_/g' *
```

如你怀疑的那样，此命令中的 `g` 表示“全局”。这意味着该命令会将文件名中的*所有*空格更改为下划线，而不仅仅是第一个。

要从文本文件中删除 .txt 扩展名，可以使用如下命令：

```
$ rename 's/.txt//g' *
```

### 总结

Linux 命令行提供了许多用于处理文件的有用选择。请提出你认为特别有用的其他命令。

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3440035/3-quick-tips-for-working-with-linux-files.html

作者：[Sandra Henry-Stocker][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Sandra-Henry_Stocker/
[b]: https://github.com/lujun9972
[1]: https://images.idgesg.net/images/article/2019/09/file_key-100811696-large.jpg
[2]: https://creativecommons.org/licenses/by/2.0/legalcode
[4]: https://www.facebook.com/NetworkWorld/
[5]: https://www.linkedin.com/company/network-world

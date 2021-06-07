[#]: collector: (lujun9972)
[#]: translator: (pityonline)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10626-1.html)
[#]: subject: (How To Remove/Delete The Empty Lines In A File In Linux)
[#]: via: (https://www.2daygeek.com/remove-delete-empty-lines-in-a-file-in-linux/)
[#]: author: (Magesh Maruthamuthu https://www.2daygeek.com/author/magesh/)

在 Linux 中如何删除文件中的空行
======

有时你可能需要在 Linux 中删除某个文件中的空行。如果是的，你可以使用下面方法中的其中一个。有很多方法可以做到，但我在这里只是列举一些简单的方法。

你可能已经知道 `grep`、`awk` 和 `sed` 命令是专门用来处理文本数据的工具。

如果你想了解更多关于这些命令的文章，请访问这几个 URL：[在 Linux 中创建指定大小的文件的几种方法][1]，[在 Linux 中创建一个文件的几种方法][2] 以及 [在 Linux 中删除一个文件中的匹配的字符串][3]。

这些属于高级命令，它们可用在大多数 shell 脚本中执行所需的操作。

下列 5 种方法可以做到。

* `sed`：过滤和替换文本的流编辑器。
* `grep`：输出匹配到的行。
* `cat`：合并文件并打印内容到标准输出。
* `tr`：替换或删除字符。
* `awk`：awk 工具用于执行 awk 语言编写的程序，专门用于文本处理。
* `perl`：Perl 是一种用于处理文本的编程语言。

我创建了一个 `2daygeek.txt` 文件来测试这些命令。下面是文件的内容。

```
$ cat 2daygeek.txt
2daygeek.com is a best Linux blog to learn Linux.

It's FIVE years old blog.

This website is maintained by Magesh M, it's licensed under CC BY-NC 4.0.

He got two GIRL babys.

Her names are Tanisha & Renusha.
```

现在一切就绪，我们准备开始用多种方法来验证。

### 使用 sed 命令

`sed` 是一个<ruby>流编辑器<rt>stream editor</rt></ruby>。流编辑器是用来编辑输入流（文件或管道）中的文本的。

```
$ sed '/^$/d' 2daygeek.txt
2daygeek.com is a best Linux blog to learn Linux.
It's FIVE years old blog.
This website is maintained by Magesh M, it's licensed under CC BY-NC 4.0.
He got two GIRL babes.
Her names are Tanisha & Renusha.
```

以下是命令展开的细节：

* `sed`： 该命令本身。
* `//`： 标记匹配范围。
* `^`： 匹配字符串开头。
* `$`： 匹配字符串结尾。
* `d`： 删除匹配的字符串。
* `2daygeek.txt`： 源文件名。

### 使用 grep 命令

`grep` 可以通过正则表达式在文件中搜索。该表达式可以是一行或多行空行分割的字符，`grep` 会打印所有匹配的内容。

```
$ grep . 2daygeek.txt
or
$ grep -Ev "^$" 2daygeek.txt
or
$ grep -v -e '^$' 2daygeek.txt
2daygeek.com is a best Linux blog to learn Linux.
It's FIVE years old blog.
This website is maintained by Magesh M, it's licensed under CC BY-NC 4.0.
He got two GIRL babes.
Her names are Tanisha & Renusha.
```

以下是命令展开的细节：

* `grep`： 该命令本身。
* `.`： 替换任意字符。
* `^`： 匹配字符串开头。
* `$`： 匹配字符串结尾。
* `E`： 使用扩展正则匹配模式。
* `e`： 使用常规正则匹配模式。
* `v`： 反向匹配。
* `2daygeek.txt`： 源文件名。

### 使用 awk 命令

`awk` 可以执行使用 awk 语言写的脚本，大多是专用于处理文本的。awk 脚本是一系列 `awk` 命令和正则的组合。

```
$ awk NF 2daygeek.txt
or
$ awk '!/^$/' 2daygeek.txt
or
$ awk '/./' 2daygeek.txt
2daygeek.com is a best Linux blog to learn Linux.
It's FIVE years old blog.
This website is maintained by Magesh M, it's licensed under CC BY-NC 4.0.
He got two GIRL babes.
Her names are Tanisha & Renusha.
```

以下是命令展开的细节：

* `awk`： 该命令本身。
* `//`： 标记匹配范围。
* `^`： 匹配字符串开头。
* `$`： 匹配字符串结尾。
* `.`： 匹配任意字符。
* `!`： 删除匹配的字符串。
* `2daygeek.txt`： 源文件名。

### 使用 cat 和 tr 命令 组合

`cat` 是<ruby>串联（拼接）<rt>concatenate</rt></ruby>的简写。经常用于在 Linux 中读取一个文件的内容。

`cat` 是在类 Unix 系统中使用频率最高的命令之一。它提供了常用的三个处理文本文件的功能：显示文件内容、将多个文件拼接成一个，以及创建一个新文件。

`tr` 可以将标准输入中的字符转换，压缩或删除，然后重定向到标准输出。

```
$ cat 2daygeek.txt | tr -s '\n'
2daygeek.com is a best Linux blog to learn Linux.
It's FIVE years old blog.
This website is maintained by Magesh M, it's licensed under CC BY-NC 4.0.
He got two GIRL babes.
Her names are Tanisha & Renusha.
```

以下是命令展开的细节：

* `cat`： cat 命令本身。
* `tr`： tr 命令本身。
* `|`： 管道符号。它可以将前面的命令的标准输出作为下一个命令的标准输入。
* `s`： 替换标数据集中任意多个重复字符为一个。
* `\n`： 添加一个新的换行。
* `2daygeek.txt`： 源文件名。

### 使用 perl 命令

Perl 表示<ruby>实用的提取和报告语言<rt>Practical Extraction and Reporting Language</rt></ruby>。Perl 在初期被设计为一个专用于文本处理的编程语言，现在已扩展应用到 Linux 系统管理，网络编程和网站开发等多个领域。

```
$ perl -ne 'print if /\S/' 2daygeek.txt
2daygeek.com is a best Linux blog to learn Linux.
It's FIVE years old blog.
This website is maintained by Magesh M, it's licensed under CC BY-NC 4.0.
He got two GIRL babes.
Her names are Tanisha & Renusha.
```

以下是命令展开的细节：

* `perl`： perl 命令。
* `n`： 逐行读入数据。
* `e`： 执行某个命令。
* `print`： 打印信息。
* `if`： if 条件分支。
* `//`： 标记匹配范围。
* `\S`： 匹配任意非空白字符。
* `2daygeek.txt`： 源文件名。

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/remove-delete-empty-lines-in-a-file-in-linux/

作者：[Magesh Maruthamuthu][a]
选题：[lujun9972][b]
译者：[pityonline](https://github.com/pityonline)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/magesh/
[b]: https://github.com/lujun9972
[1]: https://www.2daygeek.com/create-a-file-in-specific-certain-size-linux/
[2]: https://www.2daygeek.com/linux-command-to-create-a-file/
[3]: https://www.2daygeek.com/empty-a-file-delete-contents-lines-from-a-file-remove-matching-string-from-a-file-remove-empty-blank-lines-from-a-file/

[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12539-1.html)
[#]: subject: (Merging and sorting files on Linux)
[#]: via: (https://www.networkworld.com/article/3570508/merging-and-sorting-files-on-linux.html)
[#]: author: (Sandra Henry-Stocker https://www.networkworld.com/author/Sandra-Henry_Stocker/)

合并和排序 Linux 上的文件
======

![](https://img.linux.net.cn/data/attachment/album/202008/22/102250i3943is48r34w4nz.jpg)

在 Linux 上合并和排序文本的方法有很多种，但如何去处理它取决于你试图做什么：你是只想将多个文件的内容放入一个文件中，还是以某种方式组织它，让它更易于使用。在本文中，我们将查看一些用于排序和合并文件内容的命令，并重点介绍结果有何不同。

### 使用 cat

如果你只想将一组文件放到单个文件中，那么 `cat` 命令是一个容易的选择。你所要做的就是输入 `cat`，然后按你希望它们在合并文件中的顺序在命令行中列出这些文件。将命令的输出重定向到要创建的文件。如果指定名称的文件已经存在，那么文件将被覆盖。例如：

```
$ cat firstfile secondfile thirdfile > newfile
```

如果要将一系列文件的内容添加到现有文件中，而不是覆盖它，只需将 `>` 变成 `>>`。

```
$ cat firstfile secondfile thirdfile >> updated_file
```

如果你要合并的文件遵循一些方便的命名约定，那么任务可能更简单。如果可以使用正则表达式指定所有文件名，那就不必列出所有文件。例如，如果文件全部以 `file` 结束，如上所示，你可以进行如下操作：

```
$ cat *file > allfiles
```

请注意，上面的命令将按字母数字顺序添加文件内容。在 Linux 上，一个名为 `filea` 的文件将排在名为 `fileA` 的文件的前面，但会在 `file7` 的后面。毕竟，当我们处理字母数字序列时，我们不仅需要考虑 `ABCDE`，还需要考虑 `0123456789aAbBcCdDeE`。你可以使用 `ls *file` 这样的命令来查看合并文件之前文件的顺序。

注意：首先确保你的命令包含合并文件中所需的所有文件，而不是其他文件，尤其是你使用 `*` 等通配符时。不要忘记，用于合并的文件仍将单独存在，在确认合并后，你可能想要删除这些文件。

### 按时间期限合并文件

如果要基于每个文件的时间期限而不是文件名来合并文件，请使用以下命令：

```
$ for file in `ls -tr myfile.*`; do  cat $file >> BigFile.$$; done
```

使用 `-tr` 选项（`t` = 时间，`r` = 反向）将产生按照最早的在最前排列的文件列表。例如，如果你要保留某些活动的日志，并且希望按活动执行的顺序添加内容，则这非常有用。

上面命令中的 `$$` 表示运行命令时的进程 ID。不是很必要使用此功能，但它几乎不可能会无意添加到现有的文件，而不是创建新文件。如果使用 `$$`，那么生成的文件可能如下所示：

```
$ ls -l BigFile.*
-rw-rw-r-- 1 justme justme   931725 Aug  6 12:36 BigFile.582914
```

### 合并和排序文件

Linux 提供了一些有趣的方式来对合并之前或之后的文件内容进行排序。

#### 按字母对内容进行排序

如果要对合并的文件内容进行排序，那么可以使用以下命令对整体内容进行排序：

```
$ cat myfile.1 myfile.2 myfile.3 | sort > newfile
```

如果要按文件对内容进行分组，请使用以下命令对每个文件进行排序，然后再将它添加到新文件中：

```
$ for file in `ls myfile.?`; do sort $file >> newfile; done
```

#### 对文件进行数字排序

要对文件内容进行数字排序，请在 `sort` 中使用 `-n` 选项。仅当文件中的行以数字开头时，此选项才有用。请记住，按照默认顺序，`02` 将小于 `1`。当你要确保行以数字排序时，请使用 `-n` 选项。

```
$ cat myfile.1 myfile.2 myfile.3 | sort -n > xyz
```

如果文件中的行以 `2020-11-03` 或 `2020/11/03`（年月日格式）这样的日期格式开头，`-n` 选项还能让你按日期对内容进行排序。其他格式的日期排序将非常棘手，并且将需要更复杂的命令。

### 使用 paste

`paste` 命令允许你逐行连接文件内容。使用此命令时，合并文件的第一行将包含要合并的每个文件的第一行。以下是示例，其中我使用了大写字母以便于查看行的来源：

```
$ cat file.a
A one
A two
A three

$ paste file.a file.b file.c
A one   B one   C one
A two   B two   C two
A three B three C thee
        B four  C four
                C five
```

将输出重定向到另一个文件来保存它：

```
$ paste file.a file.b file.c > merged_content
```

或者，你可以将每个文件的内容在同一行中合并，然后将文件粘贴在一起。这需要使用 `-s`（序列）选项。注意这次的输出如何显示每个文件的内容：

```
$ paste -s file.a file.b file.c
A one   A two   A three
B one   B two   B three B four
C one   C two   C thee  C four  C five
```

### 使用 join

合并文件的另一个命令是 `join`。`join` 命令让你能基于一个共同字段合并多个文件的内容。例如，你可能有一个包含一组同事的电话的文件，其中，而另一个包含了同事的电子邮件地址，并且两者均按个人姓名列出。你可以使用 `join` 创建一个包含电话和电子邮件地址的文件。

一个重要的限制是文件的行必须是相同的顺序，并在每个文件中包括用于连接的字段。

这是一个示例命令：

```
$ join phone_numbers email_addresses
Sandra 555-456-1234 bugfarm@gmail.com
Pedro 555-540-5405
John 555-333-1234 john_doe@gmail.com
Nemo 555-123-4567 cutie@fish.com
```

在本例中，即使缺少附加信息，第一个字段（名字）也必须存在于每个文件中，否则命令会因错误而失败。对内容进行排序有帮助，而且可能更容易管理，但只要顺序一致，就不需要这么做。

### 总结

在 Linux 上，你有很多可以合并和排序存储在单独文件中的数据的方式。这些方法可以使原本繁琐的任务变得异常简单。

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3570508/merging-and-sorting-files-on-linux.html

作者：[Sandra Henry-Stocker][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Sandra-Henry_Stocker/
[b]: https://github.com/lujun9972
[2]: https://www.facebook.com/NetworkWorld/
[3]: https://www.linkedin.com/company/network-world

[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11682-1.html)
[#]: subject: (Breaking Linux files into pieces with the split command)
[#]: via: (https://www.networkworld.com/article/3489256/breaking-linux-files-into-pieces-with-the-split-command.html)
[#]: author: (Sandra Henry-Stocker https://www.networkworld.com/author/Sandra-Henry_Stocker/)

使用 split 命令分割 Linux 文件
======

> 一些简单的 Linux 命令能让你根据需要分割以及重新组合文件，来适应存储或电子邮件附件大小的限制。

![Marco Verch][1]

Linux 系统提供了一个非常易于使用的命令来分割文件。在将文件上传到限制大小的存储网站或者作为邮件附件之前，你可能需要执行此操作。要将文件分割为多个文件块，只需使用 `split` 命令。

```
$ split bigfile
```

默认情况下，`split` 命令使用非常简单的命名方案。文件块将被命名为 `xaa`、`xab`、`xac` 等，并且，大概地，如果你将足够大的文件分割，你甚至可能会得到名为 `xza` 和 `xzz` 的块。

除非你要求，否则该命令将无任何反馈地运行。但是，如果你想在创建文件块时看到反馈，可以使用 `--verbose` 选项。

```
$ split –-verbose bigfile
creating file 'xaa'
creating file 'xab'
creating file 'xac'
```

你还可以给文件命名前缀。例如，要将你原始文件分割并命名为 `bigfile.aa`、`bigfile.ab` 等，你可以将前缀添加到 `split` 命令的末尾，如下所示：

```
$ split –-verbose bigfile bigfile.
creating file 'bigfile.aa'
creating file 'bigfile.ab'
creating file 'bigfile.ac'
```

请注意，上述命令中显示的前缀的末尾会添加一个点。否则，文件将是 `bigfileaa` 之类的名称，而不是 `bigfile.aa`。

请注意，`split` 命令*不会*删除你的原始文件，只是创建了文件块。如果要指定文件块的大小，可以使用 `-b` 选项将其添加到命令中。例如：

```
$ split -b100M bigfile
```

文件大小可以是 KB、MB，GB，最大可以是 YB！只需使 K、M、G、T、P、E、Z 和 Y 这些合适的字母。

如果要基于每个块中的行数而不是字节数来拆分文件，那么可以使用 `-l`（行）选项。在此示例中，每个文件将有 1000 行，当然，最后一个文件可能有较少的行。

```
$ split --verbose -l1000 logfile log.
creating file 'log.aa'
creating file 'log.ab'
creating file 'log.ac'
creating file 'log.ad'
creating file 'log.ae'
creating file 'log.af'
creating file 'log.ag'
creating file 'log.ah'
creating file 'log.ai'
creating file 'log.aj'
```

如果你需要在远程站点上重新组合文件，那么可以使用如下所示的 `cat` 命令轻松地完成此操作：

```
$ cat x?? > original.file
$ cat log.?? > original.file
```

上面所示的分割和组合命令适合于二进制和文本文件。在此示例中，我们将 zip 二进制文件分割为 50KB 的块，之后使用 `cat` 重新组合了它们，然后比较了组合后的文件和原始文件。`diff` 命令验证文件是否相同。

```
$ split --verbose -b50K zip zip.
creating file 'zip.aa'
creating file 'zip.ab'
creating file 'zip.ac'
creating file 'zip.ad'
creating file 'zip.ae'
$ cat zip.a? > zip.new
$ diff zip zip.new
$                    <== 无输出 = 无差别
```

我唯一要提醒的一点的是，如果你经常使用 `split` 并使用默认命名，那么某些文件块可能会覆盖其他的文件块，甚至会比你预期的更多，因为有些是更早之前分割的。

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3489256/breaking-linux-files-into-pieces-with-the-split-command.html

作者：[Sandra Henry-Stocker][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Sandra-Henry_Stocker/
[b]: https://github.com/lujun9972
[1]: https://images.idgesg.net/images/article/2018/08/chocolate-chunks-100767935-large.jpg
[2]: https://creativecommons.org/licenses/by/2.0/legalcode
[5]: https://www.facebook.com/NetworkWorld/
[6]: https://www.linkedin.com/company/network-world

[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10418-1.html)
[#]: subject: (Working with tarballs on Linux)
[#]: via: (https://www.networkworld.com/article/3328840/linux/working-with-tarballs-on-linux.html)
[#]: author: (Sandra Henry-Stocker https://www.networkworld.com/author/Sandra-Henry_Stocker/)

在 Linux 上使用 tarball
======

> Tarball 提供了一种在 Linux 系统上备份和管理一组文件的通用方法。请按照以下提示了解如何创建它们，以及从中提取和删除单个文件。

![](https://images.idgesg.net/images/article/2018/12/tarball-100783148-large.jpg)

“tarball” （LCTT 译注：国内也常称为“tar 包”）一词通常用于描述备份一组选择的文件并将它们打包在一个文件中的一种文件格式。该名称来自 .tar 文件扩展名和 `tar` 命令，它用于将文件打包到一个文件中，有时还会压缩该文件，使其在移动到其它系统时更小。

tarball 通常用于备份个人或系统文件来创建存档，特别是在进行可能需要撤消的更改之前。例如，Linux 系统管理员通常会在更改应用之前创建包含一系列配置文件的 tarball，以防必须撤消这些更改。从 tarball 中解压文件通常比在备份中搜索文件快。

### 如何在 Linux 上创建 tarball

使用如下命令，你可以在单条命令中创建 tarball 并压缩它。

```
$ tar -cvzf PDFs.tar.gz *.pdf
```

其结果是一个压缩文件（gzip 压缩的），其中包含了当前目录中的所有 PDF 文件。当然，压缩是可选的。一个稍微简单的只是将 PDF 文件打包成未压缩 tarball 的命令：

```
$ tar -cvf PDFs.tar *.pdf
```

注意，选项中的 `z` 将文件变成压缩的。 `c` 表明创建文件，`v`（详细）表示你在命令运行时需要一些反馈。如果你不想查看列出的文件，请忽略 `v`。

另一个常见的命名约定是给压缩的 tarball 命名成 .tgz 而不是双扩展名 .tar.gz，如下所示：

```
$ tar cvzf MyPDFs.tgz *.pdf
```

### 如何从 tarball 中解压文件

要从 gzip 压缩包中解压所有文件，你可以使用如下命令：

```
$ tar -xvzf file.tar.gz
```

如果使用 .tgz 命名约定，该命令将如下所示：

```
$ tar -xvzf MyPDFs.tgz
```

要从 gzip 包中解压单个文件，你可以执行几乎相同的操作，只需添加文件名：

```
$ tar -xvzf PDFs.tar.gz ShenTix.pdf
ShenTix.pdf
ls -l ShenTix.pdf
-rw-rw-r-- 1 shs shs 122057 Dec 14 14:43 ShenTix.pdf
```

如果未压缩 tarball，你甚至可以从 tarball 中删除文件。例如，如果我们想从 PDFs.tar.gz 中删除我们上面解压过的文件，我们会这样做：

```
$ gunzip PDFs.tar.gz
$ ls -l PDFs.tar
-rw-rw-r-- 1 shs shs 10700800 Dec 15 11:51 PDFs.tar
$ tar -vf PDFs.tar --delete ShenTix.pdf
$ ls -l PDFs.tar
-rw-rw-r-- 1 shs shs 10577920 Dec 15 11:45 PDFs.tar
```

请注意，我们在删除 ShenTix.pdf 后，缩小了一点 tarball 文件占用的空间。如果我们想要，我们可以再次压缩文件：

```
$ gzip -f PDFs.tar
ls -l PDFs.tar.gz
-rw-rw-r-- 1 shs shs 10134499 Dec 15 11:51 PDFs.tar.gzFlickr / James St. John
```

丰富的命令行选项使得 tarball 使用起来简单方便。

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3328840/linux/working-with-tarballs-on-linux.html

作者：[Sandra Henry-Stocker][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Sandra-Henry_Stocker/
[b]: https://github.com/lujun9972
[1]: https://www.facebook.com/NetworkWorld/
[2]: https://www.linkedin.com/company/network-world

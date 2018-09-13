如何在 Linux 中压缩和解压缩文件
======

![](https://www.ostechnix.com/wp-content/uploads/2018/03/compress-720x340.jpg)

当在备份重要文件和通过网络发送大文件的时候，对文件进行压缩非常有用。请注意，压缩一个已经压缩过的文件会增加额外开销，因此你将会得到一个更大一些的文件。所以，请不要压缩已经压缩过的文件。在 GNU/Linux 中，有许多程序可以用来压缩和解压缩文件。在这篇教程中，我们仅学习其中两个应用程序。

在类 Unix 系统中，最常见的用来压缩文件的程序是：

  1. gzip
  2. bzip2

### 1. 使用 gzip 程序来压缩和解压缩文件

`gzip` 是一个使用 Lempel-Ziv 编码（LZ77）算法来压缩和解压缩文件的实用工具。

#### 1.1 压缩文件

如果要压缩一个名为 `ostechnix.txt` 的文件，使之成为 gzip 格式的压缩文件，那么只需运行如下命令：

```
$ gzip ostechnix.txt
```

上面的命令运行结束之后，将会出现一个名为 `ostechnix.txt.gz` 的 gzip 格式压缩文件，代替了原始的 `ostechnix.txt` 文件。

`gzip` 命令还可以有其他用法。一个有趣的例子是，我们可以将一个特定命令的输出通过管道传递，然后作为 `gzip` 程序的输入来创建一个压缩文件。看下面的命令：

```
$ ls -l Downloads/ | gzip > ostechnix.txt.gz
```

上面的命令将会创建一个 gzip 格式的压缩文件，文件的内容为 `Downloads`　目录的目录项。

#### 1.2 压缩文件并将输出写到新文件中（不覆盖原始文件）

默认情况下，`gzip` 程序会压缩给定文件，并以压缩文件替代原始文件。但是，你也可以保留原始文件，并将输出写到标准输出。比如，下面这个命令将会压缩 `ostechnix.txt` 文件，并将输出写入文件 `output.txt.gz`。

```
$ gzip -c ostechnix.txt > output.txt.gz
```

类似地，要解压缩一个 `gzip` 格式的压缩文件并指定输出文件的文件名，只需运行：

```
$ gzip -c -d output.txt.gz > ostechnix1.txt
```

上面的命令将会解压缩 `output.txt.gz` 文件，并将输出写入到文件 `ostechnix1.txt` 中。在上面两个例子中，原始文件均不会被删除。

#### 1.3 解压缩文件

如果要解压缩 `ostechnix.txt.gz` 文件，并以原始未压缩版本的文件来代替它，那么只需运行：

```
$ gzip -d ostechnix.txt.gz
```

我们也可以使用 `gunzip` 程序来解压缩文件：

```
$ gunzip ostechnix.txt.gz
```

#### 1.4 在不解压缩的情况下查看压缩文件的内容

如果你想在不解压缩的情况下，使用 `gzip` 程序查看压缩文件的内容，那么可以像下面这样使用 `-c` 选项：

```
$ gunzip -c ostechnix1.txt.gz
```

或者，你也可以像下面这样使用 `zcat` 程序：

```
$ zcat ostechnix.txt.gz
```

你也可以通过管道将输出传递给 `less` 命令，从而一页一页的来查看输出，就像下面这样：

```
$ gunzip -c ostechnix1.txt.gz | less
$ zcat ostechnix.txt.gz | less
```

另外，`zless` 程序也能够实现和上面的管道同样的功能。

```
$ zless ostechnix1.txt.gz
```

#### 1.5 使用 gzip 压缩文件并指定压缩级别

`gzip` 的另外一个显著优点是支持压缩级别。它支持下面给出的 3 个压缩级别：

  * **1** – 最快 (最差)
  * **9** – 最慢 (最好)
  * **6** – 默认级别

要压缩名为 `ostechnix.txt` 的文件，使之成为“最好”压缩级别的 gzip 压缩文件，可以运行：

```
$ gzip -9 ostechnix.txt
```

#### 1.6 连接多个压缩文件

我们也可以把多个需要压缩的文件压缩到同一个文件中。如何实现呢？看下面这个例子。

```
$ gzip -c ostechnix1.txt > output.txt.gz
$ gzip -c ostechnix2.txt >> output.txt.gz
```

上面的两个命令将会压缩文件 `ostechnix1.txt` 和 `ostechnix2.txt`，并将输出保存到一个文件 `output.txt.gz` 中。

你可以通过下面其中任何一个命令，在不解压缩的情况下，查看两个文件 `ostechnix1.txt` 和 `ostechnix2.txt` 的内容：

```
$ gunzip -c output.txt.gz
$ gunzip -c output.txt
$ zcat output.txt.gz
$ zcat output.txt
```

如果你想了解关于 `gzip` 的更多细节，请参阅它的 man 手册。

```
$ man gzip
```

### 2. 使用 bzip2 程序来压缩和解压缩文件

`bzip2` 和 `gzip` 非常类似，但是 `bzip2` 使用的是 Burrows-Wheeler 块排序压缩算法，并使用<ruby>哈夫曼<rt>Huffman</rt></ruby>编码。使用 `bzip2` 压缩的文件以 “.bz2” 扩展结尾。

正如我上面所说的， `bzip2` 的用法和 `gzip` 几乎完全相同。只需在上面的例子中将 `gzip` 换成 `bzip2`，将 `gunzip` 换成 `bunzip2`，将 `zcat` 换成 `bzcat` 即可。

要使用 `bzip2` 压缩一个文件，并以压缩后的文件取而代之，只需运行：

```
$ bzip2 ostechnix.txt
```

如果你不想替换原始文件，那么可以使用 `-c` 选项，并把输出写入到新文件中。

```
$ bzip2 -c ostechnix.txt > output.txt.bz2
```

如果要解压缩文件，则运行：

```
$ bzip2 -d ostechnix.txt.bz2
```

或者，

```
$ bunzip2 ostechnix.txt.bz2
```

如果要在不解压缩的情况下查看一个压缩文件的内容，则运行：

```
$ bunzip2 -c ostechnix.txt.bz2
```

或者，

```
$ bzcat ostechnix.txt.bz2
```

如果你想了解关于 `bzip2` 的更多细节，请参阅它的 man 手册。

```
$ man bzip2
```

### 总结

在这篇教程中，我们学习了 `gzip` 和 `bzip2` 程序是什么，并通过 GNU/Linux 下的一些例子学习了如何使用它们来压缩和解压缩文件。接下来，我们将要学习如何在 Linux 中将文件和目录归档。

干杯！


--------------------------------------------------------------------------------

via: https://www.ostechnix.com/how-to-compress-and-decompress-files-in-linux/

作者：[SK][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[ucasFL](https://github.com/ucasFL)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ostechnix.com/author/sk/

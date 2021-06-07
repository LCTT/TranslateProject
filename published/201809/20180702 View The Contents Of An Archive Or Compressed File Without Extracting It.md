查看一个归档或压缩文件的内容而无需解压它
======

![](https://www.ostechnix.com/wp-content/uploads/2018/07/View-The-Contents-Of-An-Archive-Or-Compressed-File-720x340.png)

在本教程中，我们将学习如何在类 Unix 系统中查看一个归档或者压缩文件的内容而无需实际解压它。在深入之前，让我们先厘清归档和压缩文件的概念，它们之间有显著不同。归档是将多个文件或者目录归并到一个文件的过程，因此这个生成的文件是没有被压缩过的。而压缩则是结合多个文件或者目录到一个文件并最终压缩这个文件的方法。归档文件不是一个压缩文件，但压缩文件可以是一个归档文件，清楚了吗？好，那就让我们进入今天的主题。

### 查看一个归档或者压缩文件的内容而无需解压它

得益于 Linux 社区，有很多命令行工具可以来达成上面的目标。下面就让我们来看看使用它们的一些示例。

#### 1、使用 vim 编辑器

vim 不只是一个编辑器，使用它我们可以干很多事情。下面的命令展示的是在没有解压的情况下使用 vim 查看一个压缩的归档文件的内容：

```
$ vim ostechnix.tar.gz
```

![][2]

你甚至还可以浏览归档文件的内容，打开其中的文本文件（假如有的话）。要打开一个文本文件，只需要用方向键将鼠标的游标放置到文件的前面，然后敲 ENTER 键来打开它。

#### 2、使用 tar 命令

为了列出一个 tar 归档文件的内容，可以运行：

```
$ tar -tf ostechnix.tar
ostechnix/
ostechnix/image.jpg
ostechnix/file.pdf
ostechnix/song.mp3
```

或者使用 `-v` 选项来查看归档文件的具体属性，例如它的文件所有者、属组、创建日期等等。

```
$ tar -tvf ostechnix.tar
drwxr-xr-x sk/users 0 2018-07-02 19:30 ostechnix/
-rw-r--r-- sk/users 53632 2018-06-29 15:57 ostechnix/image.jpg
-rw-r--r-- sk/users 156831 2018-06-04 12:37 ostechnix/file.pdf
-rw-r--r-- sk/users 9702219 2018-04-25 20:35 ostechnix/song.mp3
```

#### 3、使用 rar 命令

要查看一个 rar 文件的内容，只需要执行：

```
$ rar v ostechnix.rar

RAR 5.60 Copyright (c) 1993-2018 Alexander Roshal 24 Jun 2018
Trial version Type 'rar -?' for help

Archive: ostechnix.rar
Details: RAR 5

Attributes Size Packed Ratio Date Time Checksum Name
----------- --------- -------- ----- ---------- ----- -------- ----
-rw-r--r-- 53632 52166 97% 2018-06-29 15:57 70260AC4 ostechnix/image.jpg
-rw-r--r-- 156831 139094 88% 2018-06-04 12:37 C66C545E ostechnix/file.pdf
-rw-r--r-- 9702219 9658527 99% 2018-04-25 20:35 DD875AC4 ostechnix/song.mp3
----------- --------- -------- ----- ---------- ----- -------- ----
9912682 9849787 99% 3
```

#### 4、使用 unrar 命令

你也可以使用带有 `l` 选项的 `unrar` 来做到与上面相同的事情，展示如下：

```
$ unrar l ostechnix.rar

UNRAR 5.60 freeware Copyright (c) 1993-2018 Alexander Roshal

Archive: ostechnix.rar
Details: RAR 5

Attributes Size Date Time Name
----------- --------- ---------- ----- ----
-rw-r--r-- 53632 2018-06-29 15:57 ostechnix/image.jpg
-rw-r--r-- 156831 2018-06-04 12:37 ostechnix/file.pdf
-rw-r--r-- 9702219 2018-04-25 20:35 ostechnix/song.mp3
----------- --------- ---------- ----- ----
9912682 3
```

#### 5、使用 zip 命令

为了查看一个 zip 文件的内容而无需解压它，可以使用下面的 `zip` 命令：

```
$ zip -sf ostechnix.zip
Archive contains:
Life advices.jpg
Total 1 entries (597219 bytes)
```

#### 6、使用 unzip 命令

你也可以像下面这样使用 `-l` 选项的 `unzip` 命令来呈现一个 zip 文件的内容：

```
$ unzip -l ostechnix.zip
Archive: ostechnix.zip
Length Date Time Name
--------- ---------- ----- ----
597219 2018-04-09 12:48 Life advices.jpg
--------- -------
597219 1 file
```

#### 7、使用 zipinfo 命令

```
$ zipinfo ostechnix.zip
Archive: ostechnix.zip
Zip file size: 584859 bytes, number of entries: 1
-rw-r--r-- 6.3 unx 597219 bx defN 18-Apr-09 12:48 Life advices.jpg
1 file, 597219 bytes uncompressed, 584693 bytes compressed: 2.1%
```

如你所见，上面的命令展示了一个 zip 文件的内容、它的权限、创建日期和压缩百分比等等信息。

#### 8、使用 zcat 命令

要一个压缩的归档文件的内容而不解压它，使用 `zcat` 命令，我们可以得到：

```
$ zcat ostechnix.tar.gz
```

`zcat` 和 `gunzip -c` 命令相同。所以你可以使用下面的命令来查看归档或者压缩文件的内容：

```
$ gunzip -c ostechnix.tar.gz
```

#### 9、使用 zless 命令

要使用 zless 命令来查看一个归档或者压缩文件的内容，只需：

```
$ zless ostechnix.tar.gz
```

这个命令类似于 `less` 命令，它将一页一页地展示其输出。

#### 10、使用 less 命令

可能你已经知道 `less` 命令可以打开文件来交互式地阅读它，并且它支持滚动和搜索。

运行下面的命令来使用 `less` 命令查看一个归档或者压缩文件的内容：

```
$ less ostechnix.tar.gz
```

上面便是全部的内容了。现在你知道了如何在 Linux 中使用各种命令查看一个归档或者压缩文件的内容了。希望本文对你有用。更多好的内容将呈现给大家，希望继续关注我们！

干杯！

--------------------------------------------------------------------------------

via: https://www.ostechnix.com/how-to-view-the-contents-of-an-archive-or-compressed-file-without-extracting-it/

作者：[SK][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[FSSlc](https://github.com/FSSlc)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ostechnix.com/author/sk/
[1]:data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[2]:http://www.ostechnix.com/wp-content/uploads/2018/07/vim.png

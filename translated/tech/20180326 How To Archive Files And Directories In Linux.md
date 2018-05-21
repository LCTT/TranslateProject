在 Linux 中如何归档文件和目录
=====
![](https://www.ostechnix.com/wp-content/uploads/2018/03/Archive-Files-And-Directories-In-Linux-720x340.png)
在我们之前的教程中，我们讨论了如何[使用 gzip 和 bzip2 压缩和解压缩文件][1]。在本教程中，我们将学习如何在 Linux 归档文件。归档和压缩有什么不同吗？你们中的一些人可能经常认为这些术语有相同的含义。但是，这两者完全不同。归档是将多个文件和目录（相同或不同大小）组合成一个文件的过程。另一方面，压缩是减小文件或目录大小的过程。归档通常用作系统备份的一部分，或者将数据从一个系统移至另一个系统时。希望你了解归档和压缩之间的区别。现在，让我们进入主题。

### 归档文件和目录

归档文件和目录最常见的程序是：
  1. tar
  2. zip

这是一个很大的话题，所以，我将分两部分发表这篇文章。在第一部分中，我们将看到如何使用 tar 命令来归档文件和目录。

##### 使用 tar 命令归档文件和目录

**Tar** 是一个 Unix 命令，代表 **T**ape **A**rchive（这里我将其翻译为 磁带归档，希望校正者修正以下）。它用于将多个文件（相同或不同大小）组合或存储到一个文件中。在 tar 实用程序中有 4 种主要的操作模式。

  1. **c** – 从文件或目录中建立归档
  2. **x** – 提取归档
  3. **r** – 将文件追加到归档
  4. **t** – 列出归档的内容

有关完整的模式列表，参阅 man 手册页。

**创建一个新的归档**

为了本指南，我将使用名为 **ostechnix** 的文件夹，其中包含三种不同类型的文件。
```
$ ls ostechnix/
file.odt image.png song.mp3
```

现在，让我们为 ostechnix 目录创建一个新的 tar 归档。
```
$ tar cf ostechnix.tar ostechnix/
```

这里，**c**标志指的是创建新的归档，**f** 是指定归档文件。

同样，对当前工作目录中的一组文件创建归档文件，使用以下命令：
```
$ tar cf archive.tar file1 file2 file 3
```

**提取归档**

要在当前目录中提取归档文件，只需执行以下操作：
```
$ tar xf ostechnix.tar
```

我们还可以使用 **C** 标志（大写字母 C）将归档提取到不同的目录中。例如，以下命令在 **Downloads** 目录中提取给定的归档文件。
```
$ tar xf ostechnix.tar -C Downloads/
```

或者，转到 Downloads 文件夹并像下面一样提取其中的归档。
```
$ cd Downloads/

$ tar xf ../ostechnix.tar
```

有时，你可能想要提取特定类型的文件。例如，以下命令提取 “.png” 类型的文件。
```
$ tar xf ostechnix.tar --wildcards "*.png"
```

**创建 gzip 和 bzip 格式的压缩归档**

默认情况下，tar 创建归档文件以 **.tar** 结尾。另外，tar 命令可以与压缩实用程序 **gzip** 和 **bzip** 结合使用。文件结尾以 **.tar** 为扩展名使用普通 tar 归档文件，文件以 **tar.gz** 或 **.tgz** 结尾使用 **gzip** 归档并压缩文件，tar 文件以 **tar.bz2** 或 **.tbz** 结尾使用 **bzip** 归档并压缩。 

首先，让我们来**创建一个 gzip 归档**：
```
$ tar czf ostechnix.tar.gz ostechnix/
```

或者
```
$ tar czf ostechnix.tgz ostechnix/
```

这里，我们使用 **z** 标志来使用 gzip 压缩方法压缩归档文件。

你可以使用 **v** 标志在创建归档时查看进度。
```
$ tar czvf ostechnix.tar.gz ostechnix/
ostechnix/
ostechnix/file.odt
ostechnix/image.png
ostechnix/song.mp3
```

这里，**v** 指显示进度。

从一个文件列表创建 gzip 归档文件：
```
$ tar czf archive.tgz file1 file2 file3
```

要提取当前目录中的 gzip 归档文件，使用：
```
$ tar xzf ostechnix.tgz
```

要提取其他文件夹中的归档，使用 -C 标志：
```
$ tar xzf ostechnix.tgz -C Downloads/
```

现在，让我们创建 **bzip 归档**。为此，请使用下面的 **j** 标志。

创建一个目录的归档：

```
$ tar cjf ostechnix.tar.bz2 ostechnix/
```
或
```
$ tar cjf ostechnix.tbz ostechnix/
```

从一个列表文件中创建归档：
```
$ tar cjf archive.tar.bz2 file1 file2 file3
```

或
```
$ tar cjf archive.tbz file1 file2 file3
```

为了显示进度，使用 **v** 标志。

现在，在当前目录下，让我们提取一个 bzip 归档。这样做：
```
$ tar xjf ostechnix.tar.bz2
```

或者，提取归档文件到其他目录：
```
$ tar xjf ostechnix.tar.bz2 -C Downloads
```

**一次创建多个目录和/或文件的归档**

这是 tar 命令的另一个最酷的功能。要一次创建多个目录或文件的 gzip 归档文件，使用以下文件：
```
$ tar czvf ostechnix.tgz Downloads/ Documents/ ostechnix/file.odt
```

上述命令创建 **Downloads**, **Documents** 目录和 **ostechnix** 目录下的 **file.odt** 文件的归档，并将归档保存在当前工作目录中。

**在创建归档时跳过目录和/或文件**

这在备份数据时非常有用。你可以在备份中排除不重要的文件或目录，这是 **–exclude** 选项所能帮助的。例如你想要创建 /home 目录的归档，但不希望包括 Downloads, Documents, Pictures, Music 这些目录。

这是我们的做法：
```
$ tar czvf ostechnix.tgz /home/sk --exclude=/home/sk/Downloads --exclude=/home/sk/Documents --exclude=/home/sk/Pictures --exclude=/home/sk/Music
```

上述命令将对我的 $HOME 目录创建一个 gzip 归档，其中不包括 Downloads, Documents, Pictures 和 Music 目录。要创建 bzip 归档，将 **z**  替换为 **j**，并在上例中使用扩展名 .bz2。

**列出归档文件但不提取它们**

要列出归档文件的内容，我们使用 **t** 标志。
```
$ tar tf ostechnix.tar
ostechnix/
ostechnix/file.odt
ostechnix/image.png
ostechnix/song.mp3
``` 

要查看详细输出，使用 **v** 标志。
```
$ tar tvf ostechnix.tar
drwxr-xr-x sk/users 0 2018-03-26 19:52 ostechnix/
-rw-r--r-- sk/users 9942 2018-03-24 13:49 ostechnix/file.odt
-rw-r--r-- sk/users 36013 2015-09-30 11:52 ostechnix/image.png
-rw-r--r-- sk/users 112383 2018-02-22 14:35 ostechnix/song.mp3
```

**追加文件到归档**

文件或目录可以使用 **r** 标志添加/更新到现有的归档。看看下面的命令：
```
$ tar rf ostechnix.tar ostechnix/ sk/ example.txt
```

上面的命令会将名为 **sk** 的目录和名为 **exmple.txt** 添加到 ostechnix.tar 归档文件中。

你可以使用以下命令验证文件是否已添加：
```
$ tar tvf ostechnix.tar
drwxr-xr-x sk/users 0 2018-03-26 19:52 ostechnix/
-rw-r--r-- sk/users 9942 2018-03-24 13:49 ostechnix/file.odt
-rw-r--r-- sk/users 36013 2015-09-30 11:52 ostechnix/image.png
-rw-r--r-- sk/users 112383 2018-02-22 14:35 ostechnix/song.mp3
drwxr-xr-x sk/users 0 2018-03-26 19:52 sk/
-rw-r--r-- sk/users 0 2018-03-26 19:39 sk/linux.txt
-rw-r--r-- sk/users 0 2018-03-26 19:56 example.txt
```

##### **TL;DR**

**创建 tar 归档：**
  * **普通 tar 归档:** tar -cf archive.tar file1 file2 file3
  * **Gzip tar 归档:** tar -czf archive.tgz file1 file2 file3
  * **Bzip tar 归档:** tar -cjf archive.tbz file1 file2 file3

**提取 tar 归档:**
  * **普通 tar 归档:** tar -xf archive.tar
  * **Gzip tar 归档:** tar -xzf archive.tgz
  * **Bzip tar 归档:** tar -xjf archive.tbz

我们只介绍了 tar 命令的基本用法，这些对于开始使用 tar 命令足够了。但是，如果你想了解更多详细信息，参阅 man 手册页。
```
$ man tar

```

好吧，这就是全部了。在下一部分中，我们将看到如何使用 Zip 实用程序来归档文件和目录。

干杯！

--------------------------------------------------------------------------------

via: https://www.ostechnix.com/how-to-archive-files-and-directories-in-linux-part-1/

作者：[SK][a]
译者：[MjSeven](https://github.com/MjSeven)
校对：[校对者ID](https://github.com/校对者ID)
选题：[lujun9972](https://github.com/lujun9972)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ostechnix.com/author/sk/
[1]:https://www.ostechnix.com/how-to-compress-and-decompress-files-in-linux/

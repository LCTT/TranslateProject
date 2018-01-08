如何在 Linux 使用文件压缩
=======

![](https://images.idgesg.net/images/article/2017/12/snake-bus-100743983-large.jpg)

> Linux 系统为文件压缩提供了许多选择，关键是选择一个最适合你的。

如果你对可用于 Linux 系统的文件压缩命令或选项有任何疑问，你也许应该看一下 `apropos compress` 这个命令的输出。如果你有机会这么做，你会惊异于有如此多的的命令来进行压缩文件和解压缩文件；此外还有许多命令来进行压缩文件的比较、检验，并且能够在压缩文件中的内容中进行搜索，甚至能够把压缩文件从一个格式变成另外一种格式（如，将 `.z` 格式变为 `.gz` 格式 ）。

你可以看到只是适用于 bzip2 压缩的全部条目就有这么多。加上 zip、gzip 和 xz 在内，你会有非常多的选择。

```
$ apropos compress | grep ^bz
    bzcat (1)            - decompresses files to stdout
    bzcmp (1)            - compare bzip2 compressed files
    bzdiff (1)           - compare bzip2 compressed files
    bzegrep (1)          - search possibly bzip2 compressed files for a regular expression
    bzexe (1)            - compress executable files in place
    bzfgrep (1)          - search possibly bzip2 compressed files for a regular expression
    bzgrep (1)           - search possibly bzip2 compressed files for a regular expression
    bzip2 (1)            - a block-sorting file compressor, v1.0.6
    bzless (1)           - file perusal filter for crt viewing of bzip2 compressed text
    bzmore (1)           - file perusal filter for crt viewing of bzip2 compressed text   
```

在我的 Ubuntu 系统上 ，`apropos compress` 命令的返回中列出了 60 条以上的命令。

### 压缩算法

压缩并没有普适的方案，某些压缩工具是有损压缩，例如一些压缩用于减少 mp3 文件大小，而能够使聆听者有接近原声的音乐感受。但是在 Linux 命令行上压缩或归档用户文件所使用的算法必须能够精确地重新恢复为原始数据。换句话说，它们必须是无损的。

这是如何做到的？让我们假设在一行上有 300 个相同的字符可以被压缩成像 “300x” 这样的字符串，但是这种算法对大多数文件没有很大的用处，因为文件中不可能包含长的相同字符序列比完全随机的序列更多。 压缩算法要复杂得多，从 Unix 早期压缩首次被引入以来，它就越来越复杂了。

### 在 Linux 系统上的压缩命令

在 Linux 系统上最常用的文件压缩命令包括 `zip`、`gzip`、`bzip2`、`xz`。 所有这些压缩命令都以类似的方式工作，但是你需要权衡有多少文件要压缩（节省多少空间）、压缩花费的时间、压缩文件在其他你需要使用的系统上的兼容性。

有时压缩一个文件并不会花费很多时间和精力。在下面的例子中，被压缩的文件实际上比原始文件要大。这并不是一个常见情况，但是有可能发生——尤其是在文件内容达到一定程度的随机性。

```
$ time zip bigfile.zip bigfile
    adding: bigfile (default 0% )
real    0m0.055s
user    0m0.000s
sys     0m0.016s 
$ ls -l bigfile*
-rw-r--r-- 1 root root   0 12月 20 22:36 bigfile
-rw------- 1 root root 164 12月 20 22:41 bigfile.zip
```

注意该文件压缩后的版本（`bigfile.zip`）比原始文件（`bigfile`）要大。如果压缩增加了文件的大小或者减少很少的比例，也许唯一的好处就是便于在线备份。如果你在压缩文件后看到了下面的信息，你不会从压缩中得到什么受益。

```       
 ( defalted 1% )
```

文件内容在文件压缩的过程中有很重要的作用。在上面文件大小增加的例子中是因为文件内容过于随机。压缩一个文件内容只包含 `0` 的文件，你会有一个相当震惊的压缩比。在如此极端的情况下，三个常用的压缩工具都有非常棒的效果。

```
-rw-rw-r-- 1 shs shs 10485760 Dec 8 12:31 zeroes.txt
-rw-rw-r-- 1 shs shs 49 Dec 8 17:28 zeroes.txt.bz2
-rw-rw-r-- 1 shs shs 10219 Dec 8 17:28 zeroes.txt.gz
-rw-rw-r-- 1 shs shs 1660 Dec 8 12:31 zeroes.txt.xz
-rw-rw-r-- 1 shs shs 10360 Dec 8 12:24 zeroes.zip
```

令人印象深刻的是，你不太可能看到超过 1000 万字节而压缩到少于 50 字节的文件, 因为基本上不可能有这样的文件。

在更真实的情况下 ，大小差异总体上是不同的，但是差别并不显著，比如对于确实不太大的 jpg 图片文件来说。

```
-rw-r--r-- 1 shs shs 13522 Dec 11 18:58 image.jpg
-rw-r--r-- 1 shs shs 13875 Dec 11 18:58 image.jpg.bz2
-rw-r--r-- 1 shs shs 13441 Dec 11 18:58 image.jpg.gz
-rw-r--r-- 1 shs shs 13508 Dec 11 18:58 image.jpg.xz
-rw-r--r-- 1 shs shs 13581 Dec 11 18:58 image.jpg.zip
```

在对大的文本文件同样进行压缩时 ，你会看到显著的不同。

```
$ ls -l textfile*
    -rw-rw-r-- 1 shs shs 8740836 Dec 11 18:41 textfile
    -rw-rw-r-- 1 shs shs 1519807 Dec 11 18:41 textfile.bz2
    -rw-rw-r-- 1 shs shs 1977669 Dec 11 18:41 textfile.gz
    -rw-rw-r-- 1 shs shs 1024700 Dec 11 18:41 textfile.xz
    -rw-rw-r-- 1 shs shs 1977808 Dec 11 18:41 textfile.zip
```

在这种情况下 ，`xz` 相较于其他压缩命令有效的减小了文件大小，对于第二的 bzip2 命令也是如此。

### 查看压缩文件

这些以 `more` 结尾的命令（`bzmore` 等等）能够让你查看压缩文件的内容而不需要解压文件。

```
bzmore (1) - file perusal filter for crt viewing of bzip2 compressed text
lzmore (1) - view xz or lzma compressed (text) files
xzmore (1) - view xz or lzma compressed (text) files
zmore (1) - file perusal filter for crt viewing of compressed text
```

为了解压缩文件内容显示给你，这些命令做了大量的计算。但在另一方面，它们不会把解压缩后的文件留在你系统上，它们只是即时解压需要的部分。

```
$ xzmore textfile.xz | head -1
    Here is the agenda for tomorrow's staff meeting:       
```

### 比较压缩文件

有几个压缩工具箱包含一个差异命令（例如 ：`xzdiff`），那些工具会把这些工作交给 `cmp` 和 `diff` 来进行比较，而不是做特定算法的比较。例如，`xzdiff` 命令比较 bz2 类型的文件和比较 xz 类型的文件一样简单 。

### 如何选择最好的 Linux 压缩工具

如何选择压缩工具取决于你工作。在一些情况下，选择取决于你所压缩的数据内容。在更多的情况下，取决你组织内的惯例，除非你对磁盘空间有着很高的敏感度。下面是一般性建议：

**zip** 对于需要分享给或者在 Windows 系统下使用的文件最适合。

**gzip** 或许对你要在 Unix/Linux 系统下使用的文件是最好的。虽然 bzip2 已经接近普及，但 gzip 看起来仍将长期存在。

**bzip2** 使用了和 gzip 不同的算法，并且会产生比 gzip 更小的文件，但是它们需要花费更长的时间进行压缩。

**xz** 通常可以提供最好的压缩率，但是也会花费相当长的时间。它比其他工具更新一些，可能在你工作的系统上还不存在。

### 注意

在压缩文件时，你有很多选择，而在极少的情况下，并不能有效节省磁盘存储空间。

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3240938/linux/how-to-squeeze-the-most-out-of-linux-file-compression.html

作者：[Sandra Henry-Stocker][1]
译者：[singledo][2] 
校对：[wxy][4]

本文由 [ LCTT ][3]原创编译，Linux中国 荣誉推出

[1]:https://www.networkworld.com
[2]:https://github.com/singledo
[3]:https://github.com/LCTT/TranslateProject
[4]:https://github.com/wxy
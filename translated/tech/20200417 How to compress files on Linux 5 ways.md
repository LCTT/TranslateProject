[#]: collector: (lujun9972)
[#]: translator: (robsean)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to compress files on Linux 5 ways)
[#]: via: (https://www.networkworld.com/article/3538471/how-to-compress-files-on-linux-5-ways.html)
[#]: author: (Sandra Henry-Stocker https://www.networkworld.com/author/Sandra-Henry_Stocker/)

在 Linux 上压缩文件的 5 种方法
======
在 Linux 系统上有很多可以用于压缩文件的工具，但是它们表现的行为或产生相同程度的压缩等级并不相同，在这篇文章中，我们比较其中的五个工具。
Getty Images

在 Linux 上有不少用于压缩文件的命令。最新最有效的一个方法是 **xz** ，但是所有的方法都有节省磁盘空间和为后期使用维护备份文件的优点。在这篇文章中，我们将比较压缩命令并指出显著的不同 。

### tar

tar 命令不是专门的压缩命令。它通常用于将多个文件拉入一单个文件中，以便容易地传输到另一个系统，或者备份文件为一个相关的组。它也提供压缩作为一个功能，这是很明智的，附加的 **z** 压缩选项能够实现压缩文件。

当压缩过程被附加到一个使用 **z** 选项的 **tar** 命令时，tar 使用 **gzip** 来进行压缩。

你可以使用 **tar** 来压缩一个单个文件，就像压缩一个组一样容易，尽管这种操作与直接使用 **gzip** 相比没有特别的优势。为此，要使用 **tar** ，只需要使用一个 “tar cfz newtarfile filename” 命令来像你标识一个组一样标识文件，像这样：

```
$ tar cfz bigfile.tgz bigfile
            ^            ^
            |            |
            +- 新的文件  +- 将被压缩的文件

$ ls -l bigfile*
-rw-rw-r-- 1 shs shs 103270400 Apr 16 16:09 bigfile
-rw-rw-r-- 1 shs shs 21608325 Apr 16 16:08 bigfile.tgz
```

注意，文件的大小显著减少。

如果你喜欢，你可以使用 **tar.gz** 扩展名，这可能会使文件的特征更加明显，但是大多数的 Linux 用户将很可能会意识到与 **tgz** 的意思是相同的东西 –  **tar** 和 **gz** 的组合来显示文件是一个压缩的 tar 文件。在压缩完成后，将留下原始文件和压缩文件。

为收集很多文件在一起并在一个命令中压缩生成的 “tar ball” ，使用相同的语法，但是要指明将要被包含的文件来作为一个组，而不是单个文件。这里有一个示例：

[][1]

```
$ tar cfz bin.tgz bin/*
          ^         ^
          |         +-- 将被包含的文件
          + 新的文件
```

### zip

**zip** 命令创建一个压缩文件，与此同时保留原始文件的完整性。语法像使用 **tar** 一样简单，只是你必需记住，你的原始文件名称应该是命令行上的最后一个参数。

```
$ zip ./bigfile.zip bigfile
updating: bigfile (deflated 79%)
$ ls -l bigfile bigfile.zip
-rw-rw-r-- 1 shs shs 103270400 Apr 16 11:18 bigfile
-rw-rw-r-- 1 shs shs  21606889 Apr 16 11:19 bigfile.zip
```

### gzip

**gzip** 命令非常容易使用。你只需要键入 "gzip" ，紧随其后的是你想要压缩的文件名称。不像上述描述的命令，**gzip** 将“就地”加密文件。换句话说，原始文件将被加密文件替换。

```
$ gzip bigfile
$ ls -l bigfile*
-rw-rw-r-- 1 shs shs  21606751 Apr 15 17:57 bigfile.gz
```

### bzip2

像使用 **gzip** 命令一样，**bzip2** 将在你选的“合适位置”压缩文件，只留下原始文件保持原样离开。

```
$ bzip bigfile
$ ls -l bigfile*
-rw-rw-r-- 1 shs shs  18115234 Apr 15 17:57 bigfile.bz2
```

### xz

压缩命令组中的一个相对较新的成员，**xz** 就如何更好的压缩文件而言是领跑者。像先前的两个命令一样，你只需要将文件名称补给到命令中。再强调一次，原始文件被就地压缩。

```
$ xz bigfile
$ ls -l bigfile*
-rw-rw-r-- 1 shs shs 13427236 Apr 15 17:30 bigfile.xz
```

对于大文件来说，你可能会注意到 **xz** 将比其它的压缩命令花费更多的运行时间，但是压缩的结果却是非常令人赞叹的。

### 考虑对比性

大多数人都听说过 "文件大小不是万能的"。所以，让我们比较一下文件大小以及一些当你计划如何压缩文件时的问题。

下面显示的统计数据都与压缩单个文件相关，在上面显示的示例中使用 – bigfile – 。这个文件是一个大的且相当随机的文本文件。压缩率在一定程度上取决于文件的内容。

#### 大小减缩率

在比较期间，上面显示的各种压缩命产生下面的结果。百分比表示压缩文件对比原始文件。

```
-rw-rw-r-- 1 shs shs 103270400 Apr 16 14:01 bigfile
------------------------------------------------------
-rw-rw-r-- 1 shs shs 18115234 Apr 16 13:59 bigfile.bz2    ~17%
-rw-rw-r-- 1 shs shs 21606751 Apr 16 14:00 bigfile.gz     ~21%
-rw-rw-r-- 1 shs shs 21608322 Apr 16 13:59 bigfile.tgz    ~21%
-rw-rw-r-- 1 shs shs 13427236 Apr 16 14:00 bigfile.xz     ~13%
-rw-rw-r-- 1 shs shs 21606889 Apr 16 13:59 bigfile.zip    ~21%
```

**xz** 命令获胜，最终只有压缩文件大小的13%，但是这些所有的压缩命令都相当显著地减少原始文件的大小。

#### 是否替换原始文件

**bzip2**，**gzip** 和 **xz** 命令都将使用压缩文件替换原始文件。**tar** 和 **zip** 命令不替换。

#### 运行时间

**xz** 命令似乎比其它命令需要花费更多的时间来加密文件。对于 bigfile 来说，近似时间是：

```
命令      运行时间
tar       4.9 秒
zip       5.2 秒
bzip2    22.8 秒
gzip      4.8 秒
xz       50.4 秒
```

解压缩文件很可能比压缩时间要短得多。

#### 文件权限

不管你对压缩文件设置什么权限，压缩文件的权限将基于你的 **umask** 设置，除 **bzip2** 维持原始文件的权限外。

#### 与 Windows 的兼容性

**zip** 命令将创建一个可被使用的文件(例如，解压缩)，在 Windows 系统上以及 Linux 和其它 Unix 系统上，无需安装其它可能可用或不可用的工具。

### 解压缩文件

解压缩文件的命令类似于这些压缩文件的命令。这些命令将在我们运行上述压缩命令后用于解压缩 bigfile 。

  * tar: **tar xf bigfile.tgz**
  * zip: **unzip bigfile.zip**
  * gzip: **gunzip bigfile.gz**
  * bzip2: **bunzip2 bigfile.gz2**
  * xz: **xz -d bigfile.xz** 或 **unxz bigfile.xz**



### 对比你自己运行的压缩

如果你想自己运行一些测试，抓取一个大的且可以替换的文件，并使用上面显示的每个命令来压缩它 – 最好使用一个新的子目录。你可能必需先安装 **xz** ，如果你想在测试中包含它的话。这个脚本可能更容易地压缩，但是将可能花费几分钟来完成。

```
#!/bin/bash

# 询问用户文件名称
echo -n "filename> "
read filename

# 你需要这个，因为一些命令将替换原始文件
cp $filename $filename-2

# 先清理(以免先前的结果仍然可用)
rm $filename.*

tar cvfz ./$filename.tgz $filename > /dev/null
zip $filename.zip $filename > /dev/null
bzip2 $filename
# 恢复原始文件
cp $filename-2 $filename
gzip $filename
# 恢复原始文件
cp $filename-2 $filename
xz $filename

# 显示结果
ls -l $filename.*

# 替换原始文件
mv $filename-2 $filename
```

加入 [Facebook][2] 和 [LinkedIn][3] 网络世界社区来评论那些最重要的话题。

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3538471/how-to-compress-files-on-linux-5-ways.html

作者：[Sandra Henry-Stocker][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Sandra-Henry_Stocker/
[b]: https://github.com/lujun9972
[1]: https://www.networkworld.com/blog/itaas-and-the-corporate-storage-technology/?utm_source=IDG&utm_medium=promotions&utm_campaign=HPE22140&utm_content=sidebar (ITAAS and Corporate Storage Strategy)
[2]: https://www.facebook.com/NetworkWorld/
[3]: https://www.linkedin.com/company/network-world

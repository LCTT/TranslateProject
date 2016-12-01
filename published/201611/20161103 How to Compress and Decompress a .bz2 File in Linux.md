如何在 Linux 中压缩及解压缩 .bz2 文件
============================================================

对文件进行压缩，可以通过使用较少的字节对文件中的数据进行编码来显著地减小文件的大小，并且在跨网络的[文件的备份和传送][1]时很有用。 另一方面，解压文件意味着将文件中的数据恢复到初始状态。

Linux 中有几个[文件压缩和解压缩工具][2]，比如gzip、7-zip、Lrzip、[PeaZip][3] 等等。

本篇教程中，我们将介绍如何在 Linux 中使用 bzip2 工具压缩及解压缩`.bz2`文件。

bzip2 是一个非常有名的压缩工具，并且在大多数主流 Linux 发行版上都有，你可以在你的发行版上用合适的命令来安装它。

```
$ sudo apt install bzip2     [On Debian/Ubuntu] 
$ sudo yum install  bzip2    [On CentOS/RHEL]
$ sudo dnf install bzip2     [On Fedora 22+]
```

使用 bzip2 的常规语法是：

```
$ bzip2 option(s) filenames 
```

### 如何在 Linux 中使用“bzip2”压缩文件

你可以如下压缩一个文件，使用`-z`标志启用压缩：

```
$ bzip2 filename
或者
$ bzip2 -z filename
```

要压缩一个`.tar`文件，使用的命令为：

```
$ bzip2 -z backup.tar
```

重要：bzip2 默认会在压缩及解压缩文件时删除输入文件（原文件），要保留输入文件，使用`-k`或者`--keep`选项。

此外，`-f`或者`--force`标志会强制让 bzip2 覆盖已有的输出文件。

```
------ 要保留输入文件  ------
$ bzip2 -zk filename
$ bzip2 -zk backup.tar
```

你也可以设置块的大小，从 100k 到 900k，分别使用`-1`或者`--fast`到`-9`或者`--best`：

```
$ bzip2 -k1  Etcher-linux-x64.AppImage
$ ls -lh  Etcher-linux-x64.AppImage.bz2 
$ bzip2 -k9  Etcher-linux-x64.AppImage 
$ bzip2 -kf9  Etcher-linux-x64.AppImage 
$ ls -lh Etcher-linux-x64.AppImage.bz2 
```

下面的截屏展示了如何使用选项来保留输入文件，强制 bzip2 覆盖输出文件，并且在压缩中设置块的大小。

![Compress Files Using bzip2 in Linux](http://www.tecmint.com/wp-content/uploads/2016/11/Compress-Files-Using-bzip2-in-Linux.png) 

*在 Linux 中使用 bzip2 压缩文件*

### 如何在 Linux 中使用“bzip2”解压缩文件

要解压缩`.bz2`文件，确保使用`-d`或者`--decompress`选项：

```
$ bzip2 -d filename.bz2
```

注意：这个文件必须是`.bz2`的扩展名，上面的命令才能使用。

```
$ bzip2 -vd Etcher-linux-x64.AppImage.bz2 
$ bzip2 -vfd Etcher-linux-x64.AppImage.bz2 
$ ls -l Etcher-linux-x64.AppImage 
```

![Decompress bzip2 File in Linux](http://www.tecmint.com/wp-content/uploads/2016/11/Decompression-bzip2-File-in-Linux.png) 

*在 Linux 中解压 bzip2 文件*

要浏览 bzip2 的帮助及 man 页面，输入下面的命令：

```
$ bzip2  -h
$ man bzip2
```

最后，通过上面简单的阐述，我相信你现在已经可以在 Linux 中压缩及解压缩`bz2`文件了。然而，有任何的问题和反馈，可以在评论区中留言。

重要的是，你可能想在 Linux 中查看一些重要的 [tar 命令示例][6]，以便学习使用 tar 命令来[创建压缩归档文件][7]。

--------------------------------------------------------------------------------

via: http://www.tecmint.com/linux-compress-decompress-bz2-files-using-bzip2

作者：[Aaron Kili][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/aaronkili/
[1]:http://www.tecmint.com/rsync-local-remote-file-synchronization-commands/
[2]:http://www.tecmint.com/command-line-archive-tools-for-linux/
[3]:http://www.tecmint.com/peazip-linux-file-manager-and-file-archive-tool/
[4]:http://www.tecmint.com/wp-content/uploads/2016/11/Compress-Files-Using-bzip2-in-Linux.png
[5]:http://www.tecmint.com/wp-content/uploads/2016/11/Decompression-bzip2-File-in-Linux.png
[6]:http://www.tecmint.com/18-tar-command-examples-in-linux/
[7]:http://www.tecmint.com/compress-files-and-finding-files-in-linux/



如何解压 tar 文件到不同的目录中
================================================================================

我想要解压一个tar文件到一个叫/tmp/data的指定目录。我该如何在Linux或者类Unix的系统中使用tar命令解压一个tar文件到不同的目录中？

你不必使用cd命令切换到其他的目录并解压。可以使用下面的语法解压一个文件：

### 语法 ###

典型Unix tar语法：

    tar -xf file.name.tar -C /path/to/directory

GNU/tar 语法：

    tar xf file.tar -C /path/to/directory

    tar xf file.tar --directory /path/to/directory

### 示例：解压文件到另一个目录中 ###

在本例中。我解压$HOME/etc.backup.tar到/tmp/data目录中。首先，需要手动创建这个目录，输入：

    mkdir /tmp/data

要解压$HOME/etc.backup.tar 到/tmp/data中，输入：

    tar -xf $HOME/etc.backup.tar -C /tmp/data

要看到进度，使用-v选项：

    tar -xvf $HOME/etc.backup.tar -C /tmp/data

示例输出：

![Gif 01: tar Command Extract Archive To Different Directory Command](http://s0.cyberciti.org/uploads/faq/2015/01/tar-extract-archive-to-dir.gif)

*Gif 01: tar命令解压文件到不同的目录*

你也可以指定解压的文件：

    tar -xvf $HOME/etc.backup.tar file1 file2 file3 dir1 -C /tmp/data

要解压foo.tar.gz（.tgz扩展文件）包到/tmp/bar中，输入：

    mkdir /tmp/bar
    tar -zxvf foo.tar.gz -C /tmp/bar

要解压foo.tar.bz2（.tbz, .tbz2 和 .tb2 扩展文件）包到/tmp/bar中，输入：

    mkdir /tmp/bar
    tar -jxvf foo.tar.bz2  -C /tmp/bar

--------------------------------------------------------------------------------

via: http://www.cyberciti.biz/faq/howto-extract-tar-file-to-specific-directory-on-unixlinux/

作者：[nixCraft][a]
译者：[geekpi](https://github.com/geekpi)
校对：[Caroline](https://github.com/carolinewuyan)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.cyberciti.biz/tips/about-us

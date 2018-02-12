用示例讲解 Linux Gunzip 命令
======

我们已经讨论过[ Linux 下 **gzip** 命令的用法 ][1]。对于初学者来说，gzip 工具主要用于压缩或者扩展文件。解压时，在 gzip 命令后添加 -d 选项，使用示例如下：

gzip -d [compressed-file-name]

不过，在解压或扩展 gzip 创建的压缩文件时，有另一款完全不同的工具可供使用。谈及的这款工具就是 **gunzip**。在本文中，我们会使用一些简单、易于理解的例子来解释 gunzip 命令的用法。文中所有示例及指南都在 Ubuntu 16.04 环境下测试。

### Linux gunzip 命令

我们现在知道压缩文件可以用 'gzip -d' 或 gunzip 命令解压。基本的 gunzip 语法为：

gunzip [compressed-file-name]

以下的 Q&A 例子将更清晰地展示 gunzip 工具如何工作:

### Q1. 如何使用 gunzip 解压压缩文件？

解压命令非常简单，仅仅需要将压缩文件名称作为参数传递到 gunzip 命令后。

gunzip [archive-name]

比如：

gunzip file1.gz

[![如何使用 gunzip 解压压缩文件？][2]][3]

### Q2. 如何让 gunzip 不删除原始压缩文件？

正如你已注意到的那样，gunzip 命令解压后会删除原始压缩文件。如果你想保留原始压缩文件，可以使用 **-c** 选项。

gunzip -c [archive-name] > [outputfile-name]

比如：

gunzip -c file1.gz > file1

[![如何让 gunzip 不删除原始压缩文件？][4]][5]

使用这种方式，原压缩文件不会被删除。

### Q3. 如何用 gunzip 解压文件到其他路径？

在 Q&A 中我们已经讨论过 **-c** 选项的用法。 使用 gunzip 解压文件到工作目录外的其他路径，仅需要在重定向操作符后添加目标目录的绝对路径即可。

gunzip -c [compressed-file] > [/complete/path/to/dest/dir/filename]

示例如下：

gunzip -c file1.gz > /home/himanshu/file1

### 更多信息

以下从 gzip/gunzip man page 中摘录的细节，对于想了解更多的人会有所助益。
```
gunzip 用命令行列出文件，并且替换每个以正确的幻数开头，后缀名为.gz，-gz，.z，-z，或 _z (忽略) 的压缩文件，删除原始文件。 gunzip 也可识别一些特殊扩展名的压缩文件，如 .tgz 和 .taz 分别是 .tar.gz 和 .tar.Z 的缩写。在压缩时，gzip 在必要情况下使用 .tgz 作为扩展名，而不是只截取为 .tar 作为后缀。

gunzip 目前可以解压 gzip，zip，compress，compress -H，pack 产生的文件。gunzip 自动检测输入文件格式。在使用前两种压缩格式时，gunzip 会检验 32 位循环冗余校验码（CRC）。对于 pack 包，gunzip 会检验压缩长度。标准压缩格式设计上不允许相容性检测。不过 gunzip 有时可以检测出坏的 .Z 文件。如果你解压 .Z 文件时出错，不要因为标准解压没报错就认为 .Z 文件一定是正确的。这通常意味着标准解压过程不检测它的输入，而是直接产生一个错误的输出。SCO compress -H 格式（lzh 压缩方法）不包括 CRC 校验码，但也允许一些相容性检查。
```

### 结语

到目前为止提到的 gunzip 基本用法，并不需要过多的学习曲线。我们已包含了一个初学者开始使用它所必须了解的几乎全部知识。想要了解更多的用法，去看 [man page][6] 吧。


--------------------------------------------------------------------------------

via: https://www.howtoforge.com/linux-gunzip-command/

作者：[Himanshu Arora][a]
译者：[erialin](https://github.com/erialin)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.howtoforge.com
[1]:https://www.howtoforge.com/linux-gzip-command/
[2]:https://www.howtoforge.com/images/linux_gunzip_command/gunzip-basic-usage.png
[3]:https://www.howtoforge.com/images/linux_gunzip_command/big/gunzip-basic-usage.png
[4]:https://www.howtoforge.com/images/linux_gunzip_command/gunzip-c.png
[5]:https://www.howtoforge.com/images/linux_gunzip_command/big/gunzip-c.png
[6]:https://linux.die.net/man/1/gzip

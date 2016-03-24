在linux中创建和解压文档的11个 tar 命令例子
================================================================================
### linux中的tar命令###

tar（磁带归档）命令是linux系统中被经常用来将文件存入到一个归档文件中的命令。

其常见的文件扩展包括：.tar.gz 和 .tar.bz2, 分别表示通过了gzip或bzip算法进一步进行了压缩。

在本教程中我们会管中窥豹一下在linux桌面或服务器版本中使用tar命令来处理一些创建和解压归档文件的日常工作的例子。

### 使用tar命令###

tar命令在大部分linux系统默认情况下都是可用的，所以你不用单独安装该软件。

> tar命令具有两个压缩格式，gzip和bzip，该命令的“z”选项用来指定gzip，“j”选项用来指定bzip。同时也可以创建非压缩归档文件。

#### 1.解压一个tar.gz归档 ####

一般常见的用法是用来解压归档文件，下面的命令将会把文件从一个tar.gz归档文件中解压出来。

    $ tar -xvzf tarfile.tar.gz

这里对这些参数做一个简单解释-

> x - 解压文件

> v - 冗长模式，在解压每个文件时打印出文件的名称。
 
> z - 该文件是一个使用 gzip 压缩的文件。
 
> f - 使用接下来的tar归档来进行操作。

这些就是一些需要记住的重要选项。

**解压 tar.bz2/bzip 归档文件**

具有bz2扩展名的文件是使用bzip算法进行压缩的，但是tar命令也可以对其进行处理，但是需要通过使用“j”选项来替换“z”选项。

    $ tar -xvjf archivefile.tar.bz2

#### 2.将文件解压到一个指定的目录或路径 ####

为了将文件解压到一个指定的目录中，使用“-C”选项来指定路径，此处的“C”是大写“C”。

    $ tar -xvzf abc.tar.gz -C /opt/folder/

然后，首先需要确认目标目录是否存在，毕竟tar命令并不会为你创建目录，所以如果目标目录不存在的情况下该命令会失败。

####3. 提取出单个文件 ####

为了从一个归档文件中提取出单个文件，只需要将文件名按照以下方式将其放置在命令后面。

    $ tar -xz -f abc.tar.gz "./new/abc.txt"

在上述命令中，可以按照以下方式来指定多个文件。

    $ tar -xz -f abc.tar.gz "./new/cde.txt" "./new/abc.txt"

#### 4.使用通配符来解压多个文件 ####

通配符可以用来解压于给定通配符匹配的一批文件，例如所有以".txt"作为扩展名的文件。

    $ tar -xz -f abc.tar.gz --wildcards "*.txt"

#### 5. 列出并检索tar归档文件中的内容 ####

如果你仅仅想要列出而不是解压tar归档文件的中的内容，使用“-t”（test）选项， 下面的命令用来打印一个使用gzip压缩过的tar归档文件中的内容。

    $ tar -tz -f abc.tar.gz
    ./new/
    ./new/cde.txt
    ./new/subdir/
    ./new/subdir/in.txt
    ./new/abc.txt
    ...

可以将输出通过管道定向到grep来搜索一个文件，或者定向到less命令来浏览内容列表。 使用"v"冗长选项将会打印出每个文件的额外详细信息。

对于 tar.bz2/bzip文件，需要使用"j"选项。

结合上述的命令和grep命令来检索归档文件，如下所示。简单吧！

    $ tar -tvz -f abc.tar.gz | grep abc.txt
    -rw-rw-r-- enlightened/enlightened 0 2015-01-13 11:40 ./new/abc.txt

####  6.创建一个tar/tar.gz归档文件  ####

现在我们已经学过了如何解压一个tar归档文件，是时候开始创建一个新的tar归档文件了。tar命令可以用来将所选的文件或整个目录放入到一个归档文件中，以下是相应的样例。

下面的命令使用一个目录来创建一个tar归档文件，它会将该目录中所有的文件和子目录都加入到归档文件中。

    $ tar -cvf abc.tar ./new/
    ./new/
    ./new/cde.txt
    ./new/abc.txt

上述命令不会创建一个压缩的的归档文件，只是一个普通的归档文件，只是将多个文件放入到一个归档文件中并没有真正地压缩每个文件。

为了使用压缩，可以分别使用“z”或“j”选项进行gzip或bzip压缩算法。

    $ tar -cvzf abc.tar.gz ./new/

> 文件的扩展名其实并不真正有什么影响。“tar.gz” 和“tgz”是gzip压缩算法压缩文件的常见扩展名。 “tar.bz2”和“tbz”是bzip压缩算法压缩文件的常见扩展名（LCTT 译注：归档是否是压缩的和采用哪种压缩方式并不取决于其扩展名，扩展名只是为了便于辨识。）。

#### 7. 在添加文件之前进行确认 ####

一个有用的选项是“w”，该选项使得tar命令在添加每个文件到归档文件之前来让用户进行确认，有时候这会很有用。

使用该选项时，只有用户输入“y”时的文件才会被加入到归档文件中，如果你不输入任何东西，其默认表示是一个“n”。

    # 添加指定文件
    
    $ tar -czw -f abc.tar.gz ./new/*
    add ‘./new/abc.txt’?y
    add ‘./new/cde.txt’?y
    add ‘./new/newfile.txt’?n
    add ‘./new/subdir’?y
    add ‘./new/subdir/in.txt’?n
    
    #现在列出所有被加入的文件

    $ tar -t -f abc.tar.gz 
    ./new/abc.txt
    ./new/cde.txt
    ./new/subdir/

#### 8. 加入文件到存在的归档文件中 ####

“r”选项可以被用来将文件加入到已存在的归档文件中，而不用创建一个新的归档文件，下面是一个简单的样例：

    $ tar -rv -f abc.tar abc.txt

> 文件并不能加入到已压缩的归档文件中（gz 或 bzip）。文件只能被加入到普通的归档文件中。

#### 9. 将文件加入到压缩的归档文件中（tar.gz/tar.bz2) ####

之前已经提到了不可能将文件加入到已压缩的归档文件中，然而依然可以通过简单的一些把戏来完成。使用gunzip命令来解压缩归档文件，然后将文件加入到归档文件中后重新进行压缩。

    $ gunzip archive.tar.gz
    $ tar -rf archive.tar ./path/to/file
    $ gzip archive.tar

对于bzip文件分别使用bzip2和bunzip2。

#### 10.通过tar来进行备份 ####

一个真实的场景是在固定的时间间隔内来备份目录，tar命令可以通过cron调度来实现这样的一个备份，以下是一个样例 ：

    $ tar -cvz -f archive-$(date +%Y%m%d).tar.gz ./new/

使用cron来运行上述的命令会保持创建类似以下名称的备份文件 ：'archive-20150218.tar.gz'。

当然，需要确保日益增长的归档文件不会导致磁盘空间的溢出。

#### 11. 在创建归档文件时进行验证 ####

"W"选项可以用来在创建归档文件之后进行验证，以下是一个简单例子。

    $ tar -cvW -f abc.tar ./new/
    ./new/
    ./new/cde.txt
    ./new/subdir/
    ./new/subdir/in.txt
    ./new/newfile.txt
    ./new/abc.txt
    Verify ./new/
    Verify ./new/cde.txt
    Verify ./new/subdir/
    Verify ./new/subdir/in.txt
    Verify ./new/newfile.txt                                                                                                                              
    Verify ./new/abc.txt

需要注意的是验证动作不能在压缩过的归档文件上进行，只能在非压缩的tar归档文件上执行。

这次就先到此为止，可以通过“man tar”命令来查看tar命令的的手册。

--------------------------------------------------------------------------------

via: http://www.binarytides.com/linux-tar-command/

作者：[Silver Moon][a]
译者：[theo-l](https://github.com/theo-l)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:https://plus.google.com/117145272367995638274/posts

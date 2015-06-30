Linux有问必答：Linux上如何查看种子文件的内容
================================================================================
> **问题**： 我从网站上下载了一个torrent（种子）文件。Linux上有没有工具让我查看torrent文件的内容？例如，我想知道torrent里面都包含什么文件。

torrent文件（也就是扩展名为**.torrent**的文件）是BitTorrent元数据文件，里面存储了BitTorrent客户端用来从BitTorrent点对点网络下载共享文件的信息（如，追踪器URL、文件列表、大小、校验和、创建日期等）。在单个torrent文件里面，可以列出一个或多个文件用于共享。

torrent文件内容由BEncode编码为BitTorrent数据序列化格式，因此，要查看torrent文件的内容，你需要相应的解码器。

事实上，任何图形化的BitTorrent客户端（如Transmission或uTorrent）都带有BEncode解码器，所以，你可以用它们直接打开来查看torrent文件的内容。然而，如果你不想要使用BitTorrent客户端来检查torrent文件，你可以试试这个命令行torrent查看器，它叫[dumptorrent][1]。

**dumptorrent**命令可以使用内建的BEncode解码器打印出torrent文件的详细信息（如，文件名、大小、跟踪器URL、创建日期、信息散列等等）。

### 安装DumpTorrent到Linux ###

要安装dumptorrent到Linux，你可以从源代码来构建它。

在Debian、Ubuntu或Linux Mint上：

    $ sudo apt-get install gcc make
    $ wget http://downloads.sourceforge.net/project/dumptorrent/dumptorrent/1.2/dumptorrent-1.2.tar.gz
    $ tar -xvf dumptorrent-1.2.tar.gz
    $ cd dumptorrent-1.2
    $ make
    $ sudo cp dumptorrent /usr/local/bin 

在CentOS、Fedora或RHEL上：

    $ sudo yum install gcc make
    $ wget http://downloads.sourceforge.net/project/dumptorrent/dumptorrent/1.2/dumptorrent-1.2.tar.gz
    $ tar -xvf dumptorrent-1.2.tar.gz
    $ cd dumptorrent-1.2
    $ make
    $ sudo cp dumptorrent /usr/local/bin 

确保你的搜索路径 PATH 中[包含][2]了/usr/local/bin。

### 查看torrent的内容 ###

要检查torrent的内容，只需要运行dumptorrent，并将torrent文件作为参数执行。这会打印出torrent的概要，包括文件名、大小和跟踪器URL。

    $ dumptorrent <torrent-file> 

![](https://farm8.staticflickr.com/7729/16816455904_b051e29972_b.jpg)

要查看torrent的完整内容，请添加“-v”选项。它会打印更多关于torrent的详细信息，包括信息散列、片长度、创建日期、创建者，以及完整的声明列表。

    $ dumptorrent -v <torrent-file> 

![](https://farm6.staticflickr.com/5331/17438628461_1f6675bd77_b.jpg)

--------------------------------------------------------------------------------

via: http://ask.xmodulo.com/view-torrent-file-content-linux.html

作者：[Dan Nanni][a]
译者：[GOLinux](https://github.com/GOLinux)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://ask.xmodulo.com/author/nanni
[1]:http://dumptorrent.sourceforge.net/
[2]:http://ask.xmodulo.com/change-path-environment-variable-linux.html

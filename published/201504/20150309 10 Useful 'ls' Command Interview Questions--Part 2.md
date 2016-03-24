10  个‘ls’命 令面试的问题（二）
================================================================================
这是关于文件列表命令的第二篇文章，继续探讨‘ls’命令的其他方面。该系列的第一篇文章受到了社区的高度关注，如果你错过了该系列的第一部分，可以访问以下地址：

- [15 个‘ls’命令的面试问题（一）][1]

这篇文章通过样例来很好地展现‘ls’命令的深入应用，我们加倍小心地来写这篇文章来保持其简洁可理解性，同时又能提供最全面的服务。

![10 Interview Questions on ls Command](http://www.tecmint.com/wp-content/uploads/2015/03/ls-Command-Interview-Questions.jpg)

*10 ‘ls’ 命令面试的问题*

### 16. 假如你想要以长列表的形式列出目录中的内容，但是不打印文件创建者名称以及文件所属组。看看输出有何不同之处。###

a. ls 命令在与‘-l’选项一起使用时会将文件以长列表格式输出。

    # ls -l

![List Files in- Long List Format](http://www.tecmint.com/wp-content/uploads/2015/03/List-Files-inLong-List-Format.gif)

*以长格式列出文件*

b. ls 命令在与‘-l’和‘--author’一起使用时，会将文件以长列表格式输出并带有文件创建者的名称信息。

    # ls -l --author

![List Files By Author](http://www.tecmint.com/wp-content/uploads/2015/03/List-Files-By-Author.gif)

*列出文件的创建者*

c. ls 命令在与‘-g’选项 一起将会列出文件名但是不带属主名称。

    # ls -g

![List Files Without Printing Owner Name](http://www.tecmint.com/wp-content/uploads/2015/03/List-Files-Without-Printing-Author.gif)

*列出文件但不列出属主*

d. ls 命令在与'-G'和‘-l’选项一起将会使用长列表格式列出文件名称但是不带文件所属组名称。

    # ls -Gl

![List Files Without Printing Group](http://www.tecmint.com/wp-content/uploads/2015/03/List-Files-Without-Printing-Group.gif)

*列出文件但是不列出所属组*

### 17. 使用易读格式打印出当前目录中的文件以及文件夹的大小，你会如何做？###

这里我们需要使用'-h'选项（人类可阅读的、易读的）同‘-l’或‘-s’选项与ls命令一起使用来得到想要的输出。

    # ls -hl

![List Files in Human Readable Format](http://www.tecmint.com/wp-content/uploads/2015/03/List-Size-of-Files-with-ls.gif)

*以易读格式的长列表列出文件*

    # ls -hs

![List File Sizes in Long List Format](http://www.tecmint.com/wp-content/uploads/2015/03/List-File-Sizes-in-Readable-Format.gif)

*以易读格式的短列表列出文件*

**注意**： ‘-h’选项使用1024（计算机中的标准）的幂，文件或文件夹的大小分别以K，M和G作为输出单位。

### 18. 既然‘-h’选项是使用1024的幂作为标准来输出大小，那么ls命令是否还支持其他的幂值呢？###

存在一个选项 ‘--si’与选项‘-h’相似，不同之处在于前者以使用1000的幂，后者使用1024的幂。

    # ls --si

所以'--si'也可以与‘-l’选项一起使用来按照1000的幂来输出文件夹的大小，并且以长列表格式显示。

    # ls --si -l

（LCTT 译注：此处原文参数有误，附图也不对，因此删除之）

### 19. 假如要你使用逗号‘,’作为分隔符来打印一个目录中的内容，可以吗？ 对于长列表形式也可行吗？###

当然！linux的ls命令当与其选项‘-m’一起使用时可以在打印目录内容时以逗号‘,’分割。由于逗号分割的内容是水平填充的，ls命令不能在垂直列出内容时使用逗号来分割内容。

    # ls -m

![Print Contents of Directory by Comma](http://www.tecmint.com/wp-content/uploads/2015/03/Print-Contents-of-Directory-by-Comma.gif)

*以逗号分隔显示内容*

当使用长列表格式时，‘-m’选项就没有什么效果了。

    # ls -ml

![Listing Content Horizontally](http://www.tecmint.com/wp-content/uploads/2015/03/Listing-Content-Horizentally.gif)

*长列表不能使用逗号分隔列表*

### 20. 有办法将目录的内容逆序打印出来吗？###

可以！上面的情形可以轻松地通过'-r'选项搞定，该选项将输出顺序倒置。这个选项也可以与‘-l’选项一起使用。

    # ls -r

![List Content in Reverse Order](http://www.tecmint.com/wp-content/uploads/2015/03/List-Content-in-Reverse-Order.gif)

*逆序列出*

    # ls -rl

![Long List Content in Reverse Order](http://www.tecmint.com/wp-content/uploads/2015/03/Long-List-Content-in-Reverse-Order.gif)

*逆序长列表*

### 21. 如果你被分配一个任务，来递归地打印各个子目录，你会如何应付？注意，只针对子目录而不是文件哦。###

小意思！使用“-R”选项就可以轻轻松松拿下，它也可以更进一步地与其他选项如‘-l’和‘-m’选项等组合使用。

    # ls -R

![Print Sub Directories in Recursively](http://www.tecmint.com/wp-content/uploads/2015/03/Print-Sub-Directories-in-Recursively.gif)

*递归列出子目录*

### 22. 如何按照文件大小对其进行排序？###

linux命令行选项'-S'赋予了ls命令这个超能力。按照文件大小从大到小的顺序排序：

    # ls -S

![Sort Files with ls Command](http://www.tecmint.com/wp-content/uploads/2015/03/Sort-Files-in-Linux.gif)
*按文件大小排序*

按照文件大小从小到大的顺序排序。

    # ls -Sr

![Sort Files in Descending Order](http://www.tecmint.com/wp-content/uploads/2015/03/Sort-Files-in-Descending-Order.gif)

*从小到大的排序*

### 23. 按照一行一个文件列出目录中的内容，并且不带额外信息的方式 ###

选项‘-1’在此可以解决这个问题，使用‘-1’选项来使用ls命令可以将目录中的内容按照一行一个文件并且不带额外信息的方式进行输出。

    # ls -1

![List Files Without Information](http://www.tecmint.com/wp-content/uploads/2015/03/List-Files-Without-Information.gif)

*不带其他信息，一行一个列出文件*

### 24. 现在委派给你一个任务，你必须将目录中的内容输出到终端而且需要使用双引号引起来，你会如何做？###

有一个选项‘-Q’会将ls命令的输出内容用双引号引起来。

    # ls -Q

![Print Files with Double Quotes](http://www.tecmint.com/wp-content/uploads/2015/03/Print-Files-with-Double-Quotes.gif)

*输出的文件名用引号引起来*

### 25. 想象一下你正在与一个包含有很多文件和文件夹的目录打交道，你需要使目录名显示在文件名之前，你如何做？###

    # ls --group-directories-first

![Print Directories First](http://www.tecmint.com/wp-content/uploads/2015/03/Print-Directories-First.gif)

*目录优先显示*

先点到为止，我们会马上提供该系列文章的下一部分。别换频道，关注我们。 另外别忘了在下面的评论中提出你们宝贵的反馈信息，喜欢就分享，帮助我们得到更好的传播吧!

--------------------------------------------------------------------------------

via: http://www.tecmint.com/ls-interview-questions/

作者：[Ravi Saive][a]
译者：[theo-l](https://github.com/theo-l)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/admin/
[1]:http://linux.cn/article-5349-1.html

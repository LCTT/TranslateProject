10 Useful ‘ls’ Command Interview Questions – Part 2
10个有用的‘ls’命令面试问题-第二部分
================================================================================
Continuing the legacy of ls command here is the second interview article on Listing command. The first article of the series was highly appreciated by the Tecmint Community. If you’ve missed the first part of this series you may like to visit at:
这是关于文件列表命令的第二篇文章，继续探讨‘ls’命令的其他方面。该系列的第一篇文章收到了Tecmint社区的高度关注，如果你错过了该系列的第一部分，你可能会访问以下地址：

- [15 Interview Questions on “ls” Command – Part 1][1]

This article is well presented in the manner that it gives deep insight of ls command with examples. We have taken extra care in the making of article so that it remains simple to understand yet serve the purpose to the fullest.
这篇文章通过样例来很好地展现‘ls’命令的深入应用，我们加倍小心地来写这篇文章来保持其简洁可理解性，同时又能提供最全面的服务。

![10 Interview Questions on ls Command](http://www.tecmint.com/wp-content/uploads/2015/03/ls-Command-Interview-Questions.jpg)
10 Interview Questions on ls Command

### 1. You are supposed to list the content of a directory in long list format, but not print the name of the author and group the file belongs. Also show the difference in output. ###
### 1. 假如你想要以长列表的形式列出目录中的内容，但是不打印文件创建者名称以及文件所属组。同时在输出中显示其不同之处。###

a. ls command listing the name of the files in long listing format when used with switch (-l).
a. ls 命令在与‘-l’选项一起使用时会将文件以长列表格式输出。

    # ls -l

![List Files in- Long List Format](http://www.tecmint.com/wp-content/uploads/2015/03/List-Files-inLong-List-Format.gif)
List Files in- Long List Format

b. ls command listing the name of the files in long listing format along with the name of the author file belongs, when used with switch (–author) along with switch (-l).
b. ls 命令在与‘-l’和‘--author’一起使用时，会将文件以长列表格式输出并带有文件创建者的名称信息。

    # ls -l --author

![List Files By Author](http://www.tecmint.com/wp-content/uploads/2015/03/List-Files-By-Author.gif)
List Files By Author

c. ls command listing the name of the files without the name of its owner, when used with switch (-g).
c. ls 命令在与‘-g’选项 一起将会列出文件名但是不带属主名称。

    # ls -g

![List Files Without Printing Owner Name](http://www.tecmint.com/wp-content/uploads/2015/03/List-Files-Without-Printing-Author.gif)
List Files Without Printing Owner Name

d. ls command listing the name of files in long listing format without the name of group it belongs, when used with switch (-G) along with switch (-l).
d. ls 命令在与'-G'和‘-l’选项一起将会使用长列表格式列出文件名称带式不带文件所属组名称。
    # ls -Gl

![List Files Without Printing Group](http://www.tecmint.com/wp-content/uploads/2015/03/List-Files-Without-Printing-Group.gif)
List Files Without Printing Group

### 2. Print the size of files and folders in the current directory, in human readable format. How will you do this? ###
### 2. 使用用户友好的格式打印出当前目录中的文件以及文件夹的大小，你会如何做？###
Well we need to use switch -h (human-readable) along with switch (-l) and/or (-s) with the command ls to get the desired output.
这里我们需要使用'-h'选项（人类可阅读的）同‘-l’或‘-s’选项与ls命令一起使用来得到想要的输出。
    # ls -hl

![List Files in Human Readable Format](http://www.tecmint.com/wp-content/uploads/2015/03/List-Size-of-Files-with-ls.gif)
List Files in Human Readable Format

    # ls -hs

![List File Sizes in Long List Format](http://www.tecmint.com/wp-content/uploads/2015/03/List-File-Sizes-in-Readable-Format.gif)
List File Sizes in Long List Format

**Note**: The option -h uses the power of 1024 (standard in computation) and output the size of files and folders in the units of K, M and G.
**注意**： ‘-h’选项使用1024（计算机中的标准）的幂，文件或文件夹的大小分别以K，M和G作为输出单位。

### 3. Well if switch (-h) output size in power of 1024, that is standard, What else power values are supported in ls command? ###
### 3. 既然‘-h’选项是使用1024的幂作为标准来输出大小，那么ls命令还支持其他的幂值呢？###

There exist a switch -si which is similar to switch -h. The only difference is switch -si uses power of 1000 unlike switch -h which uses the power of 1024.
存在一个选项 ‘-si’与选项‘-h’相似，不同之处在于前者以使用1000的幂，后者使用1024的幂。

    # ls -si

![Supported Power Values of ls Command](http://www.tecmint.com/wp-content/uploads/2015/03/ls-supported-power-values.gif)
Supported Power Values of ls Command

It can also be used with switch -l to output the size of folder in the power of 1000, in long listing format.
所以'-si'也可以与‘-l’选项一起使用来按照1000的幂来输出文件夹的大小，并且以长列表格式显示。

    # ls -si -l

![List Files by Power Values](http://www.tecmint.com/wp-content/uploads/2015/03/List-Files-by-Power-Values.gif)
List Files by Power Values

### 4. You are supposed to print the contents of a directory separated with comma. Is it possible? Can it be done in long listing format? ###
### 4. 假如要你使用逗号‘，’作为分隔符来打印一个目录中的内容，可以吗？ 对于长列表形式也可行吗？###

Yup! Linux ls command can output the contents of a directory separated by comma when used with the switch (-m). Since this comma separated entries are filled horizontally, ls command can’t separate contents with comma when listing contents vertically.
当然！linux的ls命令当与其选项‘-m’一起使用时可以在打印目录内容时以逗号‘，’分割。由于逗号分割的内容是水平填充的，ls命令不能在垂直列出内容时使用逗号来分割内容。

    # ls -m

![Print Contents of Directory by Comma](http://www.tecmint.com/wp-content/uploads/2015/03/Print-Contents-of-Directory-by-Comma.gif)
Print Contents of Directory by Comma

When used in long listing format, switch -m gets useless.
当使用长列表格式时，‘-m’选项就没有什么效果了。

    # ls -ml

![Listing Content Horizontally](http://www.tecmint.com/wp-content/uploads/2015/03/Listing-Content-Horizentally.gif)
Listing Content Horizontally

### 5. If there any way to print the contents of a directory upside down? i.e., in reverse order. ###
### 5. 有办法将目录的内容逆序打印出来吗？###

Yeah! The above situation can easily be achieved using the switch -r. The switch ‘-r‘ reverse the order of output. It can also be used with switch -l (long listing format).
可以！上面的情形可以轻松地通过'-r'选项搞定，该选项将输出顺序倒置。这个选项也可以与‘-l’选项一起使用。

    # ls -r

![List Content in Reverse Order](http://www.tecmint.com/wp-content/uploads/2015/03/List-Content-in-Reverse-Order.gif)
List Content in Reverse Order

    # ls -rl

![Long List Content in Reverse Order](http://www.tecmint.com/wp-content/uploads/2015/03/Long-List-Content-in-Reverse-Order.gif)
Long List Content in Reverse Order

### 6. You are given a situation to print the sub-directories recursively. How will you achieve this situation? Mind it only sub directories and no files. ###
### 6. 如果你被分配一个任务，来递归地打印各个子目录，你会如何应付？注意哟，只针对子目录而不是文件哦。###

Okay! That is pretty easy with the switch -R when used with command ls. It can further be grouped with other options like -l (long list) and -m (comma separated), etc.
小意思！使用“-R”选项就可以轻轻松松拿下，它也可以更进一步地与其他选项如‘-l’和‘-m’选项等组合使用。
    # ls -R

![Print Sub Directories in Recursively](http://www.tecmint.com/wp-content/uploads/2015/03/Print-Sub-Directories-in-Recursively.gif)
Print Sub Directories in Recursively

### 7. How to sort the files based upon the size? ###
### 7. 如何按照文件大小对其进行排序？###

The Linux command line option -S when used with ls gives the desired output. To sort the files based upon size in descending order with the largest file listed at first and smallest at last.
linux命令行选项'-S'赋予了ls命令这个超能力。按照文件大小从大到小的顺序排序：

    # ls -S

![Sort Files with ls Command](http://www.tecmint.com/wp-content/uploads/2015/03/Sort-Files-in-Linux.gif)
Sort Files with ls Command

To sort the files based upon size in descending order with the smallest file listed at first and largest at last.
按照文件大小从小到大的顺序排序。

    # ls -Sr

![Sort Files in Descending Order](http://www.tecmint.com/wp-content/uploads/2015/03/Sort-Files-in-Descending-Order.gif)
Sort Files in Descending Order

### 8. List the contents of a directory with no additional information appearing one file per line. ###
### 8. 列出目录中的内容按照一行一个文件并且不带额外信息的方式 ###
The switch -1 comes to rescue here. ls command with switch -1 output the contents of the directory with one file per line and no additional information.
选项‘-l’在此可以解决这个问题，使用‘-l’选项来使用ls命令可以将目录中的内容按照一行一个文件并且不带额外信息的方式进行输出。

    # ls -1

![List Files Without Information](http://www.tecmint.com/wp-content/uploads/2015/03/List-Files-Without-Information.gif)
List Files Without Information

### 9. You are given a situation in which you have to print the contents of a directory on standard output enclosed by double quotes. How will you do this? ###
### 9. 现在委派给你一个任务，你必须将目录中的内容输出到终端而且需要使用双引号引起来，你会如何做？###
There exist an option -Q (quote-name) which output the content of ls enclosed in double quotes.
存在一个选项‘-Q’会将ls命令的输出内容用双引号引起来。

    # ls -Q

![Print Files with Double Quotes](http://www.tecmint.com/wp-content/uploads/2015/03/Print-Files-with-Double-Quotes.gif)
Print Files with Double Quotes

### 10. You are working in a directory which contains lots of files and folders. You need to print the name of folders before directories. How will you get this? ###
### 10. 想象一下你正在与一个包含有很多文件和文件夹的目录打交道，你需要使目录名显示在文件名之前，你如何做？###

    # ls --group-directories-first

![Print Directories First](http://www.tecmint.com/wp-content/uploads/2015/03/Print-Directories-First.gif)
Print Directories First

That’s all for now. We will be coming up with the next part of this article series very soon. Till then stay tuned and connected to Tecmint. Do not forget to provide us with valuable feedback in the comment section below. Like and share us and help us get spread!
先点到为止，我们会马上提供该系列文章的下一部分。别换频道，关注Tecmint。 另外别忘了在下面的评论中提出你们宝贵的反馈信息，喜欢就分享，帮助我们得到更好的传播吧!

--------------------------------------------------------------------------------

via: http://www.tecmint.com/ls-interview-questions/

作者：[Ravi Saive][a]
译者：[theo-l](https://github.com/theo-l)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/admin/
[1]:http://www.tecmint.com/ls-command-interview-questions/

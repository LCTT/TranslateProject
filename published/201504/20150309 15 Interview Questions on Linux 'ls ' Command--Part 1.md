15 个‘ls’命令的面试问题（一）
================================================================================
Unix或类Unix系统中的“文件列表”命令“ls”是最基础并且使用的最广泛的命令行中工具之一。它是一个POSIX兼容工具，在GNU基本工具集以及BSD各种变体上都可以使用。“ls”命令可以结合大量的选项来达到想要的结果。

这篇文章的目的在于通过相关的样例来深入讨论文件列表命令。

![15 ls Command Questions](http://www.tecmint.com/wp-content/uploads/2014/09/ls-Command-Questions.png)

*15个“ls”命令问题。*

### 1. 如何列出目录中的文件？###

答：linux文件列表命令“ls”就是干这个的。

    # ls

![List Files](http://www.tecmint.com/wp-content/uploads/2014/09/list-files.gif)

*列出文件*

同时，我们也可以使用“echo(回显)”命令与一个通配符(*)参数来雷锤目录中的所有文件。

    # echo *

![List All Files](http://www.tecmint.com/wp-content/uploads/2014/09/list-all-files.gif)

*列出所有的文件。*

### 2. 如何只使用echo命令来只列出所有目录？###

    # echo */

![List All Directories](http://www.tecmint.com/wp-content/uploads/2014/09/list-all-directories.gif)

*列出所有的目录*

### 3.  怎样列出一个目录中的所有文件， 包括隐藏的以“.”开头的文件？###

答：我们需要将“-a”选项与“ls”命令一起使用。

    # ls -a

![List All Hidden Files](http://www.tecmint.com/wp-content/uploads/2014/09/list-all-hidden-files.gif)

*列出所有的隐藏文件。*

### 4. 如何列出目录中除了 “当前目录 .”和“父目录 ..”之外的所有文件，包括隐藏文件？###

答： 我们需要将“-A”选项与“ls”命令一起使用

    # ls -A

![Do Not List Implied](http://www.tecmint.com/wp-content/uploads/2014/09/Do-not-list-Implied.gif)

*别列出指代当前目录和父目录的文件*

### 5. 如何使用长格式打印出当前目录内容？###

答： 我们需要将“-l”选项与“ls”命令一起使用。

    # ls -l

![List Files Long](http://www.tecmint.com/wp-content/uploads/2014/09/list-files-long.gif)

*列出文件的长格式。*

上面的样例中，其输出结果看起来向下面这样。

    drwxr-xr-x  5 avi tecmint      4096 Sep 30 11:31 Binary

上面的drwxr-xr-x 是文件的权限，分别代表了文件所有者，所属组以及“整个世界”。 所有者具有读(r),写(w)以及执行(x)等权限。 该文件所属组具有读(r)和执行(x)但是没有写的权限，整个世界的其他可以访问到该文件的人也具有相同权限。

- 开头的‘d’意味着这是一个目录
- 数字'5'表示符号链接（有5个符号链接）
- 文件 Binary归属于用户 “avi”以及用户组 "tecmint"
- Sep 30 11:31 表示文件最后一次的访问日期与时间。

### 6. 假如让你来将目录中的内容以长格式列表打印，并且显示出隐藏的“点文件”，你会如何实现？###

答： 我们需要同时将"-a"和"-l"选项与“ls”命令一起使用（LCTT 译注：单字符选项可以合并写）。

    # ls -la

![Print Content of Directory](http://www.tecmint.com/wp-content/uploads/2014/09/Print-Content-of-Directory.gif)

*打印目录内容*

此外，如果我们不想列出“当前目录”和"父目录"，可以将“-A”和“-l”选项同“ls”命令一起使用。

    # ls -lA

### 7. 如何找到每个文件的创建者？###

答： 我们需要结合 “--author”和 "-l"选项来打印出每个文件的创建者。

    # ls --author -l

![List Author Files](http://www.tecmint.com/wp-content/uploads/2014/09/List-Author-Files.gif)

*列出文件创建者。*

### 8. 如何对用转义字符打印出非显示字符？###

答：我们只需要使用“-b”选项来对非显示字符进行转义打印

    # ls -b

![Print Escape Character](http://www.tecmint.com/wp-content/uploads/2014/09/Print-Escape-Character.gif)

### 9. 用指定特定的单位格式来列出文件和目录的大小，你会如何实现？###

答： 在此可以同时使用选项“-block-size=scale”和“-l”，但是我们需要用特定的单位如M，K等来替换‘scale’参数。

    # ls --block-size=M -l
    # ls --block-size=K -l

![List File Scale Format](http://www.tecmint.com/wp-content/uploads/2014/09/List-File-Scale-Format.gif)

*列出文件大小单位格式。*

### 10. 列出目录中的文件，但是不显示备份文件，即那些文件名以‘~’结尾的文件###

答： 选项‘-B’赶来救驾。

    # ls -B

![List File Without Backup](http://www.tecmint.com/wp-content/uploads/2014/09/List-File-Without-Backup.gif)

*列出非备份文件*

### 11. 将目录中的所有文件按照名称进行排序，并显示其最后修改时间信息？###

答： 为了实现这个需求，我们需要同时将“-c”和"-l"选项与命令一起使用。

    # ls -cl

![Sort Files](http://www.tecmint.com/wp-content/uploads/2014/09/Sort-Files.gif)

*文件排序*

### 12. 将目录中的文件按照修改时间进行排序，并显示相关联的信息。###

答： 我们需要同时使用3个选项：'-l','-t','-c' 来对文件使用修改时间排序，最新的修改时间排在最前。

    # ls -ltc

![Sort Files by Modification](http://www.tecmint.com/wp-content/uploads/2014/09/Sort-Files-by-Modification.gif)

*按照修改时间对文件排序。*

### 13. 如何控制‘ls’命令的输出颜色的有无？###

答： 需要使用选项‘--color=parameter’，参数具有三种不同值，“auto(自动)”，“always(一直)”，“never(无色)”。

    # ls --color=never
    # ls --color=auto
    # ls --color=always

![ls Colorful Output](http://www.tecmint.com/wp-content/uploads/2014/09/ls-colorful-output.gif)

*ls的输出颜色*

### 14. 假如只需要列出目录本身，而不是目录的内容，你会如何做？###

答：在此“-d”选项就会显得很顺手。

    # ls -d

![List Directory Entries](http://www.tecmint.com/wp-content/uploads/2014/09/List-Directory-Entries.gif)

*列出目录本身*

### 15. 为长格式列表命令"ls -l"创建一个别名“ll”，并将其结果输出到一个文件而不是标准输出中。###

答：在上述的这个场景中，我们需要将别名添加到.bashrc文件中，然后使用重定向操作符将输出写入到文件而不是标准输出中。我们将会使用编辑器nano。

    # ls -a
    # nano .bashrc
    # ll >> ll.txt
    # nano ll.txt

![Create Alias for ls command](http://www.tecmint.com/wp-content/uploads/2014/09/Create-ls-Alias.gif)

*为ls命令创建别名。*

先到此为止，别忘了在下面的评论中提出你们的宝贵意见，我会再次带着另外的有趣的文章在此闪亮登场。

### 参考阅读：###

- [10 个‘ls’命令的面试问题（二）][1]
- [Linux中15个基础的'ls'命令][2]

--------------------------------------------------------------------------------

via: http://www.tecmint.com/ls-command-interview-questions/

作者：[Avishek Kumar][a]
译者：[theo-l](https://github.com/theo-l)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/avishek/
[1]:http://www.tecmint.com/ls-interview-questions/
[2]:http://linux.cn/article-5109-1.html

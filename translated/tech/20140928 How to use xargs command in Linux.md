如何在Linux里使用xargs命令
================================================================================
你是否遇到过这样的情况，需要一遍又一遍地对多个文件执行同样的操作？如果有过，那你肯定会深有感触这是多么的无聊和效率低下。还好有种简单的方式，可以在基于Unix的操作系统中使用xargs命令解决这个烦恼。通过这个命令你可以有效地处理多个文件，节省你的时间和精力。在这篇教程中，你可以学到如何一次性对多个文件执行命令或脚本操作，再也不用担心像单独处理无数个日志或数据文件那样吓人的任务了。

xargs命令有两个要点。第一，你必须列出目标文件。第二，你必须指定对每个文件需要执行的命令或脚本。

这篇教程会涉及三个应用场景，xargs命令被用来处理分布在不同目录下的文件：

1. 计算所有文件的行数
1. 打印指定文件的第一行
1. 对每个文件执行一个自定义脚本

请看下面这个叫xargstest的目录（用tree命令以及-i和-f选项显示了目录树结构，这样可以避免缩进显示而且每个文件都会带有完整路径）：

    $ tree -if xargstest/ 

![](https://farm3.staticflickr.com/2942/15334985981_ce1a192def.jpg)

这六个文件的内容分别如下：

![](https://farm4.staticflickr.com/3882/15346287662_a3084a8e4f_o.png)

这个**xargstest**目录，以及它包含的子目录和文件将用在下面的例子中。

### 场景1：计算所有文件的行数 ###

就像之前提到的，使用xargs命令的第一个要点是一个用来运行命令或脚本的文件列表。我们可以用find命令来确定和列出目标文件。选项**-name 'file??'**指定了xargstest目录下那些名字以"file"开头并跟随两个任意字符的文件才是匹配的。这个搜索默认是递归的，意思是find命令会在xargstest和它的子目录下搜索匹配的文件。

    $ find xargstest/ -name 'file??' 

----------

    xargstest/dir3/file3B
    xargstest/dir3/file3A
    xargstest/dir1/file1A
    xargstest/dir1/file1B
    xargstest/dir2/file2B
    xargstest/dir2/file2A

我们可以通过管道把结果发给sort命令让文件名按顺序排列：

    $ find xargstest/ -name 'file??' | sort 

----------

    xargstest/dir1/file1A
    xargstest/dir1/file1B
    xargstest/dir2/file2A
    xargstest/dir2/file2B
    xargstest/dir3/file3A
    xargstest/dir3/file3B

然后我们需要第二个要素，就是需要执行的命令。我们使用带有-l选项的wc命令来计算每个文件包含的换行符数目（会在输出的每一行的前面打印出来）：

    $ find xargstest/ -name 'file??' | sort | xargs wc -l 

----------

     1 xargstest/dir1/file1A
     2 xargstest/dir1/file1B
     3 xargstest/dir2/file2A
     4 xargstest/dir2/file2B
     5 xargstest/dir3/file3A
     6 xargstest/dir3/file3B
    21 total

可以看到，不用对每个文件手动执行一次wc -l命令，而xargs命令可以让你在一步里完成所有操作。那些之前看起来无法完成的任务，例如单独处理数百个文件，现在可以相当轻松地完成了。

### 场景2：打印指定文件的第一行 ###

既然你已经有一些使用xargs命令的基础，你可以自由选择执行什么命令。有时，你也许希望只对一部分文件执行操作而忽略其他的。在这种情况下，你可以使用find命令的-name选项以及?通配符（匹配任意单个字符）来选中特定文件并通过管道输出给xargs命令。举个例子，如果你想打印以“B”字符结尾的文件而忽略以“A”结尾的文件的第一行，可以使用下面的find、xargs和head命令组合来完成（head -n1会打印一个文件的第一行）：

    $ find xargstest/ -name 'file?B' | sort | xargs head -n1 

----------

    ==> xargstest/dir1/file1B <==
    one
    
    ==> xargstest/dir2/file2B <==
    one
    
    ==> xargstest/dir3/file3B <==
    one

你将看到只有以“B”结尾的文件会被处理，而所有以“A”结尾的文件都被忽略了。

### 场景3：对每个文件执行一个自定义脚本 ###

最后，你也许希望对一些文件执行一个自定义脚本（例如Bash、Python或是Perl）。要做到这一点，只要简单地用你的自定义脚本名字替换掉之前例子中的wc和head命令就好了：

    $ find xargstest/ -name 'file??' | xargs myscript.sh 

自定义脚本**myscript.sh**需要写成接受一个文件名作为参数并处理这个文件。上面的命令将为find命令找到的每个文件分别调用脚本。

注意一下上面的例子中的文件名并没有包含空格。通常来说，在Linux环境下操作没有空格的文件名会舒服很多。如果你实在是需要处理名字中带有空格的文件，上边的命令就不能用了，需要稍微处理一下来让它可以被接受。这可以通过find命令的-print0选项（它会打印完整的文件名到标准输出，并以空字符结尾），以及xargs命令的-0选项（它会以空字符作为字符串结束标记）来实现，就像下面的例子：

    $ find xargstest/ -name 'file*' -print0 | xargs -0 myscript.sh 

注意一下，-name选项所跟的参数已经改为'file\*'，意思是所有以"file"开头而结尾可以是任意字符的文件都会被选中。

### 总结 ###

在看完这篇教程后你应该会理解xargs命令的作用，以及如何应用到自己的工作中。很快你就可以有时间享受这个命令所带来的高效率，而不用把你的时间耗费在一些重复的任务上了。想了解更详细的信息以及更多的选项，你可以在终端中输入'man xargs'命令来查看xargs的文档。

--------------------------------------------------------------------------------

via: http://xmodulo.com/xargs-command-linux.html

作者：[Joshua Reed][a]
译者：[zpl1025](https://github.com/zpl1025)
校对：[Caroline](https://github.com/carolinewuyan)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://xmodulo.com/author/joshua

举例说明Linux diff 命令
================================================================================
![](http://linoxide.com/wp-content/uploads/2013/11/linux-diff-command.png)

在比较文件的时候，通常会用基于GUI的软件。很少有人真正会为了这个目的使用命令行工具。虽然说使用命令行来比较文件/目录并不像一件小事儿那样容易，但是如果你是一个Linux使用者，那么我想你应该知道如何通过命令行比较文件，因为一旦使用了它，你会认为它绝对是一个快速的方法。

在本篇中，我们将通过一些实例来学习如何使用diff命令。

### Linux diff 命令 ###

让我们通过一些实际的例子理解diff命令。

假设我们有两个文件(file1 和 file2)：

    $ cat file1
    Hi,
    Hello,
    How are you?
    I am fine,
    Thank you.


    $ cat file2
    Hello,
    Hi,
    How are you?
    I am fine.

你可以看见两个文件有些小的不同。现在，让我们看看diff命令如何找出两者的不同的。

像这样运行diff命令:

    $ diff file1 file2
    1d0
    < Hi, 
    2a2 
    > Hi,
    4,5c4
    < I am fine,
    < Thank you.
    --- 
    > I am fine.

你可以看见diff后面跟了两个文件的名字作为命令行的参数，并且它在输出中生成了差异比较。输出并不容易理解。理由是，这是被计算机使用的而不是为了人类。尽管如此，让我们一步步解码输出：

**注意** – 在下面的文本中，file1和file2将被当作旧文件和新文件。

    1d0
    < Hi,

这里，1d0这一行意味着旧文件的第一行应该被删除(d)以使两个文件的第一行同步。旧文件中需要被删除的行以'<'标记。

    2a2
    > Hi,
 
这里，2a2行意味着新文件中的第二行应该加到旧文件的第二行后。要添加的行显示在输出的下一行用'>'标记。

    4,5c4
    < I am fine,
    < Thank you.
    ---
    > I am fine.

这里，4,5c4这一行意味着在旧文件中的4到5行现在已被改变并且需要用新文件中的第4行代替。添加和删除的行分别用'>'和'<'表示。

那么，来总结一下,

- 首先diff命令的第一个参数被视为旧文件而第二个参数被视为新文件。
- 像1d0、2a2、4,5c4这种表达式可以用语法解码为 **[旧文件的行号或者行的范围][行为][新文件的行号或者行的范围]**。这里的'行为'可以是追加,删除或者改变替换。
- '<'代表删除的行，而'>'代表添加的行。

除了文件外，diff命令还可以比较两个目录。让我们通过一个例子学习。

这里是'new_dir'目录包含的内容:

    $ ls new_dir/
    file file2 frnd frnd1.cpp log1.txt log3.txt log5.txt
    file1 file name with spaces frnd1 frnd.cpp log2.txt log4.txt

这是'orig_dir'目录含有的内容：(译注：原文为and here are the contents of a directory named ‘old_dir’ ，其中'old_dir'应为笔误。)

    $ ls orig_dir/
    file1 file name with spaces frnd1 frnd.cpp log2.txt log4.txt test
    file2 frnd frnd1.cpp log1.txt log3.txt log5.txt

下面是diff命令执行后的输出：

    $ diff new_dir/ orig_dir/
    Only in new_dir/: file
    Only in orig_dir/: test

你可以看到当diff命令被用来比较这两个目录时，很容易就会显示两个文件中缺失的文件。

下面是一些在命令行下常用的选项:

### 1. 用 -i 忽略大小写 ###

如果两个文件含有相同的文本但是大小写不同，diff命令仍会默认报告它不同。

比如:

    $ cat file1
    HI
    
    $ cat file2
    hi
    
    $ diff file1 file2
    1c1
    < HI
    ---
    > hi

你可以看见diff命令在输出中报告了大小写不同。

要去除这个默认行为，使用-i选项。

以下是个例子:

    $ diff -i file1 file2
    $

这样你可以看到没有生成输出，这是当两个文件相同时的默认行为。

### 2. 用 -s 选项报告两个文件相同 ###

在例子1的后面，我们看到如果文件相同diff不会生成报告。虽然这个默认行为不错但是它仍可能会造成很大疑惑，特别对于新手而言。因此，如果你像样diff命令明确地报告两个文件不同，那么就使用-s命令选项。

来举个例子:

    $ diff -is file1 file2
    Files file1 and file2 are identical

你可以看到我加了-s选项在后面的例子中，这次diff命令会明确地报告两个文件是相同的。

### 3. 使用 -b 忽略空格 ###

另外一个常用的是diff报告文件存在不同数量的空格。


举例说明：

    $ cat file1
    Hi, how are you?
    
    $ cat file2
    Hi, how are  you?

观察这两个文件唯一的不同是file2中'are'和'you'之间额外的空格。现在，当使用diff命令比较两个文件时，输出如下：

    $ diff file1 file2
    1c1
    < Hi, how are you?
    ---
    > Hi, how are  you?

因此你可以看到diff命令报告了不同。但是如果你想要忽略这些空格，使用 -b 选项。

    $ diff -b file1 file2
    $

这样你可以看到由于-b选项，diff命令报告这两个文件是相同的。

diff命令还提供了更多的命令行选项。阅读[man page][1]来获取完整的列表。

--------------------------------------------------------------------------------

via: http://linoxide.com/linux-command/linux-diff-command-examples/

译者：[geekpi](https://github.com/geekpi) 校对：[Caroline](https://github.com/carolinewuyan)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://unixhelp.ed.ac.uk/CGI/man-cgi?diff

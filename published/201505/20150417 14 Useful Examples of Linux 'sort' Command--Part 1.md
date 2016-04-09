Linux 的 ‘sort’命令的14个有用的范例（一）
=============================================================
Sort是用于对单个或多个文本文件内容进行排序的Linux程序。Sort命令以空格作为字段分隔符，将一行分割为多个关键字对文件进行排序。需要注意的是除非你将输出重定向到文件中，否则Sort命令并不对文件内容进行实际的排序(即文件内容没有修改)，只是将文件内容按有序输出。

本文的目标是通过14个实际的范例让你更深刻的理解如何在Linux中使用sort命令。

1、 首先我们将会创建一个用于执行‘sort’命令的文本文件（tecmint.txt）。工作路径是‘/home/$USER/Desktop/tecmint’。

下面命令中的‘-e’选项将启用‘\\’转义，将‘\n’解析成换行

	$ echo -e "computer\nmouse\nLAPTOP\ndata\nRedHat\nlaptop\ndebian\nlaptop" > tecmint.txt

![Split String by Lines in Linux](http://www.tecmint.com/wp-content/uploads/2015/04/Split-String-by-Lines.gif)

2、 在开始学习‘sort’命令前，我们先看看文件的内容及其显示方式。

	$ cat tecmint.txt

![Check Content of File](http://www.tecmint.com/wp-content/uploads/2015/04/Check-Content-of-File.gif)

3、 现在，使用如下命令对文件内容进行排序。

    $ sort tecmint.txt

![Sort Content of File linux](http://www.tecmint.com/wp-content/uploads/2015/04/Sort-Content.gif)

**注意**：上面的命令并不对文件内容进行实际的排序，仅仅是将其内容按有序方式输出。

4、 对文件‘tecmint.txt’文件内容排序，并将排序后的内容输出到名为sorted.txt的文件中，然后使用[cat][1]命令查看验证sorted.txt文件的内容。

    $ sort tecmint.txt > sorted.txt
    $ cat sorted.txt

![Sort File Content in Linux](http://www.tecmint.com/wp-content/uploads/2015/04/Sort-File-Content.gif)

5、 现在使用‘-r’参数对‘tecmint.txt’文件内容进行逆序排序，并将输出内容重定向到‘reversesorted.txt’文件中，并使用cat命令查看文件的内容。

    $ sort -r tecmint.txt > reversesorted.txt
    $ cat reversesorted.txt

![Sort Content By Reverse](http://www.tecmint.com/wp-content/uploads/2015/04/Sort-Content-By-Reverse.gif)

6、 创建一个新文件（lsl.txt），文件内容为在home目录下执行‘ls -l’命令的输出。

    $ ls -l /home/$USER > /home/$USER/Desktop/tecmint/lsl.txt
    $ cat lsl.txt

![Populate Output of Home Directory](http://www.tecmint.com/wp-content/uploads/2015/04/Populate-Output.gif)

我们将会看到对其他字段进行排序的例子，而不是对默认的开始字符进行排序。

7、 基于第二列（符号连接的数量）对文件‘lsl.txt’进行排序。

    $ sort -nk2 lsl.txt

**注意**：上面例子中的‘-n’参数表示对数值内容进行排序。当想基于文件中的数值列对文件进行排序时，必须要使用‘-n’参数。

![Sort Content by Column](http://www.tecmint.com/wp-content/uploads/2015/04/Sort-Content-by-Column.gif)

8、 基于第9列（文件和目录的名称，非数值）对文件‘lsl.txt’进行排序。

    $ sort -k9 lsl.txt

![Sort Content Based on Column](http://www.tecmint.com/wp-content/uploads/2015/04/Sort-Content-Based-on-Column.gif)

9、 sort命令并非仅能对文件进行排序，我们还可以通过管道将命令的输出内容重定向到sort命令中。

    $ ls -l /home/$USER | sort -nk5

![Sort Content Using Pipe Option](http://www.tecmint.com/wp-content/uploads/2015/04/Sort-Content-By-Pipeline.gif)

10、 对文件tecmint.txt进行排序，并删除重复的行。然后检查重复的行是否已经删除了。

    $ cat tecmint.txt
    $ sort -u tecmint.txt

![Sort and Remove Duplicates](http://www.tecmint.com/wp-content/uploads/2015/04/Sort-and-Remove-Duplicates.gif)

目前我们发现的排序规则：

除非指定了‘-r’参数，否则排序的优先级按下面规则排序

 - 以数字开头的行优先级最高
 - 以小写字母开头的行优先级次之
 - 待排序内容按字典序进行排序
 - 默认情况下，‘sort’命令将带排序内容的每行关键字当作一个字符串进行字典序排序（数字优先级最高，参看规则 1）
 
11、 在当前位置创建第三个文件‘lsla.txt’，其内容用‘ls -lA’命令的输出内容填充。

    $ ls -lA /home/$USER > /home/$USER/Desktop/tecmint/lsla.txt
    $ cat lsla.txt

![Populate Output With Hidden Files](http://www.tecmint.com/wp-content/uploads/2015/04/Populate-Output-With-Hidden-Files.gif)

了解ls命令的读者都知道‘ls -lA’ 等于 ‘ls -l’ + 隐藏文件，所以这两个文件的大部分内容都是相同的。

12、 对上面两个文件内容进行排序输出。

    $ sort lsl.txt lsla.txt

![Sort Contents of Two Files](http://www.tecmint.com/wp-content/uploads/2015/04/Sort-Content-of-Multiple-Files.gif)

注意文件和目录的重复

13、 现在我们看看怎样对两个文件进行排序、合并，并且删除重复行。

    $ sort -u lsl.txt lsla.txt

![Sort, Merge and Remove Duplicates from File](http://www.tecmint.com/wp-content/uploads/2015/04/Sort-Merge-Duplicates-Content.gif)

此时，我们注意到重复的行已经被删除了，我们可以将输出内容重定向到文件中。

14、 我们同样可以基于多列对文件内容进行排序。基于第2,5（数值）和9（非数值）列对‘ls -l’命令的输出进行排序。

    $ ls -l /home/$USER | sort -t "," -nk2,5 -k9

![Sort Content By Field Column](http://www.tecmint.com/wp-content/uploads/2015/04/Sort-Content-By-Field-Column.gif)

先到此为止了，在接下来的文章中我们将会学习到‘sort’命令更多的详细例子。届时敬请关注我们。保持分享精神。若喜欢本文，敬请将本文分享给你的朋友。

--------------------------------------------------------------------------------

via: http://www.tecmint.com/sort-command-linux/

作者：[Avishek Kumar][a]
译者：[cvsher](https://github.com/cvsher)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/avishek/
[1]:http://www.tecmint.com/13-basic-cat-command-examples-in-linux/

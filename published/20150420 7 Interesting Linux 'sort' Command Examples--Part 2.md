Linux 的 'sort'命令的七个有趣实例（二）
================================================================================

在[上一篇文章][1]里，我们已经探讨了关于sort命令的多个例子，如果你错过了这篇文章，可以点击下面的链接进行阅读。今天的这篇文章作为上一篇文章的继续，将讨论关于sort命令的剩余用法，与上一篇一起作为Linux ‘sort’命令的完整指南。

- [Linux 的 ‘sort’命令的14个有用的范例（一）][1]
 
在我们继续深入之前，先创建一个文本文档‘month.txt’，并且将上一次给出的数据填进去。

    $ echo -e "mar\ndec\noct\nsep\nfeb\naug" > month.txt
    $ cat month.txt

![Populate Content](http://www.tecmint.com/wp-content/uploads/2015/04/Populate-Content.gif)

15、 通过使用’M‘选项，对’month.txt‘文件按照月份顺序进行排序。

    $ sort -M month.txt

**注意**:‘sort’命令需要至少3个字符来确认月份名称。

![Sort File Content by Month in Linux](http://www.tecmint.com/wp-content/uploads/2015/04/Sort-by-Month.gif)

16、 把数据整理成方便人们阅读的形式，比如1K、2M、3G、2T，这里面的K、G、M、T代表千、兆、吉、梯。
（LCTT 译注：此处命令有误，ls 命令应该增加 -h 参数，径改之）

    $ ls -lh /home/$USER | sort -h -k5

![Sort Content Human Readable Format](http://www.tecmint.com/wp-content/uploads/2015/04/Sort-Content-Human-Readable-Format.gif)

17、 在上一篇文章中，我们在例子4中创建了一个名为‘sorted.txt’的文件，在例子6中创建了一个‘lsl.txt’。‘sorted.txt'已经排好序了而’lsl.txt‘还没有。让我们使用sort命令来检查两个文件是否已经排好序。

    $ sort -c sorted.txt

![Check File is Sorted](http://www.tecmint.com/wp-content/uploads/2015/04/Check-File-is-Sorted.gif)

如果它返回0，则表示文件已经排好序。

    $ sort -c lsl.txt

![Check File Sorted Status](http://www.tecmint.com/wp-content/uploads/2015/04/Check-File-Sorted-Status.gif)

报告无序。存在矛盾……

18、 如果文字之间的分隔符是空格，sort命令自动地将空格后的东西当做一个新文字单元，如果分隔符不是空格呢？

考虑这样一个文本文件，里面的内容可以由除了空格之外的任何符号分隔，比如‘|’，‘\’，‘+’，‘.’等……

创建一个分隔符为+的文本文件。使用‘cat‘命令查看文件内容。

    $ echo -e "21+linux+server+production\n11+debian+RedHat+CentOS\n131+Apache+Mysql+PHP\n7+Shell Scripting+python+perl\n111+postfix+exim+sendmail" > delimiter.txt

----------

    $ cat delimiter.txt

![Check File Content by Delimiter](http://www.tecmint.com/wp-content/uploads/2015/04/Check-File-Content.gif)

现在基于由数字组成的第一个域来进行排序。

    $ sort -t '+' -nk1 delimiter.txt

![Sort File By Fields](http://www.tecmint.com/wp-content/uploads/2015/04/Sort-File-By-Fields.gif)

然后再基于非数字的第四个域排序。

![Sort Content By Non Numeric](http://www.tecmint.com/wp-content/uploads/2015/04/Sort-Content-By-Non-Numeric.gif)

如果分隔符是制表符，你需要在’+‘的位置上用$’\t’代替，如上例所示。

19、 对主用户目录下使用‘ls -l’命令得到的结果基于第五列（‘文件大小’）进行一个乱序排列。

    $ ls -l /home/avi/ | sort -k5 -R 

![Sort Content by Column in Random Order](http://www.tecmint.com/wp-content/uploads/2015/04/Sort-Content-by-Column1.gif)

每一次你运行上面的脚本，你得到结果可能都不一样，因为结果是随机生成的。

正如我在上一篇文章中提到的规则2所说——sort命令会将以小写字母开始的行排在大写字母开始的行前面。看一下上一篇文章的例3，字符串‘laptop’在‘LAPTOP’前出现。

20、 如何覆盖默认的排序优先权？在这之前我们需要先将环境变量LC_ALL的值设置为C。在命令行提示栏中运行下面的代码。

    $ export LC_ALL=C

然后以非默认优先权的方式对‘tecmint.txt’文件重新排序。

    $ sort tecmint.txt

![Override Sorting Preferences](http://www.tecmint.com/wp-content/uploads/2015/04/Override-Sorting-Preferences.gif)

*覆盖排序优先权*

不要忘记与example 3中得到的输出结果做比较，并且你可以使用‘-f’，又叫‘-ignore-case’（忽略大小写）的选项来获取更有序的输出。

    $ sort -f tecmint.txt

![Compare Sorting Preferences](http://www.tecmint.com/wp-content/uploads/2015/04/Compare-Sorting-Preferences.gif)

21、 给两个输入文件进行‘sort‘，然后把它们连接成一行！

我们创建两个文本文档’file1.txt‘以及’file2.txt‘，并用数据填充，如下所示，并用’cat‘命令查看文件的内容。

    $ echo -e “5 Reliable\n2 Fast\n3 Secure\n1 open-source\n4 customizable” > file1.txt
    $ cat file1.txt

![Populate Content with Numbers](http://www.tecmint.com/wp-content/uploads/2015/04/Populate-Content-with-Number.gif)

用如下数据填充’file2.txt‘。

    $ echo -e “3 RedHat\n1 Debian\n5 Ubuntu\n2 Kali\n4 Fedora” > file2.txt
    $ cat file2.txt

![Populate File with Data](http://www.tecmint.com/wp-content/uploads/2015/04/Populate-File-with-Data.gif)

现在我们对两个文件进行排序并连接。

    $ join <(sort -n file1.txt) <(sort file2.txt)

![Sort Join Two Files](http://www.tecmint.com/wp-content/uploads/2015/04/Sort-Join-Two-Files.gif)


我所要讲的全部内容就在这里了，希望与各位保持联系，也希望各位经常来逛逛。有反馈就在下面评论吧。

--------------------------------------------------------------------------------

via: http://www.tecmint.com/linux-sort-command-examples/

作者：[Avishek Kumar][a]
译者：[DongShuaike](https://github.com/DongShuaike)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/avishek/
[1]:http://www.tecmint.com/sort-command-linux/

如何按最后修改时间对 ls 命令的输出进行排序
============================================================

Linux 用户常常做的一个事情是，是在命令行[列出目录内容][1]。

我们已经知道，[ls][2] 和 [dir][3] 是两个可用在列出目录内容的 Linux 命令，前者是更受欢迎的，在大多数情况下，是用户的首选。

我们列出目录内容时，可以按照不同的标准进行排序，例如文件名、修改时间、添加时间、版本或者文件大小。可以通过指定一个特别的参数来使用这些文件的属性进行排序。

在这个简洁的 [ls 命令指导][4]中，我们将看看如何通过上次修改时间（日期和时分秒）[排序 ls 命令的输出结果][5] 。

让我们由执行一些基本的 [ls 命令][6]开始。

###  Linux 基本 ls 命令

1、 不带任何参数运行 ls 命令将列出当前工作目录的内容。

```
$ ls 
```

![List Content of Working Directory](http://www.tecmint.com/wp-content/uploads/2016/10/List-Content-of-Working-Directory.png)

*列出工作目录的内容*

2、要列出任何目录的内容，例如 /etc 目录使用如下命令：

```
$ ls /etc
```
![List Contents of Directory](http://www.tecmint.com/wp-content/uploads/2016/10/List-Contents-of-Directory.png)

*列出工作目录 /etc 的内容*

3、一个目录总是包含一些隐藏的文件（至少有两个），因此，要展示目录中的所有文件，使用`-a`或`-all`标志：

```
$ ls  -a
```

![List Hidden Files in Directory](http://www.tecmint.com/wp-content/uploads/2016/10/List-Hidden-Files-in-Directory.png)

*列出工作目录的隐藏文件*

4、你还可以打印输出的每一个文件的详细信息，例如文件权限、链接数、所有者名称和组所有者、文件大小、最后修改的时间和文件/目录名称。

这是由` -l `选项来设置，这意味着一个如下面的屏幕截图般的长长的列表格式。

```
$ ls -l
```
![Long List Directory Contents](http://www.tecmint.com/wp-content/uploads/2016/10/ls-Long-List-Format.png)

*长列表目录内容*

### 基于日期和基于时刻排序文件

5、要在目录中列出文件并[对最后修改日期和时间进行排序][11]，在下面的命令中使用`-t`选项：

```
$ ls -lt 
```

![Sort ls Output by Date and Time](http://www.tecmint.com/wp-content/uploads/2016/10/Sort-ls-Output-by-Date-and-Time.png)

*按日期和时间排序ls输出内容*

6、如果你想要一个基于日期和时间的逆向排序文件，你可以使用`-r`选项来工作，像这样：

```
$ ls -ltr
```

![Sort ls Output Reverse by Date and Time](http://www.tecmint.com/wp-content/uploads/2016/10/Sort-ls-Output-Reverse-by-Date-and-Time.png)

*按日期和时间排序的逆向输出*

我们将在这里结束，但是，[ls 命令][14]还有更多的使用信息和选项，因此，应该特别注意它或看看其它指南，比如《[每一个用户应该知道 ls 的命令技巧][15]》或《[使用排序命令][16]》。

最后但并非最不重要的，你可以通过以下反馈部分联系我们。

--------------------------------------------------------------------------------

via: http://www.tecmint.com/sort-ls-output-by-last-modified-date-and-time

作者：[Aaron Kili][a]
译者：[zky001](https://github.com/zky001)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/aaronkili/
[1]:http://www.tecmint.com/file-and-directory-management-in-linux/
[2]:http://www.tecmint.com/15-basic-ls-command-examples-in-linux/
[3]:http://www.tecmint.com/linux-dir-command-usage-with-examples/
[4]:http://www.tecmint.com/tag/linux-ls-command/
[5]:http://www.tecmint.com/sort-command-linux/
[6]:http://www.tecmint.com/15-basic-ls-command-examples-in-linux/
[7]:http://www.tecmint.com/wp-content/uploads/2016/10/List-Content-of-Working-Directory.png
[8]:http://www.tecmint.com/wp-content/uploads/2016/10/List-Contents-of-Directory.png
[9]:http://www.tecmint.com/wp-content/uploads/2016/10/List-Hidden-Files-in-Directory.png
[10]:http://www.tecmint.com/wp-content/uploads/2016/10/ls-Long-List-Format.png
[11]:http://www.tecmint.com/find-and-sort-files-modification-date-and-time-in-linux/
[12]:http://www.tecmint.com/wp-content/uploads/2016/10/Sort-ls-Output-by-Date-and-Time.png
[13]:http://www.tecmint.com/wp-content/uploads/2016/10/Sort-ls-Output-Reverse-by-Date-and-Time.png
[14]:http://www.tecmint.com/tag/linux-ls-command/
[15]:http://www.tecmint.com/linux-ls-command-tricks/
[16]:http://www.tecmint.com/linux-sort-command-examples/
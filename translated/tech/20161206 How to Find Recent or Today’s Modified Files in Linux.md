如何在Linux中找出最近或今天被修改的文件
============================================================

在本文中，我们将解释两个简单的[命令行小贴士][5]，它可以帮你列出今天的所有文件。

Linux用户在命令行上遇到的常见问题之一是[定位具有特定名称的文件][6]，当你知道真实的文件名时可能会容易得多。

但是，假设你忘记了在白天早些时候创建的文件的名称（在你包含了数百个文件的`home`文件夹中），但你有急用。

下面用不同的方式只[列出所有你今天创建或修改的文件][7]（直接或间接）。

1.使用[ls命令][8]，你只能按如下所示在你的home文件夹中列出今天的文件，其中：

1. `-a` - 列出所有文件，包括隐藏文件
2. `-l` - 启用长列表格式
3. `--time-style = FORMAT` - 显示指定FORMAT的时间
4. `+％D` - 以％m/％d/％y格式显示/使用日期

```
# ls  -al --time-style=+%D | grep 'date +%D'
```
[
 ![Find Recent Files in Linux](http://www.tecmint.com/wp-content/uploads/2016/12/Find-Recent-Files-in-Linux.png) 
][9]

在Linux中找出最近的文件

In addition, you can [sort the resultant list alphabetically][10] by including the `-X` flag:
此外，你使用可以`-X`标志来[按字母顺序对结果排序][10]：

```
# ls -alX --time-style=+%D | grep 'date +%D'
```

你也可以使用`-S`标志来基于大小（大的优先）来排序：

```
# ls -alS --time-style=+%D | grep 'date +%D'
```

2. 另外使用[find命令][11]会更灵活，并且提供比ls更多的选项，用于以下相同的目的。

1. `-maxdepth`级别用于指定要执行搜索操作的起点（在这个情况下为当前目录）下的搜索层级（按子目录）。
2. `-newerXY`，如果有问题的文件的时间戳X比引用文件的时间戳Y更新，那么这个就能用了。 X和Y表示以下任何字母：
     1. a - 文件引用的访问时间
     2. B - 文件引用的创建时间
     3. c - 文件引用的inode状态改变时间
     4.m - 文件引用的修改时间
     5. t - 引用直接解释为一个时间

下面的命令意味着只有在2016-12-06修改的文件将被找出：

```
# find . -maxdepth 1 -newermt "2016-12-06"
```
[
 ![Find Today's Files in Linux](http://www.tecmint.com/wp-content/uploads/2016/12/Find-Todays-Files-in-Linux.png) 
][12]

在Linux中找出今天的文件

重要：使参考上面的[find命令][13]中正确的日期格式，一旦你使用了错误的格式，你会得到如下错误：

```
# find . -maxdepth 1 -newermt "12-06-2016"
find: I cannot figure out how to interpret '12-06-2016' as a date or time
```

或者使用下面正确的格式：

```
# find . -maxdepth 1 -newermt "12/06/2016"
或者
# find . -maxdepth 1 -newermt "12/06/16"
```
[
 ![Find Todays Modified Files in Linux](http://www.tecmint.com/wp-content/uploads/2016/12/Find-Todays-Modified-Files.png) 
][14]

在Linux中找出今天修改的文件

你可以在我们的下面一系列文章中获得`ls`和`find`命令的更多使用信息。

1. [用15例子的掌握Linux ‘ls’ 命令][1]
2. [对Linux用户有用的7个奇怪的技巧][2]
3. [用35个例子掌握Linux ‘find’ 命令][3]
4. [在Linux中使用扩展查找多个文件名的方法][4]

在本文中，我们解释了如何使用ls和find命令帮助只列出今天的文件。 使用以下反馈栏向我们发送有关该主题的任何问题或意见。 你也可以提醒我们其他可以用于这个目的的命令。

--------------------------------------------------------------------------------

作者简介：Aaron Kili是一名Linux和F.O.S.S的爱好者，将来的Linux系统管理员、网站开发人员，目前是TecMint的内容创作者，他喜欢用电脑工作，并坚信分享知识。

------------------

via: http://www.tecmint.com/find-recent-modified-files-in-linux/

作者：[Aaron Kili][a]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/aaronkili/
[1]:http://www.tecmint.com/15-basic-ls-command-examples-in-linux/
[2]:http://www.tecmint.com/linux-ls-command-tricks/
[3]:http://www.tecmint.com/35-practical-examples-of-linux-find-command/
[4]:http://www.tecmint.com/linux-find-command-to-search-multiple-filenames-extensions/
[5]:http://www.tecmint.com/tag/linux-tricks/
[6]:http://www.tecmint.com/linux-find-command-to-search-multiple-filenames-extensions/
[7]:http://www.tecmint.com/sort-ls-output-by-last-modified-date-and-time/
[8]:http://www.tecmint.com/tag/linux-ls-command/
[9]:http://www.tecmint.com/wp-content/uploads/2016/12/Find-Recent-Files-in-Linux.png
[10]:http://www.tecmint.com/sort-command-linux/
[11]:http://www.tecmint.com/35-practical-examples-of-linux-find-command/
[12]:http://www.tecmint.com/wp-content/uploads/2016/12/Find-Todays-Files-in-Linux.png
[13]:http://www.tecmint.com/find-directory-in-linux/
[14]:http://www.tecmint.com/wp-content/uploads/2016/12/Find-Todays-Modified-Files.png

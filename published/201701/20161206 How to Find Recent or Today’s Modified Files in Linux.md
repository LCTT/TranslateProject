如何在 Linux 中找出最近或今天被修改的文件
============================================================

在本文中，我们将解释两个简单的[命令行小技巧][5]，它可以帮你只列出所有的今天的文件。

Linux 用户在命令行上遇到的常见问题之一是[定位具有特定名称的文件][6]，如果你知道确定的文件名则可能会容易得多。

不过，假设你忘记了白天早些时候创建的文件的名称（在你包含了数百个文件的 `home` 文件夹中），但现在你有急用。

下面用不同的方式只[列出所有你今天创建或修改的文件][7]（直接或间接）。

1、 使用 [ls 命令][8]，只列出你的 home 文件夹中今天的文件。

```
# ls  -al --time-style=+%D | grep 'date +%D'
```

其中：

- `-a` - 列出所有文件，包括隐藏文件
- `-l` - 启用长列表格式
- `--time-style=FORMAT` - 显示指定 FORMAT 的时间
- `+％D` - 以 `％m/％d/％y` （月/日/年）格式显示或使用日期

[
 ![Find Recent Files in Linux](http://www.tecmint.com/wp-content/uploads/2016/12/Find-Recent-Files-in-Linux.png) 
][9]

*在Linux中找出最近的文件*

此外，你使用可以 `-X` 标志来[按字母顺序对结果排序][10]：

```
# ls -alX --time-style=+%D | grep 'date +%D'
```

你也可以使用 `-S` 标志来基于大小（由大到小）来排序：

```
# ls -alS --time-style=+%D | grep 'date +%D'
```

2、 另外，使用 [find 命令][11]会更灵活，并且提供比 `ls` 更多的选项，可以实现相同的目的。

-  `-maxdepth` 级别用于指定在搜索操作的起点下（在这个情况下为当前目录）的搜索层级（子目录层级数）。
-  `-newerXY`，用于所寻找的文件的时间戳 `X` 比参照文件的时间戳 `Y` 更新一些的文件。 `X` 和 `Y` 表示以下任何字母：
     -  `a` - 参照文件的访问时间
     -  `B` - 参照文件的创建时间
     -  `c` - 参照文件的 inode 状态改变时间
     -  `m` - 参照文件的修改时间
     -  `t` - 直接指定一个绝对时间

下面的命令意思是只找出 2016-12-06 这一天修改的文件：

```
# find . -maxdepth 1 -newermt "2016-12-06"
```
[
 ![Find Today's Files in Linux](http://www.tecmint.com/wp-content/uploads/2016/12/Find-Todays-Files-in-Linux.png) 
][12]

*在 Linux 中找出今天的文件*

重要：在上面的 [find 命令][13]中使用正确的**日期格式**作为参照时间，一旦你使用了错误的格式，你会得到如下错误：

```
# find . -maxdepth 1 -newermt "12-06-2016"
find: I cannot figure out how to interpret '12-06-2016' as a date or time
```

或者，使用下面的正确格式：

```
# find . -maxdepth 1 -newermt "12/06/2016"
或者
# find . -maxdepth 1 -newermt "12/06/16"
```
[
 ![Find Todays Modified Files in Linux](http://www.tecmint.com/wp-content/uploads/2016/12/Find-Todays-Modified-Files.png) 
][14]

*在 Linux 中找出今天修改的文件*

你可以在我们的下面一系列文章中获得 `ls `和 `find` 命令的更多使用信息。

- [用 15 例子的掌握 Linux ‘ls’ 命令][1]
- [对 Linux 用户有用的 7 个奇特技巧][2]
- [用 35 个例子掌握 Linux ‘find’ 命令][3]
- [在 Linux 中使用扩展查找多个文件名的方法][4]

在本文中，我们解释了如何使用 ls 和 find 命令帮助只列出今天的文件。 请使用以下反馈栏向我们发送有关该主题的任何问题或意见。 你也可以提醒我们其他可以用于这个目的的命令。

--------------------------------------------------------------------------------

作者简介：Aaron Kili是一名 Linux 和 F.O.S.S 的爱好者，未来的 Linux 系统管理员、网站开发人员，目前是 TecMint 的内容创作者，他喜欢用电脑工作，并乐于分享知识。

------------------

via: http://www.tecmint.com/find-recent-modified-files-in-linux/

作者：[Aaron Kili][a]
译者：[geekpi](https://github.com/geekpi)
校对：[jasminepeng](https://github.com/jasminepeng)

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

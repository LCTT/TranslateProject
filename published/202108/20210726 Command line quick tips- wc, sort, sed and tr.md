[#]: subject: (Command line quick tips: wc, sort, sed and tr)
[#]: via: (https://fedoramagazine.org/command-line-quick-tips-wc-sort-sed-and-tr/)
[#]: author: (mahesh1b https://fedoramagazine.org/author/mahesh1b/)
[#]: collector: (lujun9972)
[#]: translator: (perfiffer)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13664-1.html)

一些命令行小技巧：wc、sort、sed 和 tr
======

![](https://img.linux.net.cn/data/attachment/album/202108/10/085720hyd795y1wrmd5rx9.jpg)

Linux 发行版十分好用，而且它们有一些用户可能不知道的技巧。让我们来看看一些命令行实用工具，当你热衷于终端而不是 GUI 时，它们可能更顺手。

我们都知道在一个系统上使用终端会更高效。当你编辑和排版一个文本文件时，终端会让你确切的感受到，生活如此简单。

本文将向你介绍 `wc`、`sort`、`tr` 和 `sed` 命令。

### wc

`wc` 是一个实用工具，全称是 “word count”。顾名思义，它可以用来统计任何文件的行数、单词数和字节数。

让我们来看看它是如何工作的：

```
$ wc filename
lines words characters filename
```

输出的是文件的行数、单词数、字符数和文件名。

想获得特定的输出，我们必须使用选项：

  * `-c` 打印字节总数
  * `-l` 打印行数
  * `-w` 打印单词总数
  * `-m` 打印字符总数

#### wc 示例

让我们来看看它的运行结果。

让我们从一个文本文件 `lormipsm.txt` 开始。首先，我们通过 `cat` 查看文件内容，然后使用 `wc`：

```
$ cat loremipsm.txt
Linux is the best-known and most-used open source operating system.
As an operating system, Linux is software that sits underneath all of the other software on a computer,
receiving requests from those programs and replaying these requests to the computer's hardware.

$ wc loremipsm.txt
3 41 268 loremipsm.txt
```

假设我只想查看文件的字节数：

```
$ wc -c loremipsm.txt
268 loremipsm.txt
```

查看文件的行数：

```
$ wc -l loremipsm.txt
3 loremipsm.txt
```

查看文件的单词数：

```
$ wc -w loremipsm.txt
41 loremipsm.txt
```

现在只查看文件的字符数：

```
$ wc -m loremipsm.txt
268 loremipsm.txt
```

### sort

`sort` 命令是最有用的工具之一。它会对文件的数据进行排序。可以根据字符或数字进行升序或降序排列。它也可以用来对文件中的行进行排序和随机化。

使用 `sort` 非常简单。我们需要做的仅仅是提供一个文件名：

```
$ sort filename
```

默认的是按照字母顺序对数据进行排序。需要注意的是 `sort` 命令仅仅是对数据进行排序展示。它并不会改写文件。

使用 `sort` 命令的一些有用的选项：

  * `-r` 将文件中的行按倒序进行排序
  * `-R` 将文件中的行打乱为随机顺序
  * `-o` 将输出保存到另一个文件中
  * `-k` 按照特定列进行排序
  * `-t` 使用指定的分隔符，而不使用空格
  * `-n` 根据数值对数据进行排序

#### sort 示例

让我们看看 `sort` 的几个简单示例。

我们有一个 `list.txt` 的文件，包含逗号分隔的名称和数值。

首先让我们打印出文件内容并简单排序：

```
$ cat list.txt
Cieran Wilks, 9
Adelina Rowland, 4
Hayden Mcfarlnd, 1
Ananya Lamb, 5
Shyam Head, 2
Lauryn Fuents, 8
Kristian Felix, 10
Ruden Dyer, 3
Greyson Meyers, 6
Luther Cooke, 7

$ sort list.txt
Adelina Rowland, 4
Ananya Lamb, 5
Cieran Wilks, 9
Greyson Meyers, 6
Hayden Mcfarlnd, 1
Kristian Felix, 10
Lauryn Fuents, 8
Luther Cooke, 7
Ruden Dyer, 3
Shyam Head, 2
```

现在对数据进行倒序排序：

```
$ sort -r list.txt
Shyam Head, 2
Ruden Dyer, 3
Luther Cooke, 7
Lauryn Fuents, 8
Kristian Felix, 10
Hayden Mcfarlnd, 1
Greyson Meyers, 6
Cieran Wilks, 9
Ananya Lamb, 5
Adelina Rowland, 4
```

让我们打乱数据：

```
$ sort -R list.txt
Cieran Wilks, 9
Greyson Meyers, 6
Adelina Rowland, 4
Kristian Felix, 10
Luther Cooke, 7
Ruden Dyer, 3
Lauryn Fuents, 8
Hayden Mcfarlnd, 1
Ananya Lamb, 5
Shyam Head, 2
```

来看一点更复杂的。这次我们根据第二个字段，也就是数值对数据进行排序，并使用 `-o` 选项将输出保存到另一个文件中：

```
$ sort -n -k2 -t ',' -o sorted_list.txt list.txt
$ ls
   sorted_list.txt    list.txt
$ cat sorted_list.txt
Hayden Mcfarlnd, 1
Shyam Head, 2
Ruden Dyer, 3
Adelina Rowland, 4
Ananya Lamb, 5
Greyson Meyers, 6
Luther Cooke, 7
Lauryn Fuents, 8
Cieran Wilks, 9
Kristian Felix, 10
```

这里我们使用 `-n` 选项按数字顺序进行排序，`-k` 选项用来指定要排序的字段（在本例中为第 2 个字段），`-t` 选项指定分隔符或字段分隔符（逗号），`-o` 选项将输出保存到 `sorted_list.txt` 文件中。

### sed

`sed` 是一个流编辑器，用于过滤和转换输出中的文本。这意味着我们不需要对原文件进行修改，只需要对输出进行修改。如果需要，我们可以将更改保存到一个新的文件中。`sed` 提供了很多有用的选项用于过滤和编辑数据。

`sed` 的语法格式如下：

```
$ sed [OPTION] ‘PATTERN’ filename
```

sed 常用的一些选项：

  * `-n` 取消默认输出
  * `p` 打印指定的数据 
  * `d` 删除指定行
  * `q` 退出 `sed` 脚本

#### sed 示例

我们来看看 `sed` 是如何运作的。我们从 `data` 文件开始，其中的字段表示编号、名称、年龄和操作系统。

如果行出现在特定的行范围内，该行将打印 2 次：

```
$ cat data
1    Vicky Grant      20   linux
2    Nora Burton    19   Mac
3    Willis Castillo   21  Windows
4    Gilberto Mack 30   Windows
5    Aubrey Hayes  17   windows
6    Allan Snyder    21   mac
7    Freddie Dean   25   linux
8    Ralph Martin    19   linux
9    Mindy Howard  20   Mac

$ sed '3,7 p' data
1    Vicky Grant      20   linux
2    Nora Burton    19   Mac
3    Willis Castillo   21  Windows
3    Willis Castillo   21  Windows
4    Gilberto Mack 30   Windows
4    Gilberto Mack 30   Windows
5    Aubrey Hayes  17   windows
5    Aubrey Hayes  17   windows
6    Allan Snyder    21   mac
6    Allan Snyder    21   mac
7    Freddie Dean   25   linux
7    Freddie Dean   25   linux
8    Ralph Martin    19   linux
9    Mindy Howard 20   Mac
```

这里的操作用单引号括起来，表示第 3 行和第 7 行，并且使用了 `p` 打印出符合匹配规则的数据。sed 的默认行为是在解析后打印每一行。这意味着由于使用了 `p` ，第 3 行到第 7 行打印了两次。

如何打印文件中特定的行？使用 `-n` 选项来消除在输出中不匹配的行：

```
$ sed -n '3,7 p' data
3    Willis Castillo     21    Windows
4    Gilberto Mack    30   Windows
5    Aubrey Hayes     17   windows
6    Allan Snyder       21   mac
7    Freddie Dean      25  linux
```

使用 ‘-n’ 仅仅只有第 3 行到第 7 行会被打印。

省略文件中的特定行。使用 `d` 从输出中删除行：

```
$ sed '3 d' data
1    Vicky Grant      20    linux
2   Nora Burton     19    Mac
4   Gilberto Mack  30    Windows
5   Aubrey Hayes   17    windows
6   Allan Snyder     21    mac
7   Freddie Dean    25   linux
8   Ralph Martin    19    linux
9   Mindy Howard  20   Mac

$ sed '5,9 d' data
1    Vicky Grant     20   linux
2   Nora Burton    19   Mac
3   Willis Castillo   21   Windows
4   Gilberto Mack 30   Windows
```

从文件中搜索特定的关键字：

```
$ sed -n '/linux/ p' data
7    Freddie Dean   25  linux
8    Ralph Martin   19   linux

$ sed -n '/linux/I p' data
1     Vicky Grant      20  Linux
7     Freddie Dean  25  linux
8     Ralph Martin   19  linux
```

在这些例子中，我们在 `/ /` 中使用了一个正则表达式。如果文件中有类似的单词，但大小写不一致，可以使用 `I` 使得搜索不区分大小写。回想一下，`-n` 删除了输出中不匹配的行。

替换文件中的单词：

```
$ sed 's/linux/linus/' data
1   Vicky Grant      20   Linux
2   Nora Burton    19   Mac
3   Willis Castillo   21   Windows
4   Gilberto Mack  30  Windows
5   Aubrey Hayes   17  windows
6   Allan Snyder     21  mac
7   Freddie Dean    25 linus
8   Ralph Martin    19  linus
9   Mindy Howard 20  Mac
```

这里 `s/ / /` 表示它是一个正则表达式。在两个 `/` 之间的就是定位的单词和需要替换的新单词。

### tr

`tr` 命令可以用来转换或删除字符。它可以将小写字母转换为大写字母，也可以将大写字母转换为小写字母，可以消除重复字符，也可以删除特定字符。

`tr` 的奇怪之处在于，它不同于 `wc`、`sort`、`sed` 那样接受文件作为输入。我们使用 `|` （管道符）为 `tr` 命令提供输入。

```
$ cat filename | tr [OPTION]
```

`tr` 命令使用的一些选项：

  * `-d` 删除给定输入第一个集合中的指定字符，不做转换
  * `-s` 将重复出现的字符替换为单个

#### tr 示例

现在让我们使用 `tr` 命令将 `letter` 文件中的所有小写字符转换为大写字符：

```
$ cat letter
Linux is too easy to learn,
And you should try it too.

$ cat letter | tr 'a-z' 'A-Z'
LINUX IS TOO EASY TO LEARN,
AND YOU SHOULD TRY IT TOO.
```

这里的 `a-z`、`A-Z` 表示我们想要将 `a` 到 `z` 范围内的小写字符转换为大写字符。

删除文件中的 `o` 字符：

```
$ cat letter | tr -d 'o'
Linux is t easy t learn,
And yu shuld try it t.
```

从文件中压缩字符 `o` 意味着如果 `o` 在文件中重复出现，那么它将会被删除并且只打印一次：

```
$ cat letter | tr -s 'o'
Linux is to easy to learn,
And you should try it to.
```

### 总结

这是使用 `wc`、`sort`、`sed`、`tr` 命令的快速演示。这些命令可以方便快捷的操作终端上的文本文件。你可以使用 `man` 命令来了解这些命令的更多信息。

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/command-line-quick-tips-wc-sort-sed-and-tr/

作者：[mahesh1b][a]
选题：[lujun9972][b]
译者：[perfiffer](https://github.com/perfiffer)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/mahesh1b/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2018/10/commandlinequicktips-816x345.jpg

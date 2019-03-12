[#]: collector: (lujun9972)
[#]: translator: (HankChow)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10502-1.html)
[#]: subject: (Understanding Angle Brackets in Bash)
[#]: via: (https://www.linux.com/blog/learn/2019/1/understanding-angle-brackets-bash)
[#]: author: (Paul Brown https://www.linux.com/users/bro66)

理解 Bash 中的尖括号
======

> 为初学者介绍尖括号。

![](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/architecture-1839450_1920.jpg?itok=ra6XonD3)

[Bash][1] 内置了很多诸如 `ls`、`cd`、`mv` 这样的重要的命令，也有很多诸如 `grep`、`awk`、`sed` 这些有用的工具。但除此之外，其实 [Bash][1] 中还有很多可以[起到胶水作用][2]的标点符号，例如点号（`.`）、逗号（`,`）、括号（`<>`）、引号（`"`）之类。下面我们就来看一下可以用来进行数据转换和转移的尖括号（`<>`）。

### 转移数据

如果你对其它编程语言有所了解，你会知道尖括号 `<` 和 `>` 一般是作为逻辑运算符，用来比较两个值之间的大小关系。如果你还编写 HTML，尖括号作为各种标签的一部分，就更不会让你感到陌生了。

在 shell 脚本语言中，尖括号可以将数据从一个地方转移到另一个地方。例如可以这样把数据存放到一个文件当中：

```
ls > dir_content.txt
```

在上面的例子中，`>` 符号让 shell 将 `ls` 命令的输出结果写入到 `dir_content.txt` 里，而不是直接显示在命令行中。需要注意的是，如果 `dir_content.txt` 这个文件不存在，Bash 会为你创建；但是如果 `dir_content.txt` 是一个已有的非空文件，它的内容就会被覆盖掉。所以执行类似的操作之前务必谨慎。

你也可以不使用 `>` 而使用 `>>`，这样就可以把新的数据追加到文件的末端而不会覆盖掉文件中已有的数据了。例如：

```
ls $HOME > dir_content.txt; wc -l dir_content.txt >> dir_content.txt
```

在这串命令里，首先将家目录的内容写入到 `dir_content.txt` 文件中，然后使用 `wc -l` 计算出 `dir_content.txt` 文件的行数（也就是家目录中的文件数）并追加到 `dir_content.txt` 的末尾。

在我的机器上执行上述命令之后，`dir_content.txt` 的内容会是以下这样：

```
Applications
bin
cloud
Desktop
Documents
Downloads
Games
ISOs
lib
logs
Music
OpenSCAD
Pictures
Public
Templates
test_dir
Videos
17 dir_content.txt
```

你可以将 `>` 和 `>>` 作为箭头来理解。当然，这个箭头的指向也可以反过来。例如，Coen brothers 
（LCTT 译注：科恩兄弟，一个美国电影导演组合）的一些演员以及他们出演电影的次数保存在 `CBActors` 文件中，就像这样：

```
John Goodman 5
John Turturro 3
George Clooney 2
Frances McDormand 6
Steve Buscemi 5
Jon Polito 4
Tony Shalhoub 3
James Gandolfini 1
```

你可以执行这样的命令：

```
sort < CBActors
Frances McDormand 6 # 你会得到这样的输出
George Clooney 2
James Gandolfini 1
John Goodman 5
John Turturro 3
Jon Polito 4
Steve Buscemi 5
Tony Shalhoub 3
```

就可以使用 [sort][4] 命令将这个列表按照字母顺序输出。但是，`sort` 命令本来就可以接受传入一个文件，因此在这里使用 `<` 会略显多余，直接执行 `sort CBActors` 就可以得到期望的结果。

如果你想知道 Coens 最喜欢的演员是谁，你可以这样操作。首先：

```
while read name surname films; do echo $films $name $surname > filmsfirst.txt; done < CBActors
```

上面这串命令写在多行中可能会比较易读：

```
while read name surname films;\
 do
 echo $films $name $surname >> filmsfirst;\
 done < CBActors
```

下面来分析一下这些命令做了什么：

  *  [while ...; do ... done][5] 是一个循环结构。当 `while` 后面的条件成立时，`do` 和 `done` 之间的部分会一直重复执行；
  * [read][6] 语句会按行读入内容。`read` 会从标准输入中持续读入，直到没有内容可读入；
  * `CBActors` 文件的内容会通过 `<` 从标准输入中读入，因此 `while` 循环会将 `CBActors` 文件逐行完整读入；
  * `read` 命令可以按照空格将每一行内容划分为三个字段，然后分别将这三个字段赋值给 `name`、`surname` 和 `films` 三个变量，这样就可以很方便地通过 `echo $films $name $surname >> filmsfirst;\` 来重新排列几个字段的放置顺序并存放到 `filmfirst` 文件里面了。

执行完以后，查看 `filmsfirst` 文件，内容会是这样的：

```
5 John Goodman
3 John Turturro
2 George Clooney
6 Frances McDormand
5 Steve Buscemi
4 Jon Polito
3 Tony Shalhoub
1 James Gandolfini
```

这时候再使用 `sort` 命令：

```
sort -r filmsfirst
```

就可以看到 Coens 最喜欢的演员是 Frances McDormand 了。（`-r` 参数表示降序排列，因此 McDormand 会排在最前面）

--------------------------------------------------------------------------------

via: https://www.linux.com/blog/learn/2019/1/understanding-angle-brackets-bash

作者：[Paul Brown][a]
选题：[lujun9972][b]
译者：[HankChow](https://github.com/HankChow)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.linux.com/users/bro66
[b]: https://github.com/lujun9972
[1]: https://www.linux.com/blog/2019/1/bash-shell-utility-reaches-50-milestone
[2]: https://www.linux.com/blog/learn/2019/1/linux-tools-meaning-dot
[3]: https://linux.die.net/man/1/wc
[4]: https://linux.die.net/man/1/sort
[5]: http://tldp.org/HOWTO/Bash-Prog-Intro-HOWTO-7.html
[6]: https://linux.die.net/man/2/read


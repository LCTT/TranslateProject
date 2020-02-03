[#]: collector: (lujun9972)
[#]: translator: (lxbwolf)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11657-1.html)
[#]: subject: (Get sorted with sort at the command line)
[#]: via: (https://opensource.com/article/19/10/get-sorted-sort)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

在命令行用 sort 进行排序
======

> 在 Linux、BSD 或 Mac 的终端中使用 sort 命令，按自己的需求重新整理数据。

![](https://img.linux.net.cn/data/attachment/album/201912/09/065444f42xl2lddxillz09.jpg)

如果你曾经用过数据表应用程序，你就会知道可以按列的内容对行进行排序。例如，如果你有一个费用列表，你可能希望对它们进行按日期或价格升序抑或按类别进行排序。如果你熟悉终端的使用，你不会仅为了排序文本数据就去使用庞大的办公软件。这正是 [sort][2] 命令的用处。

### 安装

你不必安装 `sort` ，因为它向来都包含在 [POSIX][3] 系统里。在大多数 Linux 系统中，`sort` 命令来自 GNU 组织打包的实用工具集合中。在其他的 POSIX 系统中，像 BSD 和 Mac，默认的 `sort` 命令不是 GNU 提供的，所以有一些选项可能不一样。本文中我尽量对 GNU 和 BSD 两者的实现都进行说明。

### 按字母顺序排列行

`sort` 命令默认会读取文件每行的第一个字符并对每行按字母升序排序后输出。两行中的第一个字符相同的情况下，对下一个字符进行对比。例如：

```
$ cat distro.list
Slackware
Fedora
Red Hat Enterprise Linux
Ubuntu
Arch
1337
Mint
Mageia
Debian
$ sort distro.list
1337
Arch
Debian
Fedora
Mageia
Mint
Red Hat Enterprise Linux
Slackware
Ubuntu
```

使用 `sort` 不会改变原文件。`sort` 仅起到过滤的作用，所以如果你希望按排序后的格式保存数据，你需要用 `>` 或 `tee` 进行重定向。


```
$ sort distro.list | tee distro.sorted
1337
Arch
Debian
[...]
$ cat distro.sorted
1337
Arch
Debian
[...]
```

### 按列排序

复杂数据集有时候不止需要对每行的第一个字符进行排序。例如，假设有一个动物列表，每个都有其种和属，用可预见的分隔符分隔每一个“字段”（即数据表中的“单元格”）。这类由数据表导出的格式很常见，CSV（<ryby>以逗号分隔的数据<rt>comma-separated values</rt></ruby>）后缀可以标识这些文件（虽然 CSV 文件不一定用逗号分隔，有分隔符的文件也不一定用 CSV 后缀）。以下数据作为示例：

```
Aptenodytes;forsteri;Miller,JF;1778;Emperor
Pygoscelis;papua;Wagler;1832;Gentoo
Eudyptula;minor;Bonaparte;1867;Little Blue
Spheniscus;demersus;Brisson;1760;African
Megadyptes;antipodes;Milne-Edwards;1880;Yellow-eyed
Eudyptes;chrysocome;Viellot;1816;Southern Rockhopper
Torvaldis;linux;Ewing,L;1996;Tux
```

对于这组示例数据，你可以用 `--field-separator` （在 BSD 和 Mac 用 `-t`，在 GNU 上也可以用简写 `-t` ）设置分隔符为分号（因为该示例数据中是用分号而不是逗号，理论上分隔符可以是任意字符），用 `--key`（在 BSD 和 Mac 上用 `-k`，在 GNU 上也可以用简写 `-k`）选项指定哪个字段被排序。例如，对每行第二个字段进行排序（计数以 1 开头而不是 0）：

```
sort --field-separator=";" --key=2
Megadyptes;antipodes;Milne-Edwards;1880;Yellow-eyed
Eudyptes;chrysocome;Viellot;1816;Sothern Rockhopper
Spheniscus;demersus;Brisson;1760;African
Aptenodytes;forsteri;Miller,JF;1778;Emperor
Torvaldis;linux;Ewing,L;1996;Tux
Eudyptula;minor;Bonaparte;1867;Little Blue
Pygoscelis;papua;Wagler;1832;Gentoo
```

结果有点不容易读，但是 Unix 以构造命令的管道方式而闻名，所以你可以使用 `column` 命令美化输出结果。使用 GNU `column`：

```
$ sort --field-separator=";" \
\--key=2 penguins.list | column --table --separator ";"
Megadyptes   antipodes   Milne-Edwards  1880  Yellow-eyed
Eudyptes     chrysocome  Viellot        1816  Southern Rockhopper
Spheniscus   demersus    Brisson        1760  African
Aptenodytes  forsteri    Miller,JF      1778  Emperor
Torvaldis    linux       Ewing,L        1996  Tux
Eudyptula    minor       Bonaparte      1867  Little Blue
Pygoscelis   papua       Wagler         1832  Gentoo
```

对于初学者可能有点不好理解（但是写起来简单），BSD 和 Mac 上的命令选项：

```
$ sort -t ";" \
-k2 penguins.list | column -t -s ";"
Megadyptes   antipodes   Milne-Edwards  1880  Yellow-eyed
Eudyptes     chrysocome  Viellot        1816  Southern Rockhopper
Spheniscus   demersus    Brisson        1760  African
Aptenodytes  forsteri    Miller,JF      1778  Emperor
Torvaldis    linux       Ewing,L        1996  Tux
Eudyptula    minor       Bonaparte      1867  Little Blue
Pygoscelis   papua       Wagler         1832  Gentoo
```

当然 `-k` 不一定非要设为 `2`。任意存在的字段都可以被设为排序的键。

### 逆序排列

你可以用 `--reverse`（BSD/Mac 上用 `-r`，GNU 上也可以用简写 `-r`）选项来颠倒已经排好序的列表。

```
$ sort --reverse alphabet.list
z
y
x
w
[...]
```

你也可以把输出结果通过管道传给命令 [tac][4] 来实现相同的效果。

### 按月排序（仅 GNU 支持）

理想情况下，所有人都按照 ISO 8601 标准来写日期：年、月、日。这是一种合乎逻辑的指定精确日期的方法，也可以很容易地被计算机理解。也有很多情况下，人类用其他的方式标注日期，包括用很名字随意的月份。

幸运的是，GNU `sort` 命令能识别这种写法，并可以按月份的名称正确排序。使用 `--month-sort`（`-M`）选项：

```
$ cat month.list
November
October
September
April
[...]
$ sort --month-sort month.list
January
February
March
April
May
[...]
November
December
```

月份的全称和简写都可以被识别。

### 人类可读的数字排序（仅 GNU 支持）

另一个人类和计算机的常见混淆点是数字的组合。例如，人类通常把 “1024 kilobytes” 写成 “1KB”，因为人类解析 “1 KB” 比 “1024” 要容易且更快（数字越大，这种差异越明显）。对于计算机来说，一个 9 KB 的字符串要比诸如 1 MB 的字符串大（尽管 9 KB 是 1 MB 很小一部分）。GNU `sort` 命令提供了`--human-numeric-sort`（`-h`）选项来帮助正确解析这些值。

```
$ cat sizes.list
2M
12MB
1k
9k
900
7000
$ sort --human-numeric-sort
900
7000
1k
9k
2M
12MB
```

有一些情况例外。例如，“16000 bytes” 比 “1 KB” 大，但是 `sort` 识别不了。

```
$ cat sizes0.list
2M
12MB
16000
1k
$ sort -h sizes0.list
16000
1k
2M
12MB
```

逻辑上来说，这个示例中 16000 应该写成 16 KB，所以也不应该全部归咎于GNU `sort`。只要你确保数字的一致性，`--human-numeric-sort` 可以用一种计算机友好的方式解析成人类可读的数字。

### 随机排序（仅 GNU 支持）

有时候工具也提供了一些与设计初衷相悖的选项。某种程度上说，`sort` 命令提供对一个文件进行随机排序的能力没有任何意义。这个命令的工作流让这个特性变得很方便。你*可以*用其他的命令，像 [shuf][5] ，或者你可以用现在的命令添加一个选项。不管你认为它是一个臃肿的还是极具创造力的用户体验设计，GNU `sort` 命令提供了对文件进行随机排序的功能。

最纯粹的随机排序格式选项是 `--random-sort` 或 `-R`（不要跟 `-r` 混淆，`-r` 是 `--reverse` 的简写）。

```
$ sort --random-sort alphabet.list
d
m
p
a
[...]
```

每次对文件运行随机排序都会有不同的结果。

### 结语

GNU 和 BSD 的 `sort` 命令还有很多功能，所以花点时间去了解这些选项。你会惊异于 `sort` 的灵活性，尤其是当它和其他的 Unix 工具一起使用时。

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/10/get-sorted-sort

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[lxbwolf](https://github.com/lxbwolf)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/code_computer_laptop_hack_work.png?itok=aSpcWkcl "Coding on a computer"
[2]: https://en.wikipedia.org/wiki/Sort_(Unix)
[3]: https://en.wikipedia.org/wiki/POSIX
[4]: https://opensource.com/article/19/9/tac-command
[5]: https://www.gnu.org/software/coreutils/manual/html_node/shuf-invocation.html

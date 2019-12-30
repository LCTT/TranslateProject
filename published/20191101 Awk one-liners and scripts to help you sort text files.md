[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11684-1.html)
[#]: subject: (Awk one-liners and scripts to help you sort text files)
[#]: via: (https://opensource.com/article/19/11/how-sort-awk)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

帮助你排序文本文件的 Awk 命令行或脚本
======

> Awk 是一个强大的工具，可以执行某些可能由其它常见实用程序（包括 `sort`）来完成的任务。

![](https://img.linux.net.cn/data/attachment/album/201912/17/095222q7m5da4h8facvmtv.jpg)

Awk 是个普遍存在的 Unix 命令，用于扫描和处理包含可预测模式的文本。但是，由于它具有函数功能，因此也可以合理地称之为编程语言。

令人困惑的是，有不止一个 awk。（或者，如果你认为只有一个，那么其它几个就是克隆。）有 `awk`（由Aho、Weinberger 和 Kernighan 编写的原始程序），然后有 `nawk` 、`mawk` 和 GNU 版本的 `gawk`。GNU 版本的 awk 是该实用程序的一个高度可移植的自由软件版本，具有几个独特的功能，因此本文是关于 GNU awk 的。

虽然它的正式名称是 `gawk`，但在 GNU+Linux 系统上，它的别名是 `awk`，并用作该命令的默认版本。 在其他没有带有 GNU awk 的系统上，你必须先安装它并将其称为 `gawk`，而不是 `awk`。本文互换使用术语 `awk` 和 `gawk`。

`awk` 既是命令语言又是编程语言，这使其成为一个强大的工具，可以处理原本留给 `sort`、`cut`、`uniq` 和其他常见实用程序的任务。幸运的是，开源中有很多冗余空间，因此，如果你面临是否使用 `awk` 的问题，答案可能是肯定的“随便”。

`awk` 的灵活之美在于，如果你已经确定使用 `awk` 来完成一项任务，那么无论接下来发生什么，你都可以继续使用 `awk`。这包括对数据排序而不是按交付给你的顺序的永恒需求。

### 样本数据集

在探索 `awk` 的排序方法之前，请生成要使用的样本数据集。保持简单，这样你就不会为极端情况和意想不到的复杂性所困扰。这是本文使用的样本集：

```
Aptenodytes;forsteri;Miller,JF;1778;Emperor
Pygoscelis;papua;Wagler;1832;Gentoo
Eudyptula;minor;Bonaparte;1867;Little Blue
Spheniscus;demersus;Brisson;1760;African
Megadyptes;antipodes;Milne-Edwards;1880;Yellow-eyed
Eudyptes;chrysocome;Viellot;1816;Sothern Rockhopper
Torvaldis;linux;Ewing,L;1996;Tux
```

这是一个很小的数据集，但它提供了多种数据类型：

* 属名和种名，彼此相关但又是分开的
* 姓，有时是以逗号开头的首字母缩写
* 代表日期的整数
* 任意术语
* 所有字段均以分号分隔

根据你的教育背景，你可能会认为这是二维数组或表格，或者只是行分隔的数据集合。你如何看待它只是你的问题，而 `awk` 只认识文本。由你决定告诉 `awk` 你想如何解析它。

### 只想排序

如果你只想按特定的可定义字段（例如电子表格中的“单元格”）对文本数据集进行排序，则可以使用 [sort 命令][2]。

### 字段和记录

无论输入的格式如何，都必须在其中找到模式才可以专注于对你重要的数据部分。在此示例中，数据由两个因素定界：行和字段。每行都代表一个新的*记录*，就如你在电子表格或数据库转储中看到的一样。在每一行中，都有用分号（`;`）分隔的不同的*字段*（将其视为电子表格中的单元格）。

`awk` 一次只处理一条记录，因此，当你在构造发给 `awk` 的这指令时，你可以只关注一行记录。写下你想对一行数据执行的操作，然后在下一行进行测试（无论是心理上还是用 `awk` 进行测试），然后再进行其它的一些测试。最后，你要对你的 `awk` 脚本要处理的数据做好假设，以便可以按你要的数据结构提供给你数据。

在这个例子中，很容易看到每个字段都用分号隔开。为简单起见，假设你要按每行的第一字段对列表进行排序。

在进行排序之前，你必须能够让 `awk` 只关注在每行的第一个字段上，因此这是第一步。终端中 awk 命令的语法为 `awk`，后跟相关选项，最后是要处理的数据文件。

```
$ awk --field-separator=";" '{print $1;}' penguins.list
Aptenodytes
Pygoscelis
Eudyptula
Spheniscus
Megadyptes
Eudyptes
Torvaldis
```

因为字段分隔符是对 Bash shell 具有特殊含义的字符，所以必须将分号括在引号中或在其前面加上反斜杠。此命令仅用于证明你可以专注于特定字段。你可以使用另一个字段的编号尝试相同的命令，以查看数据的另一个“列”的内容：

```
$ awk --field-separator=";" '{print $3;}' penguins.list
Miller,JF
Wagler
Bonaparte
Brisson
Milne-Edwards
Viellot
Ewing,L
```

我们尚未进行任何排序，但这是良好的基础。

### 脚本编程

`awk` 不仅仅是命令，它是一种具有索引、数组和函数的编程语言。这很重要，因为这意味着你可以获取要排序的字段列表，将列表存储在内存中，进行处理，然后打印结果数据。对于诸如此类的一系列复杂操作，在文本文件中进行操作会更容易，因此请创建一个名为 `sort.awk` 的新文件并输入以下文本：

```
#!/bin/gawk -f

BEGIN {
        FS=";";
}
```

这会将该文件建立为 `awk` 脚本，该脚本中包含执行的行。

`BEGIN` 语句是 `awk` 提供的特殊设置功能，用于只需要执行一次的任务。定义内置变量 `FS`，它代表<ruby>字段分隔符<rt>field separator</rt></ruby>，并且与你在 `awk` 命令中使用 `--field-separator` 设置的值相同，它只需执行一次，因此它包含在 `BEGIN` 语句中。

#### awk 中的数组

你已经知道如何通过使用 `$` 符号和字段编号来收集特定字段的值，但是在这种情况下，你需要将其存储在数组中而不是将其打印到终端。这是通过 `awk` 数组完成的。`awk` 数组的重要之处在于它包含键和值。 想象一下有关本文的内容；它看起来像这样：`author:"seth",title:"How to sort with awk",length:1200`。诸如作者、标题和长度之类的元素是键，跟着的内容为值。

在排序的上下文中这样做的好处是，你可以将任何字段分配为键，将任何记录分配为值，然后使用内置的 `awk` 函数 `asorti()`（按索引排序）按键进行排序。现在，随便假设你*只*想按第二个字段排序。

*没有*被特殊关键字 `BEGIN` 或 `END` 引起来的 `awk` 语句是在每个记录都要执行的循环。这是脚本的一部分，该脚本扫描数据中的模式并进行相应的处理。每次 `awk` 将注意力转移到一条记录上时，都会执行 `{}` 中的语句（除非以 `BEGIN` 或 `END` 开头）。

要将键和值添加到数组，请创建一个包含数组的变量（在本示例脚本中，我将其称为 `ARRAY`，虽然不是很原汁原味，但很清楚），然后在方括号中分配给它键，用等号（`=`）连接值。

```
{   # dump each field into an array
    ARRAY[$2] = $R;
}
```

在此语句中，第二个字段的内容（`$2`）用作关键字，而当前记录（`$R`）用作值。

### asorti() 函数

除了数组之外，`awk` 还具有一些基本函数，你可以将它们用作常见任务的快速简便的解决方案。GNU awk中引入的函数之一 `asorti()` 提供了按键（*索引*）或值对数组进行排序的功能。

你只能在对数组进行填充后对其进行排序，这意味着此操作不能对每个新记录都触发，而只能在脚本的最后阶段进行。为此，`awk` 提供了特殊的 `END` 关键字。与 `BEGIN` 相反，`END` 语句仅在扫描了所有记录之后才触发一次。

将这些添加到你的脚本：

```
END {
    asorti(ARRAY,SARRAY);
    # get length
    j = length(SARRAY);
   
    for (i = 1; i &lt;= j; i++) {
        printf("%s %s\n", SARRAY[i],ARRAY[SARRAY[i]])
    }
}
```

`asorti()` 函数获取 `ARRAY` 的内容，按索引对其进行排序，然后将结果放入名为 `SARRAY` 的新数组（我在本文中发明的任意名称，表示“排序的 ARRAY”）。

接下来，将变量 `j`（另一个任意名称）分配给 `length()` 函数的结果，该函数计算 `SARRAY` 中的项数。

最后，使用 `for` 循环使用 `printf()` 函数遍历 `SARRAY` 中的每一项，以打印每个键，然后在 `ARRAY` 中打印该键的相应值。

### 运行该脚本

要运行你的 `awk` 脚本，先使其可执行：

```
$ chmod +x sorter.awk
```

然后针对 `penguin.list` 示例数据运行它：

```
$ ./sorter.awk penguins.list
antipodes Megadyptes;antipodes;Milne-Edwards;1880;Yellow-eyed
chrysocome Eudyptes;chrysocome;Viellot;1816;Sothern Rockhopper
demersus Spheniscus;demersus;Brisson;1760;African
forsteri Aptenodytes;forsteri;Miller,JF;1778;Emperor
linux Torvaldis;linux;Ewing,L;1996;Tux
minor Eudyptula;minor;Bonaparte;1867;Little Blue
papua Pygoscelis;papua;Wagler;1832;Gentoo
```

如你所见，数据按第二个字段排序。

这有点限制。最好可以在运行时灵活选择要用作排序键的字段，以便可以在任何数据集上使用此脚本并获得有意义的结果。

### 添加命令选项

你可以通过在脚本中使用字面值 `var` 将命令变量添加到 `awk` 脚本中。更改脚本，以使迭代子句在创建数组时使用 `var`：

```
{ # dump each field into an array
    ARRAY[$var] = $R;
}
```

尝试运行该脚本，以便在执行脚本时使用 `-v var` 选项将其按第三字段排序：

```
$ ./sorter.awk -v var=3 penguins.list
Bonaparte Eudyptula;minor;Bonaparte;1867;Little Blue
Brisson Spheniscus;demersus;Brisson;1760;African
Ewing,L Torvaldis;linux;Ewing,L;1996;Tux
Miller,JF Aptenodytes;forsteri;Miller,JF;1778;Emperor
Milne-Edwards Megadyptes;antipodes;Milne-Edwards;1880;Yellow-eyed
Viellot Eudyptes;chrysocome;Viellot;1816;Sothern Rockhopper
Wagler Pygoscelis;papua;Wagler;1832;Gentoo
```

### 修正

本文演示了如何在纯 GNU awk 中对数据进行排序。你可以对脚本进行改进，以便对你有用，花一些时间在`gawk` 的手册页上研究 [awk 函数][3]并自定义脚本以获得更好的输出。

这是到目前为止的完整脚本：

```
#!/usr/bin/awk -f
# GPLv3 appears here
# usage: ./sorter.awk -v var=NUM FILE

BEGIN { FS=";"; }

{ # dump each field into an array
    ARRAY[$var] = $R;
}

END {
    asorti(ARRAY,SARRAY);
    # get length
    j = length(SARRAY);
   
    for (i = 1; i &lt;= j; i++) {
        printf("%s %s\n", SARRAY[i],ARRAY[SARRAY[i]])
    }
}
```

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/11/how-sort-awk

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/metrics_lead-steps-measure.png?itok=DG7rFZPk (Green graph of measurements)
[2]: https://opensource.com/article/19/10/get-sorted-sort
[3]: https://www.gnu.org/software/gawk/manual/html_node/Built_002din.html#Built_002din

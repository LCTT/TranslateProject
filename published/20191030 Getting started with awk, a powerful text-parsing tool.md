[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11543-1.html)
[#]: subject: (Getting started with awk, a powerful text-parsing tool)
[#]: via: (https://opensource.com/article/19/10/intro-awk)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

awk 入门 —— 强大的文本分析工具
======

> 让我们开始使用它。

![](https://img.linux.net.cn/data/attachment/album/201911/06/114421e006e9mbh0xxe8bb.jpg)

`awk` 是用于 Unix 和类 Unix 系统的强大文本解析工具，但是由于它有可编程函数，因此你可以用它来执行常规解析任务，因此它也被视为一种编程语言。你可能不会使用 `awk` 开发下一个 GUI 应用，并且它可能不会代替你的默认脚本语言，但是它是用于特定任务的强大程序。

这些任务或许是惊人的多样化。了解 `awk` 可以解决你的哪些问题的最好方法是学习 `awk`。你会惊讶于 `awk` 如何帮助你完成更多工作，却花费更少的精力。

`awk` 的基本语法是：

```
awk [options] 'pattern {action}' file
```

首先，创建此示例文件并将其保存为 `colours.txt`。

```
name       color  amount
apple      red    4
banana     yellow 6
strawberry red    3
grape      purple 10
apple      green  8
plum       purple 2
kiwi       brown  4
potato     brown  9
pineapple  yellow 5
```

数据被一个或多个空格分隔为列。以某种方式组织要分析的数据是很常见的。它不一定总是由空格分隔的列，甚至可以不是逗号或分号，但尤其是在日志文件或数据转储中，通常有一个可预测的格式。你可以使用数据格式来帮助 `awk` 提取和处理你关注的数据。

### 打印列

在 `awk` 中，`print` 函数显示你指定的内容。你可以使用许多预定义的变量，但是最常见的是文本文件中以整数命名的列。试试看：

```
$ awk '{print $2;}' colours.txt
color
red
yellow
red
purple
green
purple
brown
brown
yellow
```

在这里，`awk` 显示第二列，用 `$2` 表示。这是相对直观的，因此你可能会猜测 `print $1` 显示第一列，而 `print $3` 显示第三列，依此类推。

要显示*全部*列，请使用 `$0`。

美元符号（`$`）后的数字是*表达式*，因此 `$2` 和 `$(1+1)` 是同一意思。

### 有条件地选择列

你使用的示例文件非常结构化。它有一行充当标题，并且各列直接相互关联。通过定义*条件*，你可以限定 `awk` 在找到此数据时返回的内容。例如，要查看第二列中与 `yellow` 匹配的项并打印第一列的内容：

```
awk '$2=="yellow"{print $1}' file1.txt
banana
pineapple
```

正则表达式也可以工作。此表达式近似匹配 `$2` 中以 `p` 开头跟上任意数量（一个或多个）字符后继续跟上 `p` 的值：

```
$ awk '$2 ~ /p.+p/ {print $0}' colours.txt
grape   purple  10
plum    purple  2
```

数字能被 `awk` 自然解释。例如，要打印第三列包含大于 5 的整数的行：

```
awk '$3&gt;5 {print $1, $2}' colours.txt
name    color
banana  yellow
grape   purple
apple   green
potato  brown
```

### 字段分隔符

默认情况下，`awk` 使用空格作为字段分隔符。但是，并非所有文本文件都使用空格来定义字段。例如，用以下内容创建一个名为 `colours.csv` 的文件：

```
name,color,amount
apple,red,4
banana,yellow,6
strawberry,red,3
grape,purple,10
apple,green,8
plum,purple,2
kiwi,brown,4
potato,brown,9
pineapple,yellow,5
```

只要你指定将哪个字符用作命令中的字段分隔符，`awk` 就能以完全相同的方式处理数据。使用 `--field-separator`（或简称为 `-F`）选项来定义分隔符：

```
$ awk -F"," '$2=="yellow" {print $1}' file1.csv
banana
pineapple
```

### 保存输出

使用输出重定向，你可以将结果写入文件。例如：

```
$ awk -F, '$3>5 {print $1, $2} colours.csv > output.txt
```

这将创建一个包含 `awk` 查询内容的文件。

你还可以将文件拆分为按列数据分组的多个文件。例如，如果要根据每行显示的颜色将 `colours.txt` 拆分为多个文件，你可以在 `awk` 中包含重定向语句来重定向*每条查询*：

```
$ awk '{print > $2".txt"}' colours.txt
```

这将生成名为 `yellow.txt`、`red.txt` 等文件。

在下一篇文章中，你将了解有关字段，记录和一些强大的 awk 变量的更多信息。

本文改编自社区技术播客 [Hacker Public Radio][2]。

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/10/intro-awk

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/programming-code-keyboard-laptop-music-headphones.png?itok=EQZ2WKzy (Woman programming)
[2]: http://hackerpublicradio.org/eps.php?id=2114

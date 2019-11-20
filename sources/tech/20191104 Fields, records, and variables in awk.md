[#]: collector: (lujun9972)
[#]: translator: (liwenwensnow)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Fields, records, and variables in awk)
[#]: via: (https://opensource.com/article/19/11/fields-records-variables-awk)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

Fields, records, and variables in awk    awk中字段，记录和变量
======
在我们这个系列的第二部分，我们会学习到字段，记录和一些非常有用的awk变量。
![Man at laptop on a mountain][1]

Awk 有好几个变种： 最早版本的 **awk**, 是1977 年 AT&amp;T Bell 实验室所创造的。还有一些重构版本，例如**mawk**, **nawk**。现在我们能在大多数Linux 发行版中见到的，是 GNU awk，也叫**gawk**。 在大多数 Linux 版本中，awk 和 gawk 都是指向 GNU awk 的链接。 如果输入awk命令，也是一样的效果。 在 [GNU awk 用户手册][2]中能看到 awk 和 gawk 的全部历史。

这一系列的[第一篇文章][3] 介绍了awk 命令的基本格式：

```
`$ awk [options] 'pattern {action}' inputfile`
```

Awk 是一个命令，后面要接选项 （比如用 **-F** 来定义字段分隔符）。  你想让awk 执行的部分需要写在 两个单引号之间，至少在终端中需要这么做。 在awk 命令中，为了进一步强调你想要执行的部分，可以用  **-e** 选项来突出显示 (但这不是必须的):


```
$ awk -F, -e '{print $2;}' colours.txt
yellow
blue
green
[...]
```

### Records and fields 记录和字段

Awk views its input data as a series of _records_, which are usually newline-delimited lines. In other words, awk generally sees each line in a text file as a new record. Each record contains a series of _fields_. A field is a component of a record delimited by a _field separator_.
Awk 将输入数据视为 一系列  _记录_ ， 通常来说是按行分割的。 换句话说，awk 通常将文本中的每一行视作一个记录。每一记录包含多个 _字段_. 一个字段是由   _字段分隔符_ 分隔出的，记录的一部分.

默认情况下，awk 将各种空白符，如空格，tab,换行符，视为分隔符。 值得注意的是，awk 将多个 _空格_  视为一个分隔符。所以下面这行文本有两个字段：


```
`raspberry red`
```

这行也是：


```
`tuxedo                  black`
```

其他分隔符，在程序中不是这么处理的。假设字段分隔符是逗号，如下所示的记录就分为三个字段。其中一个字段可能会只有0个字节长（假设这一字段中不包含隐藏字符）

```
`a,,b`
```

### awk 程序

awk 命令的 _程序部分_ 是由一系列规则组成的。通常来说，在程序中每个规则占一行(尽管这不是必须的)。 每个规则由一个模式，或者一个/多个动作组成：

```
`pattern { action }`
```

在一个规则中，你可以通过定义模式，来确定行动是否会在记录中执行。 模式可以是简单的比较条件，正则表达式，两者的结合或者更多。

这个例子中，程序 _只会_ 显示包含 单词 “raspberry” 的记录：


```
$ awk '/raspberry/ { print $0 }' colours.txt
raspberry red 99
```

如果没有文本符合模式，最终结果会对应所有记录。

并且，在一条规则只包含一个模式时，相当于在整个记录上执行 **{ print }** 命令。

Awk 程序本质上是 _数据驱动_ 的，命令执行结果取决于数据。所以，与其他编程语言中的程序相比，它还是有些区别的。

### NF 变量

每个字段都有指定变量，但针对字段和记录，也有一些特殊的变量。  **NF** 变量能存储awk在当前记录中找到的数字字段。可在屏幕上显示出变量内容，或将其用于测试。 下面例子中的数据，来自前一篇文章中的 [文本][3]：


```
$ awk '{ print $0 " (" NF ")" }' colours.txt
name       color  amount (3)
apple      red    4 (3)
banana     yellow 6 (3)
[...]
```

Awk 的 **print** 函数会接受一系列参数（可以是变量或者字符），并将它们拼接起来。这就是为什么在这一例子中，在每行结尾处，awk 会显示一个被括号括起来的整数。

### NR 变量

另外，为了计算每个记录中的字段数，awk 也计算输入记录。 记录数目被存储在变量 **NR** 中，它的使用方法和其他变量没有任何区别。例如，为了在每一行开头显示行号：

```
$ awk '{ print NR ": " $0 }' colours.txt
1: name       color  amount
2: apple      red    4
3: banana     yellow 6
4: raspberry  red    3
5: grape      purple 10
[...]
```

注意，在这个命令后输入数据时，可以不同于在 **print** 后，参数间可以不写空格，尽管这样会降低可读性：


```
`$ awk '{print NR": "$0}' colours.txt`
```

### printf() 函数

为了输出结果时格式更灵活，你可以使用 awk 的 **printf()** 函数。 它与C，Lua,Bash和其他语言中的 **printf** 相类似。 它也接受 _格式_ ，后用逗号分隔的参数。参数列表需要写在括号内。


```
`$ printf format, item1, item2, ...`
```

格式这一参数（也叫 _格式符_ ） 定义了其他参数会如何显示。 这一功能是用 _格式修饰符_ 来实现的。 用 **%s** 显示字符， **%d** 显示数字。 下面的**printf** 语句，会在括号内显示字段数量：

```
$ awk 'printf "%s (%d)\n",$0,NF}' colours.txt
name       color  amount (3)
raspberry  red    4 (3)
banana     yellow 6 (3)
[...]
```


在这个例子里， **%s (%d)** 提供了每一行的输出格式，**$0,NF** 定义了插入 **%s** 和 **%d** 位置的数据。注意，不像**print** 函数，在没有明确指令时下，输出不会转到下一行。 转义字符 **\n** 才会换行。

### Awk 脚本编程

这篇文章中出现的所有awk代码，都在Bash终端中执行过。 在更复杂的程序中，将你的命令放在文件（ _脚本_ ）中，这样会更容易。 **-f FILE** 选项（不要和 **-F** 弄混了，那个选项用于字段分隔符），可用于调用包含可执行程序的文件。

例如，这里有一个简单的awk 脚本。 创建一个名为 **example1.awk** 的文件，包含以下内容：


```
/^a/ {print "A: " $0}
/^b/ {print "B: " $0}
```

It's conventional to give such files the extension **.awk** to make it clear that they hold an awk program. This naming is not mandatory, but it gives file managers and editors (and you) a useful clue about what the file is.
如果一个文件包含 awk 程序，最好给这些文件 **.awk** 的扩展名。 

Run the script:


```
$ awk -f example1.awk colours.txt
A: raspberry  red    4
B: banana     yellow 6
A: apple      green  8
```

一个包含 awk 命令的文件，在最开头一行加上 **#!** ，就可以变成可执行脚本。 创建一个名为 **example2.awk** 的文件，包含以下内容：

```
#!/usr/bin/awk -f
#
# Print all but line 1 with the line number on the front
#

NR &gt; 1 {
    printf "%d: %s\n",NR,$0
}
```

Arguably, there's no advantage to having just one line in a script, but sometimes it's easier to execute a script than to remember and type even a single line. A script file also provides a good opportunity to document what a command does. Lines starting with the **#** symbol are comments, which awk ignores.

Grant the file executable permission:


```
`$ chmod u+x example2.awk`
```

Run the script:


```
$ ./example2.awk colours.txt
2: apple      red    4
2: banana     yellow 6
4: raspberry red    3
5: grape      purple 10
[...]
```

An advantage of placing your awk instructions in a script file is that it's easier to format and edit. While you can write awk on a single line in your terminal, it can get overwhelming when it spans several lines.

### Try it

You now know enough about how awk processes your instructions to be able to write a complex awk program. Try writing an awk script with more than one rule and at least one conditional pattern. If you want to try more functions than just **print** and **printf**, refer to [the gawk manual][4] online.

Here's an idea to get you started:


```
#!/usr/bin/awk -f
#
# Print each record EXCEPT
# IF the first record contains "raspberry",
# THEN replace "red" with "pi"

$1 == "raspberry" {
        gsub(/red/,"pi")
}

{ print }
```

Try this script to see what it does, and then try to write your own.

The next article in this series will introduce more functions for even more complex (and useful!) scripts.

* * *

_This article is adapted from an episode of [Hacker Public Radio][5], a community technology podcast._

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/11/fields-records-variables-awk

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/computer_laptop_code_programming_mountain_view.jpg?itok=yx5buqkr (Man at laptop on a mountain)
[2]: https://www.gnu.org/software/gawk/manual/html_node/History.html#History
[3]: https://opensource.com/article/19/10/intro-awk
[4]: https://www.gnu.org/software/gawk/manual/
[5]: http://hackerpublicradio.org/eps.php?id=2129

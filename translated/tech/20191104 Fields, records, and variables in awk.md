[#]: collector: (lujun9972)
[#]: translator: (liwenwensnow)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Fields, records, and variables in awk)
[#]: via: (https://opensource.com/article/19/11/fields-records-variables-awk)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

awk中的字段，记录和变量
======
这个系列的第二篇，我们会学习 字段，记录和一些非常有用的awk变量。
![Man at laptop on a mountain][1]

Awk 有好几个变种： 最早的 **awk**, 是1977 年 AT&amp;T Bell 实验室所创。它还有一些重构版本，例如 **mawk**, **nawk**。在大多数Linux 发行版中能见到的，是 GNU awk，也叫**gawk**。 在大多数 Linux 发行版中，awk 和 gawk 都是指向 GNU awk 的链接。 输入awk命令，也是同样的效果。 [GNU awk 用户手册][2]中，能看到 awk 和 gawk 的全部历史。

这一系列的[第一篇文章][3] 介绍了awk 命令的基本格式：

```
`$ awk [options] 'pattern {action}' inputfile`
```

Awk 是一个命令，后面要接选项 （比如用 **-F** 来定义字段分隔符）。  想让awk 执行的部分需要写在 两个单引号之间，至少在终端中需要这么做。 在awk 命令中，为了进一步强调你想要执行的部分，可以用  **-e** 选项来突出显示 (但这不是必须的):


```
$ awk -F, -e '{print $2;}' colours.txt
yellow
blue
green
[...]
```

### 记录和字段

Awk 将输入数据视为 一系列  _记录_ ， 通常是按行分割的。 换句话说，awk 将文本中的每一行视作一个记录。每一记录包含多个 _字段_. 一个字段由   _字段分隔符_ 分隔开来，字段是记录的一部分.

默认情况下，awk 将各种空白符，如空格，tab,换行符等视为分隔符。 值得注意的是，在awk 中，多个 _空格_ 将被视为一个分隔符。所以下面这行文本有两个字段：


```
`raspberry red`
```

这行也是：


```
`tuxedo                  black`
```

其他分隔符，在程序中不是这么处理的。假设字段分隔符是逗号，如下所示的记录，就有三个字段。其中一个字段可能会是0个字节（假设这一字段中不包含隐藏字符）

```
`a,,b`
```

### awk 程序

awk 命令的 _程序部分_ 是由一系列规则组成的。通常来说，程序中每个规则占一行(尽管这不是必须的)。 每个规则由一个模式，或一个/多个动作组成：

```
`pattern { action }`
```

在一个规则中，你可以通过定义模式，来确定行动是否会在记录中执行。 模式可以是简单的比较条件，正则表达式，甚至两者结合等等。

这个例子中，程序 _只会_ 显示包含 单词 “raspberry” 的记录：


```
$ awk '/raspberry/ { print $0 }' colours.txt
raspberry red 99
```

如果没有文本符合模式，最终结果会对应所有记录。

并且，在一条规则只包含一个模式时，相当于对整个记录执行 **{ print }** 。

Awk 程序本质上是 _数据驱动_ 的，命令执行结果取决于数据。所以，与其他编程语言中的程序相比，它还是有些区别的。

### NF 变量

每个字段都有指定变量，但针对字段和记录，也存在一些特殊变量。  **NF** 变量，能存储awk在当前记录中找到的数字字段。其内容可在屏幕上显示，也可用于测试。 下面例子中的数据，来自上篇文章[文本][3]：


```
$ awk '{ print $0 " (" NF ")" }' colours.txt
name       color  amount (3)
apple      red    4 (3)
banana     yellow 6 (3)
[...]
```

Awk 的 **print** 函数会接受一系列参数（可以是变量或者字符），并将它们拼接起来。这就是为什么在这个例子里，每行结尾处，awk 会显示一个被括号括起来的整数。

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

注意，在这个命令下输入数据时，可以不遵循在 **print** 后的规则，参数间可以不写空格，尽管这样会降低可读性：


```
`$ awk '{print NR": "$0}' colours.txt`
```

### printf() 函数

为了输出结果时格式更灵活，你可以使用 awk 的 **printf()** 函数。 它与C，Lua,Bash和其他语言中的 **printf** 相类似。 它也接受  _格式_ ，加逗号分隔的参数。参数列表需要写在括号里。


```
`$ printf format, item1, item2, ...`
```

格式这一参数（也叫 _格式符_ ） 定义了其他参数如何显示。 这一功能是用 _格式修饰符_ 来实现的。  **%s** 显示字符， **%d** 显示数字。 下面的**printf** 语句，会在括号内显示字段数量：

```
$ awk 'printf "%s (%d)\n",$0,NF}' colours.txt
name       color  amount (3)
raspberry  red    4 (3)
banana     yellow 6 (3)
[...]
```


在这个例子里， **%s (%d)** 确定了每一行的输出格式，**$0,NF** 定义了插入 **%s** 和 **%d** 位置的数据。注意，和**print** 函数不同，在没有明确指令时，输出不会转到下一行。出现 转义字符 **\n** 时才会换行。

### Awk 脚本编程

这篇文章中出现的所有awk代码，都在Bash终端中执行过。 面对更复杂的程序，将命令放在文件（ _脚本_ ）中会更容易。 **-f FILE** 选项（不要和 **-F** 弄混了，那个选项用于字段分隔符），可用于指明包含可执行程序的文件。

举个例子，下面是一个简单的awk 脚本。 创建一个名为 **example1.awk** 的文件，包含以下内容：


```
/^a/ {print "A: " $0}
/^b/ {print "B: " $0}
```

如果一个文件包含 awk 程序，那么在给文件命名时，最好写上 **.awk** 的扩展名。 这样命名不是强制的，但这么做，会给文件管理器，编辑者（和你）一个关于文件内容的，很有用的提示。

执行这一脚本：


```
$ awk -f example1.awk colours.txt
A: raspberry  red    4
B: banana     yellow 6
A: apple      green  8
```

一个包含 awk 命令的文件，在最开头一行加上 **#!** ，就能变成可执行脚本。 创建一个名为 **example2.awk** 的文件，包含以下内容：

```
#!/usr/bin/awk -f
#
# 除了第一行，在其他行前显示行号
#

NR &gt; 1 {
    printf "%d: %s\n",NR,$0
}
```

可以说，脚本中只有一行，大多数情况下没什么用。 但在某些情况下，执行一个脚本，比记住，然后打一条命令要容易的多。 一个脚本文件，也提供了一个记录命令具体作用的好机会。 以  **#** 号开头的行是注释，awk 会忽略它们。

给文件可执行权限：


```
`$ chmod u+x example2.awk`
```

执行脚本：


```
$ ./example2.awk colours.txt
2: apple      red    4
2: banana     yellow 6
4: raspberry red    3
5: grape      purple 10
[...]
```


将awk 命令放在脚本文件中，有一个好处就是，修改和格式化输出会更容易。在终端中，如果能用一行执行多条awk命令，那么输入多行，才能达到同样效果，就显得有些多余了。

### 试一试

你现在已经足够了解， awk 是如何执行指令的了。现在你应该能编写复杂的awk 程序了。 试着编写一个awk 脚本，它需要: 至少包括一个条件模式，以及多个规则。如果你想使用除 **print** 和 **printf** 以外的函数，可以参考在线[ gawk 手册][4] .


下面这个例子是个很好的切入点：


```
#!/usr/bin/awk -f
#
#  显示所有记录 除了出现以下情况
#  如果第一个记录 包含 “raspberry”
#  将 “red” 替换成 “pi”

$1 == "raspberry" {
        gsub(/red/,"pi")
}

{ print }
```

试着执行这个脚本，看看输出是什么。接下来就看你自己的了。


这一系列的下一篇文章，将会介绍更多，能在更复杂(更有用!) 脚本中使用的函数。

* * *

_这篇文章改编自 [Hacker Public Radio][5] 系列,一个技术社区博客_

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

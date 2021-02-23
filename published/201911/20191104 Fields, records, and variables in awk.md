[#]: collector: (lujun9972)
[#]: translator: (wenwensnow)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11611-1.html)
[#]: subject: (Fields, records, and variables in awk)
[#]: via: (https://opensource.com/article/19/11/fields-records-variables-awk)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

awk 中的字段、记录和变量
======

> 这个系列的第二篇，我们会学习字段，记录和一些非常有用的 Awk 变量。

![](https://img.linux.net.cn/data/attachment/album/201911/25/090333m34qx395vwtxx5vx.jpg)

Awk 有好几个变种：最早的 `awk`，是 1977 年 AT&T 贝尔实验室所创。它还有一些重构版本，例如 `mawk`、`nawk`。在大多数 Linux 发行版中能见到的，是 GNU awk，也叫 `gawk`。在大多数 Linux 发行版中，`awk` 和 `gawk` 都是指向 GNU awk 的软链接。输入 `awk`，调用的是同一个命令。[GNU awk 用户手册][2]中，能看到 `awk` 和 `gawk` 的全部历史。

这一系列的[第一篇文章][3] 介绍了 `awk` 命令的基本格式：

```
$ awk [选项] '模式 {动作}' 输入文件
```

`awk` 是一个命令，后面要接选项 （比如用 `-F` 来定义字段分隔符）。想让 `awk` 执行的部分需要写在两个单引号之间，至少在终端中需要这么做。在 `awk` 命令中，为了进一步强调你想要执行的部分，可以用 `-e` 选项来突出显示（但这不是必须的）：

```
$ awk -F, -e '{print $2;}' colours.txt
yellow
blue
green
[...]
```

### 记录和字段

`awk` 将输入数据视为一系列*记录*，通常是按行分割的。换句话说，`awk` 将文本中的每一行视作一个记录。每一记录包含多个*字段*。一个字段由*字段分隔符*分隔开来，字段是记录的一部分。

默认情况下，`awk` 将各种空白符，如空格、制表符、换行符等视为分隔符。值得注意的是，在 `awk` 中，多个*空格*将被视为一个分隔符。所以下面这行文本有两个字段：

```
raspberry red
```

这行也是：


```
tuxedo                  black
```

其他分隔符，在程序中不是这么处理的。假设字段分隔符是逗号，如下所示的记录，就有三个字段。其中一个字段可能会是 0 个字节（假设这一字段中不包含隐藏字符）

```
a,,b
```

### awk 程序

`awk` 命令的*程序部分*是由一系列规则组成的。通常来说，程序中每个规则占一行（尽管这不是必须的）。每个规则由一个模式，或一个或多个动作组成：

```
模式 { 动作 }
```

在一个规则中，你可以通过定义模式，来确定动作是否会在记录中执行。模式可以是简单的比较条件、正则表达式，甚至两者结合等等。

这个例子中，程序*只会*显示包含单词 “raspberry” 的记录：

```
$ awk '/raspberry/ { print $0 }' colours.txt
raspberry red 99
```

如果没有文本符合模式，该动作将会应用到所有记录上。

并且，在一条规则只包含模式时，相当于对整个记录执行 `{ print }`，全部打印出来。

Awk 程序本质上是*数据驱动*的，命令执行结果取决于数据。所以，与其他编程语言中的程序相比，它还是有些区别的。

### NF 变量

每个字段都有指定变量，但针对字段和记录，也存在一些特殊变量。`NF` 变量，能存储 `awk` 在当前记录中找到的字段数量。其内容可在屏幕上显示，也可用于测试。下面例子中的数据，来自上篇文章[文本][3]：

```
$ awk '{ print $0 " (" NF ")" }' colours.txt
name       color  amount (3)
apple      red    4 (3)
banana     yellow 6 (3)
[...]
```

`awk` 的 `print` 函数会接受一系列参数（可以是变量或者字符串），并将它们拼接起来。这就是为什么在这个例子里，每行结尾处，`awk` 会以一个被括号括起来的整数表示字段数量。

### NR 变量

另外，除了统计每个记录中的字段数，`awk` 也统计输入记录数。记录数被存储在变量 `NR` 中，它的使用方法和其他变量没有任何区别。例如，为了在每一行开头显示行号：

```
$ awk '{ print NR ": " $0 }' colours.txt
1: name       color  amount
2: apple      red    4
3: banana     yellow 6
4: raspberry  red    3
5: grape      purple 10
[...]
```

注意，写这个命令时可以不在 `print` 后的多个参数间添加空格，尽管这样会降低可读性：

```
$ awk '{print NR": "$0}' colours.txt
```

### printf() 函数

为了让输出结果时格式更灵活，你可以使用 `awk` 的 `printf()` 函数。 它与 C、Lua、Bash 和其他语言中的 `printf` 相类似。它也接受以逗号分隔的*格式*参数。参数列表需要写在括号里。

```
$ printf 格式, 项目1, 项目2, ...
```

格式这一参数（也叫*格式符*）定义了其他参数如何显示。这一功能是用*格式修饰符*实现的。`%s` 输出字符，`%d` 输出十进制数字。下面的 `printf` 语句，会在括号内显示字段数量：

```
$ awk 'printf "%s (%d)\n",$0,NF}' colours.txt
name       color  amount (3)
raspberry  red    4 (3)
banana     yellow 6 (3)
[...]
```

在这个例子里，`%s (%d)` 确定了每一行的输出格式，`$0,NF` 定义了插入 `%s` 和 `%d` 位置的数据。注意，和 `print` 函数不同，在没有明确指令时，输出不会转到下一行。出现转义字符 `\n` 时才会换行。

### Awk 脚本编程

这篇文章中出现的所有 `awk` 代码，都在 Bash 终端中执行过。面对更复杂的程序，将命令放在文件（*脚本*）中会更容易。`-f FILE` 选项（不要和 `-F` 弄混了，那个选项用于字段分隔符），可用于指明包含可执行程序的文件。

举个例子，下面是一个简单的 awk 脚本。创建一个名为 `example1.awk` 的文件，包含以下内容：

```
/^a/ {print "A: " $0}
/^b/ {print "B: " $0}
```

如果一个文件包含 `awk` 程序，那么在给文件命名时，最好写上 `.awk` 的扩展名。 这样命名不是强制的，但这么做，会给文件管理器、编辑器（和你）一个关于文件内容的很有用的提示。

执行这一脚本：

```
$ awk -f example1.awk colours.txt
A: raspberry  red    4
B: banana     yellow 6
A: apple      green  8
```

一个包含 `awk` 命令的文件，在最开头一行加上释伴 `#!`，就能变成可执行脚本。创建一个名为 `example2.awk` 的文件，包含以下内容：

```
#!/usr/bin/awk -f
#
# 除了第一行，在其他行前显示行号
#

NR > 1 {
    printf "%d: %s\n",NR,$0
}
```

可以说，脚本中只有一行，大多数情况下没什么用。但在某些情况下，执行一个脚本，比记住，然后打一条命令要容易的多。一个脚本文件，也提供了一个记录命令具体作用的好机会。以 `#` 号开头的行是注释，`awk` 会忽略它们。

给文件可执行权限：

```
$ chmod u+x example2.awk
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

将 `awk` 命令放在脚本文件中，有一个好处就是，修改和格式化输出会更容易。在终端中，如果能用一行执行多条 `awk` 命令，那么输入多行，才能达到同样效果，就显得有些多余了。

### 试一试

你现在已经足够了解，`awk` 是如何执行指令的了。现在你应该能编写复杂的 `awk` 程序了。试着编写一个 awk 脚本，它需要: 至少包括一个条件模式，以及多个规则。如果你想使用除 `print` 和 `printf` 以外的函数，可以参考在线 [gawk 手册][4]。

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

这篇文章改编自 [Hacker Public Radio][5] 系列，一个技术社区博客。

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/11/fields-records-variables-awk

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[wenwensnow](https://github.com/wenwensnow)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/computer_laptop_code_programming_mountain_view.jpg?itok=yx5buqkr (Man at laptop on a mountain)
[2]: https://www.gnu.org/software/gawk/manual/html_node/History.html#History
[3]: https://linux.cn/article-11543-1.html
[4]: https://www.gnu.org/software/gawk/manual/
[5]: http://hackerpublicradio.org/eps.php?id=2129

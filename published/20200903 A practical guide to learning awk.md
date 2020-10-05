[#]: collector: (lujun9972)
[#]: translator: (HankChow)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12686-1.html)
[#]: subject: (A practical guide to learning awk)
[#]: via: (https://opensource.com/article/20/9/awk-ebook)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

awk 实用学习指南
======

> 下载我们的电子书，学习如何更好地使用 `awk`。

![](https://img.linux.net.cn/data/attachment/album/202010/05/100648zcubcpww627627nw.jpg)

在众多 [Linux][2] 命令中，`sed`、`awk` 和 `grep` 恐怕是其中最经典的三个命令了。它们引人注目或许是由于名字发音与众不同，也可能是它们无处不在，甚至是因为它们存在已久，但无论如何，如果要问哪些命令很有 Linux 风格，这三个命令是当之无愧的。其中 `sed` 和 `grep` 已经有很多简洁的标准用法了，但 `awk` 的使用难度却相对突出。

在日常使用中，通过 `sed` 实现字符串替换、通过 `grep` 实现过滤，这些都是司空见惯的操作了，但 `awk` 命令相对来说是用得比较少的。在我看来，可能的原因是大多数人都只使用 `sed` 或者 `grep` 的一些变化实现某些功能，例如：

```
$ sed -e 's/foo/bar/g' file.txt
$ grep foo file.txt
```

因此，尽管你可能会觉得 `sed` 和 `grep` 使用起来更加顺手，但实际上它们还有更多更强大的作用没有发挥出来。当然，我们没有必要在这两个命令上钻研得很深入，但我有时会好奇自己“学习”命令的方式。很多时候我会记住一整串命令“咒语”，而不会去了解其中的运作过程，这就让我产生了一种很熟悉命令的错觉，我可以随口说出某个命令的好几个选项参数，但这些参数具体有什么作用，以及它们的相关语法，我都并不明确。

这大概就是很多人对 `awk` 缺乏了解的原因了。

### 为使用而学习 awk

`awk` 并不深奥。它是一种相对基础的编程语言，因此你可以把它当成一门新的编程语言来学习：使用一些基本命令来熟悉语法、了解语言中的关键字并实现更复杂的功能，然后再多加练习就可以了。

### awk 是如何解析输入内容的

`awk` 的本质是将输入的内容看作是一个数组。当 `awk` 扫描一个文本文件时，会把每一行作为一条<ruby>记录<rt>record</rt></ruby>，每一条记录中又分割为多个<ruby>字段<rt>field</rt></ruby>。`awk` 记录了各条记录各个字段的信息，并通过内置变量 `NR`（记录数） 和 `NF`（字段数） 来调用相关信息。例如一下这个命令可以查看文件的行数：

```
$ awk 'END { print NR;}' example.txt
36
```

从上面的命令可以看出 `awk` 的基本语法，无论是一个单行命令还是一整个脚本，语法都是这样的：

```
模式或关键字 { 操作 }
```

在上面的例子中，`END` 是一个关键字而不是模式，与此类似的另一个关键字是 `BEGIN`。使用 `BEGIN` 或 `END` 可以让 `awk` 在解析内容前或解析内容后执行大括号中指定的操作。

你可以使用<ruby>模式<rt>pattern</rt></ruby>作为过滤器或限定符，这样 `awk` 只会对匹配模式的对应记录执行指定的操作。以下这个例子就是使用 `awk` 实现 `grep` 命令在文件中查找“Linux”字符串的功能：

```
$ awk '/Linux/ { print $0; }' os.txt
OS: CentOS Linux (10.1.1.8)
OS: CentOS Linux (10.1.1.9)
OS: Red Hat Enterprise Linux (RHEL) (10.1.1.11)
OS: Elementary Linux (10.1.2.4)
OS: Elementary Linux (10.1.2.5)
OS: Elementary Linux (10.1.2.6)
```

`awk` 会将文件中的每一行作为一条记录，将一条记录中的每个单词作为一个字段，默认情况下会以空格作为<ruby>字段分隔符<rt>field separator</rt></ruby>（`FS`）切割出记录中的字段。如果想要使用其它内容作为分隔符，可以使用 `--field-separator` 选项指定分隔符：

```
$ awk --field-separator ':' '/Linux/ { print $2; }' os.txt
 CentOS Linux (10.1.1.8)
 CentOS Linux (10.1.1.9)
 Red Hat Enterprise Linux (RHEL) (10.1.1.11)
 Elementary Linux (10.1.2.4)
 Elementary Linux (10.1.2.5)
 Elementary Linux (10.1.2.6)
```

在上面的例子中，可以看到在 `awk` 处理后每一行的行首都有一个空格，那是因为在源文件中每个冒号（`:`）后面都带有一个空格。和 `cut` 有所不同的是，`awk` 可以指定一个字符串作为分隔符，就像这样：

```
$ awk --field-separator ': ' '/Linux/ { print $2; }' os.txt
CentOS Linux (10.1.1.8)
CentOS Linux (10.1.1.9)
Red Hat Enterprise Linux (RHEL) (10.1.1.11)
Elementary Linux (10.1.2.4)
Elementary Linux (10.1.2.5)
Elementary Linux (10.1.2.6)
```

### awk 中的函数

可以通过这样的语法在 `awk` 中自定义函数：

```
函数名称(参数) { 操作 }
```

函数的好处在于只需要编写一次就可以多次复用，因此函数在脚本中起到的作用会比在构造单行命令时大。同时 `awk` 自身也带有很多预定义的函数，并且工作原理和其它编程语言或电子表格一样。你只需要了解函数需要接受什么参数，就可以放心使用了。

`awk` 中提供了数学运算和字符串处理的相关函数。数学运算函数通常比较简单，传入一个数字，它就会传出一个结果：

```
$ awk 'BEGIN { print sqrt(1764); }'
42
```

而字符串处理函数则稍微复杂一点，但 [GNU awk 手册][3]中也有充足的文档。例如 `split()` 函数需要传入一个待分割的单一字段、一个用于存放分割结果的数组，以及用于分割的<ruby>定界符<rt>delimiter</rt></ruby>。

例如前面示例中的输出内容，每条记录的末尾都包含了一个 IP 地址。由于变量 `NF` 代表的是每条记录的字段数量，刚好对应的是每条记录中最后一个字段的序号，因此可以通过引用 `NF` 将每条记录的最后一个字段传入 `split()` 函数：

```
$ awk --field-separator ': ' '/Linux/ { split($NF, IP, "."); print "subnet: " IP[3]; }' os.txt
subnet: 1
subnet: 1
subnet: 1
subnet: 2
subnet: 2
subnet: 2
```

还有更多的函数，没有理由将自己限制在每个 `awk` 代码块中。你可以在终端中使用 `awk` 构建复杂的管道，也可以编写 `awk` 脚本来定义和使用你自己的函数。

### 下载电子书

使用 `awk` 本身就是一个学习 `awk` 的过程，即使某些操作使用 `sed`、`grep`、`cut`、`tr` 命令已经完全足够了，也可以尝试使用 `awk` 来实现。只要熟悉了 `awk`，就可以在 Bash 中自定义一些 `awk` 函数，进而解析复杂的数据。

[下载我们的这本电子书][4]（需注册）学习并开始使用 `awk` 吧！

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/9/awk-ebook

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[HankChow](https://github.com/hankchow)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/computer_code_programming_laptop.jpg?itok=ormv35tV (Person programming on a laptop on a building)
[2]: https://opensource.com/resources/linux
[3]: https://www.gnu.org/software/gawk/manual/gawk.html
[4]: https://opensource.com/downloads/awk-ebook

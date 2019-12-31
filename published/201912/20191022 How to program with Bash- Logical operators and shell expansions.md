[#]: collector: (lujun9972)
[#]: translator: (lxbwolf)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11687-1.html)
[#]: subject: (How to program with Bash: Logical operators and shell expansions)
[#]: via: (https://opensource.com/article/19/10/programming-bash-logical-operators-shell-expansions)
[#]: author: (David Both https://opensource.com/users/dboth)

怎样用 Bash 编程：逻辑操作符和 shell 扩展
======

> 学习逻辑操作符和 shell 扩展，本文是三篇 Bash 编程系列的第二篇。

![](https://img.linux.net.cn/data/attachment/album/201912/17/173459pxhz0aiicimzd1m2.jpg)

Bash 是一种强大的编程语言，完美契合命令行和 shell 脚本。本系列（三篇文章，基于我的 [三集 Linux 自学课程][2]）讲解如何在 CLI 使用 Bash 编程。

[第一篇文章][3] 讲解了 Bash 的一些简单命令行操作，包括如何使用变量和控制操作符。第二篇文章探讨文件、字符串、数字等类型和各种各样在执行流中提供控制逻辑的的逻辑运算符，还有 Bash 中的各类 shell 扩展。本系列第三篇也是最后一篇文章，将会探索能重复执行操作的 `for` 、`while` 和 `until` 循环。

逻辑操作符是程序中进行判断的根本要素，也是执行不同的语句组合的依据。有时这也被称为流控制。

### 逻辑操作符

Bash 中有大量的用于不同条件表达式的逻辑操作符。最基本的是 `if` 控制结构，它判断一个条件，如果条件为真，就执行一些程序语句。操作符共有三类：文件、数字和非数字操作符。如果条件为真，所有的操作符返回真值（`0`），如果条件为假，返回假值（`1`）。

这些比较操作符的函数语法是，一个操作符加一个或两个参数放在中括号内，后面跟一系列程序语句，如果条件为真，程序语句执行，可能会有另一个程序语句列表，该列表在条件为假时执行：


```
if [ arg1 operator arg2 ] ; then list
或
if [ arg1 operator arg2 ] ; then list ; else list ; fi
```

像例子中那样，在比较表达式中，空格不能省略。中括号的每部分，`[` 和 `]`，是跟 `test` 命令一样的传统的 Bash 符号：

```
if test arg1 operator arg2 ; then list
```

还有一个更新的语法能提供一点点便利，一些系统管理员比较喜欢用。这种格式对于不同版本的 Bash 和一些 shell 如 ksh（Korn shell）兼容性稍差。格式如下：

```
if [[ arg1 operator arg2 ]] ; then list
```

#### 文件操作符

文件操作符是 Bash 中一系列强大的逻辑操作符。图表 1 列出了 20 多种不同的 Bash 处理文件的操作符。在我的脚本中使用频率很高。

操作符 | 描述
---|---
`-a filename` | 如果文件存在，返回真值；文件可以为空也可以有内容，但是只要它存在，就返回真值 
`-b filename` | 如果文件存在且是一个块设备，如 `/dev/sda` 或 `/dev/sda1`，则返回真值 
`-c filename` | 如果文件存在且是一个字符设备，如 `/dev/TTY1`，则返回真值 
`-d filename` | 如果文件存在且是一个目录，返回真值 
`-e filename` | 如果文件存在，返回真值；与上面的 `-a` 相同 
`-f filename` | 如果文件存在且是一个一般文件，不是目录、设备文件或链接等的其他的文件，则返回 真值 
`-g filename` | 如果文件存在且 `SETGID` 标记被设置在其上，返回真值 
`-h filename` | 如果文件存在且是一个符号链接，则返回真值 
`-k filename` | 如果文件存在且粘滞位已设置，则返回真值 
`-p filename` | 如果文件存在且是一个命名的管道（FIFO），返回真值 
`-r filename` | 如果文件存在且有可读权限（它的可读位被设置），返回真值 
`-s filename` | 如果文件存在且大小大于 0，返回真值；如果一个文件存在但大小为 0，则返回假值 
`-t fd` | 如果文件描述符 `fd` 被打开且被关联到一个终端设备上，返回真值 
`-u filename` | 如果文件存在且它的 `SETUID` 位被设置，返回真值 
`-w filename` | 如果文件存在且有可写权限，返回真值 
`-x filename` | 如果文件存在且有可执行权限，返回真值 
`-G filename` | 如果文件存在且文件的组 ID 与当前用户相同，返回真值 
`-L filename` | 如果文件存在且是一个符号链接，返回真值（同 `-h`）
`-N filename` | 如果文件存在且从文件上一次被读取后文件被修改过，返回真值 
`-O filename` | 如果文件存在且你是文件的拥有者，返回真值 
`-S filename` | 如果文件存在且文件是套接字，返回真值
`file1 -ef file2` | 如果文件 `file1` 和文件 `file2` 指向同一设备的同一 INODE 号，返回真值（即硬链接）
`file1 -nt file2` | 如果文件 `file1` 比 `file2` 新（根据修改日期），或 `file1` 存在而 `file2` 不存在，返回真值
`file1 -ot file2` | 如果文件 `file1` 比 `file2` 旧（根据修改日期），或 `file1` 不存在而 `file2` 存在 

*图表 1：Bash 文件操作符*

以测试一个文件存在与否来举例：

```
[student@studentvm1 testdir]$ File="TestFile1" ; if [ -e $File ] ; then echo "The file $File exists." ; else echo "The file $File does not exist." ; fi
The file TestFile1 does not exist.
[student@studentvm1 testdir]$
```

创建一个用来测试的文件，命名为 `TestFile1`。目前它不需要包含任何数据：

```
[student@studentvm1 testdir]$ touch TestFile1
```

在这个简短的 CLI 程序中，修改 `$File` 变量的值相比于在多个地方修改表示文件名的字符串的值要容易：

```
[student@studentvm1 testdir]$ File="TestFile1" ; if [ -e $File ] ; then echo "The file $File exists." ; else echo "The file $File does not exist." ; fi
The file TestFile1 exists.
[student@studentvm1 testdir]$
```

现在，运行一个测试来判断一个文件是否存在且长度不为 0（表示它包含数据）。假设你想判断三种情况：

1. 文件不存在；
2. 文件存在且为空；
3. 文件存在且包含数据。

因此，你需要一组更复杂的测试代码 — 为了测试所有的情况，使用 `if-elif-else` 结构中的 `elif` 语句：

```
[student@studentvm1 testdir]$ File="TestFile1" ; if [ -s $File ] ; then echo "$File exists and contains data." ; fi
[student@studentvm1 testdir]$
```

在这个情况中，文件存在但不包含任何数据。向文件添加一些数据再运行一次：

```
[student@studentvm1 testdir]$ File="TestFile1" ; echo "This is file $File" > $File ; if [ -s $File ] ; then echo "$File exists and contains data." ; fi
TestFile1 exists and contains data.
[student@studentvm1 testdir]$
```

这组语句能返回正常的结果，但是仅仅是在我们已知三种可能的情况下测试某种确切的条件。添加一段 `else` 语句，这样你就可以更精确地测试。把文件删掉，你就可以完整地测试这段新代码：

```
[student@studentvm1 testdir]$ File="TestFile1" ; rm $File ; if [ -s $File ] ; then echo "$File exists and contains data." ; else echo "$File does not exist or is empty." ; fi
TestFile1 does not exist or is empty.
```

现在创建一个空文件用来测试：

```
[student@studentvm1 testdir]$ File="TestFile1" ; touch $File ; if [ -s $File ] ; then echo "$File exists and contains data." ; else echo "$File does not exist or is empty." ; fi
TestFile1 does not exist or is empty.
```

向文件添加一些内容，然后再测试一次：

```
[student@studentvm1 testdir]$ File="TestFile1" ; echo "This is file $File" > $File ; if [ -s $File ] ; then echo "$File exists and contains data." ; else echo "$File does not exist or is empty." ; fi
TestFile1 exists and contains data.
```

现在加入 `elif` 语句来辨别是文件不存在还是文件为空：

```
[student@studentvm1 testdir]$ File="TestFile1" ; touch $File ; if [ -s $File ] ; then echo "$File exists and contains data." ; elif [ -e $File ] ; then echo "$File exists and is empty." ; else echo "$File does not exist." ; fi
TestFile1 exists and is empty.
[student@studentvm1 testdir]$ File="TestFile1" ; echo "This is $File" > $File ; if [ -s $File ] ; then echo "$File exists and contains data." ; elif [ -e $File ] ; then echo "$File exists and is empty." ; else echo "$File does not exist." ; fi
TestFile1 exists and contains data.
[student@studentvm1 testdir]$
```

现在你有一个可以测试这三种情况的 Bash CLI 程序，但是可能的情况是无限的。

如果你能像保存在文件中的脚本那样组织程序语句，那么即使对于更复杂的命令组合也会很容易看出它们的逻辑结构。图表 2 就是一个示例。 `if-elif-else` 结构中每一部分的程序语句的缩进让逻辑更变得清晰。


```
File="TestFile1"
echo "This is $File" > $File
if [ -s $File ]
   then
   echo "$File exists and contains data."
elif [ -e $File ]
   then
   echo "$File exists and is empty."
else
   echo "$File does not exist."
fi
```

*图表 2: 像在脚本里一样重写书写命令行程序*

对于大多数 CLI 程序来说，让这些复杂的命令变得有逻辑需要写很长的代码。虽然 CLI 可能是用 Linux 或 Bash 内置的命令，但是当 CLI 程序很长或很复杂时，创建一个保存在文件中的脚本将更有效，保存到文件中后，可以随时运行。

#### 字符串比较操作符

字符串比较操作符使我们可以对字符串中的字符按字母顺序进行比较。图表 3 列出了仅有的几个字符串比较操作符。

操作符 | 描述
---|---
`-z string` | 如果字符串的长度为 0 ，返回真值
`-n string` |如果字符串的长度不为 0 ，返回真值
`string1 == string2` 或 `string1 = string2` | 如果两个字符串相等，返回真值。处于遵从 POSIX 一致性，在测试命令中应使用一个等号 `=`。与命令 `[[` 一起使用时，会进行如上描述的模式匹配（混合命令）。 
`string1 != string2` | 两个字符串不相等，返回真值 
`string1 < string2` | 如果对 `string1` 和 `string2` 按字母顺序进行排序，`string1` 排在 `string2` 前面（即基于地区设定的对所有字母和特殊字符的排列顺序） 
`string1 > string2` | 如果对 `string1` 和 `string2` 按字母顺序进行排序，`string1` 排在 `string2` 后面 

*图表 3: Bash 字符串逻辑操作符*

首先，检查字符串长度。比较表达式中 `$MyVar` 两边的双引号不能省略（你仍应该在目录 `~/testdir` 下 ）。

```
[student@studentvm1 testdir]$ MyVar="" ; if [ -z "" ] ; then echo "MyVar is zero length." ; else echo "MyVar contains data" ; fi
MyVar is zero length.
[student@studentvm1 testdir]$ MyVar="Random text" ; if [ -z "" ] ; then echo "MyVar is zero length." ; else echo "MyVar contains data" ; fi
MyVar is zero length.
```

你也可以这样做：

```
[student@studentvm1 testdir]$ MyVar="Random text" ; if [ -n "$MyVar" ] ; then echo "MyVar contains data." ; else echo "MyVar is zero length" ; fi
MyVar contains data.
[student@studentvm1 testdir]$ MyVar="" ; if [ -n "$MyVar" ] ; then echo "MyVar contains data." ; else echo "MyVar is zero length" ; fi
MyVar is zero length
```

有时候你需要知道一个字符串确切的长度。这虽然不是比较，但是也与比较相关。不幸的是，计算字符串的长度没有简单的方法。有很多种方法可以计算，但是我认为使用 `expr`（求值表达式）命令是相对最简单的一种。阅读 `expr` 的手册页可以了解更多相关知识。注意表达式中你检测的字符串或变量两边的引号不要省略。

```
[student@studentvm1 testdir]$ MyVar="" ; expr length "$MyVar"
0
[student@studentvm1 testdir]$ MyVar="How long is this?" ; expr length "$MyVar"
17
[student@studentvm1 testdir]$ expr length "We can also find the length of a literal string as well as a variable."
70
```

关于比较操作符，在我们的脚本中使用了大量的检测两个字符串是否相等（例如，两个字符串是否实际上是同一个字符串）的操作。我使用的是非 POSIX 版本的比较表达式：

```
[student@studentvm1 testdir]$ Var1="Hello World" ; Var2="Hello World" ; if [ "$Var1" == "$Var2" ] ; then echo "Var1 matches Var2" ; else echo "Var1 and Var2 do not match." ; fi
Var1 matches Var2
[student@studentvm1 testdir]$ Var1="Hello World" ; Var2="Hello world" ; if [ "$Var1" == "$Var2" ] ; then echo "Var1 matches Var2" ; else echo "Var1 and Var2 do not match." ; fi
Var1 and Var2 do not match.
```

在你自己的脚本中去试一下这些操作符。

#### 数字比较操作符

数字操作符用于两个数字参数之间的比较。像其他类操作符一样，大部分都很容易理解。

操作符 | 描述
---|---
`arg1 -eq arg2` | 如果 `arg1` 等于 `arg2`，返回真值
`arg1 -ne arg2` | 如果 `arg1` 不等于 `arg2`，返回真值 
`arg1 -lt arg2` | 如果 `arg1` 小于 `arg2`，返回真值 
`arg1 -le arg2` | 如果 `arg1` 小于或等于 `arg2`，返回真值 
`arg1 -gt arg2` | 如果 `arg1` 大于 `arg2`，返回真值 
`arg1 -ge arg2` | 如果 `arg1` 大于或等于 `arg2`，返回真值 

*图表 4: Bash 数字比较逻辑操作符*

来看几个简单的例子。第一个示例设置变量 `$X` 的值为 1，然后检测 `$X` 是否等于 1。第二个示例中，`$X` 被设置为 0，所以比较表达式返回结果不为真值。

```
[student@studentvm1 testdir]$ X=1 ; if [ $X -eq 1 ] ; then echo "X equals 1" ; else echo "X does not equal 1" ; fi
X equals 1
[student@studentvm1 testdir]$ X=0 ; if [ $X -eq 1 ] ; then echo "X equals 1" ; else echo "X does not equal 1" ; fi
X does not equal 1
[student@studentvm1 testdir]$
```

自己来多尝试一下其他的。

#### 杂项操作符

这些杂项操作符展示一个 shell 选项是否被设置，或一个 shell 变量是否有值，但是它不显示变量的值，只显示它是否有值。

操作符 | 描述
---|---
`-o optname` | 如果一个 shell 选项 `optname` 是启用的（查看内建在 Bash 手册页中的 set  `-o` 选项描述下面的选项列表），则返回真值 
`-v varname` | 如果 shell 变量 `varname` 被设置了值（被赋予了值），则返回真值 
`-R varname` | 如果一个 shell 变量 `varname` 被设置了值且是一个名字引用，则返回真值 

*图表 5: 杂项 Bash 逻辑操作符*

自己来使用这些操作符实践下。

### 扩展

Bash 支持非常有用的几种类型的扩展和命令替换。根据 Bash 手册页，Bash 有七种扩展格式。本文只介绍其中五种：`~` 扩展、算术扩展、路径名称扩展、大括号扩展和命令替换。

#### 大括号扩展

大括号扩展是生成任意字符串的一种方法。（下面的例子是用特定模式的字符创建大量的文件。）大括号扩展可以用于产生任意字符串的列表，并把它们插入一个用静态字符串包围的特定位置或静态字符串的两端。这可能不太好想象，所以还是来实践一下。

首先，看一下大括号扩展的作用：

```
[student@studentvm1 testdir]$ echo {string1,string2,string3}
string1 string2 string3
```

看起来不是很有用，对吧？但是用其他方式使用它，再来看看：

```
[student@studentvm1 testdir]$ echo "Hello "{David,Jen,Rikki,Jason}.
Hello David. Hello Jen. Hello Rikki. Hello Jason.
```

这看起来貌似有点用了 — 我们可以少打很多字。现在试一下这个：

```
[student@studentvm1 testdir]$ echo b{ed,olt,ar}s
beds bolts bars
```

我可以继续举例，但是你应该已经理解了它的用处。

#### ~ 扩展

资料显示，使用最多的扩展是波浪字符（`~`）扩展。当你在命令中使用它（如  `cd ~/Documents`）时，Bash shell 把这个快捷方式展开成用户的完整的家目录。

使用这个 Bash 程序观察 `~` 扩展的作用：

```
[student@studentvm1 testdir]$ echo ~
/home/student
[student@studentvm1 testdir]$ echo ~/Documents
/home/student/Documents
[student@studentvm1 testdir]$ Var1=~/Documents ; echo $Var1 ; cd $Var1
/home/student/Documents
[student@studentvm1 Documents]$
```

#### 路径名称扩展

路径名称扩展是展开文件通配模式为匹配该模式的完整路径名称的另一种说法，匹配字符使用 `?` 和 `*`。文件通配指的是在大量操作中匹配文件名、路径和其他字符串时用特定的模式字符产生极大的灵活性。这些特定的模式字符允许匹配字符串中的一个、多个或特定字符。

* `?` — 匹配字符串中特定位置的一个任意字符
* `*` — 匹配字符串中特定位置的 0 个或多个任意字符

这个扩展用于匹配路径名称。为了弄清它的用法，请确保 `testdir` 是当前工作目录（`PWD`），先执行基本的列出清单命令 `ls`（我家目录下的内容跟你的不一样）。

```
[student@studentvm1 testdir]$ ls
chapter6  cpuHog.dos    dmesg1.txt  Documents  Music       softlink1  testdir6    Videos
chapter7  cpuHog.Linux  dmesg2.txt  Downloads  Pictures    Templates  testdir
testdir  cpuHog.mac    dmesg3.txt  file005    Public      testdir    tmp
cpuHog     Desktop       dmesg.txt   link3      random.txt  testdir1   umask.test
[student@studentvm1 testdir]$
```

现在列出以 `Do`、`testdir/Documents` 和 `testdir/Downloads` 开头的目录：

```
Documents:
Directory01  file07  file15        test02  test10  test20      testfile13  TextFiles
Directory02  file08  file16        test03  test11  testfile01  testfile14
file01       file09  file17        test04  test12  testfile04  testfile15
file02       file10  file18        test05  test13  testfile05  testfile16
file03       file11  file19        test06  test14  testfile09  testfile17
file04       file12  file20        test07  test15  testfile10  testfile18
file05       file13  Student1.txt  test08  test16  testfile11  testfile19
file06       file14  test01        test09  test18  testfile12  testfile20

Downloads:
[student@studentvm1 testdir]$
```

然而，并没有得到你期望的结果。它列出了以 `Do` 开头的目录下的内容。使用 `-d` 选项，仅列出目录而不列出它们的内容。

```
[student@studentvm1 testdir]$ ls -d Do*
Documents  Downloads
[student@studentvm1 testdir]$
```

在两个例子中，Bash shell 都把 `Do*` 模式展开成了匹配该模式的目录名称。但是如果有文件也匹配这个模式，会发生什么？

```
[student@studentvm1 testdir]$ touch Downtown ; ls -d Do*
Documents  Downloads  Downtown
[student@studentvm1 testdir]$
```

因此所有匹配这个模式的文件也被展开成了完整名字。

#### 命令替换

命令替换是让一个命令的标准输出数据流被当做参数传给另一个命令的扩展形式，例如，在一个循环中作为一系列被处理的项目。Bash 手册页显示：“命令替换可以让你用一个命令的输出替换为命令的名字。”这可能不太好理解。

命令替换有两种格式：\`command\` 和 `$(command)`。在更早的格式中使用反引号（\`），在命令中使用反斜杠（`\`）来保持它转义之前的文本含义。然而，当用在新版本的括号格式中时，反斜杠被当做一个特殊字符处理。也请注意带括号的格式打开个关闭命令语句都是用一个括号。

我经常在命令行程序和脚本中使用这种能力，一个命令的结果能被用作另一个命令的参数。

来看一个非常简单的示例，这个示例使用了这个扩展的两种格式（再一次提醒，确保 `testdir` 是当前工作目录）：

```
[student@studentvm1 testdir]$ echo "Todays date is `date`"
Todays date is Sun Apr  7 14:42:46 EDT 2019
[student@studentvm1 testdir]$ echo "Todays date is $(date)"
Todays date is Sun Apr  7 14:42:59 EDT 2019
[student@studentvm1 testdir]$
```

`-seq` 工具用于一个数字序列：

```
[student@studentvm1 testdir]$ seq 5
1
2
3
4
5
[student@studentvm1 testdir]$ echo `seq 5`
1 2 3 4 5
[student@studentvm1 testdir]$
```

现在你可以做一些更有用处的操作，比如创建大量用于测试的空文件。

```
[student@studentvm1 testdir]$ for I in $(seq -w 5000) ; do touch file-$I ; done
```

`seq` 工具加上 `-w` 选项后，在生成的数字前面会用 0 补全，这样所有的结果都等宽，例如，忽略数字的值，它们的位数一样。这样在对它们按数字顺序进行排列时很容易。

`seq -w 5000` 语句生成了 1 到 5000 的数字序列。通过把命令替换用于 `for` 语句，`for` 语句就可以使用该数字序列来生成文件名的数字部分。

#### 算术扩展

Bash 可以进行整型的数学计算，但是比较繁琐（你一会儿将看到）。数字扩展的语法是 `$((arithmetic-expression))` ，分别用两个括号来打开和关闭表达式。算术扩展在 shell 程序或脚本中类似命令替换；表达式结算后的结果替换了表达式，用于 shell 后续的计算。

我们再用一个简单的用法来开始：

```
[student@studentvm1 testdir]$ echo $((1+1))
2
[student@studentvm1 testdir]$ Var1=5 ; Var2=7 ; Var3=$((Var1*Var2)) ; echo "Var 3 = $Var3"
Var 3 = 35
```

下面的除法结果是 0，因为表达式的结果是一个小于 1 的整型数字：

```
[student@studentvm1 testdir]$ Var1=5 ; Var2=7 ; Var3=$((Var1/Var2)) ; echo "Var 3 = $Var3"
Var 3 = 0
```

这是一个我经常在脚本或 CLI 程序中使用的一个简单的计算，用来查看在 Linux 主机中使用了多少虚拟内存。 `free` 不提供我需要的数据：

```
[student@studentvm1 testdir]$ RAM=`free | grep ^Mem | awk '{print $2}'` ; Swap=`free | grep ^Swap | awk '{print $2}'` ; echo "RAM = $RAM and Swap = $Swap" ; echo "Total Virtual memory is $((RAM+Swap))" ;
RAM = 4037080 and Swap = 6291452
Total Virtual memory is 10328532
```

我使用 \` 字符来划定用作命令替换的界限。

我用 Bash 算术扩展的场景主要是用脚本检查系统资源用量后基于返回的结果选择一个程序运行的路径。

### 总结

本文是 Bash 编程语言系列的第二篇，探讨了 Bash 中文件、字符串、数字和各种提供流程控制逻辑的逻辑操作符还有不同种类的 shell 扩展。

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/10/programming-bash-logical-operators-shell-expansions

作者：[David Both][a]
选题：[lujun9972][b]
译者：[lxbwolf](https://github.com/lxbwolf)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/dboth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/OSDC_women_computing_5.png?itok=YHpNs_ss (Women in computing and open source v5)
[2]: http://www.both.org/?page_id=1183
[3]: https://linux.cn/article-11552-1.html

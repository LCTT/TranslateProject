[#]: collector: (lujun9972)
[#]: translator: (lxbwolf)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11714-1.html)
[#]: subject: (How to program with Bash: Loops)
[#]: via: (https://opensource.com/article/19/10/programming-bash-loops)
[#]: author: (David Both https://opensource.com/users/dboth)

怎样用 Bash 编程：循环
======

> 本文是 Bash 编程系列三篇中的最后一篇，来学习使用循环执行迭代的操作。

![](https://img.linux.net.cn/data/attachment/album/201912/26/111437f9pa3zqqwcc9wwg1.jpg)

Bash 是一种强大的用于命令行和 shell 脚本的编程语言。本系列的三部分都是基于我的三集 [Linux 自学课程][2] 写的，探索怎么用 CLI 进行 bash 编程。

本系列的 [第一篇文章][3] 讨论了 bash 编程的一些简单命令行操作，如使用变量和控制操作符。[第二篇文章][4] 探讨了文件、字符串、数字等类型和各种各样在执行流中提供控制逻辑的的逻辑运算符，还有 bash 中不同种类的扩展。本文是第三篇（也是最后一篇），意在考察在各种迭代的操作中使用循环以及怎么合理控制循环。

### 循环

我使用过的所有编程语言都至少有两种循环结构来用来执行重复的操作。我经常使用 `for` 循环，然而我发现 `while` 和 `until` 循环也很有用处。

#### for 循环

我的理解是，在 bash 中实现的 `for` 命令比大部分语言灵活，因为它可以处理非数字的值；与之形成对比的是，诸如标准 C 语言的 `for` 循环只能处理数字类型的值。

Bash 版的 `for` 命令基本的结构很简单：

```
for Var in list1 ; do list2 ; done
```

解释一下：“对于 `list1` 中的每一个值，把 `$Var` 设置为那个值，使用该值执行 `list2` 中的程序语句；`list1` 中的值都执行完后，整个循环结束，退出循环。” `list1` 中的值可以是一个简单的显式字符串值，也可以是一个命令执行后的结果（`` 包含其内的命令执行的结果，本系列第二篇文章中有描述）。我经常使用这种结构。

要测试它，确认 `~/testdir` 仍然是当前的工作目录（PWD）。删除目录下所有东西，来看下这个显式写出值列表的 `for` 循环的简单的示例。这个列表混合了字母和数字 — 但是不要忘了，在 bash 中所有的变量都是字符串或者可以被当成字符串来处理。

```
[student@studentvm1 testdir]$ rm *
[student@studentvm1 testdir]$ for I in a b c d 1 2 3 4 ; do echo $I ; done
a
b
c
d
1
2
3
4
```

给变量赋予更有意义的名字，变成前面版本的进阶版：

```
[student@studentvm1 testdir]$ for Dept in "Human Resources" Sales Finance "Information Technology" Engineering Administration Research ; do echo "Department $Dept" ; done
Department Human Resources
Department Sales
Department Finance
Department Information Technology
Department Engineering
Department Administration
Department Research
```

创建几个目录（创建时显示一些处理信息）：

```
[student@studentvm1 testdir]$ for Dept in "Human Resources" Sales Finance "Information Technology" Engineering Administration Research ; do echo "Working on Department $Dept" ; mkdir "$Dept"  ; done
Working on Department Human Resources
Working on Department Sales
Working on Department Finance
Working on Department Information Technology
Working on Department Engineering
Working on Department Administration
Working on Department Research
[student@studentvm1 testdir]$ ll
total 28
drwxrwxr-x 2 student student 4096 Apr  8 15:45  Administration
drwxrwxr-x 2 student student 4096 Apr  8 15:45  Engineering
drwxrwxr-x 2 student student 4096 Apr  8 15:45  Finance
drwxrwxr-x 2 student student 4096 Apr  8 15:45 'Human Resources'
drwxrwxr-x 2 student student 4096 Apr  8 15:45 'Information Technology'
drwxrwxr-x 2 student student 4096 Apr  8 15:45  Research
drwxrwxr-x 2 student student 4096 Apr  8 15:45  Sales
```

在 `mkdir` 语句中 `$Dept` 变量必须用引号包裹起来；否则名字中间有空格（如 `Information Technology`）会被当做两个独立的目录处理。我一直信奉的一条实践规则：所有的文件和目录都应该为一个单词（中间没有空格）。虽然大部分现代的操作系统可以处理名字中间有空格的情况，但是系统管理员需要花费额外的精力去确保脚本和 CLI 程序能正确处理这些特例。（即使它们很烦人，也务必考虑它们，因为你永远不知道将拥有哪些文件。）

再次删除 `~/testdir` 下的所有东西 — 再运行一次下面的命令：

```
[student@studentvm1 testdir]$ rm -rf * ; ll
total 0
[student@studentvm1 testdir]$ for Dept in Human-Resources Sales Finance Information-Technology Engineering Administration Research ; do echo "Working on Department $Dept" ; mkdir "$Dept"  ; done
Working on Department Human-Resources
Working on Department Sales
Working on Department Finance
Working on Department Information-Technology
Working on Department Engineering
Working on Department Administration
Working on Department Research
[student@studentvm1 testdir]$ ll
total 28
drwxrwxr-x 2 student student 4096 Apr  8 15:52 Administration
drwxrwxr-x 2 student student 4096 Apr  8 15:52 Engineering
drwxrwxr-x 2 student student 4096 Apr  8 15:52 Finance
drwxrwxr-x 2 student student 4096 Apr  8 15:52 Human-Resources
drwxrwxr-x 2 student student 4096 Apr  8 15:52 Information-Technology
drwxrwxr-x 2 student student 4096 Apr  8 15:52 Research
drwxrwxr-x 2 student student 4096 Apr  8 15:52 Sales
```

假设现在有个需求，需要列出一台 Linux 机器上所有的 RPM 包并对每个包附上简短的描述。我为北卡罗来纳州工作的时候，曾经遇到过这种需求。由于当时开源尚未得到州政府的“批准”，而且我只在台式机上使用 Linux，对技术一窍不通的老板（PHB）需要我列出我计算机上安装的所有软件，以便他们可以“批准”一个特例。

你怎么实现它？有一种方法是，已知 `rpm –qa` 命令提供了 RPM 包的完整描述，包括了白痴老板想要的东西：软件名称和概要描述。

让我们一步步执行出最后的结果。首先，列出所有的 RPM 包：

```
[student@studentvm1 testdir]$ rpm -qa
perl-HTTP-Message-6.18-3.fc29.noarch
perl-IO-1.39-427.fc29.x86_64
perl-Math-Complex-1.59-429.fc29.noarch
lua-5.3.5-2.fc29.x86_64
java-11-openjdk-headless-11.0.ea.28-2.fc29.x86_64
util-linux-2.32.1-1.fc29.x86_64
libreport-fedora-2.9.7-1.fc29.x86_64
rpcbind-1.2.5-0.fc29.x86_64
libsss_sudo-2.0.0-5.fc29.x86_64
libfontenc-1.1.3-9.fc29.x86_64
&lt;snip&gt;
```

用 `sort` 和 `uniq` 命令对列表进行排序和打印去重后的结果（有些已安装的 RPM 包具有相同的名字）：


```
[student@studentvm1 testdir]$ rpm -qa | sort | uniq
a2ps-4.14-39.fc29.x86_64
aajohan-comfortaa-fonts-3.001-3.fc29.noarch
abattis-cantarell-fonts-0.111-1.fc29.noarch
abiword-3.0.2-13.fc29.x86_64
abrt-2.11.0-1.fc29.x86_64
abrt-addon-ccpp-2.11.0-1.fc29.x86_64
abrt-addon-coredump-helper-2.11.0-1.fc29.x86_64
abrt-addon-kerneloops-2.11.0-1.fc29.x86_64
abrt-addon-pstoreoops-2.11.0-1.fc29.x86_64
abrt-addon-vmcore-2.11.0-1.fc29.x86_64
&lt;snip&gt;
```

以上命令得到了想要的 RPM 列表，因此你可以把这个列表作为一个循环的输入信息，循环最终会打印每个 RPM 包的详细信息：

```
[student@studentvm1 testdir]$ for RPM in `rpm -qa | sort | uniq` ; do rpm -qi $RPM ; done
```

这段代码产出了多余的信息。当循环结束后，下一步就是提取出白痴老板需要的信息。因此，添加一个 `egrep` 命令用来搜索匹配 `^Name` 或 `^Summary` 的行。脱字符（`^`）表示行首，整个命令表示显示所有以 Name 或 Summary 开头的行。

```
[student@studentvm1 testdir]$ for RPM in `rpm -qa | sort | uniq` ; do rpm -qi $RPM ; done | egrep -i "^Name|^Summary"
Name        : a2ps
Summary     : Converts text and other types of files to PostScript
Name        : aajohan-comfortaa-fonts
Summary     : Modern style true type font
Name        : abattis-cantarell-fonts
Summary     : Humanist sans serif font
Name        : abiword
Summary     : Word processing program
Name        : abrt
Summary     : Automatic bug detection and reporting tool
&lt;snip&gt;
```

在上面的命令中你可以试试用 `grep` 代替 `egrep` ，你会发现用 `grep` 不能得到正确的结果。你也可以通过管道把命令结果用 `less` 过滤器来查看。最终命令像这样：

```
[student@studentvm1 testdir]$ for RPM in `rpm -qa | sort | uniq` ; do rpm -qi $RPM ; done | egrep -i "^Name|^Summary" > RPM-summary.txt
```

这个命令行程序用到了管道、重定向和 `for` 循环，这些全都在一行中。它把你的 CLI 程序的结果重定向到了一个文件，这个文件可以在邮件中使用或在其他地方作为输入使用。

这个一次一步构建程序的过程让你能看到每步的结果，以此来确保整个程序以你期望的流程进行且输出你想要的结果。

白痴老板最终收到了超过 1900 个不同的 RPM 包的清单，我严重怀疑根本就没人读过这个列表。我给了他们想要的东西，没有从他们嘴里听到过任何关于 RPM 包的信息。

### 其他循环

Bash 中还有两种其他类型的循环结构：`while` 和 `until` 结构，两者在语法和功能上都类似。这些循环结构的基础语法很简单：

```
while [ expression ] ; do list ; done
```

逻辑解释：表达式（`expression`）结果为 true 时，执行程序语句 `list`。表达式结果为 false 时，退出循环。

```
until [ expression ] ; do list ; done
```

逻辑解释：执行程序语句 `list`，直到表达式的结果为 true。当表达式结果为 true 时，退出循环。

#### While 循环

`while` 循环用于当逻辑表达式结果为 true 时执行一系列程序语句。假设你的 PWD 仍是 `~/testdir`。

最简单的 `while` 循环形式是这个会一直运行下去的循环。下面格式的条件语句永远以 `true` 作为返回。你也可以用简单的 `1` 代替 `true`，结果一样，但是这解释了 true 表达式的用法。

```
[student@studentvm1 testdir]$ X=0 ; while [ true ] ; do echo $X ; X=$((X+1)) ; done | head
0
1
2
3
4
5
6
7
8
9
[student@studentvm1 testdir]$
```

既然你已经学了 CLI 的各部分知识，那就让它变得更有用处。首先，为了防止变量 `$X` 在前面的程序或 CLI 命令执行后有遗留的值，设置 `$X` 的值为 0。然后，因为逻辑表达式 `[ true ]` 的结果永远是 1，即 true，在 `do` 和 `done` 中间的程序指令列表会一直执行 — 或者直到你按下 `Ctrl+C` 抑或发送一个 2 号信号给程序。那些程序指令是算数扩展，用来打印变量 `$X` 当前的值并加 1.

《[系统管理员的 Linux 哲学][5]》的信条之一是追求优雅，实现优雅的一种方式就是简化。你可以用操作符 `++` 来简化这个程序。在第一个例子中，变量当前的值被打印出来，然后变量的值增加了。可以在变量后加一个 `++` 来表示这个逻辑：

```
[student@studentvm1 ~]$ X=0 ; while [ true ] ; do echo $((X++)) ; done | head
0
1
2
3
4
5
6
7
8
9
```

现在删掉程序最后的 `| head` 再运行一次。

在下面这个版本中，变量在值被打印之前就自增了。这是通过在变量之前添加 `++` 操作符实现的。你能看出区别吗？

```
[student@studentvm1 ~]$ X=0 ; while [ true ] ; do echo $((++X)) ; done | head
1
2
3
4
5
6
7
8
9
```

你已经把打印变量的值和自增简化到了一条语句。类似 `++` 操作符，也有 `--` 操作符。

你需要一个在循环到某个特定数字时终止循环的方法。把 true 表达式换成一个数字比较表达式来实现它。这里有一个循环到 5 终止的程序。在下面的示例代码中，你可以看到 `-le` 是 “小于或等于” 的数字逻辑操作符。整个语句的意思：只要 `$X` 的值小于或等于 5，循环就一直运行。当 `$X` 增加到 6 时，循环终止。

```
[student@studentvm1 ~]$ X=0 ; while [ $X -le 5 ] ; do echo $((X++)) ; done
0
1
2
3
4
5
[student@studentvm1 ~]$
```

#### Until 循环

`until` 命令非常像 `while` 命令。不同之处是，它直到逻辑表达式的值是 `true` 之前，会一直循环。看一下这种结构最简单的格式：

```
[student@studentvm1 ~]$ X=0 ; until false  ; do echo $((X++)) ; done | head
0
1
2
3
4
5
6
7
8
9
[student@studentvm1 ~]$
```

它用一个逻辑比较表达式来计数到一个特定的值：

```
[student@studentvm1 ~]$ X=0 ; until [ $X -eq 5 ]  ; do echo $((X++)) ; done
0
1
2
3
4
[student@studentvm1 ~]$ X=0 ; until [ $X -eq 5 ]  ; do echo $((++X)) ; done
1
2
3
4
5
[student@studentvm1 ~]$
```

### 总结

本系列探讨了构建 Bash 命令行程序和 shell 脚本的很多强大的工具。但是这仅仅是你能用 Bash 做的很多有意思的事中的冰山一角，接下来就看你的了。

我发现学习 Bash 编程最好的方法就是实践。找一个需要多个 Bash 命令的简单项目然后写一个 CLI 程序。系统管理员们要做很多适合 CLI 编程的工作，因此我确信你很容易能找到自动化的任务。

很多年前，尽管我对其他的 Shell 语言和 Perl 很熟悉，但还是决定用 Bash 做所有系统管理员的自动化任务。我发现，有时稍微搜索一下，我可以用 Bash 实现我需要的所有事情。

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/10/programming-bash-loops

作者：[David Both][a]
选题：[lujun9972][b]
译者：[lxbwolf](https://github.com/lxbwolf)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/dboth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/fail_progress_cycle_momentum_arrow.png?itok=q-ZFa_Eh (arrows cycle symbol for failing faster)
[2]: http://www.both.org/?page_id=1183
[3]: https://linux.cn/article-11552-1.html
[4]: https://linux.cn/article-11687-1.html
[5]: https://www.apress.com/us/book/9781484237298

[#]: collector: (lujun9972)
[#]: translator: (asche910)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10465-1.html)
[#]: subject: (Linux Tools: The Meaning of Dot)
[#]: via: (https://www.linux.com/blog/learn/2019/1/linux-tools-meaning-dot)
[#]: author: (Paul Brown https://www.linux.com/users/bro66)

Linux 工具：点的含义
======

> Paul Brown 解释了 Linux shell 命令中那个不起眼的“点”的各种意思和用法。

![](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/psychedelic-dot.jpg?itok=giKEHvwQ)

在现实情况中，使用 shell 命令编写的单行命令或脚本可能会令人很困惑。你使用的很多工具的名称与它们的实际功能相差甚远（`grep`、`tee` 和 `awk`，还有吗？），而当你将两个或更多个组合起来时，所组成的 “句子” 看起来更像某种外星人的天书。

因此，上面说的这些对于你并无帮助，因为你用来编写一连串的指令所使用的符号根据你使用的场景有着不同的意义。

### 位置、位置、位置

就拿这个不起眼的点（`.`）来说吧。当它放在一个需要一个目录名称的命令的参数处时，表示“当前目录”：

```
find . -name "*.jpg"
```

意思就是“在当前目录（包括子目录）中寻找以 `.jpg` 结尾的文件”。

`ls .` 和 `cd .` 结果也如你想的那样，它们分别列举和“进入”到当前目录，虽然在这两种情况下这个点都是多余的。

而一个紧接着另一个的两个点呢，在同样的场景下（即当你的命令期望一个文件目录的时候）表示“当前目录的父目录”。如果你当前在 `/home/your_directory` 下并且运行：

```
cd ..
```

你就会进入到 `/home`。所以，你可能认为这仍然适合“点代表附近目录”的叙述，并且毫不复杂，对吧？

那下面这样会怎样呢？如果你在一个文件或目录的开头加上点，它表示这个文件或目录会被隐藏：

```
$ touch somedir/file01.txt somedir/file02.txt somedir/.secretfile.txt
$ ls -l somedir/
total 0
-rw-r--r-- 1 paul paul 0 Jan 13 19:57 file01.txt
-rw-r--r-- 1 paul paul 0 Jan 13 19:57 file02.txt
$ # 注意上面列举的文件中没有 .secretfile.txt
$ ls -la somedir/
total 8
drwxr-xr-x 2 paul paul 4096 Jan 13 19:57 .
drwx------ 48 paul paul 4096 Jan 13 19:57 ..
-rw-r--r-- 1 paul paul 0 Jan 13 19:57 file01.txt
-rw-r--r-- 1 paul paul 0 Jan 13 19:57 file02.txt
-rw-r--r-- 1 paul paul 0 Jan 13 19:57 .secretfile.txt
$ # 这个 -a  选项告诉 ls 去展示“all”文件，包括那些隐藏的
```

然后就是你可以将 `.` 当作命令。是的，你听我说：`.` 是个真真正正的命令。它是 `source` 命令的代名词，所以你可以用它在当前 shell 中执行一个文件，而不是以某种其它的方式去运行一个脚本文件（这通常指的是 Bash 会产生一个新的 shell 去运行它）

很困惑？别担心 —— 试试这个：创建一个名为 `myscript` 的脚本，内容包含下面一行：

```
myvar="Hello"
```

然后通过常规的方法执行它，也就是用 `sh myscript`（或者通过 `chmod a+x myscript` 命令让它可执行，然后运行 `./myscript`）。现在尝试并且观察 `myvar` 的内容，通过 `echo $myvar`（理所当然你什么也得不到）。那是因为，当你的脚本赋值 `"Hello"` 给 `myvar` 时，它是在一个隔离的bash shell 实例中进行的。当脚本运行结束时，这个新产生的实例会消失并且将控制权转交给原来的shell，而原来的 shell 里甚至都不存在 `myvar` 变量。

然而，如果你这样运行 `myscript`：

```
. myscript
```

`echo $myvar` 就会打印 `Hello` 到命令行上。

当你的 `.bashrc` 文件发生变化后，你经常会用到 `.`（或 `source`）命令，[就像当你要扩展 `PATH` 变量那样][1]。在你的当前 shell 实例中，你可以使用 `.` 来让变化立即生效。

### 双重麻烦

就像看似无关紧要的一个点有多个含义一样，两个点也是如此。除了指向当前目录的父级之外，两个点（`..`）也用于构建序列。

尝试下这个：

```
echo {1..10}
```

它会打印出从 1 到 10 的序列。在这种场景下，`..` 表示 “从左边的值开始，计数到右边的值”。

现在试下这个：

```
echo {1..10..2}
```

你会得到 `1 3 5 7 9`。`..2` 这部分命令告诉 Bash 输出这个序列，不过不是每个相差 1，而是相差 2。换句话说，就是你会得到从 1 到 10 之间的奇数。

它反着也仍然有效：

```
echo {10..1..2}
```

你也可以用多个 0 填充你的数字。这样：

```
echo {000..121..2}
```

会这样打印出从 0 到 121 之间的偶数（填充了前置 0）：

```
000 002 004 006 ... 050 052 054 ... 116 118 120
```

不过这样的序列发生器有啥用呢？当然，假设您的新年决心之一是更加谨慎控制您的帐户花销。作为决心的一部分，您需要创建目录，以便对过去 10 年的数字发票进行分类：

```
mkdir {2009..2019}_Invoices
```

工作完成。

或者你可能有数百个带编号的文件，比如从视频剪辑中提取的帧，或许因为某种原因，你只想从第 43 帧到第 61 帧每隔三帧删除一帧：

```
rm frame_{043..61..3}
```

很可能，如果你有超过 100 个帧，它们将以填充 0 命名，如下所示：

```
frame_000 frame_001 frame_002 ...
```

那就是为什么你在命令中要用 `043`，而不是`43` 的原因。

### 花括号花招

说实话，序列的神奇之处不在于双点，而是花括号（`{}`）的巫术。看看它对于字母是如何工作的。这样做：

```
touch file_{a..z}.txt
```

它创建了从 `file_a.txt` 到 `file_z.txt` 的文件。

但是，你必须小心。使用像 `{Z..a}` 这样的序列将产生一大堆大写字母和小写字母之间的非字母、数字的字符（既不是数字或字母的字形）。其中一些字形是不可打印的或具有自己的特殊含义。使用它们来生成文件名称可能会导致一系列意外和可能令人不快的影响。

最后一件值得指出的事：包围在 `{...}` 的序列，它们也可以包含字符串列表：

```
touch {blahg, splurg, mmmf}_file.txt
```

将创建了 `blahg_file.txt`、`splurg_file.txt` 和 `mmmf_file.txt`。

当然，在别的场景中，大括号也有不同的含义（惊喜吗！）。不过那是别的文章的内容了。

### 总结

Bash 以及运行于其中的各种工具已经被寻求解决各种特定问题的系统管理员们把玩了数十年。要说这种有自己之道的系统管理员是一种特殊物种的话，那是有点轻描淡写。总而言之，与其他语言相反，Bash 的设计目标并不是为了用户友好、简单、甚至合乎逻辑。

但这并不意味着它不强大 —— 恰恰相反。Bash 的语法和 shell 工具可能不一致且很庞大，但它们也提供了一系列令人眼花缭乱的方法来完成您可能想象到的一切。就像有一个工具箱，你可以从中找到从电钻到勺子的所有东西，以及橡皮鸭、一卷胶带和一些指甲钳。

除了引人入胜之外，探明你可以直接在 shell 中达成的所有能力也很有趣，所以下次我们将深入探讨如何构建更大更好的 Bash 命令行。

在那之前，玩得开心！

--------------------------------------------------------------------------------

via: https://www.linux.com/blog/learn/2019/1/linux-tools-meaning-dot

作者：[Paul Brown][a]
选题：[lujun9972][b]
译者：[asche910](https://github.com/asche910)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.linux.com/users/bro66
[b]: https://github.com/lujun9972
[1]: https://www.linux.com/blog/learn/2018/12/bash-variables-environmental-and-otherwise

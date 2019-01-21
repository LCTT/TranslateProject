[#]: collector: (lujun9972)
[#]: translator: (asche910)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Linux Tools: The Meaning of Dot)
[#]: via: (https://www.linux.com/blog/learn/2019/1/linux-tools-meaning-dot)
[#]: author: (Paul Brown https://www.linux.com/users/bro66)

Linux 工具: 点的含义
======

![](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/psychedelic-dot.jpg?itok=giKEHvwQ)

我们会面对这样的现实：使用shell命令编写简短的脚本可能会令人很困惑。很多任你使用的工具的名称与它们的实际功能相差甚远(_grep_ , _tee_ 和 _awk_ ,还有吗?)， 并且当你将两个或更多个组合起来时，产生的“句子”看起来像某种外星人官样文章。


由于这样一个现实： 你用来编写一连串的指令所使用的符号标志根据你使用的场景有着不同的意义。所以它对我们上面的事并没有给予到帮助。

### 位置，位置，位置


就拿这个谦卑的点 (`.`) 为例。 它与接收一个目录名称的指令一起使用，表示“当前目录”：

```
find . -name "*.jpg"
```

意思就是“_在当前目录（包括子目录）中寻找以`.jpg`结尾的文件_”

`ls .` and `cd .`结果也同期望的那样，他们分别列举和“进入”到当前目录，虽然在这两种情况下点都是多余的。


两个点，一个紧接着另一个，同样的场景下（即当你的命令期望一个文件目录的时候）表示“_当前目录的父目录_”。如果你当前在 _/home/your_directory_ 下并且运行
```
cd ..
```

你就会进入到 _/home_。所以，你可能认为这仍然适合“点代表附近目录”的叙述，并且毫不复杂，对吧？



那这样会怎样呢？如果你在一个文件或目录的开头加上点，它表示这个文件或目录会被隐藏：
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
$ # 这个 -a  选项告诉 ls 去展示"all" 文件, 包括那些隐藏的
```

然后就是你将`.`当作命令。是的，你听我说过：`.`是个羽翼丰满的命令。它是`source` 的代名词 所以在当前shell中你可以用它来执行一个文件，而不是以某些方法去运行一个脚本文件（这样通常指的是Bash会产生一个新的shell去运行它）


很困惑？别担心 -- 试试这个：创建一个名为 _myscript_ 的脚本，内容包含下面一行

```
myvar="Hello"
```


然后通过常规的方法执行它，也就是用 `sh myscript`（或者通过 `chmod a+x myscript` 命令让它可执行，然后运行`./myscript`）。现在尝试并且观察`myvar` 的内容 ，通过`echo $myvar` （理所当然的你什么也得不到）。那是因为，当你的脚本赋值“_Hello_”给`myvar`时，它是在一个隔离的bash shell实例中进行的。当脚本运行结束时，这个新产生的实例会消失并且控制权转交给原来的shell，而原来的shell甚至都不存在`myvar` 变量。


然而，如果你这样运行 _myscript_ :
```
. myscript
```


`echo $myvar` 就会打印 _Hello_ 到命令行上。

当你的 _.bashrc_ 文件发生变化后，你经常会用到`.` (或 `source`) 命令， [就像当你要扩展 `PATH` 变量那样][1] ，在你的当前shell实例中，你使用`.`来让变化立即生效。

### 双重麻烦

就像看似无关紧要的一个点有多个含义一样，两个点也是如此。除了指向当前目录的父级之外，两个点（`..`）也用于构建序列。


尝试下这个：
```
echo {1..10}
```

它会打印出从1到10的序列。这种场景下，`..` 表示 “_从左边的值开始，计数到右边的值_”.

现在试下这个：
```
echo {1..10..2}
```

你会得到 _1 3 5 7 9_ 。`..2`这部分命令告诉Bash输出这个序列，不过不是每个相差1，而是相差2。换句话说，就是你会得到从1到10之间的奇数。

反着它也仍然有效：
```
echo {10..1..2}
```


你也可以用多个0填充你的数字。这样：

```
echo {000..121..2}
```

会这样打印出从0到121之间的偶数：

```
000 002 004 006 ... 050 052 054 ... 116 118 120
```


不过这样的序列发生器怎样才有作用呢？当然，假设您的新年决心之一是对您的帐户更加谨慎。 作为其中一部分，您需要创建目录，以便对过去10年的数字发票进行分类：

```
mkdir {2009..2019}_Invoices
```

工作完成。


或者你可能有数百个带编号的文件，比如从视频剪辑中提取的帧，无论出于什么原因，你只想删除第43帧和第61帧之间的每隔三帧：
```
rm frame_{043..61..3}
```


很可能，如果你有超过100帧，它们将以填充0命名，如下所示：

```
frame_000 frame_001 frame_002 ...
```

那就是为什么你要用 `043` 在你的命令中，而不是`43` 的原因。

### Curly~Wurly



说实话，序列的神奇之处不在于双点，就像花括号（`{}`）的巫术一样。 看看它对于字母是如何工作的。这样做：

```
touch file_{a..z}.txt
```


创建了从 _file_a.txt_ 到 _file_z.txt_ 的文件。


但是，你必须小心。 使用像`{Z..a}`这样的序列将运行大量字母和小写字母之间的一堆非字母数字字符（既不是数字或字母的字形）。 其中一些字形是不可打印的或具有自己的特殊含义。 使用它们来生成文件名称可能会导致一系列意外和可能令人不快的影响。

最后一件值得指出的事：包围在`{...}`的序列，它们也可以包含字符串的列举：

```
touch {blahg, splurg, mmmf}_file.txt
```

创建了 _blahg_file.txt_ , _splurg_file.txt_ and _mmmf_file.txt_.


当然，在别的场景中，大括号也有不同的含义（惊喜！）。不过那是别的文章的内容了。

### 总结


系统管理员开发Bash和你可以在上面使用的工具集已有数十载，他们仍在寻找着解决各种特殊问题的方法。要说系统管理员和他们的方式是他们自己的特殊品味将是轻描淡写。总而言之，与其他语言相反，Bash的设计并不是用户友好，简单甚至合乎逻辑的。

这并不意味着它不强大 -- 恰恰相反。 Bash的语法和shell工具可能不一致且庞大，但它们也提供了一系列令人眼花缭乱的方法来完成您可能想象到的一切。 就像有一个工具箱，你可以找到从电钻到勺子的所有东西，以及橡皮鸭，一卷胶带和一些指甲钳。


除了引人入胜之外，发现你可以直接在shell中实现的所有内容也很有趣，所以下次我们将深入探讨如何构建更大更好的Bash命令行。

在那之前，玩得开心！
--------------------------------------------------------------------------------

via: https://www.linux.com/blog/learn/2019/1/linux-tools-meaning-dot

作者：[Paul Brown][a]
选题：[lujun9972][b]
译者：[asche910](https://github.com/asche910)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.linux.com/users/bro66
[b]: https://github.com/lujun9972
[1]: https://www.linux.com/blog/learn/2018/12/bash-variables-environmental-and-otherwise

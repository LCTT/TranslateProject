[#]: collector: (lujun9972)
[#]: translator: (MjSeven)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11344-1.html)
[#]: subject: (Working with variables on Linux)
[#]: via: (https://www.networkworld.com/article/3387154/working-with-variables-on-linux.html#tk.rss_all)
[#]: author: (Sandra Henry-Stocker https://www.networkworld.com/author/Sandra-Henry_Stocker/)

在 Linux 中使用变量
======

> 变量通常看起来像 `$var` 这样，但它们也有 `$1`、`$*`、`$?` 和 `$$` 这种形式。让我们来看看所有这些 `$` 值可以告诉你什么。

![](https://img.linux.net.cn/data/attachment/album/201909/15/105140faf2jzyybubu1d0c.jpg)

有许多重要的值都存储在 Linux 系统中，我们称为“变量”，但实际上变量有几种类型，并且一些有趣的命令可以帮助你使用它们。在上一篇文章中，我们研究了[环境变量][2]以及它们定义在何处。在本文中，我们来看一看在命令行和脚本中使用的变量。

### 用户变量

虽然在命令行中设置变量非常容易，但是有一些有趣的技巧。要设置变量，你只需这样做：

```
$ myvar=11
$ myvar2="eleven"
```

要显示这些值，只需这样做：

```
$ echo $myvar
11
$ echo $myvar2
eleven
```

你也可以使用这些变量。例如，要递增一个数字变量，使用以下任意一个命令：

```
$ myvar=$((myvar+1))
$ echo $myvar
12
$ ((myvar=myvar+1))
$ echo $myvar
13
$ ((myvar+=1))
$ echo $myvar
14
$ ((myvar++))
$ echo $myvar
15
$ let "myvar=myvar+1"
$ echo $myvar
16
$ let "myvar+=1"
$ echo $myvar
17
$ let "myvar++"
$ echo $myvar
18
```

使用其中的一些，你可以增加一个变量的值。例如：

```
$ myvar0=0
$ ((myvar0++))
$ echo $myvar0
1
$ ((myvar0+=10))
$ echo $myvar0
11
```

通过这些选项，你可能会发现它们是容易记忆、使用方便的。

你也可以*删除*一个变量 -- 这意味着没有定义它。

```
$ unset myvar
$ echo $myvar
```

另一个有趣的选项是，你可以设置一个变量并将其设为**只读**。换句话说，变量一旦设置为只读，它的值就不能改变（除非一些非常复杂的命令行魔法才可以）。这意味着你也不能删除它。

```
$ readonly myvar3=1
$ echo $myvar3
1
$ ((myvar3++))
-bash: myvar3: readonly variable
$ unset myvar3
-bash: unset: myvar3: cannot unset: readonly variable
```

你可以使用这些设置和递增选项中来赋值和操作脚本中的变量，但也有一些非常有用的*内部变量*可以用于在脚本中。注意，你无法重新赋值或增加它们的值。

### 内部变量

在脚本中可以使用很多变量来计算参数并显示有关脚本本身的信息。

* `$1`、`$2`、`$3` 等表示脚本的第一个、第二个、第三个等参数。
* `$#` 表示参数的数量。
* `$*` 表示所有参数。
* `$0` 表示脚本的名称。
* `$?` 表示先前运行的命令的返回码（0 代表成功）。
* `$$` 显示脚本的进程 ID。
* `$PPID` 显示 shell 的进程 ID（脚本的父进程）。

其中一些变量也适用于命令行，但显示相关信息：

* `$0` 显示你正在使用的 shell 的名称（例如，-bash）。
* `$$` 显示 shell 的进程 ID。
* `$PPID` 显示 shell 的父进程的进程 ID（对我来说，是 sshd）。

为了查看它们的结果，如果我们将所有这些变量都放入一个脚本中，比如：

```
#!/bin/bash

echo $0
echo $1
echo $2
echo $#
echo $*
echo $?
echo $$
echo $PPID
```

当我们调用这个脚本时，我们会看到如下内容：

```
$ tryme one two three
/home/shs/bin/tryme     <== 脚本名称
one                     <== 第一个参数
two                     <== 第二个参数
3                       <== 参数的个数
one two three           <== 所有的参数
0                       <== 上一条 echo 命令的返回码
10410                   <== 脚本的进程 ID
10109                   <== 父进程 ID
```

如果我们在脚本运行完毕后检查 shell 的进程 ID，我们可以看到它与脚本中显示的 PPID 相匹配：

```
$ echo $$
10109                   <== shell 的进程 ID
```

当然，比起简单地显示它们的值，更有用的方式是使用它们。我们来看一看它们可能的用处。

检查是否已提供参数：

```
if [ $# == 0 ]; then
    echo "$0 filename"
    exit 1
fi
```

检查特定进程是否正在运行：

```
ps -ef | grep apache2 > /dev/null
if [ $? != 0 ]; then
    echo Apache is not running
    exit
fi
```

在尝试访问文件之前验证文件是否存在：

```
if [ $# -lt 2 ]; then
    echo "Usage: $0 lines filename"
    exit 1
fi

if [ ! -f $2 ]; then
    echo "Error: File $2 not found"
    exit 2
else
    head -$1 $2
fi
```

在下面的小脚本中，我们检查是否提供了正确数量的参数、第一个参数是否为数字，以及第二个参数代表的文件是否存在。

```
#!/bin/bash

if [ $# -lt 2 ]; then
    echo "Usage: $0 lines filename"
    exit 1
fi

if [[ $1 != [0-9]* ]]; then
    echo "Error: $1 is not numeric"
    exit 2
fi

if [ ! -f $2 ]; then
    echo "Error: File $2 not found"
    exit 3
else
    echo top of file
    head -$1 $2
fi
```

### 重命名变量

在编写复杂的脚本时，为脚本的参数指定名称通常很有用，而不是继续将它们称为 `$1`、`$2` 等。等到第 35 行，阅读你脚本的人可能已经忘了 `$2` 表示什么。如果你将一个重要参数的值赋给 `$filename` 或 `$numlines`，那么他就不容易忘记。

```
#!/bin/bash

if [ $# -lt 2 ]; then
    echo "Usage: $0 lines filename"
    exit 1
else
    numlines=$1
    filename=$2
fi

if [[ $numlines != [0-9]* ]]; then
    echo "Error: $numlines is not numeric"
    exit 2
fi

if [ ! -f $ filename]; then
    echo "Error: File $filename not found"
    exit 3
else
    echo top of file
    head -$numlines $filename
fi
```

当然，这个示例脚本只是运行 `head` 命令来显示文件中的前 x 行，但它的目的是显示如何在脚本中使用内部参数来帮助确保脚本运行良好，或在失败时清晰地知道失败原因。

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3387154/working-with-variables-on-linux.html

作者：[Sandra Henry-Stocker][a]
选题：[lujun9972][b]
译者：[MjSeven](https://github.com/MjSeven)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Sandra-Henry_Stocker/
[b]: https://github.com/lujun9972
[1]: https://images.idgesg.net/images/article/2019/04/variable-key-keyboard-100793080-large.jpg
[2]: https://linux.cn/article-10916-1.html
[3]: https://www.youtube.com/playlist?list=PL7D2RMSmRO9J8OTpjFECi8DJiTQdd4hua
[4]: https://www.facebook.com/NetworkWorld/
[5]: https://www.linkedin.com/company/network-world

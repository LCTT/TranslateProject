Bash 中使用控制运算符连接命令
======

> 在命令行中，使用控制运算符为复合命令添加逻辑。

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/osdc-lead-yearbook-best-couple.png?itok=a_99oCdE)

经常会使用一些简单的复合指令，比如说在一个命令行中连接几个命令。这些命令使用分号分隔，表示一个命令结束。为了在一个命令行中创建一系列简单的 shell 命令，只需要使用分号把每一条命令分隔开，就像下面这样：

```
command1 ; command2 ; command3 ; command4 ;
```

最后一个分号你可以不用添加，因为当你按下回车键时就表示一个命令的结束，但是为了和其它的保持一致，还是建议加上比较好。

所有的命令执行都没有什么问题 —— 只要没有什么意外发生。但是当出问题时到底发生了什么呢？我们可以预测，并且通过 Bash 中内置的 `&&` 和 `||` 运算符跟踪这些错误。这两个控制运算符提供了一些流控制，可以让我们改变代码执行队列的顺序。分号和换行符也被认为是 Bash 的控制运算符。

`&&` 运算符意义简单来说就是“如果 `command1` 执行成功，就接着执行 `command2`。”如果 `command1` 因为任何原因执行失败，那么 `command2` 将不执行。这个语法看下来像这样：

```
command1 && command2
```

这样写是允许的，因为每一个命令都会返回一个值（RC）给 shell 来表示这个命令在执行的过程中是否执行成功或者失败。通常，返回值是 `0` 表示成功，而一个正数值表示不同种类的错误。有一些系统管理工具仅仅返回一个 `1` 来表示所有的错误，但是也有很多工具使用其它的正数的返回值来表示各种类型错误。

我们可以很容易的使用脚本来检查 shell 变量 `$?`，可以通过命令列表中的下一个命令，或者可以直接使用系统管理工具检查。我们一起来看这些返回值。运行一个简单的命令然后立即检查它的返回值，这个返回值始终是属于最后一个运行的命令。

```
[student@studentvm1 ~]$ ll ; echo "RC = $?"
total 284
-rw-rw-r--  1 student student   130 Sep 15 16:21 ascii-program.sh
drwxrwxr-x  2 student student  4096 Nov 10 11:09 bin
<snip>
drwxr-xr-x. 2 student student  4096 Aug 18 10:21 Videos
RC = 0
[student@studentvm1 ~]$
```

这个返回值是 `0`，表示这个命令执行成功了。现在尝试使用同样的命令在一些我们没有权限的目录上。

```
[student@studentvm1 ~]$ ll /root ; echo "RC = $?"
ls: cannot open directory '/root': Permission denied
RC = 2
[student@studentvm1 ~]$
```

这个返回值的含义可以在 [ls 命令的 man 页面][1] 中找到。

现在我们来试试 `&&` 这个控制运算符，因为它也可能会被用在一个命令行程序中。我们将从一个简单的示例开始：创建一个新目录，如果创建成功就在这个目录中创建一个文件。

我们需要一个目录可以创建其它的目录。首先，在你的家目录中创建一个临时的目录用来做测试。

```
[student@studentvm1 ~]$ cd ; mkdir testdir
```

在 `~/testdir` 中新建一个目录，这也应该是一个空目录，因为是你刚刚创建的，然后创建一个新的空文件在这个新目录中。下面的命令可以做这些事情。

```
[student@studentvm1 ~]$ mkdir ~/testdir/testdir2 && touch ~/testdir/testdir2/testfile1
[student@studentvm1 ~]$ ll ~/testdir/testdir2/
total 0
-rw-rw-r-- 1 student student 0 Nov 12 14:13 testfile1
[student@studentvm1 ~]$
```

我们看到一切都运行得很好，因为 `testdir` 目录是访问且可写的。然后我们改变 `testdir` 目录的权限，让用户 `student` 不再具有访问的权限。操作如下：

```
[student@studentvm1 ~]$ chmod 076 testdir ; ll | grep testdir
d---rwxrw-. 3 student student  4096 Nov 12 14:13 testdir
[student@studentvm1 ~]$
```

在长列表（`ll`）命令后面使用 `grep` 命令来列出 `testdir` 目录。你可以看到用户 `student` 不再有 `testdir` 目录的访问权限。现在我们像之前一样运行同样的命令，但是在 `testdir` 目录中创建的是一个不同的目录。

```
[student@studentvm1 ~]$ mkdir ~/testdir/testdir3 && touch ~/testdir/testdir3/testfile1
mkdir: cannot create directory ‘/home/student/testdir/testdir3’: Permission denied
[student@studentvm1 ~]$
```

尽管我们也同样得到了一个错误的消息，但 `&&` 控制运算符阻止了 `touch` 命令的运行，因为在创建 `testdir3` 目录的时候发生了错误。通过这种复合的流控制可以阻止一些错误的发生使事情变乱。但是这样看起来变得稍微复杂了一些。

`||` 控制运算符允许添加另一个命令，这个命令在初始程序语句返回值大于 0 时执行。

```
[student@studentvm1 ~]$ mkdir ~/testdir/testdir3 && touch ~/testdir/testdir3/testfile1 || echo "An error occurred while creating the directory."
mkdir: cannot create directory ‘/home/student/testdir/testdir3’: Permission denied
An error occurred while creating the directory.
[student@studentvm1 ~]$
```

当我们使用 `&&` 和 `||` 控制运算符时，使用流控制的复合命令的语法格式通常是下面这样的形式。

```
preceding commands ; command1 && command2 || command3 ; following commands
```

使用控制运算符的复合命令可以在其它命令之前或者之后，这些和控制运算符流控制有关系，但是不受控制运算符流控制的影响。如果不考虑复合命令的流控制中发生的任何事情那么所有的命令都将执行。

当程序出问题时，这些流控制运算符使得在命令中处理出错和通知我们变得更有效率。我直接在命令行中使用它们，也在脚本中使用。

你可以以 root 用户的身份来删除这个目录和它里面的内容。

```
[root@studentvm1 ~]# rm -rf /home/student/testdir
```

你是怎样使用 Bash 控制运算符的呢？在评论区中告诉我们。

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/11/control-operators-bash-shell

作者：[David Both][a]
选题：[lujun9972][b]
译者：[Jamskr](https://github.com/Jamskr)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/dboth
[b]: https://github.com/lujun9972
[1]: http://man7.org/linux/man-pages/man1/ls.1.html

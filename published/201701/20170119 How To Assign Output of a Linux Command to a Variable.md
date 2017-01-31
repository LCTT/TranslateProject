如何将 Linux 命令的输出赋值给变量
==================================

运行一条命令时，它都会产生某种输出：要么是该命令的期望结果，或者是该命令执行细节的状态/错误消息。有些时候，你可能想要将某个命令的输出内容存储在一个变量中，以待在后续操作中取出来使用。

本文将介绍将 shell 命令赋值给变量的不同方法，这对于 shell 脚本编程是特别有用的。

可以使用如下形式的 shell 命令置换特性，将命令的输出存储到变量中：

```
变量名=$(命令)
变量名=$(命令 [命令选项 ...] 参数1 参数2 ...)
或者：
变量名='命令'
变量名='命令 [命令选项 ...] 参数1 参数2 ...'
```

以下是使用命令置换特性的示例：

本例，我们将 `who` (显示当前登录系统的用户) 的输出值存储到 `CURRENT_USERS` 变量中：

```
$ CURRENT_USERS=$(who)
```

然后，我们可以使用 [echo 命令][1] 显示一个句子并使用上述变量，如下：

```
$ echo -e "以下为登录到系统中的用户：\n\n $CURRENT_USERS"
```

上面的命令中：`-e` 标记表示解释所有的转义序列 (如 `\n` 为换行)。为节约时间和内存，通常在 [echo 命令][2] 中直接使用命令置换特性，如下：

```
$ echo -e "以下为登录到系统中的用户：\n\n $(who)"
```

[![显示当前登录系统的用户](http://www.tecmint.com/wp-content/uploads/2017/01/Shows-Current-Logged-Users-in-Linux.png)][3]

*在 Linux 中显示当前登录系统的用户*

接下来，为了演示上面提到的第二种形式，我们以把当前工作目录下文件数存储到变量 `FILES` ，然后使用 **echo** 来输出，如下：

```
$ FILES=`sudo find . -type f -print | wc -l`
$ echo "当前目录有 $FILES 个文件。"
```
[![显示目中包含文件的数量](http://www.tecmint.com/wp-content/uploads/2017/01/Show-Number-of-Files-in-Directory.png)][4]

*显示目中包含文件的数量*

就是这些了。我们展示了将 shell 命令的输出赋值给变量的方法。你可以在下边的评论反馈区留下你的想法。

---------------------------------------------------------

作者简介：

![](http://1.gravatar.com/avatar/4e444ab611c7b8c7bcb76e58d2e82ae0?s=128&d=blank&r=g)

Aaron Kili 是一名 Linux 和 F.O.S.S 忠实拥护者、未来的 Linux 系统管理员、Web 开发者，目前是 TecMint 的原创作者，热衷于计算机并乐于知识分享。
译者简介：

![GHLandy](http://GHLandy.com/images/GHLandy.ico)

[GHLandy](http://GHLandy.com) —— 欲得之，则为之奋斗 (If you want it, work for it.)。

------------------------------------------------

via: http://www.tecmint.com/assign-linux-command-output-to-variable/

作者：[Aaron Kili][a]
译者：[GHLandy](https://github.com/GHLandy)
校对：[jasminepeng](https://github.com/jasminepeng)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/aaronkili/
[1]:http://www.tecmint.com/echo-command-in-linux/
[2]:http://www.tecmint.com/echo-command-in-linux/
[3]:http://www.tecmint.com/wp-content/uploads/2017/01/Shows-Current-Logged-Users-in-Linux.png
[4]:http://www.tecmint.com/wp-content/uploads/2017/01/Show-Number-of-Files-in-Directory.png

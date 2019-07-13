[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10918-1.html)
[#]: subject: (Aliases: To Protect and Serve)
[#]: via: (https://www.linux.com/blog/learn/2019/1/aliases-protect-and-serve)
[#]: author: (Paul Brown https://www.linux.com/users/bro66)

命令别名：保护和服务
======

> Linux shell 允许你将命令彼此链接在一起，一次触发执行复杂的操作，并且可以对此创建别名作为快捷方式。

![](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/prairie-path_1920.jpg?itok=wRARsM7p)

让我们将继续我们的别名系列。到目前为止，你可能已经阅读了我们的[关于别名的第一篇文章][1]，并且应该非常清楚它们是如何为你省去很多麻烦的最简单方法。例如，你已经看到它们帮助我们减少了输入，让我们看看别名派上用场的其他几个案例。

### 别名即快捷方式

Linux shell 最美妙的事情之一是可以使用数以万计的选项和把命令连接在一起执行真正复杂的操作。好吧，也许这种美丽是在旁观者的眼中的，但是我们觉得这个功能很实用。

不利的一面是，你经常需要记得难以记忆或难以打字出来的命令组合。比如说硬盘上的空间非常宝贵，而你想要做一些清洁工作。你的第一步可能是寻找隐藏在你的家目录里的东西。你可以用来判断的一个标准是查找不再使用的内容。`ls` 可以帮助你：

```
ls -lct
```

上面的命令显示了每个文件和目录的详细信息（`-l`），并显示了每一项上次访问的时间（`-c`），然后它按从最近访问到最少访问的顺序排序这个列表（`-t`）。

这难以记住吗？你可能不会每天都使用 `-c` 和 `-t` 选项，所以也许是吧。无论如何，定义一个别名，如：

```
alias lt='ls -lct'
```

会更容易一些。

然后，你也可能希望列表首先显示最旧的文件：

```
alias lo='lt -F | tac'
```

![aliases][3]

*图 1：使用 lt 和 lo 别名。*

这里有一些有趣的事情。首先，我们使用别名（`lt`）来创建另一个别名 —— 这是完全可以的。其次，我们将一个新参数传递给 `lt`（后者又通过 `lt` 别名的定义传递给了 `ls`）。

`-F` 选项会将特殊符号附加到项目的名称后，以便更好地区分常规文件（没有符号）和可执行文件（附加了 `*`）、目录文件（以 `/` 结尾），以及所有链接文件、符号链接文件（以 `@` 符号结尾）等等。`-F` 选项是当你回归到单色终端的日子里，没有其他方法可以轻松看到列表项之间的差异时用的。在这里使用它是因为当你将输出从 `lt` 传递到 `tac` 时，你会丢失 `ls` 的颜色。

第三件我们需要注意的事情是我们使用了管道。管道用于你将一个命令的输出传递给另外一个命令时。第二个命令可以使用这些输出作为它的输入。在包括 Bash 在内的许多 shell 里，你可以使用管道符（`|`） 来做传递。

在这里，你将来自 `lt -F` 的输出导给 `tac`。`tac` 这个命令有点玩笑的意思，你或许听说过 `cat` 命令，它名义上用于将文件彼此连接（con`cat`），而在实践中，它被用于将一个文件的内容打印到终端。`tac` 做的事情一样，但是它是以逆序将接收到的内容输出出来。明白了吗？`cat` 和 `tac`，技术人有时候也挺有趣的。

`cat` 和 `tac` 都能输出通过管道传递过来的内容，在这里，也就是一个按时间顺序排序的文件列表。

那么，在有些离题之后，最终我们得到的就是这个列表将当前目录中的文件和目录以新鲜度的逆序列出（即老的在前）。

最后你需要注意的是，当在当前目录或任何目录运行 `lt` 时：

```
# 这可以工作：
lt
# 这也可以：
lt /some/other/directory
```

……而 `lo` 只能在当前目录奏效：

```
# 这可工作：
lo
# 而这不行：
lo /some/other/directory
```

这是因为 Bash 会展开别名的组分。当你键入：

```
lt /some/other/directory
```

Bash 实际上运行的是：

```
ls -lct /some/other/directory
```

这是一个有效的 Bash 命令。

而当你键入：

```
lo /some/other/directory
```

Bash 试图运行：

```
ls -lct -F | tac /some/other/directory
```

这不是一个有效的命令，主要是因为 `/some/other/directory` 是个目录，而 `cat` 和 `tac` 不能用于目录。

### 更多的别名快捷方式

  * `alias lll='ls -R'` 会打印出目录的内容，并深入到子目录里面打印子目录的内容，以及子目录的子目录，等等。这是一个查看一个目录下所有内容的方式。
  * `mkdir='mkdir -pv'` 可以让你一次性创建目录下的目录。按照 `mkdir` 的基本形式，要创建一个包含子目录的目录，你必须这样：

```
mkdir newdir
mkdir newdir/subdir
```

或这样：

```
mkdir -p newdir/subdir
```

而用这个别名你将只需要这样就行：

```
mkdir newdir/subdir
```

你的新 `mkdir` 也会告诉你创建子目录时都做了什么。

### 别名也是一种保护

别名的另一个好处是它可以作为防止你意外地删除或覆写已有的文件的保护措施。你可能听说过这个 Linux 新用户的传言，当他们以 root 身份运行：

```
rm -rf /
```

整个系统就爆了。而决定输入如下命令的用户：

```
rm -rf /some/directory/ *
```

就很好地干掉了他们的家目录的全部内容。这里不小心键入的目录和 `*` 之间的那个空格有时候很容易就会被忽视掉。

这两种情况我们都可以通过 `alias rm='rm -i'` 别名来避免。`-i` 选项会使 `rm` 询问用户是否真的要做这个操作，在你对你的文件系统做出不可弥补的损失之前给你第二次机会。

对于 `cp` 也是一样，它能够覆盖一个文件而不会给你任何提示。创建一个类似 `alias cp='cp -i'` 来保持安全吧。

### 下一次

我们越来越深入到了脚本领域，下一次，我们将沿着这个方向，看看如何在命令行组合命令以给你真正的乐趣，并可靠地解决系统管理员每天面临的问题。


--------------------------------------------------------------------------------

via: https://www.linux.com/blog/learn/2019/1/aliases-protect-and-serve

作者：[Paul Brown][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.linux.com/users/bro66
[b]: https://github.com/lujun9972
[1]: https://linux.cn/article-10377-1.html
[2]: https://www.linux.com/files/images/fig01png-0
[3]: https://www.linux.com/sites/lcom/files/styles/rendered_file/public/fig01_0.png?itok=crqTm_va (aliases)
[4]: https://www.linux.com/licenses/category/used-permission

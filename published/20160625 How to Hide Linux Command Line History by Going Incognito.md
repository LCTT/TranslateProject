如何隐藏你的 Linux 的命令行历史
================================================================

![](https://maketecheasier-2d0f.kxcdn.com/assets/uploads/2016/06/commandline-history-featured.jpg)

如果你是 Linux 命令行的用户，有的时候你可能不希望某些命令记录在你的命令行历史中。原因可能很多，例如，你在公司担任某个职位，你有一些不希望被其它人滥用的特权。亦或者有些特别重要的命令，你不希望在你浏览历史列表时误执行。

然而，有方法可以控制哪些命令进入历史列表，哪些不进入吗？或者换句话说，我们在 Linux 终端中可以开启像浏览器一样的无痕模式吗？答案是肯定的，而且根据你想要的具体目标，有很多实现方法。在这篇文章中，我们将讨论一些行之有效的方法。

注意：文中出现的所有命令都在 Ubuntu 下测试过。

### 不同的可行方法

前面两种方法已经在之前[一篇文章][1]中描述了。如果你已经了解，这部分可以略过。然而，如果你不了解，建议仔细阅读。

#### 1. 在命令前插入空格

是的，没看错。在命令前面插入空格，这条命令会被 shell 忽略，也就意味着它不会出现在历史记录中。但是这种方法有个前提，只有在你的环境变量 `HISTCONTROL` 设置为 "ignorespace" 或者 "ignoreboth" 才会起作用。在大多数情况下，这个是默认值。

所以，像下面的命令（LCTT 译注：这里`[space]`表示输入一个空格）：

```
[space]echo "this is a top secret"
```

如果你之前执行过如下设置环境变量的命令，那么上述命令不会出现在历史记录中。

```
export HISTCONTROL = ignorespace
```

下面的截图是这种方式的一个例子。

![](https://maketecheasier-2d0f.kxcdn.com/assets/uploads/2016/06/commandline-history-bash-command-space.png)

第四个 "echo" 命令因为前面有空格，它没有被记录到历史中。

#### 2. 禁用当前会话的所有历史记录

如果你想禁用某个会话所有历史，你可以在开始命令行工作前简单地清除环境变量 HISTFILESIZE 的值即可。执行下面的命令来清除其值：

```
export HISTFILESIZE=0
```

HISTFILESIZE 表示对于 bash 会话其历史文件中可以保存命令的个数（行数）。默认情况，它设置了一个非零值，例如在我的电脑上，它的值为 1000。

所以上面所提到的命令将其值设置为 0，结果就是直到你关闭终端，没有东西会存储在历史记录中。记住同样你也不能通过按向上的箭头按键或运行 history 命令来看到之前执行的命令。

#### 3. 工作结束后清除整个历史

这可以看作是前一部分所提方案的另外一种实现。唯一的区别是在你完成所有工作之后执行这个命令。下面是刚说到的命令：

```
history -cw
```

刚才已经提到，这个和 HISTFILESIZE 方法有相同效果。

#### 4. 只针对你的工作关闭历史记录

虽然前面描述的方法（2 和 3）可以实现目的，它们可以清除整个历史，在很多情况下，有些可能不是我们所期望的。有时候你可能想保存直到你开始命令行工作之间的历史记录。对于这样的需求，你开始在工作前执行下述命令：

```
[space]set +o history
```

备注：[space] 表示空格。并且由于空格的缘故，该命令本身也不会被记录。

上面的命令会临时禁用历史功能，这意味着在这命令之后你执行的所有操作都不会记录到历史中，然而这个命令之前的所有东西都会原样记录在历史列表中。

要重新开启历史功能，执行下面的命令：

```
[Space]set -o history
```

它将环境恢复原状，也就是你完成了你的工作，执行上述命令之后的命令都会出现在历史中。

#### 5. 从历史记录中删除指定的命令

现在假设历史记录中已经包含了一些你不希望记录的命令。这种情况下我们怎么办？很简单。直接动手删除它们。通过下面的命令来删除：

```
history | grep "part of command you want to remove"
```

上面的命令会输出历史记录中匹配的命令，每一条前面会有个数字。

一旦你找到你想删除的命令，执行下面的命令，从历史记录中删除那个指定的项：

```
history -d [num]
```

下面是这个例子的截图。

![](https://maketecheasier-2d0f.kxcdn.com/assets/uploads/2016/06/commandline-history-delete-specific-commands.png)

第二个 ‘echo’命令被成功的删除了。

（LCTT 译注：如果你不希望上述命令本身也被记录进历史中，你可以在上述命令前加个空格）

同样的，你可以使用向上的箭头一直往回翻看历史记录。当你发现你感兴趣的命令出现在终端上时，按下 “Ctrl + U”清除整行，也会从历史记录中删除它。

### 总结

有多种不同的方法可以操作 Linux 命令行历史来满足你的需求。然而请记住，从历史中隐藏或者删除命令通常不是一个好习惯，尽管本质上这并没有错。但是你必须知道你在做什么，以及可能产生的后果。

--------------------------------------------------------------------------------

via: https://www.maketecheasier.com/linux-command-line-history-incognito/

作者：[Himanshu Arora][a]
译者：[chunyang-wen](https://github.com/chunyang-wen)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.maketecheasier.com/author/himanshu/
[1]: https://www.maketecheasier.com/command-line-history-linux/






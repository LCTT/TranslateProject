为你在 Bash 历史中执行过的每一项命令设置时间和日期
============================================================

在默认情况下，所有通过 Bash 在命令行中执行过的命令都被存储在历史缓存区或者一个叫做 `~/.bash_history` 的文件里。这意味着系统管理员可以看到系统上用户执行过的命令清单，或者用户可以通过像 [history 命令][1]这样的选项来看他或她自己的命令历史。
```
$ history
```
[
 ![Linux History Command](http://www.tecmint.com/wp-content/uploads/2017/01/Linux-History-Command.png) 
][2]

*Linux 历史命令*

从上面 [history 命令][3]的输出可知，命令被执行的日期和时间并没有显示出来。基本上所有的 Linux 发行版的默认设置都是这样的。

在这篇文章里，我们将解释当在 Bash 中执行 `history` 命令显示每个命令时，如何配置显示时间戳信息。

每个命令相关的日期和时间可以记录到历史文件中，用 `HISTTIMEFORMAT` 环境变量的设置作为命令历史的备注记录。

这里有两种可行的方式来达到目的：一种是暂时的效果，一种是永久的效果。

要临时设置 `HISTTIMEFORMAT` 环境变量，在命令行这样输出它：

```
$ export HISTTIMEFORMAT='%F %T'
```

在上面的输出命令当中，时间戳格式如下：

1、`％F`－展开为完整日期，即 `％Y-％m-％d`（年-月-日）。

2、`％T`－展开为时间，即 `％H:％M:％S`（时:分:秒）。

通读 [date 命令][4]的 man 手册来获得更多使用说明：

```
$ man date
```

然后如下检查你的命令历史：

```
$ history 
```
[
 ![Display Linux Command History with Date and Time](http://www.tecmint.com/wp-content/uploads/2017/01/Set-Date-and-Time-on-Linux-Commands-History.png) 
][5]

*显示带有日期和时间的 Linux 命令历史。*

（LCTT 译注：注意：这个功能只能用在当 HISTTIMEFORMAT 这个环境变量被设置之后，之后的那些新执行的 bash 命令才会被打上正确的时间戳。在此之前的所有命令，都将会显示成设置 HISTTIMEFORMAT 变量的时间。）

然而，如果你想永久地配置该变量，用你最喜欢的编辑器打开文件 `~/.bashrc`。

```
$ vi ~/.bashrc
```

然后在下方添加（用注释将其标记为你自己的配置）：

```
# 我的配置
export HISTTIMEFORMAT='%F %T'
```

保存文件并退出，然后，运行下面的命令以便改动当即生效：

```
$ source ~/.bashrc
```

就是这些！请通过下方的评论区来与我们分享一些有趣的历史命令的小技巧以及你对这篇文章的想法。

--------------------------------------------------------------------------------

作者简介：

![](http://1.gravatar.com/avatar/7badddbc53297b2e8ed7011cf45df0c0?s=128&d=blank&r=g)

我是 Ravi Saive，TecMint 的创建者。一个爱在网上分享的技巧和提示的电脑极客和 Linux 专家。我的大多数服务器运行在名为 Linux 的开源平台上。请在 Twitter、 Facebook 和 Google 等上关注我。

--------------------------------------------------------------------------------

via: http://www.tecmint.com/display-linux-command-history-with-date-and-time/

作者：[Ravi Saive][a]
译者：[Hymantin](https://github.com/Hymantin)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/admin/
[1]:http://www.tecmint.com/history-command-examples/
[2]:http://www.tecmint.com/wp-content/uploads/2017/01/Linux-History-Command.png
[3]:http://www.tecmint.com/history-command-examples/
[4]:http://www.tecmint.com/sort-ls-output-by-last-modified-date-and-time/
[5]:http://www.tecmint.com/wp-content/uploads/2017/01/Set-Date-and-Time-on-Linux-Commands-History.png

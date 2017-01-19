Translating by Hymantin
Set Date and Time for Each Command You Execute in Bash History
为你在 Bash 历史中执行过的每一项指令设置时间和日期
============================================================

By default, all commands executed by Bash on the command line are stored in history buffer or recorded in a file called ~/.bash_history. This means that a system administrator can view a list of commands executed by users on the system or a user can view his/her command history using the [history command][1] like so.
在默认情况下，所有通过 Bash 在指令行中执行过的指令都被存储在历史缓存区或者一个叫做 ~/.bash_history 的文件里。这意味着系统管理员可以看到系统上用户执行过的指令清单或者用户可以通过像[历史指令][1]这样的选项来看他／她的指令历史。
```
$ history
```
[
 ![Linux History Command](http://www.tecmint.com/wp-content/uploads/2017/01/Linux-History-Command.png) 
][2]

Linux 历史指令

From the output of the [history command][3] above, the date and time when a command was executed is not shown. This is the default setting on most if not all Linux distributions.
从上面[历史指令][3]的输出可知，一个指令被执行的日期和时间并没有显示出来。这对大部分但非所有的 Linux 发行版是默认设置。
In this article, we will explain how you can configure time stamp information when each command in the Bash history was executed to be displayed.
在这篇文章里，我们将解释当每一项在 Bash 历史中被执行并展示的时候，你如何配置时间戳信息。
The date and time associated with each history entry can be written to the history file, marked with the history comment character by setting the HISTTIMEFORMAT variable.
每一次历史登入的日期和时间通过设置 HISTTIMEFORMAT 变量标记与历史注释字符都被写进了历史文件。
There are two possible ways of doing this: one does it temporarily while the other makes it permanent.
这里有两种可行的方式来达到目的：一种是暂时的效果，一种是永久的效果。
To set HISTTIMEFORMAT variable temporarily, export it as below on the command line:
为了设置 HISTTIMEFORMAT 为只读变量，输入以下指令：
```
$ export HISTTIMEFORMAT='%F %T'
```

In the export command above, the time stamp format:
在上面的输出指令当中，时间戳格式：

1.  `%F` – expands to full date same, as %Y-%m-%d (year-month-date).
1.‘％F’－拓展至完整日期，就像％Y－％m－％d（年－月－日）。
2.  `%T` – expands to time; same as %H:%M:%S (hour:minute:seconds).
2.‘％T’－拓展日期；就像％H：％M：％S（时：分：秒）。
Read through the [date command][4] man page for additional usage information:通读[时间指令][4]操作说明来获得更多使用说明：

```
$ man date
```

Then check your command history as follows:然后如下检查你的指令历史
```
$ history 
```
[
 ![Display Linux Command History with Date and Time](http://www.tecmint.com/wp-content/uploads/2017/01/Set-Date-and-Time-on-Linux-Commands-History.png) 
][5]

Display Linux Command History with Date and Time显示带有日期和时间的 Linux 指令历史。

However, if you want to configure this variable permanently, open the file `~/.bashrc` with your favorite editor:然而，如果你想将变量配置成永久的，用你最喜欢的编辑器打开文件 `~/.bashrc`。

```
$ vi ~/.bashrc
```

And add the line below in it (you mark it with a comment as your own configuration):然后在下方添加（你用注释标记为自己的配置）：
```
#my config
export HISTTIMEFORMAT='%F %T'
```

Save the file and exit, afterwards, run the command below to effect the changes made to the file:
保存文件并退出，然后，运行改变过的指令：
```
$ source ~/.bashrc
```

That’s all! Do share with us any interesting history command tips and tricks or your thoughts about this guide via the comment section below.就是这些！请通过下方的评论区来与我们分享一些有趣的历史指令的小技巧以及你对这份说明的想法。
--------------------------------------------------------------------------------

作者简介：

![](http://1.gravatar.com/avatar/7badddbc53297b2e8ed7011cf45df0c0?s=128&d=blank&r=g)

I am Ravi Saive, creator of TecMint. A Computer Geek and Linux Guru who loves to share tricks and tips on Internet. Most Of My Servers runs on Open Source Platform called Linux. Follow Me: Twitter, Facebook and Google+
我是 Ravi Saive，TecMint 的创建者。一个爱在网上分享的技巧和提示的电脑极客和 Linux 专家。我的服务器在 Linux 开放资源平台的大部分。请在 Twitter, Facebook 和 Google 等上关注我。
--------------------------------------------------------------------------------

via: http://www.tecmint.com/display-linux-command-history-with-date-and-time/

作者：[Ravi Saive][a]
译者：[Hymantin](https://github.com/Hymantin)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/admin/
[1]:http://www.tecmint.com/history-command-examples/
[2]:http://www.tecmint.com/wp-content/uploads/2017/01/Linux-History-Command.png
[3]:http://www.tecmint.com/history-command-examples/
[4]:http://www.tecmint.com/sort-ls-output-by-last-modified-date-and-time/
[5]:http://www.tecmint.com/wp-content/uploads/2017/01/Set-Date-and-Time-on-Linux-Commands-History.png

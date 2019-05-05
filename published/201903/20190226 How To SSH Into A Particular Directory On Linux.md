[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10618-1.html)
[#]: subject: (How To SSH Into A Particular Directory On Linux)
[#]: via: (https://www.ostechnix.com/how-to-ssh-into-a-particular-directory-on-linux/)
[#]: author: (SK https://www.ostechnix.com/author/sk/)

如何 SSH 登录到 Linux 上的特定目录
======

![](https://www.ostechnix.com/wp-content/uploads/2019/02/SSH-Into-A-Particular-Directory-720x340.png)

你是否遇到过需要 SSH 登录到远程服务器并立即 `cd` 到一个目录来继续交互式作业？你找对地方了！这个简短的教程描述了如何直接 SSH 登录到远程 Linux 系统的特定目录。而且不仅是 SSH 登录到特定目录，你还可以在连接到 SSH 服务器后立即运行任何命令。这些没有你想的那么难。请继续阅读。

### SSH 登录到远程系统的特定目录

在我知道这个方法之前，我通常首先使用以下命令 SSH 登录到远程系统：

```
$ ssh user@remote-system
```

然后如下 `cd` 进入某个目录：

```
$ cd <some-directory>
```

然而，你不需要使用两个单独的命令。你可以用一条命令组合并简化这个任务。

看看下面的例子。

```
$ ssh -t sk@192.168.225.22 'cd /home/sk/ostechnix ; bash'
```

上面的命令将通过 SSH 连接到远程系统 （192.168.225.22） 并立即进入名为 `/home/sk/ostechnix/` 的目录，并停留在提示符中。

这里，`-t` 标志用于强制分配伪终端，这是一个必要的交互式 shell。

以下是上面命令的输出：

![](https://www.ostechnix.com/wp-content/uploads/2019/02/ssh-1.gif)

你也可以使用此命令：

```
$ ssh -t sk@192.168.225.22 'cd /home/sk/ostechnix ; exec bash'
```

或者，

```
$ ssh -t sk@192.168.225.22 'cd /home/sk/ostechnix && exec bash -l'
```

这里，`-l` 标志将 bash 设置为登录 shell。

在上面的例子中，我在最后一个参数中使用了 `bash`。它是我的远程系统中的默认 shell。如果你不知道远程系统上的 shell 类型，请使用以下命令：

```
$ ssh -t sk@192.168.225.22 'cd /home/sk/ostechnix && exec $SHELL'
```

就像我已经说过的，它不仅仅是连接到远程系统后 `cd` 进入目录。你也可以使用此技巧运行其他命令。例如，以下命令将进入 `/home/sk/ostechnix/`，然后执行命令 `uname -a` 。

```
$ ssh -t sk@192.168.225.22 'cd /home/sk/ostechnix && uname -a && exec $SHELL'
```

或者，你可以在远程系统上的 `.bash_profile` 文件中添加你想在 SSH 登录后执行的命令。

编辑 `.bash_profile` 文件：

```
$ nano ~/.bash_profile
```

每个命令一行。在我的例子中，我添加了下面这行：

```
cd /home/sk/ostechnix >& /dev/null
```

保存并关闭文件。最后，运行以下命令更新修改。

```
$ source ~/.bash_profile
```

请注意，你应该在远程系统的 `.bash_profile` 或 `.bashrc` 文件中添加此行，而不是在本地系统中。从现在开始，无论何时登录（无论是通过 SSH 还是直接登录），`cd` 命令都将执行，你将自动进入 `/home/sk/ostechnix/` 目录。

就是这些了。希望这篇文章有用。还有更多好东西。敬请关注！

干杯!

--------------------------------------------------------------------------------

via: https://www.ostechnix.com/how-to-ssh-into-a-particular-directory-on-linux/

作者：[SK][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.ostechnix.com/author/sk/
[b]: https://github.com/lujun9972

实例学习 Linux 的 cd 命令，及对内部命令的解释
================================================================================

在 *nix 的世界里，cd 命令是最为基础的命令，它所做的是改变当前的工作目录。 本文将深入讲解关于 cd 的技术细节。

### cd 命令：一个内部命令

绝大多数的 Linux 发行版都将 Bash Shell 用作默认的 Shell。Bash 有一些自己内部的命令，cd 就是其中一个。我将会解释究竟什么是内部命令，以及为什么 cd 会是一个内部命令。

那么首先，请检查确认你的当前 shell 以及环境变量：

![](http://linoxide.com/wp-content/uploads/2013/12/01.cd_shell.png)

现在继续使用 which 命令来检查 cd 所在的路径：

![](http://linoxide.com/wp-content/uploads/2013/12/02.cd_which.png)

我们发现没有输出。因为在我们的系统中 cd 命令其实并没有对应某个 binary，但是我们却又仍然可以执行这个命令，这就是因为 cd 其实是 BASH 的一个内部命令。内部命令都是被整合进入 shell 里面的。接下来我们可以继续使用 type 命令来查看 cd 这个内部命令的更多信息。

![](http://linoxide.com/wp-content/uploads/2013/12/03.cd_type.png)

如果你尝试去查看内部命令的手册，会发现并没有为它们单独设置手册。

![](http://linoxide.com/wp-content/uploads/2013/12/04.cd_man.png)

对于这些内部命令来说，并没有创建单独的进程，因此它们执行起来非常快。

我们可以使用 help 命令来查看所有的内部命令（help 命令本身也是一个内部命令）：

![](http://linoxide.com/wp-content/uploads/2013/12/05.cd_help_1.png)

![](http://linoxide.com/wp-content/uploads/2013/12/06.cd_help_2.png)

### 为什么 cd 会是一个内部命令

让我们从简单的开始聊起吧。我不会说太多繁琐细节，但是想要弄明白这个问题，还是需要对 Unix 进程有一点了解。

不管 BASH 什么时候创建了一个进程，这个进程事实上都是在 BASH 的一个子 shell 中运行（也就是当前 BASH 进程的子进程）。这些新的进程会做一些改变，或是显示一些东西（如果需要的话），以及当这个进程死亡的时候，子 shell 并不会向当前 BASH 返回信息。请注意，cd 所做的是改变 shell 的 PWD。 因此倘若 cd 是一个外部命令，那么它改变的将会是子 shell 的 PWD，也不会向父 shell 返回任何东西。所以，当前 shell 的 PWD 就不会做任何改变。**所有能对当前 shell的环境作出改变的命令都必须是内部命令。** 因此如果我们将 cd 做成外部命令，就无法像原来一样改变当前目录了。

好了，现在让我们再来聊聊 cd 命令的用法。

### cd 命令的用法：

如果你不加任何参数地来使用 cd 命令，不管你现在在哪，都会把你带到**你的** home 目录下。

![](http://linoxide.com/wp-content/uploads/2013/12/07.cd_home.png)

其实波浪线符号（~）代表的也是 home 目录，我们同样可以用它回到 home（译注：通常用~配合其下的子目录名，来切换到自己home下的子目录，如：cd ~/Desktop）。

![](http://linoxide.com/wp-content/uploads/2013/12/08.cd_home_tilde.png)

如果你是 root 用户，你可以通过使用波浪号加任何一个用户名来切换到该用户的 home 目录下。在一些 Linux 发行版中，没有特权的用户默认是没有权限访问其他用户的 home 目录的。

![](http://linoxide.com/wp-content/uploads/2013/12/09.cd_home_user.png)

再来看，. 目录代表的是当前目录，而 .. 代表的是上级目录。所以我们可以使用 .. 来回到上级目录。

![](http://linoxide.com/wp-content/uploads/2013/12/10.cd_parent.png)

大部分情况下，cd . 是不会改变你的 PWD。举例来看：

![](http://linoxide.com/wp-content/uploads/2013/12/11.cd_dot.png)

但是如果你的当前目录已经被重命名了，那么你的 PWD 就会发生改变：

![](http://linoxide.com/wp-content/uploads/2013/12/12.cd_dot_renamed.png)

在 BASH 和大部分其他的 shell 中，你可以提供两种不同的路径：绝对路径和相对路径。绝对路径以 / 开始，并且和你的 PWD 无关。而相对路径不会以 / 开始，并且和你的 PWD 相关。

使用绝对路径来改变 PWD：

![](http://linoxide.com/wp-content/uploads/2013/12/13.cd_abs_path.png)

使用相对路径来改变 PWD：

![](http://linoxide.com/wp-content/uploads/2013/12/14cd_rel_path.png)

我们可以在两个目录切换：

cd - 命令可以返回上一次的工作目录，我们可以使用它在两个不同的目录中快速切换。

![](http://linoxide.com/wp-content/uploads/2013/12/15.cd_toggle.png)

我们上一次的工作目录会被储存在 OLDPWD 这个变量中。但是如果你在一个新开启的终端中来使用的话，会报出下面的错误：

![](http://linoxide.com/wp-content/uploads/2013/12/16.cd_OLDPWD_not_set.png)

![](http://linoxide.com/wp-content/uploads/2013/12/16.cd_OLDPWD_not_set.png)

你可以配合 cd 命令来使用一些 bash 小技巧。

比如，不妨使用 *?* 这个万能药：

![](http://linoxide.com/wp-content/uploads/2013/12/17.cd_question_mark_wild_card.png)

使用 *：

![](http://linoxide.com/wp-content/uploads/2013/12/18.cd_star_wild_card.png)

--------------------------------------------------------------------------------

via: http://linoxide.com/linux-command/linux-cd-command-examples/

译者：[ailurus1991](https://github.com/ailurus1991) 校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出


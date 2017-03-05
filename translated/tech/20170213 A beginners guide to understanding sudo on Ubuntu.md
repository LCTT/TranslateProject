
一份关于理解 Ubuntu 上 sudo 的初学者指导
============================================================

### 在这页面上

1.  [什么是 sudo?][4]
2.  [任何用户都能用  sudo 吗？][5]
3.  [什么是一个 sudo 会话?][6]
4.  [sudo 密码][7]
5.  [一些重要的  sudo 命令行参数][8]
    1.  [ -k 参数][1]
    2.  [-s 参数][2]
    3.  [-i 参数][3]
6.  [总结][9]

曾经在你使用 Linux 命令行时提示“拒绝访问”的错误？这可能是你正在尝试做一个需要根权限的命令。例如，下面的截图展示了当我正在尝试复制一个二进制文件到一个系统目录时显示的错误。

[
 ![shell 的拒绝访问](https://www.howtoforge.com/images/sudo-beginners-guide/perm-denied-error.png) 
][11]

所以该怎么解决这个错误？很简单，使用 ** sudo ** 命令。

[
 ![用 sudo 运行命令](https://www.howtoforge.com/images/sudo-beginners-guide/sudo-example.png) 
][12]

正在运行命令的用户被提示需要他们的登录密码。一旦输入了正确的密码，操作将会成功执行。

毫无疑问，sudo 是任何在 Linux 上使用命令行的人所必须知道的命令。但是，为了更负责有效地使用命令，你还是得知道一些相关（深入）的细节。这正是我们将会在这篇文章中讨论的。

但是在我们继续之前，值得提一下的是，这篇文章所提到的所有命令指示都已经在 Ubuntu 14.04LTS 下的 4.3.11版 Bash 通过测试。


### 什么是 sudo

正如你们大部分人所知道的，sudo 是用来执行需要提升权限（通常是作为 root 用户）的命令。在这篇文章之前的简介部分已经讨论过这样的一个例子。然而，如果你想的话，你能用 sudo 运行一些其他（非 root ）用户的命令。

这点是由工具提供的 -u 命令行选项所实现的。举个例子，如下面的例子所展示的那样，我（himanshu）尝试留一个文件在其他用户（howtoforge）的家目录中，但是得到一个“访问拒绝”的错误。然后我尝试加上“sudo -u howtoforge”后用同样的“mv”命令，命令成功执行了：

[
 ![什么是 sudo](https://www.howtoforge.com/images/sudo-beginners-guide/sudo-switch-user.png) 
][13]

### 任何人都能用 sudo 吗？

不，为了让一个用户能使用 sudo ，跟用户相关的信息应该在 /etc/sudoers 里。下述摘自 Ubuntu 网页的段落能讲得更清楚：

```
/etc/sudoers 文件控制了谁能以何种用户的身份在何种机器上运行何种命令，同样控制了特殊的事件例如对于特定的命令你是否需要输入密码。这个文件由 aliases （基本变量）和用户识别符（控制谁能运行什么命令）组成。

```
如果你正在使用 Ubuntu，很容易去确认一个用户能运行 sudo 命令：你所需要做的就是把账户改成管理员。这能直接到 系统设置->用户账户里完成。


[
 ![sudo 用户](https://www.howtoforge.com/images/sudo-beginners-guide/sudo-user-accounts.png) 
][14]

解锁窗口


[
 ![unlocking window](https://www.howtoforge.com/images/sudo-beginners-guide/sudo-user-unlock.png) 
][15]

然后选择你想改变用户类型的用户，然后将类型改成“管理员”


[
 ![choose sudo accounts](https://www.howtoforge.com/images/sudo-beginners-guide/sudo-admin-account.png) 
][16]

然而，如果你不使用 Ubuntu，或者你的发行版没有提供这个特性，你能手动编辑 /etc/sudoers 文件来实现改变。你要在文件添加这样的一行：


```
[user]    ALL=(ALL:ALL) ALL
```

无需赘言，[user] 应该被你想提升 sudo 权限的用户的用户名所代替。在这里值得提到的一件重要的事情是，官方建议的编辑该文件的方式是通过 **visudo** 命令——你需要做的就是运行下述命令：


sudo visudo

为了说清究竟是怎么一回事，这里有段从 visudo 手册里的摘要：


```
visudo 以安全的模式编辑 sudoers 文件。visudo 锁定 sudoers 文件以防重复同时的编辑，提供基本的检查（sanity checks）和语法错误检查。如果 sudoers 文件现在正在被编辑，你将会收到一个信息提示稍后再试。

```

关于 visudo 的更多信息，前往[这里][17]


### 什么是 sudo 会话

如果你经常使用 sudo 命令，我很确定你注意过当你成功输入一次密码后，你能不用密码提升权限地运行几次 sudo 命令。但是一段时间后，sudo 命令又再次要求你的密码。


这种现象跟运行 sudo 命令数目无关，跟时间有关。是的，sudo 默认在输入一次密码后 15 分钟内不会再次要求密码。15 分钟后，你会再次被要求输入密码提升权限。


然而，如果你想的话，你能改变这种现象。用以下命令打开 /etc/sudoers 文件

sudo visudo

接下来的一行显示：

```
Defaults env_reset
```

[
 ![env_reset](https://www.howtoforge.com/images/sudo-beginners-guide/sudo-session-time-default.png) 
][18]

然后在这行最后添加以下变量（下面用黑体字强调）：


```
Defaults env_reset,timestamp_timeout=[new-value]
```

[new-value]  应该用你想要 sudo 会话持续时间数替换。例如，我用数值 40。


[
 ![sudo timeout value](https://www.howtoforge.com/images/sudo-beginners-guide/sudo-session-timeout.png) 
][19]

万一你想每次使用 sudo 命令时都要求输入密码提升权限，这样你能把这个变量赋值为 0 。想要 sudo 会话永远不过时，你得赋值为 -1。


注意数值为 -1 的  timestamp_timeout 是强烈不推荐的。 


### sudo 密码


正如你可能观察过的，当 sudo 要求输入密码然后你开始输入时，不会显示任何东西——甚至连标准的星号都没有。通常这不是什么大问题，一些用户无论什么原因想要显示星号、


好消息是那有可能也很容易做到。所有你需要做的就是在 /etc/sudoers 文件里将下述的行：


```
Defaults        env_reset
```

改成

```
Defaults        env_reset,pwfeedback
```

然后保存文件


现在，无论什么时候输入 sudo 密码，星号都会显示。


[
 ![hide the sudo password](https://www.howtoforge.com/images/sudo-beginners-guide/sudo-password.png) 
][20]

## 一些重要的 sudo 命令行参数


除了 -u命令行参数（我们已经在这篇教程的开始部分讨论过了），还有其他重要的 sudo 命令行参数值得注意。在这部分，我们将会讨论其中一些。



### -k 参数
### The -k option

考虑下一种情况：当你刚输入密码后运行了几个 sudo 驱动的命令时。现在，正如你已经知道的，sudo 会话默认保持 15 分钟。假设在这会话期间，你得给你终端一些权限，但你不想让他们使用 sudo ，你将会怎么做？


还好，有 -k 命令行参数允许用户取消 sudo 权限。这是 sudo 帮助页面（man page）关于这一点所讲的：


```
-k, --reset-timestamp

不带任何命令使用时，撤销用户缓存的凭据。换句话讲，下一次使用 sudo 将会要求输入密码。这个参数不需要密码，允许用户从一个 .logout 文件撤销 sudo 权限。

当与一个命令，或者一个可能需要密码的操作一起用时，这个参数将会导致 sudo 忽略用户缓存的凭据。结果是 sudo 要求输入密码（如果这是被安全策略所要求的），而且不会更新用户缓存的凭据。

```

### -s 参数


或许有几次当你的工作要求你运行一堆需要 root 权限的命令时，你不想每次都输入密码。你也不想通过改变 /etc/sudoers 文件调整 sudo 会话的过期时限。

这种情况下，你可以用 sudo 的 -s 参数。这是 sudo 帮助页面（man page）所解释的：


```
-s, --shell

如果 SHELL 环境变量设置了或者 shell 调用了用户的密码数据库，就能用它运行 shell 。如果指定了命令，命令将会通过 shell 的 -c 参数传递给 shell 执行。如果没有指定命令，一个交互式 shell 将会执行。

```

所以，基本地，这命令参数做的是：


*   启动一个新的 shell ，对于哪一个 shell 来说，SHELL 赋值变量都有引用。万一 $SHELL 是空的，将会用  /etc/passwd 定义的内容。

*   如果你用 -s 参数传递了一个命令名（例如 sudo -s whoami）,实际执行的是 sudo /bin/bash -c whoami。

*   如果你尝试执行其他命令（意思是 你只是正在尝试运行 sudo -s），你将会得到一个有有 root 权限的交互式的 shell。

这里值得记住的是 -s 命令行参数给你一个有 root 权限的 shell，但是你没有 root 环境——你的 .bashrc 决定的。这意思是，例如在一个用 sudo -s 运行的新 shell 里，执行 whoami 命令仍会返回你的用户名，而非 root 。

###　-i 参数
-i 参数跟我们讨论过的 -s 参数相像。然而，还是有点区别。一个重要的区别是 -i 也给了你 root 环境，意味着你的（用户的）.bashrc 被忽略。这就像没有明确指明用 root 登录也能称为成为 root 。此外，你也不用输入 root 用户密码。 


** 重要 **：请注意有也能让你切换用户的 **su** 命令（默认的是切换到 root ） 这个命令需要你输入 root 密码。为了避免这一点，你也要用 sudo 执行（‘ sudo su’），这样你只需要输入你的登录密码。然而，su 和 sudo su 有隐含的区别 ——了解他们和跟相应的  sudo -i 区别，来[这里][10] 
**Important**: Please note that there exists a **su** command which also 


### 总结

我希望现在你至少知道了 sudo 的基本知识，和如何调整 sudo 的默认行为。请按我们解释过的那样全部尝试调整 /etc/sudoers 。同时也浏览一下论坛讨论（在最后一段中有链接）来更深入了解 sudo 命令。

--------------------------------------------------------------------------------

via: https://www.howtoforge.com/tutorial/sudo-beginners-guide/

作者：[Himanshu Arora][a]
译者：[ypingcn](https://ypingcn.github.io/wiki/lctt)
校对：[jasminepeng](https://github.com/jasminepeng)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.howtoforge.com/tutorial/sudo-beginners-guide/
[1]: https://www.howtoforge.com/tutorial/sudo-beginners-guide/#the-k-option
[2]: https://www.howtoforge.com/tutorial/sudo-beginners-guide/#the-s-option
[3]: https://www.howtoforge.com/tutorial/sudo-beginners-guide/#the-i-option
[4]: https://www.howtoforge.com/tutorial/sudo-beginners-guide/#what-is-sudo
[5]: https://www.howtoforge.com/tutorial/sudo-beginners-guide/#can-any-user-use-sudo
[6]: https://www.howtoforge.com/tutorial/sudo-beginners-guide/#what-is-a-sudo-session
[7]: https://www.howtoforge.com/tutorial/sudo-beginners-guide/#the-sudo-password
[8]: https://www.howtoforge.com/tutorial/sudo-beginners-guide/#some-important-sudo-command-line-options
[9]: https://www.howtoforge.com/tutorial/sudo-beginners-guide/#conclusion
[10]: http://unix.stackexchange.com/questions/98531/difference-between-sudo-i-and-sudo-su
[11]: https://www.howtoforge.com/images/sudo-beginners-guide/big/perm-denied-error.png
[12]: https://www.howtoforge.com/images/sudo-beginners-guide/big/sudo-example.png
[13]: https://www.howtoforge.com/images/sudo-beginners-guide/big/sudo-switch-user.png
[14]: https://www.howtoforge.com/images/sudo-beginners-guide/big/sudo-user-accounts.png
[15]: https://www.howtoforge.com/images/sudo-beginners-guide/big/sudo-user-unlock.png
[16]: https://www.howtoforge.com/images/sudo-beginners-guide/big/sudo-admin-account.png
[17]: https://www.sudo.ws/man/1.8.17/visudo.man.html
[18]: https://www.howtoforge.com/images/sudo-beginners-guide/big/sudo-session-time-default.png
[19]: https://www.howtoforge.com/images/sudo-beginners-guide/big/sudo-session-timeout.png
[20]: https://www.howtoforge.com/images/sudo-beginners-guide/big/sudo-password.png

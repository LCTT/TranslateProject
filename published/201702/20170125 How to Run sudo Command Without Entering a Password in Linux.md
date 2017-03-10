如何在 Linux 中不输入密码运行 sudo 命令
============================================================

假设你在只有自己使用的计算机上运行 Linux 系统，比如在笔记本电脑上，在每次调用 **sudo** 时需要输入密码，长期下来就会觉得很乏味。因此，在本指南中，我们将描述[如何配置 sudo 命令][4]在运行时而不输入密码。

此设置在 `/etc/sudoers` 文件中完成，这是使用 [sudo 命令][5]的默认安全策略；在用户权限指定部分。

**重要**：在 `sudeors` 文件中，默认打开的 `authenticate` 参数用于验证目的。如果设置了它，用户必须通过密码（或其他身份验证方法）进行身份验证，然后才能使用 `sudo` 运行命令。

但是，可以使用 `NOPASSWD`（当用户调用 `sudo` 命令时不需要密码）标记来覆盖此默认值。

配置用户权限的语法如下：

```
user_list host_list=effective_user_list tag_list command_list
```

其中：

1.  `user_list` - 用户列表或已经设置的用户别名。
2.  `host_list` - 主机列表或用户可以在其上运行 sudo 的主机别名。
3.  `effective_user_list` - 以该用户或别名运行的用户列表
4.  `tag_list` - 标签列表，如 `NOPASSWD`。
5.  `command_list` - 用户使用 `sudo` 运行的命令或命令别名列表。

要允许用户（下面的示例中的 `aaronkilik`）使用 `sudo` 不输入密码即可运行所有命令，请打开 `sudoers` 文件：

```
$ sudo visudo
```

添加下面的行：

```
aaronkilik ALL=(ALL) NOPASSWD: ALL
```

对于组而言，在组名前面使用 `%` 字符；这意味着 `sys` 组的所有成员都可以不用密码使用 `sudo`。

```
%sys ALL=(ALL) NOPASSWD: ALL
```

要允许用户不用密码使用 `sudo` 运行指定命令（`/bin/kill`），添加下面的行：

```
aaronkilik ALL=(ALL) NOPASSWD: /bin/kill
```

下面的行会让 `sys` 组成员在使用 `sudo` 运行命令：`/bin/kill`、`/bin/rm` 时不用输入密码：

```
%sys ALL=(ALL) NOPASSWD: /bin/kill, /bin/rm
```
[
 ![Run sudo Without Password](http://www.tecmint.com/wp-content/uploads/2017/01/Run-sudo-Without-Password.png) 
][6]

*不用密码运行 sudo*

对于更多的 `sudo` 配置和其他使用选项，请阅读我们有更多例子描述的文章，：

-  [在 Linux 中设置 sudo 的十条 sudoers 实用配置][1]
-  [让 sudo 在你输入错误的密码时“嘲讽”你][2]
-  [如何在 Linux 中让 sudo 密码会话的超时更长些][3]

在本篇中，我们讨论了如何配置 sudo 命令来不用输入密码运行。不要忘记在评论栏中给我们提供你关于这份指导的想法和其他对于 Linux 系统管理员有用的 sudoers 配置。

--------------------------------------------------------------------------------

作者简介：

Aaron Kili 是 Linux 和 F.O.S.S 爱好者，将来的 Linux SysAdmin 及 web 开发者，目前是 TecMint 的内容创作者，他喜欢用电脑工作，并坚信分享知识。

----------------------------------------------------------------


via: http://www.tecmint.com/run-sudo-command-without-password-linux/

作者：[Aaron Kili][a]
译者：[geekpi](https://github.com/geekpi)
校对：[jasminepeng](https://github.com/jasminepeng)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/aaronkili/
[1]:https://linux.cn/article-8145-1.html
[2]:https://linux.cn/article-8128-1.html
[3]:https://linux.cn/article-8151-1.html
[4]:http://www.tecmint.com/sudoers-configurations-for-setting-sudo-in-linux/
[5]:http://www.tecmint.com/su-vs-sudo-and-how-to-configure-sudo-in-linux/
[6]:http://www.tecmint.com/wp-content/uploads/2017/01/Run-sudo-Without-Password.png

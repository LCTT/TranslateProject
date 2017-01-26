如何在 Linux 中让 sudo 密码会话的超时更长些
============================================================

在最近的文章中，我们向你展示了 在 Linux 中设置 sudo 的十条 sudoers 实用配置][1]以及[让 sudo 在你输入错误的密码时“嘲讽”你][2]，在本文中，我们发现了另一个 sudo 贴士，在 Ubuntu Linux 中使 sudo 密码会话（超时）更长或更短。

在 Ubuntu 及其衍生版如 Linux Mint 或任何其他基于 Ubuntu 的发行版中，当你执行 [sudo 命令][3] 时，它将提示你输入管理密码。

在第一次执行 sudo 命令后，默认情况下密码将保持 15 分钟，因此你不需要为每个 sudo 命令键入密码。

如果，你因为某种原因觉得 15 分钟太长或太短，你可以在 `sudoers` 文件中做一个简单的调整。

要设置 sudo 密码超时值，请使用 `passwd_timeout` 参数。首先使用 `sudo` 和 `visudo` 命令以超级用户权限打开 `/etc/sudoers` 文件，如下所示：

```
$ sudo visudo 
```

接着添加下面的默认值，这意味着 sudo 密码提示将会在用户使用 sudo 20 分钟后过期。

```
Defaults        env_reset,timestamp_timeout=20
```

注意：你可以以分钟设置为你所需的任何时间，它会在超时之前一直等待。 如果要为每个执行的 sudo 命令弹出密码提示，你也可以将时间设置为 `0`，或者通过设置值 `-1` 永久禁用密码提示。

下面的截图显示了我在 `/etc/sudoers` 文件中设置的默认参数。

[
 ![Change sudo Password Timeout](http://www.tecmint.com/wp-content/uploads/2017/01/set-sudo-password-timeout-session.png) 
][4]

*改变 sudo 密码超时*

按 `Ctrl + O` 保存文件，然后使用 `Ctrl + X` 退出。 然后，使用 `sudo` 运行命令并等待 2 分钟以检查密码提示是否超时以测试设置是否正常。

在本篇中，我们解释了如何设置 `sudo` 密码提示超时之前的分钟数，记得在评论栏分享你对这篇文章的想法或者其他[对系统管理员配置有用的 sudo 配置][5]。

--------------------------------------------------------------------------------

作者简介：

![](http://1.gravatar.com/avatar/4e444ab611c7b8c7bcb76e58d2e82ae0?s=128&d=blank&r=g)

Aaron Kili 是 Linux 和 F.O.S.S 爱好者，将来的 Linux SysAdmin 以及 web 开发人员，目前是 TecMint 的内容创建者，他喜欢用电脑工作，并坚信分享知识。

-----

via: http://www.tecmint.com/set-sudo-password-timeout-session-longer-linux/

作者：[Aaron Kili ][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/aaronkili/
[1]:https://linux.cn/article-8145-1.html
[2]:https://linux.cn/article-8128-1.html
[3]:http://www.tecmint.com/su-vs-sudo-and-how-to-configure-sudo-in-linux/
[4]:http://www.tecmint.com/wp-content/uploads/2017/01/set-sudo-password-timeout-session.png
[5]:http://www.tecmint.com/sudoers-configurations-for-setting-sudo-in-linux/

[#]: subject: "How To Prevent Command Arguments With Sudo In Linux"
[#]: via: "https://ostechnix.com/prevent-command-arguments-with-sudo/"
[#]: author: "sk https://ostechnix.com/author/sk/"
[#]: collector: "lkxed"
[#]: translator: "Donkey-Hao"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-15106-1.html"

如何在 sudo 运行的命令中防止使用参数
======

![](https://img.linux.net.cn/data/attachment/album/202210/04/224059k9jl5kzhlhw5d98j.jpg)

> 允许用户使用 `sudo` 运行命令，但不带命令行参数。

在之前的文章，我们学习了如何 [通过 sudo 以 root 身份运行目录中的命令][1]。在这篇指南中，我们将学习如何在 Linux 中 **防止 sudo 运行的命令使用参数**。即我们允许一个用户使用 `sudo` 运行特权级命令，但是 **不带命令行参数**。

### 背景介绍

你已经知道了，每个命令执行一个特定操作有不同的选项。让我们以 `ls` 命令为例。

`ls` 命令会罗列文件夹中的内容，对吗？没错。`ls` 命令附带了一些命令行选项和标志。例如，你可以用 `ls` 命令的 `-a` 标志罗列文件夹中的所有内容（包括隐藏文件）。

在这份简要指南中，我们将明白如何允许用户通过 `sudo` 运行 `ls` 命令，但是不能使用命令行选项或者标志。我讲清楚了吗？接下来让我来展示一下如何做到这点。

### 防止使用 sudo 参数

以 `root` 用户身份编辑 `/etc/sudoers` 文件：

```
[root@Almalinux8CT ~]# visudo
```

添加下面一行：

```
user1   ALL=(root)      /usr/bin/ls ""
```

![Deny Command Arguments With Sudo][2]

要注意这里 `ls` 之后的 **双引号**。双引号会屏蔽用户在给定命令之后输入的参数（比如 `ls` 命令）。在上面的命令中，`user1` 能够以 `root` 身份运行 `ls` 命令，但是不能使用 `ls` 命令的选项以及标志。你可以选择其他的指令进行尝试。保存该文件并关闭。

现在，以 `user1` 的身份登录系统，并尝试以管理员身份运行 `ls` 命令，不要添加任何选项：

```
[user1@Almalinux8CT ~]$ sudo -u root ls -a
```

或许你会遇到下面的报错：

```
Sorry, user user1 is not allowed to execute '/bin/ls -a' as root on Almalinux8CT.
```

不过你可以不添加参数来运行 `ls` 命令：

```
[user1@Almalinux8CT ~]$ sudo -u root ls
```

![Prevent Command Arguments With Sudo][3]

### 防止所有用户使用命令参数

上述例子像你展示了如何阻止用户以管理员身份运行带有参数的命令。你是否想要对所有用户应用该规则呢？很简单！只需要在 `/etc/sudoers` 文件中添加一行：

```
ALL   ALL=(root)      /usr/bin/ls ""
```

现在，系统中的所有用户都可以运行不带参数的 `ls` 命令。

想要恢复默认设置，只需要删除最后的双引号，或者删除整行。

查看帮助手册，了解更多。

```
$ man sudoers
```

### 结论

在这份指南中，我们学习了如何允许用户以管理员身份运行命令，但是不能添加任何命令参数。这样可以限制用户误用一些命令行参数。

--------------------------------------------------------------------------------

via: https://ostechnix.com/prevent-command-arguments-with-sudo/

作者：[sk][a]
选题：[lkxed][b]
译者：[Donkey-Hao](https://github.com/Donkey-Hao)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://ostechnix.com/author/sk/
[b]: https://github.com/lkxed
[1]: https://ostechnix.com/run-programs-in-a-directory-via-sudo/
[2]: https://ostechnix.com/wp-content/uploads/2022/09/Deny-Command-Arguments-With-Sudo.png
[3]: https://ostechnix.com/wp-content/uploads/2022/09/Prevent-Command-Arguments-With-Sudo.png

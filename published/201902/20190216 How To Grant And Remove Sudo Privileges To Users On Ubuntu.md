[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10576-1.html)
[#]: subject: (How To Grant And Remove Sudo Privileges To Users On Ubuntu)
[#]: via: (https://www.ostechnix.com/how-to-grant-and-remove-sudo-privileges-to-users-on-ubuntu/)
[#]: author: (SK https://www.ostechnix.com/author/sk/)

如何在 Ubuntu 上为用户授予和移除 sudo 权限
======

![](https://www.ostechnix.com/wp-content/uploads/2019/02/sudo-privileges-720x340.png)

如你所知，用户可以在 Ubuntu 系统上使用 sudo 权限执行任何管理任务。在 Linux 机器上创建新用户时，他们无法执行任何管理任务，直到你将其加入 `sudo` 组的成员。在这个简短的教程中，我们将介绍如何将普通用户添加到 `sudo` 组以及移除给定的权限，使其成为普通用户。

### 在 Linux 上向普通用户授予 sudo 权限

通常，我们使用 `adduser` 命令创建新用户，如下所示。

```
$ sudo adduser ostechnix
```

如果你希望新创建的用户使用 `sudo` 执行管理任务，只需使用以下命令将它添加到 `sudo` 组：

```
$ sudo usermod -a -G sudo hduser
```

上面的命令将使名为 `ostechnix` 的用户成为 `sudo` 组的成员。

你也可以使用此命令将用户添加到 `sudo` 组。

```
$ sudo adduser ostechnix sudo
```

现在，注销并以新用户身份登录，以使此更改生效。此时用户已成为管理用户。

要验证它，只需在任何命令中使用 `sudo` 作为前缀。

```
$ sudo mkdir /test
[sudo] password for ostechnix:
```

### 移除用户的 sudo 权限

有时，你可能希望移除特定用户的 `sudo` 权限，而不用在 Linux 中删除它。要将任何用户设为普通用户，只需将其从 `sudo` 组中删除即可。

比如说如果要从 `sudo` 组中删除名为 `ostechnix` 的用户，只需运行：

```
$ sudo deluser ostechnix sudo
```

示例输出：

```
Removing user `ostechnix' from group `sudo' ...
Done.
```

此命令仅从 `sudo` 组中删除用户 `ostechnix`，但不会永久地从系统中删除用户。现在，它成为了普通用户，无法像 `sudo` 用户那样执行任何管理任务。

此外，你可以使用以下命令撤消用户的 `sudo` 访问权限：

```
$ sudo gpasswd -d ostechnix sudo
```

从 `sudo` 组中删除用户时请小心。不要从 `sudo` 组中删除真正的管理员。

使用命令验证用户 `ostechnix` 是否已从 `sudo` 组中删除：

```
$ sudo -l -U ostechnix
User ostechnix is not allowed to run sudo on ubuntuserver.
```

是的，用户 `ostechnix` 已从 `sudo` 组中删除，他无法执行任何管理任务。

从 `sudo` 组中删除用户时请小心。如果你的系统上只有一个 `sudo` 用户，并且你将他从 `sudo` 组中删除了，那么就无法执行任何管理操作，例如在系统上安装、删除和更新程序。所以，请小心。在我们的下一篇教程中，我们将解释如何恢复用户的 `sudo` 权限。

就是这些了。希望这篇文章有用。还有更多好东西。敬请期待！

干杯!


--------------------------------------------------------------------------------

via: https://www.ostechnix.com/how-to-grant-and-remove-sudo-privileges-to-users-on-ubuntu/

作者：[SK][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.ostechnix.com/author/sk/
[b]: https://github.com/lujun9972

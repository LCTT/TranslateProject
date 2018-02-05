Linux 下如何修改用户名（同时修改用户组名和家目录）
======

有时候，由于某些原因，我们可能会需要重命名用户名。我们可以很容易地修改用户名以及对应的家目录和 UID。

本教程将会讨论这些东西。让我们先从修改用户名开始。

### 修改用户名

我们使用 `usermod` 来修改用户名。其语法为，

```
$ usermod -l new_username old_username
```

举个例子，假设我们有一个名叫 `dan` 的用户想要重命名为 `susan`，那么在终端下执行下面命令：

```
$ sudo usermod -l susan dan
```

这只会更改用户名，而其他的东西，比如用户组，家目录，UID 等都保持不变。

**注意：-** 你需要从要改名的帐号中登出并杀掉该用户的所有进程，要杀掉该用户的所有进程可以执行下面命令，

```
$ sudo pkill -u dan
$ sudo pkill -9 -u dan
```

### 修改家目录

要同时更改家目录，我们需要在执行 `usermod` 命令的同时加上 `-d` 选项，

```
$ sudo usermod -d /home/susan -m susan
```

### 更改用户 UID

执行下面命令修改用户 UID，

```
$ sudo usermod -u 2000 susan
```

这里 `2000` 就是用户的新 UID。

### 修改用户组名

要把用户组名从 `dan` 修改为 `susan`，我们需要使用 `groupmod` 命令。使用下面命令来修改用户组名，

```
$ groupmod -n susan dan
```

做完修改后，可以使用 `id` 命令来检查，

```
$ id susan
```

这篇教导如何修改用户名的指南就此结束了。有任何疑问或建议，欢迎给我们留言。


--------------------------------------------------------------------------------

via: http://linuxtechlab.com/rename-user-in-linux-rename-home-directory/

作者：[Shusain][a]
译者：[lujun9972](https://github.com/lujun9972)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://linuxtechlab.com/author/shsuain/
[1]:http://linuxtechlab.com/use-of-find-command/

Linux 系统中 sudo 命令的 10 个技巧
======

![Linux-sudo-command-tips][1]

### 概览

`sudo` 表示 “**s**uper**u**ser **do**”。 它允许已验证的用户以其他用户的身份来运行命令。其他用户可以是普通用户或者超级用户。然而，大部分时候我们用它来以提升的权限来运行命令。

`sudo` 命令与安全策略配合使用，默认安全策略是 `sudoers`，可以通过文件 `/etc/sudoers` 来配置。其安全策略具有高度可拓展性。人们可以开发和分发他们自己的安全策略作为插件。

### 与 su 的区别

在 GNU/Linux 中，有两种方式可以用提升的权限来运行命令：

  * 使用 `su` 命令
  * 使用 `sudo` 命令

`su` 表示 “**s**witch **u**ser”。使用 `su`，我们可以切换到 root 用户并且执行命令。但是这种方式存在一些缺点：

  * 我们需要与他人共享 root 的密码。
  * 因为 root 用户为超级用户，我们不能授予受控的访问权限。
  * 我们无法审查用户在做什么。

`sudo` 以独特的方式解决了这些问题。

  1. 首先，我们不需要妥协来分享 root 用户的密码。普通用户使用他们自己的密码就可以用提升的权限来执行命令。
  2. 我们可以控制 `sudo` 用户的访问，这意味着我们可以限制用户只执行某些命令。
  3. 除此之外，`sudo` 用户的所有活动都会被记录下来，因此我们可以随时审查进行了哪些操作。在基于 Debian 的 GNU/Linux 中，所有活动都记录在 `/var/log/auth.log` 文件中。

本教程后面的部分阐述了这些要点。

### 实际动手操作 sudo

现在，我们对 sudo 有了大致的了解。让我们实际动手操作吧。为了演示，我使用 Ubuntu。但是，其它发行版本的操作应该是相同的。

#### 允许 sudo 权限

让我们添加普通用户为 `sudo` 用户吧。在我的情形中，用户名为 `linuxtechi`。

1) 按如下所示编辑 `/etc/sudoers` 文件：

```
$ sudo visudo
```

2) 添加以下行来允许用户 `linuxtechi` 有 sudo 权限：

```
linuxtechi ALL=(ALL) ALL
```

上述命令中：

  * `linuxtechi` 表示用户名
  * 第一个 `ALL` 指示允许从任何终端、机器访问 `sudo`
  * 第二个 `(ALL)` 指示 `sudo` 命令被允许以任何用户身份执行
  * 第三个 `ALL` 表示所有命令都可以作为 root 执行


#### 以提升的权限执行命令

要用提升的权限执行命令，只需要在命令前加上 `sudo`，如下所示：

```
$ sudo cat /etc/passwd
```

当你执行这个命令时，它会询问 `linuxtechi` 的密码，而不是 root 用户的密码。

#### 以其他用户执行命令

除此之外，我们可以使用 `sudo` 以另一个用户身份执行命令。例如，在下面的命令中，用户 `linuxtechi` 以用户 `devesh` 的身份执行命令：

```
$ sudo -u devesh whoami
[sudo] password for linuxtechi:
devesh
```

#### 内置命令行为

`sudo` 的一个限制是 —— 它无法使用 Shell 的内置命令。例如， `history` 记录是内置命令，如果你试图用 `sudo` 执行这个命令，那么会提示如下的未找到命令的错误：

```
$ sudo history
[sudo] password for linuxtechi:
sudo: history: command not found

```

**访问 root shell**

为了克服上述问题，我们可以访问 root shell，并在那里执行任何命令，包括 Shell 的内置命令。

要访问 root shell, 执行下面的命令:

```
$ sudo bash
```

执行完这个命令后——您将观察到提示符变为井号（`#`）。

### 技巧

这节我们将讨论一些有用的技巧，这将有助于提高生产力。大多数命令可用于完成日常任务。

#### 以 sudo 用户执行之前的命令

让我们假设你想用提升的权限执行之前的命令，那么下面的技巧将会很有用：

```
$ sudo !4
```

上面的命令将使用提升的权限执行历史记录中的第 4 条命令。

#### 在 Vim 里面使用 sudo 命令

很多时候，我们编辑系统的配置文件时，在保存时才意识到我们需要 root 访问权限来执行此操作。因为这个可能让我们丢失我们对文件的改动。没有必要惊慌，我们可以在 Vim 中使用下面的命令来解决这种情况：

```
:w !sudo tee %
```

上述命令中：

  * 冒号 (`:`) 表明我们处于 Vim 的退出模式
  * 感叹号 (`!`) 表明我们正在运行 shell 命令
  * `sudo` 和 `tee` 都是 shell 命令
  * 百分号 (`%`) 表明从当前行开始的所有行



#### 使用 sudo 执行多个命令

至今我们用 `sudo` 只执行了单个命令，但我们可以用它执行多个命令。只需要用分号 (`;`) 隔开命令，如下所示：

```
$ sudo -- bash -c 'pwd; hostname; whoami'

```

上述命令中

  * 双连字符 (`--`) 停止命令行切换
  * `bash` 表示要用于执行命令的 shell 名称
  * `-c` 选项后面跟着要执行的命令



#### 无密码运行 sudo 命令

当第一次执行 `sudo` 命令时，它会提示输入密码，默认情形下密码被缓存 15 分钟。但是，我们可以避免这个操作，并使用 `NOPASSWD` 关键字禁用密码认证，如下所示：

```
linuxtechi ALL=(ALL) NOPASSWD: ALL
```

#### 限制用户执行某些命令

为了提供受控访问，我们可以限制 `sudo` 用户只执行某些命令。例如，下面的行只允许执行 `echo` 和 `ls` 命令 。

```
linuxtechi ALL=(ALL) NOPASSWD: /bin/echo /bin/ls
```

#### 深入了解 sudo

让我们进一步深入了解 `sudo` 命令。

```
$ ls -l /usr/bin/sudo
-rwsr-xr-x 1 root root 145040 Jun 13  2017 /usr/bin/sudo
```

如果仔细观察文件权限，则发现 `sudo` 上启用了 setuid 位。当任何用户运行这个二进制文件时，它将以拥有该文件的用户权限运行。在所示情形下，它是 root 用户。


为了演示这一点，我们可以使用 `id` 命令，如下所示：

```
$ id
uid=1002(linuxtechi) gid=1002(linuxtechi) groups=1002(linuxtechi)
```

当我们不使用 `sudo` 执行 `id` 命令时，将显示用户 `linuxtechi` 的 id。

```
$ sudo id
uid=0(root) gid=0(root) groups=0(root)

```

但是，如果我们使用 `sudo` 执行 `id` 命令时，则会显示 root 用户的 id。

### 结论

从这篇文章可以看出 —— `sudo` 为普通用户提供了更多受控访问。使用这些技术，多用户可以用安全的方式与 GNU/Linux 进行交互。

--------------------------------------------------------------------------------

via: https://www.linuxtechi.com/quick-tips-sudo-command-linux-systems/

作者：[Pradeep Kumar][a]
译者：[szcf-weiya](https://github.com/szcf-weiya)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linuxtechi.com/author/pradeep/
[1]:https://www.linuxtechi.com/wp-content/uploads/2018/03/Linux-sudo-command-tips.jpg

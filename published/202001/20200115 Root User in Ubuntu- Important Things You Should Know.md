[#]: collector: (lujun9972)
[#]: translator: (robsean)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11837-1.html)
[#]: subject: (Root User in Ubuntu: Important Things You Should Know)
[#]: via: (https://itsfoss.com/root-user-ubuntu/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

Ubuntu 中的 root 用户：你应该知道的重要事情
======

![][5]

当你刚开始使用 Linux 时，你将发现与 Windows 的很多不同。其中一个“不同的东西”是 root 用户的概念。

在这个初学者系列中，我将解释几个关于 Ubuntu 的 root 用户的重要的东西。

**请记住，尽管我正在从 Ubuntu 用户的角度编写这篇文章，它应该对大多数的 Linux 发行版也是有效的。**

你将在这篇文章中学到下面的内容：

* 为什么在 Ubuntu 中禁用 root 用户
* 像 root 用户一样使用命
* 切换为 root 用户
* 解锁 root 用户

### 什么是 root 用户？为什么它在 Ubuntu 中被锁定？

在 Linux 中，有一个称为 [root][6] 的超级用户。这是超级管理员账号，它可以做任何事以及使用系统的一切东西。它可以在你的 Linux 系统上访问任何文件和运行任何命令。

能力越大，责任越大。root 用户给予你完全控制系统的能力，因此，它应该被谨慎地使用。root 用户可以访问系统文件，运行更改系统配置的命令。因此，一个错误的命令可能会破坏系统。

这就是为什么 [Ubuntu][7] 和其它基于 Ubuntu 的发行版默认锁定 root 用户，以从意外的灾难中挽救你的原因。

对于你的日常任务，像移动你家目录中的文件，从互联网下载文件，创建文档等等，你不需要拥有 root 权限。

**打个比方来更好地理解它。假设你想要切一个水果，你可以使用一把厨房用刀。假设你想要砍一颗树，你就得使用一把锯子。现在，你可以使用锯子来切水果，但是那不明智，不是吗？**_

这意味着，你不能是 Ubuntu 中 root 用户或者不能使用 root 权限来使用系统吗？不，你仍然可以在 `sudo` 的帮助下来拥有 root 权限来访问(在下一节中解释)。

> **要点：** 使用于常规任务，root 用户权限太过强大。这就是为什么不建议一直使用 root 用户。你仍然可以使用 root 用户来运行特殊的命令。

### 如何在 Ubuntu 中像 root 用户一样运行命令？

![Image Credit: xkcd][8]

对于一些系统的特殊任务来说，你将需要 root 权限。例如。如果你想[通过命令行更新 Ubuntu][9]，你不能作为一个常规用户运行该命令。它将给出权限被拒绝的错误。

```
apt update
Reading package lists... Done
E: Could not open lock file /var/lib/apt/lists/lock - open (13: Permission denied)
E: Unable to lock directory /var/lib/apt/lists/
W: Problem unlinking the file /var/cache/apt/pkgcache.bin - RemoveCaches (13: Permission denied)
W: Problem unlinking the file /var/cache/apt/srcpkgcache.bin - RemoveCaches (13: Permission denied)
```

那么，你如何像 root 用户一样运行命令？简单的答案是，在命令前添加 `sudo`，来像 root 用户一样运行。

```
sudo apt update
```

Ubuntu 和很多其它的 Linux 发行版使用一个被称为 `sudo` 的特殊程序机制。`sudo` 是一个以 root 用户（或其它用户）来控制运行命令访问的程序。

实际上，`sudo` 是一个非常多用途的工具。它可以配置为允许一个用户像 root 用户一样来运行所有的命令，或者仅仅一些命令。你也可以配置为无需密码即可使用 sudo 运行命令。这个主题内容比较丰富，也许我将在另一篇文章中详细讨论它。

就目前而言，你应该知道[当你安装 Ubuntu 时][10]，你必须创建一个用户账号。这个用户账号在你系统上以管理员身份来工作，并且按照 Ubuntu 中的默认 sudo 策略，它可以在你的系统上使用 root 用户权限来运行任何命令。

`sudo` 的问题是，运行 **sudo 不需要 root 用户密码，而是需要用户自己的密码**。

并且这就是为什么当你使用 `sudo` 运行一个命令，会要求输入正在运行 `sudo` 命令的用户的密码的原因：

```
[email protected]:~$ sudo apt update
[sudo] password for abhishek:
```

正如你在上面示例中所见 `abhishek` 在尝试使用 `sudo` 来运行 `apt update` 命令，系统要求输入 `abhishek` 的密码。

**如果你对 Linux 完全不熟悉，当你在终端中开始输入密码时，你可能会惊讶，在屏幕上什么都没有发生。这是十分正常的，因为作为默认的安全功能，在屏幕上什么都不会显示。甚至星号（`*`）都没有。输入你的密码并按回车键。**

> **要点：**为在 Ubuntu 中像 root 用户一样运行命令，在命令前添加 `sudo`。 当被要求输入密码时，输入你的账户的密码。当你在屏幕上输入密码时，什么都看不到。请继续输入密码，并按回车键。

### 如何在 Ubuntu 中成为 root 用户？

你可以使用 `sudo` 来像 root 用户一样运行命令。但是，在某些情况下，你必须以 root 用户身份来运行一些命令，而你总是忘了在命令前添加 `sudo`，那么你可以临时切换为 root 用户。

`sudo` 命令允许你来模拟一个 root 用户登录的 shell ，使用这个命令：

```
sudo -i
```

```
[email protected]:~$ sudo -i
[sudo] password for abhishek:
[email protected]:~# whoami
root
[email protected]:~#
```

你将注意到，当你切换为 root 用户时，shell 命令提示符从 `$`（美元符号）更改为 `#`（英镑符号）。我开个（拙劣的）玩笑，英镑比美元强大。

**虽然我已经向你显示如何成为 root 用户，但是我必须警告你，你应该避免作为 root 用户使用系统。毕竟它有阻拦你使用 root 用户的原因。**

另外一种临时切换为 root 用户的方法是使用 `su` 命令：

```
sudo su
```

如果你尝试使用不带有的 `sudo` 的 `su` 命令，你将遇到 “su authentication failure” 错误。

你可以使用 `exit` 命令来恢复为正常用户。

```
exit
```

### 如何在 Ubuntu 中启用 root 用户？

现在你知道，root 用户在基于 Ubuntu 发行版中是默认锁定的。

Linux 给予你在系统上想做什么就做什么的自由。解锁 root 用户就是这些自由之一。

如果出于某些原因，你决定启用 root 用户，你可以通过为其设置一个密码来做到：

```
sudo passwd root
```

再强调一次，不建议使用 root 用户，并且我也不鼓励你在桌面上这样做。如果你忘记了密码，你将不能再次[在 Ubuntu 中更改 root 用户密码][11]。（LCTT 译注：可以通过单用户模式修改。）

你可以通过移除密码来再次锁定 root 用户：

```
sudo passwd -dl root
```

### 最后…

我希望你现在对 root 概念理解得更好一点。如果你仍然有些关于它的困惑和问题，请在评论中让我知道。我将尝试回答你的问题，并且也可能更新这篇文章。

--------------------------------------------------------------------------------

via: https://itsfoss.com/root-user-ubuntu/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[robsean](https://github.com/robsean)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: tmp.IrHYJBAqVn#what-is-root
[2]: tmp.IrHYJBAqVn#run-command-as-root
[3]: tmp.IrHYJBAqVn#become-root
[4]: tmp.IrHYJBAqVn#enable-root
[5]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/01/root_user_ubuntu.png?ssl=1
[6]: http://www.linfo.org/root.html
[7]: https://ubuntu.com/
[8]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/01/sudo_sandwich.png?ssl=1
[9]: https://itsfoss.com/update-ubuntu/
[10]: https://itsfoss.com/install-ubuntu/
[11]: https://itsfoss.com/how-to-hack-ubuntu-password/

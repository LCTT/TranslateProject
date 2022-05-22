[#]: subject: (Forgot Linux Password on WSL? Here’s How to Reset it Easily)
[#]: via: (https://itsfoss.com/reset-linux-password-wsl/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)
[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13545-1.html)

在 WSL 上忘记了 Linux 密码？下面是如何轻松重设的方法
======

对于那些想从舒适的 Windows 中享受 Linux 命令行的人来说，WSL（Windows Subsystem for Linux） 是一个方便的工具。

当你 [在 Windows 上使用 WSL 安装 Linux][1] 时，会要求你创建一个用户名和密码。当你在 WSL 上启动 Linux 时，这个用户会自动登录。

现在的问题是，如果你有一段时间没有使用它，你可能会忘记 WSL 的账户密码。而如果你要使用 `sudo` 的命令，这将成为一个问题，因为这里你需要输入密码。

![][2]

不要担心。你可以很容易地重置它。

### 在 Ubuntu 或任何其他 Linux 发行版上重置遗忘的 WSL 密码

要在 WSL 中重设 Linux 密码，你需要：

  * 将默认用户切换为 `root`
  * 重置普通用户的密码
  * 将默认用户切换回普通用户

让我向你展示详细的步骤和截图。

#### 步骤 1：将默认用户切换为 root

记下你的普通/常规用户名将是明智之举。如你所见，我的普通帐户的用户名是 `abhishek`。

![Note down the account username][3]

WSL 中的 `root` 用户是无锁的，没有设置密码。这意味着你可以切换到 `root` 用户，然后利用 `root` 的能力来重置密码。

由于你不记得帐户密码，切换到 `root` 用户是通过改变你的 Linux WSL 应用的配置，使其默认使用 `root` 用户来完成。

这是通过 Windows 命令提示符完成的，你需要知道你的 Linux 发行版需要运行哪个命令。

这个信息通常在 [Windows 商店][4] 中的发行版应用的描述中提供。这是你首次下载发行版的地方。

![Know the command to run for your distribution app][5]

从 Windows 菜单中，启动命令提示符：

![Start Command Prompt][6]

在这里，以这种方式使用你的发行版的命令。如果你使用的是 Windows 商店中的 Ubuntu 应用，那么该命令将是：

```
ubuntu config --default-user root
```

截图中，我正在使用 Windows 商店中的 Ubuntu 20.04 应用。所以，我使用了 ubuntu2004 命令。

![Set root as default user in Linux app’s configuration][7]

为了减少你的麻烦，我在这个表格中列出了一些发行版和它们各自的命令：

发行版应用 | Windows 命令
---|---
Ubuntu | `ubuntu config –default-user root`
Ubuntu 20.04 | `ubuntu2004 config –default-user root`
Ubuntu 18.04 | `ubuntu1804 config –default-user root`
Debian | `debian config –default-user root`
Kali Linux | `kali config –default-user root`

#### 步骤 2：重设帐户密码

现在，如果你启动 Linux 发行程序，你应该以 `root` 身份登录。你可以重新设置普通用户帐户的密码。

你还记得 WSL 中的用户名吗？（LCTT 译注：请使用你的“用户名”替换下列命令中的 `username`）如果没有，你可以随时检查 `/home` 目录的内容。当你有了用户名后，使用这个命令：

```
passwd username
```

它将要求你输入一个新的密码。**当你输入时，屏幕上将不会显示任何内容。这很正常。只要输入新的密码，然后点击回车就可以了。**你必须重新输入新的密码来确认，当你输入密码时，屏幕上也不会显示任何东西。

![Reset the password for the regular user][8]

恭喜你。用户账户的密码已经被重置。但你还没有完成。默认用户仍然是 `root`。你应该把它改回你的普通用户帐户，否则它将一直以 `root` 用户的身份登录。

#### 步骤 3：再次将普通用户设置为默认用户

你需要你在上一步中用 [passwd 命令][9] 使用的普通帐户用户名。

再次启动 Windows 命令提示符。**使用你的发行版命令**，方式与第 1 步中类似。然而，这一次，用普通用户代替 `root`。

```
ubuntu config --default-user username
```

![Set regular user as default user][10]

现在，当你在 WSL 中启动你的 Linux 发行版时，你将以普通用户的身份登录。你已经重新设置了密码，可以用它来运行 `sudo` 命令。

如果你将来再次忘记了密码，你知道重置密码的步骤。

### 如果重设 WSL 密码如此简单，这难道不是一种安全风险吗？

并非如此。你需要有对计算机的物理访问权以及对 Windows 帐户的访问权。如果有人已经有这么多的访问权，他/她可以做很多事情，而不仅仅是改变 WSL 中的 Linux 密码。

### 你是否能够重新设置 WSL 密码？

我给了你命令并解释了步骤。我希望这对你有帮助，并能够在 WSL 中重置你的 Linux 发行版的密码。

如果你仍然遇到问题，或者你对这个话题有疑问，请随时在评论区提问。

--------------------------------------------------------------------------------

via: https://itsfoss.com/reset-linux-password-wsl/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/install-bash-on-windows/
[2]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/06/reset-wsl-password.png?resize=800%2C450&ssl=1
[3]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/06/username-wsl.png?resize=800%2C296&ssl=1
[4]: https://www.microsoft.com/en-us/store/apps/windows
[5]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/06/wsl-distro-command.png?resize=800%2C602&ssl=1
[6]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/06/start-cmd-windows.jpg?resize=800%2C500&ssl=1
[7]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/06/wsl-set-root-as-default.png?resize=800%2C288&ssl=1
[8]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/06/resetting-wsl-password.png?resize=800%2C366&ssl=1
[9]: https://linuxhandbook.com/passwd-command/
[10]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/06/set-regular-user-as-default-wsl.png?resize=800%2C288&ssl=1

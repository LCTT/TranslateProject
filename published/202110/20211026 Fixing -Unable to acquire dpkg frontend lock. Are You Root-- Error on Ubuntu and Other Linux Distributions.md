[#]: subject: "Fixing “Unable to acquire dpkg frontend lock. Are You Root?” Error on Ubuntu and Other Linux Distributions"
[#]: via: "https://itsfoss.com/fixed-are-you-root-error/"
[#]: author: "Abhishek Prakash https://itsfoss.com/author/abhishek/"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-13936-1.html"

修复在 Ubuntu 上 “Unable to acquire dpkg frontend lock. Are You Root?” 的错误
======

![](https://img.linux.net.cn/data/attachment/album/202110/30/092452w21q1lyl1ntyy7t3.jpg)

我假设你对 Linux 很陌生。

你按照网上的一些教程，告诉你要安装某个程序或运行某个命令。可能是与服务器有关的东西。

但当你运行这个命令时，你遇到了这个错误：

```
E: Could not open lock file /var/lib/dpkg/lock-frontend – open (13: Permission denied)
E: Unable to acquire the dpkg frontend lock (/var/lib/dpkg/lock-frontend), are you root?
```

或者类似的错误：

```
dpkg: error: required read/write access to the dpkg database directory /var/lib/dpkg
E: Sub-process dpkg –set-selections returned an error code (2)
E: Executing dpkg failed. Are you root?
```

这两个错误都在问你同一个问题：你是 root 吗？而这就是这个问题的答案。成为 root。

### 成为 root 以避免这个错误

你如何 [在 Ubuntu][1] 或 Debian 中成为 root？你使用 `sudo` 命令。

是的，就是这样。无论你在运行什么命令，只要在它前面加上 `sudo` 即可。

```
sudo your_command
```

![Running command with sudo][2]

它将要求你输入你的用户账户密码。请记住，当你输入密码时，屏幕上不会显示任何东西，这也没关系。

你的系统没有任何问题。在大多数 Linux 系统中，输入密码时不会显示通常的星号或其他东西是一种“安全特性”。

只要输入密码，并在密码后按下回车键即可。如果密码输入正确，你现在应该可以运行该命令了。

你甚至可以使用这个方便的 [Linux 命令行技巧][3]，用 `sudo` 运行以前的命令：

```
sudo !!
```

这很简单，而且立即生效，除非你没有 sudo 权限。然后，你会看到一个不同的错误。

### 看到一个 “User is not in sudoer file” 的错误？

![Some users cannot run commands with sudo][4]

当你 [安装 Ubuntu][5] 时，你必须创建一个用户账户。这个用户被自动授予 `sudo` 权限，在需要时以 root 身份运行命令。

这发生在 Ubuntu 桌面上，而不是服务器上。大多数服务器发行版会有一个单独的 root 账户。如果你单独创建了一个普通账户，你就必须把这个用户添加到 `sudoer` 中，以便这个普通用户可以使用  `sudo`。

在上面的截图中，我已经创建了这个额外的用户，但没有将其添加到 sudo 组中。这意味着这里的用户 `prakash` 没有使用 `sudo` 命令的权限，因此系统抱怨 “prakash is not in sudoers file”。

#### 该事件在哪里报告？

错误的 `sudo` 尝试会被添加到系统日志中。它记录了用户名、虚拟终端号、运行命令的位置和运行的命令。

![Incorrect sudo attempts are logged into the system][6]

这些日志的位置在不同的发行版中有所不同。

通常，在 Ubuntu 中你可以在 `journalctl` 日志或 `/var/log/auth.log` 文件中找到它，在 Fedora 中可以在 `/var/log/audit/audit.log` 文件中找到它。

#### 如果一个用户不在 sudoer 列表中，你能做什么？

当你不能用当前的用户账户使用 `sudo` 时，你能做什么？首先，[验证该用户是否有 sudo 权限。如果没有，你可以有一些选择][7]：

  * 以 root 身份登录或切换 root 身份（如果你有 root 密码）。
  * [将该用户加入 sudoer 列表][8] （如果你有其他用户账户的管理或 `sudo` 权限）。
  * 如果你在多用户的 Linux 系统中，自己没有 root 或 `sudo` 权限，请你的系统管理员授予你的用户 sudo 权限或安装你想安装的应用。

### 这有帮助吗？

`sudo` 是一个非常全面的安全机制，它不仅仅是允许一个普通用户成为 root。它有助于对系统进行审计，了解哪个用户用 `sudo` 运行了哪个命令。它还可以被配置为只允许某个用户用 `sudo` 运行某些命令。

你不会在桌面 Linux 上看到如此细化的 `sudo` 配置，在桌面 Linux 上，它被预先配置为允许 `sudo` 组中的任何用户以 `root` 的身份运行任何命令。关于 `sudo` 的更多信息，请参见其他文章。

我希望在解决这个经典的初学者问题时，你能对 `sudo` 命令有一些初步的了解。如果你对这个主题有进一步的问题，请在评论区告诉我。

--------------------------------------------------------------------------------

via: https://itsfoss.com/fixed-are-you-root-error/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/root-user-ubuntu/
[2]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/10/running-commands-with-sudo.webp?resize=800%2C450&ssl=1
[3]: https://itsfoss.com/linux-command-tricks/
[4]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/10/not-in-sudoer-file-error-800x289.png?resize=800%2C289&ssl=1
[5]: https://itsfoss.com/install-ubuntu/
[6]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/10/sudo-incident-reported.png?resize=800%2C339&ssl=1
[7]: https://linuxhandbook.com/check-if-user-has-sudo-rights/
[8]: https://linuxhandbook.com/create-sudo-user/

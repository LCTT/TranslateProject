[#]: subject: "Bored With Bash? Change the Default Shell in Linux"
[#]: via: "https://itsfoss.com/linux-change-default-shell/"
[#]: author: "Abhishek Prakash https://itsfoss.com/author/abhishek/"
[#]: collector: "lujun9972/lctt-scripts-1700446145"
[#]: translator: "ChatGPT"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-16469-1.html"

对 Bash 感到厌倦？教你如何在 Linux 中更改默认 Shell
======

![][0]

Bash 并不是唯一可供选择的 Shell。还存在数量众多的 Shell，它们都有一些独特的特性，例如 Zsh、Fish、Ksh 和 [Xonsh][1]。

在你的系统中，你可以同时安装多个 Shell。

要想将另一个 Shell 设为默认值，你可以按照以下方式使用 chsh 命令：

```
chsh -s path_to_binary_of_shell
```

如需找到 Shell 的二进制路径，你可以查看 `/etc/shells` 文件的内容。另外，你也可使用以下自动获取所需 Shell 二进制路径的命令：

```
chsh -s $(which new_shell)
```

接下来，让我们详细了解一下如何确定并更改 Shell。

### 我现在用的是哪个 Shell？

有很多方法可以帮你找出当前使用的是哪个 Shell，虽然专家可能会辩论这些方法的准确度。

最常用的，也是最简单的方式是：

```
echo $0
```

[$0 是一个特别的 Shell 变量][2]，这可以获取你正在使用的 Shell 或 Shell 脚本的名称（如果你在脚本中使用了它）。

![][3]

你还可以使用下面的命令检查进程：

```
ps -p $
```

其中，`$` 代表的是当前进程 / Shell 的进程 ID。

![][4]

### 如何安装另一个 Shell？

和其他软件包一样，大部分知名 Shell，例如 [Fish][5] 和 Zsh，都可以直接从你的发行版软件仓库中下载安装。新的，相对小众的 Shell，例如 Xonsh，可能就需要不同的安装步骤了。你可以在它们的项目网页上找到具体的安装指南。

比如，你想 [在 Ubuntu 上安装 Zsh][6]，那么可以使用以下命令：

```
sudo apt install zsh

```

### 如何更改当前的 Shell？

假设你已经安装了另一个 Shell，那么我们来看一看如何切换过去。

实际上，你只需要输入新 Shell 的名称即可。比方说，你想切换到 Zsh，那就输入：

```
zsh
```

若要退出当前的 Shell，只需输入 `exit` 即可，你会回到你的默认 Shell。

### 如何查看默认的 Shell 是哪个？

有一个 `SHELL` 的环境变量，它可以告诉你当前账户的默认 Shell 是哪个：

```
echo $SHELL
```

举个例子，我切换到了 Zsh。此时，当前 Shell 显示的信息是 `zsh`，而默认 Shell 依然显示为 `bash`：

![][7]

这说明更改 Shell 并不会改变默认的 Shell。也就是说，下次你再次登录到该终端或系统，你还会返回到旧的默认 Shell，而不是新的 Shell。

### 如何知道系统中可用的 Shell 有哪些？

你可以通过查看 `/etc/shells` 文件，来了解系统中具有哪些可用的 Shell：

```
cat /etc/shells
```

下面就是我当前系统中所有可用的 Shell：

![][8]

### 如何更改默认的 Shell？

`/etc/shells` 文件的内容显示了所有可用 Shell 的二进制文件位置。你需要将它与 chsh 命令一起使用。

假设我想让 Zsh 成为默认的 Shell，我可以输入：

```
chsh -s /usr/bin/zsh
```

更改后，**你需要重新登入**才能看到变化。

请注意，以上操作只会更改当前用户的默认 Shell。如果你是管理员，并且想更改其他用户的默认 Shell，那么你可以使用以下命令：

```
sudo chsh -s /usr/bin/zsh other_username
```

### 结论

Linux 的一大特色就是，用户可以自主选择。你完全可以根据自己的需要进行更改。这就是另一个例子，你不必局限于发行版提供的默认 Shell 的选择。你很欢迎自选一款 Shell，让你的工作变得更顺手。最后，祝你使用愉快 😄

*（题图：DA/cf9b865d-2b98-4ada-88df-de1d1839aba1）*

--------------------------------------------------------------------------------

via: https://itsfoss.com/linux-change-default-shell/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[ChatGPT](https://linux.cn/lctt/ChatGPT)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/xonsh-shell/
[2]: https://linuxhandbook.com/bash-dollar-0/
[3]: https://itsfoss.com/content/images/2023/12/check-default-shell.png
[4]: https://itsfoss.com/content/images/2023/12/check-current-shell.png
[5]: https://fishshell.com/
[6]: https://itsfoss.com/zsh-ubuntu/
[7]: https://itsfoss.com/content/images/2023/12/current-shell-default-shell-1.png
[8]: https://itsfoss.com/content/images/2023/12/available-shells-1.png
[0]: https://img.linux.net.cn/data/attachment/album/202312/13/220515mvmrhk1efhh8fq17.jpg
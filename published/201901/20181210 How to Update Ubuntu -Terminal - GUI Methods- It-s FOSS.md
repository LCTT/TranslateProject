[#]: collector: (lujun9972)
[#]: translator: (LazyWolfLin)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10406-1.html)
[#]: subject: (How to Update Ubuntu [Terminal & GUI Methods] It's FOSS)
[#]: via: (https://itsfoss.com/update-ubuntu/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

初级：如何在终端及图形界面中更新 Ubuntu
======

> 这篇教程将向你展示如何更新服务器版本或者桌面版本的 Ubuntu。它还解释了更新和升级之间的区别以及你应该了解的有关于 Ubuntu Linux 中的更新的一些其他内容。

如果你是一个新手并已经体验 Ubuntu 数天或几周，你可能想知道如何更新你的 [Ubuntu][1] 系统以获取安全补丁，错误修复和应用升级。

更新 Ubuntu 非常简单。我并不是瞎说。它简单得只要运行两个命令。让我来告诉你这两个命令的更多细节。

请注意，本教程适用于 Ubuntu 18.04、16.04 或任何其他版本。命令行方式也适用于基于 Ubuntu 的发行版如 Linux Mint、Linux Lite、elementary OS 等。

### 通过命令行更新 Ubuntu

![如何更新 Ubuntu][2]

在桌面上，打开终端。你可以在菜单里找到它或者使用 `Ctrl+Alt+T` [快捷键][3]。如果你是登录到一台 [Ubuntu 服务器][4]，那你已经在访问一个终端了。

在终端里，你只需要使用以下命令：

```
sudo apt update && sudo apt upgrade -y
```

它将询问你密码，而你可以使用你的账号密码。输入时，你将不会看到任何内容在屏幕上，所以请继续输入你的密码并按回车键。

现在，我来解释下上面的命令。

事实上，这不是一条命令。它由两条命令组成。符号 `&&` 是合并两条命令的一个方法，第二条命令仅在前一条命令执行成功时执行。

当命令 `apt upgrade` 要求你在安装更新前确认时，末尾的参数 `-y` 会自动输入 `yes`。

请注意，你也可以逐条使用这两条命令：

```
sudo apt update
sudo apt upgrade
```

这将花费更长的时间，因为你必须等待第一条命令执行完成后才能输入第二条命令。

#### 说明：sudo apt update

这条命令更新了可用软件包的本地数据库。如果你没运行这条命令，本地数据库将不会被更新，而你的系统将不会知道是否有可用的新版本。

这就是为什么当你运行 `sudo apt update`，你会在输出中看到大量的 URL。这条命令会从对应的储存库（你在输出中看到的 URL）中获取软件包信息。

![更新 Ubuntu Linux][5]

在命令的末尾，它告诉你有多少个软件包可以被更新。你可以使用下列命令查看这些软件包：

```
apt list --upgradable
```

**补充阅读：** 阅读这篇文章了解[命令 apt update 的输出中的 Ign、Hit 和 Get 是什么][6]。

#### 说明：sudo apt upgrade

这条命令将已安装的软件包版本与本地数据库进行匹配。它收集全部信息，然后列出所有具有更新版本的软件包。此时，它会询问您是否要升级（已安装的软件包更新到新版本）。

![通过命令行更新 Ubuntu Linux][7]

你可以键入 `yes`、`y` 或者只敲回车键去确认安装这些更新。

所以总的来说，`sudo apt update` 会检查可用的新版本，而 `sudo apt upgrade` 实际上会执行更新。

命令 `update` 可能会令人困惑，因为你可能期望通过命令 `apt update` 安装更新来更新系统，但这并不会发生。

### 通过 GUI 更新 Ubuntu（适用于桌面用户）

如果你使用桌面版 Ubuntu，你并不需要为了更新系统而打开终端。你可以仍可以使用命令行更新，但这只是一个选择。

在菜单里，找到 “软件更新” 并运行它。

![在 Ubuntu 中运行 Software Updater][8]

它将检查你的系统是否有可用的更新。

![检查 Ubuntu 是否有可用更新][9]

如果有可用的更新，它将给你提供安装更新的选择。

![在 Ubuntu 中通过更新管理器安装更新][10]

现在，点击 “安装”，它可能会向你询问密码。

![通过 GUI 在 Ubuntu Linux 中安装更新][11]

一旦你输入你的密码，它将开始安装更新。

![通过 GUI 更新 Ubuntu][12]

在某些情况下，你可能需要重启系统才能使已安装的更新正常工作。如果需要重启系统，你将在更新结束时收到通知。

![通过 GUI 更新 Ubuntu][12]

如果你不希望马上重启你的系统，可以选择稍后重启。

![通过 GUI 在 Ubuntu 中安装更新][13]

提示：如果“软件更新”返回一个错误，你需要在终端是使用命令 `sudo apt update`。输出的最后几行将包含真正的错误信息。你可以在因特网上搜索该错误并解决问题。

### 更新 Ubuntu 时要记住几件事

你刚学习了如何更新你的 Ubuntu 系统。如果你感兴趣，你还需要了解一些关于 Ubuntu 更新的内容。

#### 更新后清理

你的系统将会有一些更新后不再需要的软件包。你可用使用这条命令删除这些软件包并[释放空间][14]：

```
sudo apt autoremove
```

####  在 Ubuntu Server 中内核热修复以避免重启

如果是 Linux 内核更新，你将需要在系统更新后重启。当你不希望服务器停机时，这将会是一个问题。

[热修复][15]功能允许 Linux 内核在持续运行时打补丁。换句话说就是你不需要重启你的系统。

如果你在管理服务器，你可能需要[在 Ubuntu 中启用热修复][16]。

#### 版本升级是不同的

本文讨论的更新是使你安装的 Ubuntu 保持最新。但它不包括[版本升级][17]（例如从 Ubuntu 16.04 升级到 18.04）。

[Ubuntu 版本][18] 升级完全是另一回事。它更新整个操作系统核心。你需要在这个漫长的过程开始前做好备份。

### 总结

我希望你喜欢这个关于 Ubuntu 系统更新的教程并学到一些新东西。

如果你有其他问题，请随时提出。如果你是一位经验丰富的 Linux 用户并且有些更好的技巧，请同我们分享。

--------------------------------------------------------------------------------

via: https://itsfoss.com/update-ubuntu/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[LazyWolfLin](https://github.com/LazyWolfLin)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://www.ubuntu.com/
[2]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2018/12/how-to-update-ubuntu.png?resize=800%2C450&ssl=1
[3]: https://itsfoss.com/ubuntu-shortcuts/
[4]: https://www.ubuntu.com/download/server
[5]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2018/12/update-ubunt-1.jpeg?resize=800%2C357&ssl=1
[6]: https://itsfoss.com/apt-get-linux-guide/
[7]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2018/12/update-ubunt-2.jpeg?ssl=1
[8]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2018/12/update-ubuntu-via-GUI-1.jpeg?resize=800%2C250&ssl=1
[9]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2018/12/update-ubuntu-via-GUI-2.jpeg?resize=800%2C250&ssl=1
[10]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2018/12/update-ubuntu-GUI-3.jpeg?resize=800%2C365&ssl=1
[11]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2018/12/install-update-ubuntu-1.jpg?resize=800%2C450&ssl=1
[12]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2018/12/installing-updates-ubuntu.jpg?ssl=1
[13]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2018/12/installing-updates-ubuntu-2.jpeg?ssl=1
[14]: https://itsfoss.com/free-up-space-ubuntu-linux/
[15]: https://www.ubuntu.com/livepatch
[16]: https://www.cyberciti.biz/faq/howto-live-patch-ubuntu-linux-server-kernel-without-rebooting/
[17]: https://itsfoss.com/upgrade-ubuntu-version/
[18]: https://itsfoss.com/how-to-know-ubuntu-unity-version/

[#]: subject: "How to Completely Uninstall Google Chrome From Ubuntu"
[#]: via: "https://itsfoss.com/uninstall-chrome-from-ubuntu/"
[#]: author: "Abhishek Prakash https://itsfoss.com/author/abhishek/"
[#]: collector: "lujun9972"
[#]: translator: "lkxed"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14368-1.html"

如何从 Ubuntu 中彻底卸载 Google Chrome
======

现在，你已经成功地 [在 Ubuntu 上安装 Google Chrome][1]。毕竟，它是世界上最受欢迎的网页浏览器了。

但是，你可能会不喜欢 Google 的产品，因为它们对用户的信息进行追踪和数据挖掘。你决定选择 [Ubuntu 上的其他网页浏览器][2]，并且它或许是一个 [非 Chromium 核心的浏览器][3]。

既然你已经不再使用 [Google Chrome][4] 了，那么，把它从 Ubuntu 系统中移除是一个明智的选择。

如何才能做到这一点呢？我来告诉你具体的步骤。

### 从 Ubuntu 中完全移除 Google Chrome

![Illustration for removing Google Chrome from Ubuntu][5]

你可能使用了图形界面的方式安装 Google Chrome，但不幸的是，你得使用命令行的方式来移除它，除非你选择 [使用 Synaptic 软件包管理器][6]。

使用命令行来做这件事也不是很难。首先，按下 [键盘上的 Ctrl+Alt+T 快捷键来打开一个终端][7]。

在终端中输入下面的命令：

```
sudo apt purge google-chrome-stable
```

此时它会向你索要一个密码，这个密码是你的用户账户密码，也就是你用来登录 Ubuntu 系统的密码。

当你输入密码的时候，屏幕上什么也不会显示。这是 Linux 系统的正常行为。继续输入密码，完成后按下回车键。

此时它会让你确认是否删除 Google Chrome，输入 `Y` 来确认，或者直接按下回车键也行。

![Removing Google Chrome for Ubuntu][8]

这个操作会从你的 Ubuntu Linux 系统中移除 Google Chrome，同时也会移除大多数相关的系统文件。

但是，你的个人设置文件仍然保留在用户主目录中。它包含了 Cookie、会话、书签和其他与你的账户相关的 Chrome 设置信息。当你下次安装 Google Chrome 时，这些文件可以被 Chrome 再次使用。

![Google Chrome leftover settings in Ubuntu][9]

如果你想要彻底地移除 Google Chrome，你可能会想要把这些文件也移除掉。那么，下面是你需要做的：

切换到 `.config` 目录。 **注意 config 前面有个点**`，这是 [Linux 隐藏文件和目录的方式][10]。

```
cd ~/.config
```

然后移除 `google-chrome` 目录：

```
rm -rf google-chrome
```

![Removing the leftover Google Chrome settings from Ubuntu][11]

你也可以仅使用一个命令 `rm -rf ~/.config/google-chrome` 来删除它。因为本教程面向的对象是完完全全的初学者，所以我把这个命令拆分为以上两个步骤来完成，这样可以减少由于拼写问题造成的可能错误。

> 小技巧
>
> 想要你的终端和截图里看起来一样漂亮吗？试试这些 [终端定制小技巧][12]。

我希望这篇快速的入门技巧可以帮助你在 Ubuntu 上摆脱 Google Chrome。

--------------------------------------------------------------------------------

via: https://itsfoss.com/uninstall-chrome-from-ubuntu/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[lkxed](https://github.com/lkxed)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/install-chrome-ubuntu/
[2]: https://itsfoss.com/best-browsers-ubuntu-linux/
[3]: https://itsfoss.com/open-source-browsers-linux/
[4]: https://www.google.com/chrome/index.html
[5]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/09/removing-google-chrome-ubuntu.png?resize=800%2C450&ssl=1
[6]: https://itsfoss.com/synaptic-package-manager/
[7]: https://itsfoss.com/open-terminal-ubuntu/
[8]: https://itsfoss.com/wp-content/uploads/2021/09/remove-google-chrome-ubuntu.webp
[9]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/09/google-chrome-ubuntu-leftover-settings.png?resize=800%2C518&ssl=1
[10]: https://itsfoss.com/hide-folders-and-show-hidden-files-in-ubuntu-beginner-trick/
[11]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/09/remove-google-chrome-leftover-settings-from-Ubuntu.png?resize=800%2C277&ssl=1
[12]: https://itsfoss.com/customize-linux-terminal/

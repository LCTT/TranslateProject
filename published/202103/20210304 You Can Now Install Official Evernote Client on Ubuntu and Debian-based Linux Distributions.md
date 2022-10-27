[#]: subject: (You Can Now Install Official Evernote Client on Ubuntu and Debian-based Linux Distributions)
[#]: via: (https://itsfoss.com/install-evernote-ubuntu/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)
[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13195-1.html)

在 Linux 上安装官方 Evernote 客户端
======

![](https://img.linux.net.cn/data/attachment/album/202103/12/064741kvenjiev6qvia4ia.jpg)

[Evernote][1] 是一款流行的笔记应用。它在推出时是一个革命性的产品。从那时起，已经有好几个这样的应用，可以将网络剪报、笔记等保存为笔记本格式。

多年来，Evernote 一直没有在 Linux 上使用的桌面客户端。前段时间 Evernote 承诺推出 Linux 应用，其测试版终于可以在基于 Ubuntu 的发行版上使用了。

> 非 FOSS 警报！
>
> Evernote Linux 客户端不是开源的。之所以在这里介绍它，是因为该应用是在 Linux 上提供的，我们也会不定期地介绍 Linux 用户常用的非 FOSS 应用。这对普通桌面 Linux 用户有帮助。

### 在 Ubuntu 和基于 Debian 的 Linux 发行版上安装 Evernote

进入这个 Evernote 的[网站页面][2]。

向下滚动一点，接受“早期测试计划”的条款和条件。你会看到一个“立即安装”的按钮出现在屏幕上。点击它来下载 DEB 文件。

![][3]

要 [从 DEB 文件安装应用][4]，请双击它。它应该会打开软件中心，并给你选择安装它。

![][5]

安装完成后，在系统菜单中搜索 Evernote 并启动它。

![][6]

当你第一次启动应用时，你需要登录到你的 Evernote 账户。

![][7]

第一次运行会带你进入“主页面”，在这里你可以整理你的笔记本，以便更快速地访问。

![][8]

你现在可以享受在 Linux 上使用 Evernote 了。

### 体验 Evernote 的 Linux 测试版客户端

由于软件处于测试版，因此这里或那里会有些问题。

如上图所示，Evernote Linux 客户端检测到 [Ubuntu 中的深色模式][9] 并自动切换到深色主题。然而，当我把系统主题改为浅色或标准主题时，它并没有立即改变应用主题。这些变化是在我重启 Evernote 应用后才生效的。

另一个问题是关于关闭应用。如果你点击 “X” 按钮关闭 Evernote，程序会进入后台而不是退出。

有一个似乎可以启动最小化的 Evernote 的应用指示器，就像 [Linux 上的 Skype][10]。不幸的是，事实并非如此。它打开了便笺，让你快速输入笔记。

这为你提供了另一个 [Linux 上的笔记应用][11]，但它也带来了一个问题。这里没有退出 Evernote 的选项。它只用于打开快速记事应用。

![][12]

那么，如何退出 Evernote 应用呢？为此，再次打开 Evernote 应用。如果它在后台运行，在菜单中搜索它，并启动它，就像你重新打开它一样。

当 Evernote 应用在前台运行时，点击 “文件->退出” 来退出 Evernote。

![][13]

这一点开发者应该在未来的版本中寻求改进。

我也不能说测试版的程序将来会如何更新。它没有添加任何仓库。我只是希望程序本身能够通知用户有新的版本，这样用户就可以下载新的 DEB 文件。

我并没有订阅 Evernote Premium，但我仍然可以在没有网络连接的情况下访问保存的网络文章和笔记。很奇怪，对吧？

总的来说，我很高兴看到 Evernote 终于努力把这个应用带到了 Linux 上。现在，你不必再尝试第三方应用来在 Linux 上使用 Evernote 了，至少在 Ubuntu 和基于 Debian 的发行版上是这样。当然，你可以使用 [Evernote 替代品][14]，比如 [Joplin][15]，它们都是开源的。

--------------------------------------------------------------------------------

via: https://itsfoss.com/install-evernote-ubuntu/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://evernote.com/
[2]: https://evernote.com/intl/en/b1433t1422
[3]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/03/evernote-early-access-linux.png?resize=799%2C495&ssl=1
[4]: https://itsfoss.com/install-deb-files-ubuntu/
[5]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/03/install-evernote-linux.png?resize=800%2C539&ssl=1
[6]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/03/evernote-ubuntu.jpg?resize=800%2C230&ssl=1
[7]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/03/evernote-running-ubuntu.png?resize=800%2C505&ssl=1
[8]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/03/evernote-on-ubuntu.png?resize=800%2C537&ssl=1
[9]: https://itsfoss.com/dark-mode-ubuntu/
[10]: https://itsfoss.com/install-skype-ubuntu-1404/
[11]: https://itsfoss.com/note-taking-apps-linux/
[12]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/03/evernote-app-indicator.png?resize=800%2C480&ssl=1
[13]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/03/quit-evernote-linux.png?resize=799%2C448&ssl=1
[14]: https://itsfoss.com/5-evernote-alternatives-linux/
[15]: https://itsfoss.com/joplin/

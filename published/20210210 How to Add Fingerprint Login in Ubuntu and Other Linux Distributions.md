[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13337-1.html)
[#]: subject: (How to Add Fingerprint Login in Ubuntu and Other Linux Distributions)
[#]: via: (https://itsfoss.com/fingerprint-login-ubuntu/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

如何在 Ubuntu 中添加指纹登录
======

![](https://img.linux.net.cn/data/attachment/album/202104/26/191530msmenm3ges3kgyet.jpg)

现在很多高端笔记本都配备了指纹识别器。Windows 和 macOS 支持指纹登录已经有一段时间了。在桌面 Linux 中，对指纹登录的支持更多需要极客的调整，但 [GNOME][1] 和 [KDE][2] 已经开始通过系统设置来支持它。

这意味着在新的 Linux 发行版上，你可以轻松使用指纹识别。在这里我将在 Ubuntu 中启用指纹登录，但你也可以在其他运行 GNOME 3.38 的发行版上使用这些步骤。

> **前提条件**
>
> 当然，这是显而易见的。你的电脑必须有一个指纹识别器。
>
> 这个方法适用于任何运行 GNOME 3.38 或更高版本的 Linux 发行版。如果你不确定，你可以[检查你使用的桌面环境版本][3]。
>
> KDE 5.21 也有一个指纹管理器。当然，截图看起来会有所不同。

### 在 Ubuntu 和其他 Linux 发行版中添加指纹登录功能

进入 “设置”，然后点击左边栏的 “用户”。你应该可以看到系统中所有的用户账号。你会看到几个选项，包括 “指纹登录”。

点击启用这里的指纹登录选项。

![Enable fingerprint login in Ubuntu][4]

它将立即要求你扫描一个新的指纹。当你点击 “+” 号来添加指纹时，它会提供一些预定义的选项，这样你就可以很容易地识别出它是哪根手指或拇指。

当然，你可以点击右手食指但扫描左手拇指，不过我看不出你有什么好的理由要这么做。

![Adding fingerprint][5]

在添加指纹时，请按照指示旋转你的手指或拇指。

![Rotate your finger][6]

系统登记了整个手指后，就会给你一个绿色的信号，表示已经添加了指纹。

![Fingerprint successfully added][7]

如果你想马上测试一下，在 Ubuntu 中按 `Super+L` 快捷键锁定屏幕，然后使用指纹进行登录。

![Login With Fingerprint in Ubuntu][8]

#### 在 Ubuntu 上使用指纹登录的经验

指纹登录顾名思义就是使用你的指纹来登录系统。就是这样。当要求对需要 `sudo` 访问的程序进行认证时，你不能使用手指。它不能代替你的密码。

还有一件事。指纹登录可以让你登录，但当系统要求输入 `sudo` 密码时，你不能用手指。Ubuntu 中的 [钥匙环][9] 也仍然是锁定的。

另一件烦人的事情是因为 GNOME 的 GDM 登录界面。当你登录时，你必须先点击你的账户才能进入密码界面。你在这可以使用手指。如果能省去先点击用户帐户 ID 的麻烦就更好了。

我还注意到，指纹识别没有 Windows 中那么流畅和快速。不过，它可以使用。

如果你对 Linux 上的指纹登录有些失望，你可以禁用它。让我在下一节告诉你步骤。

### 禁用指纹登录

禁用指纹登录和最初启用指纹登录差不多。

进入 “设置→用户”，然后点击指纹登录选项。它会显示一个有添加更多指纹或删除现有指纹的页面。你需要删除现有的指纹。

![Disable Fingerprint Login][10]

指纹登录确实有一些好处，特别是对于我这种懒人来说。我不用每次锁屏时输入密码，我也对这种有限的使用感到满意。

用 [PAM][11] 启用指纹解锁 `sudo` 应该不是完全不可能。我记得我 [在 Ubuntu 中设置脸部解锁][12]时，也可以用于 `sudo`。看看以后的版本是否会增加这个功能吧。

你有带指纹识别器的笔记本吗？你是否经常使用它，或者它只是你不关心的东西之一？

--------------------------------------------------------------------------------

via: https://itsfoss.com/fingerprint-login-ubuntu/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://www.gnome.org/
[2]: https://kde.org/
[3]: https://itsfoss.com/find-desktop-environment/
[4]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/02/enable-fingerprint-ubuntu.png?resize=800%2C607&ssl=1
[5]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/02/adding-fingerprint-login-ubuntu.png?resize=800%2C496&ssl=1
[6]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/02/adding-fingerprint-ubuntu-linux.png?resize=800%2C603&ssl=1
[7]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/02/fingerprint-added-ubuntu.png?resize=797%2C510&ssl=1
[8]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/02/login-with-fingerprint-ubuntu.jpg?resize=800%2C320&ssl=1
[9]: https://itsfoss.com/ubuntu-keyring/
[10]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/02/disable-fingerprint-login.png?resize=798%2C524&ssl=1
[11]: https://tldp.org/HOWTO/User-Authentication-HOWTO/x115.html
[12]: https://itsfoss.com/face-unlock-ubuntu/

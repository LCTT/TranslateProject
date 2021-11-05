[#]: subject: "Seahorse: Manage Your Passwords & Encryption Keys in Linux"
[#]: via: "https://itsfoss.com/seahorse/"
[#]: author: "Ankush Das https://itsfoss.com/author/ankush/"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-13884-1.html"

Seahorse：在 Linux 中管理你的密码和加密密钥
======

![](https://img.linux.net.cn/data/attachment/album/202110/15/120409ltfmw33c5xpw5bcx.jpg)

> Seahorse 是一个简洁的开源密码和加密密钥管理器，让我们来探讨一下它的功能和如何安装它。

我们经常倾向于忽视许多默认/预装的应用，尤其是在内置了大量工具和实用程序时。

你可以在各种 Linux 发行版上使用的这样一个有用的工具是 **GNOME 的 Seahorse**。

### Seahorse：GNOME 的密码及加密密钥管理器

![][1]

主要来说，Seahorse 是一个预装在 GNOME 桌面的应用，并为其量身定做。

然而，你可以在你选择的任何 Linux 发行版上使用它。它是一个简单而有效的工具，可以在本地管理你的密码和加密密钥/钥匙环。

如果你是第一次使用，你可能想读一下 [Linux 中钥匙环的概念][2]。

如果你不喜欢基于云的密码管理器，Seahorse 可以很好地解决你的要求。尽管它看起来很简单，但有几个基本功能你可能会觉得很有用。

当然，如果你的不太涉及管理加密密钥（或本地存储），你也应该探索一些 [可用于 Linux 的最佳密码管理器][3] 。

### Seahorse 的特点

虽然你可以很容易地把它作为一个本地（离线）密码管理器，但在处理加密密钥时，你也可以用 Seahorse 做一些事情来加强你的安全管理。

![][4]

一些关键的亮点是:

  * 能够存储 SSH 密钥（用于访问远程计算机/服务器）
  * 存储用于保护电子邮件和文件的 GPG 密钥
  * 支持为应用和网络添加密码钥匙环
  * 安全地存储证书的私钥
  * 存储一个密码/密语
  * 能够导入文件并快速存储它们
  * 查找远程密钥
  * 同步和发布密钥
  * 能够查找/复制 VPN 密码

![][5]

### 在 Linux 中安装 Seahorse

如果你使用的是基于 GNOME 的发行版，你应该已经安装了它。你可以搜索 “Seahorse” 或者 “Passwords” 来找到它。

在其他情况下，你可以在软件中心搜索到它。根据我的快速测试，它在 KDE、LXQt 和不同的桌面环境下应该可以正常工作。

![][6]

此外，你可以找到它的 [Flatpak 包][7]。所以，无论你使用的是哪种 Linux 发行版，都可以安装 Seahorse。

如果你使用的是 Arch Linux，你也应该在 [AUR][8] 中找到它。

- [Seahorse][9]

你对使用 Seahorse 来取代其他密码管理器有何看法？你是否已经用它来管理加密密钥？请在下面的评论中告诉我你的想法。

--------------------------------------------------------------------------------

via: https://itsfoss.com/seahorse/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/10/seahorse-password-keys.png?resize=800%2C613&ssl=1
[2]: https://itsfoss.com/ubuntu-keyring/
[3]: https://itsfoss.com/password-managers-linux/
[4]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/10/seahorse-login.png?resize=800%2C583&ssl=1
[5]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/10/seahorse-keys.png?resize=800%2C579&ssl=1
[6]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/10/seahorse-software.png?resize=800%2C508&ssl=1
[7]: https://www.flathub.org/apps/details/org.gnome.seahorse.Application
[8]: https://itsfoss.com/aur-arch-linux/
[9]: https://wiki.gnome.org/Apps/Seahorse/

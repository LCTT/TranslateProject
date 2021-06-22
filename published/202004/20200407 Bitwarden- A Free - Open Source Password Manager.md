[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12111-1.html)
[#]: subject: (Bitwarden: A Free & Open Source Password Manager)
[#]: via: (https://itsfoss.com/bitwarden/)
[#]: author: (Ankush Das https://itsfoss.com/author/ankush/)

Bitwarden：一个自由开源的密码管理器
======

> Bitwarden 是流行的开源密码管理器。在这里，我们来看看它提供了什么。

![][1]

[Bitwarden][2] 是一个自由开源的密码管理器。你可能还记得，我们之前将它列为 [Linux 中的最佳密码管理器][3]之一。

就个人而言，几个月来我一直在多个设备上使用 Bitwarden 作为我的密码管理器。因此，在本文中，我将说明它提供的功能以及我的使用经验。

**注意：** 如果你对服务的安全性有疑问，请查看其官方安全性[常见问题页面][4]。

### Bitwarden 密码管理器的特性

![][5]

[Bitwarden][2] 是许多其他方便的密码管理器的不错替代品。

以下是它的特性：

  * 提供免费和付费选择
  * 适用于团队（企业）和个人
  * 开源
  * 支持自托管
  * 能够作为身份验证器应用（如 Google 身份验证器）
  * 跨平台支持（安卓、iOS、Linux、Windows 和 macOS）
  * 提供浏览器扩展（Firefox,、Chrome、Opera、Edge、Safari）
  * 提供命令行工具
  * 提供网页保管库
  * 能够导入/导出密码
  * [密码生成器][6]
  * 自动填充密码
  * 两步身份验证

从技术上讲，Bitwarden 使用完全免费。然而，它也提供了一些付费计划（个人付费和商务付费计划）。

通过付费计划，你可以与更多用户共享密码、获取 API 访问权限（业务使用）以及更多此类高级功能。

以下是定价（在编写本文时）：

![][7]

对于大多数个人来说，考虑到支持开源项目，10 美元/年的高级个人计划不应成为问题。当然，你也可以选择没有限制地免费使用。

### 在 Linux 上安装 Bitwarden

![][8]

很容易将 Bitwarden 安装到你的 Linux 系统上，因为它提供了一个 .AppImage 文件。如果你还不知道[如何使用 AppImage][9] 文件，你可以参考我们的指南。

如果你不喜欢使用 AppImage，你可以选择 [snap 包][10]或在其[官方下载页面][11]上下载 .deb 或者 .rpm 文件。你还可以查看其 [GitHub 页面][12]了解更多信息。

- [下载 Bitwarden][2]

如果你对使用桌面应用不感兴趣，也可以使用浏览器扩展。

### 我使用 Bitwarden 的体验

在 Bitwarden 之前，我使用 [LastPass][13] 作为密码管理器。尽管这不是一个糟糕的选择，但它不是开源软件。

所以，在我发现 Bitwarden 后就决定使用它。

首先，我从 LastPass 导出我的数据，并导入到 Bitwarden 没有遇到困难。在此过程中我没有丢失任何数据。

除了桌面应用，我一直在使用 Bitwarden 的火狐插件和 Android 应用。使用六个多月后，我没有遇到任何问题。所以，如果你愿意试试看，我一定会给它好评！

### 总结

我想说，对于那些想要一个可以到处工作，并且跨设备轻松同步的密码管理器的用户而言，Bitwarden 是一个完整的解决方案。

你可以免费入门，但如果可以，请购买 **10 美元/年**的高级计划来支持这个开源项目。

如果你正在寻找更多选择，你也可以查看我们的 [Linux 中 5 个最佳密码管理器][3]。

你试过 Bitwarden 了吗？如果没有，请试试看！此外，你最喜欢的密码管理器是什么？让我在下面的评论中知道！

--------------------------------------------------------------------------------

via: https://itsfoss.com/bitwarden/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/04/bitwarden-screenshot.jpg?ssl=1
[2]: https://bitwarden.com/
[3]: https://linux.cn/article-11531-1.html
[4]: https://help.bitwarden.com/security/
[5]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/04/bitwarden-dark-mode.jpg?ssl=1
[6]: https://itsfoss.com/password-generators-linux/
[7]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/04/bitwarden-pricing.jpg?ssl=1
[8]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/04/bitwarden-settings.png?ssl=1
[9]: https://itsfoss.com/use-appimage-linux/
[10]: https://snapcraft.io/bitwarden
[11]: https://bitwarden.com/#download
[12]: https://github.com/bitwarden
[13]: https://www.lastpass.com/

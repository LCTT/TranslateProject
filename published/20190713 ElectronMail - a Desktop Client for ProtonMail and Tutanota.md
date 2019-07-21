[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11128-1.html)
[#]: subject: (ElectronMail – a Desktop Client for ProtonMail and Tutanota)
[#]: via: (https://itsfoss.com/electronmail/)
[#]: author: (John Paul https://itsfoss.com/author/john/)

ElectronMail：ProtonMail 和 Tutanota 的桌面客户端
======

互联网上的大多数人都拥有来自 Google 等大公司的电子邮件帐户，但这些帐户不尊重你的隐私。值得庆幸的是，目前有 [Tutanota][1] 和 [ProtonMail][2] 等具有隐私意识的替代品。问题是并非所有人都有桌面客户端。今天，我们将研究一个为你解决该问题的项目。我们来看看 ElectronMail 吧。

> ‘Electron’ 警告！

> 以下应用是使用 Electron 构建的（也就是名为 ElectronMail 的原因之一）。如果使用 Electron 让你感到不安，请将此视为触发警告。

### ElectronMail：Tutanota 和 ProtonMail 的桌面客户端

![Electron Mail About][3]

[ElectronMail][4] 可以简单地视作 ProtonMail 和 Tutanota 的电子邮件客户端。它使用三大技术构建：[Electron][5]、[TypeScript][6] 和 [Angular][7]。它包括以下功能：

* 针对每个电子邮件提供商提供多帐户支持
* 加密本地存储
* 适用于 Linux、Windows、macOS 和 FreeBSD
* 原生通知系统
* 带有未读消息总数的系统托盘图标
* 用主密码保护帐户信息
* 可切换的视图布局
* 可离线访问电子邮件
* 电子邮件在本地加密存储
* 批量导出电子邮件为 EML 文件
* 全文搜索
* 内置/预打包的 Web 客户端
* 可以为每个帐户配置代理
* 拼写检查
* 支持双因素身份验证，以提高安全性

目前，ElectronMail 仅支持 Tutanota 和 ProtonMail。我觉得他们将来会增加更多。根据 [GitHub 页面][4]：“多电子邮件提供商支持。目前支持 ProtonMail 和 Tutanota。”

ElectronMail 目前是 MIT 许可证。

#### 如何安装 ElectronMail

目前，有几种方法可以在 Linux 上安装 ElectronMail。对于Arch 和基于 Arch 的发行版，你可以从[Arch 用户仓库][8]安装它。ElectrionMail 还有一个 Snap 包。要安装它，只需输入 `sudo snap install electron-mail` 即可。

对于所有其他 Linux 发行版，你可以[下载][9] `.deb` 或 `.rpm` 文件。

![Electron Mail Inbox][10]

你也可以[下载][9]用于 Windows 中的 `.exe` 安装程序或用于 macOS 的 `.dmg` 文件。甚至还有给 FreeBSD 用的文件。

#### 删除 ElectronMail

如果你安装了 ElectronMail 并确定它不适合你，那么[开发者][12]建议采用几个步骤。 **在卸载应用之前，请务必遵循以下步骤。**

如果你使用了“保持登录”功能，请单击菜单上的“注销”。这将删除本地保存的主密码。卸载 ElectronMail 后也可以删除主密码，但这涉及编辑系统密钥链。

你还需要手动删除设置文件夹。在系统托盘中选择应用图标后，单击“打开设置文件夹”可以找到它。

![Electron Mail Setting][13]

### 我对 ElectronMail 的看法

我通常不使用电子邮件客户端。事实上，我主要依赖于 Web 客户端。所以，这个应用对我没太大用处。

话虽这么说，但是 ElectronMail 看着不错，而且很容易设置。它有大量开箱即用的功能，并且高级功能并不难使用。

我遇到的一个问题与搜索有关。根据功能列表，ElectronMail 支持全文搜索。但是，Tutanota 的免费版本仅支持有限的搜索。我想知道 ElectronMail 如何处理这个问题。

最后，ElectronMail 只是一个基于 Web Email 的一个 Electron 封装。我宁愿在浏览器中打开它们，而不是将单独的系统资源用于运行 Electron。如果你只[使用 Tutanota，他们有自己官方的 Electron 桌面客户端][14]。你可以尝试一下。

我最大的问题是安全性。这是两个非常安全的电子邮件应用的非官方应用。如果有办法捕获你的登录信息或阅读你的电子邮件怎么办？比我聪明的人必须通过源代码才能确定。这始终是一个安全项目的非官方应用的问题。

你有没有使用过 ElectronMail？你认为是否值得安装 ElectronMail？你最喜欢的邮件客户端是什么？请在下面的评论中告诉我们。

如果你发现这篇文章很有趣，请花一点时间在社交媒体、Hacker News 或 [Reddit][15] 上分享它。

--------------------------------------------------------------------------------

via: https://itsfoss.com/electronmail/

作者：[John Paul][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/john/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/tutanota-review/
[2]: https://itsfoss.com/protonmail/
[3]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/07/electron-mail-about.jpg?resize=800%2C500&ssl=1
[4]: https://github.com/vladimiry/ElectronMail
[5]: https://electronjs.org/
[6]: http://www.typescriptlang.org/
[7]: https://angular.io/
[8]: https://aur.archlinux.org/packages/electronmail-bin
[9]: https://github.com/vladimiry/ElectronMail/releases
[10]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/07/electron-mail-inbox.jpg?ssl=1
[12]: https://github.com/vladimiry
[14]: https://linux.cn/article-10688-1.html
[15]: http://reddit.com/r/linuxusersgroup

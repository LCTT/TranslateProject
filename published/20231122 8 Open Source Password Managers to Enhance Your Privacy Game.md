[#]: subject: "8 Open Source Password Managers to Enhance Your Privacy Game"
[#]: via: "https://itsfoss.com/open-source-password-managers/"
[#]: author: "Ankush Das https://itsfoss.com/author/ankush/"
[#]: collector: "lujun9972/lctt-scripts-1700446145"
[#]: translator: "ChatGPT"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-16412-1.html"

8 个提升你的隐私防护的开源密码管理器
======

![][0]

> 使用一些顶级开源密码管理器，确保你的登录凭证安全无虞。

密码管理器是一项非常有用的实用程序。在你想寻找一个合适的密码管理器时，有着丰富的选择。

你的智能手机制造商、浏览器、抗病毒软件都会提供密码管理器，并且还有其他多种第三方的选项。根据你的实际需求和便利性，你可以选择使用任何一款密码管理器。

但是，如果你偏爱开源的密码管理器，想要尝试使用开源的替代私有的？你有哪些选择呢？

这里，让我来为你揭示所有重要的信息。

### 为何选择开源的密码管理器？

密码管理器是一种关键的工具，它能存储各种敏感的数据，包括：

  * 账号凭据
  * 安全笔记
  * 恢复代码
  * 2FA 令牌（某些情况下）
  
因此，使用一款能提供顶级隐私保护和安全性的密码管理器极为重要。

而选择开源选项，你将得到更好的透明度，并将有更多的人共同努力确保密码管理器的安全。

当然，如果你希望参与贡献、审查和改进密码管理器，你需要具备一定的技术能力。但是，即使你没有时间参与进来，用户和开发者社区依然会努力核实产品所做出的承诺。

这就是使用开源密码管理器所获得的优势。

对于私有的解决方案，你需要完全信任产品公司，而且你无法自行验证他们的声明。

考虑到选择安全工具的利弊，我在此为你推荐一些最受用户欢迎的密码管理器。

### 1、KeePass

![][1]

[KeePass][2] 是一款为 Windows 用户提供的卓越的开源密码管理器。你还可以试试 [利用 Wine 在 Linux 环境中运行这款 Windows 应用][3]。

这是一个纯本地的密码管理器，允许你将所有密码保存在一个数据库中。数据库经过加密，并设有主密钥保护（要牢记密钥，避免遗失）。

你可以根据需要，自主决定是否将数据库文件同步到任何选定的云存储中。但一般来说，将数据保存在自己的系统上，比存储在云端更为安全。

你既可以选择安装 KeePass，也可以通过 USB 设备运行它的便携版。此外，它还具备众多实用的功能，如附加附件、排序和导入导出等等。

亮点：

  * 仅限本地使用
  * 可用的便携版
  * 支持导入 / 导出功能
  * 可通过分组 / 排序管理密码
  * 插件可用于增强功能集

### 2、Bitwarden

![][4]

[Bitwarden][5] 是一款强大、跨平台的密码管理器，涵盖了桌面应用程序和浏览器扩展。它与 KeePass 不同的之处在于，Bitwarden 依赖云端进行密码的加密和存储，大大提高了在多终端之间同步数据的便捷性。

Bitwarden 集成了你在密码管理器中可能需要的所有核心功能，而且对个人用户来说，所有的这些功能都有一个可承受的订阅价格。

你将得到一个使用起来更舒适的用户界面，并有众多功能供你使用。

亮点：

  * 浏览器扩展和桌面应用
  * 移动应用
  * 提供自托管或基于云端的选项
  * 支持命令行界面访问
  * 对高级用户开放的紧急访问权限
  * 价格适中
  * 支持导入 / 导出功能
  * 提供 Bitwarden Send 功能，安全分享文本 / 笔记

### 3、Proton Pass

![][6]

[Proton Pass][7] 是以隐私保护为核心的 Proton 公司提供的优秀产品之一。

如果你已经在使用 Proton Mail 和 Proton VPN，并且希望从同一家值得信赖的公司使用多种服务，那么 Proton Pass 将是一个很好的选择。

你可以安装浏览器插件来开始使用 Proton Pass。在本文撰写时，它并未提供任何桌面应用程序。

除了所有基本功能外，你还可以在密码管理器内部使用电子邮件别名功能。随着 Proton Pass 的多样性，我们也提供了一个深入的 [Proton Pass 和 Bitwarden 的比较][8]。

亮点：

  * 浏览器插件
  * 基于云
  * 移动应用
  * 作为 Proton 工具系列的一部分，使用起来非常方便
  * 邮件别名
  * 支持导入 / 导出

### 4、KeePassXC

![][10]

如果你对 KeePass 的功能感兴趣，并且需要原生的 Linux 支持，那么 [KeePassXC][11] 会是个不错的选择。

你将获得跨平台支持和浏览器扩展支持，无需依赖于插件。

总的来说，KeePassXC 可以视为 KeePass 的现代化替代版本，对用户体验进行了一些改善。

亮点：

  * 仅支持离线
  * KeePass 的现代替代
  * 原生支持 Linux 和 macOS
  * 支持导入 / 导出

### 5、Passbolt

[Passbolt][12] 是一个为企业用户（或团队）设计的开源密码管理器。

不同于其他选择，Passbolt 不适合个人使用。你可以选择自我托管，或选择云托管版本，并根据你的实际需求选择适当的订阅方案。

尽管在社区版中，Passbolt 提供了所有基础的功能，但通过订阅计划你可以解锁更多的功能。

亮点：

  * 专为企业和团队定制
  * 自托管或基于云
  * 支持命令行界面访问

### 6、Buttercup

![][13]

如果你在寻找一款优先考虑本地使用的密码管理器，那么[Buttercup][14] 就是一个针对 macOS、Linux 和 Windows 的理想选择。

如果你不需要云同步功能，但希望寻找一款与 KeePass 用户体验不同的密码管理器，那么 Buttercup 将是一个好的替代品。

这是一个带有简洁用户界面的跨平台开源密码管理器，同时提供了移动应用程序。

亮点：

  * 仅支持离线使用
  * 易用性强
  * 兼容多平台
  * 界面简洁现代
  * 提供扩展支持

### 7、KWalletManager

![][15]

[KWalletManager][16] 是一款 [专为 Linux 设计的密码管理器][17]，可对所有的用户凭证进行加密存储。

虽然它能在任何桌面环境下工作，但如果你使用的是 KDE 驱动的 Linux 系统，它能更好地与其他应用集成。

如果你需要一个能与应用程序集成、实现从 Linux 系统保存或自动填充密码的工具，KWalletManager 是个不错的选择。在某些情况下，它可能已经预装在 Linux 发行版中。如果你不打算使用 KWallet，应[禁用 KDE 钱包][18]。

亮点：

  * 仅支持离线使用
  * 简单易用
  * 专为 Linux 定制

### 8、密码和秘密（即 GNOME 的 Seahorse）

![][19]

Seahorse 是 GNOME 发展出的一个实用工具，能存储密码并管理加密密钥。与 KWallet 类似，它是一款专为 Linux 设计的应用程序，与 Ubuntu 和其他几种发行版一起预装。

它不仅仅是一个传统的密码管理器，它还提供了许多其他功能，并且所有这一切都封装在了一个简洁的用户界面中。

亮点：

  * 仅支持离线使用
  * 专为 Linux 定制
  * 可管理加密密钥和密码

### 总结

任何一款密码管理器都包含了全部的基础功能。因此，你需要根据具体的情况来做选择，比如是否支持自我托管、是否有紧急的共享访问，以及根据价格计划来决定所需的功能集等。

如果你需要一款以浏览器中心化的密码管理器，Proton Pass 就是不错的选择。而 KeePass 以及它的现代化版本 KeePassXC 是完美的离线工具。Bitwarden 则是全能解决方案。最后，Buttercup 和 Passbolt 对于那些希望体验最小化或需要团队协作功能的用户来说，也是独特的选择。

*（题图：MJ/8d97ac3c-1ed9-4dae-a176-03d99e6e8391）*

--------------------------------------------------------------------------------

via: https://itsfoss.com/open-source-password-managers/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[ChatGPT](https://linux.cn/lctt/ChatGPT)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/content/images/2023/11/keepass-windows.png
[2]: https://keepass.info/
[3]: https://itsfoss.com/use-windows-applications-linux/
[4]: https://itsfoss.com/content/images/2023/11/bitwarden-extension-ui.jpg
[5]: https://bitwarden.com/
[6]: https://itsfoss.com/content/images/2023/11/proton-pass-ui-1.jpg
[7]: https://proton.me/pass
[8]: https://itsfoss.com/bitwarden-vs-proton-pass/
[9]: https://itsfoss.com/content/images/size/w256h256/2022/12/android-chrome-192x192.png
[10]: https://itsfoss.com/content/images/2023/11/keepassxc.png
[11]: https://keepassxc.org/
[12]: https://www.passbolt.com/
[13]: https://itsfoss.com/content/images/2023/11/buttercup.png
[14]: https://buttercup.pw/
[15]: https://itsfoss.com/content/images/2023/11/kde-wallet.jpg
[16]: https://apps.kde.org/kwalletmanager5/
[17]: https://itsfoss.com/password-managers-linux/
[18]: https://itsfoss.com/disable-kde-wallet/
[19]: https://itsfoss.com/content/images/2023/11/passwords-secrets.png
[0]: https://img.linux.net.cn/data/attachment/album/202311/24/225319u3zy737zozu3col4.png
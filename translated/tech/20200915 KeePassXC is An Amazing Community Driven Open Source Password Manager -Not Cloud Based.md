[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (KeePassXC is An Amazing Community Driven Open Source Password Manager [Not Cloud Based])
[#]: via: (https://itsfoss.com/keepassxc/)
[#]: author: (Ankush Das https://itsfoss.com/author/ankush/)

KeePassXC 是一个很好的社区驱动的开源密码管理器（不是基于云）
======

_**简介：KeePassXC 是一款有用的开源跨平台密码管理器，它即使不是云端工具，也没有在功能上妥协。下面，我们就来快速了解一下它。**_

### KeePassXC：一个跨平台的开源密码管理器

![][1]

KeePassXC 是 [KeePassX][2] 的社区分支，旨在成为 [KeePass Password Safe][3] 的跨平台移植（适用于 Windows）。它是完全免费使用和跨平台的（Windows、Linux 和 macOS)。

事实上，它是目前 [Linux 最佳密码管理器][4]之一。它的功能选项既适合新手，也适合那些想要进一步控制以保护系统上的密码数据库的高级用户。

是的，与我[最喜欢的 Bitwarden 密码管理器][5]不同，KeePassXC 不是基于云端的，密码永远不会离开系统。有些用户确实喜欢不把密码和秘密保存在云服务器中。

当你开始使用密码管理器时，你应该能在它上找到你所需要的所有基本功能。但是，在这里，为了让你初步了解，我会强调一些提供的功能。

### KeePassXC 的功能

![][6]

值得注意的是，对于一个新手来说，这些功能可能会让人有点不知所措。但是，考虑到你想充分使用它，我想你应该真正了解它所提供的功能：


* 密码生成器
* 能够从1Password、KeePass 1 和任何 CSV 文件导入密码。
* 通过导出和同步 SSL 证书支持，轻松共享数据库。
* 支持数据库加密 （256 位 AES）
* 浏览器集成(可选)
* 能够搜索你的密码
* 在应用中自动输入密码
* 数据库报告，以检查密码的健康状况和其他统计数字
* 支持导出为 CSV 和 HTML
* 支持双因素认证令牌
* 支持将文件附加到密码中
* 支持 YubiKey
* 可用命令行选项
* 集成 SSH Agent
* 必要时改变加密算法
* 能够使用 DuckDuckGO 下载网站图标。
* 数据库超时自动锁定
* 清除剪贴板和搜索查询的能力。
* 自动保存文件
* 支持文件夹/嵌套文件夹
* 设置密码的有效期
* 提供黑暗主题
* 跨平台支持



正如你所看到的，它的确是一款功能丰富的密码管理器。所以，我建议你如果想使用目前的每一个选项，就好好探索它。

![][7]

### 在 Linux 上安装 KeePassXC

你应该能在你安装的发行版的软件中心找到它。

你也可以从官方网站上获得 AppImage 文件。如果你还不知道的话，我建议你去看看我们的[在 Linux 中使用 AppImage 文件][8]的指南。

另外，你还会发现有一个 snap 包可以用。除此之外，你还可以得到 Ubuntu PPA、Debian 包、Fedora 包和 Arch 包。

如果你好奇，你可以直接探索[官方下载页面][9]的可用包，并查看他们的 [GitHub 页面][10]的源代码。


[Get KeePassXC][11]

### 总结

如果你不是 [Bitwarden][5] 等云端开源密码管理器的粉丝，KeePassXC 应该是你的绝佳选择。

在这里你得到的功能数量让你可以在多个平台上保证密码的安全和易于维护。即使没有开发团队的”官方“移动应用，你也可以尝试他们的一些[推荐应用][12]，它们与数据库兼容，并提供相同的功能。

你尝试过 KeePassXC 吗？你更喜欢使用什么作为你的密码管理器？请在下面的评论中告诉我你的想法。

--------------------------------------------------------------------------------

via: https://itsfoss.com/keepassxc/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/09/keepassxc-screenshot.jpg?resize=800%2C580&ssl=1
[2]: https://www.keepassx.org/
[3]: https://keepass.info
[4]: https://itsfoss.com/password-managers-linux/
[5]: https://itsfoss.com/bitwarden/
[6]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/09/keepassxc-screenshot-1.jpg?resize=800%2C579&ssl=1
[7]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/09/keepassxc-settings.png?resize=800%2C587&ssl=1
[8]: https://itsfoss.com/use-appimage-linux/
[9]: https://keepassxc.org/download/
[10]: https://github.com/keepassxreboot/keepassxc
[11]: https://keepassxc.org
[12]: https://keepassxc.org/docs/#faq-platform-mobile
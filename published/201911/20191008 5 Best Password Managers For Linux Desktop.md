[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11531-1.html)
[#]: subject: (5 Best Password Managers For Linux Desktop)
[#]: via: (https://itsfoss.com/password-managers-linux/)
[#]: author: (Ankush Das https://itsfoss.com/author/ankush/)

5 个 Linux 桌面上的最佳密码管理器
======

> 密码管理器是创建唯一密码并安全存储它们的有用工具，这样你无需记住密码。了解一下适用于 Linux 桌面的最佳密码管理器。

![](https://img.linux.net.cn/data/attachment/album/201911/03/102528e97mr0ls89lz9rrr.jpg)

密码无处不在。网站、论坛、Web 应用等，你需要为其创建帐户和密码。麻烦在于密码，为各个帐户使用相同的密码会带来安全风险，因为[如果其中一个网站遭到入侵，黑客也会在其他网站上尝试相同的电子邮件密码组合][1]。

但是，为所有新帐户设置独有的密码意味着你必须记住所有密码，这对普通人而言不太可能。这就是密码管理器可以提供帮助的地方。

密码管理应用会为你建议/创建强密码，并将其存储在加密的数据库中。你只需要记住密码管理器的主密码即可。

主流的现代浏览器（例如 Mozilla Firefox 和 Google Chrome）内置了密码管理器。这有帮助，但是你只能在浏览器上使用它。

有一些第三方专门的密码管理器，其中一些还提供 Linux 的原生桌面应用。在本文中，我们将筛选出可用于 Linux 的最佳密码管理器。

继续之前，我还建议你仔细阅读 [Linux 的免费密码生成器][2]，来为你生成强大的唯一密码。

### Linux 密码管理器

> 可能的非 FOSS 警报！

> 我们优先考虑开源软件（有一些专有软件，请不要讨厌我！），并提供适用于 Linux 的独立桌面应用（GUI）。专有软件已高亮显示。

#### 1、Bitwarden

![][3]

主要亮点：

* 开源
* 免费供个人使用（可选付费升级）
* 云服务器的端到端加密
* 跨平台
* 有浏览器扩展
* 命令行工具

Bitwarden 是 Linux 上最令人印象深刻的密码管理器之一。老实说，直到现在我才知道它。我已经从 [LastPass][4] 切换到了它。我能够轻松地从 LastPass 导入数据，而没有任何问题和困难。

付费版本的价格仅为每年 10 美元。这似乎是值得的（我已经为个人使用进行了升级）。

它是一个开源解决方案，因此没有任何可疑之处。你甚至可以将其托管在自己的服务器上，并为你的组织创建密码解决方案。

除此之外，你还将获得所有必需的功能，例如用于登录的两步验证、导入/导出凭据、指纹短语（唯一键）、密码生成器等等。

你可以免费将帐户升级为组织帐户，以便最多与 2 个用户共享你的信息。但是，如果你想要额外的加密存储以及与 5 个用户共享密码的功能，那么付费升级的费用低至每月 1 美元。我认为绝对值得一试！

- [Bitwarden][5]

#### 2、Buttercup

![][6]

主要亮点：

* 开源
* 免费，没有付费方式。
* 跨平台
* 有浏览器扩展

这是 Linux 中的另一个开源密码管理器。Buttercup 可能不是一个非常流行的解决方案。但是，如果你在寻找一种更简单的保存凭据的方法，那么这将是一个不错的开始。

与其他软件不同，你不必对怀疑其云服务器的安全，因为它只支持离线使用并支持连接 [Dropbox][7]、[OwnCloud] [8]、[Nextcloud][9] 和 [WebDAV][10] 等云服务。

因此，如果需要同步数据，那么可以选择云服务。你有不同选择。

- [Buttercup][11]

#### 3、KeePassXC

![][12]

主要亮点：

* 开源
* 简单的密码管理器
* 跨平台
* 没有移动设备支持

KeePassXC 是 [KeePassX][13] 的社区分支，它最初是 Windows 上 [KeePass][14] 的 Linux 移植版本。

除非你没意识到，KeePassX 已经多年没有维护。因此，如果你在寻找简单易用的密码管理器，那么 KeePassXC 是一个不错的选择。KeePassXC 可能不是最漂亮或最好的密码管理器，但它确实可以做到该做的事。

它也是安全和开源的。我认为这值得一试，你说呢？

- [KeePassXC][15]

#### 4、Enpass （非开源）

![][16]

主要亮点：

* 专有软件
* 有许多功能，包括对“可穿戴”设备支持。
* Linux 完全免费（具有付费支持）

Enpass 是非常流行的跨平台密码管理器。即使它不是开源解决方案，但还是有很多人依赖它。因此，至少可以肯定它是可行的。

它提供了很多功能，如果你有可穿戴设备，它也可以支持它，这点很少见。

很高兴能看到 Enpass 积极管理 Linux 发行版的软件包。另外，请注意，它仅适用于 64 位系统。你可以在它的网站上找到[官方的安装说明] [17]。它需要使用终端，但是我按照步骤进行了测试，它非常好用。

- [Enpass][18]

#### 5、myki （非开源）

![][19]

主要亮点：

* 专有软件
* 不使用云服务器存储密码
* 专注于本地点对点同步
* 能够在移动设备上用指纹 ID 替换密码

这可能不是一个受欢迎的建议，但我发现它很有趣。它是专有软件密码管理器，它让你避免使用云服务器，而是依靠点对点同步。

因此，如果你不想使用任何云服务器来存储你的信息，那么它适合你。另外值得注意的是，用于 Android 和 iOS 的程序可让你用指纹 ID 替换密码。如果你希望便于在手机上使用，又有桌面密码管理器的基本功能，这似乎是个不错的选择。

但是，如果你选择升级到付费版，这有个付费计划供你判断，绝对不便宜。

尝试一下，让我们知道它如何!

- [myki][20]

### 其他一些值得说的密码管理器

即使没有为 Linux 提供独立的应用，但仍有一些密码管理器值得一提。

如果你需要使用基于浏览器的（扩展）密码管理器，建议你尝试使用 [LastPass][21]、[Dashlane][22] 和 [1Password][23]。LastPass 甚至提供了 [Linux 客户端（和命令行工具）][24]。

如果你正在寻找命令行密码管理器，那你应该试试 [Pass][25]。

[Password Safe][26] 也是种选择，但它的 Linux 客户端还处于 beta 阶段。我不建议依靠 “beta” 程序来存储密码。还有 [Universal Password Manager][27]，但它不再维护。你可能也听说过 [Password Gorilla][28]，但并它没有积极维护。

### 总结

目前，Bitwarden 似乎是我个人的最爱。但是，在 Linux 上有几个替代品可供选择。你可以选择提供原生应用的程序，也可选择浏览器插件，选择权在你。

如果我有错过值得尝试的密码管理器，请在下面的评论中告诉我们。与往常一样，我们会根据你的建议扩展列表。

--------------------------------------------------------------------------------

via: https://itsfoss.com/password-managers-linux/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://medium.com/@computerphonedude/one-of-my-old-passwords-was-hacked-on-6-different-sites-and-i-had-no-clue-heres-how-to-quickly-ced23edf3b62
[2]: https://itsfoss.com/password-generators-linux/
[3]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/09/bitward.png?ssl=1
[4]: https://www.lastpass.com/
[5]: https://bitwarden.com/
[6]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/09/buttercup.png?ssl=1
[7]: https://www.dropbox.com/
[8]: https://owncloud.com/
[9]: https://nextcloud.com/
[10]: https://en.wikipedia.org/wiki/WebDAV
[11]: https://buttercup.pw/
[12]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/09/KeePassXC.png?ssl=1
[13]: https://www.keepassx.org/
[14]: https://keepass.info/
[15]: https://keepassxc.org
[16]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/09/enpass.png?ssl=1
[17]: https://www.enpass.io/support/kb/general/how-to-install-enpass-on-linux/
[18]: https://www.enpass.io/
[19]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/09/myki.png?ssl=1
[20]: https://myki.com/
[21]: https://lastpass.com/
[22]: https://www.dashlane.com/
[23]: https://1password.com/
[24]: https://lastpass.com/misc_download2.php
[25]: https://www.passwordstore.org/
[26]: https://pwsafe.org/
[27]: http://upm.sourceforge.net/
[28]: https://github.com/zdia/gorilla/wiki

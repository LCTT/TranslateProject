[#]: subject: "How to Turn Off KDE Wallet?"
[#]: via: "https://itsfoss.com/disable-kde-wallet/"
[#]: author: "Ankush Das https://itsfoss.com/author/ankush/"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-16143-1.html"

如何关闭 KDE 钱包？
======

![][0]

> 不喜欢 KDE 钱包不时弹出？这里教你如何禁用它。

KDE <ruby>钱包管理器<rt>Wallet Manager</rt></ruby> 是 KDE Plasma 桌面默认包含的一个应用，用于存储和管理密码。

无论是存储网站凭据还是 SSH 密钥密码，你都可以使用 KDE 钱包来完成这一切。它与系统的其余部分集成良好，没有任何麻烦。你可以将其配置执行更多操作（或与更多应用和窗口管理器集成）。

既然 KDE 钱包是一个有用的程序，为什么要关闭它呢？

有时，当你与处理密码/凭据的操作交互时，KDE 钱包可能会弹出。因此，如果你遇到这种情况，我们的指南可以帮助你禁用钱包。

![][1]

### 禁用 KDE 钱包的最快方法

幸运的是，你不需要使用终端或任何类型的命令来禁用它。你可以使用图形用户界面（GUI）直接从系统设置中执行此操作。

请注意，我在 **KDE Plasma 27.4** 上尝试过此操作。

首先，从应用坞或搜索栏打开 <ruby>系统设置<rt>System Settings</rt></ruby> 应用。

![][3]

接下来，从左侧边栏中的菜单中，单击 “<ruby>KDE 钱包<rt>KDE Wallet</rt></ruby>”。

> 📋 如果你运行的是旧版本的 KDE Plasma，并且找不到下面的设置，那么需要手动安装 KDE <ruby>钱包管理器<rt>Wallet Manager</rt></ruby>（kwalletmanager）。
>
> 你可以通过 KDE 的软件中心（<ruby>发现<rt>Discover</rt></ruby> 应用）执行此操作，然后返回系统设置以查找所需的选项。
> 
> ![][4]

这里，你可以访问钱包首选项，其中默认启用 KDE 钱包。

你所要做的就是取消选中 “<ruby>启用 KDE 钱包子系统<rt>Enable the KDE wallet subsystem</rt></ruby>” 选项。

![][5]

完成后，点击 “<ruby>应用<rt>Apply</rt></ruby>” 使更改生效。系统可能会提示你使用密码验证操作。

![][6]

确实，并不是每个 KDE Plasma 用户都使用这个钱包应用。如果它困扰你或与其他应用冲突，你只需将其禁用即可。

此外，你可以探索一些适用于 Linux 的 [最佳密码管理器][7]：

> **[5 个 Linux 上的最佳密码管理器][7]**

💬 你对 KDE 钱包有何看法？ 你经常使用它吗？ 之前有让你烦恼吗？ 除了默认钱包之外，你更喜欢使用什么？ 在下面的评论中分享你的想法。

*（题图：MJ/45d57fcd-72c3-489d-9051-2a1ad1b5eb96）*

--------------------------------------------------------------------------------

via: https://itsfoss.com/disable-kde-wallet/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/content/images/2023/08/kde-wallet.jpg
[2]: https://itsfoss.com/content/images/size/w256h256/2022/12/android-chrome-192x192.png
[3]: https://itsfoss.com/content/images/2023/08/system-settings-kde-dock.jpg
[4]: https://itsfoss.com/content/images/2023/08/kwallet-manager.jpg
[5]: https://itsfoss.com/content/images/2023/08/kde-wallet-settings.jpg
[6]: https://itsfoss.com/content/images/2023/08/kde-settings-apply.jpg
[7]: https://itsfoss.com/password-managers-linux/
[0]: https://img.linux.net.cn/data/attachment/album/202308/31/094020wxhh00bh30ze409e.jpg
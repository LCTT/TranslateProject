[#]: subject: "10 Best Apps to Improve Your GNOME Experience [Part 1]"
[#]: via: "https://www.debugpoint.com/2021/12/best-gnome-apps-part-1/"
[#]: author: "Arindam https://www.debugpoint.com/author/admin1/"
[#]: collector: "lujun9972"
[#]: translator: "wxy"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14289-1.html"

10 个提升 GNOME 体验的最佳应用程序（一）
======

![](https://img.linux.net.cn/data/attachment/album/202202/20/171444jog8og4fy1j4eo0h.jpg)

> 我们将给你详细介绍 10 个最好的 GNOME 应用程序，它们可以帮助你在这个神奇的桌面上顺滑地工作。

网上有数百个基于 GTK 的应用程序，它们大多没什么名声，不那么流行。这些应用程序被设计用来简化你的 GNOME 桌面体验，提供原生应用程序的感受。本系列文章的目的是为了提高这些应用程序的普及率，同时鼓励更多的用户参与和开发。

在这个《最佳 GNOME 应用程序》的系列文章中，我们将重点介绍一些或已知道、或不知道的基于 GTK 的原生应用程序，它们是专门为 GNOME 增加功能设计的。

在这篇文章中，我们介绍了以下 GNOME 应用程序：

  * Geary - 电子邮件客户端
  * Notejot - 简易笔记
  * Hydrapaper - 支持多显示器的墙纸
  * Solanum - 番茄时钟客户端
  * Cawbird - Twitter 客户端
  * News Flash - RSS 阅读器
  * Fragments - BitTorrent 客户端
  * MetadataCleaner - 清洁各种文件的元数据
  * Kooha - 屏幕记录器
  * Metronome - 节拍器

### Geary - 电子邮件客户端

当提到 [Linux 桌面上的原生电子邮件客户端][14] 时，大家想到的都是 Thunderbird。然而，如果你想在电子邮件客户端中获得更多的原生感受，那么你可以试试 Geary。Geary 是一个基于 GTK+ 的电子邮件客户端，它带给你的功能包括对话视图、邮件合并、只需两步的轻松设置、支持 IMAP/SMTP、用于撰写邮件的富文本编辑器以及许多很酷的功能。

你可以轻松地将其配置为你的默认电子邮件客户端，并用自定义配置选项来设置主要的电子邮件服务提供商，如 Gmail、雅虎、Outlook。

![Geary 电子邮件客户端][15]

下面是你如何安装它的方法。

- 适用于 Debian/Ubuntu：`sudo apt install geary`
- 适用于 Fedora 和相关发行版：`sudo dnf install geary`
- [设置][16] Flatpak，然后 [通过 Flathub 安装][17]

更多信息：

  * [主页][18]
  * [源代码][19]

#### Notejot - 简单笔记

想要一个“超简单”的 GNOME 记事本应用？那么 Notejot 就是你正在寻找的应用程序。这款灵巧的记事应用程序以其精心制作的直观的单窗口用户界面而显得非常出色。这款应用程序带来的功能包括多个笔记、笔记本功能、彩色笔记、标准文本格式等。这是一个完美的 GNOME 记事小程序。

![超简单的记事应用程序 Notejot][20]

- [设置][16] Flatpak，然后 [通过 Flathub 安装][64]

更多信息：

  * [源代码][21]

#### Hydrapaper - 用于多显示器的壁纸更换器

这个 GTK 应用程序对于那些使用多显示器的人来说是一个福音。当你把多个显示器连接到一个系统时，所有的显示器都会显示相同的壁纸。但是如果你想在这些显示器上显示不同的图片，那么你可以使用这个叫做 Hydrapaper 的应用程序。这个 GTK 应用程序，很好地集成到了 GNOME 桌面，并为你提供了以下功能：

  * 预览显示器的 ID 和它们所显示的内容
  * 添加你的图片文件夹并在应用程序中浏览
  * 收藏选项可以快速选择你最喜欢的一个壁纸
  * 五种壁纸模式（缩放、黑色背景的适合/居中、模糊背景的适合/居中）。
  * 随机壁纸模式
  * 命令行选项，可以通过脚本来扩展它

![Hydrapaper - 多个屏幕的壁纸][22]

下面是如何安装这个应用程序。

- 适用于 Debian/Ubuntu：`sudo apt install hydrapaper`
- 适用于 Fedora 和相关发行版：`sudo dnf install hydrapaper`
- Arch 用户可以在 [设置 yay][23] 后通过 AUR 安装它：`yay -S hydrapaper-git`
- 你也可以在 [设置][16] 好 Flatpak 之后，[通过 Flathub 安装][24]

更多信息：

  * [主页][25]
  * [源代码][26]

#### Solanum - 番茄时钟客户端

下一个 GNOME 应用程序叫做 Solanum，它是一个基于 [番茄时钟技术][27] 的时间跟踪应用程序。该技术是将你的时间分成 25 分钟的小块，间隔有 5 分钟的休息时间，这被称为一个“<ruby>番茄<rt>Pomodoro</rt></ruby>”。4 个番茄之后，你可以休息更长时间。

这个应用程序可以帮助你做到这一点。Solanum 有一个非常简单的用户界面，在一个带有计时器的圈中显示“番茄”。切换“开始/停止”按钮帮助管理你的时间。这是一个非常有用的工具，特别是如果你在管理时间方面面临困难。

![Solanum][28]

下面是如何安装它的方法。

- 你可以在 [设置][16] 之后，[通过 Flathub 安装][29]

更多信息：

  * [主页][30]
  * [源代码][31]

#### Cawbird - Twitter 客户端

[Cawbird][32] 是一个基于 GTK 的 Twitter 客户端，用于 GNOME 桌面。它是那个在 Twitter API 变化后停止使用的 [Corebird][33] 的一个复刻。这款应用非常适合你的 GNOME 桌面，并且拥有 Twitter 网站的所有功能。从资源上看，它是轻量级的。如果你是 Twitter 的忠实用户，那么你可以试试这个应用。

![Cawbird - 一个原生的 Twitter GNOME 应用][34]

以下是安装步骤。

- Ubuntu/Debian，请使用 openSUSE 提供的 [预编译 DEB 包][35]
- Fedora 及相关发行版：`sudo dnf install cawbird`
- 对于 Arch Linux，你可以通过以下方式安装它：`pacman -Syu cawbird`
- [以 Flatpak 方式安装][36]
- [以 Snap 方式安装][37]

更多信息：

  * [主页][32]
  * [源代码][38]

#### News Flash - RSS 阅读器

News Flash 是最好的 GNOME 应用程序之一，用于阅读你喜爱的网站的 RSS 提要。这个应用程序对你的 GNOME 桌面来说是完美的，因为它提供了很多功能。它能为你的新消息、未读消息提供弹出式通知，支持深色模式等。下面是对其功能的快速总结：

也许最令人兴奋的功能是能够直接在应用程序本身内部阅读文章，即使该 <ruby>内容源<rt>feed</rt></ruby> 不提供完整文章。它会试图从 URL 中获取文本，并在应用程序窗口中显示（没有图像）。

  * 集成了流行的内容源
  * 用 OPML 导入和导出内容源
  * 支持暗色模式
  * 读者模式
  * 书签、搜索、导出文章选项
  * 在设置中给你提供应用程序使用了多少磁盘空间来存储内容源的详细信息。

![News Flash：管理内容源的最佳 GNOME 应用程序之一][39]

有兴趣吗？下面是如何安装的方法。

- 在 [初始设置][16] 之后，[通过 Flathub 安装][40]
- 如果你在 Arch Linux 中，你可以 [设置 Yay AUR 助手][23]，然后使用下面的命令来安装：`yay -S newsflash`

更多信息：

  * [主页][41]
  * [源代码][42]

#### Fragments - BitTorrent 客户端

Fragments 是一个简单的 BitTorrent 桌面客户端，构建在 GTK 上。虽然我们已经有了 Transmission 这个完美的 BitTorrent 客户端，它有独立的 GTK 和 QT 用户界面。但在 GNOME 桌面上有一个更简单的 BitTorrent 客户端也无妨，对吗？Fragments 有一个简单的界面，符合 GNOME 设计准则，并提供了 BitTorrent 客户端所需的所有功能。它也支持磁力链。

![Fragments：GNOME 桌面的 BitTorrent 客户端][43]

下面是如何安装的方法。

- 最好的安装方式是在 [设置][16] Flathub 软件仓库之后，[通过 Flathub 安装][44]

更多信息：

  * [主页][45]
  * [源代码][46]

#### MetadataCleaner - 从各种文件中清理元数据

有没有遇到过这样的情况：你需要从文件中删除某些信息，比如由谁创建，或者通过什么软件创建。例如，如果你有一张用 GIMP 创建的图片，该文件包含一个默认的文本（除非你删除它）：“由 GIMP 创建”。另外，图片可能包含位置细节、时间戳、相机信息等等。而删除这些信息需要一些特定的应用程序，并需付出额外的努力。

MetedataCleaner 应用程序就是做这个的。它可以帮助你从文件中删除这些信息。当你用这个应用程序打开一个文件时，它会读取并给你一个元数据的列表。你所需要做的就是点击“<ruby>清洁<rt>Clean</rt></ruby>”按钮，然后你就有了清理过的文件。对于 GNOME 来说，这样一个有用的工具。

![Metadata Cleaner][47]

这个应用程序的安装步骤如下。

- 最好的安装方法是在 [设置][16] Flathub 软件仓库之后，[通过 Flathub 安装][48]

更多信息：

  * [主页][49]
  * [源代码][50]

#### Kooha - 屏幕录像机

如果你正在为 GNOME 桌面寻找一个快速而简单的屏幕录像机，那么不妨试试 Kooha。这个应用程序是最好的 GNOME 应用程序之一，提供轻松的记录体验。这个工具支持硬件加速、定时器、多源输入和许多高级功能。下面是功能摘要：

  * 可选择多显示器中任一显示器或任何窗口
  * 硬件加速的编码
  * 可选择录制屏幕的区域
  * 记录麦克风和电脑的声音
  * 记录的延迟定时器
  * 支持 WebM、mp4、gif、mkv 文件类型

![Kooha - GNOME 最佳屏幕录制器][51]

下面是安装方法。

- 最好的安装方式是在 [设置][16] Flathub 软件仓库之后，[通过 Flathub 安装][52]

更多信息：

  * [主页][53]
  * [源代码][54]

#### Metronome - 节拍器

节拍器，最初是 [一种古老的设备][55]，它以每分钟节拍的恒定间隔产生一些可听的短促声音。这对于需要保持一致的动作、活动，并且不失去注意力的加速或减速的任务很有用。

因此，这个名为 Metronome 的 GNOME 应用程序是一个软件版的设备，可以帮助你保持你的活动和注意力。这是音乐家们专门用来练习演奏的，以固定的时间间隔来保持一致。

![GNOME 的节拍器][56]

下面是安装的方法。

- 最好的安装方法是在 [设置][16] Flathub 软件仓库之后，[通过 Flathub 安装][57]

更多信息：

  * [主页][58]
  * [源代码][59]

### 总结

这就是 10 个最好的 GNOME 应用程序列表，可以扩展你的桌面体验。感谢 Flatpak，不仅在 GNOME，你还可以在 KDE Plasma 或 Xfce 或任何其他桌面上使用它们。我希望这些用于 GNOME 桌面的应用程序可以变得更加流行，使用率也会增加。

你最喜欢的 GNOME 应用程序是什么，请在下面的评论框中告诉我。

--------------------------------------------------------------------------------

via: https://www.debugpoint.com/2021/12/best-gnome-apps-part-1/

作者：[Arindam][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.debugpoint.com/author/admin1/
[b]: https://github.com/lujun9972
[1]: https://www.debugpoint.com/2021/12/best-gnome-apps-part-2/
[2]: https://www.debugpoint.com/2022/01/best-gnome-apps-part-3/
[3]: https://www.debugpoint.com/2022/02/best-gnome-apps-part-4/
[4]: tmp.SdvbWYqKsq#geary
[5]: tmp.SdvbWYqKsq#notejot
[6]: tmp.SdvbWYqKsq#hydrapaper
[7]: tmp.SdvbWYqKsq#solanum
[8]: tmp.SdvbWYqKsq#cawbird
[9]: tmp.SdvbWYqKsq#news-flash
[10]: tmp.SdvbWYqKsq#fragments
[11]: tmp.SdvbWYqKsq#metadata-cleaner
[12]: tmp.SdvbWYqKsq#kooha
[13]: tmp.SdvbWYqKsq#metronome
[14]: https://www.debugpoint.com/2019/06/best-email-client-linux-windows/
[15]: https://www.debugpoint.com/wp-content/uploads/2021/12/Geary-Email-Client-for-GNOME.jpg
[16]: https://flatpak.org/setup/
[17]: https://flathub.org/repo/appstream/org.gnome.Geary.flatpakref
[18]: https://wiki.gnome.org/Apps/Geary
[19]: https://gitlab.gnome.org/GNOME/geary
[20]: https://www.debugpoint.com/wp-content/uploads/2021/12/Stupidly-Simple-Note-Taking-App-Notejot.jpg
[21]: https://github.com/lainsce/notejot
[22]: https://www.debugpoint.com/wp-content/uploads/2021/12/Hydrapaper-Wallpaper-for-Multiple-Screens-1024x689.jpg
[23]: https://www.debugpoint.com/2021/01/install-yay-arch/
[24]: https://flathub.org/apps/details/org.gabmus.hydrapaper
[25]: https://hydrapaper.gabmus.org/
[26]: https://gitlab.gnome.org/gabmus/hydrapaper
[27]: https://en.wikipedia.org/wiki/Pomodoro_Technique
[28]: https://www.debugpoint.com/wp-content/uploads/2021/12/Solanum.jpg
[29]: https://dl.flathub.org/repo/appstream/org.gnome.Solanum.flatpakref
[30]: https://apps.gnome.org/app/org.gnome.Solanum/
[31]: https://gitlab.gnome.org/World/Solanum
[32]: https://ibboard.co.uk/cawbird/
[33]: https://corebird.baedert.org/
[34]: https://www.debugpoint.com/wp-content/uploads/2021/12/Cawbird-A-Native-GNOME-App-for-Twitter.jpg
[35]: https://software.opensuse.org//download.html?project=home%3AIBBoard%3Acawbird&package=cawbird
[36]: https://flathub.org/apps/details/uk.co.ibboard.cawbird
[37]: https://snapcraft.io/cawbird
[38]: https://github.com/IBBoard/cawbird
[39]: https://www.debugpoint.com/wp-content/uploads/2021/12/News-Flash-One-of-the-best-GNOME-App-for-Managing-Feeds-1024x618.jpg
[40]: https://flathub.org/apps/details/com.gitlab.newsflash
[41]: https://apps.gnome.org/app/com.gitlab.newsflash/
[42]: https://gitlab.com/news-flash/news_flash_gtk
[43]: https://www.debugpoint.com/wp-content/uploads/2021/12/Fragments-Torrent-Client-for-GNOME-Desktop.jpg
[44]: https://flathub.org/apps/details/de.haeckerfelix.Fragments
[45]: https://apps.gnome.org/app/de.haeckerfelix.Fragments/
[46]: https://gitlab.gnome.org/World/Fragments
[47]: https://www.debugpoint.com/wp-content/uploads/2021/12/Metadata-Cleaner.jpg
[48]: https://flathub.org/apps/details/fr.romainvigier.MetadataCleaner
[49]: https://metadatacleaner.romainvigier.fr/
[50]: https://gitlab.com/rmnvgr/metadata-cleaner/
[51]: https://www.debugpoint.com/wp-content/uploads/2021/12/Kooha-Best-Screen-Recoder-for-GNOME.jpg
[52]: https://flathub.org/apps/details/io.github.seadve.Kooha
[53]: https://apps.gnome.org/app/io.github.seadve.Kooha/
[54]: https://github.com/SeaDve/Kooha
[55]: https://en.wikipedia.org/wiki/Metronome
[56]: https://www.debugpoint.com/wp-content/uploads/2021/12/Metronome-for-GNOME.jpg
[57]: https://flathub.org/apps/details/com.adrienplazas.Metronome
[58]: https://apps.gnome.org/app/com.adrienplazas.Metronome/
[59]: https://gitlab.gnome.org/World/metronome
[60]: https://t.me/debugpoint
[61]: https://twitter.com/DebugPoint
[62]: https://www.youtube.com/c/debugpoint?sub_confirmation=1
[63]: https://facebook.com/DebugPoint
[64]: https://dl.flathub.org/repo/appstream/io.github.lainsce.Notejot.flatpakref
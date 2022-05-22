[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13059-1.html)
[#]: subject: (How to use KDE's productivity suite, Kontact)
[#]: via: (https://opensource.com/article/21/1/kde-kontact)
[#]: author: (Kevin Sonney https://opensource.com/users/ksonney)

如何使用 KDE 的生产力套件 Kontact
======

> KDE 很棒，但当你使用这个统一个人信息管理器 Kontact 时，它才真正发挥了作用。

![](https://img.linux.net.cn/data/attachment/album/202101/28/094146fyx79l7zwbwej7ym.jpg)

在前几年，这个年度系列涵盖了单个的应用。今年，我们除了关注 2021 年的策略外，还将关注一体化解决方案。欢迎来到 2021 年 21 天生产力的第六天。

在很久很久以前，当编译内核还是获取 WiFi 驱动的唯一途径时，图形环境主要是用来运行网页浏览器和打开大量终端窗口。其外观和感觉是由程序作者选择使用的各种工具箱组成的大杂烩。然后，在 1996 年 [Matthias Ettrich][2] 提出并随后发布了第一个版本的 [KDE][3]。它是基于当时专有的 [Qt][4] 工具箱（后来成为自由而开源的）。这个版本引发了 Linux 上的桌面革命，同一时期出现的还有使用当时的自由开源软件 GTK 工具包所创建的 [GNOME 桌面][5] 。不管是 KDE 还是 GNOME，Linux 从一个*只有电脑操作人员使用的 Linux 操作系统*变成了一个人人都能使用的强大桌面环境。

![Fedora KDE Spin Default Desktop][6]

*Fedora KDE 版的默认桌面 （Kevin Sonney, [CC BY-SA 4.0][7]）*

KDE Plasma 5 是最新的 KDE 版本，它的功能非常丰富，可以提高你的工作效率。它包括了 Konqueror 网页浏览器、Dolphin 文件管理器和 Konsole 终端模拟器，所有这些都为这个桌面环境提供了一个很好的坚实基础，但是 KDE 真正提高生产力的方法是这个统一个人信息管理器：[Kontact][8]。

Kontact 为其他几个 KDE 程序提供了一个单一的界面，包括：KMail（电子邮件）、KOrganizer（日历、待办事项和日记）、KAddressBook（地址簿）、KNotes（笔记）、Akregator（RSS/ATOM 订阅阅读器）等。第一次启动时，Kontact 会引导你完成电子邮件提供商的设置，它支持本地和远程邮件配置。然后，Kontact 会进入一个仪表板，默认情况下，该仪表板会显示最近的电子邮件、日历事件、计划任务和最近的笔记。

![Kontact Summary screen][9]

*Kontact 概览页面 （Kevin Sonney, [CC BY-SA 4.0][7]）*

设置“流程”看起来有点奇怪，因为在内置的本地账户之外没有配置统一的单一账户。在 Kontact（通过 KMail）引导你完成邮件设置后，你就可以进入日历页面添加你的日历，这里也配置了待办事项和日记应用（对于某些提供商，还可以配置通讯录）。

邮件和日历组件非常简单明了，可以如你期望地正常工作。待办事项页面和日记是与日历绑定的，这对于一些不完全支持所有日历类型的日历提供商来说可能是个问题（Google，我说的是你）。如果你使用的是这些提供商中的一个，你将需要为日记和待办事项创建一个特定的本地日历。

![Kontact Calendar][10]

*Kontact Calendar （Kevin Sonney, [CC BY-SA 4.0][7]）*

待办事项列表有很多功能。虽然它可以作为一个简单的任务清单与提醒，它也支持一些轻量级的项目管理功能。它有一个完成百分比的滑块，可以从主列表视图中更新，这样你就可以跟踪进度。它能够附加文件和分配 1-10 的优先级。最后，它可以像其他日历约会一样将用户添加到任务中。

创建一个日记条目本质上是在日历上给自己创建一个笔记。它是一段形式自由的文本，就像写在实体笔记本和计划手册的某一天上那样。如果你要记录工作，写下每天的日记，或只是需要个地方记录会议记录，这个功能是非常*方便*的（本系列后面有更多关于这个的内容）。

![Kontact Journal][11]

*Kontact Journal （Kevin Sonney, [CC BY-SA 4.0][7]）*

构成 Kontact 的这些程序非常强大，如果你愿意的话，也可以作为单独的应用运行。Kontact 通过给你提供一个集中的地方，在一个应用内找到你所有的信息，从而提升了它们的实用性。

大多数发行版都允许你在没有 KDE 的情况下安装 Kontact 和它所使用的组件，但当它作为 KDE 桌面的一部分使用时，它才会真正发挥其作用。KDE 在 Fedora KDE 版、KUbuntu、KDE Neon（基于 Ubuntu LTS）和其他几个发行版中都是默认桌面。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/1/kde-kontact

作者：[Kevin Sonney][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/ksonney
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/team_dev_email_chat_video_work_wfm_desk_520.png?itok=6YtME4Hj (Working on a team, busy worklife)
[2]: https://en.wikipedia.org/wiki/Matthias_Ettrich
[3]: https://kde.org/
[4]: https://en.wikipedia.org/wiki/Qt_(software)
[5]: https://www.gnome.org/
[6]: https://opensource.com/sites/default/files/pictures/fedora-kde-spin-default-desktop.png (Fedora KDE Spin Default Desktop)
[7]: https://creativecommons.org/licenses/by-sa/4.0/
[8]: https://kontact.kde.org/
[9]: https://opensource.com/sites/default/files/pictures/kontact-summary-screen_0.png (Kontact Summary screen)
[10]: https://opensource.com/sites/default/files/pictures/kontact-calendar.png (Kontact Calendar)
[11]: https://opensource.com/sites/default/files/pictures/kontact-journal.png (Kontact Journal)

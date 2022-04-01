[#]: subject: "Put sticky notes on your Linux KDE desktop"
[#]: via: "https://opensource.com/article/22/2/sticky-notes-linux-kde"
[#]: author: "Seth Kenlon https://opensource.com/users/seth"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14346-1.html"

在你的 Linux KDE 桌面上粘贴便签
======

> 使用 Kontact 套件的功能 KNotes 温和地提醒你自己的日常任务。

![](https://img.linux.net.cn/data/attachment/album/202203/11/083349wujq4dbh6ccqb5kq.jpg)

我记得我第一次参加一个“不算会议的”会议，起初这是一个混乱的活动，有很多社交和个人项目的分享，但它逐渐凝聚成一个主要是自发组织的技术活动。这一切并没有用魔法，而用的是便签。人们在那些彩色的粘性记事贴上写下演讲和演示的想法，并将它们贴在共同的墙上，其他人将类似的想法分组，最终每个人都知道聚集在哪里讨论特定的话题。这是一件美好而令人满意的见证，它让我对便签有了新的认识。所以我很高兴最近发现 KDE Plasma 桌面有了数字便签，而且在很多方面它们甚至比实体的更有用。该应用叫做 KNotes，如果你有随意的想法想记下来，那么你可能想在自己的 Linux 桌面贴上它。

### 安装 KNotes

KNotes 是 Kontact 套件的一部分，这是 KDE 的个人信息管理器（PIM）。如果你正在运行 Plasma 桌面，那么你可能已经安装了 KNotes。如果没有，你可以从包管理器安装它：

```
$ sudo dnf install kontact
```

在基于 Debian 的发行版上，使用 `apt` 命令而不是 `dnf`。

### Linux 桌面上的 KNotes

尽管 KNotes 是 Kontact 的一部分，但它也是一个可以在后台运行的独立应用，随时可以在你需要时生成空白便签。从你的应用菜单启动 KNotes，它会将自身最小化到你的系统托盘。它的图标是一个黄色的小方块，因为在便签在现实生活中变得丰富多彩之前，它们往往都是黄色的。

要创建新便签，请右键单击系统托盘中的 KNote 图标并选择 “<ruby>新便签<rt>New Note</rt></ruby>”。第一次创建便签时，系统会提示你选择保存的位置。选择本地 KNotes 数据库文件（它由 Kontact 管理，因此你不会直接与该文件交互）并默认使用此位置。之后就不会再收到这种提示。

你的桌面上会出现一个新便签，你可以自己在其中输入。

![Start using KNotes][2]

就这么简单。至少它可以像这种老式的纸质便签一样。但这些是数字版的 KDE KNotes，因此你可以做的不仅仅是记下一些提醒文本给自己。

### 更改便签颜色

当一堆黄色便签开始混合在一起，你可以对便签进行颜色编码。右键单击便签的标题栏（带有日期和时间的部分），然后从出现的上下文菜单中选择 “<ruby>首选项<rt>Preferences</rt></ruby>”。在该窗口中，你可以更改标题和正文字体和字体大小，然后选择 “<ruby>显示设置<rt>Display Settings</rt></ruby>” 选项卡以更改便签纸和字体的颜色。

![KNotes with added color][4]

### 发送便签

以前自己写便签的时候，经常会在 [Emacs][5] 的暂存缓冲区中给自己写一些提醒。有更好的方法来管理 [Emacs 中的便签][6]，但是我将便签内容记下后，之后心不在焉地关闭而没保存的习惯很难改掉。

有了 KNotes，便签会自动保存到 Kontact，因此你不必担心需要记着它们。更好的是，它们是数字的，因此你可以将它们发送给自己的其他设备。你可以通过电子邮件将便签发送给自己，也可以通过网络将它们发送到另一台计算机。只需右键单击便签的标题栏，你就可以选择“<ruby>电子邮件<rt>Email</rt></ruby>”或“<ruby>发送<rt>Send</rt></ruby>”。

要从一个到另一个 KDE Plasma 桌面以 KNotes 方式接收便签，你必须在接收机器上授予 KNotes 接收便签的权限。要允许传入便签，请右键单击系统托盘中的 KNotes 图标并选择 “<ruby>配置 Knotes<rt>Configure KNotes</rt></ruby>”。

![Configure KNotes][7]

### 设置闹钟

至少对我来说，写便签通常是因为我答应了某人的事情，通常是在短期内，比如一天结束之前。随着我的工作和打开越来越多的窗口，贴在桌面上的便签往往会被掩盖，所以 KNotes 允许你为真正重要的便签设置闹钟，这一点特别有用。

要为便签设置闹钟，请右键单击便签的标题栏并选择 “<ruby>设置闹钟<rt>Set alarm</rt></ruby>”。

### 在 Linux 上做便签

便笺是记录日常任务的简单而有趣的方法。它们不是对每个人都“有效”，也不是我跟踪每天要做的事情的唯一手段，但它们是很好的选择，而且在一天结束时，在删除已完成的便签前将它们移到“已完成”那一堆，没有什么比这更令人心满意足的了。试一试吧，这是个可能能坚持下去的习惯。

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/2/sticky-notes-linux-kde

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/wfh_work_home_laptop_work.png?itok=VFwToeMy (Working from home at a laptop)
[2]: https://opensource.com/sites/default/files/knote-yellow.jpg (Start using KNotes)
[3]: https://creativecommons.org/licenses/by-sa/4.0/
[4]: https://opensource.com/sites/default/files/knote-color.jpg (KNotes with added color)
[5]: https://opensource.com/downloads/emacs-cheat-sheet
[6]: https://opensource.com/article/18/7/emacs-modes-note-taking
[7]: https://opensource.com/sites/default/files/knotes-preferences.jpg (Configure KNotes)

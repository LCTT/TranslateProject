[#]: subject: "Put sticky notes on your Linux KDE desktop"
[#]: via: "https://opensource.com/article/22/2/sticky-notes-linux-kde"
[#]: author: "Seth Kenlon https://opensource.com/users/seth"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

在你的 Linux KDE 桌面上粘贴便签
======
使用 Kontact 套件的功能 KNotes 轻轻提醒自己你的日常任务。
![Working from home at a laptop][1]

我记得我第一次参加“联合”会议。起初这是一个混乱的事件，有很多社交和个人项目的分享，但它逐渐合并成一个主要是自组织的技术会议。它不是用魔法发生的，而是用便签纸。人们在那些彩色的粘性记事本上写下演讲和演示的想法，并将它们贴在共同的墙上，其他人将类似的想法分组，最终每个人都知道在哪里聚集讨论特定的话题。见证这是一件美好而令人满意的事情，它让我对便利贴有了新的尊重。所以我很高兴最近发现 KDE Plasma Desktop 有数字便签，而且在很多方面它们甚至比实体的更有用。该应用称为 KNotes，如果你有随意的想法想记下来，那么你可能想为自己的 Linux 桌面考虑它。

### 安装 KNotes

KNotes 是 Kontact 套件的一部分，它是 KDE 的个人信息管理器 (PIM)。如果你正在运行 Plasma 桌面，那么你可能已经安装了 KNotes。如果没有，你可以从包管理器安装它：


```
`$ sudo dnf install kontact`
```

在基于 Debian 的发行版上，使用 `apt` 命令而不是 `dnf`。

### Linux 桌面上的 KNotes

尽管 KNotes 是 Kontact 的一部分，但它也是一个可以在后台运行的独立应用，随时准备好在你需要时生成空白笔记。从你的应用菜单启动 KNotes，它会将自身最小化到你的系统托盘。它的图标是一个黄色的小方块，因为在便利贴在现实生活中变得丰富多彩之前，它们往往都是黄色的。

要创建新笔记，请右键单击系统托盘中的 KNote 图标并选择 **New Note**。第一次创建笔记时，系统会提示你选择保存笔记的位置。选择本地 KNotes 数据库文件（它由 Kontact 管理，因此你不会直接与该文件交互）并启用选择以默认使用此位置。从那时起，你将不会再收到提示。

你的桌面上会出现一个新笔记，你可以自己输入一个笔记。

![Start using KNotes][2]

（Seth Kenlon，[CC BY-SA 4.0][3]）

就这么简单。或者至少，它会是这些老式的物理笔记。但这些是数字的 KDE KNotes，因此你可以做的不仅仅是记下一些提醒文本给自己。

### 更改笔记颜色

一堆黄色笔记开始混合在一起，但你可以对笔记进行颜色编码。右键单击笔记的标题栏（带有日期和时间的部分），然后从出现的上下文菜单中选择 **Preferences**。在 **Preferences** 窗口中，你可以更改标题和正文字体和字体大小，然后选择 **Display Settings** 选项卡以更改注释和字体颜色。

![KNotes with added color][4]

（Seth Kenlon，[CC BY-SA 4.0][3]）

### 发送笔记

以前自己写笔记的时候，经常会在 [Emacs][5] 的暂存缓冲区中给自己写一些提醒。有更好的方法来管理 [Emacs 中的笔记][6]，但是我将笔记记下后，以后心不在焉关闭而没保存的习惯很难改掉。

有了 KNotes，笔记会自动保存到 Kontact，因此你不必担心跟踪它们。更好的是，它们是数字的，因此你可以在其他设备上将它们发送给自己。你可以通过电子邮件将笔记发送给自己，也可以通过网络将它们发送到另一台计算机。只需右键单击笔记的标题栏，你就可以选择**电子邮件**或**发送**。

要从 KDE Plasma 桌面将笔记作为 KNotes 接收到另一台，你必须在接收机器上授予 KNotes 接收笔记的权限。要允许传入笔记，请右键单击系统托盘中的 KNotes 图标并选择 **Configure KNotes**。

![Configure KNotes][7]

（Seth Kenlon，[CC BY-SA 4.0][3]）

### 设置闹钟

至少对我来说，笔记的发生通常是因为我在短期内答应了某人的事情，通常是在一天结束之前。随着我的工作和打开越来越多的窗口，贴在桌面上的笔记往往会被掩盖，所以 KNotes 允许你为真正重要的笔记设置闹钟，这一点特别有用。

要为笔记设置闹钟，请右键单击笔记的标题栏并选择 **Set alarm**。

### 在 Linux 上做笔记

便笺是记录日常任务的简单而有趣的方法。它们不是对每个人都“有效”，也不是我跟踪每天要做的事情的唯一手段，但它们是很好的选择，而且没有什么比在一天结束时把已完成的笔记移到“已完成”的那一堆，然后全部删除更令人满意的了。试一试吧，这是个可能坚持下去的习惯。

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/2/sticky-notes-linux-kde

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

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

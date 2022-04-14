[#]: subject: "Manage your calendar from the Linux terminal with the konsolekalendar command"
[#]: via: "https://opensource.com/article/22/2/manage-calendar-linux-konsolekalender-kde"
[#]: author: "Seth Kenlon https://opensource.com/users/seth"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

用 konsolekalendar 命令从 Linux 终端管理你的日历
======
KDE 很适合在 Linux 上进行基于终端的日程安排。konsolekalendar 命令让你从终端查看和管理 iCal 日历。

![Calendar close up snapshot][1]

我是一个 [KDE 用户][2]，多年来我一直在 Plasma 桌面上进行着看似无尽的探索之旅。如果你在公开场合问我，我可能会声称自己对我每天使用的桌面了如指掌。但实际上，我只是刚刚触及到表面而已。似乎每天我都能学到一个新的 KDE 技巧，让我的生活变得更轻松或更有趣，我最新的发现是 `konsolekalendar` 命令，它让你从终端查看和管理 iCal 日历。

### Akonadi

Akonadi 项目是一个底层 KDE 框架，帮助 Plasma 桌面跟踪所有的个人信息管理器（PIM）数据。它主要是为开发者服务的，包括很多库，允许程序员创建应用，通过这些程序你可以访问你的联系人、笔记、电子邮件、日历等等。Akonadi 中包括一些终端命令，比如 `akonadictl` 可以启动和停止 Akonadi 服务，但它们主要是为了排除故障。然而，`konsolekalendar` 是一个面向用户的命令，可以让你完全访问 Kontact 套件的所有数据，包括 KMail、Notes 和日历。

如果你正在运行 KDE 的 Plasma 桌面，那么你已经安装了 Kontact 套件。

![Kontact UI][3]

（Seth Kenlon，[CC BY-SA 4.0][4]）

你也已经安装了 Akonadi 和它的工具，所以你所需要的基于终端的日历完成了!

### 从终端查看你的日历

由于 [NextCloud][5] 和 [Radicale][6] 等项目的存在，你可以托管自己的 iCal 日历服务，或者你可能已经在流行的供应商（例如，Google）那里拥有一个 iCal 账户。当你使用 Kontact 做日历时，你订阅了一个日历对象（用 Akonadi 的术语说是一个“集合”）。当你对你的本地日历进行更新时，这些变化会被送回你的 iCal 服务器以同步你的日历服务器和客户端。

无论你是否使用过 Kontact 的日历部分，你在 Kontact 中都有一些默认的日历对象。你有一个叫**个人日历**和**生日和纪念日**。

以下是如何显示当天的日历（默认为**个人日历**）：


```


$ konsolekalendar
Date:   Saturday, January 15, 2022
        10:00 AM - 11:00 AM
Summary: Covid booster shot
UID: 8d8a1e38-c88c-4d84-99e5-23...
\----------------------------------
Date:   Saturday, January 15, 2022
        12:00 PM - 01:00 PM
Summary: Lunch
UID: 7aa89a...
\----------------------------------
Date:   Saturday, January 15, 2022
        01:00 PM - 04:45 PM
Summary: Afternoon coding
UID: 9cde38b...
\----------------------------------
Date:   Saturday, January 15, 2022
        06:00 PM - 10:00 PM
Summary: Planescape game
UID: c73f7e98-722f-48a2-8006-66...
\----------------------------------

```

### 添加一个事件

要查看你订阅的所有日历，请使用 `--list-calendars` 选项：


```


$ konsolekalendar --list-calendars
\----------------------------------
3  - (Read only) Birthdays &amp; Anniversaries
11 - Personal Calendar
60 - (Read only) Open Invitations
61 - (Read only) Declined Invitations
66 - Dnd
67 - Work
68 - Museum

```

左边的数字是日历的 ID。要添加一个事件到一个特定的日历，请使用 `--calendar` 选项，然后是日历 ID：


```


$ konsolekalendar --add --calendar 66 \
\--date 2022-01-16 \
\--time 20:00 --end-time 23:59 \
\--summary "Another game" \
\--description "Remember to bring dice" \
Success: "Another game" inserted

```

### 删除一个事件

你也可以删除事件。每个事件都有一个唯一的 ID（UID），在每个事件列表的底部提供：


```


$ konsolekalendar --list
Date:   Saturday, January 15, 2022
        06:00 PM - 10:00 PM
Summary: Planescape game
UID: c73f7e98-722f-48a2-8006-66aa8ddcf789

```

要删除一个事件，请使用 `--delete` 选项，同时使用 `--uid` 选项：


```


$ konsolekalendar --delete \
\--uid c73f7e98-722f-48a2-8006-66aa8ddcf789

```

### 终端中的 Akonadi

你用 `konsolekalendar` 所做的一切都会立即在 Akonadi 中执行，并在 Kontact 中得到同样快的反映。使用一个并不意味着你必须放弃另一个。由于它们共享 Akonadi 后端，两者查看和编辑相同的数据。`konsolekalendar` 命令是一项正在进行的工作。未来的计划包括与 Kontact 的 Notes 和 Journal 部分的整合，而且还有很多比本文所涉及的更多的选项。如果你在使用 KDE 桌面，试试 `konsolekalendar`，体验一下终端的 PIM!

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/2/manage-calendar-linux-konsolekalender-kde

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/calendar.jpg?itok=jEKbhvDT (Calendar close up snapshot)
[2]: https://opensource.com/article/17/5/7-cool-kde-tweaks-will-improve-your-life
[3]: https://opensource.com/sites/default/files/uploads/kontact.jpg (Kontact UI)
[4]: https://creativecommons.org/licenses/by-sa/4.0/
[5]: https://opensource.com/article/21/1/nextcloud-productivity
[6]: https://radicale.org/v3.html

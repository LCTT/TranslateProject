[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11812-1.html)
[#]: subject: (Organize and sync your calendar with khal and vdirsyncer)
[#]: via: (https://opensource.com/article/20/1/open-source-calendar)
[#]: author: (Kevin Sonney https://opensource.com/users/ksonney)

使用 khal 和 vdirsyncer 组织和同步你的日历
======

> 保存和共享日历可能会有点麻烦。在我们的 20 个使用开源提升生产力的系列的第五篇文章中了解如何让它更简单。

![](https://img.linux.net.cn/data/attachment/album/202001/23/150009wsr3d5ovg4g1vzws.jpg)

去年，我在 19 天里给你介绍了 19 个新（对你而言）的生产力工具。今年，我换了一种方式：使用你在使用或者还没使用的工具，构建一个使你可以在新一年更加高效的环境。

### 使用 khal 和 vdirsyncer 跟踪你的日程

处理日历很*麻烦*，要找到好的工具总是很困难的。但是自从我去年将日历列为[我的“失败"之一][2]以来，我已经取得了一些进步。

目前使用日历最困难的是一直需要以某种方式在线共享。两种最受欢迎的在线日历是 Google Calendar 和 Microsoft Outlook/Exchange。两者都在公司环境中大量使用，这意味着我的日历必须支持其中之一或者两个。

![khal calendar][3]

[Khal][4] 是基于控制台的日历，可以读取和写入 VCalendar 文件。它配置相当容易，但是不支持与其他应用同步。

幸运的是，khal 能与 [vdirsyncer][5] 一起使用，它是一个漂亮的命令行程序，可以将在线日历（和联系人，我将在另一篇文章中讨论）同步到本地磁盘。是的，它还可以上传新事件。

![vdirsyncer][6]

Vdirsyncer 是个 Python 3 程序，可以通过软件包管理器或 `pip` 安装。它可以同步 CalDAV、VCalendar/iCalendar、Google Calendar 和目录中的本地文件。由于我使用 Google Calendar，尽管这不是最简单的设置，我也将以它为例。

在 vdirsyncer 中设置 Google Calendar 是[有文档参考的][7]，所以这里我不再赘述。重要的是确保设置你的同步对，将 Google Calendar 设置为冲突解决的“赢家”。也就是说，如果同一事件有两个更新，那么需要知道哪个更新优先。类似这样做：

```
[general]
status_path = "~/.calendars/status"

[pair personal_sync]
a = "personal"
b = "personallocal"
collections = ["from a", "from b"]
conflict_resolution = "a wins"
metadata = ["color"]

[storage personal]
type = "google_calendar"
token_file = "~/.vdirsyncer/google_calendar_token"
client_id = "google_client_id"
client_secret = "google_client_secret"

[storage personallocal]
type = "filesystem"
path = "~/.calendars/Personal"
fileext = ".ics"
```

在第一次 vdirsyncer 同步之后，你将在存储路径中看到一系列目录。每个文件夹都将包含多个文件，日历中的每个事件都是一个文件。下一步是导入 khal。首先运行 `khal configure` 进行初始设置。

![Configuring khal][8]

现在，运行 `khal interactive` 将显示本文开头的界面。输入 `n` 将打开“新事件”对话框。这里要注意的一件事：日历的名称与 vdirsyncer 创建的目录匹配，但是你可以更改 khal 配置文件来指定更清晰的名称。根据条目所在的日历，向条目添加颜色还可以帮助你确定日历内容：

```
[calendars]
[[personal]]
path = ~/.calendars/Personal/kevin@sonney.com/
color = light magenta
[[holidays]]
path = ~/.calendars/Personal/cln2stbjc4hmgrrcd5i62ua0ctp6utbg5pr2sor1dhimsp31e8n6errfctm6abj3dtmg@virtual/
color = light blue
[[birthdays]]
path = ~/.calendars/Personal/c5i68sj5edpm4rrfdchm6rreehgm6t3j81jn4rrle0n7cbj3c5m6arj4c5p2sprfdtjmop9ecdnmq@virtual/
color = brown
```

现在，当你运行 `khal interactive` 时，每个日历将被着色以区别于其他日历，并且当你添加新条目时，它将有更具描述性的名称。

![Adding a new calendar entry][9]

设置有些麻烦，但是完成后，khal 和 vdirsyncer 可以一起为你提供一种简便的方法来管理日历事件并使它们与你的在线服务保持同步。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/1/open-source-calendar

作者：[Kevin Sonney][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/ksonney
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/calendar.jpg?itok=jEKbhvDT (Calendar close up snapshot)
[2]: https://opensource.com/article/19/1/productivity-tool-wish-list
[3]: https://opensource.com/sites/default/files/uploads/productivity_5-1.png (khal calendar)
[4]: https://khal.readthedocs.io/en/v0.9.2/index.html
[5]: https://github.com/pimutils/vdirsyncer
[6]: https://opensource.com/sites/default/files/uploads/productivity_5-2.png (vdirsyncer)
[7]: https://vdirsyncer.pimutils.org/en/stable/config.html#google
[8]: https://opensource.com/sites/default/files/uploads/productivity_5-3.png (Configuring khal)
[9]: https://opensource.com/sites/default/files/uploads/productivity_5-4.png

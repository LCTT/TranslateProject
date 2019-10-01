[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11320-1.html)
[#]: subject: (Manage your daily schedule with Git)
[#]: via: (https://opensource.com/article/19/4/calendar-git)
[#]: author: (Seth Kenlon  https://opensource.com/users/seth)

用 Git 管理你的每日行程
======

> 像源代码一样对待时间并在 Git 的帮助下维护你的日历。

![](https://img.linux.net.cn/data/attachment/album/201909/09/061835la7ne9edtlr7kn18.png)

[Git][2] 是一个少有的能将如此多的现代计算封装到一个程序之中的应用程序，它可以用作许多其他应用程序的计算引擎。虽然它以跟踪软件开发中的源代码更改而闻名，但它还有许多其他用途，可以让你的生活更轻松、更有条理。在这个 Git 系列中，我们将分享七种鲜为人知的使用 Git 的方法。

今天，我们将使用 Git 来跟踪你的日历。

### 使用 Git 跟踪你的日程安排

如果时间本身只是可以管理和版本控制的源代码呢？虽然证明或反驳这种理论可能超出了本文的范围，但在 Git 的帮助下，你可以将时间视为源代码并管理你的日程安排。

日历的卫冕冠军是 [CalDAV][3] 协议，它支撑了如 [NextCloud][4] 这样的流行的开源及闭源的日历应用程序。CalDAV 没什么问题（评论者，请注意），但它并不适合所有人，除此之外，它还有一种不同于单一文化的鼓舞人心的东西。

因为我对大量使用 GUI 的 CalDAV 客户端没有兴趣（如果你正在寻找一个好的终端 CalDAV 查看器，请参阅 [khal][5]），我开始研究基于文本的替代方案。基于文本的日历具有在[明文][6]中工作的所有常见好处。它很轻巧，非常便携，只要它结构化，就很容易解析和美化（无论*美丽*对你意味着什么）。

最重要的是，它正是 Git 旨在管理的内容。

### Org 模式不是一种可怕的方式

如果你没有对你的明文添加结构，它很快就会陷入一种天马行空般的混乱，变成恶魔才能懂的符号。幸运的是，有一种用于日历的标记语法，它包含在令人尊敬的生产力 Emacs 模式 —— [Org 模式][7] 中（承认吧，你其实一直想开始使用它）。

许多人没有意识到 Org 模式的惊人之处在于[你不需要知道甚至不需要使用 Emacs][8]来利用 Org 模式建立的约定。如果你使用 Emacs，你会得到许多很棒的功能，但是如果 Emacs 对你来说太难了，那么你可以实现一个基于 Git 的 Org 模式的日历系统，而不需要安装 Emacs。

关于 Org 模式你唯一需要知道的部分是它的语法。Org 模式的语法维护成本低、直观。使用 Org 模式而不是 GUI 日历应用程序进行日历记录的最大区别在于工作流程：你可以创建一个任务列表，然后每天分配一个任务，而不是转到日历并查找要安排任务的日期。

组织模式中的列表使用星号（`*`）作为项目符号。这是我的游戏任务列表：

```
* Gaming
** Build Stardrifter character
** Read Stardrifter rules
** Stardrifter playtest

** Blue Planet @ Mike's

** Run Rappan Athuk
*** Purchase hard copy
*** Skim Rappan Athuk
*** Build Rappan Athuk maps in maptool
*** Sort Rappan Athuk tokens
```

如果你熟悉 [CommonMark][9] 或 Markdown，你会注意到，Org 模式不是使用空格来创建子任务，而是更明确地使用了其它项目符号。无论你的使用背景和列表是什么，这都是一种构建列表的直观且简单的方法，它显然与 Emacs 没有内在联系（尽管使用 Emacs 为你提供了快捷方式，因此你可以快速地重新排列列表）。

要将列表转换为日历中的计划任务或事件，请返回并添加关键字 `SCHEDULED` 和（可选）`:CATEGORY:`。

```
* Gaming
:CATEGORY: Game
** Build Stardrifter character
SCHEDULED: <2019-03-22 18:00-19:00>
** Read Stardrifter rules
SCHEDULED: <2019-03-22 19:00-21:00>
** Stardrifter playtest
SCHEDULED: <2019-03-25 0900-1300>
** Blue Planet @ Mike's
SCHEDULED: <2019-03-18 18:00-23:00 +1w>

and so on...
```

`SCHEDULED` 关键字将该条目标记为你希望收到通知的事件，并且可选的 `:CATEGORY:` 关键字是一个可供你自己使用的任意标记系统（在 Emacs 中，你可以根据类别对条目使用颜色代码）。

对于重复事件，你可以使用符号（如`+1w`）创建每周事件或 `+2w` 以进行每两周一次的事件，依此类推。

所有可用于 Org 模式的花哨标记都[记录于文档][10]，所以不要犹豫，找到更多技巧来让它满足你的需求。

### 放进 Git

如果没有 Git，你的 Org 模式的日程安排只不过是本地计算机上的文件。这是 21 世纪，所以你至少需要可以在手机上使用你的日历，即便不是在你所有的个人电脑上。你可以使用 Git 为自己和他人发布日历。

首先，为 `.org` 文件创建一个目录。我将我的存储在 `~/cal` 中。

```
$ mkdir ~/cal
```

转到你的目录并使其成为 Git 存储库：

```
$ cd cal
$ git init
```

将 `.org` 文件移动到你本地的 Git 存储库。在实践中，我为每个类别维护一个 `.org` 文件。

```
$ mv ~/*.org ~/cal
$ ls
Game.org Meal.org Seth.org Work.org
```

暂存并提交你的文件：

```
$ git add *.org
$ git commit -m 'cal init'
```

### 创建一个 Git 远程源

要在任何地方提供日历，你必须在互联网上拥有 Git 存储库。你的日历是纯文本，因此任何 Git 存储库都可以。你可以将日历放在 [GitLab][11] 或任何其他公共 Git 托管服务（甚至是专有服务）上，只要你的主机允许，你甚至可以将该存储库标记为私有库。如果你不想将日历发布到你无法控制的服务器，则可以自行托管 Git 存储库，或者为单个用户使用裸存储库，或者使用 [Gitolite][12] 或 [Gitea][13] 等前端服务。

为了简单起见，我将假设一个自托管的 Git 裸存储库。你可以使用 Git 命令在任何具有 SSH 访问权限的服务器上创建一个远程裸存储库：

```
$ ssh -p 22122 [seth@example.com][14]
[remote]$ mkdir cal.git
[remote]$ cd cal.git
[remote]$ git init --bare
[remote]$ exit
```

这个裸存储库可以作为你日历在互联网上的家。

将其设置为本地 Git 存储库（在你的计算机上，而不是你的服务器上）的远程源：

```
$ git remote add origin seth@example.com:/home/seth/cal.git
```

然后推送你的日历到该服务器：

```
$ git push -u origin HEAD
```

将你的日历放在 Git 存储库中，就可以在任何运行 Git 的设备上使用它。这意味着你可以对计划进行更新和更改，并将更改推送到上游，以便在任何地方进行更新。

我使用这种方法使我的日历在我的工作笔记本电脑和家庭工作站之间保持同步。由于我每天大部分时间都在使用 Emacs，因此能够在 Emacs 中查看和编辑我的日历是一个很大的便利。对于大多数使用移动设备的人来说也是如此，因此下一步是在移动设备上设置 Org 模式的日历系统。

### 移动设备上的 Git

由于你的日历数据是纯文本的，严格来说，你可以在任何可以读取文本文件的设备上“使用”它。这是这个系统之美的一部分；你永远不会缺少原始数据。但是，要按照你希望的现代日历的工作方式将日历集成到移动设备上，你需要两个组件：移动设备上的 Git 客户端和 Org 模式查看器。

#### 移动设备上的 Git 客户端

[MGit][15] 是 Android 上的优秀 Git 客户端。同样，iOS 也有 Git 客户端。

一旦安装了 MGit（或类似的 Git 客户端），你必须克隆日历存储库，以便在你的手机上有副本。要从移动设备访问服务器，必须设置 SSH 密钥进行身份验证。MGit 可以为你生成和存储密钥，你必须将其添加到服务器的 `~/.ssh/authorized_keys` 文件或托管的 Git 的帐户设置中的 SSH 密钥中。

你必须手动执行此操作。MGit 没有登录你的服务器或托管的 Git 帐户的界面。如果你不这样做，你的移动设备将无法访问你的服务器以访问你的日历数据。

我是通过将我在 MGit 中生成的密钥文件通过 [KDE Connect][16] 复制到我的笔记本电脑来实现的（但你可以通过蓝牙、SD 卡读卡器或 USB 电缆进行相同操作，具体取决于你访问手机上的数据的首选方法）。 我用这个命令将密钥（一个名为 `calkey` 的文件）复制到我的服务器：

```
$ cat calkey | ssh seth@example.com "cat >> /home/seth/.ssh/authorized_keys"
```

你可能有不同的方法，但如果你曾经将服务器设置为无密码登录，这是完全相同的过程。如果你使用的是 GitLab 等托管的 Git 服务，则必须将密钥文件的内容复制并粘贴到用户帐户的 SSH 密钥面板中。

![Adding key file data to GitLab][17]

完成后，你的移动设备可以向你的服务器授权，但仍需要知道在哪里查找你的日历数据。不同的应用程序可能使用不同的表示法，但 MGit 使用普通的旧式 Git-over-SSH。这意味着如果你使用的是非标准 SSH 端口，则必须指定要使用的 SSH 端口：

```
$ git clone ssh://seth@example.com:22122//home/seth/git/cal.git
```

![Specifying SSH port in MGit][18]

如果你使用其他应用程序，它可能会使用不同的语法，允许你在特殊字段中提供端口，或删除 `ssh://` 前缀。如果遇到问题，请参阅应用程序文档。

将存储库克隆到手机。

![Cloned repositories][19]

很少有 Git 应用程序设置为自动更新存储库。有一些应用程序可以用来自动拉取，或者你可以设置 Git 钩子来推送服务器的更新 —— 但我不会在这里讨论这些。目前，在对日历进行更新后，请务必在 MGit 中手动提取新更改（或者如果在手机上更改了事件，请将更改推送到服务器）。

![MGit push/pull settings][20]

#### 移动设备上的日历

有一些应用程序可以为移动设备上的 Org 模式提供前端。[Orgzly][21] 是一个很棒的开源 Android 应用程序，它为 Org 模式的从 Agenda 模式到 TODO 列表的大多数功能提供了一个界面。安装并启动它。

从主菜单中，选择“设置同步存储库”，然后选择包含日历文件的目录（即，从服务器克隆的 Git 存储库）。

给 Orgzly 一点时间来导入数据，然后使用 Orgzly 的[汉堡包][22]菜单选择日程视图。

![Orgzly's agenda view][23]

在 Orgzly 的“设置提醒”菜单中，你可以选择在手机上触发通知的事件类型。你可以获得 `SCHEDULED` 任务，`DEADLINE` 任务或任何分配了事件时间的任何通知。如果你将手机用作任务管理器，那么你将永远不会错过 Org 模式和 Orgzly 的活动。

![Orgzly notification][24]

Orgzly 不仅仅是一个解析器。你可以编辑和更新事件，甚至标记事件为 `DONE`。

![Orgzly to-do list][25]

### 专为你而设计

关于使用 Org 模式和 Git 的重要一点是，这两个应用程序都非常灵活，并且你可以自定义它们的工作方式和内容，以便它们能够适应你的需求。如果本文中的内容是对你如何组织生活或管理每周时间表的冒犯，但你喜欢此提案提供的其他部分，那么请丢弃你不喜欢的部分。如果需要，你可以在 Emacs 中使用 Org 模式，或者你可以将其用作日历标记。你可以将手机设置为在一天结束时从计算机上拉取 Git 数据，而不是从互联网上的服务器上，或者你可以将计算机配置为在手机插入时同步日历，或者你可以每天管理它，就像你把你工作日所需的所有东西都装到你的手机上一样。这取决于你，而这是关于 Git、Org 模式和开源的最重要的事情。

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/4/calendar-git

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/web-design-monitor-website.png?itok=yUK7_qR0 (website design image)
[2]: https://git-scm.com/
[3]: https://tools.ietf.org/html/rfc4791
[4]: http://nextcloud.com
[5]: https://github.com/pimutils/khal
[6]: https://plaintextproject.online/
[7]: https://orgmode.org
[8]: https://opensource.com/article/19/1/productivity-tool-org-mode
[9]: https://commonmark.org/
[10]: https://orgmode.org/manual/
[11]: http://gitlab.com
[12]: http://gitolite.com/gitolite/index.html
[13]: https://gitea.io/en-us/
[14]: mailto:seth@example.com
[15]: https://f-droid.org/en/packages/com.manichord.mgit
[16]: https://community.kde.org/KDEConnect
[17]: https://opensource.com/sites/default/files/uploads/gitlab-add-key.jpg (Adding key file data to GitLab)
[18]: https://opensource.com/sites/default/files/uploads/mgit-0.jpg (Specifying SSH port in MGit)
[19]: https://opensource.com/sites/default/files/uploads/mgit-1.jpg (Cloned repositories)
[20]: https://opensource.com/sites/default/files/uploads/mgit-2.jpg (MGit push/pull settings)
[21]: https://f-droid.org/en/packages/com.orgzly/
[22]: https://en.wikipedia.org/wiki/Hamburger_button
[23]: https://opensource.com/sites/default/files/uploads/orgzly-agenda.jpg (Orgzly's agenda view)
[24]: https://opensource.com/sites/default/files/uploads/orgzly-cal-notify.jpg (Orgzly notification)
[25]: https://opensource.com/sites/default/files/uploads/orgzly-cal-todo.jpg (Orgzly to-do list)

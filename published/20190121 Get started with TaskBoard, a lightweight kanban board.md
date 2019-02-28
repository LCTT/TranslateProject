[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10539-1.html)
[#]: subject: (Get started with TaskBoard, a lightweight kanban board)
[#]: via: (https://opensource.com/article/19/1/productivity-tool-taskboard)
[#]: author: (Kevin Sonney https://opensource.com/users/ksonney (Kevin Sonney))

开始使用 TaskBoard 吧，一款轻量级看板
======

> 了解我们在开源工具系列中的第九个工具，它将帮助你在 2019 年提高工作效率。

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/checklist_hands_team_collaboration.png?itok=u82QepPk)

每年年初似乎都有疯狂的冲动想提高工作效率。新年的决心，渴望开启新的一年，当然，“抛弃旧的，拥抱新的”的态度促成了这一切。通常这时的建议严重偏向闭源和专有软件，但事实上并不用这样。

这是我挑选出的 19 个新的（或者对你而言新的）开源工具中的第九个工具来帮助你在 2019 年更有效率。

### TaskBoard

正如我在本系列的[第二篇文章][1]中所写的那样，[看板][2]现在非常受欢迎。但并非所有的看板都是相同的。[TaskBoard][3] 是一个易于在现有 Web 服务器上部署的 PHP 应用，它有一些易于使用和管理的功能。

![](https://opensource.com/sites/default/files/uploads/taskboard-1.png)

[安装][4]它只需要解压 Web 服务器上的文件，运行一两个脚本，并确保目录可正常访问。第一次启动时，你会看到一个登录页面，然后可以就可以添加用户和制作看板了。看板创建选项包括添加要使用的列以及设置卡片的默认颜色。你还可以将用户分配给指定看板，这样每个人都只能看到他们需要查看的看板。

用户管理是轻量级的，所有帐户都是服务器的本地帐户。你可以为服务器上的每个用户设置默认看板，用户也可以设置自己的默认看板。当有人在多个看板上工作时，这个选项非常有用。

![](https://opensource.com/sites/default/files/uploads/taskboard-2.png)

TaskBoard 还允许你创建自动操作，包括更改用户分配、列或卡片类别这些操作。虽然 TaskBoard 不如其他一些看板应用那么强大，但你可以设置自动操作，使看板用户更容易看到卡片、清除截止日期，并根据需要自动为人们分配新卡片。例如，在下面的截图中，如果将卡片分配给 “admin” 用户，那么它的颜色将更改为红色，并且当将卡片分配给我的用户时，其颜色将更改为蓝绿色。如果项目已添加到“待办事项”列，我还添加了一个操作来清除项目的截止日期，并在发生这种情况时自动将卡片分配给我的用户。

![](https://opensource.com/sites/default/files/uploads/taskboard-3.png)

卡片非常简单。虽然它们没有开始日期，但它们确实有结束日期和点数字段。点数可用于估计所需的时间、所需的工作量或仅是一般优先级。使用点数是可选的，但如果你使用 TaskBoard 进行 scrum 规划或其他敏捷技术，那么这是一个非常方便的功能。你还可以按用户和类别过滤视图。这对于正在进行多个工作流的团队非常有用，因为它允许团队负责人或经理了解进度状态或人员工作量。

![](https://opensource.com/sites/default/files/uploads/taskboard-4.png)

如果你需要一个相当轻便的看板，请看下 TaskBoard。它安装快速，有一些很好的功能，且非常、非常容易使用。它还足够的灵活性，可用于开发团队，个人任务跟踪等等。

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/1/productivity-tool-taskboard

作者：[Kevin Sonney][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/ksonney (Kevin Sonney)
[b]: https://github.com/lujun9972
[1]: https://linux.cn/article-10454-1.html
[2]: https://en.wikipedia.org/wiki/Kanban
[3]: https://taskboard.matthewross.me/
[4]: https://taskboard.matthewross.me/docs/

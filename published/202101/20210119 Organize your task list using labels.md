[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13062-1.html)
[#]: subject: (Organize your task list using labels)
[#]: via: (https://opensource.com/article/21/1/labels)
[#]: author: (Kevin Sonney https://opensource.com/users/ksonney)

使用标签组织你的任务列表
======

> 文件夹的用途是存储信息和任务。使用标签来帮助你更好地组织这些文件夹中的内容。

![](https://img.linux.net.cn/data/attachment/album/202101/29/150011k9sz3n0q99mmkems.jpg)

在前几年，这个年度系列报道了诸如 Notmuch 和 Syncthing 之类的开源的组织应用程序。今年，我们除了关注 2021 年的策略外，还将关注一体化解决方案。欢迎来到 2021 年 21 天生产力的第九天。

我用我的电子邮件、待办列表和笔记来做这件事，有一天我决定我要把这些“组织起来”，重新安排我保存东西的方式和位置。有时我发现了一个新的程序，我必须（再次）从头开始配置。有时，当前的方法已经花了很多时间，与我使用系统的时间相比，我花了更多的时间在保持存储顺序最新。我去年测试一些待办列表软件时，最后一个软件让我有了一个非常重要的认识。

![List of labels][4]

*所有事情都有存放的地方（Kevin Sonney, [CC BY-SA 4.0][5]）*

让我打个比方。一个任务（或电子邮件或笔记）就像你在一次活动中收到的那件很酷的 T 恤。它是黑色的，有一个很棒的图案，后面有一个标签，上面写着尺寸，领口有一个标签，上面写着洗涤说明。到了该收起来的时候，它该放在哪里呢？是和黑色的 T 恤放在一起吗？是和类似主题的衬衫放在一起吗？是按尺码放吗？是按需要洗涤的方式？还是按材质？

一件 T 恤只能放在*一*个地方，即使它可以有多种特质。我们需要以同样的方式对待任务、电子邮件和笔记。大型[电子邮件提供商][6]已经允许我们把一个标签当作一个文件夹。一封邮件（或一个文档或一个任务）可以同时在两个文件夹中！或者三个！甚至 11 个！

![Guitar volume 11][7]

*它高达 11 个（Seth Kenlon, [CC BY-SA 4.0][5]）*

我必须明智地决定不再这样做。文件夹不是标签，标签也不是文件夹。这让我找到了我目前整理待办事项清单（和笔记，以及电子邮件）的规则：

  1. 一个任务只应该在一个文件夹里。文件夹是以“大事”来命名的，比如一个地方或组织。我目前有三个文件夹来存放任务。“工作”、“家庭”和 “爱好”。当我专注于其中一个领域时，我知道我在看什么任务。
  2. 一个任务可以有任意个我需要的标签。我尽量保持在三个左右或更少。
  3. 一个任务应该有一个明确的意义。也许是你要写的程序的名字。也许是一些通用的东西，比如“要读的书”或“账单”。但如果你记不起 “4rg8sn5” 就是“要支付的账单”，这就对你没有帮助。

利用这些规则，如果我有一个“写第 9 天文章”的任务，它就会进入”爱好“文件夹，我给它打上 “OSDC”、“文章”、“2021” 的标签。如果我想在我的 [Elementary Planner][8] 中看到我所有的 2021 年的任务，我可以搜索这个标签。任务最终会出现在 “OSDC” 的搜索中，其中可能还包括一个对文章发表评论的待办事项，一个开始规划 2022 年系列的待办事项，还有一个跟进我认为有好文章想法的人。

我的“工作”文件夹里的东西通常是按项目标记的。“完成管理 CLI 文档”可能会被分为 “github”、“prod” 和 “admin”。“docs” 标签包含了“工作”和”爱好“文件夹中的项目，因为写文档是这两个文件夹都需要做的事情。

![Linux Elementary planner][9]

*文件夹和标签（Kevin Sonney, [CC BY-SA 4.0][5]）*

将“标签”和“文件夹”进行心理分离，帮助我将任务进行分组和分类，而不至于过度。这也意味着我可以更快地找到事情，花更少的时间去维护我的待办事项清单，而花更多的时间去做清单上的事情。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/1/labels

作者：[Kevin Sonney][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/ksonney
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/kanban_trello_organize_teams_520.png?itok=ObNjCpxt (Kanban-style organization action)
[2]: https://opensource.com/article/20/1/organize-email-notmuch
[3]: https://opensource.com/article/20/1/sync-files-syncthing
[4]: https://opensource.com/sites/default/files/pictures/day9-image1.png (List of labels)
[5]: https://creativecommons.org/licenses/by-sa/4.0/
[6]: https://opensource.com/alternatives/gmail
[7]: https://opensource.com/sites/default/files/pictures/guitar-11.jpg (Guitar volume 11)
[8]: https://opensource.com/article/21/1/elementary-linux
[9]: https://opensource.com/sites/default/files/pictures/elementary-planner.png (Linux Elementary planner)

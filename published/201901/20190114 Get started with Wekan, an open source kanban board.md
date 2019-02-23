[#]: collector: (lujun9972)
[#]: translator: (wwhio)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10454-1.html)
[#]: subject: (Get started with Wekan, an open source kanban board)
[#]: via: (https://opensource.com/article/19/1/productivity-tool-wekan)
[#]: author: (Kevin Sonney https://opensource.com/users/ksonney (Kevin Sonney))

开始使用 Wekan 吧，一款开源看板软件
======

> 这是开源工具类软件推荐的第二期，本文将让你在 2019 年更具生产力。来，让我们一起看看 Wekan 吧。

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/kanban-board.png?itok=tXC0dkKV)

每年年初，人们似乎都在想方设法地让自己更具生产力。对新年目标、期待，当然还有“新年新气象”这样的口号等等都促人上进。可大部分生产力软件的推荐都严重偏向闭源的专有软件，但事实上并不用这样。

这是我挑选的 19 款帮助你在 2019 年提升生产力的开源工具中的第 2 个。

### Wekan

[看板][1]是当今敏捷开发流程中的重要组成部分。我们中的很多人使用它同时管理自己的工作和生活。有些人在用 [Trello][2] 这样的 APP 来跟踪他们的项目，例如哪些事务正在处理，哪些事务已经完成。

![](https://opensource.com/sites/default/files/uploads/wekan-1.png)

但这些 APP 通常需要连接到一个工作账户或者商业服务中。而 [Wekan][3] 作为一款开源看板工具，你可以让它完全在本地运行，或者使用你自己选择的服务运行它。其他的看板 APP 提供的功能在 Wekan 里几乎都有，例如创建看板、列表、泳道、卡片，在列表间拖放，给指定的用户安排任务，给卡片添加标签等等，基本上你对一款现代看板软件的功能需求它都能提供。

![](https://opensource.com/sites/default/files/uploads/wekan-2.png)

Wekan 的独到之处在于它的内置规则。虽然其他的看板软件支持<ruby>邮件更新<rt>emailing updates</rt></ruby>，但 Wekan 允许用户自行设定触发器，其触发条件可以是卡片变动、清单变动或标签变动等等。

![](https://opensource.com/sites/default/files/uploads/wekan-3.png)

当触发条件满足时， Wekan 可以自动执行如移动卡片、更新标签、添加清单或者发送邮件等操作。

![](https://opensource.com/sites/default/files/uploads/wekan-4.png)

Wekan 的本地搭建可以直接使用 snap 。如果你的桌面环境支持 [Snapcraft][4] 构建的应用，那么只需要一条命令就能安装 Wekan ：

```
sudo snap install wekan
```

此外 Wekan 还支持 Docker 安装，这使它在大部分服务器环境和桌面环境下的搭建变得相当容易。

最后，如果你想寻找一款能自建又好用的看板软件，你已经遇上了 Wekan 。


--------------------------------------------------------------------------------

via: https://opensource.com/article/19/1/productivity-tool-wekan

作者：[Kevin Sonney][a]
选题：[lujun9972][b]
译者：[wwhio](https://github.com/wwhio)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/ksonney (Kevin Sonney)
[b]: https://github.com/lujun9972
[1]: https://en.wikipedia.org/wiki/Kanban
[2]: https://www.trello.com
[3]: https://wekan.github.io/
[4]: https://snapcraft.io/

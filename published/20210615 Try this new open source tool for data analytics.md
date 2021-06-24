[#]: subject: (Try this new open source tool for data analytics)
[#]: via: (https://opensource.com/article/21/6/cubejs)
[#]: author: (Ray Paik https://opensource.com/users/rpaik)
[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13517-1.html)

Cube.js：试试这个新的数据分析开源工具
======

> Cube.js 是一个开源的分析平台，可以作为数据源和应用之间的中间层。

![](https://img.linux.net.cn/data/attachment/album/202106/24/114907z53fpzv6szv936vj.jpg)

数据分析是一个时髦的领域，有许多解决方案可供选择。其中之一是 [Cube.js][2]，这是一个开源的分析平台。你可以把 Cube.js 看作是你的数据源和应用之间的一个中间层。

如下图所示，Cube.js 支持无服务器数据仓库和大多数现代关系型数据库管理系统 （RDBMS）。你可以使用任何用于数据可视化的 JavaScript 前端库，而 Cube.js 将负责其他工作，包括访问控制、性能、并发性等。

![Cube.js architecture][3]

### 主要优点

当我向我们的社区成员询问 Cube.js 的主要优点时，他们经常提到：

  * **它的抽象层**：配置 Cube.js 后，人们说他们不再需要担心性能优化、资源管理、SQL 专业知识等问题。许多人把 Cube.js 称为 “黑盒”，因为它的抽象层帮助他们专注于理解数据，而不是实施细节。
  * **易于定制**：由于 Cube.js 是可视化的，它很容易与前端框架集成，建立看起来像用户自己平台的解决方案。大多数商业平台（如 Looker、Tableau 等）需要更多的定制工作来与他们的基础设施整合。许多用户说，定制的便利性与抽象层相结合，使他们能够减少数据分析平台的开发时间。
  * **社区支持**：在开始使用 Cube.js 时，人们通常会从社区成员那里得到帮助（特别是在我们的 [Slack][4]），许多人提到社区支持是一个关键的入门资源。

访问 [用户故事页面][5]，阅读更多关于人们使用 Cube.js 的经验以及他们如何使用它。

### 开始使用

如果你想了解 Cube.js：

  * 进入我们的 [文档页面][6]，点击**开始**，并按照指示在你的笔记本电脑或工作站上启动和运行 Cube.js。
  * 当你进入 [Developer Playground][7]，你将能够生成数据模式，执行查询，并建立仪表盘，以看到 Cube.js 的运行。

在你启动和运行 Cube.js 之后，这里有一些有用的资源：

  * [文档][6]：我们把大量的精力放在我们的文档上，因为它是开源社区的重要资源。我们还在我们的文档页面和 YouTube 频道的 [入门播放列表][8] 中添加了视频剪辑。
  * [Discourse][9]：Cube.js 论坛是最近增加的，社区成员可以在这里分享他们的使用案例、技巧和窍门等，这样我们就可以建立一个社区知识库。
  * [GitHub][10]: 你可以在这里找到 Cube.js 的代码，社区成员可以通过 [问题页面][11] 提交错误或功能请求。我们还在 GitHub 上发布了我们的 [季度路线图][12]，以便每个人都能看到我们正在进行的工作。
  * [每月社区电话会议][13]：我们在每个月的第二个星期三举行电话会议，讨论社区更新，展示功能演示，并邀请社区成员分享他们的使用案例。你可以在 [社区电话会议页面][13] 上找到电话会议的日程，你也可以在我们 YouTube 频道的 [社区电话会议播放列表][14] 上找到过去的电话会议录音。

就像任何好的开源项目一样，Cube.js 有许多软件贡献者。如果你想查看社区的拉取请求（PR），请搜索带有 `pr:community` 标签的 PR。如果你想寻找你可以回答的问题，请搜索带有 `good first issue` 或者 `help wanted` 标签的问题。

我希望你试试 Cube.js。如果你有任何问题，请随时在下面留言或在 [Cube.js Slack][4] 上找我！

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/6/cubejs

作者：[Ray Paik][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/rpaik
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/metrics_data_dashboard_system_computer_analytics.png?itok=oxAeIEI- (metrics and data shown on a computer screen)
[2]: https://cube.dev/
[3]: https://opensource.com/sites/default/files/uploads/cubejs-architecture.png (Cube.js architecture)
[4]: https://slack.cube.dev/
[5]: https://cube.dev/blog/category/user-stories/
[6]: https://cube.dev/docs/
[7]: https://cube.dev/docs/dev-tools/dev-playground
[8]: https://www.youtube.com/playlist?list=PLtdXl_QTQjpaXhVEefh7JCIdtYURoyWo9
[9]: https://forum.cube.dev/
[10]: https://github.com/cube-js/cube.js
[11]: https://github.com/cube-js/cube.js/issues
[12]: https://github.com/cube-js/cube.js/projects
[13]: https://cube.dev/community-call/
[14]: https://www.youtube.com/playlist?list=PLtdXl_QTQjpb1dHZCM09qKTsgvgqjSvc9

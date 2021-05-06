[#]: subject: (My favorite open source project management tools)
[#]: via: (https://opensource.com/article/21/3/open-source-project-management)
[#]: author: (Frank Bergmann https://opensource.com/users/fraber)
[#]: collector: (lujun9972)
[#]: translator: (stevenzdg988)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13344-1.html)

我最喜欢的开源项目管理工具
======

> 如果你要管理大型复杂的项目，请尝试利用开源选择替换 MS-Project。

![](https://img.linux.net.cn/data/attachment/album/202104/29/145942py6qcc3lz1dyt1s6.jpg)

诸如建造卫星、开发机器人或推出新产品之类的项目都是昂贵的，涉及不同的提供商，并且包含必须跟踪的硬依赖性。

大型项目领域中的项目管理方法非常简单（至少在理论上如此）。你可以创建项目计划并将其拆分为较小的部分，直到你可以合理地将成本、持续时间、资源和依赖性分配给各种活动。一旦项目计划获得负责人的批准，你就可以使用它来跟踪项目的执行情况。在时间轴上绘制项目的所有活动将产生一个称为<ruby>[甘特图][2]<rt>Gantt chart</rt></ruby>的条形图。

甘特图一直被用于 [瀑布项目方法][3]，也可以用于敏捷方法。例如，大型项目可能将甘特图用于 Scrum 冲刺，而忽略其他像用户需求这样的细节，从而嵌入敏捷阶段。其他大型项目可能包括多个产品版本（例如，最低可行产品 [MVP]、第二版本、第三版本等）。在这种情况下，上层结构是一种敏捷方法，而每个阶段都计划为甘特图，以处理预算和复杂的依赖关系。

### 项目管理工具

不夸张地说，有数百种现成的工具使用甘特图管理大型项目，而 MS-Project 可能是最受欢迎的工具。它是微软办公软件家族的一部分，可支持到成千上万的活动，并且有大量的功能，支持几乎所有可以想象到的管理项目进度的方式。对于 MS-Project，有时候你并不知道什么更昂贵：是软件许可证还是该工具的培训课程。

另一个缺点是 MS-Project 是一个独立的桌面应用程序，只有一个人可以更新进度表。如果要多个用户进行协作，则需要购买微软 Project 服务器、Web 版的 Project 或 Planner 的许可证。

幸运的是，专有工具还有开源的替代品，包括本文中提及的应用程序。所有这些都是开源的，并且包括基于资源和依赖项的分层活动调度的甘特图。ProjectLibre、GanttProject 和 TaskJuggler 都针对单个项目经理的桌面应用程序。ProjeQtOr 和 Redmine 是用于项目团队的 Web 应用程序，而 ]project-open[ 是用于管理整个组织的 Web 应用程序。

我根据一个单用户计划和对一个大型项目的跟踪评估了这些工具。我的评估标准包括甘特图编辑器功能、Windows/Linux/macOS 上的可用性、可扩展性、导入/导出和报告。（背景披露：我是 ]project-open[ 的创始人，我在多个开源社区中活跃了很多年。此列表包括我们的产品，因此我的观点可能有偏见，但我尝试着眼于每个产品的最佳功能。）

### Redmine 4.1.0

![Redmine][4]

[Redmine][6] 是一个基于 Web 的专注于敏捷方法论的项目管理工具。

其标准安装包括一个甘特图时间轴视图，但缺少诸如调度、拖放、缩进（缩排和凸排）以及资源分配之类的基本功能。你必须单独编辑任务属性才能更改任务树的结构。

Redmine 具有甘特图编辑器插件，但是它们要么已经过时（例如 [Plus Gantt][7]），要么是专有的（例如 [ANKO 甘特图][8]）。如果你知道其他开源的甘特图编辑器插件，请在评论中分享它们。

Redmine 用 Ruby on Rails 框架编写，可用于 Windows、Linux 和 macOS。其核心部分采用 GPLv2 许可证。

  * **适合于：** 使用敏捷方法的 IT 团队。
  * **独特卖点：** 这是 OpenProject 和 EasyRedmine 的原始“上游”父项目。

### ]project-open[ 5.1

![\]project-open\[][9]

[\]project-open\[][10] 是一个基于 Web 的项目管理系统，从整个组织的角度看类似于<ruby>企业资源计划<rt>enterprise resource planning</rt></ruby>（ERP）系统。它还可以管理项目档案、预算、发票、销售、人力资源和其他功能领域。有一些不同的变体，如用于管理项目公司的<ruby>专业服务自动化<rt>professional services automation</rt></ruby>（PSA）、用于管理企业战略项目的<ruby>项目管理办公室<rt>project management office</rt></ruby>（PMO）和用于管理部门项目的<ruby>企业项目管理<rt>enterprise project management</rt></ruby>（EPM）。

]project-open[ 甘特图编辑器包括按等级划分的任务、依赖关系和基于计划工作和分配资源的调度。它不支持资源日历和非人力资源。]project-open[ 系统非常复杂，其 GUI 可能需要刷新。

]project-open[ 是用 TCL 和 JavaScript 编写的，可用于 Windows 和 Linux。 ]project-open[ 核心采用 GPLv2 许可证，并具有适用于大公司的专有扩展。

  * **适合于：** 需要大量财务项目报告的大中型项目组织。
  * **独特卖点：** ]project-open[ 是一个综合系统，可以运行整个项目公司或部门。

### ProjectLibre 1.9.3

![ProjectLibre][11]

在开源世界中，[ProjectLibre][12] 可能是最接近 MS-Project 的产品。它是一个桌面应用程序，支持所有重要的项目计划功能，包括资源日历、基线和成本管理。它还允许你使用 MS-Project 的文件格式导入和导出计划。

ProjectLibre 非常适合计划和执行中小型项目。然而，它缺少 MS-Project 中的一些高级功能，并且它的 GUI 并不是最漂亮的。

ProjectLibre 用 Java 编写，可用于 Windows、Linux 和macOS，并在开源的<ruby>通用公共署名许可证<rt>Common Public Attribution License</rt></ruby>（CPAL）下授权。ProjectLibre 团队目前正在开发一个名为 ProjectLibre Cloud 的 Web 产品，并采用专有许可证。

  * **适合于：** 负责中小型项目的个人项目管理者，或者作为没有完整的 MS-Project 许可证的项目成员的查看器。
  * **独特卖点：** 这是最接近 MS-Project 的开源软件。

### GanttProject 2.8.11

![GanttProject][13]

[GanttProject][14] 与 ProjectLibre 类似，它是一个桌面甘特图编辑器，但功能集更为有限。它不支持基线，也不支持非人力资源，并且报告功能比较有限。

GanttProject 是一个用 Java 编写的桌面应用程序，可在 GPLv3 许可下用于 Windows、Linux 和 macOS。

  * **适合于：**  简单的甘特图或学习基于甘特图的项目管理技术。
  * **独特卖点：** 它支持<ruby>流程评估和审阅技术<rt>program evaluation and review technique</rt></ruby>（[PERT][15]）图表，并使用 WebDAV 的协作。

### TaskJuggler 3.7.1

![TaskJuggler][16]

[TaskJuggler][17] 用于在大型组织中安排多个并行项目，重点是自动解决资源分配冲突（即资源均衡）。

它不是交互式的甘特图编辑器，而是一个命令行工具，其工作方式类似于一个编译器：它从文本文件中读取任务列表，并生成一系列报告，这些报告根据分配的资源、依赖项、优先级和许多其他参数为每个任务提供最佳的开始和结束时间。它支持多个项目、基线、资源日历、班次和时区，并且被设计为可扩展到具有许多项目和资源的企业场景。

使用特定语法编写 TaskJuggler 输入文件可能超出了普通项目经理的能力。但是，你可以使用 ]project-open[ 作为 TaskJuggler 的图形前端来生成输入，包括缺勤、任务进度和记录的工作时间。当以这种方式使用时，TaskJuggler 就成为了功能强大的假设情景规划器。

TaskJuggler 用 Ruby 编写，并且在 GPLv2 许可证下可用于 Windows、Linux 和 macOS。

  * **适合于：** 由真正的技术极客管理的中大型部门。
  * **独特卖点：** 它在自动资源均衡方面表现出色。

### ProjeQtOr 9.0.4

![ProjeQtOr][18]

[ProjeQtOr][19] 是适用于 IT 项目的、基于 Web 的项目管理应用程序。除了项目、工单和活动外，它还支持风险、预算、可交付成果和财务文件，以将项目管理的许多方面集成到单个系统中。

ProjeQtOr 提供了一个甘特图编辑器，与 ProjectLibre 功能类似，包括按等级划分的任务、依赖关系以及基于计划工作和分配资源。但是，它不支持取值的就地编辑（例如，任务名称、估计时间等）；用户必须在甘特图视图下方的输入表单中更改取值，然后保存。

ProjeQtOr 用 PHP 编写，并且在 Affero GPL3 许可下可用于 Windows、Linux 和 macOS。

  * **适合于：** 跟踪项目列表的 IT 部门。
  * **独特卖点：** 让你为存储每个项目的大量信息，将所有信息保存在一个地方。

### 其他工具

对于特定的用例，以下系统可能是有效的选择，但由于各种原因，它们被排除在主列表之外。

![LIbrePlan][20]

  * [LibrePlan][21] 是一个基于 Web 的项目管理应用程序，专注于甘特图。由于其功能集，它本来会在上面的列表中会占主导地位，但是没有可用于最新 Linux 版本（CentOS 7 或 8）的安装。作者说，更新的说明将很快推出。
  * [dotProject][22] 是一个用 PHP 编写的基于 Web 的项目管理系统，可在 GPLv2.x 许可证下使用。它包含一个甘特图时间轴报告，但是没有编辑它的选项，并且依赖项还不起作用（它们“仅部分起作用”）。
  * [Leantime][23] 是一个基于 Web 的项目管理系统，具有漂亮的用 PHP 编写的 GUI，并且可以在 GPLv2 许可证下使用。它包括一个里程碑的甘特时间线，但没有依赖性。
  * [Orangescrum][24] 是基于 Web 的项目管理工具。甘特图图可以作为付费附件或付费订阅使用。
  * [Talaia/OpenPPM][25] 是一个基于 Web 的项目组合管理系统。但是，版本 4.6.1 仍显示“即将推出：交互式甘特图”。
  * [Odoo][26] 和 [OpenProject][27] 都将某些重要功能限制在付费企业版中。

在这篇评论中，目的是包括所有带有甘特图编辑器和依赖调度的开源项目管理系统。如果我错过了一个项目或误导了什么，请在评论中让我知道。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/3/open-source-project-management

作者：[Frank Bergmann][a]
选题：[lujun9972][b]
译者：[stevenzdg988](https://github.com/stevenzdg988)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/fraber
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/kanban_trello_organize_teams_520.png?itok=ObNjCpxt (Kanban-style organization action)
[2]: https://en.wikipedia.org/wiki/Gantt_chart
[3]: https://opensource.com/article/20/3/agiles-vs-waterfall
[4]: https://opensource.com/sites/default/files/uploads/redmine.png (Redmine)
[5]: https://creativecommons.org/licenses/by-sa/4.0/
[6]: https://www.redmine.org/
[7]: https://redmine.org/plugins/plus_gantt
[8]: https://www.redmine.org/plugins/anko_gantt_chart
[9]: https://opensource.com/sites/default/files/uploads/project-open.png (]project-open[)
[10]: https://www.project-open.com
[11]: https://opensource.com/sites/default/files/uploads/projectlibre.png (ProjectLibre)
[12]: http://www.projectlibre.org
[13]: https://opensource.com/sites/default/files/uploads/ganttproject.png (GanttProject)
[14]: https://www.ganttproject.biz
[15]: https://en.wikipedia.org/wiki/Program_evaluation_and_review_technique
[16]: https://opensource.com/sites/default/files/uploads/taskjuggler.png (TaskJuggler)
[17]: https://taskjuggler.org/
[18]: https://opensource.com/sites/default/files/uploads/projeqtor.png (ProjeQtOr)
[19]: https://www.projeqtor.org
[20]: https://opensource.com/sites/default/files/uploads/libreplan.png (LIbrePlan)
[21]: https://www.libreplan.dev/
[22]: https://dotproject.net/
[23]: https://leantime.io
[24]: https://orangescrum.org/
[25]: http://en.talaia-openppm.com/
[26]: https://odoo.com
[27]: http://openproject.org

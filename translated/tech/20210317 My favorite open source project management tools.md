[#]: subject: (My favorite open source project management tools)
[#]: via: (https://opensource.com/article/21/3/open-source-project-management)
[#]: author: (Frank Bergmann https://opensource.com/users/fraber)
[#]: collector: (lujun9972)
[#]: translator: (stevenzdg988)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

我最喜欢的开源项目管理工具
======
如果您要管理大型复杂的项目，请尝试利用开源选项替换 Microsoft Project(微软项目管理软件)。
![看板式组织活动][1]

诸如建造卫星，开发机器人或推出新产品之类的项目都是昂贵的，涉及不同的提供商，并且包含必须跟踪的硬依赖性。

大型项目领域中的项目管理方法非常简单（至少在理论上如此）。您可以创建项目计划并将其拆分为较小的部分，直到您可以合理地将成本，持续时间，资源和依赖性分配给各种活动。一旦项目计划获得负责人的批准，您就可以使用它来跟踪项目的执行情况。在时间轴上绘制项目的所有活动将产生一个称为[Gantt chart(甘特图表)][2]的条形图。

Gantt(甘特)图一直用于[瀑布项目方法][3]，也可以被灵活地使用。例如，大型项目可能将 Gantt chart (甘特图)用于 Scrum 冲刺，而忽略其他像用户需求这样的细节，从而嵌入灵活的阶段。其他大型项目可能包括多个产品版本（例如，最低可行产品 [MVP]，第二版本，第三版本等）。在这种情况下，上层结构对灵活性友善，用每个阶段计划作为 Gantt chart (甘特图)处理预算和复杂的依赖关系。

### 项目管理工具

不夸张地说，有数百种可用工具使用 Gantt chart (甘特图)管理大型项目，Microsoft Project(微软项目管理软件)可能是最受欢迎的工具。它是 Microsoft Office(微软办公软件)系列(家族)的一部分，可扩展到成千上万的活动，并且具有众多(难以置信的数量)功能，可支持几乎所有可能的方式来管理项目进度表。对于 Project(微软项目管理软件)并不总是清楚什么更昂贵：软件许可或如何使用该工具的培训课程。

另一个缺点是 Microsoft Project 是一个独立的桌面应用程序，只有一个人可以更新进度表。如果要多个用户进行协作，则需要购买 Microsoft Project Server，Web 版的 Project(微软项目管理软件) 或 Microsoft Planner 的许可证。

幸运的是，专有工具还有开源的替代品，包括本文中的应用程序。所有这些都是开源的，并且包括用于安排基于资源和依赖项分层活动的 Gantt (甘特图)。 ProjectLibre，GanttProject 和 TaskJuggler 是单个项目管理的桌面应用程序。ProjeQtOr 和 Redmine 是用于项目团队的 Web 应用程序，而 ]project-open[ 是用于管理整个组织的 Web 应用程序。

我根据一个单用户计划并跟踪一个大型项目评估了这些工具。我的评估标准包括 Gantt 编辑器功能，Windows，Linux 和 macOS 上的可用性，可扩展性，导入/导出和报告。（完全披露：我是 ]project-open[ 的创始人，并且我在多个开源社区中活跃了很多年。此列表包括我们的产品，因此我的观点可能有偏见，但我尝试着眼于每个产品的最佳功能。）

### Redmine 4.1.0

![Redmine][4]

(Frank Bergmann, [CC BY-SA 4.0][5])

[Redmine][6]是一个基于 Web 的专注于灵活原则的项目管理工具。

标准安装包括 Gantt (甘特图)时间轴视图，但缺少诸如调度，拖放，缩进(缩排和凸排)以及资源分配之类的基本功能。您必须单独编辑任务属性才能更改任务树的结构。

Redmine 具有 Gantt (甘特图)编辑器插件，但是它们已经过时（例如 [Plus Gantt][7]）或专有（例如 [ANKO Gantt 图表][8]）。如果您知道其他开源 Gantt 编辑器插件，请在评论中分享它们。

Redmine 用 Ruby 的 Rails 框架编写，可用于 Windows，Linux 和 macOS。该内核已获得 GPLv2 许可。

  * **最适合：** 使用灵活方法的 IT 团队
  * **独特的销售主张：** 这是 OpenProject 和 EasyRedmine 的最初“上游”父项目。

### ]project-open[ 5.1

![\]project-open\[][9]

(Frank Bergmann, [CC BY-SA 4.0][5])

[]project-open[][10]是一个基于 Web 的项目管理系统，它具有整个组织的透视图，类似于企业资源计划（ERP）系统。它还可以管理项目档案，预算，发票，销售，人力资源和其他功能领域。存在用于运行项目公司的专业服务自动化（PSA），用于管理企业战略项目的项目管理办公室（PMO）和用于管理部门项目的企业项目管理（EPM）的特定变体。

Gantt 编辑器包括按等级划分的任务，依赖关系和基于计划的工作和分配资源的计划。它不支持资源日历和非人力资源。]po[ 系统非常复杂，GUI 可能需要刷新。

]project-open[ 用 TCL 和 JavaScript 编写，可用于 Windows 和 Linux。 ]po[ 核心已获得 GPLv2 许可，并具有适用于大公司的专有扩展。

  * **最适合：** 需要大量财务项目报告的中大型项目组织
  * **独特的销售主张：** ]po[ 是运行整个项目公司或部门的集成系统。


### ProjectLibre 1.9.3

![ProjectLibre][11]

(Frank Bergmann, [CC BY-SA 4.0][5])

在开源世界中，[ProjectLibre][12] 可能是最接近 Microsoft Project 的产品。它是一个桌面应用程序，支持所有重要的项目计划功能，包括资源日历，基线和成本管理。它还允许您使用 MS-Project 的文件格式导入和导出计划。

ProjectLibre 非常适合计划和执行中小型项目。然而，它缺少 MS-Project 中的一些高级功能，并且它的 GUI 并不是最漂亮的。

ProjectLibre 用 Java 编写，可用于 Windows，Linux 和macOS，并已获得开放源代码通用公共属性（CPAL）许可证。ProjectLibre 团队目前正在专有许可下开发名为 ProjectLibre Cloud 的 Web 产品。

  * **最适合：** 个人项目经理，负责中小型项目，或者作为没有完整的 MS-Project 许可证的项目成员的查看者
  * **独特的销售主张：** 这是使用开源软件可以最接近 MS-Project。

### GanttProject 2.8.11

![GanttProject][13]

(Frank Bergmann, [CC BY-SA 4.0][5])

[GanttProject][14] 与 ProjectLibre 类似，但它是桌面 Gantt (甘特图)编辑器，但功能集更为有限。 它不支持基线，也不支持非人力资源，并且报告功能受到更多限制。

GanttProject 是一个用 Java 编写的桌面应用程序，可在 GPLv3 许可下用于 Windows，Linux 和 macOS。

  * **最适合：**  Simple Gantt (甘特图)或学习基于 Gantt 的项目管理技术。
  * **独特的销售主张：** 它支持程序评估和审阅技术（[PERT][15]）图表以及使用 WebDAV 的协作。

### TaskJuggler 3.7.1

![TaskJuggler][16]

(Frank Bergmann, [CC BY-SA 4.0][5])

[TaskJuggler][17]在大型组织中安排多个并行项目，重点是自动解决资源分配冲突（即资源均衡）。

它不是交互式的 Gantt 编辑器，而是类似于编译器的命令行工具：它从文本文件中读取任务列表，并生成一系列报告，这些报告根据分配的资源，依赖项，优先级和许多其他参数为每个任务提供最佳的开始和结束时间。它支持多个项目，基线，资源日历，班次和时区，并且已设计为可扩展到具有许多项目和资源的企业方案。

使用特定语法编写 TaskJuggler 输入文件可能超出了普通项目经理的能力。但是，您可以使用 ]project-open[ 作为 TaskJuggler 的图形前端来生成输入，包括缺勤，任务进度和记录的工作时间。当以这种方式使用时，TaskJuggler 成为功能强大的假设情景规划师。

TaskJuggler 用 Ruby 编写，并且在 GPLv2 许可下可用于 Windows，Linux 和 macOS。

  * **最适合：** 由真正的书呆子管理的中大型部门
  * **独特的销售主张：** 它在自动资源均衡方面表现出色。

### ProjeQtOr 9.0.4

![ProjeQtOr][18]

(Frank Bergmann, [CC BY-SA 4.0][5])

[ProjeQtOr][19] 是适用于 IT 项目的基于 Web 的项目管理应用程序。除项目，工单和活动外，它还支持风险，预算，可交付成果和财务文件，以将项目管理的许多方面集成到单个系统中。

ProjeQtOr 为 Gantt 编辑器提供了与 ProjectLibre 类似的功能集，包括按等级划分的任务，依赖关系以及基于计划工作和分配资源。但是，它不支持值的就地编辑（例如，任务名称，估计时间等）；用户必须在 Gantt 视图下方的输入表单中更改值，然后保存值。

ProjeQtOr 用 PHP 编写，并且在 Affero GPL3 许可下可用于 Windows，Linux 和 macOS。

  * **最适合：** IT 部门跟踪项目列表
  * **独特的销售主张：** 让您为每个项目存储大量信息，将所有信息保存在一个地方。

### 其他工具

对于特定的用例，以下系统可能是有效的选项，但由于各种原因，它们被排除在主列表之外。

![LIbrePlan][20]

(Frank Bergmann, [CC BY-SA 4.0][5])

  * [**LibrePlan**][21] 是一个基于 Web 的项目管理应用程序，致力于 Gantt 图。由于其功能集，它在上面的列表中会占主导地位，但是没有可用于最新 Linux 版本（CentOS 7 或 8）的安装。作者说，更新的说明将很快推出。
   * [**dotProject**][22] 是一个用 PHP 编写的基于 Web 的项目管理系统，可在 GPLv2.x 许可下使用。它包含一个 Gantt 时间轴报告，但是没有编辑它的选项，并且依赖项还不起作用（它们“仅部分起作用”）。

  * [**Leantime**][23] 是一个基于 Web 的项目管理系统，具有漂亮的用 PHP 编写的 GUI，并且可以在 GPLv2 许可下使用。它包括用于时间表的没有依赖关系 Gantt 时间线。
  * [**Orangescrum**][24] 是基于 Web 的项目管理工具。Gantt 图可以作为付费附件或付费订阅使用。
  * [**Talaia/OpenPPM**][25] 是一个基于 Web 的项目组合管理系统。但是，版本 4.6.1 仍显示“即将推出：交互式 Gantt 图”。
  * [**Odoo**][26] 和 [**OpenProject**][27]都将某些重要功能限制在付费企业版中。

在这篇评论中，目的是包括所有带有 Gantt 编辑器和依赖调度的开源项目管理系统。如果我错过了一个项目或歪曲了一些东西，请在评论中让我知道。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/3/open-source-project-management

作者：[Frank Bergmann][a]
选题：[lujun9972][b]
译者：[stevenzdg988](https://github.com/stevenzdg988)
校对：[校对者ID](https://github.com/校对者ID)

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

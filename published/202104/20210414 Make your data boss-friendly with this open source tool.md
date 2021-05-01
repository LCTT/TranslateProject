[#]: subject: (Make your data boss-friendly with this open source tool)
[#]: via: (https://opensource.com/article/21/4/visualize-data-eda)
[#]: author: (Juanjo Ortilles https://opensource.com/users/jortilles)
[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13310-1.html)

用这个开源工具让你的数据对老板友好起来
======

> 企业数据分析旨在将数据可视化带给日常商务用户。

![](https://img.linux.net.cn/data/attachment/album/202104/19/092617elri0ff4r6lr06rr.jpg)

<ruby>企业数据分析<rt>Enterprise Data Analytics</rt></ruby>（[EDA][2]） 是一个网页应用，它可以通过一个简单、清晰的界面来获取信息。

在巴塞罗那开源分析公司 [Jortilles][3] 工作几年后，我们意识到，现代世界强制性地收集数据，但普通人没有简单的方法来查看或解释这些数据。有一些强大的开源工具可用于此目的，但它们非常复杂。我们找不到一个工具设计成能让没有什么技术能力的普通人轻松使用。

我们之所以开发 EDA，是因为我们认为获取信息是现代组织的要求和义务，并希望为每个人提供获取信息的机会。

![EDA interface][4]

### 可视化你的数据

EDA 使用人们已经理解的商业术语提供了一个数据模型。你可以选择你想要的信息，并可以以你想要的方式查看它。它的目标是对用户友好，同时又功能强大。

EDA 通过元数据模型将数据库中的信息可视化和丰富化。它可以从 BigQuery、Postgres、[MariaDB、MySQL][6] 和其他一些数据库中读取数据。这就把技术性的数据库模型转化为熟悉的商业概念。

它还设计为加快信息传播的速度，因为它可以利用已经存储在数据库中的数据。EDA 可以发现数据库的拓扑结构，并提出业务模型。如果你设计了一个好的数据库模型，你就有了一个好的业务模型。EDA 还可以连接到生产服务器，提供实时分析。

这种数据和数据模型的结合意味着你和你组织中的任何人都可以分析其数据。然而，为了保护数据，你可以定义数据安全，可以精确到行，以授予正当的人访问正当的数据。

EDA 的一些功能包括：

  * 自动生成数据模型
  * 一致的数据模型，防止出现不一致的查询
  * 高级用户的 SQL 模式
  * 数据可视化：
    * 标准图表（如柱状图、饼状图、线状图、树状图）
    * 地图整合（如 geoJSON shapefile、纬度、经度）
    * 电子邮件提醒，可通过关键绩效指标 （KPI） 来定义
  * 私人和公共信息控制，以启用私人和公共仪表板，你可以通过链接分享它。
  * 数据缓存和程序刷新。

### 如何使用 EDA

用 EDA 实现数据可视化的第一步是创建数据模型。

#### 创建数据模型

首先，在左侧菜单中选择 “New Datasource”。

接下来，选择你的数据存储的数据库系统（如 Postgres、MariaDB、MySQL、Vertica、SqlServer、Oracle、Big Query），并提供连接参数。

EDA 将自动为你生成数据模型。它读取表和列，并为它们定义名称以及表之间的关系。你还可以通过添加虚拟视图或 geoJSON 图来丰富你的数据模型。

#### 制作仪表板

现在你已经准备好制作第一个仪表板了。在 EDA 界面的主页面上，你应该会看到一个 “New dashboard” 按钮。点击它，命名你的仪表板，并选择你创建的数据模型。新的仪表板将出现一个面板供你配置。

要配置面板，请单击右上角的 “Configuration” 按钮，并选择你要做的事情。在 “Edit query” 中，选择你要显示的数据。这将出现一个新的窗口，你的数据模型由实体和实体的属性表示。选择你要查看的实体和你要使用的属性。例如，对于名为 “Customers” 的实体，你可能会显示 “Customer Name”，对于 “Sales” 实体，你可能希望显示 “Total Sales”。

接下来，运行一个查询，并选择你想要的可视化。

![EDA interface][7]

你可以添加任意数量的面板、过滤器和文本字段，所有这些都有说明。当你保存仪表板后，你可以查看它，与同事分享，甚至发布到互联网上。

### 获取 EDA

最快的方法是用 [公开演示][8] 来查看 EDA。但如果你想自己试一试，可以用 Docker 获取最新的 EDA 版本：

```
$ docker run -p 80:80 jortilles / eda: latest
```

我们还有一个 SaaS 选项，适用于任何想要使用 EDA 而无需进行安装、配置和持续更新的用户。你可以在我们的网站上查看 [云选项][9]。

如果你想看看它的实际运行情况，你可以在 YouTube 上观看一些 [演示][10]。

EDA 正在持续开发中，你可以在 GitHub 上找到它的 [源代码][11]。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/4/visualize-data-eda

作者：[Juanjo Ortilles][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jortilles
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/metrics_data_dashboard_system_computer_analytics.png?itok=oxAeIEI- (metrics and data shown on a computer screen)
[2]: https://eda.jortilles.com/en/jortilles-english/
[3]: https://www.jortilles.com/
[4]: https://opensource.com/sites/default/files/uploads/eda-display.jpeg (EDA interface)
[5]: https://creativecommons.org/licenses/by-sa/4.0/
[6]: https://opensource.com/article/20/10/mariadb-mysql-cheat-sheet
[7]: https://opensource.com/sites/default/files/uploads/eda-chart.jpeg (EDA interface)
[8]: https://demoeda.jortilles.com/
[9]: https://eda.jortilles.com
[10]: https://youtu.be/cBAAJbohHXQ
[11]: https://github.com/jortilles/EDA

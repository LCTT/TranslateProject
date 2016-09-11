Azure SQL 数据库已经支持 JSON
===========

我们很高兴地宣布你现在可以在 Azure SQL 中查询及存储关系型数据或者 JSON 了、Azure SQL 数据库提供了读取 JSON 文本数据的简单的内置函数，将 JSON 文本转化成表，以及将表的数据转化成 JSON。

![](https://azurecomcdn.azureedge.net/mediahandler/acomblog/media/Default/blog/1cc536a5-a822-467b-a4a2-4557746f70cc.png)

你可以使用 JSON 函数来从 JSON 文本中提取值（[JSON_VALUE][4]）、提取对象（[JSON_QUERY][5]）, 更新JSON 中的值（[JSON_MODIFY][6]），并且验证 JSON 文本的正确性（[ISJSON][7]）。[OPENJSON][8] 函数让你可以将 JSON 文本转化成表结构。最后，JSON 功能函数可以让你很简单地从 SQL 查询中使用 [FOR JSON][9] 从句来获得 JSON 文本结果。

### 你可以用 JSON 做什么？

Azure SQL 数据库中的 JSON 可以让您构建并与现代 web、移动设备和 HTML5/单页应用、诸如 Azure DocumentDB 等包含 JSON 格式化数据的 NoSQL 存储等交换数据，分析来自不同系统和服务的日志和消息。现在你可以轻易地将 Azure SQL 数据库与任何使用使用 JSON 的服务集成。

#### 轻易地开放数据给现代框架和服务

你有没有在使用诸如 REST 或者 Azure App 使用 JSON 来交换数据的服务？你有使用诸如 AngularJS、ReactJS、D3 或者 JQuery 等使用 JSON 的组件或框架么？使用新的 JSON 功能函数，你可以轻易地格式化存储在 Azure SQL 数据库中的数据，并将它用在任何现代服务或者应用中。

#### 轻松采集 JSON 数据

你有在使用移动设备、传感器、如 Azure Stream Analytics 或者 Insight 这样产生 JSON 的服务、如 Azure DocumentDB 或者 MongoDB 这样存储 JSON 的系统么？你需要在 Azure SQL 数据中使用熟悉的 SQL 语句来查询并分析 JSON 数据么？现在你可以轻松采集 JSON 数据并存储到 Azure SQL 数据库中，并且可以使用任何 Azure SQL 数据库支持的语言或者工具来查询和分析加载的数据。

#### 简化你的数据模型

你需要同时存储及查询数据库中关系型及半结构化的数据么？你需简化像 NoSQL 平台下的数据模型么？现在你可以在一张表中同时存储结构化数据及非结构化数据了。在 Azure SQL 数据库中，你可以同时从关系型及 NoSQL 的世界中使用最好的方法来调整你的数据模型。Azure SQL 数据库让你可以使用 Transact-SQL 语言来查询关系及 JSON 数据。程序和工具将不会在从表中取出的值及 JSON 文本中提取的值看出差别。

### 下一步

要学习如何在你的应用中集成 JSON，查看我们的[开始学习][1]页面或者 [Channel 9的视频][2]。要了解不同的情景下如何集成 JSON，观看 Channel 9 的视频或者在这些 [JSON 分类文章][3]中查找你感兴趣的使用情景。

我们将持续增加新的 JSON 特性并让 JSON 支持的更好。请敬请关注。


--------------------------------------------------------------------------------

via: https://azure.microsoft.com/en-us/blog/json-support-is-generally-available-in-azure-sql-database/

作者：[Jovan Popovic][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://azure.microsoft.com/en-us/blog/author/jovanpop/
[1]: https://azure.microsoft.com/en-us/documentation/articles/sql-database-json-features/
[2]: https://channel9.msdn.com/Shows/Data-Exposed/SQL-Server-2016-and-JSON-Support
[3]: http://blogs.msdn.com/b/sqlserverstorageengine/archive/tags/json/
[4]: https://msdn.microsoft.com/en-us/library/dn921898.aspx
[5]: https://msdn.microsoft.com/en-us/library/dn921884.aspx
[6]: https://msdn.microsoft.com/en-us/library/dn921892.aspx
[7]: https://msdn.microsoft.com/en-us/library/dn921896.aspx
[8]: https://msdn.microsoft.com/en-us/library/dn921885.aspx
[9]: https://msdn.microsoft.com/en-us/library/dn921882.aspx


Azure SQL数据库已经支持JSON
===========

我们很高兴地宣布你现在可以在Azure SQL中查询及存储关系型数据或者JSON了、Azure SQL数据库提供了简单的内置函数来读取JSON文本数据，将JSON文本转化成表，将表的数据转化成JSON。

![](https://azurecomcdn.azureedge.net/mediahandler/acomblog/media/Default/blog/1cc536a5-a822-467b-a4a2-4557746f70cc.png)


你可以使用JSON函数来从JSON文本中提取值（JSON_VALUE）, 提取对象（JSON_QUERY）, 更新JSON中的值（JSON_MODIFY）,并且验证JSON文本的正确性（ISJSON）。OPENJSON函数让你可以将JSON文本转化成表结构。最后，JSON功能函数可以让你很简单地从SQL查询中使用FOR JSON从句来获得JSON文本结果。

### 你可以用JSON做什么？


Azure SQL数据库中的JSON可以让您构建并与现代web、移动设备和HTML5/单页应用、NoSQL中存储的诸如Azure DocumentDB中的格式化成JSON的数据交换数据，分析来自不同系统和服务的日志和消息。现在你可以轻易地将Azure SQL数据库与任何使用使用JSON的服务集成。

#### 轻易地开放数据给现代框架和服务

你有没有在使用诸如REST或者Azure App使用JSON来交换数据的服务？你有使用诸如AngularJS、ReactJS、D3或者Jquery使用JSON的组件或框架么？使用新的JSON功能函数，你可以轻易地格式化存储在Azure SQL数据库中的数据，并将它开放在任何现代服务或者应用。

#### 轻松采集JSON数据

你有在使用移动设备、传感器、如Azure Stream Analytics或者Insight这样产生JSON的服务、如Azure DocumentDB 或者MongoDB这样存储JSON的系统么？你需要在Azure SQL数据中使用熟悉的SQL语句来查询并分析JSON数据么？现在你可以轻松采集JSON数据并存储到Azure SQL数据库中，并且可以使用任何Azure SQL数据库支持的语言或者工具来查询和分析加载的数据

#### 简化你的数据模型

你需要同时存储及查询数据库中关系型及半结构化的数据么？你需简化像NoSQL平台下的数据模型么？现在你可以在一张表中同时存储结构化数据及非结构化数据了。在Azure SQL数据库中，你可以同时从关系型及NoSQL的世界中使用最好的方法来调整你的数据模型。Azure SQL数据库让你可以使用Transact-SQL语言来查询关系及JSON数据。程序和工具将不会在从表中取出的值及JSON文本中提取的值看出差别。

### 下一步

要学习如何在你的应用中集成JSON，查看我们的[开始学习][1]页面或者[Channel 9的视频][2]。要了解不同的情景下如何集成JSON，观看Channel 9的视频或者在这些[JSON分类文章][3]中查找你感兴趣的使用情景。

我们将持续增加新的JSON特性并让JSON支持的更好。请敬请关注。




--------------------------------------------------------------------------------

via: https://azure.microsoft.com/en-us/blog/json-support-is-generally-available-in-azure-sql-database/?utm_source=dbweekly&utm_medium=email

作者：[Jovan Popovic][a]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://azure.microsoft.com/en-us/blog/author/jovanpop/
[1]: https://azure.microsoft.com/en-us/documentation/articles/sql-database-json-features/
[2]: https://channel9.msdn.com/Shows/Data-Exposed/SQL-Server-2016-and-JSON-Support
[3]: http://blogs.msdn.com/b/sqlserverstorageengine/archive/tags/json/








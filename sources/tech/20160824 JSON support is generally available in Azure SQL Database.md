JSON support is generally available in Azure SQL Database
===========

We are happy to announce that you can now query and store both relational and textual data formatted in JavaScript Object Notation (JSON) using Azure SQL Database. Azure SQL Database provides simple built-in functions that read data from JSON text, transform JSON text into table, and format data from SQL tables as JSON.

![](https://azurecomcdn.azureedge.net/mediahandler/acomblog/media/Default/blog/1cc536a5-a822-467b-a4a2-4557746f70cc.png)


You can use JSON functions that enable you to extract value from JSON text (JSON_VALUE), extract object from JSON (JSON_QUERY), update some value in JSON text (JSON_MODIFY), and verify that JSON text is properly formatted (ISJSON). OPENJSON function enables you to convert JSON text into a table structure. Finally, JSON functionalities enable you to easily format results of any SQL query as JSON text using the FOR JSON clause.

### What can you do with JSON?

JSON in Azure SQL Database enables you to build and exchange data with modern web, mobile, and HTM5/JavaScript single-page applications, NoSql stores such as Azure DocumentDB that contain data formatted as JSON, and to analyze logs and messages collected from different systems and services. Now you can easily integrate your Azure SQL Database with any service that uses JSON.

#### Easily expose your data to modern frameworks and services

Do you use services that exchange data in JSON format, such as REST services or Azure App Services? Do you have components or frameworks that use JSON, such as Angular JS, ReactJS, D3, or JQuery? With new JSON functionalities, you can easily format data stored in Azure SQL Database as JSON and expose it to any modern service or application.

#### Easy ingestion of JSON data

Are you working with mobile devices or sensors, services that produce JSON such as Azure Stream Analytics or Application Insight, or systems that store data in JSON format such as Azure DocumentDB or MongoDB? Do you need to query and analyze JSON data using well-known SQL language or tools that work with Azure SQL Database? Now, you can easily ingest JSON data and store it into Azure SQL Database, and use any language or tool that works with Azure SQL Database to query and analyze loaded information.

#### Simplify your data models

Do you need to store and query both relational and semi-structured data in your database? Do you need to simplify your data models like in NoSQL data platforms? Now you can combine structured relational data with schema-less data stored as JSON text in the same table. In Azure SQL Database you can use the best approaches both from relational and NoSQL worlds to tune your data model. Azure SQL Database enables you to query both relational and JSON data with the standard Transact-SQL language. Applications and tools would not see any difference between values taken from table columns and the values extracted from JSON text.

### Next steps

To learn how to integrate JSON in your application, check out our [Getting Started][1] page or [Channel 9 video][2]. To learn about various scenarios that show how to integrate JSON in your application, see demos in this Channel 9 video or find some scenario that might be interesting for your use case in these [JSON Blog posts][3].

Stay tuned because we will constantly add new JSON features and make JSON support even better.



--------------------------------------------------------------------------------

via: https://azure.microsoft.com/en-us/blog/json-support-is-generally-available-in-azure-sql-database/?utm_source=dbweekly&utm_medium=email

作者：[Jovan Popovic][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://azure.microsoft.com/en-us/blog/author/jovanpop/
[1]: https://azure.microsoft.com/en-us/documentation/articles/sql-database-json-features/
[2]: https://channel9.msdn.com/Shows/Data-Exposed/SQL-Server-2016-and-JSON-Support
[3]: http://blogs.msdn.com/b/sqlserverstorageengine/archive/tags/json/








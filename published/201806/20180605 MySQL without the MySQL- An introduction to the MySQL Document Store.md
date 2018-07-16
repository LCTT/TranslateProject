不像 MySQL 的 MySQL：MySQL 文档存储介绍
======

>  MySQL 文档存储 可以跳过底层数据结构创建、数据规范化和其它使用传统数据库时需要做的工作，直接存储数据。

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/open_business_sign_store.jpg?itok=g4QibRqg)

MySQL 可以提供 NoSQL JSON <ruby>文档存储<rt>Document Store</rt></ruby>了，这样开发者保存数据前无需<ruby>规范化<rt>normalize</rt></ruby>数据、创建数据库，也无需在开发之前就制定好数据样式。从 MySQL 5.7 版本和 MySQL 8.0 版本开始，开发者可以在表的一列中存储 JSON 文档。由于引入 X DevAPI，你可以从你的代码中移除令人不爽的结构化查询字符串，改为使用支持现代编程设计的 API 调用。

系统学习过结构化查询语言（SQL）、<ruby>关系理论<rt>relational theory</rt></ruby>、<ruby>集合<rt>set</rt></ruby>和其它关系数据库底层理论的开发者并不多，但他们需要一个安全可靠的数据存储。如果数据库管理人员不足，事情很快就会变得一团糟，

[MySQL 文档存储][1] 允许开发者跳过底层数据结构创建、数据规范化和其它使用传统数据库时需要做的工作，直接存储数据。只需创建一个 JSON <ruby>文档集合<rt>document collection</rt></ruby>，接着就可以使用了。

### JSON 数据类型

所有这一切都基于多年前 MySQL 5.7 引入的 JSON 数据类型。它允许在表的一行中提供大约 1GB 大小的列。数据必须是有效的 JSON，否则服务器会报错；但开发者可以自由使用这些空间。

### X DevAPI

旧的 MySQL 协议已经历经差不多四分之一个世纪，已经显现出疲态，因此新的协议被开发出来，协议名为 [X DevAPI][2]。协议引入高级会话概念，允许代码从单台服务器扩展到多台，使用符合<ruby>通用主机编程语言样式<rt>common host-language programming patterns</rt></ruby>的非阻塞异步 I/O。需要关注的是如何遵循现代实践和编码风格，同时使用 CRUD （Create、 Replace、 Update、 Delete）样式。换句话说，你不再需要在你精美、纯洁的代码中嵌入丑陋的 SQL 语句字符串。

一个新的 shell 支持这种新协议，即所谓的 [MySQL Shell][3]。该 shell 可用于设置<ruby>高可用集群<rt>high-availability cluster</rt></ruby>、检查服务器<ruby>升级就绪状态<rt>upgrade readiness</rt></ruby>以及与 MySQL 服务器交互。支持的交互方式有以下三种：JavaScript，Python 和 SQL。

### 代码示例

下面的代码示例基于 JavaScript 方式使用 MySQL Shell，可以从 `JS>` 提示符看出。

下面，我们将使用用户 `dstokes` 、密码 `password` 登录本地系统上的 `demo` 库。`db` 是一个指针，指向 `demo` 库。

```
$ mysqlsh dstokes:password@localhost/demo
JS> db.createCollection("example")
JS> db.example.add(
      {
        Name: "Dave",
        State:  "Texas",
        foo : "bar"
      }
     )
JS>
```

在上面的示例中，我们登录服务器，连接到 `demo` 库，创建了一个名为 `example` 的集合，最后插入一条记录；整个过程无需创建表，也无需使用 SQL。只要你能想象的到，你可以使用甚至滥用这些数据。这不是一种代码对象与关系语句之间的映射器，因为并没有将代码映射为 SQL；新协议直接与服务器层打交道。

### Node.js 支持

新 shell 看起来挺不错，你可以用其完成很多工作；但你可能更希望使用你选用的编程语言。下面的例子使用 `world_x` 示例数据库，搜索 `_id` 字段匹配 `CAN.` 的记录。我们指定数据库中的特定集合，使用特定参数调用 `find` 命令。同样地，操作也不涉及 SQL。

```
var mysqlx = require('@mysql/xdevapi');
mysqlx.getSession({             //Auth to server
        host: 'localhost',
        port: '33060',
        dbUser: 'root',
        dbPassword: 'password'
}).then(function (session) {    // use world_x.country.info
     var schema = session.getSchema('world_x');
     var collection = schema.getCollection('countryinfo');

collection                      // Get row for 'CAN'
  .find("$._id == 'CAN'")
  .limit(1)
  .execute(doc => console.log(doc))
  .then(() => console.log("\n\nAll done"));

  session.close();
})
```

下面例子使用 PHP，搜索 `_id` 字段匹配 `USA` 的记录：

```
<?PHP
// Connection parameters
  $user = 'root';
  $passwd = 'S3cret#';
  $host = 'localhost';
  $port = '33060';
  $connection_uri = 'mysqlx://'.$user.':'.$passwd.'@'.$host.':'.$port;
  echo $connection_uri . "\n";

// Connect as a Node Session
  $nodeSession = mysql_xdevapi\getNodeSession($connection_uri);
// "USE world_x" schema
  $schema = $nodeSession->getSchema("world_x");
// Specify collection to use
  $collection = $schema->getCollection("countryinfo");
// SELECT * FROM world_x WHERE _id = "USA"
  $result = $collection->find('_id = "USA"')->execute();
// Fetch/Display data
  $data = $result->fetchAll();
  var_dump($data);
?>
```

可以看出，在上面两个使用不同编程语言的例子中，`find` 操作符的用法基本一致。这种一致性对跨语言编程的开发者有很大帮助，对试图降低新语言学习成本的开发者也不无裨益。

支持的语言还包括 C、Java、Python 和 JavaScript 等，未来还会有更多支持的语言。

### 从两种方式受益

我会告诉你使用 NoSQL 方式录入的数据也可以用 SQL 方式使用？换句话说，我会告诉你新引入的 NoSQL 方式可以访问旧式关系型表中的数据？现在使用 MySQL 服务器有多种方式，作为 SQL 服务器，作为 NoSQL 服务器或者同时作为两者。

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/6/mysql-document-store

作者：[Dave Stokes][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[pinewall](https://github.com/pinewall)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/davidmstokes
[1]:https://www.mysql.com/products/enterprise/document_store.html
[2]:https://dev.mysql.com/doc/x-devapi-userguide/en/
[3]:https://dev.mysql.com/downloads/shell/
[4]:http://www.southeastlinuxfest.org/

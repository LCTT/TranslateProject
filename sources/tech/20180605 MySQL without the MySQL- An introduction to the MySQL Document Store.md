pinewall translating

MySQL without the MySQL: An introduction to the MySQL Document Store
======

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/open_business_sign_store.jpg?itok=g4QibRqg)

MySQL can act as a NoSQL JSON Document Store so programmers can save data without having to normalize data, set up schemas, or even have a clue what their data looks like before starting to code. Since MySQL version 5.7 and in MySQL 8.0, developers can store JSON documents in a column of a table. By adding the new X DevAPI, you can stop embedding nasty strings of structured query language in your code and replace them with API calls that support modern programming design.

Very few developers have any formal training in structured query language (SQL), relational theory, sets, or other foundations of relational databases. But they need a secure, reliable data store. Add in a dearth of available database administrators, and things can get very messy quickly.

The [MySQL Document Store][1] allows programmers to store data without having to create an underlying schema, normalize data, or any of the other tasks normally required to use a database. A JSON document collection is created and can then be used.

### JSON data type

This is all based on the JSON data type introduced a few years ago in MySQL 5.7. This provides a roughly 1GB column in a row of a table. The data has to be valid JSON or the server will return an error, but developers are free to use that space as they want.

### X DevAPI

The old MySQL protocol is showing its age after almost a quarter-century, so a new protocol was developed called [X DevAPI][2]. It includes a new high-level session concept that allows code to scale from one server to many with non-blocking, asynchronous I/O that follows common host-language programming patterns. The focus is put on using CRUD (create, replace, update, delete) patterns while following modern practices and coding styles. Or, to put it another way, you no longer have to embed ugly strings of SQL statements in your beautiful, pristine code.

### Coding examples

A new shell, creatively called the [MySQL Shell][3] , supports this new protocol. It can be used to set up high-availability clusters, check servers for upgrade readiness, and interact with MySQL servers. This interaction can be done in three modes: JavaScript, Python, and SQL.

The coding examples that follow are in the JavaScript mode of the MySQL Shell; it has a `JS>` prompt.

Here, we will log in as `dstokes` with the password `password` to the local system and a schema named `demo`. There is a pointer to the schema demo that is named `db`.
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

Above we logged into the server, connected to the `demo` schema, created a collection named `example`, and added a record, all without creating a table definition or using SQL. We can use or abuse this data as our whims desire. This is not an object-relational mapper, as there is no mapping the code to the SQL because the new protocol “speaks” at the server layer.

### Node.js supported

The new shell is pretty sweet; you can do a lot with it, but you will probably want to use your programming language of choice. The following example uses the `world_x` demo database to search for a record with the `_id` field matching "CAN." We point to the desired collection in the schema and issue a `find` command with the desired parameters. Again, there’s no SQL involved.
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

Here is another example in PHP that looks for "USA":
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

?>#!/usr/bin/phpmysql_xdevapi\getNodeSession

```

Note that the `find` operator used in both examples looks pretty much the same between the two different languages. This consistency should help developers who hop between programming languages or those looking to reduce the learning curve with a new language.

Other supported languages include C, Java, Python, and JavaScript, and more are planned.

### Best of both worlds

Did I mention that the data entered in this NoSQL fashion is also available from the SQL side of MySQL? Or that the new NoSQL method can access relational data in old-fashioned relational tables? You now have the option to use your MySQL server as a SQL server, a NoSQL server, or both.

Dave Stokes will present "MySQL Without the SQL—Oh My!" at [Southeast LinuxFest][4], June 8-10, in Charlotte, N.C.

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/6/mysql-document-store

作者：[Dave Stokes][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/davidmstokes
[1]:https://www.mysql.com/products/enterprise/document_store.html
[2]:https://dev.mysql.com/doc/x-devapi-userguide/en/
[3]:https://dev.mysql.com/downloads/shell/
[4]:http://www.southeastlinuxfest.org/

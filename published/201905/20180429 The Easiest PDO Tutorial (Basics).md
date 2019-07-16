PHP PDO 简单教程
======

![](http://www.theitstuff.com/wp-content/uploads/2018/04/php-language.jpg)

大约 80% 的 Web 应用程序由 PHP 提供支持。类似地，SQL 也是如此。PHP 5.5 版本之前，我们有用于访问 MySQL 数据库的 mysql_ 命令，但由于安全性不足，它们最终被弃用。

弃用这件事是发生在 2013 年的 PHP 5.5 上，我写这篇文章的时间是 2018 年，PHP 版本为 7.2。mysql_ 的弃用带来了访问数据库的两种主要方法：mysqli 和 PDO 库。

虽然 mysqli 库是官方指定的，但由于 mysqli 只能支持 mysql 数据库，而 PDO 可以支持 12 种不同类型的数据库驱动程序，因此 PDO 获得了更多的赞誉。此外，PDO 还有其它一些特性，使其成为大多数开发人员的更好选择。你可以在下表中看到一些特性比较：

|                           | PDO        | MySQLi       
---|---|---
| 数据库支持            | 12 种驱动   | 只有 MySQL 
| 范例                  | OOP         | 过程 + OOP  
| 预处理语句（客户端侧）  | Yes         | No        
| 1命名参数               | Yes         | No          

现在我想对于大多数开发人员来说，PDO 是首选的原因已经很清楚了。所以让我们深入研究它，并希望在本文中尽量涵盖关于 PDO 你需要的了解的。

### 连接

第一步是连接到数据库，由于 PDO 是完全面向对象的，所以我们将使用 PDO 类的实例。

我们要做的第一件事是定义主机、数据库名称、用户名、密码和数据库字符集。

```
$host = 'localhost';
$db   = 'theitstuff';
$user = 'root';
$pass = 'root';
$charset = 'utf8mb4';
$dsn = "mysql:host=$host;dbname=$db;charset=$charset";
$conn = new PDO($dsn, $user, $pass);
```

之后，正如你在上面的代码中看到的，我们创建了 DSN 变量，DSN 变量只是一个保存数据库信息的变量。对于一些在外部服务器上运行 MySQL 的人，你还可以通过提供一个 `port=$port_number` 来调整端口号。

最后，你可以创建一个 PDO 类的实例，我使用了 `$conn` 变量，并提供了 `$dsn`、`$user`、`$pass` 参数。如果你遵循这些步骤，你现在应该有一个名为 `$conn` 的对象，它是 PDO 连接类的一个实例。现在是时候进入数据库并运行一些查询。

### 一个简单的 SQL 查询

现在让我们运行一个简单的 SQL 查询。

```
$tis = $conn->query('SELECT name, age FROM students');
while ($row = $tis->fetch())
{
  echo $row['name']."\t";
  echo $row['age'];
  echo "<br>";
}
```

这是使用 PDO 运行查询的最简单形式。我们首先创建了一个名为 `tis`（TheITStuff 的缩写 ）的变量，然后你可以看到我们使用了创建的 `$conn` 对象中的查询函数。

然后我们运行一个 `while` 循环并创建了一个 `$row` 变量来从 `$tis` 对象中获取内容，最后通过调用列名来显示每一行。

很简单，不是吗？现在让我们来看看预处理语句。

### 预处理语句

预处理语句是人们开始使用 PDO 的主要原因之一，因为它提供了可以阻止 SQL 注入的语句。

有两种基本方法可供使用，你可以使用位置参数或命名参数。

#### 位置参数

让我们看一个使用位置参数的查询示例。

```
$tis = $conn->prepare("INSERT INTO STUDENTS(name, age) values(?, ?)");
$tis->bindValue(1,'mike');
$tis->bindValue(2,22);
$tis->execute();
```

在上面的例子中，我们放置了两个问号，然后使用 `bindValue()` 函数将值映射到查询中。这些值绑定到语句问号中的位置。

我还可以使用变量而不是直接提供值，通过使用 `bindParam()` 函数相同例子如下：

```
$name='Rishabh'; $age=20;
$tis = $conn->prepare("INSERT INTO STUDENTS(name, age) values(?, ?)");
$tis->bindParam(1,$name);
$tis->bindParam(2,$age);
$tis->execute();
```

### 命名参数

命名参数也是预处理语句，它将值/变量映射到查询中的命名位置。由于没有位置绑定，因此在多次使用相同变量的查询中非常有效。

```
$name='Rishabh'; $age=20;
$tis = $conn->prepare("INSERT INTO STUDENTS(name, age) values(:name, :age)");
$tis->bindParam(':name', $name);
$tis->bindParam(':age', $age);
$tis->execute();
```

你可以注意到，唯一的变化是我使用 `:name` 和 `:age` 作为占位符，然后将变量映射到它们。冒号在参数之前使用，让 PDO 知道该位置是一个变量，这非常重要。

你也可以类似地使用 `bindValue()` 来使用命名参数直接映射值。

### 获取数据

PDO 在获取数据时非常丰富，它实际上提供了许多格式来从数据库中获取数据。

你可以使用 `PDO::FETCH_ASSOC` 来获取关联数组，`PDO::FETCH_NUM` 来获取数字数组，使用 `PDO::FETCH_OBJ` 来获取对象数组。

```
$tis = $conn->prepare("SELECT * FROM STUDENTS");
$tis->execute();
$result = $tis->fetchAll(PDO::FETCH_ASSOC);
```

你可以看到我使用了 `fetchAll`，因为我想要所有匹配的记录。如果只需要一行，你可以简单地使用 `fetch`。

现在我们已经获取了数据，现在是时候循环它了，这非常简单。

```
foreach ($result as $lnu){
  echo $lnu['name'];
  echo $lnu['age']."<br>";
}
```

你可以看到，因为我请求了关联数组，所以我正在按名称访问各个成员。

虽然在定义希望如何传输递数据方面没有要求，但在定义 `$conn` 变量本身时，实际上可以将其设置为默认值。

你需要做的就是创建一个 `$options` 数组，你可以在其中放入所有默认配置，只需在 `$conn` 变量中传递数组即可。

```
$options = [
  PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
];
$conn = new PDO($dsn, $user, $pass, $options);
```

这是一个非常简短和快速的 PDO 介绍，我们很快就会制作一个高级教程。如果你在理解本教程的任何部分时遇到任何困难，请在评论部分告诉我，我会在那你为你解答。

--------------------------------------------------------------------------------

via: http://www.theitstuff.com/easiest-pdo-tutorial-basics

作者：[Rishabh Kandari][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[MjSeven](https://github.com/MjSeven)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.theitstuff.com/author/reevkandari

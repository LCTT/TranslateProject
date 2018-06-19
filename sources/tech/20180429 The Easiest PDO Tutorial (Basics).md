The Easiest PDO Tutorial (Basics)
======

![](http://www.theitstuff.com/wp-content/uploads/2018/04/php-language.jpg)

Approximately 80% of the web is powered by PHP. And similarly, high number goes for SQL as well. Up until PHP version 5.5, we had the **mysql_** commands for accessing mysql databases but they were eventually deprecated due to insufficient security.

This happened with PHP 5.5 in 2013 and as I write this article, the year is 2018 and we are on PHP 7.2. The deprecation of mysql**_** brought 2 major ways of accessing the database, the **mysqli** and the **PDO** libraries.

Now though the mysqli library was the official successor, PDO gained more fame due to a simple reason that mysqli could only support mysql databases whereas PDO could support 12 different types of database drivers. Also, PDO had several more features that made it the better choice for most developers. You can see some of the feature comparisons in the table below;

|                                  | PDO        | MySQLi           |
| Database support**               | 12 drivers | Only MySQL       |
| Paradigm                         | OOP        | Procedural + OOP |
| Prepared Statements Client Side) | Yes        | No               |
| Named Parameters                 | Yes        | No               |

Now I guess it is pretty clear why PDO is the choice for most developers, so let’s dig into it and hopefully we will try to cover most of the PDO you need in this article itself.

### Connection

The first step is connecting to the database and since PDO is completely Object Oriented, we will be using the instance of a PDO class.

The first thing we do is we define the host, database name, user, password and the database charset.

`$host = 'localhost';`

`$db = 'theitstuff';`

`$user = 'root';`

`$pass = 'root';`

`$charset = 'utf8mb4';`

`$dsn = "mysql:host=$host;dbname=$db;charset=$charset";`

`$conn = new PDO($dsn, $user, $pass);`

After that, as you can see in the code above we have created the **DSN** variable, the DSN variable is simply a variable that holds the information about the database. For some people running mysql on external servers, you could also adjust your port number by simply supplying a **port=$port_number**.

Finally, you can create an instance of the PDO class, I have used the **$conn** variable and I have supplied the **$dsn, $user, $pass** parameters. If you have followed this, you should now have an object named $conn that is an instance of the PDO connection class. Now it’s time to get into the database and run some queries.

### A simple SQL Query

Let us now run a simple SQL query.

`$tis = $conn->query('SELECT name, age FROM students');`

`while ($row = $tis->fetch())`

`{`

`echo $row['name']."\t";`

`echo $row['age'];`

`echo "<br>";`

`}`

This is the simplest form of running a query with PDO. We first created a variable called **tis( **short for TheITStuff** )** and then you can see the syntax as we used the query function from the $conn object that we had created.

We then ran a while loop and created a **$row** variable to fetch the contents from the **$tis** object and finally echoed out each row by calling out the column name.

Easy wasn’t it ?. Now let’s get to the prepared statement.

### Prepared Statements

Prepared statements were one of the major reasons people started using PDO as it had prepared statements that could prevent SQL injections.

There are 2 basic methods available, you could either use positional or named parameters.

#### Position parameters

Let us see an example of a query using positional parameters.

`$tis = $conn->prepare("INSERT INTO STUDENTS(name, age) values(?, ?)");`

`$tis->bindValue(1,'mike');`

`$tis->bindValue(2,22);`

`$tis->execute();`

In the above example, we have placed 2 question marks and later used the **bindValue()** function to map the values into the query. The values are bound to the position of the question mark in the statement.

I could also use variables instead of directly supplying values by using the **bindParam()** function and example for the same would be this.

`$name='Rishabh'; $age=20;`

`$tis = $conn->prepare("INSERT INTO STUDENTS(name, age) values(?, ?)");`

`$tis->bindParam(1,$name);`

`$tis->bindParam(2,$age);`

`$tis->execute();`

### Named Parameters

Named parameters are also prepared statements that map values/variables to a named position in the query. Since there is no positional binding, it is very efficient in queries that use the same variable multiple time.

`$name='Rishabh'; $age=20;`

`$tis = $conn->prepare("INSERT INTO STUDENTS(name, age) values(:name, :age)");`

`$tis->bindParam(':name', $name);`

`$tis->bindParam(':age', $age);`

`$tis->execute();`

The only change you can notice is that I used **:name** and **:age** as placeholders and then mapped variables to them. The colon is used before the parameter and it is of extreme importance to let PDO know that the position is for a variable.

You can similarly use **bindValue()** to directly map values using Named parameters as well.

### Fetching the Data

PDO is very rich when it comes to fetching data and it actually offers a number of formats in which you can get the data from your database.

You can use the **PDO::FETCH_ASSOC** to fetch associative arrays, **PDO::FETCH_NUM** to fetch numeric arrays and **PDO::FETCH_OBJ** to fetch object arrays.

`$tis = $conn->prepare("SELECT * FROM STUDENTS");`

`$tis->execute();`

`$result = $tis->fetchAll(PDO::FETCH_ASSOC);`

You can see that I have used **fetchAll** since I wanted all matching records. If only one row is expected or desired, you can simply use **fetch.**

Now that we have fetched the data it is time to loop through it and that is extremely easy.

`foreach($result as $lnu){`

`echo $lnu['name'];`

`echo $lnu['age']."<br>";`

`}`

You can see that since I had requested associative arrays, I am accessing individual members by their names.

Though there is absolutely no problem in defining how you want your data delivered, you could actually set one as default when defining the connection variable itself.

All you need to do is create an options array where you put in all your default configs and simply pass the array in the connection variable.

`$options = [`

` PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,`

`];`

`$conn = new PDO($dsn, $user, $pass, $options);`

This was a very brief and quick intro to PDO we will be making an advanced tutorial soon. If you had any difficulties understanding any part of the tutorial, do let me know in the comment section and I’ll be there for you.


--------------------------------------------------------------------------------

via: http://www.theitstuff.com/easiest-pdo-tutorial-basics

作者：[Rishabh Kandari][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.theitstuff.com/author/reevkandari

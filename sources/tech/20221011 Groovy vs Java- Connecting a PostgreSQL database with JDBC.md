[#]: subject: "Groovy vs Java: Connecting a PostgreSQL database with JDBC"
[#]: via: "https://opensource.com/article/22/10/groovy-vs-java-sql"
[#]: author: "Chris Hermansen https://opensource.com/users/clhermansen"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Groovy vs Java: Connecting a PostgreSQL database with JDBC
======
This example demonstrates how Groovy streamlines the clunkiness of Java.

![Coffee beans][1]

Image by: Pixabay. CC0.

Lately, I've been looking at how Groovy streamlines the slight clunkiness of Java. This article examines some differences between connecting to a PostgreSQL database using JDBC in Java versus Groovy.

### Install Java and Groovy

Groovy is based on Java and requires a Java installation. Both a recent/decent version of Java and Groovy might be in your Linux distribution's repositories, or you can install Groovy by following [these instructions][2]. A nice alternative for Linux users is SDKMan, which provides multiple versions of Java, Groovy, and many other related tools. For this article, I'm using SDK's releases of:

* Java version 11.0.12-open of OpenJDK 11
* Groovy version 3.0.8

### Back to the problem

If you haven't already, please review [this article][3] on installing JDBC and [this article][4] on setting up PostgreSQL.

Whether you're using Java or Groovy, several basic steps happen in any program that uses JDBC to pull data out of a database:

1. Establish a `Connection` instance to the database back end where the data resides.
2. Using an SQL string, get an instance of a `Statement` (or something similar, like a `PreparedStatement`) that will handle the execution of the SQL string.
3. Process the `ResultSet` instance returned by having the `Statement` instance execute the query, for example, printing the rows returned on the console.
4. Close the `Statement` and `Connection` instances when done.

In Java, the correspondence between the code and the list above is essentially one-for-one. Groovy, as usual, streamlines the process.

#### Java example

Here's the Java code to look at the land cover data I loaded in the second article linked above:

```
1  import java.sql.Connection;
2  import java.sql.Statement;
3  import java.sql.ResultSet;
4  import java.sql.DriverManager;
5  import java.sql.SQLException;
       
6  public class TestQuery {
       
7      public static void main(String[] args) {
       
8          final String url = "jdbc:postgresql://localhost/landcover";
9          final String user = "clh";
10         final String password = "carl-man";
11         try (Connection connection = DriverManager.getConnection(url, user, password)) {
12             try (Statement statement = connection.createStatement()) {
13                 ResultSet res = statement.executeQuery("select distinct country_code from land_cover");
14                 while (res.next()) {
15                     System.out.println("country code " + res.getString("country_code"));
16                 }
       
17             } catch (SQLException se) {
18                 System.err.println(se.getMessage());
19             }
20         } catch (SQLException ce) {
21             System.err.println(ce.getMessage());
22         }
23     }
24 }
```

Lines 1-5 are the necessary import statements for the JDBC classes. Of course, I could shorten this to `import java.sql.*` but that sort of thing is somewhat frowned-upon these days.

Lines 6-24 define the public class `TestQuery` I will use to connect to the database and print some of the contents of the main table.

Lines 7-23 define the `main` method that does the work.

Lines 8-10 define the three strings needed to connect to a database: The URL, the user name, and the user password.

Lines 11-22 use a try-with-resources to open the `Connection` instance and automatically close it when done.

Lines 12 -19 use another try-with-resources to open the `Statement` instance and automatically close it when done.

Line 13 creates the `ResultSet` instance handle the SQL query, which uses **SELECT DISTINCT** to get all unique values of **country_code** from the **land_cover** table in the database.

Lines 14-16 process the result set returned by the query, printing out the country codes one per line.

Lines 17-19 and 20-22 handle any SQL exceptions.

#### Groovy example

I'll do something similar in Groovy:

```
1  import groovy.sql.Sql
       
2  final String url = "jdbc:postgresql://localhost/landcover"
3  final String user = "me"
4  final String password = "my-password"
5  final String driver = "org.postgresql.Driver"
       
6  Sql.withInstance(url, user, password, driver) { sql ->
       
7      sql.eachRow('select distinct country_code from land_cover') { row ->
8        println "row.country_code ${row.country_code}"
9      }
10  }
```

Okay, that's a lot shorter–10 lines instead of 24! Here are the details:

Line 1 is the only import needed. In my view, not having to jump around JavaDocs for three different classes is a distinct advantage.

Lines 2-5 define the four strings needed to connect to a database using the `Sql` class. The first three are the same as for `java.sql.Connection` ; the fourth names the driver I want.

Line 6 is doing a bunch of heavy lifting. The method call is `Sql.withInstance()`, similar to other uses of "with" in Groovy. The call:

* Creates an instance of `Sql` (connection, statement, etc.).
* Takes a closure as its final parameter, passing it the instance of `Sql` that it created.
* Closes the instance of `Sql` when the closure exits.

Line 7 calls the `eachRow()` method of the `Sql` instance, wrapping the creation and processing of the result set. The `eachRow()` method takes a closure as its final argument and passes each `row` to the closure as it processes the returned lines of data from the table.

### Groovy can simplify your life

For those of you whose day job involves scripting and relational databases, I think it's pretty obvious from the above that Groovy can simplify your life. A few closing comments:

* I could have accomplished this similarly to the Java version; for example, instead of calling `sql.eachRow()`, I could have called `sql.query()`, which takes a closure as its last argument and passes a result set to that closure, at which point I would have probably used a `while()` as in the Java version (or maybe `each()`).
* I could also read the resulting rows into a list, all at once, using a call to `sql.rows()`, which can transform the data in a manner similar to using `.collect()` on a list.
* Remember that the SQL passed into the `eachRow()` (or `query()`) method can be arbitrarily complex, including table joins, grouping, ordering, and any other operations supported by the database in question.
* Note that SQL can also be parametrized when using an instance of `PreparedStatement`, which is a nice way to avoid SQL injection if any part of the SQL comes in from outside the coder's sphere of control.
* This is a good moment to point the diligent reader to the [JavaDocs for groovy.sql.Sql][5].

### Groovy resources

The [Apache Groovy language site][6] provides a good tutorial-level overview of working with databases, including other ways to connect, plus additional operations, including insertions, deletions, transactions, batching, pagination—the list goes on. This documentation is quite concise and easy to follow, at least partly because the facility it is documenting has itself been designed to be concise and easy to use!

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/10/groovy-vs-java-sql

作者：[Chris Hermansen][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/clhermansen
[b]: https://github.com/lkxed
[1]: https://opensource.com/sites/default/files/lead-images/java-coffee-beans.jpg
[2]: https://groovy.apache.org/download.html
[3]: https://opensource.com/article/22/9/install-jdbc-linux
[4]: https://opensource.com/article/22/9/drop-your-database-for-postgresql
[5]: https://docs.groovy-lang.org/latest/html/api/index.html
[6]: https://groovy-lang.org/

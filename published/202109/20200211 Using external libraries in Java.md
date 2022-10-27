[#]: collector: (lujun9972)
[#]: translator: (unigeorge)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13769-1.html)
[#]: subject: (Using external libraries in Java)
[#]: via: (https://opensource.com/article/20/2/external-libraries-java)
[#]: author: (Chris Hermansen https://opensource.com/users/clhermansen)

在 Java 中使用外部库
======

> 外部库填补了 Java 核心库中的一些功能空白。

![](https://img.linux.net.cn/data/attachment/album/202109/10/075749s65x89uzxj8x5kq9.jpg)

Java 自带有一组核心库，其中包含了定义常用数据类型和相关行为的库（例如 `String` 和 `Date`）、与主机操作系统交互的实用程序（例如 `System` 和 `File`），以及一些用来管理安全性、处理网络通信、创建或解析 XML的有用的子系统。鉴于核心库的丰富性，程序员通常很容易在其中找到有用的组件，以减少需要编写的代码量。

即便如此，核心库仍有一些功能上的不足，因此发现这些不足的程序员们还额外创建了很多有趣的 Java 库。例如，[Apache Commons][2]“是一个专注于可重用 Java 组件所有方面的 Apache 项目”，提供了大约 43 个开源库的集合（截至撰写本文时），涵盖了 Java 核心库之外的一系列功能 （例如 [geometry][3] 或 [statistics][4]），并增强或替换了 Java 核心库中的原有功能（例如 [math][5] 或 [numbers][6]）。

另一种常见的 Java 库类型是系统组件的接口（例如数据库系统接口），本文会着眼于使用此类接口连接到 [PostgreSQL][7] 数据库，并得到一些有趣的信息。首先，我们来回顾一下库的重要部分。

### 什么是库？

<ruby>库<rt>library</rt></ruby>里自然包含的是一些有用的代码。但为了发挥用处，代码需要以特定方式进行组织，特定的方式使 Java 程序员可以访问其中组件来解决手头问题。

可以说，一个库最重要的部分是它的应用程序编程接口（API）文档。这种文档很多人都熟悉，通常是由 [Javadoc][8] 生成的。Javadoc 读取代码中的结构化注释并以 HTML 格式输出文档，通常 API 的 <ruby>包<rt>package</rt></ruby> 在页面左上角的面板中显示，<ruby>类<rt>class</rt></ruby> 在左下角显示，同时右侧会有库、包或类级别的详细文档（具体取决于在主面板中选择的内容）。例如，[Apache Commons Math 的顶级 API 文档][9] 如下所示：

![API documentation for Apache Commons Math][10]

单击主面板中的包会显示该包中定义的 Java 类和接口。例如，[org.apache.commons.math4.analysis.solvers][11] 显示了诸如 `BisectionSolver` 这样的类，该类用于使用二分算法查找单变量实函数的零点。单击 [BisectionSolver][12] 链接会列出 `BisectionSolver` 类的所有方法。 

这类文档可用作参考文档，不适合作为学习如何使用库的教程。比如，如果你知道什么是单变量实函数并查看包 `org.apache.commons.math4.analysis.function`，就可以试着使用该包来组合函数定义，然后使用 `org.apache.commons.math4.analysis.solvers` 包来查找刚刚创建的函数的零点。但如果你不知道，就可能需要更多学习向的文档，也许甚至是一个实际例子，来读懂参考文档。

这种文档结构还有助于阐明 <ruby>包<rt>package</rt></ruby>（相关 Java 类和接口定义的集合）的含义，并显示特定库中捆绑了哪些包。

这种库的代码通常是在 [.jar 文件][13] 中，它基本上是由 Java 的 `jar` 命令创建的 .zip 文件，其中还包含一些其他有用的信息。.jar 文件通常被创建为构建过程的端点，该构建过程编译了所定义包中的所有 .java 文件。

要访问外部库提供的功能，有两个主要步骤：

  1. 确保通过类路径（或者命令行中的 `-cp` 参数或者 `CLASSPATH` 环境变量），库可用于 Java 编译步骤（[javac][14]）和执行步骤（`java`）。
  2. 使用恰当的 `import` 语句访问程序源代码中的包和类。

其余的步骤就与使用 `String` 等 Java核心类相同，使用库提供的类和接口定义来编写代码。很简单对吧？不过也没那么简单。首先，你需要了解库组件的预期使用模式，然后才能编写代码。

### 示例：连接 PostgreSQL 数据库

在数据库系统中访问数据的典型使用步骤是：

  1. 访问正在使用的特定数据库软件代码。
  2. 连接到数据库服务器。
  3. 构建查询字符串。
  4. 执行查询字符串。
  5. 针对返回的结果，做需要的处理。
  6. 断开与数据库服务器的连接。

所有这些面向程序员的部分由接口包 [java.sql][15] 提供，它独立于数据库，定义了核心客户端 Java 数据库连接（JDBC）API。`java.sql` 包是 Java 核心库的一部分，因此无需提供 .jar 文件即可编译。但每个数据库提供者都会创建自己的 `java.sql` 接口实现（例如 `Connection` 接口），并且必须在运行步骤中提供这些实现。

接下来我们使用 PostgreSQL，看看这一过程是如何进行的。

#### 访问特定数据库的代码

以下代码使用 [Java 类加载器][16]（`Class.forName()` 调用）将 PostgreSQL 驱动程序代码加载到正在执行的虚拟机中：

```
import java.sql.*;

public class Test1 {

    public static void main(String args[]) {

        // Load the driver (jar file must be on class path) [1]

        try {
            Class.forName("org.postgresql.Driver");
            System.out.println("driver loaded");
        } catch (Exception e1) {
            System.err.println("couldn't find driver");
            System.err.println(e1);
            System.exit(1);
        }

        // If we get here all is OK

        System.out.println("done.");
    }
}
```

因为类加载器可能失败，失败时会抛出异常，所以将对 `Class.forName()` 的调用放在 `try-catch` 代码块中。

如果你使用 `javac` 编译上面的代码，然后用 `java` 运行，会报异常：

```
me@mymachine:~/Test$ javac Test1.java
me@mymachine:~/Test$ java Test1
couldn't find driver
java.lang.ClassNotFoundException: org.postgresql.Driver
me@mymachine:~/Test$
```

类加载器要求类路径中有包含 PostgreSQL JDBC 驱动程序实现的 .jar 文件：

```
me@mymachine:~/Test$ java -cp ~/src/postgresql-42.2.5.jar:. Test1
driver loaded
done.
me@mymachine:~/Test$
```

#### 连接到数据库服务器

以下代码实现了加载 JDBC 驱动程序和创建到 PostgreSQL 数据库的连接：

```
import java.sql.*;

public class Test2 {

        public static void main(String args[]) {

                // Load the driver (jar file must be on class path) [1]

                try {
                        Class.forName("org.postgresql.Driver");
                        System.out.println("driver loaded");
                } catch (Exception e1) {
                        System.err.println("couldn't find driver");
                        System.err.println(e1);
                        System.exit(1);
                }

                // Set up connection properties [2]

                java.util.Properties props = new java.util.Properties();
                props.setProperty("user","me");
                props.setProperty("password","mypassword");
                String database = "jdbc:postgresql://myhost.org:5432/test";

                // Open the connection to the database [3]

                try (Connection conn = DriverManager.getConnection(database, props)) {
                        System.out.println("connection created");
                } catch (Exception e2) {
                        System.err.println("sql operations failed");
                        System.err.println(e2);
                        System.exit(2);
                }
                System.out.println("connection closed");

                // If we get here all is OK

                System.out.println("done.");
        }
}
```

编译并运行上述代码:

```
me@mymachine:~/Test$ javac Test2.java
me@mymachine:~/Test$ java -cp ~/src/postgresql-42.2.5.jar:. Test2
driver loaded
connection created
connection closed
done.
me@mymachine:~/Test$
```

关于上述的一些注意事项：

  * 注释 `[2]` 后面的代码使用系统属性来设置连接参数（在本例中参数为 PostgreSQL 用户名和密码）。代码也可以从 Java 命令行获取这些参数并将所有参数作为参数包传递，同时还有一些其他 `Driver.getConnection()` 选项可用于单独传递参数。
  * JDBC 需要一个用于定义数据库的 URL，它在上述代码中被声明为 `String database` 并与连接参数一起传递给 `Driver.getConnection()` 方法。
  * 代码使用 `try-with-resources` 语句，它会在 `try-catch` 块中的代码完成后自动关闭连接。[Stack Overflow][23] 上对这种方法进行了长期的讨论。
  * `try-with-resources` 语句提供对 `Connection` 实例的访问，并可以在其中执行 SQL 语句；所有错误都会被同一个 `catch` 语句捕获。

#### 用数据库的连接处理一些有趣的事情

日常工作中，我经常需要知道为给定的数据库服务器实例定义了哪些用户，这里我使用这个 [简便的 SQL][24] 来获取所有用户的列表：

```
import java.sql.*;

public class Test3 {

        public static void main(String args[]) {

                // Load the driver (jar file must be on class path) [1]

                try {
                        Class.forName("org.postgresql.Driver");
                        System.out.println("driver loaded");
                } catch (Exception e1) {
                        System.err.println("couldn't find driver");
                        System.err.println(e1);
                        System.exit(1);
                }

                // Set up connection properties [2]

                java.util.Properties props = new java.util.Properties();
                props.setProperty("user","me");
                props.setProperty("password","mypassword");
                String database = "jdbc:postgresql://myhost.org:5432/test";

                // Open the connection to the database [3]

                try (Connection conn = DriverManager.getConnection(database, props)) {
                        System.out.println("connection created");

                        // Create the SQL command string [4]

                        String qs = "SELECT " +
                                "       u.usename AS \"User name\", " +
                                "       u.usesysid AS \"User ID\", " +
                                "       CASE " +
                                "       WHEN u.usesuper AND u.usecreatedb THEN " +
                                "               CAST('superuser, create database' AS pg_catalog.text) " +
                        "       WHEN u.usesuper THEN " +
                                "               CAST('superuser' AS pg_catalog.text) " +
                                "       WHEN u.usecreatedb THEN " +
                                "               CAST('create database' AS pg_catalog.text) " +
                                "       ELSE " +
                                "               CAST('' AS pg_catalog.text) " +
                                "       END AS \"Attributes\" " +
                                "FROM pg_catalog.pg_user u " +
                                "ORDER BY 1";

                        // Use the connection to create a statement, execute it,
                        // analyze the results and close the result set [5]

                        Statement stat = conn.createStatement();
                        ResultSet rs = stat.executeQuery(qs);
                        System.out.println("User name;User ID;Attributes");
                        while (rs.next()) {
                                System.out.println(rs.getString("User name") + ";" +
                                                rs.getLong("User ID") + ";" +
                                                rs.getString("Attributes"));
                        }
                        rs.close();
                        stat.close();
               
                } catch (Exception e2) {
                        System.err.println("connecting failed");
                        System.err.println(e2);
                        System.exit(1);
                }
                System.out.println("connection closed");

                // If we get here all is OK

                System.out.println("done.");
        }
}
```

在上述代码中，一旦有了 `Connection` 实例，它就会定义一个查询字符串（上面的注释 `[4]`），创建一个 `Statement` 实例并用其来执行查询字符串，然后将其结果放入一个 `ResultSet` 实例。程序可以遍历该 `ResultSet` 实例来分析返回的结果，并以关闭 `ResultSet` 和 `Statement` 实例结束（上面的注释 `[5]`）。

编译和执行程序会产生以下输出：

```
me@mymachine:~/Test$ javac Test3.java
me@mymachine:~/Test$ java -cp ~/src/postgresql-42.2.5.jar:. Test3
driver loaded
connection created
User name;User ID;Attributes
fwa;16395;superuser
vax;197772;
mbe;290995;
aca;169248;
connection closed
done.
me@mymachine:~/Test$
```

这是在一个简单的 Java 应用程序中使用 PostgreSQL JDBC 库的（非常简单的）示例。要注意的是，由于 `java.sql` 库的设计方式，它不需要在代码中使用像 `import org.postgresql.jdbc.*;` 这样的 Java 导入语句，而是使用 Java 类加载器在运行时引入 PostgreSQL 代码的方式，也正因此无需在代码编译时指定类路径。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/2/external-libraries-java

作者：[Chris Hermansen][a]
选题：[lujun9972][b]
译者：[unigeorge](https://github.com/unigeorge)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/clhermansen
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/books_library_reading_list.jpg?itok=O3GvU1gH (books in a library, stacks)
[2]: https://commons.apache.org/
[3]: https://commons.apache.org/proper/commons-geometry/
[4]: https://commons.apache.org/proper/commons-statistics/
[5]: https://commons.apache.org/proper/commons-math/
[6]: https://commons.apache.org/proper/commons-numbers/
[7]: https://opensource.com/article/19/11/getting-started-postgresql
[8]: https://en.wikipedia.org/wiki/Javadoc
[9]: https://commons.apache.org/proper/commons-math/apidocs/index.html
[10]: https://opensource.com/sites/default/files/uploads/api-documentation_apachecommonsmath.png (API documentation for Apache Commons Math)
[11]: https://commons.apache.org/proper/commons-math/apidocs/org/apache/commons/math4/analysis/solvers/package-summary.html
[12]: https://commons.apache.org/proper/commons-math/apidocs/org/apache/commons/math4/analysis/solvers/BisectionSolver.html
[13]: https://en.wikipedia.org/wiki/JAR_(file_format)
[14]: https://en.wikipedia.org/wiki/Javac
[15]: https://docs.oracle.com/javase/8/docs/api/java/sql/package-summary.html
[16]: https://en.wikipedia.org/wiki/Java_Classloader
[17]: http://www.google.com/search?hl=en&q=allinurl%3Adocs.oracle.com+javase+docs+api+string
[18]: http://www.google.com/search?hl=en&q=allinurl%3Adocs.oracle.com+javase+docs+api+system
[19]: http://www.google.com/search?hl=en&q=allinurl%3Adocs.oracle.com+javase+docs+api+exception
[20]: http://www.google.com/search?hl=en&q=allinurl%3Adocs.oracle.com+javase+docs+api+properties
[21]: http://www.google.com/search?hl=en&q=allinurl%3Adocs.oracle.com+javase+docs+api+connection
[22]: http://www.google.com/search?hl=en&q=allinurl%3Adocs.oracle.com+javase+docs+api+drivermanager
[23]: https://stackoverflow.com/questions/8066501/how-should-i-use-try-with-resources-with-jdbc
[24]: https://www.postgresql.org/message-id/1121195544.8208.242.camel@state.g2switchworks.com
[25]: http://www.google.com/search?hl=en&q=allinurl%3Adocs.oracle.com+javase+docs+api+statement
[26]: http://www.google.com/search?hl=en&q=allinurl%3Adocs.oracle.com+javase+docs+api+resultset
[27]: http://www.google.com/search?hl=en&q=allinurl%3Adocs.oracle.com+javase+docs+api+attributes

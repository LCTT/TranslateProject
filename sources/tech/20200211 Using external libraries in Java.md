[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Using external libraries in Java)
[#]: via: (https://opensource.com/article/20/2/external-libraries-java)
[#]: author: (Chris Hermansen https://opensource.com/users/clhermansen)

Using external libraries in Java
======
External libraries fill gaps in the Java core libraries.
![books in a library, stacks][1]

Java comes with a core set of libraries, including those that define commonly used data types and related behavior, like **String** or **Date**; utilities to interact with the host operating system, such as **System** or **File**; and useful subsystems to manage security, deal with network communications, and create or parse XML. Given the richness of this core set of libraries, it's often easy to find the necessary bits and pieces to reduce the amount of code a programmer must write to solve a problem.

Even so, there are a lot of interesting Java libraries created by people who find gaps in the core libraries. For example, [Apache Commons][2] "is an Apache project focused on all aspects of reusable Java components" and provides a collection of some 43 open source libraries (as of this writing) covering a range of capabilities either outside the Java core (such as [geometry][3] or [statistics][4]) or that enhance or replace capabilities in the Java core (such as [math][5] or [numbers][6]).

Another common type of Java library is an interface to a system component—for example, to a database system. This article looks at using such an interface to connect to a [PostgreSQL][7] database and get some interesting information. But first, I'll review the important bits and pieces of a library.

### What is a library?

A library, of course, must contain some useful code. But to be useful, that code needs to be organized in such a way that the Java programmer can access the components to solve the problem at hand.

I'll boldly claim that the most important part of a library is its application programming interface (API) documentation. This kind of documentation is familiar to many and is most often produced by [Javadoc][8], which reads structured comments in the code and produces HTML output that displays the API's packages in the panel in the top-left corner of the page; its classes in the bottom-left corner; and the detailed documentation at the library, package, or class level (depending on what is selected in the main panel) on the right. For example, the [top level of API documentation for Apache Commons Math][9] looks like:

![API documentation for Apache Commons Math][10]

Clicking on a package in the main panel shows the Java classes and interfaces defined in that package. For example, **[org.apache.commons.math4.analysis.solvers][11]** shows classes like **BisectionSolver** for finding zeros of univariate real functions using the bisection algorithm. And clicking on the [BisectionSolver][12] link lists all the methods of the class **BisectionSolver**.

This type of documentation is useful as reference information; it's not intended as a tutorial for learning how to use the library. For example, if you know what a univariate real function is and look at the package **org.apache.commons.math4.analysis.function**, you can imagine using that package to compose a function definition and then using the **org.apache.commons.math4.analysis.solvers** package to look for zeros of the just-created function. But really, you probably need more learning-oriented documentation to bridge to the reference documentation. Maybe even an example!

This documentation structure also helps clarify the meaning of _package_—a collection of related Java class and interface definitions—and shows what packages are bundled in a particular library.

The code for such a library is most commonly found in a [**.jar** file][13], which is basically a .zip file created by the Java **jar** command that contains some other useful information. **.jar** files are typically created as the endpoint of a build process that compiles all the **.java** files in the various packages defined.

There are two main steps to accessing the functionality provided by an external library:

  1. Make sure the library is available to the Java compilation step—[**javac**][14]—and the execution step—**java**—via the classpath (either the **-cp** argument on the command line or the **CLASSPATH** environment variable).
  2. Use the appropriate **import** statements to access the package and class in the program source code.



The rest is just like coding with Java core classes, such as **String**—write the code using the class and interface definitions provided by the library. Easy, eh? Well, maybe not quite that easy; first, you need to understand the intended use pattern for the library components, and then you can write code.

### An example: Connect to a PostgreSQL database

The typical use pattern for accessing data in a database system is:

  1. Gain access to the code specific to the database software being used.
  2. Connect to the database server.
  3. Build a query string.
  4. Execute the query string.
  5. Do something with the results returned.
  6. Disconnect from the database server.



The programmer-facing part of all of this is provided by a database-independent interface package, **[java.sql][15]**, which defines the core client-side Java Database Connectivity (JDBC) API. The **java.sql** package is part of the core Java libraries, so there is no need to supply a **.jar** file to the compile step. However, each database provider creates its own implementation of the **java.sql** interfaces—for example, the **Connection** interface—and those implementations must be provided on the run step.

Let's see how this works, using PostgreSQL.

#### Gain access to the database-specific code

The following code uses the [Java class loader][16] (the **Class.forName()** call) to bring the PostgreSQL driver code into the executing virtual machine:


```
import java.sql.*;

public class Test1 {

    public static void main([String][17] args[]) {

        // Load the driver (jar file must be on class path) [1]

        try {
            Class.forName("org.postgresql.Driver");
            [System][18].out.println("driver loaded");
        } catch ([Exception][19] e1) {
            [System][18].err.println("couldn't find driver");
            [System][18].err.println(e1);
            [System][18].exit(1);
        }

        // If we get here all is OK

        [System][18].out.println("done.");
    }
}
```

Because the class loader can fail, and therefore can throw an exception when failing, surround the call to **Class.forName()** in a try-catch block.

If you compile the above code with **javac** and run it with Java:


```
me@mymachine:~/Test$ javac Test1.java
me@mymachine:~/Test$ java Test1
couldn't find driver
java.lang.ClassNotFoundException: org.postgresql.Driver
me@mymachine:~/Test$
```

The class loader needs the **.jar** file containing the PostgreSQL JDBC driver implementation to be on the classpath:


```
me@mymachine:~/Test$ java -cp ~/src/postgresql-42.2.5.jar:. Test1
driver loaded
done.
me@mymachine:~/Test$
```

#### Connect to the database server

The following code loads the JDBC driver and creates a connection to the PostgreSQL database:


```
import java.sql.*;

public class Test2 {

        public static void main([String][17] args[]) {

                // Load the driver (jar file must be on class path) [1]

                try {
                        Class.forName("org.postgresql.Driver");
                        [System][18].out.println("driver loaded");
                } catch ([Exception][19] e1) {
                        [System][18].err.println("couldn't find driver");
                        [System][18].err.println(e1);
                        [System][18].exit(1);
                }

                // Set up connection properties [2]

                java.util.[Properties][20] props = new java.util.[Properties][20]();
                props.setProperty("user","me");
                props.setProperty("password","mypassword");
                [String][17] database = "jdbc:postgresql://myhost.org:5432/test";

                // Open the connection to the database [3]

                try ([Connection][21] conn = [DriverManager][22].getConnection(database, props)) {
                        [System][18].out.println("connection created");
                } catch ([Exception][19] e2) {
                        [System][18].err.println("sql operations failed");
                        [System][18].err.println(e2);
                        [System][18].exit(2);
                }
                [System][18].out.println("connection closed");

                // If we get here all is OK

                [System][18].out.println("done.");
        }
}
```

Compile and run it:


```
me@mymachine:~/Test$ javac Test2.java
me@mymachine:~/Test$ java -cp ~/src/postgresql-42.2.5.jar:. Test2
driver loaded
connection created
connection closed
done.
me@mymachine:~/Test$
```

Some notes on the above:

  * The code following comment [2] uses system properties to set up connection parameters—in this case, the PostgreSQL username and password. This allows for grabbing those parameters from the Java command line and passing all the parameters in as an argument bundle. There are other **Driver.getConnection()** options for passing in the parameters individually.
  * JDBC requires a URL for defining the database, which is declared above as **String database** and passed into the **Driver.getConnection()** method along with the connection parameters.
  * The code uses try-with-resources, which auto-closes the connection upon completion of the code in the try-catch block. There is a lengthy discussion of this approach on [Stack Overflow][23].
  * The try-with-resources provides access to the **Connection** instance and can execute SQL statements there; any errors will be caught by the same **catch** statement.



#### Do something fun with the database connection

In my day job, I often need to know what users have been defined for a given database server instance, and I use this [handy piece of SQL][24] for grabbing a list of all users:


```
import java.sql.*;

public class Test3 {

        public static void main([String][17] args[]) {

                // Load the driver (jar file must be on class path) [1]

                try {
                        Class.forName("org.postgresql.Driver");
                        [System][18].out.println("driver loaded");
                } catch ([Exception][19] e1) {
                        [System][18].err.println("couldn't find driver");
                        [System][18].err.println(e1);
                        [System][18].exit(1);
                }

                // Set up connection properties [2]

                java.util.[Properties][20] props = new java.util.[Properties][20]();
                props.setProperty("user","me");
                props.setProperty("password","mypassword");
                [String][17] database = "jdbc:postgresql://myhost.org:5432/test";

                // Open the connection to the database [3]

                try ([Connection][21] conn = [DriverManager][22].getConnection(database, props)) {
                        [System][18].out.println("connection created");

                        // Create the SQL command string [4]

                        [String][17] qs = "SELECT " +
                                "       u.usename AS \"User name\", " +
                                "       u.usesysid AS \"User ID\", " +
                                "       CASE " +
                                "       WHEN u.usesuper AND u.usecreatedb THEN " +
                                "               CAST('superuser, create database' AS pg_catalog.text) " +
                        "       WHEN u.usesuper THEN " +
                                "               CAST('superuser' AS pg_catalog.text) " +
                                "       WHEN u.usecreatedb THEN " +
                                "               CAST('create database' AS pg_catalog.text) " +
                                "       ELSE " +
                                "               CAST('' AS pg_catalog.text) " +
                                "       END AS \"Attributes\" " +
                                "FROM pg_catalog.pg_user u " +
                                "ORDER BY 1";

                        // Use the connection to create a statement, execute it,
                        // analyze the results and close the result set [5]

                        [Statement][25] stat = conn.createStatement();
                        [ResultSet][26] rs = stat.executeQuery(qs);
                        [System][18].out.println("User name;User ID;Attributes");
                        while (rs.next()) {
                                [System][18].out.println(rs.getString("User name") + ";" +
                                                rs.getLong("User ID") + ";" +
                                                rs.getString("Attributes"));
                        }
                        rs.close();
                        stat.close();
               
                } catch ([Exception][19] e2) {
                        [System][18].err.println("connecting failed");
                        [System][18].err.println(e2);
                        [System][18].exit(1);
                }
                [System][18].out.println("connection closed");

                // If we get here all is OK

                [System][18].out.println("done.");
        }
}
```

In the above, once it has the **Connection** instance, it defines a query string (comment [4] above), creates a **Statement** instance and uses it to execute the query string, then puts its results in a **ResultSet** instance, which it can iterate through to analyze the results returned, and ends by closing both the **ResultSet** and **Statement** instances (comment [5] above).

Compiling and executing the program produces the following output:


```
me@mymachine:~/Test$ javac Test3.java
me@mymachine:~/Test$ java -cp ~/src/postgresql-42.2.5.jar:. Test3
driver loaded
connection created
User name;User ID;[Attributes][27]
fwa;16395;superuser
vax;197772;
mbe;290995;
aca;169248;
connection closed
done.
me@mymachine:~/Test$
```

This is a (very simple) example of using the PostgreSQL JDBC library in a simple Java application. It's worth emphasizing that it didn't need to use a Java import statement like **import org.postgresql.jdbc.*;** in the code because of the way the **java.sql** library is designed. Because of that, there's no need to specify the classpath at compile time. Instead, it uses the Java class loader to bring in the PostgreSQL code at run time.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/2/external-libraries-java

作者：[Chris Hermansen][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

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

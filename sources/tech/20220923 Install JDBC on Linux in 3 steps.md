[#]: subject: "Install JDBC on Linux in 3 steps"
[#]: via: "https://opensource.com/article/22/9/install-jdbc-linux"
[#]: author: "Seth Kenlon https://opensource.com/users/seth"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Install JDBC on Linux in 3 steps
======
Install Java, install JDBC with Maven, and install the database. Then you're ready to interact with databases in your Java code.

![What is your favorite open source Java IDE?][1]

Image by: Pixabay. CC0.

When you write an application, it's common to require data storage. Sometimes you're storing assets your application needs to function, and other times you're storing user data, including preferences and save data. One way to store data is in a database, and in order to communicate between your code and a database, you need a database binding or connector for your language. For Java, a common database connector is JDBC (Java database connectivity.)

### 1. Install Java

Of course, to develop with Java you must also have Java installed. I recommend [SDKman][2] for Linux, macOS, and WSL or Cygwin. For Windows, you can download OpenJDK from [developers.redhat.com][3].

### 2. Install JDBC with Maven

JDBC is an API, imported into your code with the statement `import java.sql.*`, but for it to be useful you must have a database driver and a database installed for it to interact with. The database driver you use and the database you want to communicate with must match: to interact with MySQL, you need a MySQL driver, to interact with SQLite3, you must have the SQLite3 driver, and so on.

For this article, I use [PostgreSQL][4], but all the major databases, including [MariaDB][5] and [SQLite3][6], have JDBC drivers.

You can download JDBC for PostgreSQL from [jdbc.postgresql.org][7]. I use [Maven][8] to manage Java dependencies, so I include it in `pom.xml` (adjusting the version number for what's current on [Maven Central][9]):

```
<dependency>
    <groupId>org.postgresql</groupId>
    <artifactId>postgresql</artifactId>
    <version>42.5.0</version>
</dependency>
```

### 3. Install the database

You have to install the database you want to connect to through JDBC. There are several very good open source databases, but I had to choose one for this article, so I chose PostgreSQL.

To install PostgreSQL on Linux, use your software repository. On Fedora, CentOS, Mageia, and similar:

```
$ sudo dnf install postgresql postgresql-server
```

On Debian, Linux Mint, Elementary, and similar:

```
$ sudo apt install postgresql postgresql-contrib
```

### Database connectivity

If you're not using PostgreSQL, the same general process applies:

1. Install Java.
2. Find the JDBC driver for your database of choice and include it in your `pom.xml` file.
3. Install the database (server and client) on your development OS.

Three steps and you're ready to start writing code.

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/9/install-jdbc-linux

作者：[Seth Kenlon][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lkxed
[1]: https://opensource.com/sites/default/files/lead-images/java-coffee-mug.jpg
[2]: https://opensource.com/article/22/3/manage-java-versions-sdkman
[3]: https://developers.redhat.com/products/openjdk/download?intcmp=7013a000002qLH8AAM
[4]: http://LINK-TO-POSTGRESQL-INTRO-ARTICLE
[5]: https://www.redhat.com/sysadmin/mysql-mariadb-introduction
[6]: https://opensource.com/article/21/2/sqlite3-cheat-sheet
[7]: https://jdbc.postgresql.org/download.html
[8]: https://opensource.com/article/22/3/maven-manage-java-dependencies
[9]: https://mvnrepository.com/artifact/org.postgresql/postgresql

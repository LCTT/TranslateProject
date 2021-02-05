[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (A hands-on tutorial of SQLite3)
[#]: via: (https://opensource.com/article/21/2/sqlite3-cheat-sheet)
[#]: author: (Klaatu https://opensource.com/users/klaatu)

A hands-on tutorial of SQLite3
======
Get started with this incredibly powerful and common database. Download
the SQLite cheat sheet.
![Cheat Sheet cover image][1]

Applications very often save data. Whether your users create simple text documents, complex graphic layouts, game progress, or an intricate list of customers and order numbers, software usually implies that data is being generated. There are many ways to store data for repeated use. You can dump text to configuration formats such as INI, [YAML][2], XML, or JSON, you can write out raw binary data, or you can store data in a structured database. SQLite is a self-contained, lightweight database that makes it easy to create, parse, query, modify, and transport data.

**[Download our [SQLite3 cheat sheet][3]]**

SQLite has been dedicated to the [public domain][4], which [technically means it is not copyrighted and therefore requires no license][5]. Should you require a license, you can [purchase a Warranty of Title][6]. SQLite is immensely common, with an estimated 1 _trillion_ SQLite databases in active use. That's counting multiple databases on every Android and iOS device, every macOS and Windows 10 computer, most Linux systems, within every Webkit-based web browser, modern TV sets, automotive multimedia systems, and countless other software applications.

In summary, it's a reliable and simple system to use for storing and organizing data.

### Installing

You probably already have SQLite libraries on your system, but you need its command-line tools installed to use it directly. On Linux, you probably already have these tools installed. The command provided by the tools is **sqlite3** (not just **sqlite**).

If you don't have SQLite installed on Linux or BSD, you can install it from your software repository or ports tree, or [download and install it][7] from source code or as a compiled binary.

On macOS or Windows, you can download and install SQLite tools from [sqlite.org][7].

### Using SQLite

It's common to interact with a database through a programming language. For this reason, there are SQLite interfaces (or "bindings") for Java, Python, Lua, PHP, Ruby, C++, and many many others. However, before using these libraries, it helps to understand what's actually happening with the database engine and why your choice of a database is significant. This article introduces you to SQLite and the **sqlite3** command so you can get familiar with the basics of how this database handles data.

### Interacting with SQLite

You can interact with SQLite using the **sqlite3** command. This command provides an interactive shell so you can view and update your databases.


```
$ sqlite3
SQLite version 3.34.0 2020-12-01 16:14:00
Enter ".help" for usage hints.
Connected to a transient in-memory database.
Use ".open FILENAME" to reopen on a persistent database.
sqlite&gt;
```

The command places you in an SQLite subshell, and so your prompt is now an SQLite prompt. Your usual Bash commands don't work here. You must use SQLite commands. To see a list of SQLite commands, type **.help**:


```
sqlite&gt; .help
.archive ...             Manage SQL archives
.auth ON|OFF             SHOW authorizer callbacks
.backup ?DB? FILE        Backup DB (DEFAULT "main") TO FILE
.bail ON|off             Stop after hitting an error.  DEFAULT OFF
.binary ON|off           Turn BINARY output ON OR off.  DEFAULT OFF
.cd DIRECTORY            CHANGE the working directory TO DIRECTORY
[...]
```

Some of these commands are binary, while others require unique arguments (like filenames, paths, etc.). These are administrative commands for your SQLite shell and are not database queries. Databases take queries in Structured Query Language (SQL), and many SQLite queries are the same as what you may already know from the [MySQL][8] and [MariaDB][9] databases. However, data types and functions differ, so pay close attention to minor differences if you're familiar with another database.

### Creating a database

When launching SQLite, you can either open a prompt in memory, or you can select a database to open:


```
`$ sqlite3 mydatabase.db`
```

If you have no database yet, you can create one at the SQLite prompt:


```
`sqlite> .open mydatabase.db`
```

You now have an empty file on your hard drive, ready to be used as an SQLite database. The file extension **.db** is arbitrary. You can also use **.sqlite**, or whatever you want.

### Creating a table

Databases contain _tables_, which can be visualized as a spreadsheet. There's a series of rows (called _records_ in a database) and columns. The intersection of a row and a column is called a _field_.

The Structured Query Language (SQL) is named after what it provides: A method to inquire about the contents of a database in a predictable and consistent syntax to receive useful results. SQL reads a lot like an ordinary English sentence, if a little robotic. Currently, your database is empty, devoid of any tables.

You can create a table with the **CREATE** query. It's useful to combine this with the **IF NOT EXISTS** statement, which prevents SQLite from clobbering an existing table.

You can't create an empty table in SQLite, so before trying a **CREATE** statement, you must think about what kind of data you anticipate the table will store. In this example, I'll create a table called _member_ with these columns:

  * A unique identifier
  * A person's name
  * The date and time of data entry



#### Unique ID

It's always good to refer to a record by a unique number, and luckily SQLite recognizes this and does it automatically for you in a column called **rowid**.

No SQL statement is required to create this field.

#### Data types

For my example table, I'm creating a _name_ column to hold **TEXT** data. To prevent a record from being created without data in a specified field, you can add the **NOT NULL** directive.

The SQL to create this field is: **name TEXT NOT NULL**

There are five data types (actually _storage classes_) in SQLite:

  * TEXT: a text string
  * INTEGER: a whole number
  * REAL: a floating point (unlimited decimal places) number
  * BLOB: binary data (for instance, a .jpeg or .webp image)
  * NULL: a null value



#### Date and time stamp

SQLite includes a convenient date and timestamp function. It is not a data type itself but a function in SQLite that generates either a string or integer, depending on your desired format. In this example, I left it as the default.

The SQL to create this field is: **datestamp DATETIME DEFAULT CURRENT_TIMESTAMP**

### Table creation SQL

The full SQL for creating this example table in SQLite:


```
sqlite&gt; CREATE TABLE
...&gt; IF NOT EXISTS
...&gt; member (name TEXT NOT NULL,
...&gt; datestamp DATETIME DEFAULT CURRENT_TIMESTAMP
```

In this code sample, I pressed **Return** after the logical clauses of the statement to make it easier to read. SQLite won't run your command unless it terminates with a semi-colon (**;**).

You can verify that the table has been created with the SQLite command **.tables**:


```
sqlite&gt; .tables
member
```

### View all columns in a table

You can verify what columns and rows a table contains with the **PRAGMA** statement:


```
sqlite&gt; PRAGMA table_info(member);
0|name|TEXT|1||0
1|datestamp|CURRENT_TIMESTAMP|0||0
```

### Data entry

You can populate your new table with some sample data by using the **INSERT** SQL keyword:


```
&gt; INSERT INTO member (name) VALUES ('Alice');
&gt; INSERT INTO member (name) VALUES ('Bob');
&gt; INSERT INTO member (name) VALUES ('Carol');
&gt; INSERT INTO member (name) VALUES ('David');
```

Verify the data in the table:


```
&gt; SELECT * FROM member;
Alice|2020-12-15 22:39:00
Bob|2020-12-15 22:39:02
Carol|2020-12-15 22:39:05
David|2020-12-15 22:39:07
```

#### Adding multiple rows at once

Now create a second table:


```
&gt; CREATE TABLE IF NOT EXISTS linux (
...&gt; distro TEXT NOT NULL)
```

Populate it with some sample data, this time using a little **VALUES** shortcut so you can add multiple rows in just one command. The **VALUES** keyword expects a list in parentheses but can take multiple lists separated by commas:


```
&gt; INSERT INTO linux (distro)
...&gt; VALUES ('Slackware'), ('RHEL'),
...&gt; ('Fedora'),('Debian');
```

### Altering a table

You now have two tables, but as yet, there's no relationship between the two. They each contain independent data, but possibly you might need to associate a member of the first table to a specific item listed in the second.

To do that, you can create a new column for the first table that corresponds to something in the second. Because both tables were designed with unique identifiers (automatically, thanks to SQLite), the easiest way to connect them is to use the **rowid** field of one as a selector for the other.

Create a new column in the first table to represent a value in the second table:


```
`> ALTER TABLE member ADD os INT;`
```

Using the unique IDs of the **linux** table, assign a distribution to each member. Because the records already exist, you use the **UPDATE** SQL keyword rather than **INSERT**. Specifically, you want to select one row and then update the value of one column. Syntactically, this is expressed a little in reverse, with the update happening first and the selection matching last:


```
`> UPDATE member SET os=1 WHERE name='Alice';`
```

Repeat this process for the other names in the **member** table, just to populate it with data. For variety, assign three different distributions across the four rows (doubling up on one).

### Joining tables

Now that these two tables relate to one another, you can use SQL to display the associated data. There are many kinds of _joins_ in databases, but you can try them all once you know the basics. Here's a basic join to correlate the values found in the **os** field of the **member** table to the **id** field of the **linux** table:


```
&gt; SELECT * FROM member INNER JOIN linux ON member.os=linux.rowid;
Alice|2020-12-15 22:39:00|1|Slackware
Bob|2020-12-15 22:39:02|3|Fedora
Carol|2020-12-15 22:39:05|3|Fedora
David|2020-12-15 22:39:07|4|Debian
```

The **os** and **id** fields form the join.

In a graphical application, you can imagine that the **os** field might be set by a drop-down menu, the values for which are drawn from the contents of the **distro** field of the **linux** table. By using separate tables for unique but related sets of data, you ensure the consistency and validity of data, and thanks to SQL, you can associate them dynamically later.

### Learning more

SQLite is an infinitely useful self-contained, portable, open source database. Learning to use it interactively is a great first step toward managing it for web applications or using it through programming language libraries.

If you enjoy SQLite, you might also try [Fossil][10] by the same author, Dr. Richard Hipp.

As you learn and use SQLite, it may help to have a list of common commands nearby, so download our **[SQLite3 cheat sheet][3]** today!

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/2/sqlite3-cheat-sheet

作者：[Klaatu][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/klaatu
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/coverimage_cheat_sheet.png?itok=lYkNKieP (Cheat Sheet cover image)
[2]: https://www.redhat.com/sysadmin/yaml-beginners
[3]: https://opensource.com/downloads/sqlite-cheat-sheet
[4]: https://sqlite.org/copyright.html
[5]: https://directory.fsf.org/wiki/License:PublicDomain
[6]: https://www.sqlite.org/purchase/license?
[7]: https://www.sqlite.org/download.html
[8]: https://www.mysql.com/
[9]: https://mariadb.org/
[10]: https://opensource.com/article/20/11/fossil

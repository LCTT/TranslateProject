[#]: subject: "Drop your database for PostgreSQL"
[#]: via: "https://opensource.com/article/22/9/drop-your-database-for-postgresql"
[#]: author: "Seth Kenlon https://opensource.com/users/seth"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Drop your database for PostgreSQL
======
Postgres is one of the most flexible databases available, and it's open source.

Databases are tools to store information in an organized but flexible way. A spreadsheet is essentially a database, but the constraints of a graphical application render most spreadsheet applications useless to programmers. With [Edge][3] and IoT devices becoming significant target platforms, developers need powerful but lightweight solutions for storing, processing, and querying large amounts of data. One of my favourite combinations is the PostgreSQL database and [Lua bindings][4], but the possibilities are endless. Whatever language you use, Postgres is a great choice for a database, but you need to know some basics before adopting it.

### Install Postgres

To install PostgreSQL on Linux, use your software repository. On Fedora, CentOS, Mageia, and similar:

```
$ sudo dnf install postgresql postgresql-server
```

On Debian, Linux Mint, Elementary, and similar:

```
$ sudo apt install postgresql postgresql-contrib
```

On macOS and Windows, download an installer from [postgresql.org][5].

### Setting up Postgres

Most distributions install the Postgres database without *starting* it, but provide you with a script or [systemd service][6] to help it start reliably. However, before you start PostgreSQL, you must create a database cluster.

#### Fedora

On Fedora, CentOS, or similar, there's a Postgres setup script provided in the Postgres package. Run this script for easy configuration:

```
$ sudo /usr/bin/postgresql-setup --initdb
[sudo] password:
 * Initializing database in '/var/lib/pgsql/data'
 * Initialized, logs are in /var/lib/pgsql/initdb_postgresql.log
```

#### Debian

On Debian-based distributions, setup is performed automatically by `apt` during installation.

#### Everything else

Finally, if you're running something else, then you can just use the toolchain provided by Postgres itself. The `initdb` command creates a database cluster, but you must run it as the `postgres` user, an identity you may temporarily assume using `sudo` :

```
$ sudo -u postgres \
"initdb -D /var/lib/pgsql/data \
--locale en_US.UTF-8 --auth md5 --pwprompt"
```

### Start Postgres

Now that a cluster exists, start the Postgres server using either the command provided to you in the output of `initdb` or with systemd:

```
$ sudo systemctl start postgresql
```

### Creating a database user

To create a Postgres user, use the `createuser` command. The `postgres` user is the superuser of the Postgres install,

```
$ sudo -u postgres createuser --interactive --password bogus
Shall the new role be a superuser? (y/n) n
Shall the new role be allowed to create databases? (y/n) y
Shall the new role be allowed to create more new roles? (y/n) n
Password:
```

### Create a database

To create a new database, use the `createdb` command. In this example, I create the database `exampledb` and assign ownership of it to the user `bogus` :

```
$ createdb exampledb --owner bogus
```

### Interacting with PostgreSQL

You can interact with a PostgreSQL database using the `psql` command. This command provides an interactive shell so you can view and update your databases. To connect to a database, specify the user and database you want to use:

```
$ psql --user bogus exampledb
psql (XX.Y)
Type "help" for help.

exampledb=>
```

### Create a table

Databases contain tables, which can be visualized as a spreadsheet. There's a series of rows (called *records* in a database) and columns. The intersection of a row and a column is called a *field*.

The Structured Query Language (SQL) is named after what it provides: A method to inquire about the contents of a database in a predictable and consistent syntax to receive useful results.

Currently, your database is empty, devoid of any tables. You can create a table with the `CREATE` query. It's useful to combine this with the `IF NOT EXISTS` statement, which prevents PostgreSQL from clobbering an existing table.

Before you createa table, think about what kind of data (the "data type" in SQL terminology) you anticipate the table to contain. In this example, I create a table with one column for a unique identifier and one column for some arbitrary text up to nine characters.

```
exampledb=> CREATE TABLE IF NOT EXISTS my_sample_table(
exampledb(> id SERIAL,
exampledb(> wordlist VARCHAR(9) NOT NULL
);
```

The `SERIAL` keyword isn't actually a data type. It's [special notation in PostgreSQL][7] that creates an auto-incrementing integer field. The `VARCHAR` keyword is a data type indicating a variable number of characters within a limit. In this code, I've specified a maximum of 9 characters. There are lots of data types in PostgreSQL, so refer to the project documentation for a list of options.

### Insert data

You can populate your new table with some sample data by using the `INSERT` SQL keyword:

```
exampledb=> INSERT INTO my_sample_table (wordlist) VALUES ('Alice');
INSERT 0 1
```

Your data entry fails, should you attempt to put more than 9 characters into the `wordlist` field:

```
exampledb=> INSERT INTO my_sample_table (WORDLIST) VALUES ('Alexandria');
ERROR:  VALUE too long FOR TYPE CHARACTER VARYING(9)
```

### Alter a table or column

When you need to change a field definition, you use the `ALTER` SQL keyword. For instance, should you decide that a nine character limit for `wordlist`, you can increase its allowance by setting its data type:

```
exampledb=> ALTER TABLE my_sample_table
ALTER COLUMN wordlist SET DATA TYPE VARCHAR(10);
ALTER TABLE
exampledb=> INSERT INTO my_sample_table (WORDLIST) VALUES ('Alexandria');
INSERT 0 1
```

### View data in a table

SQL is a query language, so you view the contents of a database through queries. Queries can be simple, or it can involve joining complex relationships between several different tables. To see everything in a table, use the `SELECT` keyword on `*` (an asterisk is a wildcard):

```
exampledb=> SELECT * FROM my_sample_table;
 id |  wordlist
\----+------------
  1 | Alice
  2 | Bob
  3 | Alexandria
(3 ROWS)
```

### More data

PostgreSQL can handle a lot of data, but as with any database the key to success is how you design your database for storage and what you do with the data once you've got it stored. A relatively large public data set can be found on [OECD.org][8], and using this you can try some advanced database techniques.

First, download the data as comma-separated values (CSV) and save the file as `land-cover.csv` in your `Downloads` folder.

Browse the data in a text editor or spreadsheet application to get an idea of what columns there are, and what kind of data each column contains. Look at the data carefully and keep an eye out for exceptions to an apparent rule. For instance, the `COU` column, containing a country code such as `AUS` for Australia and `GRC` for Greece, tends to be 3 characters until the oddity `BRIICS`.

Once you understand the data you're working with, you can prepare a Postgres database:

```
$ createdb landcoverdb --owner bogus
$ psql --user bogus landcoverdb
landcoverdb=> create table land_cover(
country_code varchar(6),
country_name varchar(76),
small_subnational_region_code varchar(5),
small_subnational_region_name varchar(14),
large_subnational_region_code varchar(17),
large_subnational_region_name varchar(44),
measure_code varchar(13),
measure_name varchar(29),
land_cover_class_code varchar(17),
land_cover_class_name varchar(19),
year_code integer,
year_value integer,
unit_code varchar(3),
unit_name varchar(17),
power_code integer,
power_name varchar(9),
reference_period_code varchar(1),
reference_period_name varchar(1),
value float(8),
flag_codes varchar(1),
flag_names varchar(1));
```

### Importing data

Postgres can import CSV data directly using the special metacommand `\copy` :

```
landcoverdb=> \copy land_cover from '~/land-cover.csv' with csv header delimiter ','
COPY 22113
```

That's 22,113 records imported. Seems like a good start!

### Querying data

A broad `SELECT` statement to see all columns of all 22,113 records is possible, and Postgres very nicely pipes the output to a screen pager so you can scroll through the output at a leisurely pace. However, using advanced SQL you can get some useful views of what's otherwise some pretty raw data.

```
landcoverdb=> SELECT
    lcm.country_name,
    lcm.year_value,
    SUM(lcm.value) sum_value
FROM land_cover lcm
JOIN (
    SELECT
        country_name,
        large_subnational_region_name,
        small_subnational_region_name,
        MAX(year_value) max_year_value
    FROM land_cover
    GROUP BY country_name,
        large_subnational_region_name,
        small_subnational_region_name
) AS lcmyv
ON
    lcm.country_name = lcmyv.country_name AND
    lcm.large_subnational_region_name = lcmyv.large_subnational_region_name AND
    lcm.small_subnational_region_name = lcmyv.small_subnational_region_name AND
    lcm.year_value = lcmyv.max_year_value
GROUP BY lcm.country_name,
    lcm.large_subnational_region_name,
    lcm.small_subnational_region_name,
    lcm.year_value
ORDER BY country_name,
    year_value;
```

Here's some sample output:

```
\---------------+------------+------------
 Afghanistan    |       2019 |  743.48425
 Albania        |       2019 |  128.82532
 Algeria        |       2019 |  2417.3281
 American Samoa |       2019 |   100.2007
 Andorra        |       2019 |  100.45613
 Angola         |       2019 |  1354.2192
 Anguilla       |       2019 | 100.078514
 Antarctica     |       2019 |  12561.907
[...]
```

SQL is a rich langauge, and so it's beyond the scope of this article. Read through the SQL code and see if you can modify it to provide a different set of data.

### Open database

PostgreSQL is one of the great open source databases. With it, you can design repositories for structured data, and then use SQL to view it in different ways so you can gain fresh perspectives on that data. Postgres integrates with many languages, including Python, Lua, Groovy, Java, and more, so regardless of your toolset, you can probably make use of this excellent database.

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/9/drop-your-database-for-postgresql

作者：[Seth Kenlon][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lkxed
[1]: https://opensource.com/sites/default/files/lead-images/lenovo-thinkpad-laptop-concentration-focus-windows-office.png
[2]: https://creativecommons.org/licenses/by/3.0/us/
[3]: https://www.redhat.com/en/topics/edge-computing/what-is-edge-computing?intcmp=7013a000002qLH8AAM
[4]: https://github.com/arcapos/luapgsql
[5]: https://www.postgresql.org/download/
[6]: https://opensource.com/article/21/4/sysadmins-love-systemd
[7]: https://www.postgresql.org/docs/current/datatype-numeric.html#DATATYPE-SERIAL
[8]: https://stats.oecd.org/Index.aspx?DataSetCode=LAND_COVER

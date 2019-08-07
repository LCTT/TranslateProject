[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to Install and Configure PostgreSQL on Ubuntu)
[#]: via: (https://itsfoss.com/install-postgresql-ubuntu/)
[#]: author: (Sergiu https://itsfoss.com/author/sergiu/)

How to Install and Configure PostgreSQL on Ubuntu
======

_**In this tutorial, you’ll learn how to install and use the open source database PostgreSQL on Ubuntu Linux.**_

[PostgreSQL][1] (or Postgres) is a powerful, free and open-source relational database management system ([RDBMS][2]) that has a strong reputation for reliability, feature robustness, and performance. It is designed to handle various tasks, of any size. It is cross-platform, and the default database for [macOS Server][3].

PostgreSQL might just be the right tool for you if you’re a fan of a simple to use SQL database manager. It supports SQL standards and offers additional features, while also being heavily extendable by the user as the user can add data types, functions, and do many more things.

Earlier I discussed [installing MySQL on Ubuntu][4]. In this article, I’ll show you how to install and configure PostgreSQL, so that you are ready to use it to suit whatever your needs may be.

![][5]

### Installing PostgreSQL on Ubuntu

PostgreSQL is available in Ubuntu main repository. However, like many other development tools, it may not be the latest version.

First check the PostgreSQL version available in [Ubuntu repositories][6] using this [apt command][7] in the terminal:

```
apt show postgresql
```

In my Ubuntu 18.04, it showed that the available version of PostgreSQL is version 10 (10+190 means version 10) whereas PostgreSQL version 11 is already released.

```
Package: postgresql
Version: 10+190
Priority: optional
Section: database
Source: postgresql-common (190)
Origin: Ubuntu
```

Based on this information, you can make your mind whether you want to install the version available from Ubuntu or you want to get the latest released version of PostgreSQL.

I’ll show both methods to you.

#### Method 1: Install PostgreSQL from Ubuntu repositories

In the terminal, use the following command to install PostgreSQL

```
sudo apt update
sudo apt install postgresql postgresql-contrib
```

Enter your password when asked and you should have it installed in a few seconds/minutes depending on your internet speed. Speaking of that, feel free to check various [network bandwidth in Ubuntu][8].

What is postgresql-contrib?

The postgresql-contrib or the contrib package consists some additional utilities and functionalities that are not part of the core PostgreSQL package. In most cases, it’s good to have the contrib package installed along with the PostgreSQL core.

[][9]

Suggested read  Fix gvfsd-smb-browse Taking 100% CPU In Ubuntu 16.04

#### Method 2: Installing the latest version 11 of PostgreSQL in Ubuntu

To install PostgreSQL 11, you need to add the official PostgreSQL repository in your sources.list, add its certificate and then install it from there.

Don’t worry, it’s not complicated. Just follow these steps.

Add the GPG key first:

```
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
```

Now add the repository with the below command. If you are using Linux Mint, you’ll have to manually replace the `lsb_release -cs` the Ubuntu version your Mint release is based on.

```
sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt/ `lsb_release -cs`-pgdg main" >> /etc/apt/sources.list.d/pgdg.list'
```

Everything is ready now. Install PostgreSQL with the following commands:

```
sudo apt update
sudo apt install postgresql postgresql-contrib
```

PostgreSQL GUI application

You may also install a GUI application (pgAdmin) for managing PostgreSQL databases:

_sudo apt install pgadmin4_

### Configuring PostgreSQL

You can check if **PostgreSQL** is running by executing:

```
service postgresql status
```

Via the **service** command you can also **start**, **stop** or **restart** **postgresql**. Typing in **service postgresql** and pressing **Enter** should output all options. Now, onto the users.

By default, PostgreSQL creates a special user postgres that has all rights. To actually use PostgreSQL, you must first log in to that account:

```
sudo su postgres
```

Your prompt should change to something similar to:

```
[email protected]:/home/ubuntu$
```

Now, run the **PostgreSQL Shell** with the utility **psql**:

```
psql
```

You should be prompted with:

```
postgress=#
```

You can type in **\q** to **quit** and **\?** for **help**.

To see all existing tables, enter:

```
\l
```

The output will look similar to this (Hit the key **q** to exit this view):

![PostgreSQL Tables][10]

With **\du** you can display the **PostgreSQL users**:

![PostgreSQLUsers][11]

You can change the password of any user (including **postgres**) with:

```
ALTER USER postgres WITH PASSWORD 'my_password';
```

**Note:** _Replace **postgres** with the name of the user and **my_password** with the wanted password._ Also, don’t forget the **;** (**semicolumn**) after every statement.

It is recommended that you create another user (it is bad practice to use the default **postgres** user). To do so, use the command:

```
CREATE USER my_user WITH PASSWORD 'my_password';
```

If you run **\du**, you will see, however, that **my_user** has no attributes yet. Let’s add **Superuser** to it:

```
ALTER USER my_user WITH SUPERUSER;
```

You can **remove users** with:

```
DROP USER my_user;
```

To **log in** as another user, quit the prompt (**\q**) and then use the command:

```
psql -U my_user
```

You can connect directly to a database with the **-d** flag:

```
psql -U my_user -d my_db
```

You should call the PostgreSQL user the same as another existing user. For example, my use is **ubuntu**. To log in, from the terminal I use:

```
psql -U ubuntu -d postgres
```

**Note:** _You must specify a database (by default it will try connecting you to the database named the same as the user you are logged in as)._

If you have a the error:

```
psql: FATAL:  Peer authentication failed for user "my_user"
```

Make sure you are logging as the correct user and edit **/etc/postgresql/11/main/pg_hba.conf** with administrator rights:

```
sudo vim /etc/postgresql/11/main/pg_hba.conf
```

**Note:** _Replace **11** with your version (e.g. **10**)._

Here, replace the line:

```
local   all             postgres                                peer
```

With:

```
local   all             postgres                                md5
```

Then restart **PostgreSQL**:

```
sudo service postgresql restart
```

Using **PostgreSQL** is the same as using any other **SQL** type database. I won’t go into the specific commands, since this article is about getting you started with a working setup. However, here is a [very useful gist][12] to reference! Also, the man page (**man psql**) and the [documentation][13] are very helpful.

[][14]

Suggested read  [How To] Share And Sync Any Folder With Dropbox in Ubuntu

**Wrapping Up**

Reading this article has hopefully guided you through the process of installing and preparing PostgreSQL on an Ubuntu system. If you are new to SQL, you should read this article to know the [basic SQL commands][15]:

[Basic SQL Commands][15]

If you have any issues or questions, please feel free to ask in the comment section.

--------------------------------------------------------------------------------

via: https://itsfoss.com/install-postgresql-ubuntu/

作者：[Sergiu][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/sergiu/
[b]: https://github.com/lujun9972
[1]: https://www.postgresql.org/
[2]: https://www.codecademy.com/articles/what-is-rdbms-sql
[3]: https://www.apple.com/in/macos/server/
[4]: https://itsfoss.com/install-mysql-ubuntu/
[5]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/08/install-postgresql-ubuntu.png?resize=800%2C450&ssl=1
[6]: https://itsfoss.com/ubuntu-repositories/
[7]: https://itsfoss.com/apt-command-guide/
[8]: https://itsfoss.com/network-speed-monitor-linux/
[9]: https://itsfoss.com/fix-gvfsd-smb-high-cpu-ubuntu/
[10]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/07/postgresql_tables.png?fit=800%2C303&ssl=1
[11]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/07/postgresql_users.png?fit=800%2C244&ssl=1
[12]: https://gist.github.com/Kartones/dd3ff5ec5ea238d4c546
[13]: https://www.postgresql.org/docs/manuals/
[14]: https://itsfoss.com/sync-any-folder-with-dropbox/
[15]: https://itsfoss.com/basic-sql-commands/

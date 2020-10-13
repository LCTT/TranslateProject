[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Install MariaDB or MySQL on Linux)
[#]: via: (https://opensource.com/article/20/10/mariadb-mysql-linux)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

Install MariaDB or MySQL on Linux
======
Get started using an open source SQL database on your Linux system.
![Person standing in front of a giant computer screen with numbers, data][1]

Both [MariaDB][2] and [MySQL][3] are open source databases that use SQL and share the same original codebase. MariaDB is a drop-in replacement for MySQL, so much so that you use the same command (`mysql`) to interact with MySQL and MariaDB databases. This article, therefore, applies equally to MariaDB and MySQL.

### Install MariaDB

You can install MariaDB using your Linux distribution's package manager. On most distributions, MariaDB is split into a server package and a client package. The server package provides the database "engine," the part of MariaDB that runs (usually on a physical server) in the background, listening for data input or requests for data output. The client package provides the command `mysql`, which you can use to communicate with the server.

On RHEL, Fedora, CentOS, or similar:


```
`$ sudo dnf install mariadb mariadb-server`
```

On Debian, Ubuntu, Elementary, or similar:


```
`$ sudo apt install mariadb-client mariadb-server`
```

Other systems may package MariaDB differently systems, so you may need to search your software repository to learn how your distribution's maintainers provide it.

### Start MariaDB

Because MariaDB is designed to function, in part, as a database server, it can run on one computer and be administered from another. As long as you have access to the computer running it, you can use the `mysql` command to administer the database. I ran MariaDB on my local computer when writing this article, but it's just as likely that you'll interact with a MariaDB database hosted on a remote system.

Before starting MariaDB, you must create an initial database. You should define the user you want MariaDB to use when initializing its file structure. By default, MariaDB uses the current user, but you probably want it to use a dedicated user account. Your package manager probably configured a system user and group for you. Use `grep` to find out whether there's a `mysql` group:


```
$ grep mysql /etc/group
mysql❌27:
```

You can also look in `/etc/passwd` for a dedicated user, but usually, where there's a group, there's also a user. If there isn't a dedicated `mysql` user and group, look through `/etc/group` for an obvious alternative (such as `mariadb`). Failing that, read your distribution's documentation to learn how MariaDB runs.

Assuming your install uses `mysql`, initialize the database environment:


```
$ sudo mysql_install_db --user=mysql
Installing MariaDB/MySQL system tables in '/var/lib/mysql'...
OK
[...]
```

The result of this step reveals the next tasks you must perform to configure MariaDB:


```
PLEASE REMEMBER TO SET A PASSWORD FOR THE MariaDB root USER !
To do so, start the server, then issue the following commands:

'/usr/bin/mysqladmin' -u root password 'new-password'
'/usr/bin/mysqladmin' -u root -h $(hostname) password 'new-password'

Alternatively you can run:
'/usr/bin/mysql_secure_installation'

which will also give you the option of removing the test
databases and anonymous user created by default.  This is
strongly recommended for production servers.
```

Start MariaDB using your distribution's init system:


```
`$ sudo systemctl start mariadb`
```

To enable the MariaDB server to start upon boot:


```
`$ sudo systemctl enable --now mariadb`
```

Now that you have a MariaDB server to communicate with, set a password for it:


```
mysqladmin -u root password 'myreallysecurepassphrase'
mysqladmin -u root -h $(hostname) password 'myreallysecurepassphrase'
```

Finally, if you intend to use this installation on a production server, run the `mysql_secure_installation` command before going live.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/10/mariadb-mysql-linux

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/data_metrics_analytics_desktop_laptop.png?itok=9QXd7AUr (Person standing in front of a giant computer screen with numbers, data)
[2]: https://mariadb.org/
[3]: https://www.mysql.com/

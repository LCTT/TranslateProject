translating---geekpi

How To Reset MySQL Or MariaDB Root Password
======

![](https://www.ostechnix.com/wp-content/uploads/2018/08/Reset-MySQL-Or-MariaDB-Root-Password-720x340.png)

Few months ago, I had [**setup LAMP stack in Ubuntu 18.04**][1] server. Today, I tried to login as root user in my database server, but I completely forgot the password. After couple Google searches and going through some blog posts, I successfully reset the password. For those wondering how to do this, this brief tutorial explains how can we reset MySQL or MariaDB Root password in Unix-like operating systems.

### Reset MySQL or MariaDB Root password

First, stop the database server.

If you use MySQL, type the following command and hit ENTER key.
```
$ sudo systemctl stop mysql

```

For MariaDB:
```
$ sudo systemctl stop mariadb

```

Next, restart the database server without permission checking using the following command:
```
$ sudo mysqld_safe --skip-grant-tables &

```

Here, the **`--skip-grant-tables`**option allows you to connect without a password and with all privileges. If you start your server with this option, it also enables `--skip-networking`option which is used to prevent the other clients from connecting to the database server. And, the ampersand **( &)** symbol is used to run the command in background, so you could type the other commands in the following steps. Please be mindful that the above command is dangerous and your database server becomes insecure. You should run this command only for a brief period to reset the password.

Next, login to your MySQL/MariaDB server as root user:
```
$ mysql

```

At the **mysql >** or **MariaDB [(none)] >** prompt, run the following command to reset the root user password:
```
UPDATE mysql.user SET Password=PASSWORD('NEW-PASSWORD') WHERE User='root';

```

Replace **NEW-PASSWORD** in the above command with your own password.

Then, type following commands to exit from the mysql console.
```
FLUSH PRIVILEGES;

exit

```

Finally, shutdown the running database server that you started earlier with `--skip-grant-tables`option. To do so, run:
```
$ sudo mysqladmin -u root -p shutdown

```

You will be asked to enter your mysql/mariadb root user password that you set in the previous step.

Now, start mysql/mariadb service normally using command:
```
$ sudo systemctl start mysql

```

For MariaDB:
```
$ sudo systemctl start mariadb

```

Verify if the password has really been changed using the following command:
```
$ mysql -u root -p

```

And, that’s all for today. More good stuffs to come. Stay tuned!

Cheers!



--------------------------------------------------------------------------------

via: https://www.ostechnix.com/how-to-reset-mysql-or-mariadb-root-password/

作者：[SK][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.ostechnix.com/author/sk/
[1]: https://www.ostechnix.com/install-apache-mariadb-php-lamp-stack-ubuntu-16-04/

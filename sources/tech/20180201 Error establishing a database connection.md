Error establishing a database connection
======
![Error establishing a database connection][1]

Error establishing a database connection, is a very common error when you try to access your WordPress site. The database stores all the important information for your website, including your posts, comments, site configuration, user accounts, theme and plugin settings and so on. If the connection to your database cannot be established, your WordPress website will not load, and more then likely will give you the error: “Error establishing a database connection” In this tutorial we will show you, how to fix Error establishing a database connection in WordPress.

The most common cause for “Error establishing a database connection” issue, is one of the following:

Your database has been corrupted
Incorrect login credentials in your WordPress configuration file (wp-config.php)
Your MySQL service stopped working due to insufficient memory on the server (due to heavy traffic), or server problems

![Error establishing a database connection][2]

### 1. Requirements

In order to troubleshoot “Error establishing a database connection” issue, a few requirements must be met:

  * SSH access to your server
  * The database is located on the same server
  * You need to know your database username, user password, and name of the database



Also before you try to fix “Error establishing a database connection” error, it is highly recommended that you make a backup of both your website and database.

### 1. Corrupted database

The first step to do when trying to troubleshoot “Error establishing a database connection” problem is to check whether this error is present for both the front-end and the back-end of the your site. You can access your back-end via <http://www.yourdomain.com/wp-admin> (replace “yourdomain” with your actual domain name)

If the error remains the same for both your front-end and back-end then you should move to the next step.

If you are able to access the back-end via <https://www.yourdomain.com/wp-admin, > and you see the following message:
```
“One or more database tables are unavailable. The database may need to be repaired”

```

it means that your database has been corrupted and you need to try to repair it.

To do this, you must first enable the repair option in your wp-config.php file, located inside the WordPress site root directory, by adding the following line:
```
define('WP_ALLOW_REPAIR', true);

```

Now you can navigate to this this page: <https://www.yourdomain.com/wp-admin/maint/repair.php> and click the “Repair and Optimize Database button.”

For security reasons, remember to turn off the repair option be deleting the line we added before in the wp-config.php file.

If this does not fix the problem or the database cannot be repaired you will probably need to restore it from a backup if you have one available.

### 2. Check your wp-config.php file

Another, probably most common reason, for failed database connection is because of incorrect database information set in your WordPress configuration file.

The configuration file resides in your WordPress site root directory and it is called wp-config.php .

Open the file and locate the following lines:
```
define('DB_NAME', 'database_name');
define('DB_USER', 'database_username');
define('DB_PASSWORD', 'database_password');
define('DB_HOST', 'localhost');

```

Make sure the correct database name, username, and password are set. Database host should be set to “localhost”.

If you ever change your database username and password you should always update this file as well.

If everything is set up properly and you are still getting the “Error establishing a database connection” error then the problem is probably on the server side and you should move on to the next step of this tutorial.

### 3. Check your server

Depending on the resources available, during high traffic hours, your server might not be able to handle all the load and it may stop your MySQL server.

You can either contact your hosting provider about this or you can check it yourself if the MySQL server is properly running.

To check the status of MySQL, log in to your server via [SSH][3] and use the following command:
```
systemctl status mysql

```

Or you can check if it is up in your active processes with:
```
ps aux | grep mysql

```

If your MySQL is not running you can start it with the following commands:
```
systemctl start mysql

```

You may also need to check the memory usage on your server.

To check how much RAM you have available you can use the following command:
```
free -m

```

If your server is running low on memory you may want to consider upgrading your server.

### 4. Conclusion

Most of the time. the “Error establishing a database connection” error can be fixed by following one of the steps above.

![How to Fix the Error Establishing a Database Connection in WordPress][4]Of course, you don’t have to fix, Error establishing a database connection, if you use one of our [WordPress VPS Hosting Services][5], in which case you can simply ask our expert Linux admins to help you fix the Error establishing a database connection in WordPress, for you. They are available 24×7 and will take care of your request immediately.

**PS**. If you liked this post, on how to fix the Error establishing a database connection in WordPress, please share it with your friends on the social networks using the buttons on the left or simply leave a reply below. Thanks.

--------------------------------------------------------------------------------

via: https://www.rosehosting.com/blog/error-establishing-a-database-connection/

作者：[RoseHosting][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.rosehosting.com
[1]:https://www.rosehosting.com/blog/wp-content/uploads/2018/02/error-establishing-a-database-connection.jpg
[2]:https://www.rosehosting.com/blog/wp-content/uploads/2018/02/Error-establishing-a-database-connection-e1517474875180.png
[3]:https://www.rosehosting.com/blog/connect-to-your-linux-vps-via-ssh/
[4]:https://www.rosehosting.com/blog/wp-content/uploads/2018/02/How-to-Fix-the-Error-Establishing-a-Database-Connection-in-WordPress.jpg
[5]:https://www.rosehosting.com/wordpress-hosting.html

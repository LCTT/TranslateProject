[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to Install MySQL in Ubuntu Linux)
[#]: via: (https://itsfoss.com/install-mysql-ubuntu/)
[#]: author: (Sergiu https://itsfoss.com/author/sergiu/)

How to Install MySQL in Ubuntu Linux
======

_**Brief: This tutorial teaches you to install MySQL in Ubuntu based Linux distributions. You’ll also learn how to verify your install and how to connect to MySQL for the first time.**_

**[MySQL][1]** is the quintessential database management system. It is used in many tech stacks, including the popular **[LAMP][2]** (Linux, Apache, MySQL, PHP) stack. It has proven its stability. Another thing that makes **MySQL** so great is that it is **open-source**.

**MySQL** uses **relational databases** (basically **tabular data** ). It is really easy to store, organize and access data this way. For managing data, **SQL** ( **Structured Query Language** ) is used.

In this article I’ll show you how to **install** and **use** MySQL 8.0 in Ubuntu 18.04. Let’s get to it!

### Installing MySQL in Ubuntu

![][3]

I’ll be covering two ways you can install **MySQL** in Ubuntu 18.04:

  1. Install MySQL from the Ubuntu repositories. Very basic, not the latest version (5.7)
  2. Install MySQL using the official repository. There is a bigger step that you’ll have to add to the process, but nothing to worry about. Also, you’ll have the latest version (8.0)



When needed, I’ll provide screenshots to guide you. For most of this guide, I’ll be entering commands in the **terminal** ( **default hotkey** : CTRL+ALT+T). Don’t be scared of it!

#### Method 1. Installing MySQL from the Ubuntu repositories

First of all, make sure your repositories are updated by entering:

```
sudo apt update
```

Now, to install **MySQL 5.7** , simply type:

```
sudo apt install mysql-server -y
```

That’s it! Simple and efficient.

#### Method 2. Installing MySQL using the official repository

Although this method has a few more steps, I’ll go through them one by one and I’ll try writing down clear notes.

The first step is browsing to the [download page][4] of the official MySQL website.

![][5]

Here, go down to the **download link** for the **DEB Package**.

![][6]

Scroll down past the info about Oracle Web and right-click on **No thanks, just start my download.** Select **Copy link location**.

Now go back to the terminal. We’ll [use][7] **[Curl][7]** [command][7] to the download the package:

```
curl -OL https://dev.mysql.com/get/mysql-apt-config_0.8.12-1_all.deb
```

**<https://dev.mysql.com/get/mysql-apt-config\_0.8.12-1\_all.deb>** is the link I copied from the website. It might be different based on the current version of MySQL. Let’s use **dpkg** to start installing MySQL:

```
sudo dpkg -i mysql-apt-config*
```

Update your repositories:

```
sudo apt update
```

To actually install MySQL, we’ll use the same command as in the first method:

```
sudo apt install mysql-server -y
```

Doing so will open a prompt in your terminal for **package configuration**. Use the **down arrow** to select the **Ok** option.

![][8]

Press **Enter**. This should prompt you to enter a **password** :. Your are basically setting the root password for MySQL. Don’t confuse it with [root password of Ubuntu][9] system.

![][10]

Type in a password and press **Tab** to select **< Ok>**. Press **Enter.** You’ll now have to **re-enter** the **password**. After doing so, press **Tab** again to select **< Ok>**. Press **Enter**.

![][11]

Some **information** on configuring MySQL Server will be presented. Press **Tab** to select **< Ok>** and **Enter** again:

![][12]

Here you need to choose a **default authentication plugin**. Make sure **Use Strong Password Encryption** is selected. Press **Tab** and then **Enter**.

That’s it! You have successfully installed MySQL.

#### Verify your MySQL installation

To **verify** that MySQL installed correctly, use:

```
sudo systemctl status mysql.service
```

This will show some information about the service:

![][13]

You should see **Active: active (running)** in there somewhere. If you don’t, use the following command to start the **service** :

```
sudo systemctl start mysql.service
```

#### Configuring/Securing MySQL

For a new install, you should run the provided command for security-related updates. That’s:

```
sudo mysql_secure_installation
```

Doing so will first of all ask you if you want to use the **VALIDATE PASSWORD COMPONENT**. If you want to use it, you’ll have to select a minimum password strength ( **0 – Low, 1 – Medium, 2 – High** ). You won’t be able to input any password doesn’t respect the selected rules. If you don’t have the habit of using strong passwords (you should!), this could come in handy. If you think it might help, type in **y** or **Y** and press **Enter** , then choose a **strength level** for your password and input the one you want to use. If successful, you’ll continue the **securing** process; otherwise you’ll have to re-enter a password.

If, however, you do not want this feature (I won’t), just press **Enter** or **any other key** to skip using it.

For the other options, I suggest **enabling** them (typing in **y** or **Y** and pressing **Enter** for each of them). They are (in this order): **remove anonymous user, disallow root login remotely, remove test database and access to it, reload privilege tables now**.

#### Connecting to & Disconnecting from the MySQL Server

To be able to run SQL queries, you’ll first have to connect to the server using MySQL and use the MySQL prompt. The command for doing this is:

```
mysql -h host_name -u user -p
```

  * **-h** is used to specify a **host name** (if the server is located on another machine; if it isn’t, just omit it)
  * **-u** mentions the **user**
  * **-p** specifies that you want to input a **password**.



Although not recommended (for safety reasons), you can enter the password directly in the command by typing it in right after **-p**. For example, if the password for **test_user** is **1234** and you are trying to connect on the machine you are using, you could use:

```
mysql -u test_user -p1234
```

If you successfully inputted the required parameters, you’ll be greeted by the **MySQL shell prompt** ( **mysql >**):

![][14]

To **disconnect** from the server and **leave** the mysql prompt, type:

```
QUIT
```

Typing **quit** (MySQL is case insensitive) or **\q** will also work. Press **Enter** to exit.

You can also output info about the **version** with a simple command:

```
sudo mysqladmin -u root version -p
```

If you want to see a **list of options** , use:

```
mysql --help
```

#### Uninstalling MySQL

If you decide that you want to use a newer release or just want to stop using MySQL.

First, disable the service:

```
sudo systemctl stop mysql.service && sudo systemctl disable mysql.service
```

Make sure you backed up your databases, in case you want to use them later on. You can uninstall MySQL by running:

```
sudo apt purge mysql*
```

To clean up dependecies:

```
sudo apt autoremove
```

**Wrapping Up**

In this article, I’ve covered **installing MySQL** in Ubuntu Linux. I’d be glad if this guide helps struggling users and beginners.

Tell us in the comments if you found this post to be a useful resource. What do you use MySQL for? We’re eager to receive any feedback, impressions or suggestions. Thanks for reading and have don’t hesitate to experiment with this incredible tool!

--------------------------------------------------------------------------------

via: https://itsfoss.com/install-mysql-ubuntu/

作者：[Sergiu][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/sergiu/
[b]: https://github.com/lujun9972
[1]: https://www.mysql.com/
[2]: https://en.wikipedia.org/wiki/LAMP_(software_bundle)
[3]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/04/install-mysql-ubuntu.png?resize=800%2C450&ssl=1
[4]: https://dev.mysql.com/downloads/repo/apt/
[5]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/04/mysql_apt_download_page.jpg?fit=800%2C280&ssl=1
[6]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/04/mysql_deb_download_link.jpg?fit=800%2C507&ssl=1
[7]: https://linuxhandbook.com/curl-command-examples/
[8]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/04/mysql_package_configuration_ok.jpg?fit=800%2C587&ssl=1
[9]: https://itsfoss.com/change-password-ubuntu/
[10]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/04/mysql_enter_password.jpg?fit=800%2C583&ssl=1
[11]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/04/mysql_information_on_configuring.jpg?fit=800%2C581&ssl=1
[12]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/04/mysql_default_authentication_plugin.jpg?fit=800%2C586&ssl=1
[13]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/04/mysql_service_information.jpg?fit=800%2C402&ssl=1
[14]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/04/mysql_shell_prompt-2.jpg?fit=800%2C423&ssl=1

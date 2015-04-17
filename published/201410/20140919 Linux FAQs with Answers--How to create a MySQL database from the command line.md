Linux有问必答：如何在命令行创建一个MySQL数据库
===

> **问题**：在一个某处运行的MySQL服务器上，我该怎样通过命令行创建和安装一个MySQL数据库呢？


为了能通过命令行创建一个MySQL数据库，你可以使用mysql命令行客户端。下面是通过mysql命令行客户端创建和安装MySQL的步骤。

### 第一步：安装MySQL客户端 ###

当然你得确保MySQL客户端已经安装完毕。如果没有的话，可以按照下面的方法。

在Debian，Ubuntu 或者 Linux Mint上：

    $ sudo apt-get install mysql-client

在Fedora，CentOS 或者 RHEL上：

    $ sudo apt-get install mysql

### 第二步：登陆到MySQL服务器 ###

首先，你需要使用root用户登陆进你的MySQL数据库，如下：

    $ mysql -u root -h <mysql-server-ip-address> -p 

请注意：为了能登进远程的MySQL服务器，你需要[开启服务器上的远程访问][1]，如果你想调用同一主机上的MySQL服务器，你可以省略 "-h <mysql-server-ip-address>" 参数

    $ mysql -u root -p

你将需要输入MySQL服务器的密码，如果认证成功，MySQL提示将会出现。

![](https://www.flickr.com/photos/xmodulo/15272971112/)

### 第三步：创建一个MySQL数据库 ###

在MySQL提示中输入命令之前，请记住所有的命令都是以分号结束的(否则将不会执行)。另外，考虑输入命令的时候使用大些字母，输入数据库对象使用小写字母。但那不是必须的，只是方便你的阅读。

现在，让我们创建一个叫做xmodulo_DB的数据库：

    mysql> CREATE DATABASE IF NOT EXISTS xmodulo_DB; 

![](https://farm4.staticflickr.com/3864/15086792487_8e2eaedbcd.jpg)

### 第四步：创建一个数据库表 ###

为了达到演示的目的，我们将会创建一个叫做posts_tbl的表，表里会存储关于文章的如下信息：

- 文章的标题
- 作者的名字
- 作者的姓
- 文章可用或者不可用
- 文章创建的日期

这个过程分两步执行：

首先，选择我们需要使用的数据库：

    mysql> USE xmodulo_DB; 

然后，在数据库中创建新表：

    mysql> CREATE TABLE 'posts_tbl' (
    'post_id' INT UNSIGNED NOT NULL AUTO_INCREMENT, 
    'content' TEXT,
    'author_FirstName' VARCHAR(100) NOT NULL,
    'author_LastName' VARCHAR(50) DEFAULT NULL ,
    'isEnabled' TINYINT(1) NOT NULL DEFAULT 1, 
    'date' TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ,
    PRIMARY KEY ( 'post_id' ) 
    ) TYPE = MYISAM;

![](https://farm4.staticflickr.com/3870/15086654980_39d2d54d72.jpg)

### 第五步：创建一个用户，并授予权限 ###

当涉及到访问我们新创的数据库和表的时候，创建一个新用户是一个很好的主意。这样做就可以让用户在没有整个MySQL服务器权限的情况下，去访问那个数据库(而且只能是那个数据库)

你可以创建新用户，授予权限，并且使改变生效：

    mysql> GRANT ALL PRIVILEGES ON xmodulo_DB.* TO 'new_user'@'%' IDENTIFIED BY 'new_password';
    mysql> FLUSH PRIVILEGES;

'new_user'和'new_password'分别指的是新的用户名和他的密码。这条信息将会被保存在mysql.user表中，而且密码会被加密。

### 第六步：测试 ###

让我们插入一个虚拟的记录到posts_tbl表：

    mysql> USE xmodulo_DB;
    mysql> INSERT INTO posts_tbl (content, author_FirstName, author_Las tName)
    VALUES ('Hi! This is some dummy text.', 'Gabriel', 'Canepa');

然后查看posts_tbl表中的所有记录：

    mysql> SELECT * FROM posts_tbl;

![](https://farm4.staticflickr.com/3896/15086792527_39a987d8bd_z.jpg)

注意：MySQL会在我们先前定义的地方自动插入适当的默认值(比如，'isEnabled'和'date')。

---

via: http://ask.xmodulo.com/create-mysql-database-command-line.html

译者：[su-kaiyao](https://github.com/su-kaiyao)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linu
x中国](http://linux.cn/) 荣誉推出

[1]:http://xmodulo.com/2012/06/how-to-allow-remote-access-to-mysql.html





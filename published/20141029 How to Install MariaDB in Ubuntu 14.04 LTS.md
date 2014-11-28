如何在Ubuntu 14.04 LTS上安装MariaDB
================================================================================
MariaDB是一个开源数据库且100%与MySQL兼容，目标是替代MySQL数据库。

### MariaDB的背景 : ###

2008年，MySQL被后来被Oracle在2010年收购的**Sun Microsystems**收购了。 最初被Sun公司的收购由于符合项目的需要而受到MySQL社区的欢呼，但是这种情绪并没有持续太久，接下来被Oracle的收购，不幸期望远远低于预期。许多MySql的开发者离开了Sun和Oracle公司开始新的项目。在他们中间就有MySQL的创建者以及项目长期技术带头人之一的**Michael ‘Monty’ Widenius**。Monty和他的团队创建了MySQL的一个fork版本并且命名它为**MariaDB**。

本篇我们会讨论如何在Ubuntu上安装MariaDB。默认上MariaDB的包并没有在Ubuntu仓库中。要安装MariaDB，我们首先要设置MariaDB仓库。

#### 设置 MariaDB 仓库 ####

    $ sudo apt-get install software-properties-common
    $ sudo apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0xcbcb082a1bb943db
    $ sudo add-apt-repository 'deb http://sfo1.mirrors.digitalocean.com/mariadb/repo/10.0/ubuntu trusty main'

#### 安装 MariaDB : ####

    $ sudo apt-get update
    $ sudo apt-get install mariadb-server

在安装中，你会被要求设置MariaDB的root密码。

![](http://www.linuxtechi.com/wp-content/uploads/2014/10/mariadb-root-1024x442-1.jpg)

#### 从命令行连接到MariaDB : ####

    linuxtechi@mail:~$ mysql -uroot -p
    Enter password: 
    Welcome to the MariaDB monitor.  Commands end with ; or \g.
    Your MariaDB connection id is 40
    Server version: 10.0.14-MariaDB-1~trusty-log mariadb.org binary distribution
    Copyright (c) 2000, 2014, Oracle, SkySQL Ab and others.
    Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.
    MariaDB [(none)]>

#### Maria DB 服务 ####

    $ sudo /etc/init.d/mysql stop
    $ sudo /etc/init.d/mysql start

--------------------------------------------------------------------------------

via: http://www.linuxtechi.com/install-mariadb-in-ubuntu/

作者：[Pradeep Kumar][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.linuxtechi.com/author/pradeep/
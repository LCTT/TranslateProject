Linux上从MySQL迁移到MariaDB的简单步骤
================================================================================
大家好！这是一篇介绍如何在服务器或个人电脑上从MySQL迁移到MariaDB的教程。也许你会问为什么我们要将数据库管理从MySQL迁移到MariaDB。往下看我们告诉你为什么这样做。

### 为什么要用MariaDB来代替MySQL ###

MariaDB是MySQL社区开发的分支，也是一个增强型的替代品。它由MySQL前开发者们带头组织的基金会开发，使用起来和MySQL完全一样。自从Oracle买下了MySQL，它就不再自由开源了，但是 **MariaDB仍然自由开源**。一些如谷歌、维基、LinkedIn、Mozilla等的顶级的网站已经迁移到MariaDB了。它的优势在哪里：

- 向后兼容MySQL
- 永远开源
- 由MySQL缔造者的维护
- 更尖端的功能
- 更多的存储引擎
- 大型的网站已经转向MariaDB

现在，让我们迁移到MariaDB吧！

让我们创建一个叫**linoxidedb**的**用于测试的**示例数据库。

使用以下命令用root账户登陆MySQL：

    $ mysql -u root -p

输入mysql 的 root 用户密码后，你将进入**mysql的命令行**

**创建测试数据库:**

在mysql命令行输入以下命令以创建测试数据库。

    mysql> create database linoxidedb;

查看可用的数据库，输入以下命令：

    mysql> show databases;

![creating test databases](http://blog.linoxide.com/wp-content/uploads/2015/01/creating-test-databases.png)

如你所见，算上刚刚新建的linoxidedb我们一共有5个数据库。

    mysql> quit

现在，我们就将刚创建的数据库从MySQL迁移到MariaDB。

注：使用CentOS这类基于fedora的linux发行版没有必要参考这篇教程，因为它们在安装MariaDB时会自动代替MySQL，无需备份现有的数据库，你只需要更新mysql就可以得到mariadb。

### 1. 备份现有的数据库 ###

我们第一个重要的步骤就是备份现有的数据库。我们在**终端（不是MySQL命令行）**里输入如下命令来完成备份。

    $ mysqldump --all-databases --user=root --password --master-data > backupdatabase.sql

哇哦！我们遇到了点麻烦。别担心我们可以搞定。

    $ mysqldump: Error: Binlogging on server not active

![](http://blog.linoxide.com/wp-content/uploads/2015/01/mysqldump-error.png)

*mysqldump error*

为了修复这个错误，我们需要对**my.cnf**文件做一些小改动。

编辑my.cnf文件：

    $ sudo nano /etc/mysql/my.cnf

在[mysqld]部分添加如下参数。

**log-bin=mysql-bin**

![configuring my.cnf](http://blog.linoxide.com/wp-content/uploads/2015/01/configuring-my.cnf_.png)

好了，在保存并关闭文件后，我们需要重启一下mysql服务。运行以下命令重启：

    $ sudo /etc/init.d/mysql restart

现在，重新运行mysqldump命令来备份所有的数据库。

    $ mysqldump --all-databases --user=root --password --master-data > backupdatabase.sql

![](http://blog.linoxide.com/wp-content/uploads/2015/01/crearing-bakup-file.png)

*dumping databases*

上面的命令将会备份所有的数据库，把它们存储在当前目录下的**backupdatabase.sql**文件中。

### 2. 卸载MySQL ###

首先，我们得把**my.cnf文件挪到安全的地方去**。

**注**：在你卸载MySQL包的时候不会自动删除my.cnf文件，我们这样做只是以防万一。在MariaDB安装时，它会询问我们是保持现存的my.cnf文件，还是使用包中自带的版本（即新my.cnf文件）。

在shell或终端中输入如下命令来备份my.cnf文件：

    $ sudo cp /etc/mysql/my.cnf my.cnf.bak

运行命令来终止mysql服务：

    $ sudo /etc/init.d/mysql stop

然后移除mysql包：

    $ sudo apt-get remove mysql-server mysql-client

![uninstalling mysql](http://blog.linoxide.com/wp-content/uploads/2015/01/uninstalling-mysql.png)

### 3. 安装MariaDB ###

这是在Ubuntu系统中安装MariaDB的命令：

    $ sudo apt-get install software-properties-common
    $ sudo apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0xcbcb082a1bb943db
    # sudo add-apt-repository 'deb http://mirror.mephi.ru/mariadb/repo/5.5/ubuntu trusty main'

![adding mariadb repo](http://blog.linoxide.com/wp-content/uploads/2015/01/adding-repo-mariadb.png)

键值导入并且添加完仓库后，你就可以用以下命令安装MariaDB了：

    $ sudo apt-get update
    $ sudo apt-get install mariadb-server

![installing mariadb](http://blog.linoxide.com/wp-content/uploads/2015/01/installing-mariadb.png)

![my.conf configuration prompt](http://blog.linoxide.com/wp-content/uploads/2015/01/my.conf-configuration-prompt.png)

我们应该还没忘记在MariaDB安装时，它会问你是使用现有的my.cnf文件，还是包中自带的版本。你可以使用以前的my.cnf也可以用包中自带的。即使你想直接使用新的my.cnf文件，你依然可以晚点时候将以前的备份内容还原进去（别忘了我们已经将它复制到安全的地方了）。所以，我们直接选择了默认的选项“N”。如果需要安装其他版本，请参考[MariaDB官方仓库][2]。

### 4. 恢复配置文件 ###

想要将my.cnf.bak中的内容恢复到my.cnf，在终端中输入以下命令。由于my.cnf.bak文件在当前目录下，所以我们只要简单的执行以下命令即可：

    $ sudo cp my.cnf.bak /etc/mysql/my.cnf

### 5. 导入数据库 ###

最后，让我们把我们之前创建的数据库导入吧！运行一下命令即可完成导入。

    $ mysql -u root -p < backupdatabase.sql

就这样，我们已成功将之前的数据库导入了进来。

来，让我们登录一下mysql命令行，检查一下数据库是否真的已经导入了：

    $ mysql -u root -p

![importing database](http://blog.linoxide.com/wp-content/uploads/2015/01/importing-database.png)

为了检查数据库是否被迁移到MariaDB，请在MariaDB命令行中输入“**show databases**；”不用输入（“”），如下：

    mariaDB> show databases;

![mysql to mariadb database migrated](http://blog.linoxide.com/wp-content/uploads/2015/01/maria-database-migrated.png)

如你所见，linoxidedb及所有的数据库都已经成功的被迁移了。

### 总结 ###

最后，我们已经成功地从MySQL迁移到了MariaDB数据库管理系统。MariaDB比MySQL好，虽然在性能方面MySQL还是比它更快，但是MariaDB的优点在于它额外的特性与支持的许可证。这能够确保它自由开源（FOSS），并永久自由开源，相比之下MySQL还有许多额外的插件，有些不能自由使用代码、有些没有公开的开发进程、有些在不久的将来会变的不再自由开源。如果你有任何的问题、评论、反馈给我们，不要犹豫直接在评论区留下你的看法。谢谢观看本教程，希望你能喜欢MariaDB。

--------------------------------------------------------------------------------

via: http://linoxide.com/linux-how-to/migrate-mysql-mariadb-linux/

作者：[Arun Pyasi][a]
译者：[martin2011qi](https://github.com/martin2011qi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/arunp/
[1]:https://mariadb.org/
[2]:https://downloads.mariadb.org/mariadb/repositories/#mirror=mephi

在 Ubuntu 上安装世界上最先进的开源数据库 PostgreSQL 9.4 和 phpPgAdmin
================================================================================
![](http://1426826955.rsc.cdn77.org/wp-content/uploads/2014/05/postgresql.png)

### 简介 ###

[PostgreSQL][1] 是一款强大的，开源的，对象关系型数据库系统。它支持所有的主流操作系统，包括 Linux、Unix（AIX、BSD、HP-UX，SGI IRIX、Mac OS、Solaris、Tru64） 以及 Windows 操作系统。

下面是 **Ubuntu** 发起者 **Mark Shuttleworth** 对 PostgreSQL 的一段评价。

> PostgreSQL 是一款极赞的数据库系统。刚开始我们在 Launchpad 上使用它的时候，并不确定它能否胜任工作。但我是错了。它很强壮、快速，在各个方面都很专业。
>
> — Mark Shuttleworth.

在这篇简短的指南中，让我们来看看如何在 Ubuntu 15.10 服务器中安装 PostgreSQL 9.4。

### 安装 PostgreSQL ###

默认仓库中就有可用的 PostgreSQL。在终端中输入下面的命令安装它。

    sudo apt-get install postgresql postgresql-contrib

如果你需要其它的版本，按照下面那样先添加 PostgreSQL 仓库然后再安装。

**PostgreSQL apt 仓库** 支持 amd64 和 i386 架构的 Ubuntu 长期支持版（10.04、12.04 和 14.04），以及非长期支持版（14.04）。对于其它非长期支持版，该软件包虽然没有完全支持，但使用和 LTS 版本近似的也能正常工作。

#### Ubuntu 14.10 系统： ####

新建文件**/etc/apt/sources.list.d/pgdg.list**；

    sudo vi /etc/apt/sources.list.d/pgdg.list

用下面一行添加仓库：

    deb http://apt.postgresql.org/pub/repos/apt/ utopic-pgdg main

**注意**： 上面的库只能用于 Ubuntu 14.10。还没有升级到 Ubuntu 15.04 和 15.10。

对于 **Ubuntu 14.04**，添加下面一行：

    deb http://apt.postgresql.org/pub/repos/apt/ trusty-pgdg main

对于 **Ubuntu 12.04**，添加下面一行：

    deb http://apt.postgresql.org/pub/repos/apt/ precise-pgdg main

导入库签名密钥：

    wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc

    sudo apt-key add -

更新软件包列表：

    sudo apt-get update

然后安装需要的版本。

    sudo apt-get install postgresql-9.4

### 访问 PostgreSQL 命令窗口 ###

默认的数据库名称和数据库用户名称都是 “**postgres**”。切换到 postgres 用户进行 postgresql 相关的操作：

    sudo -u postgres psql postgres

#### 示例输出： ####

    psql (9.4.5)
    Type "help" for help.
    postgres=#

要退出 postgresql 窗口，在 **psql** 窗口输入 **\q** 退出到终端。

### 设置 “postgres” 用户密码 ###

登录到 postgresql 窗口，

    sudo -u postgres psql postgres

用下面的命令为用户 postgres 设置密码：

    postgres=# \password postgres 
    Enter new password: 
    Enter it again: 
    postgres=# \q

要安装 PostgreSQL Adminpack 扩展，在 postgresql 窗口输入下面的命令：

    sudo -u postgres psql postgres

----------

    postgres=# CREATE EXTENSION adminpack;
    CREATE EXTENSION

在 **psql** 窗口输入 **\q** 从 postgresql 窗口退回到终端。

### 创建新用户和数据库 ###

例如，让我们创建一个新的用户，名为 “**senthil**”，密码是 “**ubuntu**”，以及名为 “**mydb**” 的数据库。

    sudo -u postgres createuser -D -A -P senthil

----------

    sudo -u postgres createdb -O senthil mydb

### 删除用户和数据库 ###

要删除数据库，首先切换到 postgres 用户：

    sudo -u postgres psql postgres

输入命令：

    $ drop database <database-name>

要删除一个用户，输入下面的命令：

    $ drop user <user-name>

### 配置 PostgreSQL-MD5 验证 ###

**MD5 验证** 要求用户提供一个 MD5 加密的密码用于认证。首先编辑 **/etc/postgresql/9.4/main/pg_hba.conf** 文件：

    sudo vi /etc/postgresql/9.4/main/pg_hba.conf

按照下面所示添加或修改行

    [...]
    # TYPE  DATABASE        USER            ADDRESS                 METHOD
    # "local" is for Unix domain socket connections only
    local   all             all                                     md5
    # IPv4 local connections:
    host    all             all             127.0.0.1/32            md5
    host    all             all             192.168.1.0/24          md5
    # IPv6 local connections:
    host    all             all             ::1/128                 md5
    [...]

其中， 192.168.1.0/24 是我的本地网络 IP 地址。用你自己的地址替换。

重启 postgresql 服务以使更改生效：

    sudo systemctl restart postgresql

或者，

    sudo service postgresql restart

### 配置 PostgreSQL TCP/IP 配置 ###

默认情况下，没有启用 TCP/IP 连接，因此其它计算机的用户不能访问 postgresql。为了允许其它计算机的用户访问，编辑文件 **/etc/postgresql/9.4/main/postgresql.conf:**

    sudo vi /etc/postgresql/9.4/main/postgresql.conf

找到下面一行：

    [...]
    #listen_addresses = 'localhost'
    [...]
    #port = 5432
    [...]

取消该行的注释，然后设置你 postgresql 服务器的 IP 地址，或者设置为 ‘*’ 监听所有用户。你应该谨慎设置所有远程用户都可以访问 PostgreSQL。

    [...]
    listen_addresses = '*'
    [...]
    port = 5432
    [...]

重启 postgresql 服务保存更改：

    sudo systemctl restart postgresql

或者，

    sudo service postgresql restart

### 用 phpPgAdmin 管理 PostgreSQL ###

[**phpPgAdmin**][2] 是基于 web 用 PHP 写的 PostgreSQL 管理工具。

默认仓库中有可用的 phpPgAdmin。用下面的命令安装 phpPgAdmin：

    sudo apt-get install phppgadmin

默认情况下，你可以在本地系统的 web 浏览器用 **http://localhost/phppgadmin** 访问 phppgadmin。

要访问远程系统，在 Ubuntu 15.10 上做如下操作：

编辑文件 **/etc/apache2/conf-available/phppgadmin.conf**,

    sudo vi /etc/apache2/conf-available/phppgadmin.conf

找到 **Require local** 的一行在这行前面添加 **#** 注释掉它。

    #Require local

添加下面的一行：

    allow from all

保存并退出文件。

然后重启 apache 服务。

    sudo systemctl restart apache2

对于 Ubuntu 14.10 及之前版本：

编辑 **/etc/apache2/conf.d/phppgadmin**:

    sudo nano /etc/apache2/conf.d/phppgadmin

注释掉下面一行：

    [...]
    #allow from 127.0.0.0/255.0.0.0 ::1/128

取消下面一行的注释使所有系统都可以访问 phppgadmin。

    allow from all

编辑 **/etc/apache2/apache2.conf**:

    sudo vi /etc/apache2/apache2.conf

添加下面一行：

    Include /etc/apache2/conf.d/phppgadmin

然后重启 apache 服务。

    sudo service apache2 restart

### 配置 phpPgAdmin ###

编辑文件 **/etc/phppgadmin/config.inc.php**， 做以下更改。下面大部分选项都带有解释。认真阅读以便了解为什么要更改这些值。

    sudo nano /etc/phppgadmin/config.inc.php

找到下面一行：

    $conf['servers'][0]['host'] = '';

按照下面这样更改：

    $conf['servers'][0]['host'] = 'localhost';

找到这一行：

    $conf['extra_login_security'] = true;

更改值为 **false**。

    $conf['extra_login_security'] = false;

找到这一行：

    $conf['owned_only'] = false;

更改值为 **true**。

    $conf['owned_only'] = true;

保存并关闭文件。重启 postgresql 服务和 Apache 服务。

    sudo systemctl restart postgresql

    sudo systemctl restart apache2

或者，

    sudo service postgresql restart

    sudo service apache2 restart

现在打开你的浏览器并导航到 **http://ip-address/phppgadmin**。你会看到以下截图。

![phpPgAdmin ](http://1426826955.rsc.cdn77.org/wp-content/uploads/2015/11/phpPgAdmin-Google-Chrome_001.jpg)

用你之前创建的用户登录。我之前已经创建了一个名为 “**senthil**” 的用户，密码是 “**ubuntu**”，因此我以 “senthil” 用户登录。

![phpPgAdmin  ](http://1426826955.rsc.cdn77.org/wp-content/uploads/2015/11/phpPgAdmin-Google-Chrome_002.jpg)

然后你就可以访问 phppgadmin 面板了。

![phpPgAdmin ](http://1426826955.rsc.cdn77.org/wp-content/uploads/2015/11/phpPgAdmin-Google-Chrome_003.jpg)

用 postgres 用户登录：

![phpPgAdmin ](http://1426826955.rsc.cdn77.org/wp-content/uploads/2015/11/phpPgAdmin-Google-Chrome_004.jpg)

就是这样。现在你可以用 phppgadmin 可视化创建、删除或者更改数据库了。

加油！

--------------------------------------------------------------------------------

via: http://www.unixmen.com/install-postgresql-9-4-and-phppgadmin-on-ubuntu-15-10/

作者：[SK][a]
译者：[ictlyh](http://mutouxiaogui.cn/blog/)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.twitter.com/ostechnix
[1]:http://www.postgresql.org/
[2]:http://phppgadmin.sourceforge.net/doku.php
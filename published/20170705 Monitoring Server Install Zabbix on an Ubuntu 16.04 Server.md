在 Ubuntu 16.04 Server 上安装 Zabbix
============================================================

 [![Zabbix logo](https://www.unixmen.com/wp-content/uploads/2017/06/zabbix_logo.png "zabbix_logo")][3] 

### 监控服务器 - 什么是 Zabbix

[Zabbix][2] 是企业级开源分布式监控服务器解决方案。该软件能监控网络的不同参数以及服务器的完整性，还允许为任何事件配置基于电子邮件的警报。Zabbix 根据存储在数据库（例如 MySQL）中的数据提供报告和数据可视化功能。软件收集的每个测量指标都可以通过基于 Web 的界面访问。

Zabbix 根据 GNU 通用公共许可证版本 2（GPLv2）的条款发布，完全免费。

在本教程中，我们将在运行 MySQL、Apache 和 PHP 的 Ubuntu 16.04 server 上安装 Zabbix。

### 安装 Zabbix 服务器

首先，我们需要安装 Zabbix 所需的几个 PHP 模块：

```
# apt-get install php7.0-bcmath php7.0-xml php7.0-mbstring
```

Ubuntu 仓库中提供的 Zabbix 软件包已经过时了。使用官方 Zabbix 仓库安装最新的稳定版本。

通过执行以下命令来安装仓库软件包：

```
$ wget http://repo.zabbix.com/zabbix/3.2/ubuntu/pool/main/z/zabbix-release/zabbix-release_3.2-1+xenial_all.deb
# dpkg -i zabbix-release_3.2-1+xenial_all.deb
```

然后更新 `apt` 包源：

```
# apt-get update
```

现在可以安装带有 MySQL 支持和 PHP 前端的 Zabbix 服务器。执行命令：

```
# apt-get install zabbix-server-mysql zabbix-frontend-php
```

安装 Zabbix 代理：

```
# apt-get install zabbix-agent
```

Zabbix 现已安装。下一步是配置数据库来存储数据。

### 为 Zabbix 配置 MySQL

我们需要创建一个新的 MySQL 数据库，Zabbix 将用来存储收集的数据。

启动 MySQL shell：

```
$ mysql -uroot -p
```

接下来：

```
mysql> CREATE DATABASE zabbix CHARACTER SET utf8 COLLATE utf8_bin;
Query OK, 1 row affected (0.00 sec)

mysql> GRANT ALL PRIVILEGES ON zabbix.* TO zabbix@localhost IDENTIFIED BY 'usr_strong_pwd';
Query OK, 0 rows affected, 1 warning (0.00 sec)

mysql> EXIT;
Bye
```

接下来，导入初始表和数据。

```
# zcat /usr/share/doc/zabbix-server-mysql/create.sql.gz | mysql -uzabbix -p zabbix
```

输入在 MySQL shell 中创建的 **zabbix** 用户的密码。

接下来，我们需要编辑 Zabbix 服务器配置文件，它是 `/etc/zabbix/zabbis_server.conf`：

```
# $EDITOR /etc/zabbix/zabbix_server.conf
```

搜索文件的 `DBPassword` 部分：

```
### Option: DBPassword                           
#       Database password. Ignored for SQLite.   
#       Comment this line if no password is used.
#                                                
# Mandatory: no                                  
# Default:                                       
# DBPassword=

```

取消注释 `DBPassword=` 这行，并添加在 MySQL 中创建的密码：

```
DBPassword=usr_strong_pwd

```

接下来，查找 `DBHost=` 这行并取消注释。

保存并退出。

### 配置 PHP

我们需要配置 PHP 来使用 Zabbix。在安装过程中，安装程序在 `/etc/zabbix` 中创建了一个名为 `apache.conf` 的配置文件。打开此文件：

```
# $EDITOR /etc/zabbix/apache.conf
```

此时，只需要取消注释 `date.timezone` 并设置正确的时区：

```

<IfModule mod_php7.c>
    php_value max_execution_time 300
    php_value memory_limit 128M
    php_value post_max_size 16M
    php_value upload_max_filesize 2M
    php_value max_input_time 300
    php_value always_populate_raw_post_data -1
    php_value date.timezone Europe/Rome
</IfModule>

```

保存并退出。

此时，重启 Apache 并启动 Zabbix Server 服务，使其能够在开机时启动：

```
# systemctl restart apache2
# systemctl start zabbix-server
# systemctl enable zabbix-server
```

用 `systemctl` 检查 Zabbix 状态：

```
# systemctl status zabbix-server
```

这个命令应该输出：

```
â zabbix-server.service - Zabbix Server
 Loaded: loaded (/lib/systemd/system/zabbix-server.service; enabled; vendor pr
 Active: active (running) ...
```

此时，Zabbix 的服务器端已经正确安装和配置了。

### 配置 Zabbix Web 前端

如介绍中所述，Zabbix 有一个基于 Web 的前端，我们将用于可视化收集的数据。但是，必须配置此接口。

使用 Web 浏览器，进入 URL `http://localhost/zabbix`。

![Zabbix monitoring server Frontend Setup](https://www.unixmen.com/wp-content/uploads/2017/06/snapshot1.png)

点击  **Next step** 

![snapshot2](https://www.unixmen.com/wp-content/uploads/2017/06/snapshot2.png)

确保所有的值都是 **Ok**，然后再次单击 **Next step** 。

![Zabbix MySQL configuration](https://www.unixmen.com/wp-content/uploads/2017/06/snapshot3.png)

输入 MySQL **zabbix** 的用户密码，然后点击 **Next step**。

![Zabbix server details](https://www.unixmen.com/wp-content/uploads/2017/06/snapshot4.png)

单击 **Next step** ，安装程序将显示具有所有配置参数的页面。再次检查以确保一切正确。

![Zabbix pre-installation details](https://www.unixmen.com/wp-content/uploads/2017/06/snapshot5.png)

![Zabbix installation finished](https://www.unixmen.com/wp-content/uploads/2017/06/snapshot6.png)

点击 **Next step** 进入最后一页。

点击完成以完成前端安装。默认用户名为 **Admin**，密码是 **zabbix**。

### Zabbix 服务器入门

![Zabbix login interface](https://www.unixmen.com/wp-content/uploads/2017/06/snapshot7.png)

使用上述凭证登录后，我们将看到 Zabbix 面板：

![zabbix dashboard](https://www.unixmen.com/wp-content/uploads/2017/06/snapshot8.png)

前往 **Administration -> Users**，了解已启用帐户的概况：

![Zabbix users](https://www.unixmen.com/wp-content/uploads/2017/06/snapshot9.png)

通过点击 **Create user** 创建一个新帐户。

![Zabbix User Creation](https://www.unixmen.com/wp-content/uploads/2017/06/snapshot10.png)

点击 **Groups** 中的 **Add**，然后选择一个组：

![snapshot11](https://www.unixmen.com/wp-content/uploads/2017/06/snapshot11.png)

保存新用户凭证，它将显示在 **Administration -> Users** 面板中。

**请注意，在 Zabbix 中，主机的访问权限分配给用户组，而不是单个用户。**

### 总结

我们结束了 Zabbix Server 安装的教程。现在，监控基础设施已准备好完成其工作并收集有关需要在 Zabbix 配置中添加的服务器的数据。

--------------------------------------------------------------------------------

via: https://www.unixmen.com/monitoring-server-install-zabbix-ubuntu-16-04/

作者：[Giuseppe Molica][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.unixmen.com/author/tutan/
[1]:https://www.unixmen.com/author/tutan/
[2]:http://www.zabbix.com/
[3]:https://www.unixmen.com/wp-content/uploads/2017/06/zabbix_logo.png

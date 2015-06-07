使用Observium来监控你的网络和服务器
================================================================================
### 简介###

在监控你的服务器、交换机或者设备时遇到过问题吗？**Observium** 可以满足你的需求。这是一个免费的监控系统，它可以帮助你远程监控你的服务器。它是一个由PHP编写的基于自动发现 SNMP 的网络监控平台，支持非常广泛的网络硬件和操作系统，包括 Cisco、Windows、Linux、HP、NetApp 等等。在此我会给出在 Ubuntu 12.04 上一步步地设置一个 **Observium** 服务器的介绍。

![](http://www.unixmen.com/wp-content/uploads/2015/03/Capture1.png)

目前有两种不同的 **observium** 版本。

- Observium 社区版本是一个在 QPL 开源许可证下的免费工具，这个版本是对于较小部署的最好解决方案。该版本每6个月进行一次安全性更新。
- 第2个版本是 Observium 专业版，该版本采用基于 SVN 的发布机制。 会得到每日安全性更新。 该工具适用于服务提供商和企业级部署。

更多信息可以通过其[官网][1]获得。

### 系统需求###

要安装 **Observium**， 需要具有一个最新安装的服务器。**Observium** 是在 Ubuntu LTS 和 Debian 系统上进行开发的，所以推荐在 Ubuntu 或 Debian 上安装 **Observium**，因为可能在别的平台上会有一些小问题。

该文章会引导你在 Ubuntu 12.04 上安装 **Observium**。对于小型的 **Observium** 安装，建议使用 256MB 内存和双核处理器的配置。 

### 安装需求 ###

在安装 **Observuim** 之前，你需要确认安装所有的依赖关系包。

首先，使用下面的命令更新你的服务器：

    sudo apt-get update

然后你需要安装下列运行 Observuim 所需的全部软件包。

Observium 需要使用下面所列出的软件才能正确的运行：

- LAMP 服务器
- fping
- Net-SNMP 5.4+
- RRDtool 1.3+
- Graphviz

对于可选特性的要求：

- Ipmitool - 仅在当你想要获取服务器上的 IPMI（Intelligent Platform Management Interface 智能平台管理接口）基板控制器时。
- Libvirt-bin - 仅在当你想要使用 libvirt 进行远程 VM 主机监控时。

    sudo apt-get install libapache2-mod-php5 php5-cli php5-mysql php5-gd php5-mcrypt php5-json php-pear snmp fping mysql-server mysql-client python-mysqldb rrdtool subversion whois mtr-tiny ipmitool graphviz imagemagick libvirt ipmitool

### 为 Observium 创建 MySQL 数据库及其用户。

现在你需要登录到 MySQL 中并为 **Observium** 创建数据库：

    mysql -u root -p

在用户验证成功之后，你需要按照下面的命令创建该数据库。

    CREATE DATABASE observium;

数据库名为 **Observium**，稍后你会需要这个信息。

现在你需要创建数据库管理员用户。

    CREATE USER observiumadmin@localhost IDENTIFIED BY 'observiumpassword';

接下来，你需要给该管理员用户相应的权限来管理创建的数据库。

    GRANT ALL PRIVILEGES ON observium.* TO observiumadmin@localhost;

你需要将权限信息写回到磁盘中来激活新的 MySQL 用户：

    FLUSH PRIVILEGES;
    exit

### 下载并安装 Observium###

现在我们的系统已经准备好了， 可以开始Observium的安装了。

第一步，创建 Observium 将要使用的文件目录：

    mkdir -p /opt/observium && cd /opt

按本教程的目的，我们将会使用 Observium 的社区/开源版本。使用下面的命令下载并解压：

    wget http://www.observium.org/observium-community-latest.tar.gz
    tar zxvf observium-community-latest.tar.gz

现在进入到 Observium 目录。

    cd observium

将默认的配置文件 '**config.php.default**' 复制到 '**config.php**'，并将数据库配置选项填充到配置文件中：

    cp config.php.default config.php
    nano config.php

----------

    / Database config
    $config['db_host'] = 'localhost';
    $config['db_user'] = 'observiumadmin';
    $config['db_pass'] = 'observiumpassword';
    $config['db_name'] = 'observium';

现在为 MySQL 数据库设置默认的数据库模式：

    php includes/update/update.php

现在你需要创建一个文件目录来存储 rrd 文件，并修改其权限以便让 apache 能将写入到文件中。

    mkdir rrd
    chown apache:apache rrd

为了在出现问题时排错，你需要创建日志文件。

    mkdir -p /var/log/observium
    chown apache:apache /var/log/observium

现在你需要为 Observium 创建虚拟主机配置。

    <VirtualHost *:80>
      DocumentRoot /opt/observium/html/
      ServerName  observium.domain.com
      CustomLog /var/log/observium/access_log combined
      ErrorLog /var/log/observium/error_log
      <Directory "/opt/observium/html/">
      AllowOverride All
      Options FollowSymLinks MultiViews
      </Directory>
      </VirtualHost>

下一步你需要让你的 Apache 服务器的 rewrite (重写)功能生效。

为了让 'mod_rewrite' 生效，输入以下命令：

    sudo a2enmod rewrite

该模块在下一次 Apache 服务重启之后就会生效。

    sudo service apache2 restart

###配置 Observium###

在登入 Web 界面之前，你需要为 Observium 创建一个管理员账户（级别10）。

    # cd /opt/observium
    # ./adduser.php admin adminpassword 10 
    User admin added successfully.

下一步为发现和探寻任务设置一个 cron 任务，创建一个新的文件 ‘**/etc/cron.d/observium**’ 并在其中添加以下的内容。

    33  */6   * * *   root    /opt/observium/discovery.php -h all >> /dev/null 2>&1
    */5 *      * * *   root    /opt/observium/discovery.php -h new >> /dev/null 2>&1
    */5 *      * * *   root    /opt/observium/poller-wrapper.py 1 >> /dev/null 2>&1

重载 cron 进程来增加新的任务。

    # /etc/init.d/cron reload

好啦，你已经完成了 Observium 服务器的安装拉！ 使用你的浏览器登录到 **http://\<Server IP>**，然后上路吧。

![](http://www.unixmen.com/wp-content/uploads/2015/03/Capture.png)

尽情享受吧！

--------------------------------------------------------------------------------

via: http://www.unixmen.com/monitoring-network-servers-observium/

作者：[anismaj][a]
译者：[theo-l](http://github.com/theo-l)
校对：[wxy](http://github.com/wxy)

本文由 [LCTT](http://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.unixmen.com/author/anis/
[1]:http://www.observium.org/

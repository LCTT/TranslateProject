如何在CentOS 7.x中安装OpenERP（Odoo）
================================================================================
各位好，这篇教程关于的是如何在CentOS 7中安装Odoo（就是我们所知的OpenERP）。你是不是在考虑为你的业务安装一个不错的ERP（企业资源规划）软件？那么OpenERP就是你寻找的最好的程序，因为它是一款为你的商务提供杰出特性的自由开源软件。

[OpenERP][1]是一款自由开源的传统的OpenERP（企业资源规划），它包含了开源CRM、网站构建、电子商务、项目管理、计费账务、POS、人力资源、市场、生产、采购管理以及其它模块用于提高效率及销售。Odoo中的应用可以作为独立程序使用，它们也可以无缝集成到一起，因此你可以在安装几个程序来得到一个全功能的开源ERP。

因此，下面是在你的CentOS上安装OpenERP的步骤。

### 1. 安装 PostgreSQL ###

首先，首先我们需要更新CentOS 7的软件包来确保是最新的包，补丁和安全更新。要更新我们的系统，我们要在shell下运行下面的命令。

    # yum clean all
    # yum update

现在我们要安装PostgreSQL，因为OpenERP使用PostgreSQL作为它的数据库。要安装它，我们需要运行下面的命令。

    # yum install postgresql postgresql-server postgresql-libs

![Installing postgresql](http://blog.linoxide.com/wp-content/uploads/2015/03/installing-postgresql.png)

安装完成后，我们需要用下面的命令初始化数据库。

    # postgresql-setup initdb

![Intializating postgresql](http://blog.linoxide.com/wp-content/uploads/2015/03/intializating-postgresql.png)

我们接着设置PostgreSQL来使它每次开机启动。

    # systemctl enable postgresql
    # systemctl start postgresql

因为我们还没有为用户“postgresql”设置密码，我们现在设置。

    # su - postgres
    $ psql
    postgres=# \password postgres
    postgres=# \q
    # exit

![setting password postgres](http://blog.linoxide.com/wp-content/uploads/2015/03/setting-password-postgres.png)

### 2. 设置Odoo仓库 ###

在初始化数据库初始化完成后，我们要添加 EPEL（企业版Linux的额外包）到我们的CentOS中。Odoo（或者OpenERP）依赖的Python运行时环境以及其他包没有包含在标准仓库中。这样我们要为企业版Linux添加额外的包仓库支持来解决Odoo所需要的依赖。要安装完成，我们需要运行下面的命令。

    # yum install epel-release

![Installing EPEL Release](http://blog.linoxide.com/wp-content/uploads/2015/03/installing-epel-release.png)

现在，安装EPEL后，我们现在使用yum-config-manager添加Odoo（OpenERP）的仓库。

    # yum install yum-utils

    # yum-config-manager --add-repo=https://nightly.odoo.com/8.0/nightly/rpm/odoo.repo

![Adding OpenERP (Odoo) Repo](http://blog.linoxide.com/wp-content/uploads/2015/03/added-odoo-repo.png)

### 3. 安装Odoo 8 (OpenERP) ###

在CentOS 7中添加Odoo 8（OpenERP）的仓库后。我们使用下面的命令来安装Odoo 8(OpenERP)。

    # yum install -y odoo

上面的命令会安装odoo以及必须的依赖的包。

![Installing odoo or OpenERP](http://blog.linoxide.com/wp-content/uploads/2015/03/installing-odoo.png)

现在我们使用下面的命令在每次启动后启动Odoo服务。

    # systemctl enable odoo
    # systemctl start odoo

![Starting Odoo](http://blog.linoxide.com/wp-content/uploads/2015/03/starting-odoo.png)

### 4. 打开防火墙 ###

因为Odoo使用8069端口，我们需要在防火墙中允许远程访问。我们使用下面的命令来在防火墙中允许8069端口访问。

    # firewall-cmd --zone=public --add-port=8069/tcp --permanent
    # firewall-cmd --reload

![Allowing firewall Port](http://blog.linoxide.com/wp-content/uploads/2015/03/allowing-firewall-port.png)

**注意：默认情况下只有本地才允许连接数据库。如果我们要允许PostgreSQL的远程访问，我们需要在pg_hba.conf添加下面图片中一行**

    # nano /var/lib/pgsql/data/pg_hba.conf

![Allowing Remote Access pgsql](http://blog.linoxide.com/wp-content/uploads/2015/03/allowing-remote-access-pgsql.png)

### 5. Web接口 ###

我们已经在CentOS 7中安装了最新的Odoo 8（OpenERP），我们可以在浏览器中输入`http://ip-address:8069`来访问Odoo。 接着，我们要做的第一件事就是创建一个新的数据库和新的密码。注意，主密码默认是‘admin’。接着，我们可以在面板中输入用户名和密码。

![Odoo Panel](http://blog.linoxide.com/wp-content/uploads/2015/03/odoo-panel.png)

### 总结 ###

Odoo 8（OpenERP）是世界上最好的开源ERP程序。OpenERP是由许多模块组成的针对商务和公司的完整ERP程序，我们已经把它安装好了。因此，如果你有任何问题、建议、反馈请在下面的评论栏写下。谢谢你！享受OpenERP（Odoo 8）吧 ：-）

--------------------------------------------------------------------------------

via: http://linoxide.com/linux-how-to/setup-openerp-odoo-centos-7/

作者：[Arun Pyasi][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/arunp/
[1]:https://www.odoo.com/

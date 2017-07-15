如何在 Ubuntu 16.04 上安装 OTRS （开源问题单系统）
============================================================
 

OTRS ，及开源问题单（ticket）申请系统是一个用于客户服务、帮助台和 IT 服务管理的开源问题单软件。该软件是用 Perl 和 javascript 编写的。对于那些需要管理票据、投诉、支持请求或其他类型的报告的公司和组织来说，这是一个问题单解决方案。OTRS 支持包括 MySQL、PostgreSQL、Oracle 和 SQL Server 在内的多个数据库系统，它是一个可以安装在 Windows 和 Linux 上的多平台软件。

在本教程中，我将介绍如何在 Ubuntu 16.04 上安装和配置 OTRS。我将使用 PostgreSQL 作为 OTRS 的数据库，将 Apache Web 服务器用作 Web 服务器。

**先决条件**

*   Ubuntu 16.04。
*   最小 2GB 的内存。
*   root 权限

### 步骤 1 - 安装 Apache 和 PostgreSQL

在第一步中，我们将安装 Apache Web 服务器以及 PostgreSQL。我们将从 ubuntu 仓库中使用最新的版本。

使用 SSH 登录到你的 Ubuntu 服务器中：

```
ssh root@192.168.33.14
```

更新 Ubuntu 仓库。

```
sudo apt-get update
```

使用 apt 安装 Apache2 以及 PostgreSQL：

```
sudo apt-get install -y apache2 libapache2-mod-perl2 postgresql
```

通过检查服务器端口确保 Apache 以及 PostgreSQL 运行了。

```
netstat -plntu
```

[
 ![Install Apache and PostgreSQL](https://www.howtoforge.com/images/how-to-install-otrs-opensource-trouble-ticket-system-on-ubuntu-16-04/1.png) 
][17]

你可以看到 80 端口被 apache 使用了，5432 端口被 postgresql 数据库使用了。

### 步骤 2 - 安装 Perl 模块

OTRS 基于 Perl，因此我们需要安装一些 OTRS 需要的 Perl 模块。

使用这个 apt 命令安装 perl 模块：

```
sudo apt-get install -y libapache2-mod-perl2 libdbd-pg-perl libnet-dns-perl libnet-ldap-perl libio-socket-ssl-perl libpdf-api2-perl libsoap-lite-perl libgd-text-perl libgd-graph-perl libapache-dbi-perl libarchive-zip-perl libcrypt-eksblowfish-perl libcrypt-ssleay-perl libencode-hanextra-perl libjson-xs-perl libmail-imapclient-perl libtemplate-perl libtemplate-perl libtext-csv-xs-perl libxml-libxml-perl libxml-libxslt-perl libpdf-api2-simple-perl libyaml-libyaml-perl
```

安装完成后，我们需要为 apache 激活 Perl 模块，接着重启 apache 服务。

```
a2enmod perl
systemctl restart apache2
```

接下来，使用下面的命令检查模块是否已经加载了：

```
apachectl -M | sort
```

[
 ![Enable Apache Perl Module](https://www.howtoforge.com/images/how-to-install-otrs-opensource-trouble-ticket-system-on-ubuntu-16-04/2.png) 
][18]

你可以在 “Loaded Modules” 部分下看到 **perl_module**。

### 步骤 3 - 为 OTRS 创建新用户

OTRS 是一个基于 web 的程序并且运行与 apache web 服务器下。为了安全，我们需要以普通用户运行它，而不是 root 用户。

使用 useradd 命令创建一个 `otrs` 新用户：

```
useradd -r -d /opt/otrs -c 'OTRS User' otrs
```

* `-r`：将用户作为系统用户。 
* `-d /opt/otrs`：在 `/opt/otrs` 下放置新用户的主目录。
* `-c`：备注。

接下来，将 `otrs` 用户加入到 `www-data` 用户组，因为 apache 运行于 `www-data` 用户及用户组。

```
usermod -a -G www-data otrs
```

在 `/etc/passwd` 文件中已经有 `otrs` 用户了。

```
grep -rin otrs /etc/passwd
```

[
 ![Create new user for OTRS](https://www.howtoforge.com/images/how-to-install-otrs-opensource-trouble-ticket-system-on-ubuntu-16-04/3.png) 
][19]

OTRS 的新用户已经创建了。

### 步骤 4 - 创建和配置数据库

在这节中，我们会为 OTRS 系统创建一个新 PostgreSQL 数据库，并对 PostgreSQL 数据库的配置做一些小的更改。

登录到 `postgres` 用户并访问 PostgreSQL shell。

```
su - postgres
psql
```

创建一个新的角色  `otrs`，密码是 `myotrspw`，并且是非特权用户。

```
create user otrs password 'myotrspw' nosuperuser;
```

接着使用 `otrs` 用户权限创建一个新的 `otrs` 数据库：

```
create database otrs owner otrs;
\q
```

接下来为 `otrs` 角色验证编辑 PostgreSQL 配置文件。

```
vim /etc/postgresql/9.5/main/pg_hba.conf
```

在 84 行后粘贴下面的配置：

```
local   otrs            otrs                                    password
host    otrs            otrs            127.0.0.1/32            password
```

保存文件并退出 vim

[
 ![Database Authentication OTRS](https://www.howtoforge.com/images/how-to-install-otrs-opensource-trouble-ticket-system-on-ubuntu-16-04/4.png) 
][20]

使用 `exit` 回到 root 权限并重启 PostgreSQL：

```
exit
systemctl restart postgresql
```

PostgreSQL 已经为 OTRS 的安装准备好了。

[
 ![Configure PostgreSQL for OTRS](https://www.howtoforge.com/images/how-to-install-otrs-opensource-trouble-ticket-system-on-ubuntu-16-04/5.png) 
][21]

### 步骤 5 - 下载和配置 OTRS

在本教程中，我们会使用 OTRS 网站中最新的版本。

进入 `/opt` 目录并使用 `wget` 命令下载 OTRS 5.0：

```
cd /opt/
wget http://ftp.otrs.org/pub/otrs/otrs-5.0.16.tar.gz
```

展开该 otrs 文件，重命名目录并更改所有 otrs 的文件和目录的所属人为 `otrs`。

```
tar -xzvf otrs-5.0.16.tar.gz
mv otrs-5.0.16 otrs
chown -R otrs:otrs otrs
```

接下来，我们需要检查系统并确保可以安装 OTRS 了。

使用下面的 otrs 脚本命令检查 OTRS 安装需要的系统软件包：

```
/opt/otrs/bin/otrs.CheckModules.pl
```

确保所有的结果是对的，这意味着我们的服务器可以安装 OTRS 了。

[
 ![OTRS Chek Module needed for Installation](https://www.howtoforge.com/images/how-to-install-otrs-opensource-trouble-ticket-system-on-ubuntu-16-04/6.png) 
][22]

OTRS 已下载，并且我们的服务器可以安装 OTRS 了。

接下，进入 otrs 目录并复制配置文件。

```
cd /opt/otrs/
cp Kernel/Config.pm.dist Kernel/Config.pm
```

使用 vim 编辑 `Config.pm` 文件：

```
vim Kernel/Config.pm
```

更改 42 行的数据库密码：

```
$Self->{DatabasePw} = 'myotrspw';
```

注释 45 行的 MySQL 数据库支持：

```
# $Self->{DatabaseDSN} = "DBI:mysql:database=$Self->{Database};host=$Self->{DatabaseHost};";
```

取消注释 49 行的 PostgreSQL 数据库支持：

```
$Self->{DatabaseDSN} = "DBI:Pg:dbname=$Self->{Database};";
```

保存文件并退出 vim。

接着编辑 apache 启动文件来启用 PostgreSQL 支持。

```
vim scripts/apache2-perl-startup.pl
```

取消注释 60 和 61 行：

```
# enable this if you use postgresql
use DBD::Pg ();
use Kernel::System::DB::postgresql;
```

保存文件并退出编辑器。

最后，检查缺失的依赖和模块。

```
perl -cw /opt/otrs/bin/cgi-bin/index.pl
perl -cw /opt/otrs/bin/cgi-bin/customer.pl
perl -cw /opt/otrs/bin/otrs.Console.pl
```

你可以在下面的截图中看到结果是 “**OK**”：

[
 ![Check all modules again](https://www.howtoforge.com/images/how-to-install-otrs-opensource-trouble-ticket-system-on-ubuntu-16-04/7.png) 
][23]

### 步骤 6 - 导入样本数据库

在本教程中，我们会使用样本数据库，这可以在脚本目录中找到。因此我们只需要将所有的样本数据库以及表结构导入到第 4 步创建的数据库中。

登录到 `postgres` 用户并进入 otrs 目录中。

```
su - postgres
cd /opt/otrs/
```
作为 otrs 用户使用 `psql` 命令插入数据库以及表结构。

```
psql -U otrs -W -f scripts/database/otrs-schema.postgresql.sql otrs
psql -U otrs -W -f scripts/database/otrs-initial_insert.postgresql.sql otrs
psql -U otrs -W -f scripts/database/otrs-schema-post.postgresql.sql otrs
```

在需要的时候输入数据库密码 `myotrspw`。

[
 ![Import OTRS Sample Database](https://www.howtoforge.com/images/how-to-install-otrs-opensource-trouble-ticket-system-on-ubuntu-16-04/8.png) 
][24]

### 步骤 7 - 启动 OTRS

数据库以及 OTRS 已经配置了，现在我们可以启动 OTRS。

将 otrs 的文件及目录权限设置为 `www-data` 用户和用户组。

```
/opt/otrs/bin/otrs.SetPermissions.pl --otrs-user=www-data --web-group=www-data
```

通过创建一个新的链接文件到 apache 虚拟主机目录中启用 otrs apache 配置。

```
ln -s /opt/otrs/scripts/apache2-httpd.include.conf /etc/apache2/sites-available/otrs.conf
```

启用 otrs 虚拟主机并重启 apache。

```
a2ensite otrs
systemctl restart apache2
```

确保 apache 启动没有错误。

[
 ![Enable OTRS Apache Virtual Host](https://www.howtoforge.com/images/how-to-install-otrs-opensource-trouble-ticket-system-on-ubuntu-16-04/9.png) 
][25]

### 步骤 8 - 配置 OTRS 计划任务

OTRS 已经安装并运行在 Apache Web 服务器中了，但是我们仍然需要配置 OTRS 计划任务。

登录到 `otrs` 用户，接着以 otrs 用户进入 `var/cron` 目录。

```
su - otrs
cd var/cron/
pwd
```

使用下面的命令复制所有 `.dist` 计划任务脚本：

```
for foo in *.dist; do cp $foo `basename $foo .dist`; done
```

使用 `exit` 回到 root 权限，并使用 otrs 用户启动计划任务脚本。

```
exit
/opt/otrs/bin/Cron.sh start otrs
```

[
 ![Enable OTRS Cron](https://www.howtoforge.com/images/how-to-install-otrs-opensource-trouble-ticket-system-on-ubuntu-16-04/10.png) 
][26]

接下来，手动收取电子邮件的 PostMaster 创建一个新的计划任务。我会配置为每 2 分钟收取一次邮件。

```
su - otrs
crontab -e
```

粘贴下面的配置：

```
*/2 * * * *    $HOME/bin/otrs.PostMasterMailbox.pl >> /dev/null
```

保存并退出。

现在停止 otrs 守护进程并再次启动。

```
bin/otrs.Daemon.pl stop
bin/otrs.Daemon.pl start
```

[
 ![Enable OTRS Fetching Email](https://www.howtoforge.com/images/how-to-install-otrs-opensource-trouble-ticket-system-on-ubuntu-16-04/11.png) 
][27]

OTRS 安装以及配置完成了。

### 步骤 9 - 测试 OTRS

打开你的 web 浏览器并输入你的服务器 IP 地址： [http://192.168.33.14/otrs/][28]

使用默认的用户 `root@localhost` 以及密码 `root` 登录。

[
 ![Installation Successfully OTRS Home Page](https://www.howtoforge.com/images/how-to-install-otrs-opensource-trouble-ticket-system-on-ubuntu-16-04/12.png) 
][29]

使用默认的 root 账户你会看到一个警告。点击警告信息来创建一个新的 admin root 用户。

下面是用另外的 admin root 用户登录后出现的 admin 页面，这里没有出现错误信息。

[
 ![OTRS Admin Dashboard Without Error Messages](https://www.howtoforge.com/images/how-to-install-otrs-opensource-trouble-ticket-system-on-ubuntu-16-04/13.png) 
][30]

如果你想作为客户登录，你可以使用 `customer.pl` ：[http://192.168.33.14/otrs/customer.pl][31]

你会看到客户登录界面，输入客户的用户名和密码。

[
 ![OTRS Customer Login Page](https://www.howtoforge.com/images/how-to-install-otrs-opensource-trouble-ticket-system-on-ubuntu-16-04/14.png) 
][32]

下面是一个创建新单据的客户页面。

[
 ![Customer Open Ticket](https://www.howtoforge.com/images/how-to-install-otrs-opensource-trouble-ticket-system-on-ubuntu-16-04/15.png) 
][33]

### 步骤 10 - 疑难排查

如果你仍旧看到 “OTRS Daemon is not running” 的错误，你可以像这样调试 OTRS 守护进程。

```

su - otrs
cd /opt/otrs/
```

停止 OTRS 守护进程：

```
bin/otrs.Daemon.pl stop
```

使用 `--debug` 选项启动 OTRS 守护进程。

```
bin/otrs.Daemon.pl start --debug
```

### 参考

*   [http://wiki.otterhub.org/index.php?title=Installation_on_Debian_6_with_Postgres][12][][13]
*   [http://www.geoffstratton.com/otrs-installation-5011-ubuntu-1604][14][][15]
*   [https://www.linkedin.com/pulse/ticketing-system-otrs-ubuntu-1404-muhammad-faiz-khan][16]

--------------------------------------------------------------------------------

via: https://www.howtoforge.com/tutorial/how-to-install-otrs-opensource-trouble-ticket-system-on-ubuntu-16-04/

作者：[Muhammad Arul][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.howtoforge.com/tutorial/how-to-install-otrs-opensource-trouble-ticket-system-on-ubuntu-16-04/
[1]:https://www.howtoforge.com/tutorial/how-to-install-otrs-opensource-trouble-ticket-system-on-ubuntu-16-04/#step-install-apache-and-postgresql
[2]:https://www.howtoforge.com/tutorial/how-to-install-otrs-opensource-trouble-ticket-system-on-ubuntu-16-04/#step-install-perl-modules
[3]:https://www.howtoforge.com/tutorial/how-to-install-otrs-opensource-trouble-ticket-system-on-ubuntu-16-04/#step-create-new-user-for-otrs
[4]:https://www.howtoforge.com/tutorial/how-to-install-otrs-opensource-trouble-ticket-system-on-ubuntu-16-04/#step-create-and-configure-the-database
[5]:https://www.howtoforge.com/tutorial/how-to-install-otrs-opensource-trouble-ticket-system-on-ubuntu-16-04/#step-download-and-configure-otrs
[6]:https://www.howtoforge.com/tutorial/how-to-install-otrs-opensource-trouble-ticket-system-on-ubuntu-16-04/#step-import-the-sample-database
[7]:https://www.howtoforge.com/tutorial/how-to-install-otrs-opensource-trouble-ticket-system-on-ubuntu-16-04/#step-start-otrs
[8]:https://www.howtoforge.com/tutorial/how-to-install-otrs-opensource-trouble-ticket-system-on-ubuntu-16-04/#step-configure-otrs-cronjob
[9]:https://www.howtoforge.com/tutorial/how-to-install-otrs-opensource-trouble-ticket-system-on-ubuntu-16-04/#step-testing-otrs
[10]:https://www.howtoforge.com/tutorial/how-to-install-otrs-opensource-trouble-ticket-system-on-ubuntu-16-04/#step-troubleshooting
[11]:https://www.howtoforge.com/tutorial/how-to-install-otrs-opensource-trouble-ticket-system-on-ubuntu-16-04/#reference
[12]:http://wiki.otterhub.org/index.php?title=Installation_on_Debian_6_with_Postgres
[13]:http://wiki.otterhub.org/index.php?title=Installation_on_Debian_6_with_Postgres
[14]:http://www.geoffstratton.com/otrs-installation-5011-ubuntu-1604
[15]:http://www.geoffstratton.com/otrs-installation-5011-ubuntu-1604
[16]:https://www.linkedin.com/pulse/ticketing-system-otrs-ubuntu-1404-muhammad-faiz-khan
[17]:https://www.howtoforge.com/images/how-to-install-otrs-opensource-trouble-ticket-system-on-ubuntu-16-04/big/1.png
[18]:https://www.howtoforge.com/images/how-to-install-otrs-opensource-trouble-ticket-system-on-ubuntu-16-04/big/2.png
[19]:https://www.howtoforge.com/images/how-to-install-otrs-opensource-trouble-ticket-system-on-ubuntu-16-04/big/3.png
[20]:https://www.howtoforge.com/images/how-to-install-otrs-opensource-trouble-ticket-system-on-ubuntu-16-04/big/4.png
[21]:https://www.howtoforge.com/images/how-to-install-otrs-opensource-trouble-ticket-system-on-ubuntu-16-04/big/5.png
[22]:https://www.howtoforge.com/images/how-to-install-otrs-opensource-trouble-ticket-system-on-ubuntu-16-04/big/6.png
[23]:https://www.howtoforge.com/images/how-to-install-otrs-opensource-trouble-ticket-system-on-ubuntu-16-04/big/7.png
[24]:https://www.howtoforge.com/images/how-to-install-otrs-opensource-trouble-ticket-system-on-ubuntu-16-04/big/8.png
[25]:https://www.howtoforge.com/images/how-to-install-otrs-opensource-trouble-ticket-system-on-ubuntu-16-04/big/9.png
[26]:https://www.howtoforge.com/images/how-to-install-otrs-opensource-trouble-ticket-system-on-ubuntu-16-04/big/10.png
[27]:https://www.howtoforge.com/images/how-to-install-otrs-opensource-trouble-ticket-system-on-ubuntu-16-04/big/11.png
[28]:http://192.168.33.14/otrs/
[29]:https://www.howtoforge.com/images/how-to-install-otrs-opensource-trouble-ticket-system-on-ubuntu-16-04/big/12.png
[30]:https://www.howtoforge.com/images/how-to-install-otrs-opensource-trouble-ticket-system-on-ubuntu-16-04/big/13.png
[31]:http://192.168.33.14/otrs/customer.pl
[32]:https://www.howtoforge.com/images/how-to-install-otrs-opensource-trouble-ticket-system-on-ubuntu-16-04/big/14.png
[33]:https://www.howtoforge.com/images/how-to-install-otrs-opensource-trouble-ticket-system-on-ubuntu-16-04/big/15.png

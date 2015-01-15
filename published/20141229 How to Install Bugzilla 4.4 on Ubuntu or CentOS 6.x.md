如何在Ubuntu / CentOS 6.x上安装Bugzilla 4.4
================================================================================
这里，我们将展示如何在一台Ubuntu 14.04或CentOS 6.5/7上安装Bugzilla。Bugzilla是一款基于web，用来记录跟踪缺陷数据库的bug跟踪软件，它同时是一款免费及开源软件(FOSS)，它的bug跟踪系统允许个人和开发团体有效地记录下他们产品的一些突出问题。尽管是"免费"的，Bugzilla依然有很多其它同类产品所没有的“珍贵”特性。因此，Bugzilla很快就变成了全球范围内数以千计的组织最喜欢的bug管理工具。

Bugzilla对于不同使用场景的适应能力非常强。如今它们应用在各个不同的IT领域，如系统管理中的部署管理、芯片设计及部署的问题跟踪(制造前期和后期)，还有为那些诸如Redhat，NASA，Linux-Mandrake和VA Systems这些著名公司提供软硬件bug跟踪。

### 1. 安装依赖程序 ###

安装Bugzilla相当**简单**。这篇文章特别针对Ubuntu 14.04和CentOS 6.5两个版本(不过也适用于更老的版本)。

为了获取并能在Ubuntu或CentOS系统中运行Bugzilla，我们要安装Apache网络服务器(启用SSL)，MySQL数据库服务器和一些需要来安装并配置Bugzilla的工具。

要在你的服务器上安装使用Bugzilla，你需要安装好以下程序：

- Perl(5.8.1 或以上)
- MySQL
- Apache2
- Bugzilla
- Perl模块
- 使用apache的Bugzilla

正如我们所提到的本文会阐述Ubuntu 14.04和CentOS 6.5/7两种发行版的安装过程，为此我们会分成两部分来表示。

以下就是在你的Ubuntu 14.04 LTS和CentOS 7机器安装Bugzilla的步骤：

**准备所需的依赖包：**

你需要运行以下命令来安装些必要的包：

**Ubuntu版本:**

    $ sudo apt-get install apache2 mysql-server libapache2-mod-perl2 libapache2-mod-perl2-dev libapache2-mod-perl2-doc perl postfix make gcc g++

**CentOS版本:**

    $ sudo yum install httpd mod_ssl mysql-server mysql php-mysql gcc perl* mod_perl-devel

**注意：请在shell或者终端下运行所有的命令并且确保你用root用户（sudo）操作机器。**
 
### 2. 启动Apache服务 ###

你已经按照以上步骤安装好了apache服务，那么我们现在需要配置apache服务并运行它。我们需要用sodo或root来敲命令去完成它，我们先切换到root连接。

    $ sudo -s

我们需要在防火墙中打开80端口并保存改动。

    # iptables -I INPUT -p tcp --dport 80 -j ACCEPT
    # service iptables save

现在，我们需要启动服务:

CentOS版本:

    # service httpd start

我们来确保Apache会在每次你重启机器的时候一并启动起来：

    # /sbin/chkconfig httpd on

Ubuntu版本:

    # service apache2 start

现在，由于我们已经启动了我们apache的http服务，我们就能在默认的127.0.0.1地址下打开apache服务了。

### 3. 配置MySQL服务器 ###

现在我们需要启动我们的MySQL服务：

CentOS版本:

    # chkconfig mysqld on
    # service start mysqld

Ubuntu版本:

    # service mysql-server start

![mysql](http://blog.linoxide.com/wp-content/uploads/2014/12/mysql.png)

用root用户登录连接MySQL并给Bugzilla创建一个数据库，把你的mysql密码更改成你想要的，稍后配置Bugzilla的时候会用到它。

CentOS 6.5和Ubuntu 14.04 Trusty两个版本：

    # mysql -u root -p

    # password: (You'll need to enter your password)

    # mysql > create database bugs;

    # mysql > grant all on bugs.* to root@localhost identified by "mypassword";

    #mysql > quit

**注意：请记住数据库名和mysql的密码，我们稍后会用到它们。**

### 4. 安装并配置Bugzilla ###

现在，我们所有需要的包已经设置完毕并运行起来了，我们就要配置我们的Bugzilla。

那么，首先我们要下载最新版的Bugzilla包，这里我下载的是4.5.2版本。

使用wget工具在shell或终端上下载：

    wget http://ftp.mozilla.org/pub/mozilla.org/webtools/bugzilla-4.5.2.tar.gz

你也可以从官方网站进行下载。[http://www.bugzilla.org/download/][1]

**从下载下来的bugzilla压缩包中提取文件并重命名：**

    # tar zxvf bugzilla-4.5.2.tar.gz -C /var/www/html/

    # cd /var/www/html/

    # mv -v bugzilla-4.5.2 bugzilla
 

**注意**：这里,**/var/www/html/bugzilla/**就是**Bugzilla主目录**.

现在，我们来配置buzilla：

    # cd /var/www/html/bugzilla/

# ./checksetup.pl --check-modules

![bugzilla-check-module](http://blog.linoxide.com/wp-content/uploads/2014/12/bugzilla2-300x198.png)

检查完成之后，我们会发现缺少了一些组件，我们需要安装它们，用以下命令即可实现：

    # cd /var/www/html/bugzilla
    # perl install-module.pl --all

这一步会花掉一点时间去下载安装所有依赖程序，然后再次运行**checksetup.pl --check-modules**命令来验证有没有漏装什么。

现在我们需要运行以下这条命令，它会在/var/www/html/bugzilla路径下自动生成一个名为localconfig的文件。

    # ./checksetup.pl

确认一下你刚才在localconfig文件中所输入的数据库名、用户和密码是否正确。

    # nano ./localconfig

    # checksetup.pl

![bugzilla-success](http://blog.linoxide.com/wp-content/uploads/2014/12/bugzilla-success.png)

如果一切正常，checksetup.pl现在应该就成功地配置Bugzilla了。

现在我们需要添加Bugzilla至我们的Apache配置文件中。那么，我们需要用文本编辑器打开 /etc/httpd/conf/httpd.conf 文件(CentOS版本)或者 /etc/apache2/apache2.conf 文件(Ubuntu版本)：

CentOS版本:

    # nano /etc/httpd/conf/httpd.conf

Ubuntu版本:

    # nano etc/apache2/apache2.conf

现在，我们需要配置Apache服务器，我们要把以下配置添加到配置文件里：

    <VirtualHost *:80>
         DocumentRoot /var/www/html/bugzilla/
    </VirtualHost>

    <Directory /var/www/html/bugzilla>
         AddHandler cgi-script .cgi
         Options +Indexes +ExecCGI
         DirectoryIndex index.cgi
         AllowOverride Limit FileInfo Indexes
    </Directory>

接着，我们需要编辑 .htaccess 文件并用“#”注释掉顶部“Options -Indexes”这一行。 

让我们重启我们的apache服务并测试下我们的安装情况。

CentOS版本:

    # service httpd restart

Ubuntu版本:

    # service apache2 restart

![bugzilla-install-success](http://blog.linoxide.com/wp-content/uploads/2014/12/bugzilla_apache.png)

这样，我们的Bugzilla就准备好在我们的Ubuntu 14.04 LTS和CentOS 6.5上获取bug报告了，你就可以通过本地回环地址或你网页浏览器上的IP地址来浏览bugzilla了。

--------------------------------------------------------------------------------

via: http://linoxide.com/tools/install-bugzilla-ubuntu-centos/

作者：[Arun Pyasi][a]
译者：[ZTinoZ](https://github.com/ZTinoZ)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/arunp/
[1]:http://www.bugzilla.org/download/

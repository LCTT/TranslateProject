Linux有问必答：Linux上Apache错误日志的位置在哪里？
================================================================================
> **问题**： 我尝试着解决我 Linux 系统上的 Apache Web 服务器的错误，Apache的错误日志文件放在[XX  Linux 版本]的哪个位置呢？

错误日志和访问日志文件为系统管理员提供了有用的信息，比如，为 Web 服务器排障，[保护][1]系统不受各种各样的恶意活动侵犯，或者只是进行[各种各样的][2][分析][3]以监控 HTTP 服务器。根据你 Web 服务器配置的不同，其错误/访问日志可能放在你系统中不同位置。

本文可以帮助你**找到Linux上的Apache错误日志**。

![](https://farm8.staticflickr.com/7664/16958522954_4852ab5ea5_c.jpg)

### Debian，Ubuntu或Linux Mint上的Apache错误日志位置 ###

#### 默认的错误日志 ####

在基于Debian的Linux上，系统范围的Apache错误日志默认位置是**/var/log/apache2/error.log**。默认位置可以通过编辑Apache的配置文件进行修改。

#### 自定义的错误日志 ####

要找到自定义的错误日志位置，请用文本编辑器打开 /etc/apache2/apache2.conf，然后查找以 ErrorLog 开头的行，该行指定了自定义的 Apache 错误日志文件的位置。例如，在未经修改的 Apache 配置文件中可以找到以下行：

    ErrorLog ${APACHE_LOG_DIR}/error.log

在本例中，该位置使用 APACHE_LOG_DIR 环境变量进行配置，该变量在 /etc/apache2/envvars 中已被定义。

    export APACHE_LOG_DIR=/var/log/apache2$SUFFIX

在实际情况中， ErrorLog 可能会指向你 Linux 系统中任意路径。

#### 使用虚拟主机自定义的错误日志 ####

如果在 Apache  Web 服务器中使用了虚拟主机， ErrorLog 指令可能会在虚拟主机容器内指定，在这种情况下，上面所说的系统范围的错误日志位置将被忽略。

启用了虚拟主机后，各个虚拟主机可以定义其自身的自定义错误日志位置。要找出某个特定虚拟主机的错误日志位置，你可以打开 /etc/apache2/sites-enabled/<your-site>.conf，然后查找 ErrorLog 指令，该指令会显示站点指定的错误日志文件。

### CentOS，Fedora或RHEL上的Apache错误日志位置 ###

#### 默认的错误日志 ####

在基于 Red Hat 的Linux中，系统范围的 Apache 错误日志文件默认被放置在**/var/log/httpd/error_log**。该默认位置可以通过修改 Apache 配置文件进行自定义。

#### 自定义的错误日志 ####

要找出 Apache 错误日志的自定义位置，请用文本编辑器打开 /etc/httpd/conf/httpd.conf，然后查找 ServerRoot，该参数显示了 Apache  Web 服务器目录树的顶层，日志文件和配置都位于该目录树中。例如：

    ServerRoot "/etc/httpd"

现在，查找 ErrorLog 开头的行，该行指出了 Apache Web 服务器将错误日志写到了哪里去。注意，指定的位置是 ServerRoot 值的相对位置。例如：

    ErrorLog "log/error_log"

结合上面的两个指令，可以获得完整的错误日志路径，默认情况下该路径就是 /etc/httpd/logs/error_log。在全新安装的Apache中，这是一个到 /var/log/httpd/error_log 的符号链接。

在实际情况中， ErrorLog 可能指向你 Linux 系统中的任意位置。

#### 使用虚拟主机自定义的错误日志 ####

如果你启用了虚拟主机，你可以通过检查 /etc/httpd/conf/httpd.conf（或其它任何定义了虚拟主机的文件）来找到各个虚拟主机的错误日志位置。在独立的虚拟主机部分查找 ErrorLog。如，在下面的虚拟主机部分，错误日志的位置是 /var/www/xmodulo.com/logs/error_log。

    <VirtualHost *:80>
        ServerAdmin webmaster@xmodulo.com
        DocumentRoot /var/www/xmodulo.com/public_html
        ServerName www.xmodulo.com
        ServerAlias xmodulo.com
        ErrorLog /var/www/xmodulo.com/logs/error_log
        CustomLog /var/www/xmodulo.com/logs/access_log
    <VirtualHost>

--------------------------------------------------------------------------------

via: http://ask.xmodulo.com/apache-error-log-location-linux.html

作者：[Dan Nanni][a]
译者：[GOLinux](https://github.com/GOLinux)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://ask.xmodulo.com/author/nanni
[1]:https://linux.cn/article-5068-1.html
[2]:https://linux.cn/article-5352-1.html
[3]:https://linux.cn/article-4405-1.html

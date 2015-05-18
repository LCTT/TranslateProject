Linux FAQs with Answers--What is the Apache error log location on Linux
================================================================================
> **Question**: I am trying to troubleshoot Apache web server errors on my Linux system. Where is the Apache error log file located on [insert your Linux distro]?

Error log and access log files are a useful piece of information for system admins, for example to troubleshoot their web server, [protect][1] it from various malicious activities, or just to run [various][2] [analytics][3] for HTTP server monitoring. Depending on your web server setup, its error/access logs may be found in different places on your system.

This post may help you **find Apache error log location on Linux**.

![](https://farm8.staticflickr.com/7664/16958522954_4852ab5ea5_c.jpg)

### Apache Error Log Location on Debian, Ubuntu or Linux Mint ###

#### Default Error Log ####

On Debian-based Linux, the system-wide default location of Apache error log is **/var/log/apache2/error.log**. The default location can be customized by editing Apache configuration file.

#### Custom Error Log ####

To find a custom error log location, open /etc/apache2/apache2.conf with a text editor, and look for a line that starts with ErrorLog. This line specifies a custom location of Apache error log file. For example, the unmodified Apache configuration file has the following line:

    ErrorLog ${APACHE_LOG_DIR}/error.log

In this case, the location is configured using APACHE_LOG_DIR environment variable, which is defined in /etc/apache2/envvars.

    export APACHE_LOG_DIR=/var/log/apache2$SUFFIX

In reality, ErrorLog may point to any arbitrary path on your Linux system.

#### Custom Error Log with VirtualHost ####

If VirtualHost is used in Apache web server, ErrorLog directive can be specified within VirtualHost container, in which case the system-wide error log location described above will be ignored.

With VirtualHost enabled, each VirtualHost can define its own custom error log location. To find out the error log location of a particular VirtualHost, you can open /etc/apache2/sites-enabled/<your-site>.conf, and look for ErrorLog directive, which will show a site-specific error log file.

### Apache Error Log Location on CentOS, Fedora or RHEL ###

#### Default Error Log ####

On Red Hat based Linux, a system-wide Apache error log file is by default placed in **/var/log/httpd/error_log**. This default location can be customized by editing Apache configuration file.

#### Custom Error Log ####

To find out the custom location of Apache error log, open /etc/httpd/conf/httpd.conf with a text editor, and look for ServerRoot, which shows the top of the Apache server directory tree, under which log files and configurations are located. For example:

    ServerRoot "/etc/httpd"

Now look for a line that starts with ErrorLog, which indicates where Apache web server is writing its error logs. Note that the specified location is relative to the ServerRoot value. For example:

    ErrorLog "log/error_log"

Combine the above two directives to obtain the full path of an error log, which is by default /etc/httpd/logs/error_log. This is a symlink to /var/log/httpd/error_log with freshly installed Apache.

In reality, ErrorLog may point to any arbitrary location on your Linux system.

#### Custom Error Log with VirtualHost ####

If you enabled VirtualHost, you can find the error log location of individual VirtualHosts by checking /etc/httpd/conf/httpd.conf (or any file where VirtualHost is defined). Look for ErrorLog inside individual VirtualHost sections. For example, in the following VirtualHost section, an error log is found in /var/www/xmodulo.com/logs/error_log.

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
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://ask.xmodulo.com/author/nanni
[1]:http://xmodulo.com/configure-fail2ban-apache-http-server.html
[2]:http://xmodulo.com/interactive-apache-web-server-log-analyzer-linux.html
[3]:http://xmodulo.com/sql-queries-apache-log-files-linux.html
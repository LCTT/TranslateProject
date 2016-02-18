grep 命令系列：如何只查看配置文件中未被注释的有效配置行
=========================================================

大多数的Linux和类Unix系统的配置文件中都有许多的注释行，但是有时候我只想看其中的有效配置行。那我怎么才能只看到quid.conf或httpd.conf这样的配置文件中的非注释命令行呢？怎么去掉这些注释或者空行呢？

我们可以使用 UNIX/BSD/OS X/Linux 这些操作系统自身提供的 grep，sed，awk，perl或者其他文本处理工具来查看配置文件中的有效配置命令行。

### grep 命令示例——去掉注释 ###

可以按照如下示例使用grep命令:

    $ grep -v "^#" /path/to/config/file
    $ grep -v "^#" /etc/apache2/apache2.conf

示例输出:

    ServerRoot "/etc/apache2"
     
    LockFile /var/lock/apache2/accept.lock
     
    PidFile ${APACHE_PID_FILE}
     
    Timeout 300
     
    KeepAlive On
     
    MaxKeepAliveRequests 100
     
    KeepAliveTimeout 15
     
     
    <IfModule mpm_prefork_module>
        StartServers          5
        MinSpareServers       5
        MaxSpareServers      10
        MaxClients          150
        MaxRequestsPerChild   0
    </IfModule>
     
    <IfModule mpm_worker_module>
        StartServers          2
        MinSpareThreads      25
        MaxSpareThreads      75
        ThreadLimit          64
        ThreadsPerChild      25
        MaxClients          150
        MaxRequestsPerChild   0
    </IfModule>
     
    <IfModule mpm_event_module>
        StartServers          2
        MaxClients          150
        MinSpareThreads      25
        MaxSpareThreads      75
        ThreadLimit          64
        ThreadsPerChild      25
        MaxRequestsPerChild   0
    </IfModule>
    
    User ${APACHE_RUN_USER}
    Group ${APACHE_RUN_GROUP}
     
     
    AccessFileName .htaccess
     
    <Files ~ "^\.ht">
        Order allow,deny
        Deny from all
        Satisfy all
    </Files>
     
    DefaultType text/plain
     
     
    HostnameLookups Off
     
    ErrorLog /var/log/apache2/error.log
     
    LogLevel warn
     
    Include /etc/apache2/mods-enabled/*.load
    Include /etc/apache2/mods-enabled/*.conf
     
    Include /etc/apache2/httpd.conf
     
    Include /etc/apache2/ports.conf
     
    LogFormat "%v:%p %h %l %u %t \"%r\" %>s %O \"%{Referer}i\" \"%{User-Agent}i\"" vhost_combined
    LogFormat "%h %l %u %t \"%r\" %>s %O \"%{Referer}i\" \"%{User-Agent}i\"" combined
    LogFormat "%h %l %u %t \"%r\" %>s %O" common
    LogFormat "%{Referer}i -> %U" referer
    LogFormat "%{User-agent}i" agent
     
    CustomLog /var/log/apache2/other_vhosts_access.log vhost_combined
     
     
     
    Include /etc/apache2/conf.d/
     
    Include /etc/apache2/sites-enabled/

想要跳过其中的空行，可以使用 [egrep 命令][1], 示例:

    egrep -v "^#|^$" /etc/apache2/apache2.conf
    ## or pass it to the page such as more or less ##
    egrep -v "^#|^$" /etc/apache2/apache2.conf | less
     
    ## Bash function ######################################
    ## or create function or alias and use it as follows ##
    ## viewconfig /etc/squid/squid.conf                  ##
    #######################################################
    viewconfig(){
       local f="$1"
       [ -f "$1" ] && command egrep -v "^#|^$" "$f" || echo "Error $1 file not found."
    }

示例输出:

![Fig.01: Unix/Linux Egrep Strip Out Comments Blank Lines](http://s0.cyberciti.org/uploads/faq/2008/05/grep-strip-out-comments-blank-lines.jpg)

*图 01: Unix/Linux Egrep 除去注释行和空行*

###  理解 grep/egrep 命令行选项 ###

-v 选项，选择出不匹配的命令行。该选项适用于所有基于posix的系统。正则表达式 `^$` 匹配出所有的非空行， `^#` 匹配出所有的不以“#”开头的非注释行。

### sed 命令示例 ###

可以按照如下示例使用 GNU 上的 sed 命令:

    $ sed '/ *#/d; /^ *$/d' /path/to/file
    $ sed '/ *#/d; /^ *$/d' /etc/apache2/apache2.conf
    
GNU 或 BSD 上的 sed 也可以修改配置文件。下面的命令的作用是原地编辑文件，并以特定（比如 .bak）备份文件：

    sed -i'.bak.2015.12.27' '/ *#/d; /^ *$/d' /etc/apache2/apache2.conf

更多信息见参考手册 - [grep(1)][2], [sed(1)][3]。

--------------------------------------------------------------------------------

via: http://www.cyberciti.biz/faq/shell-display-uncommented-lines-only/

作者：Vivek Gite
译者：[sonofelice](https://github.com/sonofelice)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[1]:http://www.cyberciti.biz/faq/grep-regular-expressions/
[2]:http://www.manpager.com/linux/man1/grep.1.html
[3]:http://www.manpager.com/linux/man1/sed.1.html
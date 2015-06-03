如何在 Docker 容器中架设一个完整的 WordPress 站点
================================================================================

大家好，今天我们来学习一下如何在 Docker 容器里运行的 Nginx Web 服务器中安装 WordPress。WordPress 是一个很好的免费开源的内容管理系统，全球成千上万的网站都在使用它。[Docker][1] 是一个开源项目，提供了一个可以打包、装载和运行任何应用的轻量级容器的开放平台。它没有语言支持、框架和打包系统的限制，从小型的家用电脑到高端服务器，在何时何地都可以运行。这使它们可以不依赖于特定软件栈和供应商，像一块块积木一样部署和扩展网络应用、数据库和后端服务。

今天，我们会在 docker 容器上部署最新的 WordPress 软件包，包括需要的前提条件，例如 Nginx Web 服务器、PHP5、MariaDB 服务器等。下面是在运行在 Docker 容器上成功安装 WordPress 的简单步骤。

### 1. 安装 Docker ###

在我们真正开始之前，我们需要确保在我们的 Linux 机器上已经安装了 Docker。我们使用的主机是 CentOS 7，因此我们用下面的命令使用 yum 管理器安装 docker。

    # yum install docker

![安装 Docker](http://blog.linoxide.com/wp-content/uploads/2015/03/installing-docker.png)

    # systemctl restart docker.service

### 2. 创建 WordPress 的 Dockerfile ###

我们需要创建用于自动安装 wordpress 以及其前置需求的 Dockerfile。这个 Dockerfile 将用于构建 WordPress 的安装镜像。这个 WordPress Dockerfile 会从 Docker Registry Hub 获取 CentOS 7 镜像并用最新的可用更新升级系统。然后它会安装必要的软件，例如 Nginx Web 服务器、PHP、MariaDB、Open SSH 服务器，以及其它保证 Docker 容器正常运行不可缺少的组件。最后它会执行一个初始化 WordPress 安装的脚本。

    # nano Dockerfile

然后，我们需要将下面的配置行添加到 Dockerfile中。

    FROM centos:centos7
    MAINTAINER The CentOS Project <cloud-ops@centos.org>

    RUN yum -y update; yum clean all
    RUN yum -y install epel-release; yum clean all
    RUN yum -y install mariadb mariadb-server mariadb-client nginx php-fpm php-cli php-mysql php-gd php-imap php-ldap php-odbc php-pear php-xml php-xmlrpc php-magickwand php-magpierss php-mbstring php-mcrypt php-mssql php-shout php-snmp php-soap php-tidy php-apc pwgen python-setuptools curl git tar; yum clean all
    ADD ./start.sh /start.sh
    ADD ./nginx-site.conf /nginx.conf
    RUN mv /nginx.conf /etc/nginx/nginx.conf
    RUN rm -rf /usr/share/nginx/html/*
    RUN /usr/bin/easy_install supervisor
    RUN /usr/bin/easy_install supervisor-stdout
    ADD ./supervisord.conf /etc/supervisord.conf
    RUN echo %sudo ALL=NOPASSWD: ALL >> /etc/sudoers
    ADD http://wordpress.org/latest.tar.gz /wordpress.tar.gz
    RUN tar xvzf /wordpress.tar.gz
    RUN mv /wordpress/* /usr/share/nginx/html/.
    RUN chown -R apache:apache /usr/share/nginx/
    RUN chmod 755 /start.sh
    RUN mkdir /var/run/sshd

    EXPOSE 80
    EXPOSE 22

    CMD ["/bin/bash", "/start.sh"]

![Wordpress Docker 文件](http://blog.linoxide.com/wp-content/uploads/2015/03/Dockerfile-wordpress.png)

### 3. 创建启动脚本 ###

我们创建了 Dockerfile 之后，我们需要创建用于运行和配置 WordPress 安装的脚本，名称为 start.sh。它会为 WordPress 创建并配置数据库和密码。用我们喜欢的文本编辑器打开 start.sh。

    # nano start.sh

打开 start.sh 之后，我们要添加下面的配置行到文件中。

    #!/bin/bash

    __check() {
    if [ -f /usr/share/nginx/html/wp-config.php ]; then
    exit
    fi
    }

    __create_user() {
    # 创建用于 SSH 登录的用户
    SSH_USERPASS=`pwgen -c -n -1 8`
    useradd -G wheel user
    echo user:$SSH_USERPASS | chpasswd
    echo ssh user password: $SSH_USERPASS
    }

    __mysql_config() {
    # 启用并运行 MySQL
    yum -y erase mariadb mariadb-server
    rm -rf /var/lib/mysql/ /etc/my.cnf
    yum -y install mariadb mariadb-server
    mysql_install_db
    chown -R mysql:mysql /var/lib/mysql
    /usr/bin/mysqld_safe &
    sleep 10
    }

    __handle_passwords() {
    # 在这里我们生成随机密码(多亏了 pwgen)。前面两个用于 mysql 用户，最后一个用于 wp-config.php 的随机密钥。
    WORDPRESS_DB="wordpress"
    MYSQL_PASSWORD=`pwgen -c -n -1 12`
    WORDPRESS_PASSWORD=`pwgen -c -n -1 12`
    # 这是在日志中显示的密码。
    echo mysql root password: $MYSQL_PASSWORD
    echo wordpress password: $WORDPRESS_PASSWORD
    echo $MYSQL_PASSWORD > /mysql-root-pw.txt
    echo $WORDPRESS_PASSWORD > /wordpress-db-pw.txt
    # 这里原来是一个包括 sed、cat、pipe 和 stuff 的很长的行，但多亏了
    #  @djfiander 的 https://gist.github.com/djfiander/6141138
    # 现在没有了
    sed -e "s/database_name_here/$WORDPRESS_DB/
    s/username_here/$WORDPRESS_DB/
    s/password_here/$WORDPRESS_PASSWORD/
    /'AUTH_KEY'/s/put your unique phrase here/`pwgen -c -n -1 65`/
    /'SECURE_AUTH_KEY'/s/put your unique phrase here/`pwgen -c -n -1 65`/
    /'LOGGED_IN_KEY'/s/put your unique phrase here/`pwgen -c -n -1 65`/
    /'NONCE_KEY'/s/put your unique phrase here/`pwgen -c -n -1 65`/
    /'AUTH_SALT'/s/put your unique phrase here/`pwgen -c -n -1 65`/
    /'SECURE_AUTH_SALT'/s/put your unique phrase here/`pwgen -c -n -1 65`/
    /'LOGGED_IN_SALT'/s/put your unique phrase here/`pwgen -c -n -1 65`/
    /'NONCE_SALT'/s/put your unique phrase here/`pwgen -c -n -1 65`/" /usr/share/nginx/html/wp-config-sample.php > /usr/share/nginx/html/wp-config.php
    }

    __httpd_perms() {
    chown apache:apache /usr/share/nginx/html/wp-config.php
    }

    __start_mysql() {
    # systemctl 启动 mysqld 服务
    mysqladmin -u root password $MYSQL_PASSWORD
    mysql -uroot -p$MYSQL_PASSWORD -e "CREATE DATABASE wordpress; GRANT ALL PRIVILEGES ON wordpress.* TO 'wordpress'@'localhost' IDENTIFIED BY '$WORDPRESS_PASSWORD'; FLUSH PRIVILEGES;"
    killall mysqld
    sleep 10
    }

    __run_supervisor() {
    supervisord -n
    }

    # 调用所有函数
    __check
    __create_user
    __mysql_config
    __handle_passwords
    __httpd_perms
    __start_mysql
    __run_supervisor

![启动脚本](http://blog.linoxide.com/wp-content/uploads/2015/03/start-script.png)

增加完上面的配置之后，保存并关闭文件。

### 4. 创建配置文件 ###

现在，我们需要创建 Nginx Web 服务器的配置文件，命名为 nginx-site.conf。

    # nano nginx-site.conf

然后，增加下面的配置信息到配置文件。

    user nginx;
    worker_processes 1;

    error_log /var/log/nginx/error.log;
    #error_log /var/log/nginx/error.log notice;
    #error_log /var/log/nginx/error.log info;

    pid /run/nginx.pid;
    events {
    worker_connections 1024;
    }
    http {
    include /etc/nginx/mime.types;
    default_type application/octet-stream;

    log_format main '$remote_addr - $remote_user [$time_local] "$request" '
    '$status $body_bytes_sent "$http_referer" '
    '"$http_user_agent" "$http_x_forwarded_for"';

    access_log /var/log/nginx/access.log main;

    sendfile on;
    #tcp_nopush on;

    #keepalive_timeout 0;
    keepalive_timeout 65;

    #gzip on;

    index index.html index.htm index.php;

    # Load modular configuration files from the /etc/nginx/conf.d directory.
    # See http://nginx.org/en/docs/ngx_core_module.html#include
    # for more information.
    include /etc/nginx/conf.d/*.conf;

    server {
    listen 80;
    server_name localhost;

    #charset koi8-r;

    #access_log logs/host.access.log main;
    root /usr/share/nginx/html;

    #error_page 404 /404.html;

    # redirect server error pages to the static page /50x.html
    #
    error_page 500 502 503 504 /50x.html;
    location = /50x.html {
    root html;
    }

    # proxy the PHP scripts to Apache listening on 127.0.0.1:80
    #
    #location ~ \.php$ {
    # proxy_pass http://127.0.0.1;
    #}

    # pass the PHP scripts to FastCGI server listening on 127.0.0.1:9000
    #
    location ~ \.php$ {

    root /usr/share/nginx/html;
    try_files $uri =404;
    fastcgi_pass 127.0.0.1:9000;
    fastcgi_index index.php;
    fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
    include fastcgi_params;
    }

    # deny access to .htaccess files, if Apache's document root
    # concurs with nginx's one
    #
    #location ~ /\.ht {
    # deny all;
    #}

    }
    }

![Nginx 配置](http://blog.linoxide.com/wp-content/uploads/2015/03/nginx-conf.png)

现在，创建 supervisor.conf 文件并添加下面的行。

    # nano supervisord.conf

然后，添加以下行。

    [unix_http_server]
    file=/tmp/supervisor.sock ; (the path to the socket file)

    [supervisord]
    logfile=/tmp/supervisord.log ; (main log file;default $CWD/supervisord.log)
    logfile_maxbytes=50MB ; (max main logfile bytes b4 rotation;default 50MB)
    logfile_backups=10 ; (num of main logfile rotation backups;default 10)
    loglevel=info ; (log level;default info; others: debug,warn,trace)
    pidfile=/tmp/supervisord.pid ; (supervisord pidfile;default supervisord.pid)
    nodaemon=false ; (start in foreground if true;default false)
    minfds=1024 ; (min. avail startup file descriptors;default 1024)
    minprocs=200 ; (min. avail process descriptors;default 200)

    ; the below section must remain in the config file for RPC
    ; (supervisorctl/web interface) to work, additional interfaces may be
    ; added by defining them in separate rpcinterface: sections
    [rpcinterface:supervisor]
    supervisor.rpcinterface_factory = supervisor.rpcinterface:make_main_rpcinterface

    [supervisorctl]
    serverurl=unix:///tmp/supervisor.sock ; use a unix:// URL for a unix socket

    [program:php-fpm]
    command=/usr/sbin/php-fpm -c /etc/php/fpm
    stdout_events_enabled=true
    stderr_events_enabled=true

    [program:php-fpm-log]
    command=tail -f /var/log/php-fpm/php-fpm.log
    stdout_events_enabled=true
    stderr_events_enabled=true

    [program:mysql]
    command=/usr/bin/mysql --basedir=/usr --datadir=/var/lib/mysql --plugin-dir=/usr/lib/mysql/plugin --user=mysql --log-error=/var/log/mysql/error.log --pid-file=/var/run/mysqld/mysqld.pid --socket=/var/run/mysqld/mysqld.sock --port=3306
    stdout_events_enabled=true
    stderr_events_enabled=true

    [program:nginx]
    command=/usr/sbin/nginx
    stdout_events_enabled=true
    stderr_events_enabled=true

    [eventlistener:stdout]
    command = supervisor_stdout
    buffer_size = 100
    events = PROCESS_LOG
    result_handler = supervisor_stdout:event_handler

![Supervisord 配置](http://blog.linoxide.com/wp-content/uploads/2015/03/supervisord.png)

添加完后，保存并关闭文件。

### 5. 构建 WordPress 容器 ###

现在，完成了创建配置文件和脚本之后，我们终于要使用 Dockerfile 来创建安装最新的 WordPress CMS（译者注：Content Management System，内容管理系统）所需要的容器，并根据配置文件进行配置。做到这点，我们需要在对应的目录中运行以下命令。

    # docker build --rm -t wordpress:centos7 .

![构建 WordPress 容器](http://blog.linoxide.com/wp-content/uploads/2015/03/building-wordpress-container.png)

### 6. 运行 WordPress 容器 ###

现在，执行以下命令运行新构建的容器，并为 Nginx Web 服务器和 SSH 访问打开88 和 22号相应端口 。

    # CID=$(docker run -d -p 80:80 wordpress:centos7)

![运行 WordPress Docker](http://blog.linoxide.com/wp-content/uploads/2015/03/run-wordpress-docker.png)

运行以下命令检查进程以及容器内部执行的命令。

    #  echo "$(docker logs $CID )"

运行以下命令检查端口映射是否正确。

    # docker ps

![docker 状态](http://blog.linoxide.com/wp-content/uploads/2015/03/docker-state.png)

### 7. Web 界面 ###

最后如果一切正常的话，当我们用浏览器打开 http://ip-address/ 或者 http://mywebsite.com/ 的时候会看到 WordPress 的欢迎界面。

![启动Wordpress](http://blog.linoxide.com/wp-content/uploads/2015/03/wordpress-start.png)

现在，我们将通过 Web 界面为 WordPress 面板设置 WordPress 的配置、用户名和密码。

![Wordpress 欢迎界面](http://blog.linoxide.com/wp-content/uploads/2015/03/wordpress-welcome.png)

然后，用上面用户名和密码输入到 WordPress 登录界面。

![wordpress 登录](http://blog.linoxide.com/wp-content/uploads/2015/03/wordpress-login.png)

### 总结 ###

我们已经成功地在以 CentOS 7 作为 docker OS 的 LEMP 栈上构建并运行了 WordPress CMS。从安全层面来说，在容器中运行 WordPress 对于宿主系统更加安全可靠。这篇文章介绍了在 Docker 容器中运行的 Nginx Web 服务器上使用 WordPress 的完整配置。如果你有任何问题、建议、反馈，请在下面的评论框中写下来，让我们可以改进和更新我们的内容。非常感谢！Enjoy :-) 

--------------------------------------------------------------------------------

via: http://linoxide.com/linux-how-to/install-wordpress-nginx-docker-container/

作者：[Arun Pyasi][a]
译者：[ictlyh](https://github.com/ictlyh)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/arunp/
[1]:http://docker.io/
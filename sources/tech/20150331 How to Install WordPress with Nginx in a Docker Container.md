How to Install WordPress with Nginx in a Docker Container
================================================================================
Hi all, today we'll learn how to install WordPress running Nginx Web Server in a Docker Container. WordPress is an awesome free and open source Content Management System running thousands of websites throughout the globe. [Docker][1] is an Open Source project that provides an open platform to pack, ship and run any application as a lightweight container. It has no boundaries of Language support, Frameworks or packaging system and can be run anywhere, anytime from a small home computers to high-end servers. It makes them great building blocks for deploying and scaling web apps, databases, and back-end services without depending on a particular stack or provider.

Today, we'll deploy a docker container with the latest WordPress package with necessary prerequisites ie Nginx Web Server, PHP5, MariaDB Server, etc. Here are some short and sweet steps to successfully install a WordPress running Nginx in a Docker Container.

### 1. Installing Docker ###

Before we really start, we'll need to make sure that we have Docker installed in our Linux machine. Here, we are running CentOS 7 as host so, we'll be running yum manager to install docker using the below command.

    # yum install docker

![Installing Docker](http://blog.linoxide.com/wp-content/uploads/2015/03/installing-docker.png)

    # systemctl restart docker.service

### 2. Creating WordPress Dockerfile ###

We'll need to create a Dockerfile which will automate the installation of the wordpress and its necessary pre-requisites. This Dockerfile will be used to build the image of WordPress installation we created. This WordPress Dockerfile fetches a CentOS 7 image from the Docker Registry Hub and updates the system with the latest available packages. It then installs the necessary softwares like Nginx Web Server, PHP, MariaDB, Open SSH Server and more which are essential for the Docker Container to work. It then executes a script which will initialize the installation of WordPress out of the box.

    # nano Dockerfile

Then, we'll need to add the following lines of configuration inside that Dockerfile.

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

![Wordpress Dockerfile](http://blog.linoxide.com/wp-content/uploads/2015/03/Dockerfile-wordpress.png)

### 3. Creating Start script ###

After we create our Dockerfile, we'll need to create a script named start.sh which will run and configure our WordPress installation. It will create and configure database, passwords for wordpress. To create it, we'll need to open start.sh with our favorite text editor.

    # nano start.sh

After opening start.sh, we'll need to add the following lines of configuration into it.

    #!/bin/bash

    __check() {
    if [ -f /usr/share/nginx/html/wp-config.php ]; then
    exit
    fi
    }

    __create_user() {
    # Create a user to SSH into as.
    SSH_USERPASS=`pwgen -c -n -1 8`
    useradd -G wheel user
    echo user:$SSH_USERPASS | chpasswd
    echo ssh user password: $SSH_USERPASS
    }

    __mysql_config() {
    # Hack to get MySQL up and running... I need to look into it more.
    yum -y erase mariadb mariadb-server
    rm -rf /var/lib/mysql/ /etc/my.cnf
    yum -y install mariadb mariadb-server
    mysql_install_db
    chown -R mysql:mysql /var/lib/mysql
    /usr/bin/mysqld_safe &
    sleep 10
    }

    __handle_passwords() {
    # Here we generate random passwords (thank you pwgen!). The first two are for mysql users, the last batch for random keys in wp-config.php
    WORDPRESS_DB="wordpress"
    MYSQL_PASSWORD=`pwgen -c -n -1 12`
    WORDPRESS_PASSWORD=`pwgen -c -n -1 12`
    # This is so the passwords show up in logs.
    echo mysql root password: $MYSQL_PASSWORD
    echo wordpress password: $WORDPRESS_PASSWORD
    echo $MYSQL_PASSWORD > /mysql-root-pw.txt
    echo $WORDPRESS_PASSWORD > /wordpress-db-pw.txt
    # There used to be a huge ugly line of sed and cat and pipe and stuff below,
    # but thanks to @djfiander's thing at https://gist.github.com/djfiander/6141138
    # there isn't now.
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
    # systemctl start mysqld.service
    mysqladmin -u root password $MYSQL_PASSWORD
    mysql -uroot -p$MYSQL_PASSWORD -e "CREATE DATABASE wordpress; GRANT ALL PRIVILEGES ON wordpress.* TO 'wordpress'@'localhost' IDENTIFIED BY '$WORDPRESS_PASSWORD'; FLUSH PRIVILEGES;"
    killall mysqld
    sleep 10
    }

    __run_supervisor() {
    supervisord -n
    }

    # Call all functions
    __check
    __create_user
    __mysql_config
    __handle_passwords
    __httpd_perms
    __start_mysql
    __run_supervisor

![Start Script](http://blog.linoxide.com/wp-content/uploads/2015/03/start-script.png)

After adding the above configuration, we'll need to save it and then exit.

### 4. Creating Configuration files ###

Now, we'll need to create configuration file for Nginx Web Server named nginx-site.conf .

    # nano nginx-site.conf

Then, we'll add the following configuration to the config file.

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

![Nginx configuration](http://blog.linoxide.com/wp-content/uploads/2015/03/nginx-conf.png)

Now, we'll create supervisord.conf file and add the following lines as shown below.

    # nano supervisord.conf

Then, add the following lines.

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

![Supervisord Configuration](http://blog.linoxide.com/wp-content/uploads/2015/03/supervisord.png)

After adding, we'll save and exit the file.

### 5. Building WordPress Container ###

Now, after done with creating configurations and scripts, we'll now finally use the Dockerfile to build our desired container with the latest WordPress CMS installed and configured according to the configuration. To do so, we'll run the following command in that directory.

    # docker build --rm -t wordpress:centos7 .

![Building WordPress Container](http://blog.linoxide.com/wp-content/uploads/2015/03/building-wordpress-container.png)

### 6. Running WordPress Container ###

Now, to run our newly built container and open port 80 and 22 for Nginx Web Server and SSH access respectively, we'll run the following command.

    # CID=$(docker run -d -p 80:80 wordpress:centos7)

![Run WordPress Docker](http://blog.linoxide.com/wp-content/uploads/2015/03/run-wordpress-docker.png)

To check the process and commands executed inside the container, we'll run the following command.

    #  echo "$(docker logs $CID )"

TO check if the port mapping is correct or not, run the following command.

    # docker ps

![docker state](http://blog.linoxide.com/wp-content/uploads/2015/03/docker-state.png)

### 7. Web Interface ###

Finally if everything went accordingly, we'll be welcomed with WordPress when pointing the browser to http://ip-address/ or http://mywebsite.com/ .

![Wordpress Start](http://blog.linoxide.com/wp-content/uploads/2015/03/wordpress-start.png)

Now, we'll go step wise through the web interface and setup wordpress configuration, username and password for the WordPress Panel. 

![Wordpress Welcome](http://blog.linoxide.com/wp-content/uploads/2015/03/wordpress-welcome.png)

Then, use the username and password entered above into the WordPress Login page.

![wordpress login](http://blog.linoxide.com/wp-content/uploads/2015/03/wordpress-login.png)

### Conclusion ###

We successfully built and run WordPress CMS under LEMP Stack running in CentOS 7 Operating System as the docker OS. Running WordPress inside a container makes a lot safe and secure to the host system from the security perspective. This article enables one to completely configure WordPress to run under Docker Container with Nginx Web Server. If you have any questions, suggestions, feedback please write them in the comment box below so that we can improve or update our contents. Thank you ! Enjoy :-) 

--------------------------------------------------------------------------------

via: http://linoxide.com/linux-how-to/install-wordpress-nginx-docker-container/

作者：[Arun Pyasi][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/arunp/
[1]:http://docker.io/
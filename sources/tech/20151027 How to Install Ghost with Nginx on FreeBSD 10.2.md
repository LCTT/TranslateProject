ictlyh Translating
How to Install Ghost with Nginx on FreeBSD 10.2
================================================================================
Node.js is open source runtime environment for developing the server-side applications. Node.js application is written in javascript and can be run on the server that running Node.js runtime. It is cross-platform runtime, running on Linux, Windows, OSX, IBM AIX, including FreeBSD. Node.js was created by Ryan Dahl and other developer working at Joyent on 2009. It is designed to build scalable network applications.

Ghost is blogging platform coded in Node.js. It is open source publishing platform with beautifully designed, user-friendly, and free. It is allows you to easily publish your content on web, or create your portofolio website.

In this tutorial we will install a Ghost with Nginx as our web server on FreeBSD. We will install Node.js, Npm, nginx and sqlite3 on FreeBSD 10.2.

### Step 1 - Install Node.js npm and Sqlite3 ###

If you want to running ghost on your server, you must install node.js. In this section we will install node.js from the freebsd ports collection, please go to the ports directory "/usr/ports/www/node" and install by running command "**make**".

    cd /usr/ports/www/node
    make install clean

If you've done with node.js installation, please switch to the npm directory and install it. **npm** is Package manager for installs, publishes and manages node programs.

    cd /usr/ports/www/npm/
    make install clean

Next, please install sqlite3. By default ghost is use sqlite3 as the database system, but it is support too for mysql/mariadb and postgresql. We will use sqlite3 as the default database.

    cd /usr/ports/databases/sqlite3/
    make install clean

If all is installed, please check the version of node.js and npm :

    node --version
    v0.12.6

    npm --version
    2.11.3

    sqlite3 --version
    3.8.10.2

![node and npm version](http://blog.linoxide.com/wp-content/uploads/2015/10/node-and-npm-version.png)

### Step 2 - Add Ghost User ###

We will install and running ghost under normal users called "**ghost**". please create new user with "adduser" command :

    adduser ghost
    FILL With Your INFO

![Add user Ghost](http://blog.linoxide.com/wp-content/uploads/2015/10/Add-user-Ghost.png)

### Step 3 - Installing Ghost ###

We will install ghost under "**/var/www/**" directory, so let's create it and then go to the installation directory :

    mkdir -p /var/www/
    cd /var/www/

Download ghost latest version with wget command :

    wget --no-check-certificate https://ghost.org/zip/ghost-latest.zip

Extract it to the directory called "**ghost**" :

    unzip -d ghost ghost-latest.zip

Next, change the owner as user "**ghost**", we will run and install it under that user.

    chown -R ghost:ghost ghost/

If all is done, switch the user to "**ghost**" by typing command below :

    su - ghost

Then go to the installation directory "/var/www/ghost/" :

    cd /var/www/ghost/

And before install ghost, we need a sqlit3 modules for node js, install it with npm command :

    setenv CXX c++ ; npm install sqlite3 --sqlite=/usr/local

**Note : Run as "ghost" user, not root user.**

And now we ready to install ghost, please install it with npm command :

    npm install --production

Next, copy the configuration file "config.example.js" to "**config.js**", then edit it with nano editor :

    cp config.example.js config.js
    nano -c config.js

change on line 25 server block :

    host: '0.0.0.0',

Save and exit.

Now run ghost with command below :

    npm start --production

And test by visiting the server ip and port 2368.

![Ghost Installed](http://blog.linoxide.com/wp-content/uploads/2015/10/Ghost-Installed.png)

Ghost is installed on directory "/var/www/ghost", under user "ghost".

### Step 4 - Run Ghost as FreeBSD Services ###

To run an application as service on freebsd, you need to add the script to the rc.d directory. we will create new service script for ghost in directory "**/usr/local/etc/rc.d/**".

Before we create the services script, we need to install a node.js module for running ghost as service, install forever module with npm command **as sudo/root** privileges :

    npm install forever -g

Now please go to the rc.d directory and create new file called ghost there :

    cd /usr/local/etc/rc.d/
    nano -c ghost

Paste service script below :

    #!/bin/sh

    # PROVIDE: ghost
    # KEYWORD: shutdown
    PATH="/sbin:/bin:/usr/sbin:/usr/bin:/usr/local/sbin:/usr/local/bin"

    . /etc/rc.subr

    name="ghost"
    rcvar="ghost_enable"
    extra_commands="status"

    load_rc_config ghost
    : ${ghost_enable:="NO"}

    status_cmd="ghost_status"
    start_cmd="ghost_start"
    stop_cmd="ghost_stop"
    restart_cmd="ghost_restart"

    ghost="/var/www/ghost"
    log="/var/log/ghost/ghost.log"
    ghost_start() {
    sudo -u ghost sh -c "cd $ghost && NODE_ENV=production forever start -al $log index.js"
    }

    ghost_stop() {
    sudo -u ghost sh -c "cd $ghost && NODE_ENV=production forever stop index.js"
    }

    ghost_status() {
    sudo -u ghost sh -c "NODE_ENV=production forever list"
    }

    ghost_restart() {
    ghost_stop;
    ghost_start;
    }

    run_rc_command "$1"

Save and exit.

Next, make ghost service script an executable :

    chmod +x ghost

and create new directory and file for ghost log, and change the owner to ghost user :

    mkdir -p /var/www/ghost/
    touch /var/www/ghost/ghost.log
    chown -R /var/www/ghost/

And the last if you want to run ghost service, you need to add ghost service to the boot time/startup application with sysrc command :

    sysrc ghost_enable=yes

and start ghost with :

    service ghost start

Other command :

    service ghost stop
    service ghost status
    service ghost restart

![Ghost service command](http://blog.linoxide.com/wp-content/uploads/2015/10/Ghost-service-command.png)

### Step 5 - Install and Configure Nginx for Ghost ###

By default, ghost running standalone,, you can run it without Nginx, apache or IIS webserver. But in this tutorial we will install and configre nginx to work with Ghost.

Please install nginx from the freebsd repository with pkg command :

    pkg install nginx

Next, go to nginx configuration directory and make new directory for virtualhost configuration.

    cd /usr/local/etc/nginx/
    mkdir virtualhost/

go to the virtualhost directory, make new file called ghost.conf with nano editor :

    cd virtualhost/
    nano -c ghost.conf

Paste virtualhost configuration below :

    server {
    listen 80;

    #Your Domain
    server_name ghost.me;

    location ~* \.(?:ico|css|js|gif|jpe?g|png|ttf|woff)$ {
    access_log off;
    expires 30d;
    add_header Pragma public;
    add_header Cache-Control "public, mustrevalidate, proxy-revalidate";
    proxy_pass http://127.0.0.1:2368;
    }

    location / {
    add_header X-XSS-Protection "1; mode=block";
    add_header Cache-Control "public, max-age=0";
    add_header Content-Security-Policy "script-src 'self' ; font-src 'self' ; connect-src 'self' ; block-all-mixed-content; reflected-xss block; referrer no-referrer";
    add_header X-Content-Type-Options nosniff;
    add_header X-Frame-Options DENY;
    proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
    proxy_set_header Host $http_host;
    proxy_set_header X-Forwarded-Proto $scheme;
    proxy_pass http://127.0.0.1:2368;
    }

    location = /robots.txt { access_log off; log_not_found off; }
    location = /favicon.ico { access_log off; log_not_found off; }

    location ~ /\.ht {
    deny all;
    }

    }

Save and exit.

To activate the virtualhost configuration, you need to include that file to the **nginx.conf**. please go to nginx configuration directory and edit nginx.conf file :

    cd /usr/local/etc/nginx/
    nano -c nginx.conf

Before the last line, include the virtualhost configuration directory :

    [......]

    include virtualhost/*.conf;

    }

Save and exit.

Test nginx configuration with command "**nginx -t**", if there is no error, add nginx to the start up with command sysrc :

    sysrc nginx_enable=yes

and start nginx :

    service nginx start

Now test all nginx and virtualhost configuration. please open your browser and type the : ghost.me

![ghost.me successfully](http://blog.linoxide.com/wp-content/uploads/2015/10/ghost.me-successfully.png)

Ghost.me is running successfully.

If you want to check the nginx server, use "**curl**" command.

![ghost and nginx test](http://blog.linoxide.com/wp-content/uploads/2015/10/ghost-and-nginx-test.png)

Ghost is running with nginx.

### Conclusion ###

Node.js is runtime environment created by Ryan Dahl for creating and developing scalable server-side applications. Ghost is open-source blogging platform coded in node.js, it is come with beautifully designed and easy to use for everyone. By default, the ghost is a web application that can stand on its own, does not require a webserver apache, nginx or IIS, but we can also integrate with a web server(In this tutorial use Nginx). Sqlite is default database used by ghost, but it supupport too for mysql/mariadb and postgresql. Ghost is fast and easy to use for you and configure.

--------------------------------------------------------------------------------

via: http://linoxide.com/linux-how-to/install-ghost-nginx-freebsd-10-2/

作者：[Arul][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/arulm/
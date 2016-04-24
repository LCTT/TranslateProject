如何在 FreeBSD 10.2 上安装使用 Nginx 的 Ghost
================================================================================
Node.js 是用于开发服务器端应用程序的开源的运行时环境。Node.js 应用使用 JavaScript 编写，能在任何有 Node.js 运行时的服务器上运行。它跨平台支持 Linux、Windows、OSX、IBM AIX，也包括 FreeBSD。Node.js 是 Ryan Dahl 以及在 Joyent 工作的其他开发者于 2009 年创建的。它的设计目标就是构建可扩展的网络应用程序。

Ghost 是使用 Node.js 编写的博客平台。它不仅开源，而且有很漂亮的界面设计、对用户友好并且免费。它允许你快速地在网络上发布内容，或者创建你的混合网站。

在这篇指南中我们会在 FreeBSD 上安装使用 Nginx 作为 web 服务器的 Ghost。我们会在 FreeBSD 10.2 上安装 Node.js、Npm、nginx 和 sqlite3。

### 第一步 - 安装 Node.js npm 和 Sqlite3 ###

如果你想在你的服务器上运行 ghost，你必须安装 node.js。在这一部分，我们会从 freebsd 移植软件库中安装 node.js，请进入库目录 "/usr/ports/www/node" 并通过运行命令 "**make**" 安装。

    cd /usr/ports/www/node
    make install clean

如果你已经安装了 node.js，那就进入到 npm 目录并安装它。**npm** 是用于安装、发布和管理 node 程序的软件包管理器。

    cd /usr/ports/www/npm/
    make install clean

下一步，安装 sqlite3。默认情况下 ghost 使用 sqlite3 作为数据库系统，但它也支持 mysql/mariadb 和 postgresql。我们会使用 sqlite3 作为默认数据库。

    cd /usr/ports/databases/sqlite3/
    make install clean

如果安装完了所有软件，还有检查 node.js 和 npm 的版本：

    node --version
    v0.12.6

    npm --version
    2.11.3

    sqlite3 --version
    3.8.10.2

![node 和 npm 版本](http://blog.linoxide.com/wp-content/uploads/2015/10/node-and-npm-version.png)

### 第二步 - 添加 Ghost 用户 ###

我们会以普通用户 "**ghost**" 身份安装和运行 ghost。用 "adduser" 命令添加新用户：

    adduser ghost
    FILL With Your INFO

![添加用户 Ghost](http://blog.linoxide.com/wp-content/uploads/2015/10/Add-user-Ghost.png)

### 第三步 - 安装 Ghost ###

我们会把 ghost 安装到 "**/var/www/**" 目录，首先新建目录然后进入到安装目录：

    mkdir -p /var/www/
    cd /var/www/

用 wget 命令下载最新版本的 ghost：

    wget --no-check-certificate https://ghost.org/zip/ghost-latest.zip

把它解压到 "**ghost**" 目录：

    unzip -d ghost ghost-latest.zip

下一步，更改属主为 "**ghost**"，我们会以这个用户安装和运行它。

    chown -R ghost:ghost ghost/

都做完了的话，通过输入以下命令切换到 "**ghost**" 用户：

    su - ghost

然后进入到安装目录"/var/www/ghost/"：

    cd /var/www/ghost/

在安装 ghost 之前，我们需要为 node.js 安装 sqlite3 模块，用 npm 命令安装：

    setenv CXX c++ ; npm install sqlite3 --sqlite=/usr/local

**注意： 以 “ghost” 用户运行，而不是 root 用户。**

现在，我们准备好安装 ghost 了，用 npm 命令安装：

    npm install --production

下一步，复制配置文件 "config.example.js" 为 "**config.js**"，用 nano 编辑器编辑：

    cp config.example.js config.js
    nano -c config.js

更改 server 模块的第 25 行：

    host: '0.0.0.0',

保存并退出。

现在用下面的命令运行 ghost：

    npm start --production

通过访问服务器 ip 和 2368 号端口验证一下。

![Ghost 安装完成](http://blog.linoxide.com/wp-content/uploads/2015/10/Ghost-Installed.png)

以 “ghost” 用户在 "/var/www/ghost" 目录安装了 ghost。

### 第四步 - 作为 FreeBSD 服务运行 Ghost ###

要在 freebsd 上以服务形式运行应用，你需要在 rc.d 目录添加脚本。我们会在 "**/usr/local/etc/rc.d/**" 目录为 ghost 创建新的服务脚本。

在创建服务脚本之前，为了以服务形式运行 ghost，我们需要安装一个 node.js 模块，用 npm 命令以 **sudo/root** 权限安装 forever 模块：

    npm install forever -g

现在进入到 rc.d 目录并创建名为 ghost 的新文件：

    cd /usr/local/etc/rc.d/
    nano -c ghost

粘贴下面的服务脚本：

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

保存并退出。

下一步，给 ghost 服务脚本添加可执行权限：

    chmod +x ghost

为 ghost 日志创建新的目录和文件，并把属主修改为 ghost 用户：

    mkdir -p /var/www/ghost/
    touch /var/www/ghost/ghost.log
    chown -R /var/www/ghost/

最后，如果你想运行 ghost 服务，你需要用 sysrc 命令添加 ghost 服务到开机启动应用程序：

    sysrc ghost_enable=yes

用以下命令启动 ghost：

    service ghost start

其它命令：

    service ghost stop
    service ghost status
    service ghost restart

![Ghost 服务命令](http://blog.linoxide.com/wp-content/uploads/2015/10/Ghost-service-command.png)

### 第五步 - 为 Ghost 安装和配置 Nginx ###

默认情况下，ghost 会以独立模式运行，你可以不用 Nginx、apache 或 IIS web 服务器直接运行它。但在这篇指南中我们会安装和配置 nginx 和 ghost 一起使用。

用 pkg 命令从 freebsd 库中安装 nginx：

    pkg install nginx

下一步，进入 nginx 配置目录并为 virtualhost 配置创建新的目录。

    cd /usr/local/etc/nginx/
    mkdir virtualhost/

进入 virtualhost 目录，用 nano 编辑器创建名为 ghost.conf 的新文件：

    cd virtualhost/
    nano -c ghost.conf

粘贴下面的 virtualhost 配置：

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

保存并退出。

要启用 virtualhost 配置，你需要把那个文件添加到 **nginx.conf**。进入 nginx 配置目录并编辑 nginx.conf 文件：

    cd /usr/local/etc/nginx/
    nano -c nginx.conf

在最后一行的前面，包含 virtualhost 配置目录：

    [......]

    include virtualhost/*.conf;

    }

保存并退出。

用命令 "**nginx -t**" 测试 nginx 配置，如果没有错误，用 sysrc 添加 nginx 到开机启动：

    sysrc nginx_enable=yes

并启动 nginx：

    service nginx start

现在测试所有 nginx 和 virtualhost 配置。请打开你的浏览器并输入： ghost.me

![ghost.me 成功运行](http://blog.linoxide.com/wp-content/uploads/2015/10/ghost.me-successfully.png)

Ghost.me 正在成功运行。

如果你想要检查 nginx 服务器，可以使用 "**curl**" 命令。

![测试 ghost 和 nginx](http://blog.linoxide.com/wp-content/uploads/2015/10/ghost-and-nginx-test.png)

Ghost 正在 nginx 上运行。

### 总结 ###

Node.js 是 Ryan Dahl 为创建和开发可扩展服务器端应用程序创建的运行时环境。Ghost 是使用 node.js 编写的开源博客平台，它有漂亮的外观设计并且易于使用。默认情况下，ghost 是可以单独运行的 web 应用程序，并不需要类似 apache、nginx 或 IIS 之类的 web 服务器，但我们也可以和 web 服务器集成（在这篇指南中使用 Nginx）。Sqlite 是 ghost 默认使用的数据库，它还支持 msql/mariadb 和 postgresql。Ghost 能快速部署并且易于使用和配置。

--------------------------------------------------------------------------------

via: http://linoxide.com/linux-how-to/install-ghost-nginx-freebsd-10-2/

作者：[Arul][a]
译者：[ictlyh](http://mutouxiaogui.cn/blog/)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/arulm/
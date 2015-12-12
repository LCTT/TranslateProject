
在 Centos/RHEL 6.X 上安装 Wetty
================================================================================
![](http://www.unixmen.com/wp-content/uploads/2015/11/Terminal.png)

Wetty 是什么?

作为系统管理员，如果你是在 Linux 桌面下，你可能会使用一个软件来连接远程服务器，像 GNOME 终端（或类似的），如果你是在 Windows 下，你可能会使用像 Putty 这样的 SSH 客户端来连接，并同时可以在浏览器中查收邮件等做其他事情。

### 第1步: 安装 epel 源 ###

    # wget http://download.fedoraproject.org/pub/epel/6/i386/epel-release-6-8.noarch.rpm
    # rpm -ivh epel-release-6-8.noarch.rpm

### 第2步：安装依赖 ###

    # yum install epel-release git nodejs npm -y

### 第3步：在安装完依赖后，克隆 GitHub 仓库 ###

    # git clone https://github.com/krishnasrinivas/wetty

### 第4步：运行 Wetty ###

    # cd wetty
    # npm install

### 第5步：从 Web 浏览器启动 Wetty 并访问 Linux 终端 ###

    # node app.js -p 8080

### 第6步：为 Wetty 安装 HTTPS 证书 ###

    # openssl req -x509 -newkey rsa:2048 -keyout key.pem -out cert.pem -days 365 -nodes (complete this)

### Step 7: 通过 HTTPS 来使用 Wetty ###

    # nohup node app.js --sslkey key.pem --sslcert cert.pem -p 8080 &

### Step 8: 为 wetty 添加一个用户 ###

    # useradd <username>
    # Passwd <username>

### 第9步：访问 wetty ###

    http://Your_IP-Address:8080
    give the credential have created before for wetty and access

到此结束！

--------------------------------------------------------------------------------

via: http://www.unixmen.com/install-wetty-centosrhel-6-x/

作者：[Debojyoti Das][a]
译者：[strugglingyouth](https://github.com/strugglingyouth)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.unixmen.com/author/debjyoti/

在 Centos/RHEL 6.X 上安装 Wetty
================================================================================
![](http://www.unixmen.com/wp-content/uploads/2015/11/Terminal.png)

**Wetty 是什么?**

Wetty = Web + tty

作为系统管理员，如果你是在 Linux 桌面下，你可以用它像一个 GNOME 终端（或类似的）一样来连接远程服务器；如果你是在 Windows 下，你可以用它像使用 Putty 这样的 SSH 客户端一样来连接远程，然后同时可以在浏览器中上网并查收邮件等其它事情。

（LCTT 译注：简而言之，这是一个基于 Web 浏览器的远程终端）

![](https://github.com/krishnasrinivas/wetty/raw/master/terminal.png)

### 第1步: 安装 epel 源 ###

    # wget http://download.fedoraproject.org/pub/epel/6/i386/epel-release-6-8.noarch.rpm
    # rpm -ivh epel-release-6-8.noarch.rpm

### 第2步：安装依赖 ###

    # yum install epel-release git nodejs npm -y
    
（LCTT 译注：对，没错，是用 node.js 编写的）

### 第3步：在安装完依赖后，克隆 GitHub 仓库 ###

    # git clone https://github.com/krishnasrinivas/wetty

### 第4步：运行 Wetty ###

    # cd wetty
    # npm install

### 第5步：从 Web 浏览器启动 Wetty 并访问 Linux 终端 ###

    # node app.js -p 8080

### 第6步：为 Wetty 安装 HTTPS 证书 ###

    # openssl req -x509 -newkey rsa:2048 -keyout key.pem -out cert.pem -days 365 -nodes 
    
(等待完成)

### 第7步：通过 HTTPS 来使用 Wetty ###

    # nohup node app.js --sslkey key.pem --sslcert cert.pem -p 8080 &

### 第8步：为 wetty 添加一个用户 ###

    # useradd <username>
    # Passwd <username>

### 第9步：访问 wetty ###

    http://Your_IP-Address:8080
    
输入你之前为 wetty 创建的证书然后访问。

到此结束！

--------------------------------------------------------------------------------

via: http://www.unixmen.com/install-wetty-centosrhel-6-x/

作者：[Debojyoti Das][a]
译者：[strugglingyouth](https://github.com/strugglingyouth)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.unixmen.com/author/debjyoti/

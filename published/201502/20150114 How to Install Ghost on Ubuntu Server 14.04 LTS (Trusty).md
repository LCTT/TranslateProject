如何在Ubuntu Server 14.04 LTS(Trusty) 上安装Ghost
================================================================================
今天我们将会在Ubuntu Server 14.04 LTS (Trusty)上安装一个博客平台Ghost。

Ghost是一款设计优美的发布平台，很容易使用且对任何人都免费。它是免费的开源软件（FOSS），它的源码在Github上。截至2015年1月（LCTT 译注：原文为2014，应为2015），它的界面很简单还有分析面板。编辑使用的是很便利的分屏显示。

因此有了这篇步骤明确的在Ubuntu Server上安装Ghost的教程：

### 1. 升级Ubuntu ###

第一步是运行Ubuntu软件升级并安装一系列需要的额外包。

    sudo apt-get update
    sudo apt-get upgrade -y
    sudo aptitude install -y build-essential zip vim wget

### 2. 下载并安装 Node.js 源码 ###

    wget http://nodejs.org/dist/node-latest.tar.gz
    tar -xzf node-latest.tar.gz
    cd node-v*

现在，我们使用下面的命令安装Node.js：

    ./configure
    make
    sudo make install

### 3. 下载并安装Ghost ###

    sudo mkdir -p /var/www/
    cd /var/www/
    sudo wget https://ghost.org/zip/ghost-latest.zip
    sudo unzip -d ghost ghost-latest.zip
    cd ghost/
    sudo npm install --production

### 4. 配置Ghost ###

    sudo nano config.example.js

在“Production”字段，将：

    host: '127.0.0.1',

修改成

    host: '0.0.0.0',

### 创建Ghost用户 ###

    sudo adduser --shell /bin/bash --gecos 'Ghost application' ghost
    sudo chown -R ghost:ghost /var/www/ghost/

现在启动Ghost，你需要以“ghost”用户登录。

    su - ghost
    cd /var/www/ghost/

现在，你已经以“ghost”用户登录，并可启动Ghost：

    npm start --production

--------------------------------------------------------------------------------

via: http://linoxide.com/ubuntu-how-to/install-ghost-ubuntu-server-14-04/

作者：[Arun Pyasi][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/arunp/
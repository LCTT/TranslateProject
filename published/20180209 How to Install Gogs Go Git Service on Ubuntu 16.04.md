如何在 Ubuntu 安装 Go 语言编写的 Git 服务器 Gogs 
======

Gogs 是由 Go 语言编写的，自由开源的 Git 服务。Gogs 是一款无痛式自托管的 Git 服务器，能在尽可能小的硬件资源开销上搭建并运行您的私有 Git 服务器。Gogs 的网页界面和 GitHub 十分相近，且提供 MySQL、PostgreSQL 和 SQLite 数据库支持。

在本教程中，我们将使用 Gogs 在 Ununtu 16.04 上按步骤指导您安装和配置您的私有 Git 服务器。这篇教程中涵盖了如何在 Ubuntu 上安装 Go 语言、PostgreSQL 和安装并且配置 Nginx 网页服务器作为 Go 应用的反向代理的细节内容。

### 搭建环境

  * Ubuntu 16.04
  * Root 权限

### 我们将会接触到的事物

  1. 更新和升级系统
  2. 安装和配置 PostgreSQL
  3. 安装 Go 和 Git
  4. 安装 Gogs
  5. 配置 Gogs
  6. 运行 Gogs 服务器
  7. 安装和配置 Nginx 反向代理
  8. 测试

### 步骤 1 - 更新和升级系统

继续之前，更新 Ubuntu 所有的库，升级所有包。

运行下面的 `apt` 命令：

```
sudo apt update
sudo apt upgrade
```

### 步骤 2 - 安装和配置 PostgreSQL

Gogs 提供 MySQL、PostgreSQL、SQLite 和 TiDB 数据库系统支持。

此步骤中，我们将使用 PostgreSQL 作为 Gogs 程序的数据库。

使用下面的 `apt` 命令安装 PostgreSQL。

```
sudo apt install -y postgresql postgresql-client libpq-dev
```

安装完成之后，启动 PostgreSQL 服务并设置为开机启动。

```
systemctl start postgresql
systemctl enable postgresql
```

此时 PostgreSQL 数据库在 Ubuntu 系统上完成安装了。

之后，我们需要为 Gogs 创建数据库和用户。

使用 `postgres` 用户登录并运行 `psql` 命令以访问 PostgreSQL 操作界面。

```
su - postgres
psql
```

创建一个名为 `git` 的新用户，给予此用户 `CREATEDB` 权限。

```
CREATE USER git CREATEDB;
\password git
```

创建名为 `gogs_production` 的数据库，设置 `git` 用户作为其所有者。 

```
CREATE DATABASE gogs_production OWNER git;
```

[![创建 Gogs 数据库][1]][2]

用于 Gogs 的 `gogs_production` PostgreSQL 数据库和 `git` 用户已经创建完毕。

### 步骤 3 - 安装 Go 和 Git

使用下面的 `apt` 命令从库中安装 Git。

```
sudo apt install git
```

此时，为系统创建名为 `git` 的新用户。

```
sudo adduser --disabled-login --gecos 'Gogs' git
```

登录 `git` 账户并且创建名为 `local` 的目录。

```
su - git
mkdir -p /home/git/local
```

切换到 `local` 目录，依照下方所展示的内容，使用 `wget` 命令下载 Go（最新版）。

```
cd ~/local
wget https://dl.google.com/go/go1.9.2.linux-amd64.tar.gz
```

[![安装 Go 和 Git][3]][4]

解压并且删除 go 的压缩文件。

```
tar -xf go1.9.2.linux-amd64.tar.gz
rm -f go1.9.2.linux-amd64.tar.gz
```

Go 二进制文件已经被下载到 `~/local/go` 目录。此时我们需要设置环境变量 - 设置 `GOROOT` 和 `GOPATH` 目录到系统环境，这样，我们就可以在 `git` 用户下执行 `go` 命令。

执行下方的命令。

```
cd ~/
echo 'export GOROOT=$HOME/local/go' >> $HOME/.bashrc
echo 'export GOPATH=$HOME/go' >> $HOME/.bashrc
echo 'export PATH=$PATH:$GOROOT/bin:$GOPATH/bin' >> $HOME/.bashrc
```

之后通过运行 `source ~/.bashrc` 重载 Bash，如下：

```
source ~/.bashrc
```

确定您使用的 Bash 是默认的 shell。

[![安装 Go 编程语言][5]][6]

现在运行 `go` 的版本查看命令。

```
go version
```

之后确保您得到下图所示的结果。

[![检查 go 版本][7]][8]

现在，Go 已经安装在系统的 `git` 用户下了。

### 步骤 4 - 使用 Gogs 安装 Git 服务

使用 `git` 用户登录并且使用 `go` 命令从 GitHub 下载 Gogs。

```
su - git
go get -u github.com/gogits/gogs
```

此命令将在 `GOPATH/src` 目录下载 Gogs 的所有源代码。

切换至 `$GOPATH/src/github.com/gogits/gogs` 目录，并且使用下列命令搭建 Gogs。

```
cd $GOPATH/src/github.com/gogits/gogs
go build
```

确保您没有遇到错误。

现在使用下面的命令运行 Gogs Go Git 服务器。

```
./gogs web
```

此命令将会默认运行 Gogs 在 3000 端口上。

[![安装 Gogs Go Git 服务][9]][10]

打开网页浏览器，键入您的 IP 地址和端口号，我的是 http://192.168.33.10:3000/ 。

您应该会得到与下方一致的反馈。

[![Gogs 网页服务器][11]][12]

Gogs 已经在您的 Ubuntu 系统上安装完毕。现在返回到您的终端，并且键入 `Ctrl + C` 中止服务。

### 步骤 5 - 配置 Gogs Go Git 服务器

本步骤中，我们将为 Gogs 创建惯例配置。

进入 Gogs 安装目录并新建 `custom/conf` 目录。

```
cd $GOPATH/src/github.com/gogits/gogs
mkdir -p custom/conf/
```

复制默认的配置文件到 `custom` 目录，并使用 [vim][13] 修改。

```
cp conf/app.ini custom/conf/app.ini
vim custom/conf/app.ini
```

在 `[server]` 小节中，修改 `HOST_ADDR` 为 `127.0.0.1`。

```
[server]
 PROTOCOL = http
 DOMAIN = localhost
 ROOT_URL = %(PROTOCOL)s://%(DOMAIN)s:%(HTTP_PORT)s/
 HTTP_ADDR = 127.0.0.1
 HTTP_PORT = 3000
```

在 `[database]` 选项中，按照您的数据库信息修改。

```
[database]
 DB_TYPE = postgres
 HOST = 127.0.0.1:5432
 NAME = gogs_production
 USER = git
 PASSWD = aqwe123@#
```

保存并退出。

运行下面的命令验证配置项。

```
./gogs web
```

并且确保您得到如下的结果。

[![配置服务器][14]][15]

Gogs 现在已经按照自定义配置下运行在 `localhost` 的 3000 端口上了。

### 步骤 6 - 运行 Gogs 服务器

这一步，我们将在 Ubuntu 系统上配置 Gogs 服务器。我们会在 `/etc/systemd/system` 目录下创建一个新的服务器配置文件 `gogs.service`。

切换到 `/etc/systemd/system` 目录，使用 [vim][13] 创建服务器配置文件 `gogs.service`。

```
cd /etc/systemd/system
vim gogs.service
```

粘贴下面的代码到 Gogs 服务器配置文件中。

```
[Unit]
Description=Gogs
After=syslog.target
After=network.target
After=mariadb.service mysqld.service postgresql.service memcached.service redis.service

[Service]
# Modify these two values and uncomment them if you have
# repos with lots of files and get an HTTP error 500 because
# of that
###
#LimitMEMLOCK=infinity
#LimitNOFILE=65535
Type=simple
User=git
Group=git
WorkingDirectory=/home/git/go/src/github.com/gogits/gogs
ExecStart=/home/git/go/src/github.com/gogits/gogs/gogs web
Restart=always
Environment=USER=git HOME=/home/git

[Install]
WantedBy=multi-user.target
```

之后保存并且退出。

现在可以重载系统服务器。

```
systemctl daemon-reload
```

使用下面的命令开启 Gogs 服务器并设置为开机启动。

```
systemctl start gogs
systemctl enable gogs
```

[![运行 Gogs 服务器][16]][17]

Gogs 服务器现在已经运行在 Ubuntu 系统上了。

使用下面的命令检测：

```
netstat -plntu
systemctl status gogs
```

您应该会得到下图所示的结果。

[![Gogs is listening on the network interface][18]][19]

### 步骤 7 - 为 Gogs 安装和配置 Nginx 反向代理

在本步中，我们将为 Gogs 安装和配置 Nginx 反向代理。我们会在自己的库中调用 Nginx 包。

使用下面的命令添加 Nginx 库。

```
sudo add-apt-repository -y ppa:nginx/stable
```

此时更新所有的库并且使用下面的命令安装 Nginx。

```
sudo apt update
sudo apt install nginx -y
```

之后，进入 `/etc/nginx/sites-available` 目录并且创建虚拟主机文件 `gogs`。

```
cd /etc/nginx/sites-available
vim gogs
```

粘贴下面的代码到配置文件。

```
server {
     listen 80;
     server_name git.hakase-labs.co;

     location / {
         proxy_pass http://localhost:3000;
     }
 }
```

保存退出。

**注意:** 请使用您的域名修改 `server_name` 项。

现在激活虚拟主机并且测试 nginx 配置。

```
ln -s /etc/nginx/sites-available/gogs /etc/nginx/sites-enabled/
nginx -t
```

确保没有遇到错误，重启 Nginx 服务器。

```
systemctl restart nginx
```

[![安装和配置 Nginx 反向代理][20]][21]

### 步骤 8 - 测试

打开您的网页浏览器并且输入您的 Gogs URL，我的是 http://git.hakase-labs.co

现在您将进入安装界面。在页面的顶部，输入您所有的 PostgreSQL 数据库信息。

[![Gogs 安装][22]][23]

之后，滚动到底部，点击 “Admin account settings” 下拉选项。

输入您的管理者用户名和邮箱。

[![键入 gogs 安装设置][24]][25]

之后点击 “Install Gogs” 按钮。

然后您将会被重定向到下图显示的 Gogs 用户面板。

[![Gogs 面板][26]][27]

下面是 Gogs 的 “Admin Dashboard（管理员面板）”。

[![浏览 Gogs 面板][28]][29]

现在，Gogs 已经通过 PostgreSQL 数据库和 Nginx 网页服务器在您的 Ubuntu 16.04 上完成安装。

--------------------------------------------------------------------------------

via: https://www.howtoforge.com/tutorial/how-to-install-gogs-go-git-service-on-ubuntu-1604/

作者：[Muhammad Arul][a]
译者：[CYLeft](https://github.com/CYLeft)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.howtoforge.com/tutorial/server-monitoring-with-shinken-on-ubuntu-16-04/
[1]:https://www.howtoforge.com/images/how_to_install_gogs_go_git_service_on_ubuntu_1604/1.png
[2]:https://www.howtoforge.com/images/how_to_install_gogs_go_git_service_on_ubuntu_1604/big/1.png
[3]:https://www.howtoforge.com/images/how_to_install_gogs_go_git_service_on_ubuntu_1604/2.png
[4]:https://www.howtoforge.com/images/how_to_install_gogs_go_git_service_on_ubuntu_1604/big/2.png
[5]:https://www.howtoforge.com/images/how_to_install_gogs_go_git_service_on_ubuntu_1604/3.png
[6]:https://www.howtoforge.com/images/how_to_install_gogs_go_git_service_on_ubuntu_1604/big/3.png
[7]:https://www.howtoforge.com/images/how_to_install_gogs_go_git_service_on_ubuntu_1604/4.png
[8]:https://www.howtoforge.com/images/how_to_install_gogs_go_git_service_on_ubuntu_1604/big/4.png
[9]:https://www.howtoforge.com/images/how_to_install_gogs_go_git_service_on_ubuntu_1604/5.png
[10]:https://www.howtoforge.com/images/how_to_install_gogs_go_git_service_on_ubuntu_1604/big/5.png
[11]:https://www.howtoforge.com/images/how_to_install_gogs_go_git_service_on_ubuntu_1604/6.png
[12]:https://www.howtoforge.com/images/how_to_install_gogs_go_git_service_on_ubuntu_1604/big/6.png
[13]:https://www.howtoforge.com/vim-basics
[14]:https://www.howtoforge.com/images/how_to_install_gogs_go_git_service_on_ubuntu_1604/7.png
[15]:https://www.howtoforge.com/images/how_to_install_gogs_go_git_service_on_ubuntu_1604/big/7.png
[16]:https://www.howtoforge.com/images/how_to_install_gogs_go_git_service_on_ubuntu_1604/8.png
[17]:https://www.howtoforge.com/images/how_to_install_gogs_go_git_service_on_ubuntu_1604/big/8.png
[18]:https://www.howtoforge.com/images/how_to_install_gogs_go_git_service_on_ubuntu_1604/9.png
[19]:https://www.howtoforge.com/images/how_to_install_gogs_go_git_service_on_ubuntu_1604/big/9.png
[20]:https://www.howtoforge.com/images/how_to_install_gogs_go_git_service_on_ubuntu_1604/10.png
[21]:https://www.howtoforge.com/images/how_to_install_gogs_go_git_service_on_ubuntu_1604/big/10.png
[22]:https://www.howtoforge.com/images/how_to_install_gogs_go_git_service_on_ubuntu_1604/11.png
[23]:https://www.howtoforge.com/images/how_to_install_gogs_go_git_service_on_ubuntu_1604/big/11.png
[24]:https://www.howtoforge.com/images/how_to_install_gogs_go_git_service_on_ubuntu_1604/12.png
[25]:https://www.howtoforge.com/images/how_to_install_gogs_go_git_service_on_ubuntu_1604/big/12.png
[26]:https://www.howtoforge.com/images/how_to_install_gogs_go_git_service_on_ubuntu_1604/13.png
[27]:https://www.howtoforge.com/images/how_to_install_gogs_go_git_service_on_ubuntu_1604/big/13.png
[28]:https://www.howtoforge.com/images/how_to_install_gogs_go_git_service_on_ubuntu_1604/14.png
[29]:https://www.howtoforge.com/images/how_to_install_gogs_go_git_service_on_ubuntu_1604/big/14.png

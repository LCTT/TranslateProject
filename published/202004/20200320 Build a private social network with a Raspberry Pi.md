[#]: collector: (lujun9972)
[#]: translator: (lxbwolf)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12120-1.html)
[#]: subject: (Build a private social network with a Raspberry Pi)
[#]: via: (https://opensource.com/article/20/3/raspberry-pi-open-source-social)
[#]: author: (Giuseppe Cassibba https://opensource.com/users/peppe8o)

用树莓派搭建一个私人社交网络
======

> 手把手教你怎样以低成本的硬件和简易步骤搭建自己的社交网络。

![Team of people around the world][1]

近年来，社交网络已经革新了人们的生活习惯。人们每天都会使用社交频道与朋友和家人联系。但是涉及到隐私和数据安全时，仍有一些共同的问题。尽管社交网络创建了复杂的隐私策略来保护用户的信息，但如果你不想自己的信息被泄露，最好的办法还是把数据保存在自己的服务器上。

一个树莓派 — 多才多艺的 Raspbian Lite 版本就可以让你搭建很多有用的家庭服务（参照我的文章[树莓派项目][2]）。通过搜索开源软件你就可以实现一些令人痴迷的功能，你也可以用这个神奇的设备来感受那些功能。其中一个有趣的尝试就是在你的树莓派上安装 OSSN。

### OSSN 是什么？

<ruby>[开源社交网络][3]<rt>OpenSource Social Network</rt></ruby>（OSSN）是用 PHP 写的一个快速开发社交网络软件，让你可以搭建自己的社交网站。OSSN 可以用来搭建不同类型的社交应用，如：

  * 私人内部网
  * 公用/公开网络
  * 社区

OSSN 支持的功能：

  * 照片
  * 个人资料
  * 朋友圈
  * 表情
  * 搜索
  * 聊天

OSSN 运行在 LAMP 服务器上。硬件需求很简单，却能提供强大的用户界面，也友好支持移动端。

### 我们需要准备什么

这个项目很简单，而且由于我们只安装远程 Web 服务，因此我们只需要一些便宜的零件就够了。我使用的是树莓派 3B+，但是用树莓派 3A+ 或其他更新的板应该也可以。

硬件：

  * 带有电源模块的树莓派 3B+
  * 一张 SD 卡（最好是性能好点的卡，至少 16 GB）
  * 一台有 SFTP 软件（如免费的 [Filezilla][4]）的桌面 PC，用来把安装包传到你的树莓派上

### 操作步骤

我们首先搭建一个传统的 LAMP 服务器，然后配置数据库用户和安装 OSSN。

#### 1、安装 Raspbian Buster Lite 操作系统

你可以直接参照我的文章[在你的树莓派上安装 Raspbian Buster Lite][5]。

为了确保你的系统是最新的，ssh 登录到树莓派后在终端输入下面的命令：

```bash
sudo apt-get update
sudo apt-get upgrade
```

#### 2、安装 LAMP 服务

LAMP（Linux–Apache–Mysql–Php）服务通常与 MySQL 数据库配合。在我们的项目中，我们选择 MariaDB，因为它更轻量，完美支持树莓派。

安装 Apache 服务：

```
sudo apt-get install apache2 -y
```

你可以通过在浏览器输入 `http://<<YouRpiIPAddress>>` 来检查 Apache 是否安装正确：

![][6]

安装 PHP：

```
sudo apt-get install php -y
```

安装 MariaDB 服务和 PHP connector：

```
sudo apt-get install mariadb-server php-mysql -y
```

安装 phpMyAdmin：

在 OSSN 中 phpMyAdmin 不是强制安装的，但我建议你安装，因为它可以简化数据库的管理。

```
sudo apt-get install phpmyadmin
```

在 phpMyAdmin 配置界面，执行以下步骤：

  * 按下空格和 “OK” 选择 apache（强制）。
  * 在 dbconfig-common 选择“Yes”，配置 phpMyAdmin 的数据库。
  * 输入想设置的密码，按下 “OK”。
  * 再次输入 phpMyAdmin 密码来确认，按下 “OK”。

为 phpMyAdmin 用户添加数据库权限来管理数据库：

我们用 root 用户连接 MariaDB（默认没有密码）来设置权限。

```
sudo mysql -uroot -p
grant all privileges on *.* to 'phpmyadmin'@'localhost';
flush privileges;
quit
```

最后，重启 Apache 服务：

```
sudo systemctl restart apache2.service
```

在浏览器输入 `http://<<YouRpiIPAddress>>/phpmyadmin/` 来检查 phpMyAdmin 是否正常：

![][7]

默认的 phpMyAdmin 登录凭证：

  * 用户名：`phpmyadmin`
  * 密码：在 phpMyAdmin 安装步骤中你设置的密码

#### 3、安装 OSSN 所需的其他包和配置 PHP

在第一次配置 OSSN 前，我们还需要在系统上安装一些所需的包：

  * PHP 版本 5.6、7.0 或 7.1
  * MYSQL 5 及以上
  * APACHE
  * MOD_REWRITE
  * 需要打开 PHP 扩展 cURL 和 Mcrypt
  * PHP GD 扩展
  * PHP ZIP 扩展
  * 打开 PHP 设置 `allow_url_fopen`
  * PHP JSON 支持
  * PHP XML 支持
  * PHP OpenSSL

在终端输入以下命令来安装上述包：

```
sudo apt-get install php7.3-curl php7.3-gd php7.3-zip php7.3-json php7.3-xml
```

打开 mod_rewrite：

```
sudo a2enmod rewrite
```

修改默认的 Apache 配置，使用 mod_rewrite：

```
sudo nano /etc/apache2/sites-available/000-default.conf
```

在 `000-default.conf` 文件中添加下面的内容：

```ini
<VirtualHost *:80>
    ServerAdmin webmaster@localhost
    DocumentRoot /var/www/html
    ErrorLog ${APACHE_LOG_DIR}/error.log
    CustomLog ${APACHE_LOG_DIR}/access.log combined
    # 需要添加的部分开始 --------------------------------
        <Directory /var/www/html>
            Options Indexes FollowSymLinks MultiViews
            AllowOverride All
            Require all granted
        </Directory>
    # 需要添加的部分结束 --------------------------------
</VirtualHost>
```

安装 Mcrypt：

```bash
sudo apt install php-dev libmcrypt-dev php-pear
sudo pecl channel-update pecl.php.net
sudo pecl install mcrypt-1.0.2
```

打开 Mcrypt 模块：

在 `/etc/php/7.3/apache2/php.ini` 文件中 `extension=mcrypt.so`（或取消注释）：

```bash
sudo nano /etc/php/7.3/apache2/php.ini
```

`allow_url_fopen` 应该已经在 `/etc/php/7.3/apache2/php.ini` 文件中打开了。OpenSSL 应该在 php7.3 中安装了。

我建议的另一个设置是把 PHP 最大上传文件数修改为 16 MB：

```
sudo nano /etc/php/7.3/apache2/php.ini
```

搜索到 `upload_max_filesize` 所在的行，参照下面的设置：

```
upload_max_filesize = 16M
```

保存并退出，重启 Apache：

```
sudo systemctl restart apache2.service
```

#### 4、安装 OSSN

##### 创建数据库，设置用户

回到 phpmyadmin web 页面（浏览器输入 `http://<<YouRpiIPAddress>>/phpmyadmin/`）并登录：

- 用户名： `phpmyadmin`
- 密码：在 phpMyAdmin 安装步骤中你设置的密码

点击数据库标签页：

![][8]

创建一个数据库，记下数据库的名字，因为在之后的安装过程中，你要手动输入它。

![][9]

现在为 OSSN 创建一个数据库用户，我使用下面的凭证：

- 用户名： `ossn_db_user`
- 密码： `ossn_db_password`

在终端输入下面的命令（如果你没有修改过密码，root 密码应该仍然是空）：

```bash
sudo mysql -uroot -p
CREATE USER 'ossn_db_user'@'localhost' IDENTIFIED BY 'ossn_db_password';
GRANT ALL PRIVILEGES ON ossn_db.* TO 'ossn_db_user'@'localhost';
flush privileges;
quit
```

##### 安装 OSSN 软件

在你 PC 上从 [OSSN 下载页面][10] 下载 OSSN 安装压缩文件，保存为文件 `ossn-v5.2-1577836800.zip`。

使用你习惯的 SFTP 软件把整个压缩文件通过 SFTP 传到树莓派的新目录 `/home/pi/download` 下。常用的（默认）SFP 连接参数是：

  * 主机：你树莓派的 IP 地址
  * 用户名：`pi`
  * 密码：raspberry（如果没有修改过默认密码）
  * 端口： 22

在终端输入：

```bash
cd /home/pi/download/ # 进入上传的 OSSN 安装文件的目录。
unzip ossn-v5.2-1577836800.zip # 从压缩包中提取所有文件
cd /var/www/html/ # 进入 Apache Web 目录
sudo rm index.html # 删除 Apache 默认页面 - 我们将使用 OSSN
sudo cp -R /home/pi/download/ossn-v5.2-1577836800/* ./ #Copy installation files to web directory
sudo chown -R www-data:www-data ./
```

创建数据文件夹：OSSN 需要一个文件夹来存放数据。出于安全目的，OSSN 建议这个文件夹创建在公开文档根目录之外。所以，我们在 `/opt` 下创建。

```bash
sudo mkdir /opt/ossn_data
sudo chown -R www-data:www-data /opt/ossn_data/
```

在浏览器输入 `http://<<YourRpiIPAddress>>` 来开始安装向导。

![][11]

所有项都检查完后，点击页面最下面的下一步按钮。

![][12]

阅读证书验证并点击页面最下面的下一步按钮来接受证书。

![][13]

输入数据库用户名，密码和你选择的数据库名字，记得也要输入 OSSN 数据文件夹名称。点击安装。

![][14]

输入你的管理员账号信息，点击创建按钮。

![][15]

现在所有的工作应该都完成了。点击结束，进入管理员首页。

![][16]

你可以通过 URL `http://<<YourRpiIPAddress>>/administrator` 进入管理员控制面板，普通用户可以访问链接是 `http://<<YourRpiIPAddress>>`。

![][17]

本文首发在 [peppe8o.com][18]。已获得转载授权。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/3/raspberry-pi-open-source-social

作者：[Giuseppe Cassibba][a]
选题：[lujun9972][b]
译者：[lxbwolf](https://github.com/lxbwolf)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/peppe8o
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/team_global_people_gis_location.png?itok=Rl2IKo12 (Team of people around the world)
[2]: https://peppe8o.com/2019/04/best-raspberry-pi-projects-with-open-source-software/
[3]: https://www.opensource-socialnetwork.org/
[4]: https://filezilla-project.org/
[5]: https://peppe8o.com/2019/07/install-raspbian-buster-lite-in-your-raspberry-pi/
[6]: https://opensource.com/sites/default/files/uploads/ossn_1_0.jpg
[7]: https://opensource.com/sites/default/files/uploads/ossn_2.jpg
[8]: https://opensource.com/sites/default/files/uploads/ossn_3.jpg
[9]: https://opensource.com/sites/default/files/uploads/ossn_4.jpg
[10]: https://www.opensource-socialnetwork.org/download
[11]: https://opensource.com/sites/default/files/uploads/ossn_5.jpg
[12]: https://opensource.com/sites/default/files/uploads/ossn_6.jpg
[13]: https://opensource.com/sites/default/files/uploads/ossn_7.jpg
[14]: https://opensource.com/sites/default/files/uploads/ossn_8.jpg
[15]: https://opensource.com/sites/default/files/uploads/ossn_9.jpg
[16]: https://opensource.com/sites/default/files/uploads/ossn_10.jpg
[17]: https://opensource.com/sites/default/files/uploads/ossn_11.jpg
[18]: https://peppe8o.com/private-social-network-with-raspberry-pi-and-opensource-social-network/

[#]: collector: (lujun9972)
[#]: translator: (lxbwolf)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12264-1.html)
[#]: subject: (How to install TT-RSS on a Raspberry Pi)
[#]: via: (https://opensource.com/article/20/2/ttrss-raspberry-pi)
[#]: author: (Patrick H. Mullins https://opensource.com/users/pmullins)

怎样在树莓派上安装 TT-RSS
======

> 使用 Tiny Tiny RSS 来保护你阅读新闻馈送时的隐私。

![](https://img.linux.net.cn/data/attachment/album/202005/29/230337vmazkl65hh61l0qq.png)

[Tiny Tiny RSS][2]（TT-RSS）是一个自由开源的基于 Web 的新闻<ruby>馈送<rt>feed</rt></ruby>（RSS/Atom）阅读器和聚合工具。它非常适合那些注重隐私，并且仍然依赖 RSS 来获取日常新闻的人。TT-RSS 是自行托管的软件，因此你可以 100% 的掌控你的服务器、数据以及你的全部隐私。它还支持大量的插件、扩展和主题。你喜欢黑暗模式的界面？没问题。想基于关键词过滤发来的消息？TT-RSS 也能让你得偿所愿。

![Tiny Tiny RSS screenshot][3]

现在你知道 TT-RSS 是什么了，那么为什么你可能会想用它。我会讲述要把它安装到树莓派或 Debian 10 服务器上你需要了解的所有的东西。

### 安装和配置 TT-RSS

要把 TT-RSS 安装到树莓派上，你还需要安装和配置最新版本的 PHP（本文撰写时 PHP 最新版本是 7.3）、后端数据库 PostgreSQL、Nginx web 服务器、Git，最后才是 TT-RSS。

#### 1、安装 PHP 7

安装 PHP 7 是整个过程中最复杂的部分。幸运的是，它并不像看起来那样困难。从安装下面的支持包开始：

```
$ sudo apt install -y ca-certificates apt-transport-https
```

现在，添加存储库 PGP 密钥：

```
$ wget -q https://packages.sury.org/php/apt.gpg -O- | sudo apt-key add -
```

下一步，把 PHP 库添加到你的 apt 源：

```
$ echo "deb https://packages.sury.org/php/ buster main" | sudo tee /etc/apt/sources.list.d/php.list
```

然后更新你的存储库索引：

```
$ sudo apt update
```

最后，安装 PHP 7.3（或最新版本）和一些通用组件：

```
$ sudo apt install -y php7.3 php7.3-cli php7.3-fpm php7.3-opcache php7.3-curl php7.3-mbstring php7.3-pgsql php7.3-zip php7.3-xml php7.3-gd php7.3-intl
```

上面的命令默认你使用的后端数据库是 PostgreSQL，会安装 `php7.3-pgsql`。如果你想用 MySQL 或 MariaDB，你可以把命令参数改为 `php7.3-mysql`。

下一步，确认 PHP 已安装并在你的树莓派上运行着：

```
$ php -v
```

现在是时候安装和配置 Web 服务器了。

#### 2、安装 Nginx

可以用下面的命令安装 Nginx：

```
$ sudo apt install -y nginx
```

修改默认的 Nginx 虚拟主机配置，这样 Web 服务器才能识别 PHP 文件以及知道如何处理它们。

```
$ sudo nano /etc/nginx/sites-available/default
```

你可以安全地删除原文件中的所有内容，用下面的内容替换：

```
server {
        listen 80 default_server;
        listen [::]:80 default_server;

        root /var/www/html;
        index index.html index.htm index.php;
        server_name _;

        location / {
                try_files $uri $uri/ =404;
        }

        location ~ \.php$ {
          include snippets/fastcgi-php.conf;
          fastcgi_pass unix:/run/php/php7.3-fpm.sock;
        }

}
```

按 `Ctrl+O` 保存修改后的配置文件，然后按 `Ctrl+X` 退出 Nano。你可以用下面的命令测试你的新配置文件：


```
$ nginx -t
```

如果没有报错，重启 Nginx 服务：

```
$ systemctl restart nginx
```

#### 3、安装 PostgreSQL

接下来是安装数据库服务器。在树莓派上安装 PostgreSQL 超级简单：

```
$ sudo apt install -y postgresql postgresql-client postgis
```

输入下面的命令看一下数据库服务器安装是否成功：

```
$ psql --version
```

#### 4、创建 Tiny Tiny RSS 数据库

在做其他事之前，你需要创建一个数数据库，用来给 TT-RSS 软件保存数据。首先，登录 PostgreSQL 服务器：

```
sudo -u postgres psql
```

下一步，新建一个用户，设置密码：

```
CREATE USER username WITH PASSWORD 'your_password' VALID UNTIL 'infinity';
```

然后创建一个给 TT-RSS 用的数据库：


```
CREATE DATABASE tinyrss;
```

最后，给新建的用户赋最高权限：

```
GRANT ALL PRIVILEGES ON DATABASE tinyrss to user_name;
```

这是安装数据库的步骤。你可以输入 `\q` 来退出 `psql` 程序。

#### 5、安装 Git

安装 TT-RSS 需要用 Git，所以输入下面的命令安装 Git：

```
$ sudo apt install git -y
```

现在，进入到 Nginx 服务器的根目录：

```
$ cd /var/www/html
```

下载 TT-RSS 最新源码：

```
$ git clone https://git.tt-rss.org/fox/tt-rss.git tt-rss
```

注意，这一步会创建一个 `tt-rss` 文件夹。

#### 6、安装和配置Tiny Tiny RSS

现在是安装和配置你的新 TT-RSS 服务器的最后时刻了。首先，确认下你在浏览器中能打开 `http://your.site/tt-rss/install/index.php`。如果浏览器显示 `403 Forbidden`，那么就证明 `/var/www/html` 文件夹的权限没有设置正确。下面的命令通常能解决这个问题：

```
$ chmod 755 /var/www/html/ -v
```

如果一切正常，你会看到 TT-RSS 安装页面，它会让你输入一些数据的信息。你只需要输入前面你创建的数据库用户名和密码；数据库名；主机名填 `localhost`；端口填 `5432`。

点击“Test Configuration”。如果一切正常，你会看到一个标记着“Initialize Database”的红色按钮。点击它来开始安装。结束后，你会看到一个配置文件，你可以把它复制到 TT-RSS 的目录，另存为 `config.php`。

安装过程结束后，浏览器输入 `http://yoursite/tt-rss/` 打开 TT-RSS，使用默认的凭证登录（用户名：`admin`，密码：`password`）。登录后系统会提示你修改密码。我强烈建议你尽快修改密码。

### 配置 TT-RSS

如果一切正常，你现在就可以开始使用 TT-RSS 了。建议你新建一个非管理员用户，使用新用户名登录，并开始导入你的馈送、订阅，按照你的意愿来配置它。

最后，并且是超级重要的事，不要忘了阅读 TT-RSS 维基上的 [Updating Feeds][4] 部分。它讲述了如何创建一个简单的 systemd 服务来更新馈送。如果你跳过了这一步，你的 RSS 馈送就不会自动更新。

### 总结

呵！工作量不小，但是你做完了！你现在有自己的 RSS 聚合服务器了。想了解 TT-RSS 更多的知识？我推荐你去看官方的 [FAQ][5]、[支持][6]论坛，和详细的[安装][7]笔记。如果你有任何问题，尽情地在下面评论吧。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/2/ttrss-raspberry-pi

作者：[Patrick H. Mullins][a]
选题：[lujun9972][b]
译者：[lxbwolf](https://github.com/lxbwolf)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/pmullins
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/life-raspberrypi_0.png?itok=Kczz87J2 (Raspberries with pi symbol overlay)
[2]: https://tt-rss.org/
[3]: https://opensource.com/sites/default/files/uploads/tt-rss.jpeg (Tiny Tiny RSS screenshot)
[4]: https://tt-rss.org/wiki/UpdatingFeeds
[5]: https://tt-rss.org/wiki/FAQ
[6]: https://community.tt-rss.org/c/tiny-tiny-rss/support
[7]: https://tt-rss.org/wiki/InstallationNotes

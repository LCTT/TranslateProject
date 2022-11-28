[#]: subject: (How to Deploy Seafile Server with Docker to Host Your Own File Synchronization and Sharing Solution)
[#]: via: (https://itsfoss.com/deploy-seafile-server-docker/)
[#]: author: (Hunter Wittenborn https://itsfoss.com/author/hunter/)
[#]: collector: (lujun9972)
[#]: translator: (hwlife)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-14468-1.html)

怎样用 Docker 部署 Seafile 服务器来托管你自己的文件同步和共享解决方案
======

![](https://img.linux.net.cn/data/attachment/album/202204/13/141808f7fo7444ozv75z5s.jpg)

首先，什么是 Seafile ？

[Seafile][1] 是一个自托管文件同步程序，采用客户端/服务器模式，即你有笔记本、手机等多个设备，能够连接到一个中心服务器。

不像类似 [Nextcloud 或 ownCloud][2] 这些更流行的替代品一样，Seafile 试图遵循 “只做一件事，但是要做好” 的理念。同样，Seafile 没有内置额外的类似联系人或者日历聚合的功能。

相反，Seafile 只专注于文件同步、共享及与之相关的事情，仅此而已。但正因为如此，它最终做的非常好。

### 使用 Docker 和 NGINX 部署 Seafile 服务器

> **高级教程**
> 
> 我们的许多教程都是针对初学者的。这篇则不然，它是为那些经常鼓捣 DIY 项目和喜欢自托管的高级用户设计的。这个教程假定你可以熟练的使用命令行，而且你至少对我们将要使用的程序有一定的了解。

虽然整个过程完全可以不使用 NGINX ，但是使用 NGINX 更加容易配置，而且在将来更加容易的自托管更多的服务。

如果你想完全使用 Docker 环境，你也可以 [在 Docker 内部设置 NGINX][3] ，但是它这会使事情变得更加复杂，并且不能够带来太多好处。同样，在本教程里也不会涉及这些。

#### 安装设置　NGINX

在这个教程中，我会使用 Ubuntu，因此会使用 `apt` 来安装软件包。如果你使用 Fedora 或者一些其他非 Debian 发行版，请使用你的发行版的 [包管理器][4]。

[NGINX][5] 既是一个网页浏览器，又是一个代理服务器。它将起到 Seafile 服务器和互联网之间网络连接的作用，同时也使一些任务更容易处理。

要安装 NGINX ，使用以下命令：

```
sudo apt install nginx
```

如果你想使用 HTTPS（也就是浏览器中的小挂锁），你需要安装 [Certbot][6]：

```
sudo apt install certbot python3-certbot-nginx
```

下一步，你需要设置 NGINX 来连接我们之后将要设置的 Seafile 实例。

首先，运行以下命令：

```
sudo nano /etc/nginx/sites-available/seafile.conf
```

键入下方的文本到文件中：

```
server {
  server_name localhost;
  location / {
    proxy_pass http://localhost:8080;
    proxy_set_header Host $host;
    proxy_set_header X-Real-IP $remote_addr;
  }
}
```

**重要**: 将 `server_name` 一行的 `localhost` 替换为你要访问你的服务器的地址（比如 `seafile.example.com` 或者 `192.168.0.0`）。不确定要输入什么吗？

  * 如果你只是为了测试，使用 `localhost` 。这个设置将 **只允许你从你的电脑访问服务器** ，仅此而已。
  * 如果你想通过你的本地 Wi-Fi 连接使用 Seafile（与你在同一 Wi-Fi 网络上），你应该键入 [你的计算机 IP 地址][7]。你也可以考虑 [设置一个静态 IP 地址][8]，尽管这不是必须的。
  * 如果你有一个公网 IP 地址，你知道它指向你的系统，就使用它。
  * 如果你有一个域名（比如 `example.com`、`example.org`）和公网 IP 地址，更改你的 DNS 设置，将域名指向你的系统的 IP 地址。这也需要将公网 IP 指向你的系统。

现在你需要复制配置文件到 NGINX 的查找目录中，然后重启 NGINX ：

```
sudo ln -s /etc/nginx/sites-available/seafile.conf /etc/nginx/sites-enabled/seafile.conf
sudo systemctl restart nginx
```

如果你要安装 Cerbot，你也需要运行以下命令来设置 HTTPS ：

```
sudo certbot
```

如果要重定向 HTTP 流量 到 HTTPS ，选择 `2` 。

现在可以来确认我们目前设置的一切都是否正常工作。如果你访问你的站点，你应该看到一个屏幕上写着 `502 Bad Gateway` 字样。

![][9]

#### 安装 Docker 和 Docker Compose

现在要进入有趣的部分了!

首先，你需要安装 [Docker][10] 和 [Docker Compose][11] 。Docker Compose 需要利用 `docker-compose.yml` 文件，这将使管理多个 Docker [容器][12] 的 Seafile 需求变得更加容易。

Docker 和 Docker Compose 可以用以下的命令来安装：

```
sudo apt install docker.io docker-compose
```

检查 Docker 是否安装并运行，运行以下命令：

```
sudo docker run --rm hello-world
```

如果你完全安装成功，你应该在终端能看到这几行文字：

![][13]

如果你想避免在 `docker` 命令的开始添加 `sudo` 的话，你可以运行以下的命令将你自己添加到 `docker` 组：

```
sudo groupadd docker
sudo usermod -aG docker $USER
```

这个教程的其余部分假定你已经运行了以上两个命令。如果你没有运行，在所有 `docker` 或 `docker-compose` 的命令都添加 `sudo` 。

#### 安装 Seafile 服务器

这部分比之前部分明显容易的多。你所需要做的是输入一些文本到文件，然后运行一些命令。

打开一个终端，然后创建一个 Seafile 服务器用来储存内容的目录，并进入目录中：

```
mkdir ~/seafile-server && cd ~/seafile-server
```

![][14]

转到你创建的目录然后运行以下命令：

```
nano docker-compose.yml
```

下一步，在弹出的窗口中键入以下文本内容：

```
version: '2.0'
services:
  db:
    image: mariadb
    container_name: seafile-mysql
    environment:
      - MYSQL_ROOT_PASSWORD=password
      - MYSQL_LOG_CONSOLE=true
    volumes:
      - ./data/mariadb:/var/lib/mysql
    networks:
      - seafile-net

  memcached:
    image: memcached
    container_name: seafile-memcached
    entrypoint: memcached -m 256
    networks:
      - seafile-net
          
  seafile:
    image: seafileltd/seafile-mc
    container_name: seafile
    ports:
      - "8080:80"
    volumes:
      - ./data/app:/shared
    environment:
      - DB_HOST=db
      - DB_ROOT_PASSWD=password
      - TIME_ZONE=Etc/UTC
      - SEAFILE_ADMIN_EMAIL=me@example.com
      - SEAFILE_ADMIN_PASSWORD=password
      - SEAFILE_SERVER_LETSENCRYPT=false
      - SEAFILE_SERVER_HOSTNAME=docs.seafile.com
    depends_on:
      - db
      - memcached
    networks:
      - seafile-net

networks:
  seafile-net:
```

在保存文件之前，一些参数需要更改：

  * `MYSQL_ROOT_PASSWORD`：更换强壮的密码，你不必记住它，所以不要尝试挑选简单的密码。如果你需要帮助生成一个，请使用 [密码生成器][15] 。我建议使用 20 位字符长度并且避免使用任何的特殊字符（`!@#$%^&*` 等符号）。
  * `DB_ROOT_PASSWD`：更改你为 `MYSQL_ROOT_PASSWORD` 设置的值 。
  * `SEAFILE_ADMIN_EMAIL`：设置管理员帐户的电子邮件地址。
  * `SEAFILE_ADMIN_PASSWORD`：设置管理员帐户密码。避免与`MYSQL_ROOT_PASSWORD` 或者 `DB_ROOT_PASSWD` 密码相同。
  * `SEAFILE_SERVER_HOSTNAME`：在 NGINX 配置中设置 Seafile 的服务器主机名。

完成之后，你可以运行 `docker-compose` 整个运行起来：

```
docker-compose up -d
```

可能需要花一到两分钟，取决于你的网速，因为需要拉下几个 Seafile 需要运行的几个容器。

完成以后，还需要几分钟来完成。你也可以通过以下命令来检查运行状态：

```
docker logs seafile
```

当完成了，你将会看到如下输出：

![][17]

下一步，你只需要在你的浏览器里键入你设置的 `SEAFILE_SERVER_HOSTNAME` 的地址，然后你应该看到登录屏幕的页面。

![][18]

就这样！现在一切功能齐全，准备用客户端来使用。

#### 安装 Seafile 客户端

Seafile 移动客户端在 [Google Play][19]、[F-Droid][20] 和 [苹果商店][21] 都是可用的。Seafile 也有 Linux、Windows 和 Mac 桌面客户端可用，可在 [此处][22] 找到。

通过 `seafile-gui` 软件包，可以在 Ubuntu 系统轻松获得 Seafile ：

```
sudo apt install seafile-gui
```

通过 `seafile-client` 软件包 Seafile 也包含在 Arch 用户的 AUR 包管理器中。

### 结语

请尽情探索客户端及其所能提供的一切。我将在未来的一篇文章中详细阐述 Seafile 客户端的所有功能。（敬请期待 😃）

总的来说，如果有什么错误，或者你有什么问题，请在下方评论 – 我会尽我所能回应。

--------------------------------------------------------------------------------

via: https://itsfoss.com/deploy-seafile-server-docker/

作者：[Hunter Wittenborn][a]
选题：[lujun9972][b]
译者：[hwlife](https://github.com/hwlife)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/hunter/
[b]: https://github.com/lujun9972
[1]: https://www.seafile.com/en/home/
[2]: https://itsfoss.com/nextcloud-vs-owncloud/
[3]: https://linuxhandbook.com/nginx-reverse-proxy-docker/
[4]: https://itsfoss.com/package-manager/
[5]: https://www.nginx.com/
[6]: https://certbot.eff.org/
[7]: https://itsfoss.com/check-ip-address-ubuntu/
[8]: https://itsfoss.com/static-ip-ubuntu/
[9]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/04/nginx_bad_gateway.png?resize=489%2C167&ssl=1
[10]: https://www.docker.com/
[11]: https://docs.docker.com/compose/
[12]: https://www.docker.com/resources/what-container
[13]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/04/seafile-docker-helloworld.png?resize=752%2C416&ssl=1
[14]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/04/seafile-dir.png?resize=731%2C174&ssl=1
[15]: https://itsfoss.com/password-generators-linux/
[16]: https://itsfoss.com/cdn-cgi/l/email-protection
[17]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/04/seafile-running.png?resize=752%2C484&ssl=1
[18]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/04/seafile-login.jpg?resize=800%2C341&ssl=1
[19]: https://play.google.com/store/apps/details?id=com.seafile.seadroid2
[20]: https://f-droid.org/repository/browse/?fdid=com.seafile.seadroid2
[21]: https://itunes.apple.com/cn/app/seafile-pro/id639202512?l=en&mt=8
[22]: https://www.seafile.com/en/download/

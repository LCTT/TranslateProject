[#]: subject: "How To Automatically Update Running Docker Containers Using Watchtower"
[#]: via: "https://ostechnix.com/automatically-update-running-docker-containers/"
[#]: author: "sk https://ostechnix.com/author/sk/"
[#]: collector: "lkxed"
[#]: translator: "Donkey-Hao"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14926-1.html"

如何使用 Watchtower 自动更新正在运行的 Docker 容器
======

![](https://img.linux.net.cn/data/attachment/album/202208/13/171633bitrd5imi953bbbi.jpg)

> 使用 Watchtower 自动更新 Docker 容器基础镜像

对开发运维人员来说，保持 Docker 容器为最新版本是重要工作之一。手动更新 Docker 容器是一项耗时的工作。这篇文章解释了 **Watchtower** 是什么，如何安装它，以及在 Linux 中如何 **使用 Watchtower 自动更新正在运行的 Docker 容器** 。

### Watchtower 是什么？

**Watchtower** 是一款自由开源的应用，用来监控运行中的 Docker 容器，并且当它发现基础镜像被更改后，可以自动的更新容器。

若 Watchtower 发现一个运行中的容器需要更新，它会以发送 SIGTERM 信号的方式，优雅的结束运行中容器的运行。

它会下载新镜像，然后以最初部署时使用的方式，重启容器。所有文件会在后台自动下载，因此不需要用户的介入。

在这份指南中，我们将会明白如何在类 Unix 系统中使用 Watchtower 自动更新正在运行的 Docker 容器。

我已经在 CentOS 和 Ubuntu 中测试了这份指南，所有的 Linux 发行版中操作过程都一样。

### 在 Linux 中安装 Watchtower

可以通过 Docker 镜像的方式下载 Watchtower 。因此，部署它是小事一桩。在你的 Linux 中安装 Docker 镜像，然后运行 Watchtower 立即开始监控 Docker 容器。

参考下方指导在基于 PRM 和 DEB 包管理系统中安装 Docker

* [如何在 CentOS 中安装 Docker][1]
* [如何在 Ubuntu 中安装 Docker][2]
* [适用于 Linux 的 Docker 桌面初学者手册][3]

安装 Docker 后，你可以使用以下命令以 `root` 用户身份部署 Watchtower 容器：

```
# docker run -d --name watchtower -v /var/run/docker.sock:/var/run/docker.sock containrrr/watchtower
```

如果你已经安装了 Docker 桌面版，以普通用户运行 Watchtower 容器。

```
$ docker run -d --name watchtower -v /var/run/docker.sock:/var/run/docker.sock containrrr/watchtower
```

该命令会拉取最新版的 `watchtower` 镜像，并运行 `watchtower` 容器。

输出样例：

```
Unable to find image 'containrrr/watchtower:latest' locally
latest: Pulling from containrrr/watchtower
1045b2f97fda: Pull complete 
35a104a262d3: Pull complete 
1a0671483169: Pull complete 
Digest: sha256:bbf9794a691b59ed2ed3089fec53844f14ada249ee5e372ff0e595b73f4e9ab3
Status: Downloaded newer image for containrrr/watchtower:latest
91c104ef0e9896e8cd5ff30d9f13e728dbfad66443830ec2ac85dde6d7d37564
```

![Run Watchtower Docker Container][4]

### 使用 Watchtower 自动更新 Docker 容器

在你的系统上，Watchtower 正在和其他容器一起运行。你可以使用一下命令查看运行中的 Docker 容器列表：

```
$ docker ps
```

输出样例：

```
CONTAINER ID   IMAGE                       COMMAND                  CREATED          STATUS          PORTS                                         NAMES
91c104ef0e98   containrrr/watchtower       "/watchtower"            14 minutes ago   Up 14 minutes   8080/tcp                                      watchtower
f90b462b0712   bitnami/wordpress-nginx:6   "/opt/bitnami/script…"   19 minutes ago   Up 19 minutes   0.0.0.0:80->8080/tcp, 0.0.0.0:443->8443/tcp   ostechnix-wordpress-1
```

正如上方输出所示，`watchtower` 容器正在和名为 `ostechnix-wordpress-1` 的容器一起运行。从现在开始，`watchtower` 会每隔几分钟会检查该容器。

如果 Watchtower 发现该容器的基础镜像的任何变化，它会优雅的关闭 `ostechnix-wordpress-1` 容器，然后使用与最初启动它时使用的相同方式，启动新的镜像。

类似的，它会自动地每隔几分钟检查所有的运行中容器，并自动更新它们。

### Watchtower 如何更新多连接的容器？

在监视多连接容器时，Watchtower 十分智能。

假设我们现在运行两个容器。

```
$ docker ps
```

输出样例：

```
CONTAINER ID   IMAGE                       COMMAND                  CREATED          STATUS          PORTS                                         NAMES
91c104ef0e98   containrrr/watchtower       "/watchtower"            14 minutes ago   Up 14 minutes   8080/tcp                                      watchtower
f90b462b0712   bitnami/wordpress-nginx:6   "/opt/bitnami/script…"   19 minutes ago   Up 19 minutes   0.0.0.0:80->8080/tcp, 0.0.0.0:443->8443/tcp   ostechnix-wordpress-1
a895f082438a   bitnami/mariadb:10.6        "/opt/bitnami/script…"   20 minutes ago   Up 19 minutes   3306/tcp                                      ostechnix-mariadb-1
```

![View Running Docker Containers][5]

正如你看到的，我们正在运行 `ostechnix-wordpress-1` 和 `ostechnix-mariadb-1` 这两个容器。`ostechnix-mariadb-1` 容器链接到 `ostechnix-wordpress-1` 容器。

如果 Watchtower 发现 `ostechnix-wordpress-1` 容器有个新版本，它会先关闭与之相连接的 `ostechnix-mariadb-1` 容器 ，然后才会关闭 `ostechnix-wordpress-1` 容器。

更新 `ostechnix-wordpress-1` 容器后，Watchtower 会以正确的顺序，且与最初启动它们时使用的相同方式，重启这两个容器，以便应用程序正确恢复。在我们的例子中，首先启动的是 `ostechnix-mariadb-1` 容器，然后是 `ostechnix-wordpress-1` 容器，以确保连接能够继续运行。

### 监控特定容器

默认情况下，Watchtower 将监控在它所指向的 Docker 守护进程中运行的所有 Docker 容器。

不过，你可以像下面这样，通过指定容器名称限制 Watchtower 监视特定的 Docker 容器。

```
$ docker run -d --name watchtower -v /var/run/docker.sock:/var/run/docker.sock containrrr/watchtower ostechnix-wordpress-1
```

在上方的例子中，`watchtower` 会忽略其他容器，只监视名为 `ostechnix-wordpress-1` 的容器更新情况。

如果你不指定任何参数，Watchtower 会照常监视所有运行中的 Docker 容器。

### 发送提示

或许你想收到容器更新的通知。你可以通过电子邮件、Slack 、MSTeams 以及 Gotify 发送通知。

下面这个例子展示了如何通过电子邮件发送通知。假设你已经设置了 SMTP 服务器。

```
docker run -d \
  --name watchtower \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -e WATCHTOWER_NOTIFICATIONS=email \
  -e WATCHTOWER_NOTIFICATION_EMAIL_FROM=fromaddress@gmail.com \
  -e WATCHTOWER_NOTIFICATION_EMAIL_TO=toaddress@gmail.com \
  -e WATCHTOWER_NOTIFICATION_EMAIL_SERVER=smtp.gmail.com \
  -e WATCHTOWER_NOTIFICATION_EMAIL_SERVER_PORT=587 \
  -e WATCHTOWER_NOTIFICATION_EMAIL_SERVER_USER=fromaddress@gmail.com \
  -e WATCHTOWER_NOTIFICATION_EMAIL_SERVER_PASSWORD=app_password \
  -e WATCHTOWER_NOTIFICATION_EMAIL_DELAY=2 \
  containrrr/watchtower
```

参考下方 Watchtower Github 仓库和 Watchtower 官方主页获取更多信息：

### 资料

* [Watchtower GitHub][6]
* [Watchtower 主页][7]

--------------------------------------------------------------------------------

via: https://ostechnix.com/automatically-update-running-docker-containers/

作者：[sk][a]
选题：[lkxed][b]
译者：[Donkey](https://github.com/Donkey-Hao)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://ostechnix.com/author/sk/
[b]: https://github.com/lkxed
[1]: https://ostechnix.com/install-docker-centos/
[2]: https://ostechnix.com/install-docker-ubuntu/
[3]: https://ostechnix.com/docker-desktop-for-linux/
[4]: https://ostechnix.com/wp-content/uploads/2022/07/Run-Watchtower-Docker-Container.png
[5]: https://ostechnix.com/wp-content/uploads/2022/07/View-Running-Docker-Containers.png
[6]: https://github.com/v2tec/watchtower
[7]: https://containrrr.dev/watchtower/
[8]: https://ostechnix.tradepub.com/free/w_java39/prgm.cgi

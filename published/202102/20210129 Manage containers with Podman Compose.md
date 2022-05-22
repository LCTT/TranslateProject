[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13125-1.html)
[#]: subject: (Manage containers with Podman Compose)
[#]: via: (https://fedoramagazine.org/manage-containers-with-podman-compose/)
[#]: author: (Mehdi Haghgoo https://fedoramagazine.org/author/powergame/)

用 Podman Compose 管理容器
======

![][1]

容器很棒，让你可以将你的应用连同其依赖项一起打包，并在任何地方运行。从 2013 年的 Docker 开始，容器已经让软件开发者的生活变得更加轻松。

Docker 的一个缺点是它有一个中央守护进程，它以 root 用户的身份运行，这对安全有影响。但这正是 Podman 的用武之地。Podman 是一个 [无守护进程容器引擎][2]，用于开发、管理和在你的 Linux 系统上以 root 或无 root 模式运行 OCI 容器。

下面这些文章可以用来了解更多关于 Podman 的信息：

  * [使用 Podman 以非 root 用户身份运行 Linux 容器][11]
  * [在 Fedora 上使用 Podman 的 Pod][3]
  * [在 Fedora 中结合权能使用 Podman][4]

如果你使用过 Docker，你很可能也知道 Docker Compose，它是一个用于编排多个可能相互依赖的容器的工具。要了解更多关于 Docker Compose 的信息，请看它的[文档][5]。

### 什么是 Podman Compose？

[Podman Compose][6] 项目的目标是作为 Docker Compose 的替代品，而不需要对 docker-compose.yaml 文件进行任何修改。由于 Podman Compose 使用<ruby>吊舱<rt>pod</rt></ruby> 工作，所以最好看下“吊舱”的最新定义。

> 一个“<ruby>吊舱<rt>pod</rt></ruby> ”（如一群鲸鱼或豌豆荚）是由一个或多个[容器][7]组成的组，具有共享的存储/网络资源，以及如何运行容器的规范。
>
> [Pods - Kubernetes 文档][8]

（LCTT 译注：容器技术领域大量使用了航海比喻，pod 一词，意为“豆荚”，在航海领域指“吊舱”  —— 均指盛装多个物品的容器。常不翻译，考虑前后文，可译做“吊舱”。）

Podman Compose 的基本思想是，它选中 `docker-compose.yaml` 文件里面定义的服务，为每个服务创建一个容器。Docker Compose 和 Podman Compose 的一个主要区别是，Podman Compose 将整个项目的容器添加到一个单一的吊舱中，而且所有的容器共享同一个网络。如你在例子中看到的，在创建容器时使用 `--add-host` 标志，它甚至用和 Docker Compose 一样的方式命名容器。

### 安装

Podman Compose 的完整安装说明可以在[项目页面][6]上找到，它有几种方法。要安装最新的开发版本，使用以下命令：

```
pip3 install https://github.com/containers/podman-compose/archive/devel.tar.gz
```

确保你也安装了 [Podman][9]，因为你也需要它。在 Fedora 上，使用下面的命令来安装Podman：

```
sudo dnf install podman
```

### 例子：用 Podman Compose 启动一个 WordPress 网站

想象一下，你的 `docker-compose.yaml` 文件在一个叫 `wpsite` 的文件夹里。一个典型的 WordPress 网站的 `docker-compose.yaml` （或 `docker-compose.yml`） 文件是这样的：

```
version: "3.8"
services:
  web:
    image: wordpress
    restart: always
    volumes:
      - wordpress:/var/www/html
    ports:
      - 8080:80
    environment:
      WORDPRESS_DB_HOST: db
      WORDPRESS_DB_USER: magazine
      WORDPRESS_DB_NAME: magazine
      WORDPRESS_DB_PASSWORD: 1maGazine!
      WORDPRESS_TABLE_PREFIX: cz
      WORDPRESS_DEBUG: 0
    depends_on:
      - db
    networks:
      - wpnet
  db:
    image: mariadb:10.5
    restart: always
    ports:
      - 6603:3306

    volumes:
      - wpdbvol:/var/lib/mysql

    environment:
      MYSQL_DATABASE: magazine
      MYSQL_USER: magazine
      MYSQL_PASSWORD: 1maGazine!
      MYSQL_ROOT_PASSWORD: 1maGazine!
    networks:
      - wpnet
volumes:
  wordpress: {}
  wpdbvol: {}

networks:
  wpnet: {}
```

如果你用过 Docker，你就会知道你可运行 `docker-compose up` 来启动这些服务。Docker Compose 会创建两个名为 `wpsite_web_1` 和 `wpsite_db_1` 的容器，并将它们连接到一个名为 `wpsite_wpnet` 的网络。

现在，看看当你在项目目录下运行 `podman-compose up` 时会发生什么。首先，一个以执行命令的目录命名的吊舱被创建。接下来，它寻找 YAML 文件中定义的任何名称的卷，如果它们不存在，就创建卷。然后，在 YAML 文件的 `services` 部分列出的每个服务都会创建一个容器，并添加到吊舱中。

容器的命名与 Docker Compose 类似。例如，为你的 web 服务创建一个名为 `wpsite_web_1` 的容器。Podman Compose 还为每个命名的容器添加了 `localhost` 别名。之后，容器仍然可以通过名字互相解析，尽管它们并不像 Docker 那样在一个桥接网络上。要做到这一点，使用选项 `-add-host`。例如，`-add-host web:localhost`。

请注意，`docker-compose.yaml` 包含了一个从主机 8080 端口到容器 80 端口的 Web 服务的端口转发。现在你应该可以通过浏览器访问新 WordPress 实例，地址为 `http://localhost:8080`。

![WordPress Dashboard][10]

### 控制 pod 和容器

要查看正在运行的容器，使用 `podman ps`，它可以显示 web 和数据库容器以及吊舱中的基础设施容器。

```
CONTAINER ID  IMAGE                               COMMAND               CREATED      STATUS          PORTS                                         NAMES
a364a8d7cec7  docker.io/library/wordpress:latest  apache2-foregroun...  2 hours ago  Up 2 hours ago  0.0.0.0:8080-&amp;gt;80/tcp, 0.0.0.0:6603-&amp;gt;3306/tcp  wpsite_web_1
c447024aa104  docker.io/library/mariadb:10.5      mysqld                2 hours ago  Up 2 hours ago  0.0.0.0:8080-&amp;gt;80/tcp, 0.0.0.0:6603-&amp;gt;3306/tcp  wpsite_db_1
12b1e3418e3e  k8s.gcr.io/pause:3.2
```

你也可以验证 Podman 已经为这个项目创建了一个吊舱，以你执行命令的文件夹命名。

```
POD ID        NAME             STATUS    CREATED      INFRA ID      # OF CONTAINERS
8a08a3a7773e  wpsite           Degraded  2 hours ago  12b1e3418e3e  3
```

要停止容器，在另一个命令窗口中输入以下命令：

```
podman-compose down
```

你也可以通过停止和删除吊舱来实现。这实质上是停止并移除所有的容器，然后再删除包含的吊舱。所以，同样的事情也可以通过这些命令来实现：

```
podman pod stop podname
podman pod rm podname
```

请注意，这不会删除你在 `docker-compose.yaml` 中定义的卷。所以，你的 WordPress 网站的状态被保存下来了，你可以通过运行这个命令来恢复它。

```
podman-compose up
```

总之，如果你是一个 Podman 粉丝，并且用 Podman 做容器工作，你可以使用 Podman Compose 来管理你的开发和生产中的容器。

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/manage-containers-with-podman-compose/

作者：[Mehdi Haghgoo][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/powergame/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2021/01/podman-compose-1-816x345.jpg
[2]: https://podman.io
[3]: https://fedoramagazine.org/podman-pods-fedora-containers/
[4]: https://linux.cn/article-12859-1.html
[5]: https://docs.docker.com/compose/
[6]: https://github.com/containers/podman-compose
[7]: https://kubernetes.io/docs/concepts/containers/
[8]: https://kubernetes.io/docs/concepts/workloads/pods/
[9]: https://podman.io/getting-started/installation
[10]: https://fedoramagazine.org/wp-content/uploads/2021/01/Screenshot-from-2021-01-08-06-27-29-1024x767.png
[11]: https://linux.cn/article-10156-1.html
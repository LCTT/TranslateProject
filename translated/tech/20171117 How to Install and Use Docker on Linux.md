在 Linux 上安装被使用 Docker
======
![](https：//www.linux.com/sites/lcom/files/styles/rendered_file/public/use-containers.jpg？itok=s3YLmYHs)

容器现在风靡于 IT 界 -- 这很好理解。容器是轻量级的，包含应用运行所需所有东西(代码，库，运行时环境，系统设置，以及依赖关系)的独立的包。每个容器都有自己的 CPU，内存，block I/O，以及网络资源，所有这些都不依赖于单独的内核和操作系统。这也是容器与虚拟机之间最大的不同; 相比之下，虚拟机是一个运行于主机操作系统上的完整的操作系统平台，而容器不是。

容器允许你以一种前所未有的方式扩展交付能力(不管内部还是外部的)。例如，你可以快速部署多个 NGINX 实例(甚至可以应用于多个不同的阶段 -- 比如开发和生产阶段)。跟虚拟机不同，容器不会消耗太多系统资源。

[Docker][1] 使得创建，部署，和管理容器变得特别简单。更好的是，安装和使用 Docker 在 Linux 平台上特别的方便。

我将会向你演示在 Linux 上安装 Docker 是多么方便，同时带你入门 Docker。我的演示平台是 [Ubuntu 16.04 Server][2]，但流程在大多数其他 Linux 平台都差不多。

我这里假设你已经启动了 Ubuntu Server 16.04。

### 安装

由于 Ubuntu Server 16.04 缺少图形界面，我会完全在完全通过命令行来安装和使用 Docker。在你安装前，你需要更新 apt 然后进行必要的升级。一定要注意，若系统内核升级了，你会需要重启系统。因此最好挑个服务器能重启的时间进行。

运行下面命令更新 apt：
```
sudo apt update
```

完成后，使用命令升级系统：
```
sudo apt upgrade
```

若内核升级了，你需要用下面命令重启服务器：
```
sudo reboot
```

若内核没有升级，你就可以安装 Docker 了(无需重启)。安装 Docker 的命令为：
```
sudo apt install docker.io
```

若你使用的是其他 Linux 发行版，当尝试用相应的包管理器来安装时却发现没有 docker.io 包，则你应该安装 docker 包。例如，在 [Fedora][3] 上安装应该用命令：
```
sudo dnf install docker
```

若你使用的是 CentOS 7，那么最好使用安装脚本来安装 docker。首先使用命令 `sudo yum check-update` 更新系统。升级完后，输入下面命令来下载并运行所需的脚本：
```
curl -fsSL https://get.docker.com/ | sh
```

默认情况下，只有管理员权限能够运行 docker 命令。考虑到安全问题，你不会想用 root 用户或使用 sudo 来运行 Docker 的。要解决这个问题，你需要将自己的用户加入到 docker 组中。命令如下：
```
sudo usermod -a -G docker $USER
```

完成操作后，登出系统然后再重新登陆，应该就搞定了。不过若你的平台是 Fedora，则添加用户到 docker 组时会发现这个组是不存在的。那该怎么办呢？你需要首先创建这个组。命令如下：
```
sudo groupadd docker && sudo gpasswd -a ${USER} docker && sudo systemctl restart docker
newgrp docker
```

登出后再登陆。就可以开始用 Docker 了。

### 启动，暂停以及启用 Docker

安装好 Docker 后，你可以让系统在启动时自动启动 Docker 守护进程。使用下面两个命令来实现这一点：
```
sudo systemctl start docker
sudo systemctl enable docker
```

若需要暂停或重启 Docker 守护进程，则命令为：
```
sudo systemctl stop docker
sudo systemctl restart docker
```

现在可以用 Docker 来部署容器了。

### 拉取镜像

对 Docker 来说，镜像是构建容器的基石。你可以拉下一个镜像 (比如 [NGINX][4]) 然后根据这个镜像部署任意多个容器出来。使用镜像前，你首先需要把镜像拉取到系统中。镜像从注册仓库中拉取，默认情况下安装好的 Docker 包含了一个默认的注册仓库 [Docker Hub][5] -- 这个注册仓库包含了大量别人所贡献的镜像(即包活官方的镜像也包括用户自己贡献的镜像)。

假设你想要拉取一个 Nginx web 服务器相关的镜像。在开始拉取前，先检查一下系统中已经有了哪些镜像。输入 `docker images` 命令你会发现现在还没有镜像存在(图 1)。

![Docker][7]


图 1：还没有镜像。

[Used with permission][8]

让我们来拉取一个镜像。使用下面命令可以从 Docker Hub 中下载 Nginx 镜像：
```
docker pull nginx
```

上面命令会从 Docker Hub 下载最新的(官方的) Nginx 镜像。现在再运行 `docker images` 命令就能看到有列出镜像了(图 2)。

![Docker][10]


图 2：NGINX 镜像已经被拉取下来了。

[Used with permission][8]

注意到我这里说的是 "官方" Nginx 镜像了吗？在 Docker Hub 上有很多的非官方 Nginx 镜像。这些非官方镜像都是基于各种不同的目的而创建出来的。你可以使用下面过命令来搜索 Docker Hub 中的所有 Nginx 镜像
```
docker search nginx
```

你会发现(图 3)，有很多基于不同目的所创建的 Nginx 镜像(反向代理，PHP-FPM(LCTT 注：FastCGI Process Manager(FastCGI 进程管理器)是一个 PHPFastCGI 管理器，旨在将 FastCGI 进程管理整合进 PHP 包中。)功能，LetsEncrypt(LCTT 注：由 ISRG（Internet Security Research Group） 提供的免费 SSL 项目)，Bitnami(LCTT 注：一个开源项目，提供 wordpress、joomla、drupal、bbpress 等开源程序的傻瓜式安装包下载，所有的安装包内置了服务器环境)，在树梅派上使用 Nginx 和 Drupal，等等很多很多)。

![Docker hub][12]


图 3：Docker Hub 上找到的各种 NGINX 镜像。

[Used with permission][8]


假设，你想要下载内建有反向代理功能的 Nginx 镜像。这个非官方的镜像为 jwilder/nginx-proxy。因此输入下面命令来拉取这个镜像：
```
docker pull jwilder/nginx-proxy
```

再输入 `docker images` 命令来查看新拉下来的这个镜像(图 4)。

![Nginx][14]


图 4：已经有了两种不同的 NGINX 镜像了。

[Used with permission][8]

处于谨慎考虑，我建议只使用官方镜像，毕竟你无法确定非官方镜像是否包含了恶意代码。

有了镜像后就可以用它来部署容器了。下次我们再聊聊如何通过这些 Nginx 镜像来发布容器。

Docker 是一个超级强力的系统可以让你的工作更简单，让你的公司更具有伸缩性，也更灵活。想知道 Docker 还能做什么，运行 `man docker` 然后阅读他的帮助文档吧。

--------------------------------------------------------------------------------

via: https://www.linux.com/learn/intro-to-linux/2017/11/how-install-and-use-docker-linux

作者：[Jack Wallen][a]
译者：[lujun9972](https://github.com/lujun9972)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linux.com/users/jlwallen
[1]:https://www.docker.com/
[2]:http://releases.ubuntu.com/16.04/
[3]:https://getfedora.org/
[4]:https://www.nginx.com/
[5]:https://hub.docker.com/
[6]:/files/images/docker1jpg
[7]:https://www.linux.com/sites/lcom/files/styles/rendered_file/public/docker_1.jpg?itok=CxSyyXyF (Docker)
[8]:/licenses/category/used-permission
[9]:/files/images/docker2jpg
[10]:https://www.linux.com/sites/lcom/files/styles/rendered_file/public/docker_2.jpg?itok=TESa7bYr (Docker)
[11]:/files/images/docker3jpg
[12]:https://www.linux.com/sites/lcom/files/styles/rendered_file/public/docker_3.jpg?itok=_7F4QWqx (Docker hub)
[13]:/files/images/docker4jpg
[14]:https://www.linux.com/sites/lcom/files/styles/rendered_file/public/docker_4.jpg?itok=f13E1L0Q (Nginx)

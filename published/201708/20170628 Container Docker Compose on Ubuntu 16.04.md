在 Ubuntu 16.04 中使用 Docker Compose
============================================================

 [![docker compose logo](https://www.unixmen.com/wp-content/uploads/2017/06/docker-compose-logo-696x1226.png "docker-compose-logo")][3] 

### 什么是 Docker Compose

[Docker Compose][4] 是一个运行多容器 Docker 应用的工具。Compose 通过一个配置文件来配置一个应用的服务，然后通过一个命令创建并启动所有在配置文件中指定的服务。

Docker Compose 适用于许多不同的项目，如：

*   **开发**：利用 Compose 命令行工具，我们可以创建一个隔离（而可交互）的环境来承载正在开发中的应用程序。通过使用 [Compose 文件][2]，开发者可以记录和配置所有应用程序的服务依赖关系。
*   **自动测试**：此用例需求一个测试运行环境。Compose 提供了一种方便的方式来管理测试套件的隔离测试环境。完整的环境在 Compose 文件中定义。

Docker Compose 是在 [Fig][5] 的源码上构建的，这个社区项目现在已经没有使用了。

在本教程中，我们将看到如何在 Ubuntn 16.04 上安装 Docker Compose。

### 安装 Docker

我们需要安装 Docker 来安装 Docker Compose。首先为官方 Docker 仓库添加公钥。

```
$ curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
```

接下来，添加 Docker 仓库到 `apt` 源列表：

```
$ sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
```

更新包数据库，并使用 `apt` 安装 Docker

```
$ sudo apt-get update
$ sudo apt install docker-ce
```

在安装进程结束后，Docker 守护程序应该已经启动并设为开机自动启动。我们可以通过下面的命令来查看它的状态：

```
$ sudo systemctl status docker
---------------------------------

● docker.service - Docker Application Container Engine
 Loaded: loaded (/lib/systemd/system/docker.service; enabled; vendor preset: enabled)
 Active: active (running) 
```

### 安装 Docker Compose 

现在可以安装 Docker Compose 了。通过执行以下命令下载当前版本。

```
# curl -L https://github.com/docker/compose/releases/download/1.14.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
```

为二进制文件添加执行权限：

```
# chmod +x /usr/local/bin/docker-compose
```

检查 Docker Compose 版本：

```
$ docker-compose -v
```

输出应该如下：

```
docker-compose version 1.14.0, build c7bdf9e
```

### 测试 Docker Compose

Docker Hub 包含了一个用于演示的 Hello World 镜像，可以用来说明使用 Docker Compose 来运行一个容器所需的配置。

创建并打开一个目录：

```
$ mkdir hello-world
$ cd hello-world
```

创建一个新的 YAML 文件：

```
$ $EDITOR docker-compose.yml
```

在文件中粘贴如下内容：

```
unixmen-compose-test:
 image: hello-world
```

_**注意:** 第一行是容器名称的一部分。_

保存并退出。

### 运行容器

接下来，在 `hello-world` 目录执行以下命令：

```
$ sudo docker-compose up
```

如果一切正常，Compose 输出应该如下：

```
Pulling unixmen-compose-test (hello-world:latest)...
latest: Pulling from library/hello-world
b04784fba78d: Pull complete
Digest: sha256:f3b3b28a45160805bb16542c9531888519430e9e6d6ffc09d72261b0d26ff74f
Status: Downloaded newer image for hello-world:latest
Creating helloworld_unixmen-compose-test_1 ... 
Creating helloworld_unixmen-compose-test_1 ... done
Attaching to helloworld_unixmen-compose-test_1
unixmen-compose-test_1 | 
unixmen-compose-test_1 | Hello from Docker!
unixmen-compose-test_1 | This message shows that your installation appears to be working correctly.
unixmen-compose-test_1 | 
unixmen-compose-test_1 | To generate this message, Docker took the following steps:
unixmen-compose-test_1 | 1\. The Docker client contacted the Docker daemon.
unixmen-compose-test_1 | 2\. The Docker daemon pulled the "hello-world" image from the Docker Hub.
unixmen-compose-test_1 | 3\. The Docker daemon created a new container from that image which runs the
unixmen-compose-test_1 | executable that produces the output you are currently reading.
unixmen-compose-test_1 | 4\. The Docker daemon streamed that output to the Docker client, which sent it
unixmen-compose-test_1 | to your terminal.
unixmen-compose-test_1 | 
unixmen-compose-test_1 | To try something more ambitious, you can run an Ubuntu container with:
unixmen-compose-test_1 | $ docker run -it ubuntu bash
unixmen-compose-test_1 | 
unixmen-compose-test_1 | Share images, automate workflows, and more with a free Docker ID:
unixmen-compose-test_1 | https://cloud.docker.com/
unixmen-compose-test_1 | 
unixmen-compose-test_1 | For more examples and ideas, visit:
unixmen-compose-test_1 | https://docs.docker.com/engine/userguide/
unixmen-compose-test_1 | 
helloworld_unixmen-compose-test_1 exited with code 0
```

Docker 容器只能在命令（LCTT 译注：此处应为容器中的命令）还处于活动状态时运行，因此当测试完成运行时，容器将停止运行。

### 结论

本文是关于在 Ubuntu 16.04 中安装 Docker Compose 的教程。我们还看到了如何通过一个 YAML 格式的 Compose 文件构建一个简单的项目。

--------------------------------------------------------------------------------

via: https://www.unixmen.com/container-docker-compose-ubuntu-16-04/

作者：[Giuseppe Molica][a]
译者：[Locez](https://github.com/locez)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.unixmen.com/author/tutan/
[1]:https://www.unixmen.com/author/tutan/
[2]:https://docs.docker.com/compose/compose-file/
[3]:https://www.unixmen.com/wp-content/uploads/2017/06/docker-compose-logo.png
[4]:https://docs.docker.com/compose/overview/
[5]:http://www.fig.sh/

[#]: subject: "How To Build Custom Docker Image Using Dockerfile"
[#]: via: "https://ostechnix.com/a-brief-introduction-to-dockerfile/"
[#]: author: "sk https://ostechnix.com/author/sk/"
[#]: collector: "lkxed"
[#]: translator: "Donkey-Hao"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14896-1.html"

如何使用 Dockerfile 创建自定义 Docker 镜像
======

![](https://img.linux.net.cn/data/attachment/album/202208/04/172001acb136363vi6vcgk.jpg)

在这份指南中，我们将看到 **Dockerfile** 的简要介绍以及如何在 Linux 中使用 Dockerfile 来自动的 **创建自定义 Docker 镜像** 。

### 什么是 Dockerfile ？

Dockerfile 是附有构建 Docker 镜像说明的易于理解的文本文件。它囊括了用户在创建镜像时可以调用的所有命令。

我们可以使用 Dockerfile 创建自定义的镜像。可以通过 Docker Hub 分享的自定义 Docker 镜像。

如果你还不知道，Docker Hub 是 Docker 提供的托管存储库服务，用于团队查找和共享容器镜像，当然世界上任何人也都可以访问。

想象一下，早期如果我们想用 **Nginx**，我们要通过很多步骤，才能安装和配置好 Nginx 。得益于 Docker Hub ，现在我们可以在几分钟内，下载并运行 Nginx 的预置容器镜像。

![Nginx Docker Image In Dockerhub][1]

运行如下命令从 Docker Hub 上拉取 Nginx 镜像：

```
# docker pull nginx
```

一旦我们拉取了 Docker 镜像，可以运行如下命令使用它：

```
# docker run -it -d -p 8080:8080 nginx
```

就这样，十分简单！

参考下方链接，了解更多使用 Docker 的方式：

* [开始使用 Docker][2]

Docker Hub 上有超过十万个来自软件供应商、开源项目以及社区的容器镜像。

你可以从 Docker Hub 上下载你选择的镜像，并且使用上面的命令开始使用它。

### 理解 Dockerfile 格式

Docker 可以读取 Dockerfile 中的 **指令** 来自动的创建镜像。

典型的 Dockerfile 包含如下指令：

1、`FROM` —— 这会设置容器的基础镜像。

例如：

```
FROM ubuntu:22.04
```

这会将容器的基础镜像设置为 Ubuntu 。如果 ‘22.04’ 这个标志没有特别指明，则会设为最新版本（`latest`）。

2、`LABEL` —— 这是用来明确镜像的元数据信息的键值对。

例如：

```
LABEL ENV=“DEVELOPMENT”
```

3、`RUN` —— 这会在基础镜像中执行指令并创建一个新层。

例如：

```
RUN apt-get update
RUN apt-get install tomcat
```

4、`CMD` —— 这用来设置容器启动后先执行的命令。

例如：

```
CMD ["java", "-jar", "app.jar"]
```

5、`EXPOSE` —— 设置用于访问容器的端口。容器将会监听该端口。我们可以用来获得输出。

例如：

```
EXPOSE 8080
```

6、``MAINTAINER` —— 显示创建镜像作者的信息。

例如：

```
MAINTAINER info@ostechnix.com
```

7、`ENV` —— 用来设置环境变量的键值对。这些变量在镜像创建的时候设置，并在容器创建好后可以使用。

例如：

```
ENV DB_NAME=”MySQL”
ENV DB_VERSION=”8.0”
```

8、`COPY` —— 用来拷贝本地文件至容器中。

例如：

```
COPY /target/devops.jar devops.jar
```

9、`ADD` —— 具有与拷贝相同的功能，不过更进一步还可以提取本地的 tar 文件或者从 URL 拷贝文件。

例如：

```
ADD devops.tar.xz / .
ADD http://example.com/abc.git /usr/local/devops/
```

10、`ENTRYPOINT` —— 用来设置镜像的主要命令。与 CMD 指令功能相同。不同的是 `ENTRYPOINT` 中的指令不会被重写。

例如：

```
ENTRYPOINT ["java", "-jar", "app.jar"]
```

11、`VOLUME` —— 该指令用来创建指定位置的挂载点。

例如：

```
VOLUME /app/devops
```

12、`USER` —— 将设置运行镜像并使用的用户名称以及用户组。

例如：

```
USER dhruv
USER admin
```

13、`WORKDIR` —— 这会设置工作目录。如果目录不存在，则会创建。

例如：

```
WORKDIR /var/lib/
```

这是一个 Dockerfile 的样本，可以参考一下：

```
FROM ubuntu:latest
MAINTAINER Senthilkumar Palani "info@ostechnix.com"
RUN apt-get install -y software-properties-common python
RUN add-apt-repository ppa:chris-lea/node.js
RUN echo "deb http://us.archive.ubuntu.com/ubuntu/ jammy universe" >>
/etc/apt/sources.list
RUN apt-get update
RUN apt-get install -y nodejs
RUN mkdir /var/www
ADD app.js /var/www/app.js
CMD ["/usr/bin/node", "/var/www/app.js"]
```

我将向你展示创建一个 Dockerfile 、创建并使用镜像的简单例子。

### 创建一个 Dockerfile

创建一个名为 `dockerfile` 的文件：

```
# nano dockerfile
```

添加下面几行命令。我们将更新并安装 `vim` 和 `curl` 包：

```
FROM alpine

RUN apk update
RUN apk add vim
RUN apk add curl
```

![Dockerfile For Alpine Linux][3]

按下 `CTRL+O` 和 `CTRL+X` 键保存文件并关闭。

现在 Dockerfile 已经就位。让我们继续，用该 Dockerfile 创建一个镜像。

> **注意：** 如果你在使用 [Docker 桌面版][4]，你可以以一个普通用户运行 `docker` 命令。

### 使用 Dockerfile 创建 Docker 镜像

只需运行以下命令，便可以使用 Dockerfile 创建 Docker 镜像：

```
# docker build -t alpine .
```

请注意最后有一个 **点**（`.`）。

输出示例：

```
[+] Building 51.2s (8/8) FINISHED                                               
 => [internal] load build definition from Dockerfile                       0.1s
 => => transferring dockerfile: 104B                                       0.0s
 => [internal] load .dockerignore                                          0.1s
 => => transferring context: 2B                                            0.0s
 => [internal] load metadata for docker.io/library/alpine:latest          38.8s
 => [1/4] FROM docker.io/library/alpine@sha256:7580ece7963bfa863801466c0a  2.7s
 => => resolve docker.io/library/alpine@sha256:7580ece7963bfa863801466c0a  0.0s
 => => sha256:d7d3d98c851ff3a95dbcb70ce09d186c9aaf7e25d48 1.47kB / 1.47kB  0.0s
 => => sha256:530afca65e2ea04227630ae746e0c85b2bd1a179379 2.80MB / 2.80MB  2.4s
 => => sha256:7580ece7963bfa863801466c0a488f11c86f85d9988 1.64kB / 1.64kB  0.0s
 => => sha256:9b2a28eb47540823042a2ba401386845089bb7b62a9637d 528B / 528B  0.0s
 => => extracting sha256:530afca65e2ea04227630ae746e0c85b2bd1a179379cbf2b  0.2s
 => [2/4] RUN apk update                                                   4.3s
 => [3/4] RUN apk add vim                                                  3.5s
 => [4/4] RUN apk add curl                                                 1.3s 
 => exporting to image                                                     0.4s 
 => => exporting layers                                                    0.4s 
 => => writing image sha256:14231deceb6e8e6105d2e551799ff174c184e8d9be8af  0.0s 
 => => naming to docker.io/library/alpine                                  0.0s 
                                                                                
Use 'docker scan' to run Snyk tests against images to find vulnerabilities and learn how to fix them
```

按照上面的命令， Docker 会通过保存在当前工作目录中的 Dockerfile 中的命令开始自动的创建镜像。还记得我们在 Dockerfile 中保存的 `apk update`、`apk add vim` 和 `apk add curl` 命令吗？这些命令也将会自动的执行。

如果 Dockerfile 保存在其他目录，你可以使用 `-f` 标志来指定路径，例如：

```
# docker build -f /path/to/a/Dockerfile .
```

创建好镜像后，我们可以使用如下命令运行它：

```
# docker run -it alpine
```

该命令会启动这个 Alpine 容器并连接到它。

```
/ # uname -a
Linux 8890fec82de8 5.10.104-linuxkit #1 SMP Thu Mar 17 17:08:06 UTC 2022 x86_64 Linux
/ # cat /etc/alpine-release 
3.16.1
/ #
```

如果你使用 Docker 桌面版，你可以通过<ruby>容器<rt>Containers</rt></ruby>标签页界面来查看运行中的容器。

![View Containers In Docker Desktop][5]

这就是使用 Dockerfile 构建自定义容器映像的方式。

我们仅仅讲了基础内容。你可以用 Dockerfile 做到很多东西。建议你参考一下官方 [Dockerfile 参考][6] ，以了解更多内容。

--------------------------------------------------------------------------------

via: https://ostechnix.com/a-brief-introduction-to-dockerfile/

作者：[sk][a]
选题：[lkxed][b]
译者：[Donkey](https://github.com/Donkey-Hao)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://ostechnix.com/author/sk/
[b]: https://github.com/lkxed
[1]: https://ostechnix.com/wp-content/uploads/2022/07/Nginx-Docker-Image-In-Dockerhub.png
[2]: https://ostechnix.com/getting-started-with-docker/
[3]: https://ostechnix.com/wp-content/uploads/2022/07/Dockerfile-For-Alpine-Linux.png
[4]: https://ostechnix.com/docker-desktop-for-linux/
[5]: https://ostechnix.com/wp-content/uploads/2022/07/View-Containers-In-Docker-Desktop-1024x524.png
[6]: https://docs.docker.com/engine/reference/builder/

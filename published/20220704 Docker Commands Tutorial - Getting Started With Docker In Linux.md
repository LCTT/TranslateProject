[#]: subject: "Docker Commands Tutorial | Getting Started With Docker In Linux"
[#]: via: "https://ostechnix.com/getting-started-with-docker/"
[#]: author: "sk https://ostechnix.com/author/sk/"
[#]: collector: "lkxed"
[#]: translator: "Yufei-Yan"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14849-1.html"

Linux 下的 Docker 入门教程
======

![](https://img.linux.net.cn/data/attachment/album/202207/21/101143uuwylyrrglzjfwj7.jpg)

> 面向初学者的 Docker 基本命令指南。

这篇详细的 Docker 教程覆盖了核心的 **Docker 命令**，比如，如何创建新容器、运行容器、删除容器等。另外，这篇教程也解释了如何从已有的容器构建你自己的 Docker 镜像，如何移除容器和镜像。言归正传，现在开始 Docker 的基本用法。

### Docker 安装步骤

大多数现代 Linux 操作系统都可以安装 Docker。如果还没安装过 Docker，请参考下面的步骤：

* [在 AlmaLinux、CentOS、Rocky Linux 上安装 Docker Engine 和 Docker Compose][1]
* [如何在 Ubuntu 上安装 Docker 和 Docker Compose][2]

### 什么是 Docker 镜像和 Docker 容器？

在开始 Docker 之前，我先说明一下 Docker 镜像和 Docker 容器是什么。

Docker 镜像是一个描述容器如何运行的的文件，Docker 容器是 Docker 镜像在运行或被终止时的一个阶段。

容器和主机上的其他文件是隔离的。

当我们运行一个 Docker 容器的时候，它会使用一个被隔离出来的文件系统，这个文件系统是由一个 Docker 镜像提供的。Docker 镜像包含了运行应用程序所需要的一切东西 - 所有的依赖、配置、脚本、二进制文件等等。

镜像也包含容器所需要的其他配置项，比如说环境变量、默认运行的命令，以及其他元数据。

### Linux 下的 Docker 入门

下面的所有步骤都已在 Ubuntu 22.04、20.04 以及 18.04 LTS 服务器版本中测试通过。后续小节中提供的步骤对于所有 Linux 平台都是通用的。比如，在基于 RHEL 的系统中（比如 AlmaLinux）可以运行相同的命令。

#### 1、搜索 Docker 镜像

我们可以从叫做 [Docker hub][3] 的 Docker 官方库获得镜像，或者我们也可以制作自己的镜像。

有些人可能不清楚，Docker hub 是一个线上的中心化仓库，Docker 用户们在上面构建、测试、然后保存他们的 Docker 镜像。Docker hub 有数以万计的 Docker 镜像，而且这个数字还在每天增长。

你可以从命令行通过 ``docker search` 命令搜索任意 Docker 镜像。

比如要搜索基于 **Alpine** Linux 的 Docker 镜像，运行：

```
$ sudo docker search alpine
```

输出结果：

![Search Docker Images][4]

搜索基于 **Ubuntu** 的镜像，运行：

```
$ sudo docker search ubuntu
```

你还可以搜索其他任意的应用，比如 **Nginx**，像下面这样：

```
$ sudo docker search nginx
```

Docker hub 有各种各样的镜像。你能在 Docker hub 上找到各种已构建好的 Docker 镜像，比如说操作系统、应用，或者多个应用的合体（比如 LAMP 栈）。

如果你找的东西不在上面，你还可以构建一个镜像，然后通过 Docker hub 向其他人开放，或者只是自己用。

#### 2、下载 Docker 镜像

从终端运行下面的命令可以下载 Ubuntu OS 的 Docker 镜像：

```
$ sudo docker pull ubuntu
```

上面的这个命令会从 Docker hub 下载最新的 Ubuntu 镜像。

输出结果：

```
Using default tag: latest
latest: Pulling from library/ubuntu
405f018f9d1d: Pull complete
Digest: sha256:b6b83d3c331794420340093eb706a6f152d9c1fa51b262d9bf34594887c2c7ac
Status: Downloaded newer image for ubuntu:latest
docker.io/library/ubuntu:latest
```

你也可以用下面的命令下载指定版本的 Ubuntu 镜像：

```
$ sudo docker pull ubuntu:20.04
```

Docker 允许我们下载任何镜像，并且在那个镜像上创建容器，这些操作与主机的操作系统无关。

比如要下载 Alpine 系统的镜像，运行：

```
$ sudo docker pull alpine
```

![Download Docker Images][5]

#### 3、列出 Docker 镜像

所有已下载的 Docker 镜像都保存在 `/var/lib/docker` 路径下。

要查看所有已下载的 Docker 镜像，运行：

```
$ sudo docker images
```

输出结果：

```
REPOSITORY   TAG       IMAGE ID       CREATED       SIZE
ubuntu       latest    27941809078c   3 weeks ago   77.8MB
ubuntu       20.04     20fffa419e3a   3 weeks ago   72.8MB
alpine       latest    e66264b98777   5 weeks ago   5.52MB
```

![List Docker Images][6]

从上面可以看出来，我已经下载了三个 Docker 镜像 - Ubuntu latest、Ubuntu 20.04 和 Alpine Linux。

现在，我们看一下接下来如何从下载的镜像启动或者运行容器。

#### 4、运行 Docker 容器

有两种方法我们可以启动一个容器 - 使用 Docker 镜像的<ruby>标签<rt>TAG</rt></ruby> 或者 <ruby>镜像 ID<rt>Image ID</rt></ruby>。

标签指的是一个特定的镜像快照，<ruby>镜像 ID<rt>Image ID</rt></ruby> 是那个镜像对应的唯一识别码。

可以查看下面这个截图：

![Docker Image Tag and ID][7]

从上面的解脱可以看到，标签是 `latest` 和 `20.04`。

* `27941809078c` 是 Ubuntu latest 的 Docker 镜像的镜像 ID，
* `20fffa419e3a` 是 Ubuntu 20.04 的 Docker 镜像的镜像 ID，
* 而 `e66264b98777` 是 Alpine latest 的 Docker 镜像的镜像 ID。

##### 4.1、使用标签运行容器

下载选择好的 Docker 镜像后，运行下面的命令来启动 Docker 容器，并且通过它的标签进行连接。

```
$ sudo docker run -t -i ubuntu:latest /bin/bash
```

或者，

```
$ sudo docker run -it ubuntu:latest /bin/bash
```

这里，

* `-t`：在 Ubuntu 容器内分配一个伪终端。
* `-i`：通过从容器获取一个标准输入（STDIN），允许我们创建一个可交互的连接。
* `ubuntu:latest`：标签为 `latest` 的 Ubuntu Docker 镜像。
* `/bin/bash`：新容器的 BASH shell。这个是可选项。如果你不加 shell 的话，会分配默认的 shell 给容器。

启动容器后，会自动进入容器的 shell（命令行）：

![Run Containers Using Tag][8]

基于最新 Ubuntu 镜像的容器现在已经启动了。所有的新容器都会被赋予一个名字和唯一的 ID。从上面的输出可以看到，那个 Ubuntu 容器的 ID 是 `2f2a5b826762`。一会儿我们会看到从哪找到容器的名字。

现在就可以在容器里面工作了。当你完成容器内的工作后，你可以回到主机操作系统的终端（在我这个例子中，操作系统是 Ubuntu 22.04 LTS）而不需要关掉容器（客户机）。

##### 4.2、从运行中的容器中脱离

使用 `CTRL+P` 然后 `CTRL+Q` 就可以从运行中的容器脱离（不需要关闭）。

现在，你就回到了你原来的主机的终端窗口。请注意，容器还在后台运行中，我们并没有关掉它。

##### 4.3、使用镜像 ID 运行容器

另一种启动容器并且连接进去的方式是通过使用镜像 ID，像下面这样：

```
$ sudo docker run -it 20fffa419e3a /bin/bash
```

这里，

* `20fffa419e3a` - 镜像 ID

按 `CTRL+P` 然后 `CTRL+Q` 可以从当前容器中脱离回到主机系统的终端。我们只是从容器中脱离，但是没有让它停止。容器仍然在后台运行中。

##### 4.4. 在脱离模式中运行容器

在前面的小结中，我们启动了一个容器并且立刻连接了进去。然后当容器中的工作结束后，我们从容器中脱离了出来。

你也可以在脱离模式（不需要自动连接进去）中启动容器。

在后台运行一个容器，输入命令：

```
$ sudo docker run -it -d alpine:latest
```

输出结果：

```
d74f2ceb5f3ad2dbddb0b26e372adb14efff91e75e7763418dbd12d1d227129d
```

上面输出结果的前 12 字符代表的是容器的 ID。

通过 `docker ps` 命令，你可以验证容器是否在运行：

```
$ sudo docker ps
CONTAINER ID   IMAGE           COMMAND     CREATED         STATUS         PORTS     NAMES
d74f2ceb5f3a   alpine:latest   "/bin/sh"   3 seconds ago   Up 2 seconds             zen_pascal
```

![Run Containers In Background][9]

从上面个的输出结果中可以看到，我们创建了一个 Alpine 容器，但是还没有连接进去。

如果你想连接进去，很简单，运行：

```
$ sudo docker attach d74f2ceb5f3a
```

#### 5、查看运行中的容器

查看运行中的容器，运行下面的命令：

```
$ sudo docker ps
```

输出结果：

```
CONTAINER ID   IMAGE           COMMAND       CREATED          STATUS          PORTS     NAMES
f7e04eed577e   20fffa419e3a    "/bin/bash"   6 minutes ago    Up 6 minutes              brave_mclean
2f2a5b826762   ubuntu:latest   "/bin/bash"   18 minutes ago   Up 18 minutes             hungry_leavitt
```

![View Running Containers][10]

这里，

* `f7e04eed577e` 是由镜像 `2f2a5b826762` 创建的 Ubuntu 容器的 ID。并且，`brave_mclean` 是这个容器的名字。
* `2f2a5b826762` 是由镜像 “ubuntu：latest” 创建的 Ubuntu 容器的 ID。并且，`hungry_leavitt` 是这个容器的名字。

当一个新容器被创建后，会赋给它一个唯一的 ID 和名字，这样我们就能通过它的 ID 和名字来连接它。

**注意：请注意容器 ID 和 Docker 镜像 ID 是不同的**。

列出所有可用的（运行或者停止）容器，运行：

```
$ sudo docker ps -a
```

#### 6、从运行中的容器脱离或连接

首先，通过 `docker ps` 命令找到容器的 ID。

```
$ sudo docker ps
```

然后，运行 `docker attach` 命令连接到运行中的容器。

```
$ sudo docker attach <container-id>
```

比如像下面这样，我要连接到 ID 为 `f7e04eed577e` 的容器：

```
$ sudo docker attach f7e04eed577e
```

你也可以通过使用它的名字连接到一个容器。

```
$ sudo docker attach brave_mclean
```

现在你就登录到这个容器了。

想要从容器脱离，只要按 `CTRL+P` 然后 `CTRL+Q`。

#### 7、启动、重启、暂停和终止容器

你可以使用容器的名字或 ID 来启动，重启，暂停或者终止一个 Docker 容器。

首先，通过 `docker ps -a` 命令找到容器的名字或 ID。

![Find Container ID And Name][11]

现在，通过使用 `docker start` 命令，加上名字或 ID，你可以启动一个容器，像下面这样：

```
$ sudo docker start modest_cray
```

```
$ sudo docker start 10615254bb45
```

用空格隔开，就可以**启动多个容器**，像下面这样：

```
$ sudo docker start 24b5ee8c3d3a 56faac6d20ad d74f2ceb5f3a
```

优雅的重启一个运行中的容器，运行：

```
$ sudo docker start 10615254bb45
```

暂停一个运行中的容器：

```
$ sudo docker pause 10615254bb45
```

把暂停的容器恢复过来：

```
$ sudo docker unpause 10615254bb45
```

直到其它容器都停止前，阻塞一个容器：

```
$ sudo docker wait 10615254bb45
```

我们可以很容易地通过使用它的名字或 ID 来终止一个容器。如果你已经在容器的 shell 里了，只需要运行下面的命令就可以非常简单的终止：

```
# exit
```

你也可以使用下面的命令从 Docker 的主机系统中终止（关闭容器）容器：

```
$ sudo docker stop 10615254bb45
```

用空格隔开，你可以退出多个容器，像下面这样。

```
$ sudo docker stop 35b5ee8c3d3a 10615254bb45
```

在退出容器之后，通过列出所有容器的命令来确保它确实被终止了：

```
$ sudo docker ps
```

#### 8、强行关闭 Docker 容器

`docker stop` 命令可以非常优雅的关掉运行中的容器。有时候，你可能卡在一个没有响应的容器，或者你想强制关掉容器。

通过给一个运行中的容器发送 `SIGKILL` 来强行关闭容器，运行：

```
$ sudo docker kill 10615254bb45
```

#### 9、在关闭容器后自动删除他们

也许你想测试一个容器，然后当你完成在容器中的工作就把它删掉。如果是这样，通过使用 `--rm` 标签在关闭后自动删掉容器：

```
$ sudo docker run -it --rm debian:latest
```

当你从容器中退出，它会自动被删掉。

![Automatically Delete Containers][12]

从上面的结果可以看到，我先创建了一个新的 Debian 容器。当我退出这个容器的时候，它就被自动删掉了。`docker ps -a` 命令的输出结果显示，Debian 容器现在不存在。

#### 10、给容器命名

如果你再看一下之前命令的输出结果，当你启动一个容器的时候，每个容器都被赋予了一个随机的名字。如果你不命名你的容器，Docker 会自动替你给他们命名。

现在看一下下面的例子：

```
$ sudo docker run -it -d alpine:latest
2af79e97a825c91bf374b4862b9e7c22fc22acd1598005e8bea3439805ec335d
```

```
$ sudo docker run -it -d alpine:latest
80b53b7e661d33696b65c78267fc3f067b6100799c925910db4721963e3fae0a
```

```
$ sudo docker ps
CONTAINER ID   IMAGE           COMMAND     CREATED         STATUS         PORTS     NAMES
80b53b7e661d   alpine:latest   "/bin/sh"   3 seconds ago   Up 2 seconds             bold_margulis
2af79e97a825   alpine:latest   "/bin/sh"   6 seconds ago   Up 5 seconds             recursing_taussig
```

从上面的结果可以看到，尽管我用同一个 Docker 镜像创建了两个容器，它们获得了不同的 ID 和名字。

如果你想给容器赋一个不变的名字，使用 `--name` 标签，像下面这样：

```
$ sudo docker run -it -d --name ostechnix_alpine alpine:latest
```

上面的命令会在脱离模式中创建一个叫做 `ostechnix_alpine` 的新容器。

我们看一下当前运行的容器列表：

```
$ sudo docker ps
```
输出结果：

```
CONTAINER ID   IMAGE           COMMAND     CREATED         STATUS         PORTS     NAMES
397111fac537   alpine:latest   "/bin/sh"   2 seconds ago   Up 2 seconds             ostechnix_alpine
80b53b7e661d   alpine:latest   "/bin/sh"   7 minutes ago   Up 7 minutes             bold_margulis
2af79e97a825   alpine:latest   "/bin/sh"   7 minutes ago   Up 7 minutes             recursing_taussig
```

![Assign Name To Containers][13]

注意到上面输出结果中的第一个容器的名字了吗？对了，我们给这个容器分配了一个自定义的名字（也就是 `ostechnix_alpine`）。

给容器分配自定义的名字可以给我们带来其他好处。只要看一下容器的名字，我们就能很容易的确定那个容器里面安装了什么。

#### 11、构建自定义 Docker 镜像

Docker 不仅仅是下载和使用已存在的容器。你也可以创建自己的自定义 Docker 镜像。

现在我们开始一个 Ubuntu 容器：

```
$ sudo docker run -it ubuntu:latest
```

现在，你会进入到容器的 shell。

然后，在容器中，你可以安装任何的软件或者做你想做的事情。

比如，我们在容器中安装 Apache Web 服务器。

```
# apt update
# apt install apache2
```

相似地，在容器中，可以根据自己的需要安装和测试软件。

完成以后，从容器脱离（不要退出）回到主机系统的 shell。不要终止或者关闭容器。使用 `CTRL+P` 然后 `CTRL+Q` 从容器中脱离，这样不会关闭容器。

在你的 Docker 主机的终端，运行下面的命令来找到容器 ID：

```
$ sudo docker ps
```

最后，创建一个当前运行中的容器的 Docker 镜像，使用命令：

```
$ sudo docker commit 377e6d77ebb5 ostechnix/ubuntu_apache
```

输出结果：

```
sha256:bc5e5f95ca592a3585fda2c5a40ec30c98e292046ef70390a2c3b7863cc6f7c1
```

这里，

* `377e6d77ebb5` – Ubuntu 容器的 ID。
* `ostechnix` – 创建容器的用户的名字。
* `ubuntu_apache` – 用户 `ostechnix` 创建的 Docker 镜像的名字。

现在我们查看一下新的 Docker 镜像是否被创建了，使用下面的命令：

```
$ sudo docker images
```

输出结果：

```
ostechnix/ubuntu_apache
```

![Build Custom Docker Images][14]

从上面给的结果中可以看到，从运行中的容器创建的新 Docker 镜像已经在我们的 Docker 主机系统中了。

现在你就可以从这个新的 Docker 镜像创建行容器了，用之前的命令：

```
$ sudo docker run -it ostechnix/ubuntu_apache
```

#### 12、移除容器

当你在 Docker 容器中完成所有开发后，如果你不需要它们了，你可以删掉它们。

为此，首先我们需要终止（关闭）运行中的容器。

用这个命令来看一下运行中的容器：

```
$ sudo docker ps
```

输出结果：

```
CONTAINER ID   IMAGE           COMMAND   CREATED         STATUS         PORTS     NAMES
377e6d77ebb5   ubuntu:latest   "bash"    7 minutes ago   Up 7 minutes             elegant_beaver
```

通过使用它的 ID 来终止运行中的容器：

```
$ sudo docker stop 377e6d77ebb5
```

现在，使用这个命令删除容器：

```
$ sudo docker rm 377e6d77ebb5
```

同样，如果不再需要所有的容器，关闭并删除它们。

一个一个的删除多个容器会是一项繁琐的工作。所以，我们可以把所有停止的容器一次性删掉，运行：

```
$ sudo docker container prune
```

敲 `Y` 然后回车键，这些容器就被删掉了。

```
WARNING! This will remove all stopped containers.
Are you sure you want to continue? [y/N] y
Deleted Containers:
397111fac5374921b974721ee646b2d5fbae61ca9c6e8b90fbf47952f382a46b
80b53b7e661d33696b65c78267fc3f067b6100799c925910db4721963e3fae0a
[...]
Total reclaimed space: 176B
```

![Delete Containers][15]

这个命令只有在最新版中有效。

使用下面的命令来验证是否所有容器都被删除了：

```
$ sudo docker ps -a
```

如果看不到任何结果，说明所有容器被删掉了。

#### 13、删除 Docker 镜像

记住，在删除所有镜像之前，首先要删掉所有从那些镜像创建的容器。

当你删掉容器后，你可以删掉你不需要的 Docker 镜像。

列出所有下载的 Docker 镜像：

```
$ sudo docker images
```

输出结果：

```
REPOSITORY                TAG       IMAGE ID       CREATED          SIZE
ostechnix/ubuntu_apache   latest    bc5e5f95ca59   14 minutes ago   229MB
debian                    latest    d2780094a226   11 days ago      124MB
ubuntu                    latest    27941809078c   3 weeks ago      77.8MB
ubuntu                    20.04     20fffa419e3a   3 weeks ago      72.8MB
alpine                    latest    e66264b98777   5 weeks ago      5.52MB
```

从上面可以看到，在我们的主机上有 5 个 Docker 镜像。

通过使用镜像 ID 来删掉它们：

```
$ sudo docker rmi ce5aa74a48f1
```

输出结果：

```
Untagged: ostechnix/ubuntu_apache:latest
Deleted: sha256:bc5e5f95ca592a3585fda2c5a40ec30c98e292046ef70390a2c3b7863cc6f7c1
Deleted: sha256:a8e4797160a2b2d33d8bd1bd67e008260c022b3a53fbcc198b2b74d9eae5961d
```

同样，删除其他所有 Docker 镜像。

删掉所有未运行的容器、所有镜像、构建的缓存、所有网络，运行：

```
$ sudo docker system prune -a
```

使用这个命令的时候要注意，它会删掉所有没有使用的容器、网络、镜像（包括 <ruby>挂起<rt>dangling</rt></ruby>和<ruby>未使用<rt>unreferenced</rt></ruby> 的）

![Delete Everything In Docker][16]

默认情况下，即使当前没有容器在使用<ruby>磁盘卷<rt>volumes</rt></ruby>，为防止重要数据被删除，磁盘卷也不会被删除。

如果你想删掉所有东西，包括分配的卷，使用 `--volumes` 标签。

```
$ sudo docker system prune -a --volumes
```

### Docker 问题汇总

如果 Docker 镜像正在被运行或停止的容器使用，Docker 不会允许你删除这些镜像。

比如，当我尝试从一个以前的 Ubuntu 服务器上删除 ID 为 `b72889fa879c` 的 Docker 镜像。我会得到下面的错误：

```
Error response from daemon: conflict: unable to delete b72889fa879c (must be forced) - image is being used by stopped container dde4dd285377
```

这是因为你想删除的 Docker 镜像正在被另一个容器使用。

所以，我们先查看一下运行中的容器，使用命令：

```
$ sudo docker ps
```

输出结果：

![Show running docker containers][17]

噢，没有运行中的容器。

我们在看一下所有的容器（运行和停止的），用这个命令：

```
$ sudo docker ps -a
```

输出结果：

![Show running and stopped docker containers][18]

可以看到，仍然有停止的容器在使用其中一个 Docker 镜像。所以，我们先把所有容器删掉。

比如：

```
$ sudo docker rm 12e892156219
```

类似地，向上面那样，用对应容器的 ID 将它们都删除。

当把所有容器删掉后，移除掉 Docker 镜像。

比如：

```
$ sudo docker rmi b72889fa879c
```

就这么简单。现在确认是否还有其他 Docker 镜像在主机上，使用命令：

```
$ sudo docker images
```

你现在应该不再有任何 docker 镜像了。

### 总结

在这篇全面的 Docker 入门教程中，我们解释了 Docker 的基本操作，比如创建、运行、搜索、删除容器，还有从 Docker 镜像构建你自己的容器。同时，我们也解释了如何在不需要 Docker 容器和镜像的时候删除它们。

希望你现在对 **Docker 的使用** 有一个基本的了解。

更多细节，请参考这篇教程最下面的官方资源链接，或者在下面的评论区进行评论。

### 相关资料

* [Docker 官网][19]
* [Docker 文档][20]

--------------------------------------------------------------------------------

via: https://ostechnix.com/getting-started-with-docker/

作者：[sk][a]
选题：[lkxed][b]
译者：[MCGA](https://github.com/Yufei-Yan)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://ostechnix.com/author/sk/
[b]: https://github.com/lkxed
[1]: https://ostechnix.com/install-docker-almalinux-centos-rocky-linux/
[2]: https://ostechnix.com/install-docker-ubuntu/
[3]: https://hub.docker.com/
[4]: https://ostechnix.com/wp-content/uploads/2022/07/Search-Docker-Images.png
[5]: https://ostechnix.com/wp-content/uploads/2022/07/Download-Docker-Images.png
[6]: https://ostechnix.com/wp-content/uploads/2022/07/List-Docker-Images.png
[7]: https://ostechnix.com/wp-content/uploads/2022/07/Docker-Image-Tag-and-ID.png
[8]: https://ostechnix.com/wp-content/uploads/2022/07/Run-Containers-Using-Tag-1.png
[9]: https://ostechnix.com/wp-content/uploads/2022/07/Run-Containers-In-Background-1.png
[10]: https://ostechnix.com/wp-content/uploads/2022/07/View-Running-Containers.png
[11]: https://ostechnix.com/wp-content/uploads/2022/07/Find-Container-ID-And-Name.png
[12]: https://ostechnix.com/wp-content/uploads/2022/07/Automatically-Delete-Containers.png
[13]: https://ostechnix.com/wp-content/uploads/2022/07/Assign-Name-To-Containers.png
[14]: https://ostechnix.com/wp-content/uploads/2022/07/Build-Custom-Docker-Images.png
[15]: https://ostechnix.com/wp-content/uploads/2022/07/Delete-Containers.png
[16]: https://ostechnix.com/wp-content/uploads/2022/07/Delete-Everything-In-Docker.png
[17]: https://ostechnix.com/wp-content/uploads/2016/04/sk@sk-_005-1-1.jpg
[18]: https://ostechnix.com/wp-content/uploads/2016/04/sk@sk-_006-1.jpg
[19]: https://www.docker.com/
[20]: https://docs.docker.com/

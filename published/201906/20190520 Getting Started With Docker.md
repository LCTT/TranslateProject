[#]: collector:	"lujun9972"
[#]: translator:	"zhang5788"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-10940-1.html"
[#]: subject:	 "Getting Started With Docker"
[#]: via:	"https://www.ostechnix.com/getting-started-with-docker/"
[#]: author: "sk https://www.ostechnix.com/author/sk/"

Docker 入门指南
======

![Getting Started With Docker][1]

在我们的上一个教程中，我们已经了解[如何在 Ubuntu 上安装 Docker][1]，和如何在 [CentOS 上安装 Docker][2]。今天，我们将会了解 Docker 的一些基础用法。该教程包含了如何创建一个新的 Docker 容器，如何运行该容器，如何从现有的 Docker 容器中创建自己的 Docker 镜像等 Docker 的一些基础知识、操作。所有步骤均在 Ubuntu 18.04 LTS server 版本下测试通过。

### 入门指南

在开始指南之前，不要混淆 Docker 镜像和 Docker 容器这两个概念。在之前的教程中，我就解释过，Docker 镜像是决定 Docker 容器行为的一个文件，Docker 容器则是 Docker 镜像的运行态或停止态。（LCTT 译注：在 macOS 下使用 Docker 终端时，不需要加 `sudo`）

#### 1、搜索 Docker 镜像

我们可以从 Docker 仓库中获取镜像，例如 [Docker hub][3]，或者自己创建镜像。这里解释一下，Docker hub 是一个云服务器，用来提供给 Docker 的用户们创建、测试，和保存他们的镜像。

Docker hub 拥有成千上万个 Docker 镜像文件。你可以通过 `docker search`命令在这里搜索任何你想要的镜像。

例如，搜索一个基于 Ubuntu 的镜像文件，只需要运行：

```shell
$ sudo docker search ubuntu
```

示例输出：

![][5]

搜索基于 CentOS 的镜像，运行：

```shell
$ sudo docker search centos
```

搜索 AWS 的镜像，运行：

```shell
$ sudo docker search aws
```

搜索 WordPress 的镜像：

```shell
$ sudo docker search wordpress
```

Docker hub 拥有几乎所有种类的镜像，包含操作系统、程序和其他任意的类型，这些你都能在 Docker hub 上找到已经构建完的镜像。如果你在搜索时，无法找到你想要的镜像文件，你也可以自己构建一个，将其发布出去，或者仅供你自己使用。

#### 2、下载 Docker 镜像

下载 Ubuntu 的镜像，你需要在终端运行以下命令：

```shell
$ sudo docker pull ubuntu
```

这条命令将会从 Docker hub 下载最近一个版本的 Ubuntu 镜像文件。

示例输出：

```
Using default tag: latest
latest: Pulling from library/ubuntu
6abc03819f3e: Pull complete 
05731e63f211: Pull complete 
0bd67c50d6be: Pull complete 
Digest: sha256:f08638ec7ddc90065187e7eabdfac3c96e5ff0f6b2f1762cf31a4f49b53000a5
Status: Downloaded newer image for ubuntu:latest
```

![下载 Docker 镜像][6]

你也可以下载指定版本的 Ubuntu 镜像。运行以下命令：

```shell
$ docker pull ubuntu:18.04
```

Docker 允许在任意的宿主机操作系统下，下载任意的镜像文件，并运行。

例如，下载 CentOS 镜像：

```shell
$ sudo docker pull centos
```

所有下载的镜像文件，都被保存在 `/var/lib/docker` 文件夹下。（LCTT 译注：不同操作系统存放的文件夹并不是一致的，具体存放位置请在官方查询）

查看已经下载的镜像列表，可以使用以下命令：

```shell
$ sudo docker images
```

示例输出：

```shell
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
ubuntu              latest              7698f282e524        14 hours ago        69.9MB
centos              latest              9f38484d220f        2 months ago        202MB
hello-world         latest              fce289e99eb9        4 months ago        1.84kB
```

正如你看到的那样，我已经下载了三个镜像文件：`ubuntu`、`centos` 和 `hello-world`。

现在，让我们继续，来看一下如何运行我们刚刚下载的镜像。

#### 3、运行 Docker 镜像

运行一个容器有两种方法。我们可以使用标签或者是镜像 ID。标签指的是特定的镜像快照。镜像 ID 是指镜像的唯一标识。

正如上面结果中显示，`latest` 是所有镜像的一个标签。`7698f282e524` 是 Ubuntu Docker 镜像的镜像 ID，`9f38484d220f`是 CentOS 镜像的镜像 ID，`fce289e99eb9` 是 hello_world 镜像的 镜像 ID。

下载完 Docker 镜像之后，你可以通过下面的命令来使用其标签来启动：

```shell
$ sudo docker run -t -i ubuntu:latest /bin/bash
```

在这条语句中：

* `-t`：在该容器中启动一个新的终端
* `-i`：通过容器中的标准输入流建立交互式连接
* `ubuntu:latest`：带有标签 `latest` 的 Ubuntu 容器
* `/bin/bash`：在新的容器中启动 BASH Shell 

或者，你可以通过镜像 ID 来启动新的容器：

```shell
$ sudo docker run -t -i 7698f282e524 /bin/bash
```

在这条语句里：

* `7698f282e524` — 镜像 ID

在启动容器之后，将会自动进入容器的 shell 中（注意看命令行的提示符）。

![][7]

*Docker 容器的 Shell*

如果想要退回到宿主机的终端（在这个例子中，对我来说，就是退回到 18.04 LTS），并且不中断该容器的执行，你可以按下 `CTRL+P`，再按下 `CTRL+Q`。现在，你就安全的返回到了你的宿主机系统中。需要注意的是，Docker 容器仍然在后台运行，我们并没有中断它。

可以通过下面的命令来查看正在运行的容器：

```shell
$ sudo docker ps
```

示例输出：

```shell
CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS               NAMES
32fc32ad0d54        ubuntu:latest       "/bin/bash"         7 minutes ago       Up 7 minutes                            modest_jones
```

![][8]

*列出正在运行的容器*

可以看到：

* `32fc32ad0d54` – 容器 ID
* `ubuntu:latest` – Docker 镜像

需要注意的是，容器 ID 和 Docker 的镜像 ID是不同的。

可以通过以下命令查看所有正在运行和停止运行的容器：

```shell
$ sudo docker ps -a
```

在宿主机中断容器的执行：

```shell
$ sudo docker stop <container-id>
```

例如：

```shell
$ sudo docker stop 32fc32ad0d54
```

如果想要进入正在运行的容器中，你只需要运行：

```shell
$ sudo docker attach 32fc32ad0d54
```

正如你看到的，`32fc32ad0d54` 是一个容器的 ID。当你在容器中想要退出时，只需要在容器内的终端中输入命令：

```shell
# exit
```

你可以使用这个命令查看后台正在运行的容器：

```shell
$ sudo docker ps
```

#### 4、构建自己的 Docker 镜像

Docker 不仅仅可以下载运行在线的容器，你也可以创建你的自己的容器。

想要创建自己的 Docker 镜像，你需要先运行一个你已经下载完的容器：

```shell
$ sudo docker run -t -i ubuntu:latest /bin/bash
```

现在，你运行了一个容器，并且进入了该容器。然后，在该容器安装任意一个软件或做任何你想做的事情。

例如，我们在容器中安装一个 Apache web 服务器。

当你完成所有的操作，安装完所有的软件之后，你可以执行以下的命令来构建你自己的 Docker 镜像：

```shell
# apt update
# apt install apache2
```

同样的，在容器中安装和测试你想要安装的所有软件。

当你安装完毕之后，返回的宿主机的终端。记住，不要关闭容器。想要返回到宿主机而不中断容器。请按下`CTRL+P`，再按下 `CTRL+Q`。

从你的宿主机的终端中，运行以下命令如寻找容器的 ID：

```shell
$ sudo docker ps
```

最后，从一个正在运行的容器中创建 Docker 镜像：

```shell
$ sudo docker commit 3d24b3de0bfc ostechnix/ubuntu_apache
```

示例输出：

```shell
sha256:ce5aa74a48f1e01ea312165887d30691a59caa0d99a2a4aa5116ae124f02f962
```

在这里：

* `3d24b3de0bfc` — 指 Ubuntu 容器的 ID。
* `ostechnix` — 我们创建的容器的用户名称
* `ubuntu_apache` — 我们创建的镜像

让我们检查一下我们新创建的 Docker 镜像：

```shell
$ sudo docker images
```

示例输出：

```shell
REPOSITORY                TAG                 IMAGE ID            CREATED              SIZE
ostechnix/ubuntu_apache   latest              ce5aa74a48f1        About a minute ago   191MB
ubuntu                    latest              7698f282e524        15 hours ago         69.9MB
centos                    latest              9f38484d220f        2 months ago         202MB
hello-world               latest              fce289e99eb9        4 months ago         1.84kB
```

![][9]

*列出所有的 Docker 镜像*

正如你看到的，这个新的镜像就是我们刚刚在本地系统上从运行的容器上创建的。

现在，你可以从这个镜像创建一个新的容器。

```shell
$ sudo docker run -t -i ostechnix/ubuntu_apache /bin/bash
```

#### 5、删除容器

如果你在 Docker 上的工作已经全部完成，你就可以删除那些你不需要的容器。

想要删除一个容器，首先，你需要停止该容器。

我们先来看一下正在运行的容器有哪些

```shell
$ sudo docker ps
```

示例输出：

```shell
CONTAINER ID IMAGE COMMAND CREATED STATUS PORTS NAMES
3d24b3de0bfc ubuntu:latest "/bin/bash" 28 minutes ago Up 28 minutes goofy_easley
```

使用容器 ID 来停止该容器：

```shell
$ sudo docker stop 3d24b3de0bfc
```

现在，就可以删除该容器了。

```shell
$ sudo docker rm 3d24b3de0bfc
```

你就可以按照这样的方法来删除那些你不需要的容器了。

当需要删除的容器数量很多时，一个一个删除也是很麻烦的，我们可以直接删除所有的已经停止的容器。只需要运行：

```shell
$ sudo docker container prune
```

按下 `Y`，来确认你的操作：

```sehll
WARNING! This will remove all stopped containers.
Are you sure you want to continue? [y/N] y
Deleted Containers:
32fc32ad0d5445f2dfd0d46121251c7b5a2aea06bb22588fb2594ddbe46e6564
5ec614e0302061469ece212f0dba303c8fe99889389749e6220fe891997f38d0

Total reclaimed space: 5B
```

这个命令仅支持最新的 Docker。（LCTT 译注：仅支持 1.25 及以上版本的 Docker）

#### 6、删除 Docker 镜像

当你删除了不要的 Docker 容器后，你也可以删除你不需要的 Docker 镜像。

列出已经下载的镜像：

```shell
$ sudo docker images
```

示例输出：

```shell
REPOSITORY                TAG                 IMAGE ID            CREATED             SIZE
ostechnix/ubuntu_apache   latest              ce5aa74a48f1        5 minutes ago       191MB
ubuntu                    latest              7698f282e524        15 hours ago        69.9MB
centos                    latest              9f38484d220f        2 months ago        202MB
hello-world               latest              fce289e99eb9        4 months ago        1.84kB
```

由上面的命令可以知道，在本地的系统中存在三个镜像。

使用镜像 ID 来删除镜像。

```shell
$ sudo docekr rmi ce5aa74a48f1
```

示例输出：

```shell
Untagged: ostechnix/ubuntu_apache:latest
Deleted: sha256:ce5aa74a48f1e01ea312165887d30691a59caa0d99a2a4aa5116ae124f02f962
Deleted: sha256:d21c926f11a64b811dc75391bbe0191b50b8fe142419f7616b3cee70229f14cd
```

#### 解决问题

Docker 禁止我们删除一个还在被容器使用的镜像。

例如，当我试图删除 Docker 镜像 `b72889fa879c` 时，我只能获得一个错误提示：

```shell
Error response from daemon: conflict: unable to delete b72889fa879c (must be forced) - image is being used by stopped container dde4dd285377
```

这是因为这个 Docker 镜像正在被一个容器使用。

所以，我们来检查一个正在运行的容器：

```shell
$ sudo docker ps
```

示例输出：

![][10]

注意，现在并没有正在运行的容器！！！

查看一下所有的容器（包含所有的正在运行和已经停止的容器）：

```shell
$ sudo docker pa -a
```

示例输出：

![][11]

可以看到，仍然有一些已经停止的容器在使用这些镜像。

让我们把这些容器删除：

```shell
$ sudo docker rm 12e892156219
```

我们仍然使用容器 ID 来删除这些容器。

当我们删除了所有使用该镜像的容器之后，我们就可以删除 Docker 的镜像了。

例如：

```shell
$ sudo docekr rmi b72889fa879c
```

我们再来检查一下本机存在的镜像：

```shell
$ sudo docker images
```

想要知道更多的细节，请参阅本指南末尾给出的官方资源的链接或者在评论区进行留言。

这就是全部的教程了，希望你可以了解 Docker 的一些基础用法。

更多的教程马上就会到来，敬请关注。

---

via: https://www.ostechnix.com/getting-started-with-docker/

作者：[sk][a]
选题：[lujun9972][b]
译者：[zhang5788](https://github.com/zhang5788)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.ostechnix.com/author/sk/
[b]: https://github.com/lujun9972
[1]: https://www.ostechnix.com/wp-content/uploads/2016/04/docker-basics-720x340.png
[2]: http://www.ostechnix.com/install-docker-ubuntu/
[3]: https://www.ostechnix.com/install-docker-centos/
[4]: https://hub.docker.com/
[5]: http://www.ostechnix.com/wp-content/uploads/2016/04/Search-Docker-images.png
[6]: http://www.ostechnix.com/wp-content/uploads/2016/04/Download-docker-images.png
[7]: http://www.ostechnix.com/wp-content/uploads/2016/04/Docker-containers-shell.png
[8]: http://www.ostechnix.com/wp-content/uploads/2016/04/List-running-containers.png
[9]: http://www.ostechnix.com/wp-content/uploads/2016/04/List-docker-images.png
[10]: http://www.ostechnix.com/wp-content/uploads/2016/04/sk@sk-_005-1-1.jpg
[11]: http://www.ostechnix.com/wp-content/uploads/2016/04/sk@sk-_006-1.jpg
[12]: https://ostechnix.tradepub.com/free/w_java39/prgm.cgi?a=1
[13]: https://ostechnix.tradepub.com/free/w_pacb32/prgm.cgi?a=1
[14]: https://ostechnix.tradepub.com/free/w_pacb31/prgm.cgi?a=1
[15]: https://ostechnix.tradepub.com/free/w_pacb29/prgm.cgi?a=1
[16]: https://ostechnix.tradepub.com/free/w_pacb28/prgm.cgi?a=1

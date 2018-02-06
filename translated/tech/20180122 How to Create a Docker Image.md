如何创建一个 Docker 镜像
======

![](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/container-image_0.jpg?itok=G_Gz80R9)

在 [前面的文章][1] 中，我们学习了在 Linux、macOS、以及 Windows 上如何使用 Docker 的基础知识。在这篇文章中，我们将去学习创建 Docker 镜像的基本知识。我们可以在 DockerHub 上得到你可以用于你自己的项目的预构建镜像，并且也可以将你自己的镜像发布到这里。

我们使用预构建镜像得到一个基本的 Linux 子系统，因为，从头开始构建需要大量的工作。你可以得到 Alpine（ Docker 版使用的官方版本）、Ubuntu、BusyBox、或者 scratch。在我们的示例中，我将使用 Ubuntu。

在我们开始构建镜像之前，让我们先“容器化”它们！我的意思是，为你的所有 Docker 镜像创建目录，这样你就可以维护不同的项目和阶段，并保持它们彼此隔离。
```
$ mkdir dockerprojects

cd dockerprojects

```

现在，在 `dockerprojects` 目录中，你可以使用自己喜欢的文本编辑器去创建一个 `Dockerfile` 文件；我喜欢使用 nano，它对新手来说很容易上手。
```
$ nano Dockerfile

```

然后添加这样的一行内容：
```
FROM Ubuntu

```

![m7_f7No0pmZr2iQmEOH5_ID6MDG2oEnODpQZkUL7][2]

使用 Ctrl+Exit 然后选择 Y 去保存它。

现在开始创建你的新镜像，然后给它起一个名字（在刚才的目录中运行如下的命令）：
```
$ docker build -t dockp .

```

（注意命令后面的圆点）这样就创建成功了，因此，你将看到如下内容：
```
Sending build context to Docker daemon 2.048kB

Step 1/1 : FROM ubuntu

---> 2a4cca5ac898

Successfully built 2a4cca5ac898

Successfully tagged dockp:latest

```

现在去运行和测试一下你的镜像：
```
$ docker run -it Ubuntu

```

你将看到 root 提示符：
```
root@c06fcd6af0e8:/#

```

这意味着在 Linux、Windows、或者 macOS 中你可以运行一个最小的 Ubuntu 了。你可以运行所有的 Ubuntu 原生命令或者 CLI 实用程序。

![vpZ8ts9oq3uk--z4n6KP3DD3uD_P4EpG7fX06MC3][3]

我们来查看一下在你的目录下你拥有的所有 Docker 镜像：
```
$docker images


REPOSITORY TAG IMAGE ID CREATED SIZE

dockp latest 2a4cca5ac898 1 hour ago 111MB

ubuntu latest 2a4cca5ac898 1 hour ago 111MB

hello-world latest f2a91732366c 8 weeks ago 1.85kB

```

你可以看到共有三个镜像：dockp、Ubuntu、和 hello-world， hello-world 是我在几周前创建的，这一系列的前面的文章就是在它下面工作的。构建一个完整的 LAMP 栈可能是一个挑战，因此，我们使用 Dockerfile 去创建一个简单的 Apache 服务器镜像。

从本质上说，Dockerfile 是安装所有需要的包、配置、以及拷贝文件的一套指令。在这个案例中，它是安装配置 Apache 和 Nginx。

你也可以在 DockerHub 上去创建一个帐户，然后在构建镜像之前登入到你的帐户，在这个案例中，你需要从 DockerHub 上拉取一些东西。从命令行中登入 DockerHub，运行如下所求的命令：
```
$ docker login

```

在登入时输入你的用户名和密码。

接下来，为这个 Docker 项目，在目录中创建一个 Apache 目录：
```
$ mkdir apache

```

在 Apache 目录中创建 Dockerfile 文件：
```
$ nano Dockerfile

```

然后，粘贴下列内容：
```
FROM ubuntu

MAINTAINER Kimbro Staken version: 0.1

RUN apt-get update && apt-get install -y apache2 && apt-get clean && rm -rf /var/lib/apt/lists/*


ENV APACHE_RUN_USER www-data

ENV APACHE_RUN_GROUP www-data

ENV APACHE_LOG_DIR /var/log/apache2


EXPOSE 80


CMD ["/usr/sbin/apache2", "-D", "FOREGROUND"]

```

然后，构建镜像：
```
docker build -t apache .

```

（注意命令尾部的空格和圆点）

这将花费一些时间，然后你将看到如下的构建成功的消息：
```
Successfully built e7083fd898c7

Successfully tagged ng:latest

Swapnil:apache swapnil$

```

现在，我们来运行一下这个服务器：
```
$ docker run -d apache

a189a4db0f7c245dd6c934ef7164f3ddde09e1f3018b5b90350df8be85c8dc98

```

发现了吗，你的容器镜像已经运行了。可以运行如下的命令来检查所有运行的容器：
```
$ docker ps

CONTAINER ID IMAGE COMMAND CREATED

a189a4db0f7 apache "/usr/sbin/apache2ctl" 10 seconds ago

```

你可以使用 docker kill 命令来杀死容器：
```
$docker kill a189a4db0f7

```

正如你所见，这个 "镜像" 它已经永久存在于你的目录中了，而不论运行与否。现在你可以根据你的需要创建很多的镜像，并且可以从这些镜像中繁衍出来更多的镜像。

这就是如何去创建镜像和运行容器。

想学习更多内容，你可以打开你的浏览器，然后找到更多的关于如何构建像 LAMP 栈这样的完整的 Docker 镜像的文档。这里有一个帮你实现它的 [ Dockerfile][4] 文件。在下一篇文章中，我将演示如何推送一个镜像到 DockerHub。

你可以通过来自 Linux 基金会和 edX 的 ["介绍 Linux" ][5] 免费课程来学习更多的知识。

--------------------------------------------------------------------------------

via: https://www.linux.com/blog/learn/intro-to-linux/2018/1/how-create-docker-image

作者：[SWAPNIL BHARTIYA][a]
译者：[qhwdw](https://github.com/qhwdw)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linux.com/users/arnieswap
[1]:https://www.linux.com/blog/learn/intro-to-linux/how-install-docker-ce-your-desktop
[2]:https://lh6.googleusercontent.com/m7_f7No0pmZr2iQmEOH5_ID6MDG2oEnODpQZkUL7q3GYRB9f1-lvMYLE5f3GBpzIk-ev5VlcB0FHYSxn6NNQjxY4jJGqcgdFWaeQ-027qX_g-SVtbCCMybJeD6QIXjzM2ga8M4l4
[3]:https://lh3.googleusercontent.com/vpZ8ts9oq3uk--z4n6KP3DD3uD_P4EpG7fX06MC3uFvj2-WaI1DfOfec9ZXuN7XUNObQ2SCc4Nbiqp-CM7ozUcQmtuzmOdtUHTF4Jq8YxkC49o2k7y5snZqTXsueITZyaLiHq8bT
[4]:https://github.com/fauria/docker-lamp/blob/master/Dockerfile
[5]:https://training.linuxfoundation.org/linux-courses/system-administration-training/introduction-to-linux

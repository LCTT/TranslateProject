一些重要 Docker 命令的简单介绍
================================================================================
大家好，今天我们来学习一些在你使用 Docker 之前需要了解的重要的 Docker 命令。[Docker][1] 是一个开源项目，提供了一个可以打包、装载和运行任何应用的轻量级容器的开放平台。它没有语言支持、框架和打包系统的限制，从小型的家用电脑到高端服务器，在何时何地都可以运行。这使它们可以不依赖于特定软件栈和供应商，像一块块积木一样部署和扩展网络应用、数据库和后端服务。

Docker 命令简单易学，也很容易实现或实践。这是一些你运行 Docker 并充分利用它需要知道的简单 Docker 命令。

### 1. 拉取 Docker 镜像 ###

由于容器是由 Docker 镜像构建的，首先我们需要拉取一个 docker 镜像来开始。我们可以从 Docker Registry Hub 获取所需的 docker 镜像。在我们使用 pull 命令拉取任何镜像之前，为了避免 pull 命令的一些恶意风险，我们需要保护我们的系统。为了保护我们的系统不受这个风险影响，我们需要添加 **127.0.0.1 index.docker.io** 到 /etc/hosts 条目。我们可以通过使用喜欢的文本编辑器完成。

    # nano /etc/hosts

现在，增加下面的一行到文件并保存退出。

    127.0.0.1 index.docker.io

![Docker 宿主机](http://blog.linoxide.com/wp-content/uploads/2015/04/docker-hosts.png)

要拉取一个 docker 镜像，我们需要运行下面的命令。

    # docker pull registry.hub.docker.com/busybox

![Docker pull 命令](http://blog.linoxide.com/wp-content/uploads/2015/04/pulling-image.png)

我们可以检查本地是否有可用的 Docker 镜像。

    # docker images

![Docker 镜像](http://blog.linoxide.com/wp-content/uploads/2015/04/docker-images.png)

### 2. 运行 Docker 容器 ###

现在，成功地拉取要求的或所需的 Docker 镜像之后，我们当然想运行这个 Docker 镜像。我们可以用 docker run 命令在镜像上运行一个 docker 容器。在 Docker 镜像上运行一个 docker 容器时我们有很多选项和标记。我们使用 -t 和 -i 选项来运行一个 docker 镜像并进入容器，如下面所示。

    # docker run -it busybox

![Docker Run Shell 命令](http://blog.linoxide.com/wp-content/uploads/2015/04/docker-run-shell.png)

从上面的命令中，我们进入了容器并可以通过交互 shell 访问它的内容。我们可以键入 **Ctrl-D** 从shell中退出。

现在，在后台运行容器，我们用 -d 标记分离 shell，如下所示。

    # docker run -itd busybox

![后台运行容器](http://blog.linoxide.com/wp-content/uploads/2015/04/run-container-background.png)

如果你想进入到一个正在运行的容器，我们可以使用 attach 命令加一个容器 id。可以使用 **docker ps** 命令获取容器 id。

    # docker attach <container id>

![进入Docker](http://blog.linoxide.com/wp-content/uploads/2015/04/docker-attach.png)

### 3. 检查容器运行 ###

不论容器是否运行，查看日志文件都很简单。我们可以使用下面的命令去检查是否有 docker 容器在实时运行。

    # docker ps

现在，查看正在运行的或者之前运行的容器的日志，我们需要运行以下的命令。

    # docker ps -a

![查看 Docker 容器](http://blog.linoxide.com/wp-content/uploads/2015/04/view-docker-containers1.png)

### 4. 查看容器信息 ###

我们可以使用 inspect 命令查看一个 Docker 容器的各种信息。

    # docker inspect <container id>

![检查Docker](http://blog.linoxide.com/wp-content/uploads/2015/04/docker-inspect.png)

### 5. 杀死或删除 ###

我们可以使用容器 id 杀死或者停止 docker 容器（进程），如下所示。

    # docker stop <container id>

要停止每个正在运行的容器，我们需要运行下面的命令。

    # docker kill $(docker ps -q)

现在，如我我们希望移除一个 docker 镜像，运行下面的命令。

    # docker rm <container id>

如果我们想一次性移除所有 docker 镜像，我们可以运行以下命令。

    # docker rm $(docker ps -aq)

### 结论 ###

这些都是充分学习和使用 Docker 很基本的 docker 命令。有了这些命令，Docker 变得很简单，可以提供给最终用户一个易用的计算平台。根据上面的教程，任何人学习 Docker 命令都非常简单。如果你有任何问题，建议，反馈，请写到下面的评论框中以便我们改进和更新内容。多谢！ 希望你喜欢 :-)

--------------------------------------------------------------------------------

via: http://linoxide.com/linux-how-to/important-docker-commands/

作者：[Arun Pyasi][a]
译者：[ictlyh](https://github.com/ictlyh)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/arunp/
[1]:https://www.docker.com/
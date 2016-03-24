在 VirtualBox 中使用 Docker Machine 管理主机
================================================================================
大家好，今天我们学习在 VirtualBox 中使用 Docker Machine 来创建和管理 Docker 主机。Docker Machine 是一个可以帮助我们在电脑上、在云端、在数据中心内创建 Docker 主机的应用。它为根据用户的配置和需求创建服务器并在其上安装 Docker和客户端提供了一个轻松的解决方案。这个 API 可以用于在本地主机、或数据中心的虚拟机、或云端的实例提供 Docker 服务。Docker Machine 支持 Windows、OSX 和 Linux，并且是以一个独立的二进制文件包形式安装的。仍然使用（与现有 Docker 工具）相同的接口，我们就可以充分利用已经提供 Docker 基础框架的生态系统。只要一个命令，用户就能快速部署 Docker 容器。

本文列出一些简单的步骤用 Docker Machine 来部署 docker 容器。

### 1. 安装 Docker Machine ###

Docker Machine 完美支持所有 Linux 操作系统。首先我们需要从 [github][1] 下载最新版本的 Docker Machine，本文使用 curl 作为下载工具，Docker Machine 版本为 0.2.0。

**64 位操作系统**

    # curl -L https://github.com/docker/machine/releases/download/v0.2.0/docker-machine_linux-amd64 > /usr/local/bin/docker-machine

**32 位操作系统**

    # curl -L https://github.com/docker/machine/releases/download/v0.2.0/docker-machine_linux-i386 > /usr/local/bin/docker-machine

下载完成后，找到 **/usr/local/bin** 目录下的 **docker-machine** 文件，让其可以执行：

    # chmod +x /usr/local/bin/docker-machine

确认是否成功安装了 docker-machine，可以运行下面的命令，它会打印 Docker Machine 的版本信息：

    # docker-machine -v

![安装 Docker Machine](http://blog.linoxide.com/wp-content/uploads/2015/05/installing-docker-machine.png)

运行下面的命令，安装 Docker 客户端，以便于在我们自己的电脑止运行 Docker 命令：

    # curl -L https://get.docker.com/builds/linux/x86_64/docker-latest > /usr/local/bin/docker
    # chmod +x /usr/local/bin/docker

### 2. 创建 VirtualBox 虚拟机 ###

在 Linux 系统上安装完 Docker Machine 后，接下来我们可以安装 VirtualBox 虚拟机，运行下面的就可以了。`--driver virtualbox` 选项表示我们要在 VirtualBox 的虚拟机里面部署 docker，最后的参数“linux” 是虚拟机的名称。这个命令会下载 [boot2docker][2] iso，它是个基于 Tiny Core Linux 的轻量级发行版，自带 Docker 程序，然后 `docker-machine` 命令会创建一个 VirtualBox 虚拟机（LCTT译注：当然，我们也可以选择其他的虚拟机软件）来运行这个 boot2docker 系统。

    # docker-machine create --driver virtualbox linux

![创建 Docker Machine](http://blog.linoxide.com/wp-content/uploads/2015/05/creating-docker-machine.png)

测试下有没有成功运行 VirtualBox 和 Docker，运行命令：

    # docker-machine ls

![Docker Machine List](http://blog.linoxide.com/wp-content/uploads/2015/05/docker-machine-list.png)

如果执行成功，我们可以看到在 ACTIVE 那列下面会出现一个星号“*”。

### 3. 设置环境变量 ###

现在我们需要让 docker 与 docker-machine 通信，运行 `docker-machine env <虚拟机名称>` 来实现这个目的。

    # eval "$(docker-machine env linux)"
    # docker ps

这个命令会设置 TLS 认证的环境变量，每次重启机器或者重新打开一个会话都需要执行一下这个命令，我们可以看到它的输出内容：

    # docker-machine env linux

    export DOCKER_TLS_VERIFY=1
    export DOCKER_CERT_PATH=/Users/<your username>/.docker/machine/machines/dev
    export DOCKER_HOST=tcp://192.168.99.100:2376

### 4. 运行 Docker 容器 ###

完成配置后我们就可以在 VirtualBox 上运行 docker 容器了。测试一下，我们可以运行虚拟机 `docker run busybox` ，并在里面里执行 `echo hello world` 命令，我们可以看到容器的输出信息。

    # docker run busybox echo hello world

![运行 Docker 容器](http://blog.linoxide.com/wp-content/uploads/2015/05/running-docker-container.png)

### 5. 拿到 Docker 主机的 IP ###

我们可以执行下面的命令获取运行 Docker 的主机的 IP 地址。我们可以看到在 Docker 主机的 IP 地址上的任何暴露出来的端口。

    # docker-machine ip

![Docker IP 地址](http://blog.linoxide.com/wp-content/uploads/2015/05/docker-ip-address.png)

### 6. 管理主机 ###

现在我们可以随心所欲地使用上述的 docker-machine 命令来不断创建主机了。

当你使用完 docker 时，可以运行 **docker-machine stop** 来停止所有主机，如果想开启所有主机，运行 **docker-machine start**。

    # docker-machine stop
    # docker-machine start

你也可以只停止或开启一台主机：

    $ docker-machine stop linux
    $ docker-machine start linux

### 总结 ###

最后，我们使用 Docker Machine 成功在 VirtualBox 上创建并管理一台 Docker 主机。Docker Machine 确实能让用户快速地在不同的平台上部署 Docker 主机，就像我们这里部署在 VirtualBox 上一样。这个 virtualbox 驱动可以在本地机器上使用，也可以在数据中心的虚拟机上使用。Docker Machine 驱动除了支持本地的 VirtualBox 之外，还支持远端的 Digital Ocean、AWS、Azure、VMware 以及其它基础设施。

如果你有任何疑问，或者建议，请在评论栏中写出来，我们会不断改进我们的内容。谢谢，祝愉快。 

--------------------------------------------------------------------------------

via: http://linoxide.com/linux-how-to/host-virtualbox-docker-machine/

作者：[Arun Pyasi][a]
译者：[bazz2](https://github.com/bazz2)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/arunp/
[1]:https://github.com/docker/machine/releases
[2]:https://github.com/boot2docker/boot2docker

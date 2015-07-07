基础的Docker容器网络命令
================================================================================
各位好，今天我们将学习一些Docker容器的基础命令。Docker 是一个开源项目，提供了一个可以打包、装载和运行任何应用的轻量级容器的开放平台。它没有语言支持、框架和打包系统的限制，从小型的家用电脑到高端服务器，在何时何地都可以运行。它可以使部署和扩展web应用程序、数据库和后端服务像搭积木一样容易，而不依赖特定技术栈或提供商。Docker适用于网络环境，它正应用于数据中心、ISP和越来越多的网络服务。

因此，这里有一些你在管理Docker容器的时候会用到的一些命令。

### 1. 找到Docker接口 ###

Docker默认会创建一个名为docker0的网桥接口作为连接外部世界的基础。运行中的docker容器直接连接到网桥接口docker0。默认上，docker会分配172.17.42.1/16给docker0，它是所有运行中的容器ip地址的子网。找到Docker接口的ip地址非常简单。要找出docker0网桥接口和连接到网桥上的docker容器，我们可以在安装了docker的终端或者shell中运行ip命令。

    # ip a

![Docker Interface](http://blog.linoxide.com/wp-content/uploads/2015/05/docker-interface.png)

### 2. 得到Docker容器的ip地址 ###

如我们上面读到的，docker在宿主机中创建了一个叫docker0的网桥接口。在我们创建一个新的docker容器时，它自动被默认分配了一个在该子网范围内的ip地址。因此，要检测运行中的Docker容器的ip地址，我们需要进入一个正在运行的容器并用下面的命令检查ip地址。首先，我们运行一个新的容器并进入其中。如果你已经有一个正在运行的容器，你可以跳过这个步骤。

    # docker run -it ubuntu

现在，我们可以运行ip a来得到容器的ip地址了。

    # ip a

![Docker Container IP](http://blog.linoxide.com/wp-content/uploads/2015/05/docker-container-ip.png)

### 3. 映射暴露的端口 ###

要映射配置在Dockerfile的暴露端口到宿主机的高位端口，我们只需用下面带上-P标志的命令。这会打开docker容器的随机端口并映射到Dockerfile中定义的端口。下面是使用-P来打开/暴露定义的端口的例子。

    # docker run -itd -P httpd

![Mapping Expose Port](http://blog.linoxide.com/wp-content/uploads/2015/05/mapping-expose-port.png)

上面的命令会映射容器的端口到 httpd 容器的 Dockerfile 中定义的80端口上。我们用下面的命令来查看正在运行的容器暴露的端口。

    # docker ps

并且可以用下面的curl命令来检查。

    # curl http://localhost:49153

![Curl Exposed Port](http://blog.linoxide.com/wp-content/uploads/2015/05/curl-exposed-port-e1431034586219.png)

### 4. 映射到特定的端口上 ###

我们也可以映射暴露端口或者docker容器端口到我们指定的端口上。要实现这个，我们用-p标志来定义我们所需的端口。这里是我们的一个例子。

    # docker run -itd -p 8080:80 httpd

上面的命令会映射（宿主机的）8080端口到（容器的）80上。我们可以运行curl来检查这点。

    # curl http://localhost:8080

![Mapping Specific Port](http://blog.linoxide.com/wp-content/uploads/2015/05/mapping-specific-port.png)

### 5. 创建自己的网桥 ###

要给容器创建一个自定义的IP地址，在本篇中我们会创建一个名为br0的新网桥。要分配需要的ip地址，我们需要在运行docker的宿主机中运行下面的命令。

    # stop docker.io
    # ip link add br0 type bridge
    # ip addr add 172.30.1.1/20 dev br0
    # ip link set br0 up
    # docker -d -b br0

![Creating Bridge Interface](http://blog.linoxide.com/wp-content/uploads/2015/05/creating-bridge-interface.png)

创建完docker网桥之后，我们要让docker的守护进程知道它。

    # echo 'DOCKER_OPTS="-b=br0"' >> /etc/default/docker
    # service docker.io start

![Adding Interface to Docker](http://blog.linoxide.com/wp-content/uploads/2015/05/adding-interface-to-docker.png)

到这里，桥接后的接口将会分配给容器在桥接子网内的新ip地址。

### 6. 链接到另外一个容器上 ###

我们可以用Docker将一个容器连接到另外一个上。我们可以在不同的容器上运行不同的程序，并且相互连接或链接。链接允许容器间相互连接并从一个容器上安全地传输信息给另一个容器。要做到这个，我们可以使用--link标志。首先，我们使用--name标志来标示training/postgres镜像。

    # docker run -d --name db training/postgres

![Running db Container](http://blog.linoxide.com/wp-content/uploads/2015/05/running-db-container.png)

完成之后，我们将容器db与training/webapp链接来形成新的叫web的容器。

    # docker run -d -P --name web --link db:db training/webapp python app.py

![linking two containers](http://blog.linoxide.com/wp-content/uploads/2015/05/linking-two-containers.png)

### 总结 ###

Docker网络很神奇也好玩，我们可以对docker容器做很多事情。我们可以把玩这些简单而基础的docker网络命令。docker的网络是非常先进的，我们可以用它做很多事情。

如果你有任何的问题、建议、反馈请在下面的评论栏写下来以便于我们我们可以提升或者更新文章的内容。谢谢！ 玩得开心！:-)

--------------------------------------------------------------------------------

via: http://linoxide.com/linux-how-to/networking-commands-docker-containers/

作者：[Arun Pyasi][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/arunp/

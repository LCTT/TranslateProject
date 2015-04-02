如何交互式地创建一个Docker容器
===============================================================================
大家好，今天我们来学习如何使用一个docker镜像交互式地创建一个Docker容器。一旦我们从镜像中启动一个Docker进程，Docker就会在父镜像与子镜像间来回搬运，重复工作，直到到达子镜像。然后联合文件系统会在顶层添加一个读写层。读写层又叫一个 **Container** 包含一些信息，关于它的父镜像和一些其他的信息，如单独的ID，网络配置和资源限制。容器已经声明，他们可以从 **running** 切换到 **exited** 状态。一个处于 **running** 状态的容器包含了很多分支在CPU上面运行，独立于其他在主机上运行的进程，而主机上 **exited** 是文件系统的状态，它的退出变量值是保留的。你可以使用读写层来启动，停止和重启一个容器。

Docker技术为IT界带来了巨大的改变，它使得云服务可以用来共享应用和工作流程自动化，使得应用可以从组件快速组合，消除了开发与品质保证和产品环境间的摩擦。在这篇文章中，我们将会建立CentOS环境，然后维护一个网站，在Apache网络服务器下运行。

这是快速且容易的教程，讨论我们怎样使用一个交互的shell，以一个交互的方式来创建一个容器。

### 1. 运行一个Docker实例 ###

Docker一开始尝试从本地取得和运行所需的镜像，如果在本地主机上没有发现，它就会从[Docker公共注册中心][1]拉取。这里，我们将会在一个DOcker容器里取得并创建一个fedora实例，附加一个bash shell到tty

	# docker run -i -t fedora bash

![Downloading Fedora Base Image](http://blog.linoxide.com/wp-content/uploads/2015/03/downloading-fedora-base-image.png)

### 2.安装Apache网络服务器 ###

现在，在我们的Fedora基本镜像准备好后，我们将会开始交互式地安装Apache网络服务器，而不必为它创建Dockerfile。为了做到这点，我们需要在终端或者shell运行以下命令。

	# yum update
	
![Installing httpd](http://blog.linoxide.com/wp-content/uploads/2015/03/installing-httpd2.png)
    
    # yum install httpd

![Installing httpd](http://blog.linoxide.com/wp-content/uploads/2015/03/installing-httpd2.png)
    
    # exit

### 3.Saving the Image ###

现在，我们要去保存在Fedora实例里做的修改。要做到这个，我们首先需要知道实例的容器ID。而为了得到ID，我们又需要运行以下命令。

    # docker ps -a

![Docker Running Container](http://blog.linoxide.com/wp-content/uploads/2015/03/docker-running-container.png)

然后，我们会保存这些改变为一个新的镜像，请运行以下命令。

    # docker commit c16378f943fe fedora-httpd

![committing fedora httpd](http://blog.linoxide.com/wp-content/uploads/2015/03/committing-fedora-httpd.png)

这里，修改已经通过使用容器ID保存起来了，镜像名字叫fedora-httpd。为了确认新的镜像时候在运行，我们将运行以下命令

    # docker images

![view docker images](http://blog.linoxide.com/wp-content/uploads/2015/03/view-docker-images.png)

### 4. 添加内容到新的镜像 ###

我们自己新的Fedora Apache镜像正成功的运行，现在我们想添加一些网页内容到Apache网络服务器，包括我们的网站，使得网站能够脱离盒子正确运行。为做到这点，我们需要创建一个新的Dockerfile，它会处理从复制网页内容到使用80端口的所有操作。而为做到这，我们又需要使用我们最喜欢的文本编辑器创建Dockerfile文件，像下面演示的一样。

    # nano Dockerfile

现在，我们需要添加以下的命令行到文件中。

    FROM fedora-httpd
    ADD mysite.tar /tmp/
    RUN mv /tmp/mysite/* /var/www/html
    EXPOSE 80
    ENTRYPOINT [ "/usr/sbin/httpd" ]
    CMD [ "-D", "FOREGROUND" ]

![configuring Dockerfile](http://blog.linoxide.com/wp-content/uploads/2015/03/configuring-Dockerfile.png)

这里，运行Dockerfile，mysite.tar里的网页内容会自动解压到/temp/文件夹里。然后，整个文件会被转移到Apache网页根目录/var/www/html/，命令expose 80会打开80端口，这样网站就能正常访问。其次，入口点放在了/usr/sbin/https里面，保证Apache服务器能够执行。

### 5. 建立并运行一个容器　###

现在，为了添加我们网站在上面，我们要用刚刚创建的Dockerfile创建我们的容器，为做到这，我们需要运行以下命令。

    # docker build -rm -t mysite .

![Building mysite Image](http://blog.linoxide.com/wp-content/uploads/2015/03/building-mysite-image.png)

我们建立自己的容器后，我们想要用下面的命令来运行容器。

    # docker run -d -P mysite

![Running mysite Container](http://blog.linoxide.com/wp-content/uploads/2015/03/running-mysite-container.png)

### 总结 ###

最后，我们已经成功的以交互式的方式建立了一个Docker容器。在本节方法中，我们是直接通过交互的shell命令建立我们的容器和镜像。这种方法十分简单且快速，在建立与配置镜像与容器方面。如果你有任何问题，建议和反馈，请在下方的评论框里写下来，以便我们可以提升或者更新我们的文章。谢谢！祝生活快乐 :-)

--------------------------------------------------------------------------------

via: http://linoxide.com/linux-how-to/interactively-create-docker-container/

作者：[Arun Pyasi][a]
译者：[wi-cuckoo](https://github.com/wi-cuckoo)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/arunp/
[1]:https://registry.hub.docker.com/

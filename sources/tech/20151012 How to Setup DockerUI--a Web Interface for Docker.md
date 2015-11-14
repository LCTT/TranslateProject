translating by Ezio

在浏览器上使用Docker
================================================================================
Docker 越来越流行了。在一个容器里面而不是虚拟机里运行一个完整的操作系统的这种是一个非常棒的技术和想法。docker 已经通过节省工作时间来拯救了千上万的系统管理员和开发人员。这是一个开源技术，提供一个平台来把应用程序当作容器来打包、分发、共享和运行，而不去关注主机上运行的操作系统是什么。它没有开发语言、框架或打包系统的限制，并且可以在任何时间、任何地点运行，从小型计算机到高端服务器都可以。运行docker容器和管理他们可能会花费一点点困难和时间，所以现在有一款基于web 的应用程序－DockerUI，可以让管理和运行容器变得很简单。DockerUI 是一个对那些不熟悉Linux 命令行担忧很想运行容器话程序的人很有帮助。DockerUI 是一个开源的基于web 的应用程序，它最著名的是它华丽的设计和简单的用来运行和管理docker 的简单的操作界面。

下面会介绍如何在Linux 上安装配置DockerUI。

### 1. 安装docker ###

首先，我们需要安装docker。我们得感谢docker 的开发者，让我们可以简单的在主流linux 发行版上安装docker。为了安装docker，我们得在对应的发行版上使用下面的命令。

#### Ubuntu/Fedora/CentOS/RHEL/Debian ####

docker 维护者已经写了一个非常棒的脚本，用它可以在Ubuntu 15.04/14.10/14.04, CentOS 6.x/7, Fedora 22, RHEL 7 和Debian 8.x 这几个linux 发行版上安装docker。这个脚本可以识别出我们的机器上运行的linux 的发行版本，然后将需要的源库添加到文件系统、更新本地的安装源目录，最后安装docker 和依赖库。要使用这个脚本安装docker，我们需要在root 用户或者sudo 权限下运行如下的命令，

    # curl -sSL https://get.docker.com/ | sh

#### OpenSuse/SUSE Linux 企业版 ####

要在运行了OpenSuse 13.1/13.2 或者 SUSE Linux Enterprise Server 12 的机器上安装docker，我们只需要简单的执行zypper 命令。运行下面的命令就可以安装最新版本的docker： 

    # zypper in docker

#### ArchLinux ####

docker 存在于ArchLinux 的官方源和社区维护的AUR 库。所以在ArchLinux 上我们有两条路来安装docker。使用官方源安装，需要执行下面的pacman 命令：

    # pacman -S docker

如果要从社区源 AUR 安装docker，需要执行下面的命令：

    # yaourt -S docker-git

### 2. 启动 ###

安装好docker 之后，我们需要运行docker 监护程序，然后再能运行并管理docker 容器。我们需要使用下列命令来确定docker 监护程序已经安装并运行了。 

#### 在 SysVinit 上####

    # service docker start

#### 在Systemd 上####

    # systemctl start docker

### 3. 安装DockerUI ###

安装DockerUI 比安装docker 要简单很多。我们仅仅需要懂docker 注册表上拉取dockerui ，然后在容器里面运行。要完成这些，我们只需要简单的执行下面的命令：

    # docker run -d -p 9000:9000 --privileged -v /var/run/docker.sock:/var/run/docker.sock dockerui/dockerui

![Starting DockerUI Container](http://blog.linoxide.com/wp-content/uploads/2015/09/starting-dockerui-container.png)

在上面的命令里，dockerui 使用的默认端口是9000，我们需要使用`-p` 命令映射默认端口。使用`-v` 标志我们可以指定docker socket。如果主机使用了SELinux那么就得使用`--privileged` 标志。

执行完上面的命令后，我们要检查dockerui 容器是否运行了，或者使用下面的命令检查：

    # docker ps

![Running Docker Containers](http://blog.linoxide.com/wp-content/uploads/2015/09/running-docker-containers.png)

### 4. 拉取docker镜像 ###

Currently, we cannot pull an image directly from DockerUI so, we'll need to pull a docker image from the linux console/terminal. To do so, we'll need to run the following command.

    # docker pull ubuntu

![Docker Image Pull](http://blog.linoxide.com/wp-content/uploads/2015/10/docker-image-pull.png)

The above command will pull an image tagged as ubuntu from the official [Docker Hub][1]. Similarly, we can pull more images that we require and are available in the hub.

### 4. 管理 ###

After we have started the dockerui container, we'll now have fun with it to start, pause, stop, remove and perform many possible activities featured by dockerui with docker containers and images. First of all, we'll need to open the web application using our web browser. To do so, we'll need to point our browser to http://ip-address:9000 or http://mydomain.com:9000 according to the configuration of our system. By default, there is no login authentication needed for the user access but we can configure our web server for adding authentication. To start a container, first we'll need to have images of the required application we want to run a container with.

#### 创建 ####

To create a container, we'll need to go to the section named Images then, we'll need to click on the image id which we want to create a container of. After clicking on the required image id, we'll need to click on Create button then we'll be asked to enter the required properties for our container. And after everything is set and done. We'll need to click on Create button to finally create a container.

![Creating Docker Container](http://blog.linoxide.com/wp-content/uploads/2015/10/creating-docker-container.png)

#### 中止 ####

To stop a container, we'll need to move towards the Containers page and then select the required container we want to stop. Now, we'll want to click on Stop option which we can see under Actions drop-down menu.

![Managing Container](http://blog.linoxide.com/wp-content/uploads/2015/10/managing-container.png)

#### 暂停与恢复 ####

To pause a container, we simply select the required container we want to pause by keeping a check mark on the container and then click the Pause option under Actions . This is will pause the running container and then, we can simply resume the container by selecting Unpause option from the Actions drop down menu.

#### 删除 ####

Like we had performed the above tasks, its pretty easy to kill and remove a container or an image. We just need to check/select the required container or image and then select the Kill or Remove button from the application according to our need.

### 结论 ###

DockerUI is a beautiful utilization of Docker Remote API to develop an awesome web interface for managing docker containers. The developers have designed and developed this application in pure HTML and JS language. It is currently incomplete and is under heavy development so we don't recommend it for the use in production currently. It makes users pretty easy to manage their containers and images with simple clicks without needing to execute lines of commands to do small jobs. If we want to contribute DockerUI, we can simply visit its [Github Repository][2]. If you have any questions, suggestions, feedback please write them in the comment box below so that we can improve or update our contents. Thank you !

--------------------------------------------------------------------------------

via: http://linoxide.com/linux-how-to/setup-dockerui-web-interface-docker/

作者：[Arun Pyasi][a]
译者：[oska874](https://github.com/oska874)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/arunp/
[1]:https://hub.docker.com/
[2]:https://github.com/crosbymichael/dockerui/

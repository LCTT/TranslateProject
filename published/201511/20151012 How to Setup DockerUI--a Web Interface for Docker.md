用浏览器管理 Docker
================================================================================
Docker 越来越流行了。在一个容器里面而不是虚拟机里运行一个完整的操作系统是一种非常棒的技术和想法。docker 已经通过节省工作时间来拯救了成千上万的系统管理员和开发人员。这是一个开源技术，提供一个平台来把应用程序当作容器来打包、分发、共享和运行，而不用关注主机上运行的操作系统是什么。它没有开发语言、框架或打包系统的限制，并且可以在任何时间、任何地点运行，从小型计算机到高端服务器都可以。运行 docker 容器和管理它们可能会花费一点点努力和时间，所以现在有一款基于 web 的应用程序－DockerUI，可以让管理和运行容器变得很简单。DockerUI 是一个对那些不熟悉 Linux 命令行，但又很想运行容器化程序的人很有帮助的工具。DockerUI 是一个开源的基于 web 的应用程序，它最值得称道的是它华丽的设计和用来运行和管理 docker 的简洁的操作界面。

下面会介绍如何在 Linux 上安装配置 DockerUI。

### 1. 安装 docker ###

首先，我们需要安装 docker。我们得感谢 docker 的开发者，让我们可以简单的在主流 linux 发行版上安装 docker。为了安装 docker，我们得在对应的发行版上使用下面的命令。

#### Ubuntu/Fedora/CentOS/RHEL/Debian ####

docker 维护者已经写了一个非常棒的脚本，用它可以在 Ubuntu 15.04/14.10/14.04、 CentOS 6.x/7、 Fedora 22、 RHEL 7 和 Debian 8.x 这几个 linux 发行版上安装 docker。这个脚本可以识别出我们的机器上运行的 linux 的发行版本，然后将需要的源库添加到文件系统、并更新本地的安装源目录，最后安装 docker 及其依赖库。要使用这个脚本安装docker，我们需要在 root 用户或者 sudo 权限下运行如下的命令，

    # curl -sSL https://get.docker.com/ | sh

#### OpenSuse/SUSE Linux 企业版 ####

要在运行了 OpenSuse 13.1/13.2 或者 SUSE Linux Enterprise Server 12 的机器上安装 docker，我们只需要简单的执行zypper 命令。运行下面的命令就可以安装最新版本的docker： 

    # zypper in docker

#### ArchLinux ####

docker 在 ArchLinux 的官方源和社区维护的 AUR 库中可以找到。所以在 ArchLinux 上我们有两种方式来安装 docker。使用官方源安装，需要执行下面的 pacman 命令：

    # pacman -S docker

如果要从社区源 AUR 安装 docker，需要执行下面的命令：

    # yaourt -S docker-git

### 2. 启动 ###

安装好 docker 之后，我们需要运行 docker 守护进程，然后才能运行并管理 docker 容器。我们需要使用下列命令来确认 docker 守护进程已经安装并运行了。 

#### 在 SysVinit 上####

    # service docker start

#### 在Systemd 上####

    # systemctl start docker

### 3. 安装 DockerUI ###

安装 DockerUI 比安装 docker 要简单很多。我们仅仅需要从 docker 注册库上拉取 dockerui ，然后在容器里面运行。要完成这些，我们只需要简单的执行下面的命令：

    # docker run -d -p 9000:9000 --privileged -v /var/run/docker.sock:/var/run/docker.sock dockerui/dockerui

![Starting DockerUI Container](http://blog.linoxide.com/wp-content/uploads/2015/09/starting-dockerui-container.png)

在上面的命令里，dockerui 使用的默认端口是9000，我们需要使用`-p` 命令映射默认端口。使用`-v` 标志我们可以指定docker 的 socket。如果主机使用了 SELinux 那么就得使用`--privileged` 标志。

执行完上面的命令后，我们要检查 DockerUI 容器是否运行了，或者使用下面的命令检查：

    # docker ps

![Running Docker Containers](http://blog.linoxide.com/wp-content/uploads/2015/09/running-docker-containers.png)

### 4. 拉取 docker 镜像 ###

现在我们还不能直接使用 DockerUI 拉取镜像，所以我们需要在命令行下拉取 docker 镜像。要完成这些我们需要执行下面的命令。

    # docker pull ubuntu

![Docker Image Pull](http://blog.linoxide.com/wp-content/uploads/2015/10/docker-image-pull.png)

上面的命令将会从 docker 官方源 [Docker Hub][1]拉取一个标志为 ubuntu 的镜像。类似的我们可以从 Hub 拉取需要的其它镜像。

### 4. 管理 ###

启动了 DockerUI 容器之后，我们可以用它来执行启动、暂停、终止、删除以及 DockerUI 提供的其它操作 docker 容器的命令。

首先，我们需要在 web 浏览器里面打开 dockerui：在浏览器里面输入 http://ip-address:9000 或者 http://mydomain.com:9000，具体要根据你的系统配置。默认情况下登录不需要认证，但是可以配置我们的 web 服务器来要求登录认证。要启动一个容器，我们需要有包含我们要运行的程序的镜像。

#### 创建 ####

创建容器我们需要在 Images 页面里，点击我们想创建的容器的镜像 id。然后点击 `Create` 按钮，接下来我们就会被要求输入创建容器所需要的属性。这些都完成之后，我们需要点击按钮`Create` 完成最终的创建。

![Creating Docker Container](http://blog.linoxide.com/wp-content/uploads/2015/10/creating-docker-container.png)

#### 停止 ####

要停止一个容器，我们只需要跳转到`Containers` 页面，然后选取要停止的容器。然后在 Action 的子菜单里面按下 Stop 就行了。

![Managing Container](http://blog.linoxide.com/wp-content/uploads/2015/10/managing-container.png)

#### 暂停与恢复 ####

要暂停一个容器，只需要简单的选取目标容器，然后点击 Pause 就行了。恢复一个容器只需要在 Actions 的子菜单里面点击 Unpause 就行了。

#### 删除 ####

类似于我们上面完成的任务，杀掉或者删除一个容器或镜像也是很简单的。只需要检查、选择容器或镜像，然后点击 Kill 或者 Remove 就行了。

### 结论 ###

DockerUI 使用了 docker 远程 API  提供了一个很棒的管理 docker 容器的 web 界面。它的开发者们完全使用 HTML 和 JS 设计、开发了这个应用。目前这个程序还处于开发中，并且还有大量的工作要完成，所以我们并不推荐将它应用在生产环境。它可以帮助用户简单的完成管理容器和镜像，而且只需要一点点工作。如果想要为 DockerUI 做贡献，可以访问它们的 [Github 仓库][2]。如果有问题、建议、反馈，请写在下面的评论框，这样我们就可以修改或者更新我们的内容。谢谢。

--------------------------------------------------------------------------------

via: http://linoxide.com/linux-how-to/setup-dockerui-web-interface-docker/

作者：[Arun Pyasi][a]
译者：[oska874](https://github.com/oska874)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/arunp/
[1]:https://hub.docker.com/
[2]:https://github.com/crosbymichael/dockerui/

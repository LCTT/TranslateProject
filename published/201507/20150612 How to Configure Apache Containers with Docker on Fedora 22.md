如何在Fedora 22上面配置Apache的Docker容器
=============================================================================

在这篇文章中，我们将会学习关于Docker的一些知识，如何使用Docker部署Apache httpd服务，并且共享到Docker Hub上面去。首先，我们学习怎样拉取和使用Docker Hub里面的镜像，然后在一个Fedora 22的镜像上交互式地安装Apache，之后我们将会学习如何用一个Dockerfile文件来以一种更快，更优雅的方式制作一个镜像。最后，我们将我们创建的镜像发布到Docker Hub上，这样以后任何人都可以下载并使用它。

### 安装并初体验Docker ###

**要求**

运行Docker，你至少需要满足这些：

- 你需要一个64位的内核，版本3.10或者更高
- Iptables 1.4 - Docker会用它来做网络配置，如网络地址转换（NAT）
- Git 1.7 - Docker会使用Git来与仓库交流，如Docker Hub
- ps - 在大多数环境中这个工具都存在，在procps包里有提供
- root - 尽管一般用户可以通过TCP或者其他方式来运行Docker，但是为了简化，我们会假定你就是root

#### 使用dnf安装docker ####

以下的命令会安装Docker

	dnf update && dnf install docker

**注意**：在Fedora 22里，你仍然可以使用Yum命令，但是它被DNF取代了，而且在纯净安装时不可用了。

#### 检查安装 ####

我们将要使用的第一个命令是docker info，这会输出很多信息给你：
	
	docker info

也可以试着用**docker version**：

	docker version

#### 以守护进程方式启动Dcoker####

你应该启动一个docker实例，然后她会处理我们的请求。

	docker -d

现在我们设置 docker 随系统启动，以便我们不需要每次重启都需要运行上述命令。

	chkconfig docker on

让我们用Busybox来打印hello world：

	dockr run -t busybox /bin/echo "hello world"

这个命令里，我们告诉Docker在Busybox镜像的一个实例/容器里执行 /bin/echo "hello world"。Busybox是一个小型的POSIX环境，将许多小工具都结合到了一个单独的可执行程序里。

如果Docker不能在你的系统里找到本地的Busybox镜像，她就会自动从Docker Hub里拉取镜像，正如你可以看下如下的快照：

![Hello world with Busybox](http://blog.linoxide.com/wp-content/uploads/2015/06/docker-hello-world-busybox-complete.png)

*Hello world with Busybox*

再次尝试相同的命令，这次由于Docker已经有了本地的Busybox镜像，你将会看到的全部就是echo的输出：
	
	docker run -t busybox /bin/echo "hello world"

也可以尝试以下的命令进入到容器环境里去：

	docker run -it busybox /bin/sh

使用**exit**命令可以离开容器并停止它

### 交互式地Docker化Apache ###

拉取/下载 Fedora 镜像：
	
	docker pull fedora:22

启动一个容器在后台运行：

	docker run -d -t fedora:22 /bin/bash

列出正在运行地容器及其名字标识，如下

	docker ps

![listing with docker ps and attaching with docker attach](http://blog.linoxide.com/wp-content/uploads/2015/06/docker-ps-with-docker-attach-highlight.png)

*使用docker ps列出，并使用docker attach进入一个容器里*

angry_noble是docker分配给我们容器的名字，所以我们来连接上去：

	docker attach angry_noble

注意：每次你启动一个容器，就会被给与一个新的名字，如果你的容器需要一个固定的名字，你应该在 docker run 命令里使用 -name 参数。

#### 安装Apache ####

下面的命令会更新DNF的数据库，下载安装Apache（httpd包）并清理dnf缓存使镜像尽量小

	dnf -y update && dnf -y install httpd && dnf -y clean all

**配置Apache**

我们需要修改httpd.conf的唯一地方就是ServerName，这会使Apache停止抱怨

	sed -i.orig 's/#ServerName/ServerName/' /etc/httpd/conf/httpd.conf

**设定环境**

为了使Apache运行为独立模式，你必须以环境变量的格式提供一些信息，并且你也需要创建这些变量里的目录，所以我们将会用一个小的shell脚本干这个工作，当然也会启动Apache

    vi /etc/httpd/run_apache_foreground

----------

    #!/bin/bash

    #设置环境变量
    APACHE_LOG_DI=R"/var/log/httpd"
    APACHE_LOCK_DIR="/var/lock/httpd"
    APACHE_RUN_USER="apache"
    APACHE_RUN_GROUP="apache"
    APACHE_PID_FILE="/var/run/httpd/httpd.pid"
    APACHE_RUN_DIR="/var/run/httpd"

    #如果需要的话，创建目录
    if ! [ -d /var/run/httpd ]; then mkdir /var/run/httpd;fi
    if ! [ -d /var/log/httpd ]; then mkdir /var/log/httpd;fi
    if ! [ -d /var/lock/httpd ]; then mkdir /var/lock/httpd;fi

    #运行 Apache
    httpd -D FOREGROUND
	
**另外地**，你可以粘贴这个片段代码到容器shell里并运行:
	
    dnf -y install git && git clone https://github.com/gaiada/run-apache-foreground.git && cd run-apach* && ./install && dnf erase git

上面的内嵌脚本会安装Git，克隆[这个仓库][1]，到文件里去运行脚本，并询问你是否卸载Git。

**保存你的容器状态**

你的容器现在准备好运行Apache，是时候保存容器当前的状态为一个镜像，以备你需要的时候使用。

为了离开容器环境，你必须顺序按下 **Ctrl+q** 和 **Ctrl+p**，如果你仅仅在shell执行exit，你同时也会停止容器，失去目前为止你做过的所有工作。

回到Docker主机，使用 **docker commit** 及容器名和你想要的仓库名字/标签：

	docker commit angry_noble gaiada/apache

现在，你保存了容器的状态到一个镜像里，可以使用 **docker stop** 停止容器了：

	docker stop angry_noble

**运行并测试你的镜像**

最后，从你的新镜像启动一个容器，并且重定向80端口到该容器：

    docker run -p 80:80 -d -t gaiada/apache /etc/httpd/run_apache_foreground

到目前，你正在你的容器里运行Apache，打开你的浏览器访问该服务，在[http://localhost][2]，你将会看到如下Apache默认的页面

![Apache default page running from Docker container](http://blog.linoxide.com/wp-content/uploads/2015/06/docker-apache-running.png)

*在容器里运行的Apache默认页面*

### 使用Dockerfile Docker化Apache ###

现在，我们将要去创建一个新的Apache镜像，这次所有步骤会写在一个Dockerfile文件里，文件将会被用于生成该镜像。

首先，新建一个目录，在里面放Dockerfile文件，并进入该目录：

	mkdir apachedf; cd apachedf

然后创建一个名为Dockerfile的文件，添加以下内容：

    FROM fedora:22

    MAINTAINER Carlos Alberto
    LABEL version="0.1"

    RUN dnf -y update && dnf -y install httpd && dnf -y clean all

    RUN [ -d /var/log/httpd ] || mkdir /var/log/httpd
    RUN [ -d /var/run/httpd ] || mkdir /var/run/httpd
    RUN [ -d /var/lock/httpd ] || mkdir /var/lock/httpd

    RUN sed -i.orig 's/#ServerName/ServerName/' /etc/httpd/conf/httpd.conf

    ENV APACHE_RUN_USER apache
    ENV APACHE_RUN_GROUP apache
    ENV APACHE_LOG_DIR /var/log/httpd
    ENV APACHE_LOCK_DIR /var/lock/httpd
    ENV APACHE_RUN_DIR /var/run/httpd
    ENV APACHE_PID_FILE /var/run/httpd/httpd.pid

    EXPOSE 80

    CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]

我们一起来看看Dockerfile里面有什么：

- **FROM** - 这告诉docker，我们将要使用Fedora 22作为基础镜像
- **MAINTAINER** 和 **LABLE** - 这些命令对镜像没有直接作用，属于标记信息
- **RUN** - 自动完成我们之前交互式做的工作，安装Apache，新建目录并编辑httpd.conf
- **ENV** - 设置环境变量，现在我们再不需要run_apache_foreground脚本
- **EXPOSE** - 暴露80端口给外网
- **CMD** - 设置默认的命令启动httpd服务，这样我们就不需要每次起一个新的容器都重复这个工作

**建立该镜像**

现在，我们将要建立这个镜像，并为其添加tag gaiada/apachedf

	docker build -t gaiada/apachedf:0.1 .

![docker build complete](http://blog.linoxide.com/wp-content/uploads/2015/06/docker-build-complete.png)

*docker完成创建*

使用 **docker images** 列出本地镜像，查看是否存在你新建的镜像：

	docker images

然后运行新的镜像:

	docker run -t -p 80:80 gaiada/apachedf

这就是Dockerfile的工作，使用这项功能会使得事情更加容易，快速并且可重复生成。

### 发布你的镜像 ###

直到现在，你仅仅是从Docker Hub拉取了镜像，但是你也可以推送你的镜像，以后需要也可以再次拉取他们。实际上，其他人也可以下载你的镜像，在他们的系统中使用它而不需要改变任何东西。现在我们将要学习如何使我们的镜像对世界上的其他人可用。

**创建帐号**

为了能够在Docker Hub上推送你的镜像，你需要创建一个帐号。访问 [https://hub.docker.com/account/signup/][3]，填写下面的表格：

![Docker Hub signup page](http://blog.linoxide.com/wp-content/uploads/2015/06/docker-hub-signup.png)

*Docker Hub 注册页面*

**登录**

输入下面的命令，接着输入你注册时提供的用户名，密码和邮箱

	docker login

第一次登录过后，你的帐号信息会被记录在 **～/.dockercfg**

**推送**

推送镜像，使用 **docker push [registry/]your_login/repository_name[:tag]**

	docker push docker.io/gaiada/apachedf

你可能会看见像这样的输出，在你的控制台上：

![Docker push Apache image complete](http://blog.linoxide.com/wp-content/uploads/2015/06/docker-pushing-apachedf-complete.png)

*Docker推送Apache镜像完成*

### 结论 ###

现在，你知道如何Docker化Apache，试一试包含其他一些组件，Perl，PHP，proxy，HTTPS，或者任何你需要的东西。我希望你们这些家伙喜欢她，并推送你们自己的镜像到Docker Hub。

--------------------------------------------------------------------------------

via: http://linoxide.com/linux-how-to/configure-apache-containers-docker-fedora-22/

作者：[Carlos Alberto][a]
译者：[wi-cuckoo](https://github.com/wi-cuckoo)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/carlosal/
[1]:https://github.com/gaiada/run-apache-foreground
[2]:http://localhost/
[3]:https://hub.docker.com/account/signup/


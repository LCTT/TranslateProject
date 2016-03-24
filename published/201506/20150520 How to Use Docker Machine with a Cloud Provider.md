如何在云服务提供商的平台上使用Docker Machine
================================================================================

大家好，今天我们来了解如何使用Docker Machine在各种云服务提供商的平台上部署Docker。Docker Machine是一个可以帮助我们在自己的电脑、云服务提供商的平台以及我们数据中心的机器上创建Docker机器的应用程序。它为创建服务器、在服务器中安装Docker、根据用户需求配置Docker客户端提供了简单的解决方案。驱动API对本地机器、数据中心的虚拟机或者公用云机器都适用。Docker Machine支持Windows、OSX和Linux，并且提供一个独立的二进制文件，可以直接使用。它让我们可以充分利用支持Docker的基础设施的生态环境合作伙伴，并且使用相同的接口进行访问。它让人们可以使用一个命令来简单而迅速地在不同的云平台部署Docker容器。

### 1. 安装Docker Machine ###

Docker Machine可以很好地支持每一种Linux发行版。首先，我们需要从Github网站下载最新版本的。这里我们使用curl来下载目前最新0.2.0版本的Docker Machine。

在64位操作系统运行：

    # curl -L https://github.com/docker/machine/releases/download/v0.2.0/docker-machine_linux-amd64 > /usr/local/bin/docker-machine

在32位操作系统运行：

    # curl -L https://github.com/docker/machine/releases/download/v0.2.0/docker-machine_linux-i386 > /usr/local/bin/docker-machine

下载最新版本的Docker Machine并将docker-machine文件放到了/usr/local/bin/后，添加执行权限：

    # chmod +x /usr/local/bin/docker-machine

完成如上操作后，我们需要确认已经成功安装docker-machine了。可以运行如下命令检查，它会输出系统中docker-machine的版本：

    # docker-machine -v

![Installing Docker Machine](http://blog.linoxide.com/wp-content/uploads/2015/05/installing-docker-machine.png)

要在我们的机器上启用docker命令，需要使用如下命令安装Docker客户端：

        # curl -L https://get.docker.com/builds/linux/x86_64/docker-latest > /usr/local/bin/docker
        # chmod +x /usr/local/bin/docker

### 2. 创建机器 ###

在自己的Linux机器上安装好了Docker Machine之后，我们想要将一个docker虚拟机部署到云服务器上。Docker Machine支持几个流行的云平台，如igital Ocean、Amazon Web Services（AWS）、Microsoft Azure、Google Cloud Computing及其它等等，所以我们可以在不同的平台使用相同的接口来部署Docker。本文中我们会使用digitalocean驱动在Digital Ocean的服务器上部署Docker，--driver选项指定digitalocean驱动，--digitalocean-access-token选项指定[Digital Ocean Control Panel][1]提供的API Token，命令最后的是我们创建的Docker虚拟机的机器名。运行如下命令：

    # docker-machine create --driver digitalocean --digitalocean-access-token <API-Token> linux-dev

    # eval "$(docker-machine env linux-dev)"

![Docker Machine Digitalocean Cloud](http://blog.linoxide.com/wp-content/uploads/2015/05/docker-machine-digitalocean-cloud.png)

**注意**： 这里linux-dev是我们将要创建的机器的名称。`<API-Token>`是一个安全key，可以在Digtal Ocean Control Panel生成。要找到这个key，我们只需要登录到我们的Digital Ocean Control Panel，然后点击API，再点击 Generate New Token，填写一个名称，选上Read和Write。然后我们就会得到一串十六进制的key，那就是`<API-Token>`，简单地替换到上边的命令中即可。

运行如上命令后，我们可以在Digital Ocean Droplet Panel中看到一个具有默认配置的droplet已经被创建出来了。

![DigitalOcean Droplet Panel](http://blog.linoxide.com/wp-content/uploads/2015/05/digitalocean-droplet-panel.png)

简便起见，docker-machine会使用默认配置来部署Droplet。我们可以通过增加选项来定制我们的Droplet。这里是一些digitalocean相关的选项，我们可以使用它们来覆盖Docker Machine所使用的默认配置。

-    --digitalocean-image "ubuntu-14-04-x64" 用于选择Droplet的镜像
-    --digitalocean-ipv6 enable 启用IPv6网络支持
-    --digitalocean-private-networking enable 启用专用网络
-    --digitalocean-region "nyc3" 选择部署Droplet的区域
-    --digitalocean-size "512mb" 选择内存大小和部署的类型

如果你想在其他云服务使用docker-machine，并且想覆盖默认的配置，可以运行如下命令来获取Docker Mackine默认支持的对每种平台适用的参数。

    # docker-machine create -h

### 3. 选择活跃主机 ###

部署Droplet后，我们想马上运行一个Docker容器，但在那之前，我们需要检查下活跃主机是否是我们需要的机器。可以运行如下命令查看。

    # docker-machine ls

![Docker Machine List](http://blog.linoxide.com/wp-content/uploads/2015/05/docker-machine-ls.png)

ACTIVE一列有“*”标记的是活跃主机。

现在，如果我们想将活跃主机切换到需要的主机，运行如下命令：

    # docker-machine active linux-dev

**注意**：这里，linux-dev是机器名，我们打算激活这个机器，并且在其上运行Docker容器。

### 4. 运行一个Docker容器 ###

现在，我们已经选择了活跃主机，就可以运行Docker容器了。可以测试一下，运行一个busybox容器来执行`echo hello word`命令，这样就可以得到输出：

    # docker run busybox echo hello world

注意：如果你试图在一个装有32位操作系统的宿主机部署Docker容器，使用SSH来运行docker是个好办法。这样你就可以简单跳过这一步，直接进入下一步。

### 5. SSH到Docker机器中 ###

如果我们想在机器或者Droplet上控制之前部署的Docker机器，可以使用docker-machine ssh命令来SSH到机器上：

    # docker-machine ssh

![Docker Machine SSH](http://blog.linoxide.com/wp-content/uploads/2015/05/docker-machine-ssh.png)

SSH到机器上之后，我们可以在上边运行任何Docker容器。这里我们运行一个nginx：

    # docker run -itd -p 80:80 nginx

操作完毕后，我们需要运行exit命令来退出Droplet或者服务器。

    # exit

### 5. 删除主机 ###

删除在运行的主机以及它的所有镜像和容器，我们可以使用docker-machine rm命令：

    # docker-machine rm linux-dev

![Docker Machine Remove All](http://blog.linoxide.com/wp-content/uploads/2015/05/docker-machine-remove-machine.png)

使用docker-machine ls命令检查是否成功删除了：

    # docker-machine ls

![Docker Machine Remove Check](http://blog.linoxide.com/wp-content/uploads/2015/05/docker-machine-remove-check.png)

### 6. 在不使用驱动的情况新增一个主机 ###

我们可以在不使用驱动的情况往Docker增加一台主机，只需要一个URL。它可以使用一个已有机器的别名，所以我们就不需要每次在运行docker命令时输入完整的URL了。

    $ docker-machine create --url=tcp://104.131.50.36:2376 custombox

### 7. 管理主机 ###

如果你已经让Docker运行起来了，可以使用简单的**docker-machine stop**命令来停止所有正在运行的主机，如果需要再启动的话可以运行**docker-machine start**：

    # docker-machine stop
    # docker-machine start

你也可以使用如下命令来使用机器名作为参数来将其停止或启动：

    $ docker-machine stop linux-dev
    $ docker-machine start linux-dev

### 总结 ###

Docker Machine是一个非常棒的工具，可以使用Docker容器快速地部署服务。文中我们使用Digital Ocean Platform作演示，但Docker Machine还支持其他平台，如Amazon Web Service、Google Cloud Computing。使用Docker Machine，快速、安全地在几种不同平台部署Docker容器变得很简单了。因为Docker Machine还是Beta版本，不建议在生产环境使用。如果你有任何问题、建议、反馈，请在下方的评论框中写下来，我们会改进或者更新我们的内容。谢谢！享受吧 :-)

--------------------------------------------------------------------------------

via: http://linoxide.com/linux-how-to/use-docker-machine-cloud-provider/

作者：[Arun Pyasi][a]
译者：[goreliu](https://github.com/goreliu)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/arunp/
[1]:https://cloud.digitalocean.com/settings/applications
如何使用Docker Machine部署Swarm集群
================================================================================
大家好，今天我们来研究一下如何使用Docker Machine部署Swarm集群。Docker Machine提供了独立的Docker API，所以任何与Docker守护进程进行交互的工具都可以使用Swarm来（透明地）扩增到多台主机上。Docker Machine可以用来在个人电脑、云端以及的数据中心里创建Docker主机。它为创建服务器，安装Docker以及根据用户设定配置Docker客户端提供了便捷化的解决方案。我们可以使用任何驱动来部署swarm集群，并且swarm集群将由于使用了TLS加密具有极好的安全性。

下面是我提供的简便方法。
### 1. 安装Docker Machine ###

Docker Machine 在任何Linux系统上都被支持。首先，我们需要从Github上下载最新版本的Docker Machine。我们使用curl命令来下载最先版本Docker Machine ie 0.2.0。
64位操作系统：

    # curl -L https://github.com/docker/machine/releases/download/v0.2.0/docker-machine_linux-amd64 > /usr/local/bin/docker-machine

32位操作系统：

    # curl -L https://github.com/docker/machine/releases/download/v0.2.0/docker-machine_linux-i386 > /usr/local/bin/docker-machine

下载了最先版本的Docker Machine之后，我们需要对 /usr/local/bin/ 目录下的docker-machine文件的权限进行修改。命令如下：

    # chmod +x /usr/local/bin/docker-machine

在做完上面的事情以后，我们必须确保docker-machine已经安装好。怎么检查呢？运行docker-machine -v指令，指令将会给出我们系统上所安装的docker-machine版本。

    # docker-machine -v

![Installing Docker Machine](http://blog.linoxide.com/wp-content/uploads/2015/05/installing-docker-machine.png)

为了让Docker命令能够在我们的机器上运行，必须还要在机器上安装Docker客户端。命令如下。

    # curl -L https://get.docker.com/builds/linux/x86_64/docker-latest > /usr/local/bin/docker
    # chmod +x /usr/local/bin/docker

### 2. 创建Machine ###

在将Docker Machine安装到我们的设备上之后，我们需要使用Docker Machine创建一个machine。在这片文章中，我们会将其部署在Digital Ocean Platform上。所以我们将使用“digitalocean”作为它的Driver API，然后将docker swarm运行在其中。这个Droplet会被设置为Swarm主节点，我们还要创建另外一个Droplet，并将其设定为Swarm节点代理。
创建machine的命令如下：

    # docker-machine create --driver digitalocean --digitalocean-access-token <API-Token> linux-dev

**Note**: 假设我们要创建一个名为“linux-dev”的machine。<API-Token>是用户在Digital Ocean Cloud Platform的Digital Ocean控制面板中生成的密钥。为了获取这个密钥，我们需要登录我们的Digital Ocean控制面板，然后点击API选项，之后点击Generate New Token，起个名字，然后在Read和Write两个选项上打钩。之后我们将得到一个很长的十六进制密钥，这个就是<API-Token>了。用其替换上面那条命令中的API-Token字段。

现在，运行下面的指令，将Machine configuration装载进shell。

    # eval "$(docker-machine env linux-dev)"

![Docker Machine Digitalocean Cloud](http://blog.linoxide.com/wp-content/uploads/2015/05/docker-machine-digitalocean-cloud.png)

然后，我们使用如下命令将我们的machine标记为ACTIVE状态。

    # docker-machine active linux-dev

现在，我们检查是否它（指machine）被标记为了 ACTIVE "*"。

    # docker-machine ls

![Docker Machine Active List](http://blog.linoxide.com/wp-content/uploads/2015/05/docker-machine-active-list.png)

### 3. 运行Swarm Docker镜像 ###

现在，在我们创建完成了machine之后。我们需要将swarm docker镜像部署上去。这个machine将会运行这个docker镜像并且控制Swarm主节点和从节点。使用下面的指令运行镜像：

    # docker run swarm create

![Docker Machine Swarm Create](http://blog.linoxide.com/wp-content/uploads/2015/05/docker-machine-swarm-create.png)

If you are trying to run swarm docker image using **32 bit Operating System** in the computer where Docker Machine is running, we'll need to SSH into the Droplet.
如果你想要在**32位操作系统**上运行swarm docker镜像。你需要SSH登录到Droplet当中。

    # docker-machine ssh
    #docker run swarm create
    #exit

### 4. 创建Swarm主节点 ###

在我们的swarm image已经运行在machine当中之后，我们将要创建一个Swarm主节点。使用下面的语句，添加一个主节点。（这里的感觉怪怪的，好像少翻译了很多东西，是我把Master翻译为主节点的原因吗？）

    # docker-machine create \
    -d digitalocean \
    --digitalocean-access-token <DIGITALOCEAN-TOKEN>
    --swarm \
    --swarm-master \
    --swarm-discovery token://<CLUSTER-ID> \
    swarm-master

![Docker Machine Swarm Master Create](http://blog.linoxide.com/wp-content/uploads/2015/05/docker-machine-swarm-master-create.png)

### 5. 创建Swarm结点群 ###

现在，我们将要创建一个swarm结点，此结点将与Swarm主节点相连接。下面的指令将创建一个新的名为swarm-node的droplet，其与Swarm主节点相连。到此，我们就拥有了一个两节点的swarm集群了。

    # docker-machine create \
    -d digitalocean \
    --digitalocean-access-token <DIGITALOCEAN-TOKEN>
    --swarm \
    --swarm-discovery token://<TOKEN-FROM-ABOVE> \
    swarm-node

![Docker Machine Swarm Nodes](http://blog.linoxide.com/wp-content/uploads/2015/05/docker-machine-swarm-nodes.png)

### 6. Connecting to the Swarm Master ###
### 6. 与Swarm主节点连接 ###

现在，我们连接Swarm主节点以便我们可以依照需求和配置文件在节点间部署Docker容器。运行下列命令将Swarm主节点的Machine配置文件加载到环境当中。

    # eval "$(docker-machine env --swarm swarm-master)"

然后，我们就可以跨结点地运行我们所需的容器了。在这里，我们还要检查一下是否一切正常。所以，运行**docker info**命令来检查Swarm集群的信息。

    # docker info

### Conclusion ###
### 总结 ###

我们可以用Docker Machine轻而易举地创建Swarm集群。这种方法有非常高的效率，因为它极大地减少了系统管理员和用户的时间消耗。在这篇文章中，我们以Digital Ocean作为驱动，通过创建一个主节点和一个从节点成功地部署了集群。其他类似的应用还有VirtualBox，Google Cloud Computing，Amazon Web Service，Microsoft Azure等等。这些连接都是通过TLS进行加密的，具有很高的安全性。如果你有任何的疑问，建议，反馈，欢迎在下面的评论框中注明以便我们可以更好地提高文章的质量！

--------------------------------------------------------------------------------

via: http://linoxide.com/linux-how-to/provision-swarm-clusters-using-docker-machine/

作者：[Arun Pyasi][a]
译者：[DongShuaike](https://github.com/DongShuaike)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/arunp/

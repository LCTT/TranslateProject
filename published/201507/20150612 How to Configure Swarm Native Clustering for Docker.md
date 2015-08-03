如何配置一个 Docker Swarm 原生集群
================================================================================

嗨，大家好。今天我们来学一学Swarm相关的内容吧，我们将学习通过Swarm来创建Docker原生集群。[Docker Swarm][1]是用于Docker的原生集群项目，它可以将一个Docker主机池转换成单个的虚拟主机。Swarm工作于标准的Docker API，所以任何可以和Docker守护进程通信的工具都可以使用Swarm来透明地伸缩到多个主机上。就像其它Docker项目一样，Swarm遵循“内置电池，并可拆卸”的原则（LCTT 译注：batteries included，内置电池原来是 Python 圈里面对 Python 的一种赞誉，指自给自足，无需外求的丰富环境；but removable，并可拆卸应该指的是非强制耦合）。它附带有一个开箱即用的简单的后端调度程序，而且作为初始开发套件，也为其开发了一个可插拔不同后端的API。其目标在于为一些简单的使用情况提供一个平滑的、开箱即用的体验，并且它允许切换为更强大的后端，如Mesos，以用于大规模生产环境部署。Swarm配置和使用极其简单。

这里给大家提供Swarm 0.2开箱的即用一些特性。

1. Swarm 0.2.0大约85%与Docker引擎兼容。
2. 它支持资源管理。
3. 它具有一些带有限制和类同功能的高级调度特性。
4. 它支持多个发现后端（hubs，consul，etcd，zookeeper）
5. 它使用TLS加密方法进行安全通信和验证。

那么，我们来看一看Swarm的一些相当简单而简用的使用步骤吧。

### 1. 运行Swarm的先决条件 ###

我们必须在所有节点安装Docker 1.4.0或更高版本。虽然各个节点的IP地址不需要要公共地址，但是Swarm管理器必须可以通过网络访问各个节点。

**注意**：Swarm当前还处于beta版本，因此功能特性等还有可能发生改变，我们不推荐你在生产环境中使用。

### 2. 创建Swarm集群 ###

现在，我们将通过运行下面的命令来创建Swarm集群。各个节点都将运行一个swarm节点代理，该代理会注册、监控相关的Docker守护进程，并更新发现后端获取的节点状态。下面的命令会返回一个唯一的集群ID标记，在启动节点上的Swarm代理时会用到它。

在集群管理器中：

    # docker run swarm create

![Creating Swarm Cluster](http://blog.linoxide.com/wp-content/uploads/2015/05/creating-swarm-cluster.png)

### 3. 启动各个节点上的Docker守护进程 ###

我们需要登录进我们将用来创建集群的每个节点，并在其上使用-H标记启动Docker守护进程。它会保证Swarm管理器能够通过TCP访问到各个节点上的Docker远程API。要启动Docker守护进程，我们需要在各个节点内部运行以下命令。

    # docker -H tcp://0.0.0.0:2375 -d

![Starting Docker Daemon](http://blog.linoxide.com/wp-content/uploads/2015/05/starting-docker-daemon.png)

### 4. 添加节点 ###

在启用Docker守护进程后，我们需要添加Swarm节点到发现服务，我们必须确保节点IP可从Swarm管理器访问到。要完成该操作，我们需要运行以下命令。

    # docker run -d swarm join --addr=<node_ip>:2375 token://<cluster_id>

![Adding Nodes to Cluster](http://blog.linoxide.com/wp-content/uploads/2015/05/adding-nodes-to-cluster.png)

**注意**：我们需要用步骤2中获取到的节点IP地址和集群ID替换这里的<node_ip>和<cluster_id>。

### 5. 开启Swarm管理器 ###

现在，由于我们已经获得了连接到集群的节点，我们将启动swarm管理器。我们需要在节点中运行以下命令。

    # docker run -d -p <swarm_port>:2375 swarm manage token://<cluster_id>

![Starting Swarm Manager](http://blog.linoxide.com/wp-content/uploads/2015/05/starting-swarm-manager.png)

### 6. 检查配置 ###

一旦管理运行起来后，我们可以通过运行以下命令来检查配置。

    # docker -H tcp://<manager_ip:manager_port> info

![Accessing Swarm Clusters](http://blog.linoxide.com/wp-content/uploads/2015/05/accessing-swarm-cluster.png)

**注意**：我们需要替换<manager_ip:manager_port>为运行swarm管理器的主机的IP地址和端口。

### 7. 使用docker CLI来访问节点 ###

在一切都像上面说得那样完美地完成后，这一部分是Docker Swarm最为重要的部分。我们可以使用Docker CLI来访问节点，并在节点上运行容器。

    # docker -H tcp://<manager_ip:manager_port> info
    # docker -H tcp://<manager_ip:manager_port> run ...

### 8. 监听集群中的节点 ###

我们可以使用swarm list命令来获取所有运行中节点的列表。

    # docker run --rm swarm list token://<cluster_id>

![Listing Swarm Nodes](http://blog.linoxide.com/wp-content/uploads/2015/05/listing-swarm-nodes.png)

### 尾声 ###

Swarm真的是一个有着相当不错的功能的docker，它可以用于创建和管理集群。它相当易于配置和使用，当我们在它上面使用限制器和类同器时它更为出色。高级调度程序是一个相当不错的特性，它可以应用过滤器来通过端口、标签、健康状况来排除节点，并且它使用策略来挑选最佳节点。那么，如果你有任何问题、评论、反馈，请在下面的评论框中写出来吧，好让我们知道哪些材料需要补充或改进。谢谢大家了！尽情享受吧 :-)

--------------------------------------------------------------------------------

via: http://linoxide.com/linux-how-to/configure-swarm-clustering-docker/

作者：[Arun Pyasi][a]
译者：[GOLinux](https://github.com/GOLinux)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/arunp/
[1]:https://docs.docker.com/swarm/

使用 Elasticsearch 和 cAdvisor 监控 Docker 容器
=======

如果你正在运行 Swarm 模式的集群，或者只运行单台 Docker，你都会有下面的疑问：

>我如何才能监控到它们都在干些什么？

这个问题的答案是“很不容易”。

你需要监控下面的参数：

1. 容器的数量和状态。
2. 一台容器是否已经移到另一个结点了，如果是，那是在什么时候，移动到哪个节点？
3. 一个结点上运行着的容器数量。
4. 一段时间内的通信峰值。
5. 孤儿卷和网络（LCTT 译注：孤儿卷就是当你删除容器时忘记删除它的卷，这个卷就不会再被使用，但会一直占用资源）。
6. 回收磁盘空间，回收结点。
7. 容器数量与连接在 docker0 和 docker_gwbridge 上的虚拟网卡数量不一致（LCTT 译注：当docker启动时，它会在宿主机器上创建一个名为docker0的虚拟网络接口）。
8. 开启和关闭 Swarm 节点。
9. 收集并集中处理日志。

本文的目标是介绍 [Elasticsearch][1] + [Kibana][2] + [cAdvisor][3] 的用法，使用它们来收集 Docker 容器的参数，分析数据并产生可视化报表。

阅读本文后你会发现有一个报表会显示上述9个参数的部分内容，如果简单使用 cAdvisor，有些参数就无法显示出来，比如 Swarm 模式的节点。

如果你的一些 cAdvisor 或其他工具无法提供的特殊需求，我建议你开发自己的数据收集器和数据处理器（比如 [Beats][4]），请注意我不会演示如何使用 Elasticsearch 来收集 Docker 容器的日志。

>[“你要如何才能监控到 Swarm 模式集群里面发生了什么事情？要做到这点很不容易。” 作者 @fntlnz][5]

### 我们为什么要监控容器？

想象一下这个经典场景：你在管理一台或多台虚拟机，你把 tmux 工具用得很溜，用各种 session 事先设定好了所有基础的东西，包括监控。然后生产环境出问题了，你使用 top htop iotop jnettop 各种 top 来排查，然后你准备好修复故障。

现在重新想象一下你有3个节点，包含50台容器，你需要在一个地方查看整洁的历史数据知道问题出在哪个地方，而不是把你的生命浪费在那些字符界面来赌你可以找到问题点。

### 什么是 Elastic Stack ？

Elastic Stack 就一个工具集，包括以下工具：

- Elasticsearch
- Kibana
- Logstash
- Beats

我们会使用其中一部分工具，比如使用 Elasticsearch 来分析基于 JSON 格式的文本，以及使用 Kibana 来可视化数据并产生报表。

另一个重要的工具是 Beats，但在本文中我们还是把精力放在容器上，官方的 Beats 工具不支持 Docker，所以我们选择原生兼容 Elasticsearch 的 cAdvisor。

cAdvisor 工具负责收集、整合容器数据，并导出报表。在本文中，这些报表被到入到 Elasticsearch 中。

cAdvisor 有两个比较酷的特性：

- 它不只局限于 Docker 容器。
- 它有自己的 web 服务器，可以简单地显示当前节点的可视化报表。

### 设置测试集群，或搭建自己的基础架构

和我以前的文章一样，我习惯提供一个简单的脚本，让读者不用花很多时间就能部署好和我一样的测试环境。你可以使用以下（非生产环境使用的）脚本来搭建一个 Swarm 模式的集群，其中一个容器运行着 Elasticsearch。

> 如果你有充足的时间和经验，你可以搭建自己的基础架构。


如果要继续阅读本文，你需要：

- 一个或多个节点，运行 Docker 进程（docker 版本号大于等于 1.12）。
- 至少有一个独立运行的 Elasticsearch 节点（版本号 2.4.X）。

重申一下，此 Elasticsearch 集群环境不能放在生产环境中使用。生产环境也不推荐使用单节点集群，所以如果你计划安装一个生产环境，请参考 [Elastic guidelines][6]。

### 对喜欢尝鲜的用户的友情提示

我就是一个喜欢尝鲜的人（当然我也已经在生产环境中使用了 alpha 版本），但是在本文中，我不会使用最新的 Elasticsearch 5.0.0 alpha 版本，我还不是很清楚这个版本的功能，所以我不想成为那个引导你们出错的关键。

所以本文中涉及的 Elasticsearch 版本为最新稳定版 2.4.0。

### 测试集群部署脚本

前面已经说过，我提供这个脚本给你们，让你们不必费神去部署 Swarm 集群和 Elasticsearch，当然你也可以跳过这一步，用你自己的 Swarm 模式引擎和你自己的 Elasticserch 节点。

执行这段脚本之前，你需要：

- [Docker Machine][7] – 最终版：在 DigitalOcean 中提供 Docker 引擎。
- [DigitalOcean API Token][8]: 让 docker 机器按照你的意思来启动节点。

![](https://resources.codeship.com/hubfs/CTAs/EVAL/Codeship_Request_Trial_Access.png?t=1473869513342)

### 创建集群的脚本

现在万事俱备，你可以把下面的代码拷到 create-cluster.sh 文件中：

```
#!/usr/bin/env bash
#
# Create a Swarm Mode cluster with a single master and a configurable number of workers

workers=${WORKERS:-"worker1 worker2"}

#######################################
# Creates a machine on Digital Ocean
# Globals:
#   DO_ACCESS_TOKEN The token needed to access DigitalOcean's API
# Arguments:
#   $1 the actual name to give to the machine
#######################################
create_machine() {
  docker-machine create \
    -d digitalocean \
    --digitalocean-access-token=$DO_ACCESS_TOKEN \
    --digitalocean-size 2gb \
    $1
}

#######################################
# Executes a command on the specified machine
# Arguments:
#   $1     The machine on which to run the command
#   $2..$n The command to execute on that machine
#######################################
machine_do() {
  docker-machine ssh $@
}

main() {

  if [ -z "$DO_ACCESS_TOKEN" ]; then
    echo "Please export a DigitalOcean Access token: https://cloud.digitalocean.com/settings/api/tokens/new"
    echo "export DO_ACCESS_TOKEN=<yourtokenhere>"
    exit 1
  fi

  if [ -z "$WORKERS" ]; then
    echo "You haven't provided your workers by setting the \$WORKERS environment variable, using the default ones: $workers"
  fi

  # Create the first and only master
  echo "Creating the master"

  create_machine master1

  master_ip=$(docker-machine ip master1)

  # Initialize the swarm mode on it
  echo "Initializing the swarm mode"
  machine_do master1 docker swarm init --advertise-addr $master_ip

  # Obtain the token to allow workers to join
  worker_tkn=$(machine_do master1 docker swarm join-token -q worker)
  echo "Worker token: ${worker_tkn}"

  # Create and join the workers
  for worker in $workers; do
    echo "Creating worker ${worker}"
    create_machine $worker
    machine_do $worker docker swarm join --token $worker_tkn $master_ip:2377
  done
}

main $@
```

赋予它可执行权限：

```
chmod +x create-cluster.sh
```

### 创建集群

As the name suggests, we’ll use the script to create the cluster. By default, the script will create a cluster with a single master and two workers. If you want to configure the number of workers, you can do that by setting the WORKERS environment variable.
如文件名所示，我们可以用它来创建集群。默认情况下这个脚本会创建一个 master 和两个 worker，如果你想修改 worker 个数，可以设置环境变量 WORKERS。

现在就来创建集群吧。

```
./create-cluster.sh
```

你可以出去喝杯咖啡，因为这需要花点时间。

最后集群部署好了。

--------------------------------------------------------------------------------

via: https://blog.codeship.com/monitoring-docker-containers-with-elasticsearch-and-cadvisor/

作者：[Lorenzo Fontana][a]
译者：[bazz2](https://github.com/bazz2)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://blog.codeship.com/author/lorenzofontana/







[1]: https://github.com/elastic/elasticsearch
[2]: https://github.com/elastic/kibana
[3]: https://github.com/google/cadvisor
[4]: https://github.com/elastic/beats
[5]: https://twitter.com/share?text=%22How+do+you+keep+track+of+all+that%27s+happening+in+a+Swarm+Mode+cluster%3F+Not+easily.%22+via+%40fntlnz&url=https://blog.codeship.com/monitoring-docker-containers-with-elasticsearch-and-cadvisor/
[6]: https://www.elastic.co/guide/en/elasticsearch/guide/2.x/deploy.html
[7]: https://docs.docker.com/machine/install-machine/
[8]: https://cloud.digitalocean.com/settings/api/tokens/new

如何在 Docker 容器中运行支持 OData 的 JBoss 数据虚拟化 GA
================================================================================

大家好，我们今天来学习如何在一个 Docker 容器中运行支持 OData（译者注：Open Data Protocol，开放数据协议） 的 JBoss 数据虚拟化 6.0.0 GA（译者注：GA，General Availability，具体定义可以查看[WIKI][4]）。JBoss 数据虚拟化是数据提供和集成解决方案平台，将多种分散的数据源转换为一种数据源统一对待，在正确的时间将所需数据传递给任意的应用或者用户。JBoss 数据虚拟化可以帮助我们将数据快速组合和转换为可重用的商业友好的数据模型，通过开放标准接口简单可用。它提供全面的数据抽取、联合、集成、转换，以及传输功能，将来自一个或多个源的数据组合为可重复使用和共享的灵活数据。要了解更多关于 JBoss 数据虚拟化的信息，可以查看它的[官方文档][1]。Docker 是一个提供开放平台用于打包，装载和以轻量级容器运行任何应用的开源平台。使用 Docker 容器我们可以轻松处理和启用支持 OData 的 JBoss 数据虚拟化。

下面是该指南中在 Docker 容器中运行支持 OData 的 JBoss 数据虚拟化的简单步骤。

### 1. 克隆仓库 ###

首先，我们要用 git 命令从 [https://github.com/jbossdemocentral/dv-odata-docker-integration-demo][2] 克隆带数据虚拟化的 OData 仓库。假设我们的机器上运行着 Ubuntu 15.04 linux 发行版。我们要使用 apt-get 命令安装 git。

    # apt-get install git

安装完 git 之后，我们运行下面的命令克隆仓库。

    # git clone https://github.com/jbossdemocentral/dv-odata-docker-integration-demo

    Cloning into 'dv-odata-docker-integration-demo'...
    remote: Counting objects: 96, done.
    remote: Total 96 (delta 0), reused 0 (delta 0), pack-reused 96
    Unpacking objects: 100% (96/96), done.
    Checking connectivity... done.

### 2. 下载 JBoss 数据虚拟化安装器 ###

现在，我们需要从下载页 [http://www.jboss.org/products/datavirt/download/][3] 下载 JBoss 数据虚拟化安装器。下载了 **jboss-dv-installer-6.0.0.GA-redhat-4.jar** 后，我们把它保存在名为 **software** 的目录下。

### 3. 创建 Docker 镜像 ###

下一步，下载了 JBoss 数据虚拟化安装器之后，我们打算使用 Dockerfile 和刚从仓库中克隆的资源创建 docker 镜像。

    # cd dv-odata-docker-integration-demo/
    # docker build -t jbossdv600 .

    ...
    Step 22 : USER jboss
    ---> Running in 129f701febd0
    ---> 342941381e37
    Removing intermediate container 129f701febd0
    Step 23 : EXPOSE 8080 9990 31000
    ---> Running in 61e6d2c26081
    ---> 351159bb6280
    Removing intermediate container 61e6d2c26081
    Step 24 : CMD $JBOSS_HOME/bin/standalone.sh -c standalone.xml -b 0.0.0.0 -bmanagement 0.0.0.0
    ---> Running in a9fed69b3000
    ---> 407053dc470e
    Removing intermediate container a9fed69b3000
    Successfully built 407053dc470e

注意：在这里我们假设你已经安装了 docker 并正在运行。

### 4. 启动 Docker 容器 ###

创建了支持 oData 的 JBoss 数据虚拟化 Docker 镜像之后，我们打算运行 docker 容器并用 -P 标签指定端口。我们运行下面的命令来实现。

    # docker run -p 8080:8080 -d -t jbossdv600

    7765dee9cd59c49ca26850e88f97c21f46859d2dc1d74166353d898773214c9c

### 5. 获取容器 IP ###

启动了 Docker 容器之后，我们想要获取正在运行的 docker 容器的 IP 地址。要做到这点，我们运行后面添加了正在运行容器 id 号的 docker inspect 命令。 

    # docker inspect <$containerID>

    ...
    "NetworkSettings": {
    "Bridge": "",
    "EndpointID": "3e94c5900ac5954354a89591a8740ce2c653efde9232876bc94878e891564b39",
    "Gateway": "172.17.42.1",
    "GlobalIPv6Address": "",
    "GlobalIPv6PrefixLen": 0,
    "HairpinMode": false,
    "IPAddress": "172.17.0.8",
    "IPPrefixLen": 16,
    "IPv6Gateway": "",
    "LinkLocalIPv6Address": "",
    "LinkLocalIPv6PrefixLen": 0,

### 6. Web 界面 ###

现在，如果一切如期望的那样进行，当我们用浏览器打开 http://container-ip:8080/ 和 http://container-ip:9990 时会看到支持 oData 的 JBoss 数据虚拟化登录界面和 JBoss 管理界面。管理验证的用户名和密码分别是 admin 和 redhat1！数据虚拟化验证的用户名和密码都是 user。之后，我们可以通过 web 界面在内容间导航。

**注意**： 强烈建议在第一次登录后尽快修改密码。

### 总结 ###

终于我们成功地运行了跑着支持 OData 多源虚拟数据库的 JBoss 数据虚拟化 的 Docker 容器。JBoss 数据虚拟化真的是一个很棒的平台，它为多种不同来源的数据进行虚拟化，并将它们转换为商业友好的数据模型，产生通过开放标准接口简单可用的数据。使用 Docker 技术可以简单、安全、快速地部署支持 OData 多源虚拟数据库的 JBoss 数据虚拟化。如果你有任何疑问、建议或者反馈，请在下面的评论框中写下来，以便我们可以改进和更新内容。非常感谢！Enjoy:-)

--------------------------------------------------------------------------------

via: http://linoxide.com/linux-how-to/run-jboss-data-virtualization-ga-odata-docker-container/

作者：[Arun Pyasi][a]
译者：[ictlyh](http://www.mutouxiaogui.cn/blog)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/arunp/
[1]:http://www.redhat.com/en/technologies/jboss-middleware/data-virtualization
[2]:https://github.com/jbossdemocentral/dv-odata-docker-integration-demo
[3]:http://www.jboss.org/products/datavirt/download/
[4]:https://en.wikipedia.org/wiki/Software_release_life_cycle#General_availability_.28GA.29
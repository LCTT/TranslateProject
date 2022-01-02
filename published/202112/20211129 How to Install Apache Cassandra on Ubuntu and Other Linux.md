[#]: subject: "How to Install Apache Cassandra on Ubuntu and Other Linux"
[#]: via: "https://itsfoss.com/apache-cassandra-ubuntu/"
[#]: author: "Marco Carmona https://itsfoss.com/author/marco/"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14048-1.html"

如何在 Ubuntu 和其他 Linux 上安装 Apache Cassandra
======

![](https://img.linux.net.cn/data/attachment/album/202112/04/151942ihpizylzk0i3pt0i.jpg)

[Apache Cassandra][1] 是一个自由开源的 NoSQL 数据库管理系统，用于在许多服务器上操作大量信息，提供无单点故障的高可用性。

我不打算讨论 NoSQL 数据库的细节。我将会告诉你如何在基于 Ubuntu 的 Linux 发行版上安装 Apache Cassandra。

请注意，这更多是为了实践。

### 在 Linux 上安装 Apache Cassandra

有多种方法可以在 Ubuntu 和其他 Linux 发行版上安装 Cassandra：

  * 使用 Apache 的官方 deb 仓库安装：适合并推荐给基于 Debian 和 Ubuntu 的发行版。如果有更新的版本，会得到自动更新。
  * 使用 Docker 安装：适用于所有 Linux 发行版。
  * 从 tarball 安装：适用于所有 Linux，但不会自动更新到新版本。

这仅仅是为了练习和体验 Apache Cassandra。如果你要在一个项目中使用它和其他服务，你必须遵循该服务的完整配置和设置指南。

我将展示前两种方法。

#### 方法 1：使用官方仓库在 Ubuntu 和 Debian 上安装 Cassandra

在你安装和使用 Cassandra 之前，你需要在你的系统上安装 Python 和 Java。你可能需要 [在 Ubuntu 上安装 Java][2]，但 Python 通常是预装的。

你可以用下面这行来检查先决条件：

```
java -version && python --version
```

所有先决条件都安装好了？那就好。让我们来安装 Cassandra。这里的方法与 [在 Ubuntu 中添加任意外部仓库][3] 相同。

首先，将 Apache Cassandra 仓库添加到你的源列表中。下面这个添加最新的主要版本（在写这篇文章的时候）4.0 系列。

```
echo "deb http://www.apache.org/dist/cassandra/debian 40x main" | sudo tee -a /etc/apt/sources.list.d/cassandra.sources.list
```

![Add Apache Cassandra repository][4]

现在，下载并将 Apache Cassandra 仓库的密钥添加到服务器上的受信任密钥列表中。这样，你的系统就会信任来自你在上一步添加的仓库的软件包。

你应该确保 `apt` 可以通过 https 使用。

```
sudo apt install apt-transport-https
```

然后添加密钥：

```
wget https://www.apache.org/dist/cassandra/KEYS && sudo apt-key add KEYS
```

![Add Apache Cassandra repository key][5]

你已经添加了仓库。更新本地缓存，使你的系统知道这个新仓库的存在。

```
sudo apt update
```

最后，用以下命令安装 Cassandra：

```
sudo apt install cassandra
```

![Installing Apache Cassandra on Ubuntu][6]

安装完成后，Cassandra 服务会自动开始运行。如果你想的话，你仍然可以验证它：

```
sudo systemctl status cassandra.service
```

![Check if Cassandra is running][7]

你可以输入 `cqlsh` 连接到数据库。输入 `exit` 来退出这个 shell。

![Entering cqlsh][8]

这是非常基本和默认的设置。你可能需要根据你的需求来配置它。请查看 [官方文档中的配置部分][9]。

#### 方法 2：使用 Docker 安装 Apache Cassandra

这个方法适用于任何 Linux 发行版，只要你打算在 Docker 设置中使用它。

当然，你需要在你的系统上安装 Docker 来实现这个方法。这是这个方法的前提条件，我让你处理这件事情。

如果你有 Docker，使用下面的命令来拉取 Apache Cassandra 的 Docker 镜像：

```
sudo docker pull cassandra:latest
```

![Pulling Apache Cassandra docker image][10]

完成后，你可以用 [docker run 命令][11]来启动 Cassandra，像这样：

```
sudo docker run --name cass_cluster cassandra:latest
```

![Running Cassandra in a container][12]

**注意：** `--name` 选项指的是创建的 Cassandra 集群的名称。

要与之前启动的 Cassandra 节点交互，你需要初始化 CQL shell，你可以用 Docker `exec` 命令这样做：

```
sudo docker exec -it cass_cluster cqlsh
```

![Access the cqlsh running in Docker.][13]

**恭喜！** 现在你至少知道了在你的系统中安装 Apache Cassandra 的两种不同方法。

请记住，这篇文章只是一个介绍。如果你有兴趣了解更多关于 Apache Cassandra 的信息，请阅读 [文档][14]，在那里你可以找到更多关于这个神奇的 NoSQL 数据库管理系统的信息。如果这篇文章对你有帮助，请阅读并分享它。下一篇见。

--------------------------------------------------------------------------------

via: https://itsfoss.com/apache-cassandra-ubuntu/

作者：[Marco Carmona][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/marco/
[b]: https://github.com/lujun9972
[1]: https://cassandra.apache.org/_/index.html
[2]: https://itsfoss.com/install-java-ubuntu/
[3]: https://itsfoss.com/adding-external-repositories-ubuntu/
[4]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/11/Installing_the_Debian_packages_step_1.png?resize=800%2C123&ssl=1
[5]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/11/Installing_the_Debian_packages_step_2.png?resize=800%2C490&ssl=1
[6]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/11/Installing_the_Debian_packages_step_3.png?resize=800%2C490&ssl=1
[7]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/11/verify-cassandra.png?resize=800%2C443&ssl=1
[8]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/11/Installing_the_Debian_packages_step_4.png?resize=800%2C164&ssl=1
[9]: https://cassandra.apache.org/doc/latest/cassandra/getting_started/configuring.html
[10]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/11/Using_Docker_images_step_2.png?resize=800%2C275&ssl=1
[11]: https://linuxhandbook.com/docker-run-vs-start-vs-create/
[12]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/11/Using_Docker_images_step_3.png?resize=800%2C490&ssl=1
[13]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/11/Using_Docker_images_step_4.png?resize=800%2C225&ssl=1
[14]: https://cassandra.apache.org/doc/latest/index.html

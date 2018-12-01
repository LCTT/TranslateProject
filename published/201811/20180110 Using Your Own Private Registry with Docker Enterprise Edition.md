使用 Docker 企业版搭建自己的私有注册服务器
======

![docker trusted registry][1]

Docker 真的很酷，特别是和使用虚拟机相比，转移 Docker 镜像十分容易。如果你已准备好使用 Docker，那你肯定已从 [Docker Hub][2] 上拉取过完整的镜像。Docker Hub 是 Docker 的云端注册服务器服务，它包含成千上万个供选择的 Docker 镜像。如果你开发了自己的软件包并创建了自己的 Docker 镜像，那么你会想有自己私有的注册服务器。如果你有搭配着专有许可的镜像，或想为你的构建系统提供复杂的持续集成（CI）过程，则更应该拥有自己的私有注册服务器。

Docker 企业版包括 <ruby>Docker 可信注册服务器<rt>Docker Trusted Registry</rt></ruby>（DTR）。这是一个具有安全镜像管理功能的高可用的注册服务器，为在你自己的数据中心或基于云端的架构上运行而构建。在接下来，我们将了解到 DTR 是提供安全、可重用且连续的[软件供应链][3]的一个关键组件。你可以通过我们的[免费托管小样][4]立即开始使用，或者通过下载安装进行 30 天的免费试用。下面是开始自己安装的步骤。

### 配置 Docker 企业版

DTR 运行于通用控制面板（UCP）之上，所以开始前要安装一个单节点集群。如果你已经有了自己的 UCP 集群，可以跳过这一步。在你的 docker 托管主机上，运行以下命令：

```
# 拉取并安装 UCP
docker run -it -rm -v /var/run/docker.sock:/var/run/docker.sock -name ucp docker/ucp:latest install
```

当 UCP 启动并运行后，在安装 DTR 之前你还有几件事要做。针对刚刚安装的 UCP 实例，打开浏览器。在日志输出的末尾应该有一个链接。如果你已经有了 Docker 企业版的许可证，那就在这个界面上输入它吧。如果你还没有，可以访问 [Docker 商店][5]获取 30 天的免费试用版。

准备好许可证后，你可能会需要改变一下 UCP 运行的端口。因为这是一个单节点集群，DTR 和 UCP 可能会以相同的端口运行它们的 web 服务。如果你拥有不只一个节点的 UCP 集群，这就不是问题，因为 DTR 会寻找有所需空闲端口的节点。在 UCP 中，点击“管理员设置 -> 集群配置”并修改控制器端口，比如 5443。

### 安装 DTR

我们要安装一个简单的、单节点的 DTR 实例。如果你要安装实际生产用途的 DTR，那么你会将其设置为高可用（HA）模式，即需要另一种存储介质，比如基于云端的对象存储或者 NFS（LCTT 译注：Network File System，网络文件系统）。因为目前安装的是一个单节点实例，我们依然使用默认的本地存储。

首先我们需要拉取 DTR 的 bootstrap 镜像。boostrap 镜像是一个微小的独立安装程序，包括了连接到 UCP 以及设置和启动 DTR 所需的所有容器、卷和逻辑网络。

使用命令：

```
# 拉取并运行 DTR 引导程序
docker run -it -rm docker/dtr:latest install -ucp-insecure-tls
```

注意：默认情况下，UCP 和 DTR 都有自己的证书，系统无法识别。如果你已使用系统信任的 TLS 证书设置 UCP，则可以省略 `-ucp-insecure-tls` 选项。另外，你可以使用 `-ucp-ca` 选项来直接指定 UCP 的 CA 证书。

然后 DTR bootstrap 镜像会让你确定几项设置，比如 UCP 安装的 URL 地址以及管理员的用户名和密码。从拉取所有的 DTR 镜像到设置全部完成，只需要一到两分钟的时间。

### 保证一切安全

一切都准备好后，就可以向注册服务器推送或者从中拉取镜像了。在做这一步之前，让我们设置 TLS 证书，以便与 DTR 安全地通信。

在 Linux 上，我们可以使用以下命令（只需确保更改了 `DTR_HOSTNAME` 变量，来正确映射我们刚刚设置的 DTR）：

```
# 从 DTR 拉取 CA 证书（如果 curl 不可用，你可以使用 wget）
DTR_HOSTNAME=< DTR 主机名>
curl -k https://$(DTR_HOSTNAME)/ca > $(DTR_HOSTNAME).crt
sudo mkdir /etc/docker/certs.d/$(DTR_HOSTNAME)
sudo cp $(DTR_HOSTNAME) /etc/docker/certs.d/$(DTR_HOSTNAME)
# 重启 docker 守护进程（在 Ubuntu 14.04 上，使用 `sudo service docker restart` 命令）
sudo systemctl restart docker
```

对于 Mac 和 Windows 版的 Docker，我们会以不同的方式安装客户端。转入“设置 -> 守护进程”，在“不安全的注册服务器”部分，输入你的 DTR 主机名。点击“应用”，docker 守护进程应在重启后可以良好使用。

### 推送和拉取镜像

现在我们需要设置一个仓库来存放镜像。这和 Docker Hub 有一点不同，如果你做的 docker 推送仓库中不存在，它会自动创建一个。要创建一个仓库，在浏览器中打开 `https://<Your DTR hostname>` 并在出现登录提示时使用你的管理员凭据登录。如果你向 UCP 添加了许可证，则 DTR 会自动获取该许可证。如果没有，请现在确认上传你的许可证。

进入刚才的网页之后，点击“新建仓库”按钮来创建新的仓库。

我们会创建一个用于存储 Alpine linux 的仓库，所以在名字输入处键入 “alpine”，点击“保存”（在 DTR 2.5 及更高版本中叫“创建”）。

现在我们回到 shell 界面输入以下命令：

```
# 拉取 Alpine Linux 的最新版
docker pull alpine:latest
# 登入新的 DTR 实例
docker login <Your DTR hostname>
# 标记上 Alpine 使能推送其至你的 DTR
docker tag alpine:latest <Your DTR hostname>/admin/alpine:latest
# 向 DTR 推送镜像
docker push <Your DTR hostname>/admin/alpine:latest
```

就是这样！我们刚刚推送了最新的 Alpine Linux 的一份拷贝，重新打了标签以便将其存储到 DTR 中，并将其推送到我们的私有注册服务器。如果你想将镜像拉取至不同的 Docker 引擎中，按如上所示设置你的 DTR 证书，然后执行以下命令：

```
# 从 DTR 中拉取镜像
docker pull <Your DTR hostname>/admin/alpine:latest
```

DTR 具有许多优秀的镜像管理功能，例如镜像的缓存、映像、扫描、签名甚至自动化供应链策略。这些功能我们在后期的博客文章中更详细的探讨。


--------------------------------------------------------------------------------

via: https://blog.docker.com/2018/01/dtr/

作者：[Patrick Devine][a]
译者：[fuowang](https://github.com/fuowang)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://blog.docker.com/author/pdevine/
[1]:https://i1.wp.com/blog.docker.com/wp-content/uploads/ccd278d2-29c2-4866-8285-c2fe60b4bd5e-1.jpg?resize=965%2C452&ssl=1
[2]:https://hub.docker.com/
[3]:https://blog.docker.com/2016/08/securing-enterprise-software-supply-chain-using-docker/
[4]:https://www.docker.com/trial
[5]:https://store.docker.com/search?offering=enterprise&page=1&q=&type=edition

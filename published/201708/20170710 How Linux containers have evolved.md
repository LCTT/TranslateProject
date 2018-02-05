Linux 容器演化史
============================================================

> 容器在过去几年内取得很大的进展。现在我们来回顾它发展的时间线。

![How Linux containers have evolved](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/containers_2015-3-osdc-lead.png?itok=O6aivM_W "Linux 容器的演化过程")

### Linux 容器是如何演变的

在过去几年内，容器不仅成为了开发者们热议的话题，还受到了企业的关注。持续增长的关注使得在它的安全性、可扩展性以及互用性等方面的需求也得以增长。满足这些需求需要很大的工程量，下面我们讲讲在红帽这样的企业级这些工程是如何发展的。

我在 2013 年秋季第一次遇到 Docker 公司（Docker.io）的代表，那时我们在设法使 Red Hat Enterprise Linux (RHEL) 支持 Docker 容器（现在 Docker 项目的一部分已经更名为 _Moby_）的运行。在移植过程中，我们遇到了一些问题。处理容器镜像分层所需的写时拷贝（COW）文件系统成了我们第一个重大阻碍。Red Hat 最终贡献了一些 COW 文件系统实现，包括 [Device Mapper][13]、[btrf][14]，以及 [OverlayFS][15] 的第一个版本。在 RHEL 上，我们默认使用 Device Mapper， 但是我们在 OverlayFS 上也已经取得了很大进展。

我们在用于启动容器的工具上遇到了第二个主要障碍。那时的上游 docker 使用 [LXC][16] 工具来启动容器，然而我们不想在 RHEL 上支持 LXC 工具集。而且在与上游 docker 合作之前，我们已经与 [libvrit][17] 团队携手构建了 [virt-sandbox][18] 工具，它使用 `libvrit-lxc` 来启动容器。

在那时，红帽里有员工提到一个好办法，换掉 LXC 工具集而添加桥接器，以便 docker 守护进程通过 `libvirt-lxc` 与 libvirt 通讯来启动容器。这个方案也有一些顾虑。考虑下面这个例子，使用 Docker 客户端（`docker-cli`）来启动容器，各层调用会在容器进程（`pid1OfContainer`）之前依次启动：

> **docker-cli → docker-daemon → libvirt-lxc → pid1OfContainer**

我不是很喜欢这个方案，因为它在启动容器的工具与最终的容器进程之间有两个守护进程。

我的团队与上游 docker 开发者合作实现了一个原生的 [Go 编程语言][19] 版本的容器运行时，叫作 [libcontainer][20]。这个库作为 [OCI 运行时规范]的最初版实现与 runc 一同发布。

> **docker-cli → docker-daemon @ pid1OfContainer**

大多数人误认为当他们执行一个容器时，容器进程是作为 `docker-cli` 的子进程运行的。实际上他们执行的是一个客户端/服务端请求操作，容器进程是在一个完全单独的环境作为子进程运行的。这个客户端/服务端请求会导致不稳定性和潜在的安全问题，而且会阻碍一些实用特性的实现。举个例子，[systemd][22] 有个叫做套接字唤醒的特性，你可以将一个守护进程设置成仅当相应的套结字被连接时才启动。这意味着你的系统可以节约内存并按需执行服务。套结字唤醒的工作原理是 systemd 代为监听 TCP 套结字，并在数据包到达套结字时启动相应的服务。一旦服务启动完毕，systemd 将套结字交给新启动的守护进程。如果将守护进程运行在基于 docker 的容器中就会出现问题。systemd 的 unit 文件通过 Docker CLI 执行容器，然而这时 systemd 却无法简单地经由 Docker CLI 将套结字转交给 Docker 守护进程。

类似这样的问题让我们意识到我们需要一个运行容器的替代方案。

#### 容器编排问题

上游的 docker 项目简化了容器的使用过程，同时也是一个绝佳的 Linux 容器学习工具。你可以通过一条简单的命令快速地体验如何启动一个容器，例如运行 `docker run -ti fedora sh` 然后你就立即处于一个容器之中。

当开始把许多容器组织成一个功能更为强大的应用时，你才能体会到容器真正的能力。但是问题在于伴随多容器应用而来的高复杂度使得简单的 Docker 命令无法胜任编排工作。你要如何管理容器应用在有限资源的集群节点间的布局与编排？如何管理它们的生命周期等等？

在第一届 DockerCon，至少有 7 种不同的公司/开源项目展示了其容器的编排方案。红帽演示了 [OpenShift][23] 的 [geard][24] 项目，它基于 OpenShift v2 的容器（叫作 gears）。红帽觉得我们需要重新审视容器编排，而且可能要与开源社区的其他人合作。

Google 则演示了 Kubernetes 容器编排工具，它来源于 Google 对其自内部架构进行编排时所积累的知识经验。OpenShift 决定放弃 Gear 项目，开始和 Google 一同开发 Kubernetes。 现在 Kubernetes 是 GitHub 上最大的社区项目之一。

#### Kubernetes

Kubernetes 原先被设计成使用 Google 的 [lmctfy][26] 容器运行时环境来完成工作。在 2014 年夏天，lmctfy 兼容了 docker。Kubernetes 还会在 kubernetes 集群的每个节点运行一个 [kubelet][27] 守护进程，这意味着原先使用 docker 1.8 的 kubernetes 工作流看起来是这样的：

> **kubelet → dockerdaemon @ PID1**

回退到了双守护进程的模式。

然而更糟糕的是，每次 docker 的新版本发布都使得 kubernetes 无法工作。Docker 1.10 切换镜像底层存储方案导致所有镜像重建。而 Docker 1.11 开始使用 `runc` 来启动镜像：

> **kubelet → dockerdaemon @ runc @PID1**

Docker 1.12 则增加了一个容器守护进程用于启动容器。其主要目的是为了支持 Docker Swarm （Kubernetes 的竞争者之一）：

> **kubelet → dockerdaemon → containerd @runc @ pid1**

如上所述，_每一次_ docker 发布都破坏了 Kubernetes 的功能，这也是为什么 Kubernetes 和 OpenShift 请求我们为他们提供老版本 Docker 的原因。

现在我们有了一个三守护进程的系统，只要任何一个出现问题，整个系统都将崩溃。

### 走向容器标准化

#### CoreOS、rkt 和其它替代运行时

因为 docker 运行时带来的问题，几个组织都在寻求一个替代的运行时。CoreOS 就是其中之一。他们提供了一个 docker 容器运行时的替代品，叫 _rkt_ （rocket）。他们同时还引入一个标准容器规范，称作 _appc_ （App Container）。从根本上讲，他们是希望能使得所有人都使用一个标准规范来管理容器镜像中的应用。

这一行为为标准化工作树立了一面旗帜。当我第一次开始和上游 docker 合作时，我最大的担忧就是最终我们会分裂出多个标准。我不希望类似 RPM 和 DEB 之间的战争影响接下来 20 年的 Linux 软件部署。appc 的一个成果是它说服了上游 docker 与开源社区合作创建了一个称作 [开放容器计划（Open Container Initiative）][28] (OCI) 的标准团体。

OCI 已经着手制定两个规范：

[OCI 运行时规范][6]：OCI 运行时规范“旨在规范容器的配置、执行环境以及生命周期”。它定义了容器的磁盘存储，描述容器内运行的应用的 JSON 文件，容器的生成和执行方式。上游 docker 贡献了 libcontainer 并构建了 runc 作为 OCI 运行时规范的默认实现。

[OCI 镜像文件格式规范][7]：镜像文件格式规范主要基于上游 docker 所使用的镜像格式，定义了容器仓库中实际存储的容器镜像格式。该规范使得应用开发者能为应用使用单一的标准化格式。一些 appc 中描述的概念被加入到 OCI 镜像格式规范中得以保留。这两份规范 1.0 版本的发布已经临近（LCTT 译注：[已经发布](https://linux.cn/article-8778-1.html)）。上游 docker 已经同意在 OCI 镜像规范定案后支持该规范。Rkt 现在既支持运行 OCI 镜像也支持传统的上游 docker 镜像。

OCI 通过为工业界提供容器镜像与运行时标准化的环境，帮助在工具与编排领域解放创新的力量。

#### 抽象运行时接口

得益于标准化工作， Kubernetes 编排领域也有所创新。作为 Kubernetes 的一大支持者，CoreOS 提交了一堆补丁，使 Kubernetes 除了 docker 引擎外还能通过 rkt 运行容器并且与容器通讯。Google 和 Kubernetes 上游预见到增加这些补丁和将来可能添加的容器运行时接口将给 Kubernetes 带来的代码复杂度，他们决定实现一个叫作 容器运行时接口（Container Runtime Interface） (CRI) 的 API 协议规范。于是他们将 Kubernetes 由原来的直接调用 docker 引擎改为调用 CRI，这样任何人都可以通过实现服务器端的 CRI 来创建支持
Kubernetes 的容器运行时。Kubernetes 上游还为 CRI 开发者们创建了一个大型测试集以验证他们的运行时对 Kubernetes 的支持情况。开发者们还在努力地移除 Kubernetes 对 docker 引擎的调用并将它们隐藏在一个叫作 docker-shim 的薄抽象层后。

### 容器工具的创新

#### 伴随 skopeo 而来的容器仓库创新

几年前我们正与 Atomic 项目团队合作构建 [atomic CLI][29]。我们希望实现一个功能，在镜像还在镜像仓库时查看它的细节。在那时，查看仓库中的容器镜像相关 JSON 文件的唯一方法是将镜像拉取到本地服务器再通过 `docker inspect` 来查看 JSON 文件。这些镜像可能会很大，上至几个 GiB。为了允许用户在不拉取镜像的情况下查看镜像细节，我们希望在 `docker inspect` 接口添加新的 `--remote` 参数。上游 docker 拒绝了我们的代码拉取请求（PR），告知我们他们不希望将 Docker CLI 复杂化，我们可以构建我们自己的工具去实现相同的功能。

我们的团队在 [Antonio Murdaca][30] 的领导下执行这个提议，构建了 [skopeo][31]。Antonio 没有止步于拉取镜像相关的 JSON 文件，而是决定实现一个完整的协议，用于在容器仓库与本地主机之间拉取与推送容器镜像。

skopeo 现在被 atomic CLI 大量用于类似检查容器更新的功能以及 [atomic 扫描][32] 当中。Atomic 也使用 skopeo 取代上游 docker 守护进程拉取和推送镜像的功能。

#### Containers/image

我们也曾和 CoreOS 讨论过在 rkt 中使用 skopeo 的可能，然而他们表示不希望运行一个外部的协助程序，但是会考虑使用 skopeo 所使用的代码库。于是我们决定将 skopeo 分离为一个代码库和一个可执行程序，创建了 [image][8] 代码库。

[containers/images][33] 代码库和 skopeo 被几个其它上游项目和云基础设施工具所使用。Skopeo 和 containers/image 已经支持 docker 和多个存储后端，而且能够在容器仓库之间移动容器镜像，还拥有许多酷炫的特性。[skopeo 的一个优点][34]是它不需要任何守护进程的协助来完成任务。Containers/image 代码库的诞生使得类似[容器镜像签名][35]等增强功能得以实现。

#### 镜像处理与扫描的创新

我在前文提到 atomic CLI。我们构建这个工具是为了给容器添加不适合 docker CLI 或者我们无法在上游 docker 中实现的特性。我们也希望获得足够灵活性，将其用于开发额外的容器运行时、工具和存储系统。Skopeo 就是一例。

我们想要在 atomic 实现的一个功能是 `atomic mount`。从根本上讲，我们希望从 Docker 镜像存储（上游 docker 称之为 graph driver）中获取内容，把镜像挂在到某处，以便用工具来查看该镜像。如果你使用上游的 docker，查看镜像内容的唯一方法就是启动该容器。如果其中有不可信的内容，执行容器中的代码来查看它会有潜在危险。通过启动容器查看镜像内容的另一个问题是所需的工具可能没有被包含在容器镜像当中。

大多数容器镜像扫描器遵循以下流程：它们连接到 Docker 的套结字，执行一个 `docker save` 来创建一个 tar 打包文件，然后在磁盘上分解这个打包文件，最后查看其中的内容。这是一个很慢的过程。

通过 `atomic mount`，我们希望直接使用 Docker graph driver 挂载镜像。如果 docker 守护进程使用 device mapper，我们将挂载这个设备。如果它使用 overlay，我们会挂载 overlay。这个操作很快而且满足我们的需求。现在你可以执行：

```
# atomic mount fedora /mnt
# cd /mnt
```

然后开始探查内容。你完成相应工作后，执行：

```
# atomic umount /mnt
```

我们在 `atomic scan` 中使用了这一特性，实现了一个快速的容器扫描器。

#### 工具协作的问题

其中一个严重的问题是 `atomic mount` 隐式地执行这些工作。Docker 守护进程不知道有另一个进程在使用这个镜像。这会导致一些问题（例如，如果你先挂载了 Fedora 镜像，然后某个人执行了 `docker rmi fedora` 命令，docker 守护进程移除镜像时就会产生奇怪的操作失败，同时报告说相应的资源忙碌）。Docker 守护进程可能因此进入一个奇怪的状态。

#### 容器存储系统

为了解决这个问题，我们开始尝试将从上游 docker 守护进程剥离出来的 graph driver 代码拉取到我们的代码库中。Docker 守护进程在内存中为 graph driver 完成所有锁的获取。我们想要将这些锁操作转移到文件系统中，这样我们可以支持多个不同的进程来同时操作容器的存储系统，而不用通过单一的守护进程。

我们创建了 [containers/storage][36] 项目，实现了容器运行、构建、存储所需的所有写时拷贝（COW）特性，同时不再需要一个单一进程来控制和监控这个过程（也就是不需要守护进程）。现在 skopeo 以及其它工具和项目可以直接利用镜像的存储系统。其它开源项目也开始使用 containers/storage，在某些时候，我们也会把这些项目合并回上游 docker 项目。

### 驶向创新

当 Kubernetes 在一个节点上使用 docker 守护进程运行容器时会发生什么？首先，Kubernetes 执行一条类似如下的命令：

```
kubelet run nginx -image=nginx
```

这个命令告诉 kubelet 在节点上运行 NGINX 应用程序。kubelet 调用 CRI 请求启动 NGINX 应用程序。在这时，实现了 CRI 规范的容器运行时必须执行以下步骤：

1.  检查本地是否存在名为 `nginx` 的容器。如果没有，容器运行时会在容器仓库中搜索标准的容器镜像。
2.  如果镜像不存在于本地，从容器仓库下载到本地系统。
3.  使用容器存储系统（通常是写时拷贝存储系统）解析下载的容器镜像并挂载它。
4.  使用标准的容器运行时执行容器。

让我们看看上述过程使用到的特性：

1.  OCI 镜像格式规范定义了容器仓库存储的标准镜像格式。
2.  Containers/image 代码库实现了从容器仓库拉取镜像到容器主机所需的所有特性。
3.  Containers/storage 提供了在写时拷贝的存储系统上探查并处理 OCI 镜像格式的代码库。
4.  OCI 运行时规范以及 `runc` 提供了执行容器的工具（同时也是 docker 守护进程用来运行容器的工具）。

这意味着我们可以利用这些工具来使用容器，而无需一个大型的容器守护进程。

在中等到大规模的基于 DevOps 的持续集成/持续交付环境下，效率、速度和安全性至关重要。只要你的工具遵循 OCI 规范，开发者和执行者就能在持续集成、持续交付到生产环境的自动化中自然地使用最佳的工具。大多数的容器工具被隐藏在容器编排或上层容器平台技术之下。我们预想着有朝一日，运行时和镜像工具的选择会变成容器平台的一个安装选项。

#### 系统（独立）容器

在 Atomic 项目中我们引入了<ruby>原子主机<rt>atomic host</rt></ruby>，一种新的操作系统构建方式：所有的软件可以被“原子地”升级并且大多数应用以容器的形式运行在操作系统中。这个平台的目的是证明将来所有的软件都能部署在 OCI 镜像格式中并且使用标准协议从容器仓库中拉取，然后安装到系统上。用容器镜像的形式发布软件允许你以不同的速度升级应用程序和操作系统。传统的 RPM/yum/DNF 包分发方式把应用更新锁定在操作系统的生命周期中。

在以容器部署基础设施时多数会遇到一个问题——有时一些应用必须在容器运行时执行之前启动。我们看一个使用 docker 的 Kubernetes 的例子：Kubernetes 为了将 pods 或者容器部署在独立的网络中，要求先建立一个网络。现在默认用于创建网络的守护进程是 [flanneld][9]，而它必须在 docker 守护进程之前启动，以支持 docker 网络接口来运行 Kubernetes 的 pods。而且，flanneld 使用 [etcd][37] 来存储数据，这个守护进程必须在 flanneld 启动之前运行。

如果你想把 etcd 和 flanneld 部署到容器镜像中，那就陷入了鸡与鸡蛋的困境中。我们需要容器运行时来启动容器化的应用，但这些应用又需要在容器运行时之前启动。我见过几个取巧的方法尝试解决这个问题，但这些方法都不太干净利落。而且 docker 守护进程当前没有合适的方法来配置容器启动的优先级顺序。我见过一些提议，但它们看起来和 SysVInit 所使用的启动服务的方式相似（我们知道它带来的复杂度）。

#### systemd

用 systemd 替代 SysVInit 的原因之一就是为了处理服务启动的优先级和顺序，我们为什么不充分利用这种技术呢？在 Atomic 项目中我们决定在让它在没有容器运行时的情况下也能启动容器，尤其是在系统启动早期。我们增强了 atomic CLI 的功能，让用户可以安装容器镜像。当你执行 `atomic install --system etc`，它将利用 skopeo 从外部的容器仓库拉取 etcd 的 OCI 镜像，然后把它分解（扩展）为 OSTree 底层存储。因为 etcd 运行在生产环境中，我们把镜像处理为只读。接着 `atomic` 命令抓取容器镜像中的 systemd 的 unit 文件模板，用它在磁盘上创建 unit 文件来启动镜像。这个 unit 文件实际上使用 `runc` 来在主机上启动容器（虽然 `runc` 不是必需的）。

执行 `atomic install --system flanneld` 时会进行相似的过程，但是这时 flanneld 的 unit 文件中会指明它依赖 etcd。

在系统引导时，systemd 会保证 etcd 先于 flanneld 运行，并且直到 flanneld 启动完毕后再启动容器运行时。这样我们就能把 docker 守护进程和 Kubernetes 部署到系统容器当中。这也意味着你可以启动一台原子主机或者使用传统的基于 rpm 的操作系统，让整个容器编排工具栈运行在容器中。这是一个强大的特性，因为用户往往希望改动容器主机时不受这些组件影响。而且，它保持了主机的操作系统的占用最小化。

大家甚至讨论把传统的应用程序部署到独立/系统容器或者被编排的容器中。设想一下，可以用 `atomic install --system httpd` 命令安装一个 Apache 容器，这个容器可以和用 RPM 安装的 httpd 服务以相同的方式启动（`systemctl start httpd` ，区别是这个容器 httpd 运行在一个容器中）。存储系统可以是本地的，换言之，`/var/www` 是从宿主机挂载到容器当中的，而容器监听着本地网络的 80 端口。这表明了我们可以在不使用容器守护进程的情况下将传统的负载组件部署到一个容器中。

### 构建容器镜像

在我看来，在过去 4 年来容器发展方面最让人失落的是缺少容器镜像构建机制上的创新。容器镜像不过是将一些 tar 包文件与 JSON 文件一起打包形成的文件。基础镜像则是一个 rootfs 与一个描述该基础镜像的 JSON 文件。然后当你增加镜像层时，层与层之间的差异会被打包，同时 JSON 文件会做出相应修改。这些镜像层与基础文件一起被打包，共同构成一个容器镜像。

现在几乎所有人都使用 `docker build` 与 Dockerfile 格式来构建镜像。上游 docker 已经在几年前停止了接受修改或改进 Dockerfile 格式的拉取请求（PR）了。Dockerfile 在容器的演进过程中扮演了重要角色，开发者和管理员/运维人员可以通过简单直接的方式来构建镜像；然而我觉得 Dockerfile 就像一个简陋的 bash 脚本，还带来了一些尚未解决的问题，例如：

*   使用 Dockerfile 创建容器镜像要求运行着 Docker 守护进程。
    *   没有可以独立于 docker 命令的标准工具用于创建 OCI 镜像。
    *   甚至类似 `ansible-containers` 和 OpenShift S2I (Source2Image) 的工具也在底层使用 `docker-engine`。
*   Dockerfile 中的每一行都会创建一个新的镜像，这有助于创建容器的开发过程，这是因为构建工具能够识别 Dockerfile 中的未改动行，复用已经存在的镜像从而避免了未改动行的重复执行。但这个特性会产生_大量_的镜像层。
    *   因此，不少人希望构建机制能压制镜像消除这些镜像层。我猜想上游 docker 最后应该接受了一些提交满足了这个需求。
*   要从受保护的站点拉取内容到容器镜像，你往往需要某种密钥。比如你为了添加 RHEL 的内容到镜像中，就需要访问 RHEL 的证书和订阅。
    *   这些密钥最终会被以层的方式保存在镜像中。开发者要费很大工夫去移除它们。
    *   为了允许在 docker 构建过程中挂载数据卷，我们在我们维护的 projectatomic/docker 中加入了 `-v volume` 选项，但是这些修改没有被上游 docker 接受。
*   构建过程的中间产物最终会保留在容器镜像中，所以尽管 Dockerfile 易于学习，当你想要了解你要构建的镜像时甚至可以在笔记本上构建容器，但它在大规模企业环境下还不够高效。然而在自动化容器平台下，你应该不会关心用于构建 OCI 镜像的方式是否高效。

### Buildah 起航

在 DevConf.cz 2017，我让我们团队的 [Nalin Dahyabhai][38] 考虑构建被我称为 `containers-coreutils` 的工具，它基本上就是基于 containers/storage 和 containers/image 库构建的一系列可以使用类似 Dockerfile 语法的命令行工具。Nalin 为了取笑我的波士顿口音，决定把它叫做 [buildah][39]。我们只需要少量的 buildah 原语就可以构建一个容器镜像：

*   最小化 OS 镜像、消除不必要的工具是主要的安全原则之一。因为黑客在攻击应用时需要一些工具，如果类似 `gcc`，`make`，`dnf` 这样的工具根本不存在，就能阻碍攻击者的行动。
*   减小容器的体积总是有益的，因为这些镜像会通过互联网拉取与推送。
*   使用 Docker 进行构建的基本原理是在容器构建的根目录下利用命令安装或编译软件。
*   执行 `run` 命令要求所有的可执行文件都包含在容器镜像内。只是在容器镜像中使用 `dnf` 就需要完整的 Python 栈，即使在应用中从未使用到 Python。
*   `ctr=$(buildah from fedora)`:
    *   使用 containers/image 从容器仓库拉取 Fedora 镜像。
    *   返回一个容器 ID （`ctr`）。
*   `mnt=$(buildah mount $ctr)`:
    *   挂载新建的容器镜像（`$ctr`）.
    *   返回挂载点路径。
    *   现在你可以使用挂载点来写入内容。
*   `dnf install httpd –installroot=$mnt`:
    *   你可以使用主机上的命令把内容重定向到容器中，这样你可以把密钥保留在主机而不导入到容器内，同时构建所用的工具也仅仅存在于主机上。
    *   容器内不需要包含 `dnf` 或者 Python 栈，除非你的应用用到它们。
*   `cp foobar $mnt/dir`:
    *   你可以使用任何 bash 中可用的命令来构造镜像。
*   `buildah commit $ctr`:
    *   你可以随时创建一个镜像层，镜像的分层由用户而不是工具来决定。
*   `buildah config --env container=oci --entrypoint /usr/bin/httpd $ctr`:
    *   Buildah 支持所有 Dockerfile 的命令。
*   `buildah run $ctr dnf -y install httpd`:
    *   Buildah 支持 `run` 命令，但它是在一个锁定的容器内利用 `runc` 执行命令，而不依赖容器运行时守护进程。
*   `buildah build-using-dockerfile -f Dockerfile .`：

    我们希望将移植类似 `ansible-containers` 和 OpenShift S2I 这样的工具，改用 `buildah` 以去除对容器运行时守护进程的依赖。

    使用与生产环境相同的容器运行时构建容器镜像会遇到另一个大问题。为了保证安全性，我们需要把权限限制到支持容器构建与运行所需的最小权限。构建容器比起运行容器往往需要更多额外的权限。举个例子，我们默认允许 `mknod` 权限，这会允许进程创建设备节点。有些包的安装会尝试创建设备节点，然而在生产环境中的应用几乎都不会这么做。如果默认移除生产环境中容器的 `mknod` 特权会让系统更为安全。

    另一个例子是，容器镜像默认是可读写的，因为安装过程意味着向 `/usr` 存入软件包。然而在生产环境中，我强烈建议把所有容器设为只读模式，仅仅允许它们写入 tmpfs 或者是挂载了数据卷的目录。通过分离容器的构建与运行环境，我们可以更改这些默认设置，提供一个更为安全的环境。
    
    *   当然，buildah 可以使用 Dockerfile 构建容器镜像。

### CRI-O ：一个 Kubernetes 的运行时抽象

Kubernetes 添加了<ruby>容器运行时接口<rt>Container Runtime Interface</rt></ruby>（CRI）接口，使 pod 可以在任何运行时上工作。虽然我不是很喜欢在我的系统上运行太多的守护进程，然而我们还是加了一个。我的团队在 [Mrunal Patel][40] 的领导下于 2016 年后期开始构建 [CRI-O] 守护进程。这是一个用来运行 OCI 应用程序的 OCI 守护进程。理论上，将来我们能够把 CRI-O 的代码直接并入 kubelet 中从而消除这个多余的守护进程。

不像其它容器运行时，CRI-O 的唯一目的就只是为了满足 Kubernetes 的需求。记得前文描述的 Kubernetes 运行容器的条件。

Kubernetes 传递消息给 kubelet 告知其运行 NGINX 服务器：

1.  kubelet 唤醒 CRI-O 并告知它运行 NGINX。
2.  CRI-O 回应 CRI 请求。
3.  CRI-O 在容器仓库查找 OCI 镜像。
4.  CRI-O 使用 containers/image 从仓库拉取镜像到主机。
5.  CRI-O 使用 containers/storage 解压镜像到本地磁盘。
6.  CRI-O 按照 OCI 运行时规范（通常使用 `runc`）启动容器。如前文所述，Docker 守护进程也同样使用 `runc` 启动它的容器。
7.  按照需要，kubelet 也可以使用替代的运行时启动容器，例如 Clear Containers `runcv`。

CRI-O 旨在成为稳定的 Kubernetes 运行平台。只有通过完整的 Kubernetes 测试集后，新版本的 CRI-O 才会被推出。所有提交到 [https://github.com/Kubernetes-incubator/cri-o][42] 的拉取请求都会运行完整的 Kubernetes 测试集。没有通过测试集的拉取请求都不会被接受。CRI-O 是完全开放的，我们已经收到了来自 Intel、SUSE、IBM、Google、Hyper.sh 等公司的代码贡献。即使不是红帽想要的特性，只要通过一定数量维护者的同意，提交给 CRI-O 的补丁就会被接受。

### 小结

我希望这份深入的介绍能够帮助你理解 Linux 容器的演化过程。Linux 容器曾经陷入一种各自为营的困境，Docker 建立起了镜像创建的事实标准，简化了容器的使用工具。OCI 则意味着业界在核心镜像格式与运行时方面的合作，这促进了工具在自动化效率、安全性、高可扩展性、易用性方面的创新。容器使我们能够以一种新奇的方式部署软件——无论是运行于主机上的传统应用还是部署在云端的微服务。而在许多方面，这一切还仅仅是个开始。

（题图：[Daniel Ramirez][11] [CC BY-SA 4.0][12]）

--------------------------------------------------------------------------------

作者简介：

Daniel J Walsh - Daniel 有将近 30 年的计算机安全领域工作经验。他在 2001 年 8 月加入 Red Hat。

via: https://opensource.com/article/17/7/how-linux-containers-evolved

作者：[Daniel J Walsh][a]
译者：[haoqixu](https://github.com/haoqixu)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/rhatdan
[1]:https://opensource.com/resources/what-are-linux-containers?utm_campaign=containers&intcmp=70160000000h1s6AAA
[2]:https://opensource.com/resources/what-docker?utm_campaign=containers&intcmp=70160000000h1s6AAA
[3]:https://opensource.com/resources/what-is-kubernetes?utm_campaign=containers&intcmp=70160000000h1s6AAA
[4]:https://developers.redhat.com/blog/2016/01/13/a-practical-introduction-to-docker-container-terminology/utm_campaign=containers&intcmp=70160000000h1s6AAA
[5]:https://opensource.com/article/17/7/how-linux-containers-evolved?rate=k1UcW7wzh6axaB_z8ScE-U8cux6fLXXgW_vboB5tIwk
[6]:https://github.com/opencontainers/runtime-spec/blob/master/spec.md
[7]:https://github.com/opencontainers/image-spec/blob/master/spec.md
[8]:https://github.com/containers/image
[9]:https://github.com/coreos/flannel
[10]:https://opensource.com/user/16673/feed
[11]:https://www.flickr.com/photos/danramarch/
[12]:https://creativecommons.org/licenses/by-sa/4.0/
[13]:https://access.redhat.com/documentation/en-US/Red_Hat_Enterprise_Linux/6/html/Logical_Volume_Manager_Administration/device_mapper.html
[14]:https://btrfs.wiki.kernel.org/index.php/Main_Page
[15]:https://www.kernel.org/doc/Documentation/filesystems/overlayfs.txt
[16]:https://linuxcontainers.org/
[17]:https://libvirt.org/
[18]:http://sandbox.libvirt.org/
[19]:https://opensource.com/article/17/6/getting-started-go
[20]:https://github.com/opencontainers/runc/tree/master/libcontainer
[21]:https://github.com/opencontainers/runtime-spec
[22]:https://opensource.com/business/15/10/lisa15-interview-alison-chaiken-mentor-graphics
[23]:https://www.openshift.com/
[24]:https://openshift.github.io/geard/
[25]:https://opensource.com/resources/what-is-kubernetes
[26]:https://github.com/google/lmctfy
[27]:https://kubernetes.io/docs/admin/kubelet/
[28]:https://www.opencontainers.org/
[29]:https://github.com/projectatomic/atomic
[30]:https://twitter.com/runc0m
[31]:https://github.com/projectatomic/skopeo
[32]:https://developers.redhat.com/blog/2016/05/02/introducing-atomic-scan-container-vulnerability-detection/
[33]:https://github.com/containers/image
[34]:http://rhelblog.redhat.com/2017/05/11/skopeo-copy-to-the-rescue/
[35]:https://access.redhat.com/articles/2750891
[36]:https://github.com/containers/storage
[37]:https://github.com/coreos/etcd
[38]:https://twitter.com/nalind
[39]:https://github.com/projectatomic/buildah
[40]:https://twitter.com/mrunalp
[41]:https://github.com/Kubernetes-incubator/cri-o
[42]:https://github.com/Kubernetes-incubator/cri-o
[43]:https://opensource.com/users/rhatdan
[44]:https://opensource.com/users/rhatdan
[45]:https://opensource.com/article/17/7/how-linux-containers-evolved#comments

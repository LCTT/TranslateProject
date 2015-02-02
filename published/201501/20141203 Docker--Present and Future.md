Docker 的现状与未来
================================================================================

### Docker - 迄今为止发生的那些事情 ###

Docker 是一个专为 Linux 容器而设计的工具集，用于‘构建、交付和运行’分布式应用。它最初是 DotCloud 的一个开源项目，于2013年3月发布。这个项目越来越受欢迎，以至于 DotCloud 公司都更名为 Docker 公司（并最终[出售了原有的 PaaS 业务][1])。[Docker 1.0][2]是在2014年6月发布的，而且延续了之前每月更新一个版本的传统。

Docker 1.0版本的发布标志着 Docker 公司认为该平台已经充分成熟，足以用于生产环境中（由该公司与合作伙伴提供付费支持选择）。每个月发布的更新表明该项目正在迅速发展，比如增添一些新特性、解决一些他们发现的问题。该项目已经成功地分离了‘运行’和‘交付’两件事，所以来自任何版本的 Docker 镜像源都可以与其它版本共同使用（具备向前和向后兼容的特性），这为 Docker 应对快速变化提供了稳定的保障。

Docker 之所以能够成为最受欢迎的开源项目之一可能会被很多人看做是炒作，但是也是由其坚实的基础所决定的。Docker 的影响力已经得到整个行业许多大企业的支持，包括亚马逊, Canonical 公司, CenturyLink, 谷歌, IBM, 微软, New Relic, Pivotal, 红帽和 VMware。这使得只要有 Linux 的地方，Docker 就可以无处不在。除了这些鼎鼎有名的大公司以外，许多初创公司也在围绕着 Docker 发展，或者改变他们的发展方向来与 Docker 更好地结合起来。这些合作伙伴们（无论大或小）都将帮助推动 Docker 核心项目及其周边生态环境的快速发展。

### Docker 技术简要综述 ###

Docker 利用 Linux 的一些内核机制例如 [cGroups][3]、命名空间和 [SElinux][4] 来实现容器之间的隔离。起初 Docker 只是 [LXC][5] 容器管理器子系统的前端，但是在 0.9 版本中引入了 [libcontainer][6]，这是一个原生的 go 语言库，提供了用户空间和内核之间的接口。

容器是基于 [AUFS][7] 这样的联合文件系统的，它允许跨多个容器共享组件，如操作系统镜像和已安装的相关库。这种文件系统的分层方法也被 [Dockerfile][8] 的 DevOps 工具所利用，这些工具能够缓存成功完成的操作。这就省下了安装操作系统和相关应用程序依赖包的时间，极大地加速测试周期。另外，在容器之间的共享库也能够减少内存的占用。

一个容器是从一个镜像开始运行的，它可以来自本地创建，本地缓存，或者从一个注册库（registry）下载。Docker 公司运营的 [Docker Hub 公有注册库][9]，为各种操作系统、中间件和数据库提供了官方仓库存储。各个组织和个人都可以在 docker Hub 上发布的镜像的公有库，也可以注册成私有仓库。由于上传的镜像可以包含几乎任何内容，所以 Docker 提供了一种自动构建工具（以往称为“可信构建”），镜像可以从一种称之为 Dockerfile 的镜像内容清单构建而成。

### 容器 vs. 虚拟机 ###

容器会比虚拟机更高效，因为它们能够分享一个内核和分享应用程序库。相比虚拟机系统，这也将使得 Docker 使用的内存更小，即便虚拟机利用了内存超量使用的技术。部署容器时共享底层的镜像层也可以减少存储占用。IBM 的 Boden Russel 已经做了一些[基准测试][10]来说明两者之间的不同。

相比虚拟机系统，容器具有较低系统开销的优势，所以在容器中，应用程序的运行效率将会等效于在同样的应用程序在虚拟机中运行，甚至效果更佳。IBM 的一个研究团队已经发表了一本名为[虚拟机与 Linux 容器的性能比较]的文章[11]。

容器只是在隔离特性上要比虚拟机逊色。虚拟机可以利用如 Intel 的 VT-d 和 VT-x 技术的 ring-1 [硬件隔离][12]技术。这种隔离可以防止虚拟机突破和彼此交互。而容器至今还没有任何形式的硬件隔离，这使它容易受到攻击。一个称为 [Shocker][13] 的概念攻击验证表明，在 Docker 1.0 之前的版本是存在这种脆弱性的。尽管 Docker 1.0 修复了许多由 Shocker 漏洞带来的较为严重的问题，Docker 的 CTO Solomon Hykes 仍然[说][14]，“当我们可以放心宣称 Docker 的开箱即用是安全的，即便是不可信的 uid0 程序（超级用户权限程序），我们将会很明确地告诉大家。”Hykes 的声明承认，其漏洞及相关的风险依旧存在，所以在容器成为受信任的工具之前将有更多的工作要做。

对于许多用户案例而言，在容器和虚拟机之间二者选择其一是种错误的二分法。Docker 同样可以在虚拟机中工作的很好，这让它可以用在现有的虚拟基础措施、私有云或者公有云中。同样也可以在容器里跑虚拟机，这也类似于谷歌在其云平台的使用方式。像 IaaS 服务这样普遍可用的基础设施，能够即时提供所需的虚拟机，可以预期容器与虚拟机一起使用的情景将会在数年后出现。容器管理和虚拟机技术也有可能被集成到一起提供一个两全其美的方案；这样，一个硬件信任锚微虚拟化所支撑的 libcontainer 容器，可与前端 Docker 工具链和生态系统整合，而使用提供更好隔离性的不同后端。微虚拟化（例如 Bromium 的 [vSentry][15] 和 VMware 的 [Project Fargo][16])已经用于在桌面环境中以提供基于硬件的应用程序隔离，所以类似的方法也可以用于 libcontainer，作为 Linux内核中的容器机制的替代技术。

### ‘容器化’ 的应用程序 ###

几乎所有 Linux 应用程序都可以在 Docker 容器中运行，并没有编程语言或框架的限制。唯一的实际限制是以操作系统的角度来允许容器做什么。即使如此，也可以在特权模式下运行容器，从而大大减少了限制（与之对应的是容器中的应用程序的风险增加，可能导致损坏主机操作系统）。

容器都是从镜像开始运行的，而镜像也可以从运行中的容器获取。本质上说，有两种方法可以将应用程序放到容器中，分别是手动构建和 Dockerfile。

#### 手动构建 ####

手动构建从启动一个基础的操作系统镜像开始，然后在交互式终端中用你所选的 Linux 提供的包管理器安装应用程序及其依赖项。Zef Hemel 在‘[使用 Linux 容器来支持便携式应用程序部署][17]’的文章中讲述了他部署的过程。一旦应用程序被安装之后，容器就可以被推送至注册库（例如Docker Hub）或者导出为一个tar文件。

#### Dockerfile ####

Dockerfile 是一个用于构建 Docker 容器的脚本化系统。每一个 Dockerfile 定义了开始的基础镜像，以及一系列在容器中运行的命令或者一些被添加到容器中的文件。Dockerfile 也可以指定对外的端口和当前工作目录，以及容器启动时默认执行的命令。用 Dockerfile 构建的容器可以像手工构建的镜像一样推送或导出。Dockerfile 也可以用于 Docker Hub 的自动构建系统，即在 Docker 公司的控制下从头构建，并且该镜像的源代码是任何需要使用它的人可见的。

#### 单进程? ####

无论镜像是手动构建还是通过 Dockerfile 构建，有一个要考虑的关键因素是当容器启动时仅启动一个进程。对于一个单一用途的容器，例如运行一个应用服务器，运行一个单一的进程不是一个问题（有些关于容器应该只有一个单独的进程的争议）。对于一些容器需要启动多个进程的情况，必须先启动 [supervisor][18] 进程，才能生成其它内部所需的进程。由于容器内没有初始化系统，所以任何依赖于 systemd、upstart 或类似初始化系统的东西不修改是无法工作的。

### 容器和微服务 ###

全面介绍使用微服务结构体系的原理和好处已经超出了这篇文章的范畴（在 [InfoQ eMag: Microservices][19] 有全面阐述）。然而容器是绑定和部署微服务实例的捷径。

大规模微服务部署的多数案例都是部署在虚拟机上，容器只是用于较小规模的部署上。容器具有共享操作系统和公用库的的内存和硬盘存储的能力，这也意味着它可以非常有效的并行部署多个版本的服务。

### 连接容器 ###

一些小的应用程序适合放在单独的容器中，但在许多案例中应用程序需要分布在多个容器中。Docker 的成功包括催生了一连串新的应用程序组合工具、编制工具及平台作为服务(PaaS)的实现。在这些努力的背后，是希望简化从一组相互连接的容器来创建应用的过程。很多工具也在扩展、容错、性能管理以及对已部署资产进行版本控制方面提供了帮助。

#### 连通性 ####

Docker 的网络功能是相当原始的。在同一主机，容器内的服务可以互相访问，而且 Docker 也可以通过端口映射到主机操作系统，使服务可以通过网络访问。官方支持的提供连接能力的库叫做 [libchan][20]，这是一个提供给 Go 语言的网络服务库，类似于[channels][21]。在 libchan 找到进入应用的方法之前，第三方应用仍然有很大空间可提供配套的网络服务。例如，[Flocker][22] 已经采取了基于代理的方法使服务实现跨主机（以及底层存储）的移植。

#### 合成 ####

Docker 本身拥有把容器连接在一起的机制，与元数据相关的依赖项可以被传递到相依赖的容器中，并用于环境变量和主机入口。如 [Fig][23] 和 [geard][24] 这样的应用合成工具可以在单一文件中展示出这种依赖关系图，这样多个容器就可以汇聚成一个连贯的系统。CenturyLink 公司的 [Panamax][25] 合成工具类似 Fig 和 geard 的底层实现方法，但新增了一些基于 web 的用户接口，并直接与 GitHub 相结合，以便于应用程序分享。

#### 编制 ####

像 [Decking][26]、New Relic 公司的 [Centurion][27] 和谷歌公司的 [Kubernetes][28] 这样的编制系统都是旨在协助容器的部署和管理其生命周期系统。也有许多 [Apache Mesos][30] （特别是 [Marathon（马拉松式）持续运行很久的框架]）的案例（例如[Mesosphere][29]）已经被用于配合 Docker 一起使用。通过为应用程序与底层基础架构之间（例如传递 CPU 核数和内存的需求）提供一个抽象的模型，编制工具提供了两者的解耦，简化了应用程序开发和数据中心操作。有很多各种各样的编制系统，因为许多来自内部系统的以前开发的用于大规模容器部署的工具浮现出来了；如 Kubernetes 是基于谷歌的 [Omega][32] 系统的，[Omega][32] 是用于管理遍布谷歌云环境中容器的系统。

虽然从某种程度上来说合成工具和编制工具的功能存在重叠，但这也是它们之间互补的一种方式。例如 Fig 可以被用于描述容器间如何实现功能交互，而 Kubernetes pods（容器组）可用于提供监控和扩展。

#### 平台（即服务）####

有一些 Docker 原生的 PaaS 服务实现，例如 [Deis][33] 和 [Flynn][34] 已经显现出 Linux 容器在开发上的的灵活性（而不是那些“自以为是”的给出一套语言和框架）。其它平台，例如 CloudFoundry、OpenShift 和 Apcera Continuum 都已经采取将 Docker 基础功能融入其现有的系统的技术路线，这样基于 Docker 镜像（或者基于 Dockerfile）的应用程序也可以与之前用支持的语言和框架的开发的应用一同部署和管理。

### 所有的云 ###

由于 Docker 能够运行在任何正常更新内核的 Linux 虚拟机中，它几乎可以用在所有提供 IaaS 服务的云上。大多数的主流云厂商已经宣布提供对 Docker 及其生态系统的支持。

亚马逊已经把 Docker 引入它们的 Elastic Beanstalk 系统（这是在底层 IaaS 上的一个编制系统）。谷歌使 Docker 成为了“可管理的 VM”，它提供了GAE PaaS 和GCE IaaS 之间的中转站。微软和 IBM 也都已经宣布了基于 Kubernetes 的服务，这样可以在它们的云上部署和管理多容器应用程序。

为了给现有种类繁多的后端提供可用的一致接口，Docker 团队已经引进 [libswarm][35], 它可以集成于众多的云和资源管理系统。Libswarm 所阐明的目标之一是“通过切换服务来源避免被特定供应商套牢”。这是通过呈现一组一致的服务（与API相关联的）来完成的，该服务会通过特定的后端服务所实现。例如 Docker 服务器将支持本地 Docker 命令行工具的 Docker 远程 API 调用，这样就可以管理一组服务供应商的容器了。

基于 Docker 的新服务类型仍在起步阶段。总部位于伦敦的 Orchard 实验室提供了 Docker 的托管服务，但是 Docker 公司表示，收购 Orchard 后，其相关服务不会置于优先位置。Docker 公司也出售了之前 DotCloud 的PaaS 业务给 cloudControl。基于更早的容器管理系统的服务例如 [OpenVZ][36] 已经司空见惯了，所以在一定程度上 Docker 需要向主机托管商们证明其价值。

### Docker 及其发行版 ###

Docker 已经成为大多数 Linux 发行版例如 Ubuntu、Red Hat 企业版（RHEL)和 CentOS 的一个标准功能。遗憾的是这些发行版的步调和 Docker 项目并不一致，所以在发布版中找到的版本总是远远落后于最新版本。例如 Ubuntu 14.04 版本中的版本是 Docker 0.9.1，而当 Ubuntu 升级至 14.04.1 时 Docker 版本并没有随之升级（此时 Docker 已经升至 1.1.2 版本）。在发行版的软件仓库中还有一个名字空间的冲突，因为 “Docker” 也是 KDE 系统托盘的名字；所以在 Ubuntu 14.04 版本中相关安装包的名字和命令行工具都是使用“Docker.io”的名字。

在企业级 Linux 的世界中，情况也并没有因此而不同。CentOS 7 中的 Docker 版本是 0.11.1，这是 Docker 公司宣布准备发行 Docker 1.0 产品版本之前的开发版。Linux 发行版用户如果希望使用最新版本以保障其稳定、性能和安全，那么最好地按照 Docker 的[安装说明][37]进行，使用 Docker 公司的所提供的软件库而不是采用发行版的。

Docker 的到来也催生了新的 Linux 发行版，如 [CoreOS][38] 和红帽的 [Project Atomic][39]，它们被设计为能运行容器的最小环境。这些发布版相比传统的发行版，带着更新的内核及 Docker 版本，对内存的使用和硬盘占用率也更低。新发行版也配备了用于大型部署的新工具，例如 [fleet][40]（一个分布式初始化系统）和[etcd][41]（用于元数据管理）。这些发行版也有新的自我更新机制，以便可以使用最新的内核和 Docker。这也意味着使用 Docker 的影响之一是它抛开了对发行版和相关的包管理解决方案的关注，而对 Linux 内核（及使用它的 Docker 子系统）更加关注。

这些新发行版也许是运行 Docker 的最好方式，但是传统的发行版和它们的包管理器对容器来说仍然是非常重要的。Docker Hub 托管的官方镜像有 Debian、Ubuntu 和 CentOS，以及一个‘半官方’的 Fedora 镜像库。RHEL 镜像在Docker Hub 中不可用，因为它是 Red Hat 直接发布的。这意味着在 Docker Hub 的自动构建机制仅仅用于那些纯开源发行版下（并愿意信任那些源于 Docker 公司团队提供的基础镜像）。

Docker Hub 集成了如 Git Hub 和 Bitbucket 这样源代码控制系统来自动构建包管理器，用于管理构建过程中创建的构建规范（在Dockerfile中）和生成的镜像之间的复杂关系。构建过程的不确定结果并非是  Docker 的特定问题——而与软件包管理器如何工作有关。今天构建完成的是一个版本，明天构建的可能就是更新的版本，这就是为什么软件包管理器需要升级的原因。容器抽象（较少关注容器中的内容）以及容器扩展（因为轻量级资源利用率）有可能让这种不确定性成为 Docker 的痛点。

###  Docker 的未来 ###

Docker 公司对核心功能（libcontainer），跨服务管理(libswarm) 和容器间的信息传递（libchan）的发展上提出了明确的路线。与此同时，该公司已经表明愿意收购 Orchard 实验室，将其纳入自身生态系统。然而 Docker 不仅仅是 Docker 公司的，这个项目的贡献者也来自许多大牌贡献者，其中不乏像谷歌、IBM 和 Red Hat 这样的大公司。在仁慈独裁者、CTO Solomon Hykes 掌舵的形势下，为公司和项目明确了技术领导关系。在前18个月的项目中通过成果输出展现了其快速行动的能力，而且这种趋势并没有减弱的迹象。

许多投资者正在寻找10年前 VMware 公司的 ESX/vSphere 平台的特征矩阵，并试图找出虚拟机的普及而带动的企业预期和当前 Docker 生态系统两者的距离（和机会）。目前 Docker 生态系统正缺乏类似网络、存储和（对于容器的内容的）细粒度版本管理，这些都为初创企业和创业者提供了机会。

随着时间的推移，在虚拟机和容器（Docker 的“运行”部分）之间的区别将变得没那么重要了，而关注点将会转移到“构建”和“交付”方面。这些变化将会使“Docker发生什么？”变得不如“Docker将会给IT产业带来什么？”那么重要了。


--------------------------------------------------------------------------------

via: http://www.infoq.com/articles/docker-future

作者：[Chris Swan][a]
译者：[disylee](https://github.com/disylee)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.infoq.com/author/Chris-Swan
[1]:http://blog.dotcloud.com/dotcloud-paas-joins-cloudcontrol
[2]:http://www.infoq.com/news/2014/06/docker_1.0
[3]:https://www.kernel.org/doc/Documentation/cgroups/cgroups.txt
[4]:http://selinuxproject.org/page/Main_Page
[5]:https://linuxcontainers.org/
[6]:http://blog.docker.com/2014/03/docker-0-9-introducing-execution-drivers-and-libcontainer/
[7]:http://aufs.sourceforge.net/aufs.html
[8]:https://docs.docker.com/reference/builder/
[9]:https://registry.hub.docker.com/
[10]:http://bodenr.blogspot.co.uk/2014/05/kvm-and-docker-lxc-benchmarking-with.html?m=1
[11]:http://domino.research.ibm.com/library/cyberdig.nsf/papers/0929052195DD819C85257D2300681E7B/$File/rc25482.pdf
[12]:https://en.wikipedia.org/wiki/X86_virtualization#Hardware-assisted_virtualization
[13]:http://stealth.openwall.net/xSports/shocker.c
[14]:https://news.ycombinator.com/item?id=7910117
[15]:http://www.bromium.com/products/vsentry.html
[16]:http://cto.vmware.com/vmware-docker-better-together/
[17]:http://www.infoq.com/articles/docker-containers
[18]:http://docs.docker.com/articles/using_supervisord/
[19]:http://www.infoq.com/minibooks/emag-microservices
[20]:https://github.com/docker/libchan
[21]:https://gobyexample.com/channels
[22]:http://www.infoq.com/news/2014/08/clusterhq-launch-flocker
[23]:http://www.fig.sh/
[24]:http://openshift.github.io/geard/
[25]:http://panamax.io/
[26]:http://decking.io/
[27]:https://github.com/newrelic/centurion
[28]:https://github.com/GoogleCloudPlatform/kubernetes
[29]:https://mesosphere.io/2013/09/26/docker-on-mesos/
[30]:http://mesos.apache.org/
[31]:https://github.com/mesosphere/marathon
[32]:http://static.googleusercontent.com/media/research.google.com/en/us/pubs/archive/41684.pdf
[33]:http://deis.io/
[34]:https://flynn.io/
[35]:https://github.com/docker/libswarm
[36]:http://openvz.org/Main_Page
[37]:https://docs.docker.com/installation/#installation
[38]:https://coreos.com/
[39]:http://www.projectatomic.io/
[40]:https://github.com/coreos/fleet
[41]:https://github.com/coreos/etcd

Docker的现状与未来
================================================================================

### Docker - 故事渊源流长 ###

Docker是一个专为Linux容器而设计的工具集，用于‘构建，交付和运行’分布式应用。它最初是通过DotCloud作为一个开源项目在2013年3月的时候发布的。这个项目越来越受欢迎，这使得DotCloud更名为Docker公司（并最终 [出售了原有的PaaS业务][1]).[Docker 1.0][2]是在2014年6月发布的，而且延续了之前每月更新一个版本的习惯。


1.0版本的发布标志着Docker公司认为这个平台的充分成熟已经足以用于生产环境中（由本公司与合作伙伴提供付费支持选项）.每个月发布的更新显示，该项目正在迅速发展，增添一些新特性、解决一些他们发现的问题。然而该项目已经成功地从‘运行’和‘交付’实现分离，所以任何版本的Docker镜像源都可以与其它版本共同使用（具备向前和向后兼容的特性），这为Docker使用的快速变化提供了稳定的保障。

Docker之所以能够成为最受欢迎的开源项目之一除了很多人会认为是的炒作成分，也是由坚实的物质基础奠定的。Docker的影响力已经得到整个行业许多品牌的支持，包括亚马逊, Canonical公司, 世纪互联, 谷歌, IBM, 微软, New Relic, Pivotal, 红帽和VMware. 这使只要Linux可使用的地方，Docker的使用便无处不在。除了这些鼎鼎有名的大公司以外，许多初创公司也在围绕着Docker在成长，或者改变他们的发展方向来与Docker更好地结合起来。这些合作关系（无论大于小）都将帮助推动Docker核心项目及其周边生态环境的快速发展。


### Docker技术的简要综述 ###

Docker利用Linux的一些内核工具例如[cGroups][3],命名空间和[SElinux][4]来实现容器之间的隔离。起初Docker只是[LXC][5]容器管理器子系统的前端，但是在0.9版本中引入了[libcontainer][6],这是原生go语言库用于提供用户空间和内核之间的接口。

容器位于联合文件系统的顶部，例如[AUFS][7],它允许跨多个容器共享例如操作系统镜和安装相关库的组件。在文件系统中的分层方法也利用[ Dockerfile ] [8]中的DevOps工具，这些工具能够成功地完成高速缓存的操作。利用等待时间来安装操作系统和相关应用程序依赖包将会极大地加速测试周期。容器之间的共享库也能够减少内存的占用。

一个容器是从一个镜像开始运行的，它可以本地创建，本地缓存，或者通过注册表来下载。Docker公司经营的 [Docker 公有注册库][9],这为各种操作系统、中间件和数据库提供了主机官方仓库。组织和个人可以在docker公司的为镜像创建公有库，并且也有举办私人仓库的订阅服务。由于上传的镜像会包含几乎所有Docker提供的自动化构建工具（以往称为“受信任的构建”），它的镜像是从Dockerfile创建的，而Dockerfile是镜像内容的清单。

### 容器 vs 虚拟机 ###

容器会比虚拟机更高效，因为它们能够分享一个内核和分享共享应用程序库。相比虚拟机系统，这也将使得Docker使用的内存空间很小，即使虚拟机利用了内存超量使用的技术。部署容器时共享底层的镜像层也可以减少内存的占用。IBM的Boden Russel已经做了一些[基准测试][10]说明两者的不同。

相比虚拟机系统，容器呈现出较低系统开销的优势，所以在容器中，应用程序的运行效率将会等效于在同样的应用程序在虚拟机中运行甚至效果更佳。IBM的一个研究团队已经发表了一本名为[虚拟机与Linux容器的性能比较]的文章[11].


容器在隔离特性上要比虚拟机逊色。虚拟机可以利用ring-1[硬件隔离][12]例如Intel的VT-d和VT-x技术。这种隔离可以防止虚拟机爆发和彼此交互。而容器至今还没有任何形式的硬件隔离，这使它容易受到攻击。一个命名为[Shocker][13]的概念攻击验证表明，在之前的1.0版本中Docker是存在这种脆弱性的。尽管Docker1.0修复了许多由于Shocker漏洞引发较为的严重问题，Docker的CTO Solomon Hykes仍然[表态][14],“当我们自然而然地说Docker的开箱即用是安全的，即便包含了不收信任的uid0程序，我们将会很明确地这样表述。”Hykes的声明承认，其它的漏洞及相关的风险依旧存在，所以在容器成为受信任的工具之前将有更多的工作需要被完成。

对于许多用户案例而言，在容器和虚拟机两者之间选择一种是一种错误的二分法。Docker同样可以在虚拟机中很好工作，它可以被用于现有的虚拟基础措施、私有云或者公有云。同样也可以在容器里跑虚拟机，这也是谷歌使用云平台的一部分。给予一个广泛可利用的基础设施例如IaaS服务，可以为虚拟机提供合理的预期需求，这个合理的预期即容器与虚拟机一起使用的情景将会在数年后出现。容器管理和虚拟机技术有可能被集成到一起提供一个两全其美的方案；所以，位于libcontainer 容器后面的硬件信任锚微虚拟化实施例，可与前端 Docker 工具链和生态系统整合，而不同于后端使用的是能够提供更好绝缘性。微虚拟化（例如Bromium的[vSentry][15]和VMware的 [Project Fargo][16])已经在桌面环境中使用以提供应用程序之间基于硬件的隔离，所以类似的方法可以用于连接libcontainer代替Linux内核中的容器机制。

### ‘Dockerizing’ 应用程序 ###

几乎所有Linux应用程序都可以在Docker容器中运行。它们不受任何语言的选择或框架的限制。唯一在实践中受限的是从操作系统的角度来允许容器做什么。即使如此，bar可以在特权模式下通过运行容器，从而大大减少了控制（并相应地增加了容器中的应用程序，这将会导致损坏主机操作系统存在的风险）。


容器都是从镜像开始运行的，而镜像也可以从运行中的容器获取。通常使用2中方法从容器中获取应用程序，分别是手动获取和Dockerfile..

#### 手动构建 ####

手动构建首先通过基础操作系统镜像启动一个基本操作。交互式的终端可以安装应用程序和用于包管理的依赖项来选择所需要的Linux风格。Zef Hemel在‘[使用Linux容器来支持便携式应用程序部署][17]’的文章中讲述了他部署的过程。一旦应用程序被安装之后，容器可以被推送至注册中心（例如Docker Hub）或者导出一个tar文件。

#### Dockerfile ####

Dockerfile是一个用于构建Docker容器的脚本化系统。每一个Dockerfile定义了开始的基础镜像，从一系列的命令在容器中运行或者一些列的文件被添加到容器中。当容器启动时默认命令会在启动时被执行，Dockerfile也可以指定对外的端口和当前工作目录。容器类似手工构建一样可以通过可推送或导出的Dockerfiles来构建。Dockerfiles也可以被用于Docker Hub的自动构建系统，使用的镜像受Docker公司的控制并且该镜像源代码是任何人可视的。


####仅仅一个进程? ####

无论镜像是手动构建还是通过Dockerfile构建，有一个关键的考虑因素是当容器启动时，只有一个进程进程被启动。对于一个容器一对一服务的目的，例如运行一个应用服务器，运行一个单一的进程不是一个问题（有些关于容器应该只有一个单独的进程的争议）。对于一些容器需要启动多个进程的情况，必须先启动 [supervisor][18]进程，才能生成其它内部所需的进程。

### 容器和微服务 ###

一个完整的关于使用微服务结构体系的原理和好处已经远远超出了这篇文章（并已经覆盖了[InfoQ eMag: Microservices][19])的范围）.然而容器是微服务捆绑和部署实例的捷径。

尽管大多数实际案例表明大量的微服务目前还是大多数部署在虚拟机，容器相对拥有较小的部署机会。容器具备位操作系统共享内存和硬盘占用量的能力，库常见的应用程序代码也意味着并排部署多个办法的服务是非常高效的。

### 连接容器 ###

一些小的应用程序适合放在单独的容器中，但在许多案例中应用程序将遍布多个容器。Docker的成功包括催生了一连串的新应用程序组合工具、业务流程工具和实现平台作为服务(PaaS)过程。许多工具还帮助实现缩放、容错、业务管理以及对已部署资产进行版本控制。


#### 连接 ####

Docker的网络功能是相当原始的。在同一主机，容器内的服务和一互相访问，而且Docker也可以通过端口映射到主机操作系统使服务可以通过网络服务被调用。官方的赞助方式是连接到[libchan][20],这是一个提供给Go语言的网络服务库，类似于[channels][21]。直至libcan找到方法进入应用程序，第三方应用仍然有很大空间可提供配套的网络服务。例如，[Flocker][22]已经采取了基于代理的方法使服务实现跨主机（以及底层存储）移植。

#### 合成 ####

Docker本身拥有把容器连接在一起的机制，与元数据相关的依赖项可以被传递到相依赖的容器并用于环境变量和主机入口的消耗。应用合成工具例如[Fig][23]和[geard][24]展示出其依赖关系图在一个独立的文件中，于是多个容器可以汇聚成一个连贯的系统。世纪互联公司的[Panamax][25]合成工具类似底层Fig和 geard的方法，但新增了一些基于web的用户接口，并直接与GitHub相结合，以便于应用程序可以直接被共享。

#### 业务流程 ####

业务流程系统例如[Decking][26],New Relic公司的[Centurion][27]和谷歌公司的[Kubernetes][28]都是旨在帮助部署容器和管理其生命周期系统。也有无数的例子（例如[Apache Mesos][30](特别是[Marathon（马拉松式）持续运行很久的框架] 的 [Mesosphere][29]正在与Docker一起使用。通过为应用程序（例如传递CPU核数和内存的需求）与底层基础架构之间提供一个抽象的模型，业务流程工具提供了解耦，旨在简化应用程序开发和数据中心操作。还有各种各样的业务流程系统，因为人们已经淘汰了以前开发的内部系统，取而代之的是大量容器部署的管理系统；例如Kubernetes是基于谷歌的[Omega][32]系统，这个系统用于管理谷歌区域内的容器。

虽然从某种程度上来说合成工具和业务流程工具的功能存在重叠，另外这也是它们之间互补的一种方式。例如Fig可以被用于描述容器间如何实现功能交互，而Kubernetes pods可能用于提供监控和缩放。


#### 平台 (类似一个服务) ####

大量的Docker已经实现本地PaaS安装部署，例如[Deis][33] 和 [Flynn][34]的出现并在现实中得到利用，Linux容器在很大程度上为开发人员提供了灵活性（而不是“固执己见”地给出一组语言和框架）。其它平台例如CloudFoundry, OpenShift 和 Apcera Continuum都已经采取Docker基础功能融入其现有的系统，这样基于Docker镜像（或者基于Dockerfile）的应用程序也可以用之前支持的语言和框架一起部署和管理。

### 支持所有的云 ###

由于Docker能够在任何的Linux虚拟机中运行并合理地更新内核，它几乎可以为所有云提供IaaS服务。大多数的云厂商已经宣布对码头及其生态系统提供附加支持。

亚马逊已经把Docker引入它们的Elastic Beanstalk系统（这是在底层IaaS的一个业务流程系统）。谷歌已经启用‘managed VMs'’,这是提供
程序引擎PaaS和计算引擎IaaS之间的中转站。微软和IBM都已经宣布基于Kubernetes的服务，所以多容器应用程序可以在它们的云上被部署和管理。

为了给现有种类繁多的后端提供可用的一致接口，Docker团队已经引进[libswarm][35], 它能用于集成众多云和资源管理系统。Libswarm所阐明的目标之一是‘避免供应商通过交换任何服务锁定另一个’。这是通过呈现一组一致服务（与API相关联的）来完成的，该服务会附加执行特定的后端服务。例如装有Docker服务的服务器将对Docker命令行工具展示Docker远程API，这样容器就可以被托管在一些列的服务供应商。

基于Docker的新服务类型仍在起步阶段。总部位于伦敦的Orchard实验室提供了Docker的托管服务，但是Docker公司表示，收购后，Orchard的服务将不会是一个有优先事项。Docker公司也出售之前DotCloud的PaaS业务给cloudControl。基于就更早前的容器管理系统的服务例如[OpenVZ][36]已经司空见惯了，所以在一定程度上Docker需要向托管供应商证明其价值。

### Docker 及其发行版 ###

Docker已经成为大多数Linux发行版例如Ubuntu，Red Hat企业版（RHEL)和CentOS的一个标准功能。遗憾的是发布是以不同的移动速度到Docker项目，所以在发布版中找到的版本总是远远落后于可用版本。例如Ubuntu 14.04版本是对应Docker 0.9.1版本发布的，但是并没有相应的版本更改点当Ubuntu升级至14.04.1（这个时候Docker已经升至1.1.2版本）。由于Docker也是一个KDE系统托盘，所以在官方库同样存在命名问题；所以在Ubuntu14.04版本中相关安装包的名字和命令行工具都是使用‘Docker.io’命名。

在企业版的Linux世界中，情况也并没有因此而不同。CentOS7伴随着Docker 0.11.1的到来，该发行版本即是之前Docker公司宣布准备发行Docker 1.0版本的准备版。Linux发行版用户希望最新版本可以承诺其稳定性，性能和安全性能够更完善，并且更好地结合[安装说明][37]和使用Docker公司的库托管而不是采取包括其分布的版本库。

Docker的到来催生了新的Linux发行版本例如[CoreOS][38]和红帽被用于设计为运行容器最小环境的[Project Atomic][39]。这些发布版相比传统的发布版伴随着更多新内核和Docker版本的特性。它们对内存的使用和硬盘占用率更小。新的发行也配备了新的工具用于大型部署例如[fleet][40]，这是‘一个分布式init系统’和[etcd][41]是用于元数据管理。也有新机制用于更新发布版本身来使得内核和Docker可以被使用。这也意味着使用Docker的影响之一是它抛开分布版和相关的包管理解决方案的关注，使Linux内核（即Docker子系统正在使用）更加重要。

新的发布版将是运行Docker的最好方式，但是传统的发布版本和它们的包管理对容器来说仍然是非常重要的。Docker Hub托管的官方镜像有Debian，Ubuntu和CentOS。当然也有一个‘半官方’的库用于Fedora镜像。RHEL镜像在Docker Hub中不可用，因为是从Red Hat直接发布的。这意味着在Docker Hub的自动构建机制仅仅用于那些纯粹的开源发布版不（并愿意信任基于Docker公司团队所策划镜像的出处）。


虽然Docker Hub与源代码控制系统相结合，例如Git Hub和Bitbucket在构建过程中用于自动创建包管理及生成规范之间的复杂关系（在Dockerfile中），并在构建过程中建立镜像。在构建过程中的非确定性结果并非是Docker具体的问题——这个是由于软件包如何管理工作的结果。在构建完成的当天将会给出一个版本，这个构建完成的另外一次将会得到最新版本，这就是为什么软件包管理需要升级措施。容器的抽象（较少关注一个容器的内容）以及容器的分散（因为轻量级资源利用率）是更有可能与Docker获取关联的痛点。

###  Docker的未来 ###

Docker公司对核心功能（libcontainer），跨服务管理(libswarm) 和容器间的信息传递（libchan）的发展提出了明确的路线。与此同时公司已经表明愿意利用自身生态系统和收购Orchard实验室。然而Docker相比Docker公司意味着更多，随着项目的壮大，越来越多对这个项目的
大牌贡献者，其中不乏像谷歌、IBM和Red Hat这样的大公司。在仁慈独裁者CTO Solomon Hykes 掌舵的形势下，为公司和项目明确了技术领导的关系。在前18个月的项目中通过成果输出展现了快速行动的能力，而且这种趋势并没有减弱的迹象。

许多投资者正在寻找10年前VMware公司的ESX/vSphere平台的特征矩阵，并找出虚拟机的普及而驱动的企业预期和当前Docker生态系统两者的距离（和机会）。目前Docker生态系统正缺乏类似网络、存储和版本细粒度的管理（对容器的内容），这些都为初创企业和在职人员提供机会。

随着时间的推移，在虚拟机和容器（Docker的运行部分）之间的区别将变得不重要了，而关注点将会转移到‘构建’和‘交付’缓解。这些变化将会使‘Docker发生什么？’这个问题变得比‘Docker将会给IT产业带来什么？’更不重要了。


--------------------------------------------------------------------------------

via: http://www.infoq.com/articles/docker-future

作者：[Chris Swan][a]
译者：[disylee](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

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

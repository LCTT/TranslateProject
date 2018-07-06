Red Hat 的去 Docker 化容器实践
======

最近几年，开源项目 Docker (已更名为[Moby][1]) 在容器普及化方面建树颇多。然而，它的功能特性不断集中到一个单一、庞大的系统，该系统由具有 root 权限运行的守护进程 `dockerd` 管控，这引发了人们的焦虑。对这些焦虑的阐述，具有代表性的是 Red Hat 公司的容器团队负责人 Dan Walsh 在 [KubeCon + CloudNativecon][3] 会议中的[演讲][2]。Walsh 讲述了他的容器团队目前的工作方向，即使用一系列更小、可协同工作的组件替代 Docker。他的战斗口号是“拒绝臃肿的守护进程”，理由是与公认的 Unix 哲学相违背。

### Docker 模块化实践

就像我们在[早期文献][4]中看到的那样，容器的基础操作不复杂：你首先拉取一个容器镜像，利用该镜像创建一个容器，最后启动这个容器。除此之外，你要懂得如何构建镜像并推送至镜像仓库。大多数人在上述这些步骤中使用 Docker，但其实 Docker 并不是唯一的选择，目前的可替换选择是 `rkt`。rkt 引发了一系列标准的创建，包括运行时标准 CRI，镜像标准 OCI 及网络标准 CNI 等。遵守这些标准的后端，如 [CRI-O][5] 和 Docker，可以与 [Kubernetes][6] 为代表的管理软件协同工作。

这些标准促使 Red Hat 公司开发了一系列实现了部分标准的“核心应用”供 Kubernetes 使用，例如 CRI-O 运行时。但 Kubernetes 提供的功能不足以满足 Red Hat 公司的 [OpenShift][7] 项目所需。开发者可能需要构建容器并推送至镜像仓库，实现这些操作需要额外的一整套方案。

事实上，目前市面上已有多种构建容器的工具。来自 Sysdig 公司的 Michael Ducy 在[分会场][8]中回顾了 Docker 本身之外的 8 种镜像构建工具，而这也很可能不是全部。Ducy 将理想的构建工具定义如下：可以用可重现的方式创建最小化镜像。最小化镜像并不包含操作系统，只包含应用本身及其依赖。Ducy 认为 [Distroless][9], [Smith][10] 及 [Source-to-Image][11] 都是很好的工具，可用于构建最小化镜像。Ducy 将最小化镜像称为“微容器”。

<ruby>可重现镜像<rt>reproducible container</rt></ruby>是指构建多次结果保持不变的镜像。为达到这个目标，Ducy 表示应该使用“宣告式”而不是“命令式”的方式。考虑到 Ducy 来自 Chef 配置管理工具领域，你应该能理解他的意思。Ducy 给出了符合标准的几个不错的实现，包括 [Ansible 容器][12]、 [Habitat][13]、 [nixos-容器][14]和 [Simth][10] 等，但你需要了解这些项目对应的编程语言。Ducy 额外指出 Habitat 构建的容器自带管理功能，如果你已经使用了 systemd、 Docker 或 Kubernetes 等外部管理工具，Habitat 的管理功能可能是冗余的。除此之外，我们还要提到从 Docker 和 [Buildah][16] 项目诞生的新项目 [BuildKit][15]， 它是 Red Hat 公司 [Atomic 工程][17]的一个组件。

### 使用 Buildah 构建容器

![\[Buildah logo\]][18] 

Buildah 名称显然来自于 Walsh 风趣的 [波士顿口音][19]； 该工具的品牌宣传中充满了波士顿风格，例如 logo 使用了波士顿梗犬（如图所示）。该项目的实现思路与 Ducy 不同：为了构建容器，与其被迫使用宣告式配置管理的方案，不如构建一些简单工具，结合你最喜欢的配置管理工具使用。这样你可以如愿的使用命令行，例如使用 `cp` 命令代替 Docker 的自定义指令 `COPY` 。除此之外，你可以使用如下工具为容器提供内容：1) 配置管理工具，例如Ansible 或 Puppet；2) 操作系统相关或编程语言相关的安装工具，例如 APT 和 pip； 3) 其它系统。下面展示了基于通用 shell 命令的容器构建场景，其中只需要使用 `make` 命令即可为容器安装可执行文件。

```
# 拉取基础镜像, 类似 Dockerfile 中的 FROM 命令
buildah from redhat

# 挂载基础镜像, 在其基础上工作
crt=$(buildah mount)
ap foo $crt
make install DESTDIR=$crt

# 下一步，生成快照
buildah commit
```

有趣的是，基于这个思路，你可以复用主机环境中的构建工具，无需在镜像中安装这些依赖，故可以构建非常微小的镜像。通常情况下，构建容器镜像时需要在容器中安装目标应用的构建依赖。例如，从源码构建需要容器中有编译器工具链，这是因为构建并不在主机环境进行。大量的容器也包含了 `ps` 和 `bash` 这样的 Unix 命令，对微容器而言其实是多余的。开发者经常忘记或无法从构建好的容器中移除一些依赖，增加了不必要的开销和攻击面。

Buildah 的模块化方案能够以非 root 方式进行部分构建；但`mount` 命令仍然需要 `CAP_SYS_ADMIN`，有一个 [工单][20] 试图解决该问题。但 Buildah 与 Docker [都有][21]同样的[限制][22]，即无法在容器内构建容器。对于 Docker，你需要使用“特权”模式运行容器，一些特殊的环境很难满足这个条件，例如 [GitLab 持续集成][23]；即使满足该条件，配置也特别[繁琐][24]。

手动提交的步骤可以对创建容器快照的时间节点进行细粒度控制。Dockerfile 每一行都会创建一个新的快照；相比而言，Buildah 的提交检查点都是事先选择好的，这可以减少不必要的快照并节省磁盘空间。这也有利于隔离私钥或密码等敏感信息，避免其出现在公共镜像中。

Docker 构建的镜像是非标准的、仅供其自身使用；相比而言，Buildah 提供[多种输出格式][25]，其中包括符合 OCI 标准的镜像。为向后兼容，Buildah 提供了一个“使用 Dockerfile 构建”的命令，即 [`buildah bud`][26]， 它可以解析标准的 Dockerfile。Buildah 提供 `enter` 命令直接查看镜像内部信息，`run` 命令启动一个容器。实现这些功能仅使用了 `runc` 在内的标准工具，无需在后台运行一个“臃肿的守护进程”。

Ducy 对 Buildah 表示质疑，认为采用非宣告性不利于可重现性。如果允许使用 shell 命令，可能产生很多预想不到的情况；例如，一个 shell 脚本下载了任意的可执行程序，但后续无法追溯文件的来源。shell 命令的执行受环境变量影响，执行结果可能大相径庭。与基于 shell 的工具相比，Puppet 或 Chef 这样的配置管理系统在理论上更加可靠，因为它们的设计初衷就是收敛于最终配置；事实上，可以通过配置管理系统调用 shell 命令。但 Walsh 对此提出反驳，认为已有的配置管理工具可以在 Buildah 的基础上工作，用户可以选择是否使用配置管理；这样更加符合“机制与策略分离”的经典 Unix 哲学。

目前 Buildah 处于测试阶段，Red Hat 公司正努力将其集成到 OpenShift。我写这篇文章时已经测试过 Buildah，它缺少一些文档，但基本可以稳定运行。尽管在错误处理方面仍有待提高，但它确实是一款值得你关注的容器工具。

### 替换其它 Docker 命令行

Walsh 在其演讲中还简单介绍了 Red hat 公司 正在开发的另一个暂时叫做 [libpod][24] 的项目。项目名称来源于 Kubernetes 中的 “pod”， 在 Kubernetes 中 “pod” 用于分组主机内的容器，分享名字空间等。

Libpod 提供 `kpod` 命令，用于直接检查和操作容器存储。Walsh 分析了该命令发挥作用的场景，例如 `dockerd` 停止响应或 Kubernetes 集群崩溃。基本上，`kpod` 独立地再次实现了 `docker` 命令行工具。`kpod ps` 返回运行中的容器列表，`kpod images` 返回镜像列表。事实上，[命令转换速查手册][28] 中给出了每一条 Docker 命令对应的 `kpod` 命令。

这种模块化实现的一个好处是，当你使用 `kpod run` 运行容器时，容器直接作为当前 shell 而不是 `dockerd` 的子进程启动。理论上，可以直接使用 systemd 启动容器，这样可以消除 `dockerd` 引入的冗余。这让[由套接字激活的容器][29]成为可能，但暂时基于 Docker 实现该特性[并不容易][30]，[即使借助 Kubernetes][31] 也是如此。但我在测试过程中发现，使用 `kpod` 启动的容器有一些基础功能性缺失，具体而言是网络功能（!），相关实现在[活跃开发][32]过程中。

我们最后提到的命令是 `push`。虽然上述命令已经足以满足本地使用容器的需求，但没有提到远程仓库，借助远程仓库开发者可以活跃地进行应用打包协作。仓库也是持续部署框架的核心组件。[skopeo][33] 项目用于填补这个空白，它是另一个 Atomic 成员项目，按其 `README` 文件描述，“包含容器镜像及镜像库的多种操作”。该项目的设计初衷是，在不用类似 `docker pull` 那样实际去下载可能体积庞大的镜像的前提下，检查容器镜像的内容。Docker [拒绝加入][34] 检查功能，建议通过一个额外的工具实现该功能，这促成了 Skopeo 项目。除了 `pull`、`push`，Skopeo 现在还可以完成很多其它操作，例如在，不产生本地副本的情况下将镜像在不同的仓库中复制和转换。由于部分功能比较基础，可供其它项目使用，目前很大一部分 Skopeo 代码位于一个叫做 [containers/image][35] 的基础库。[Pivotal][36]、 Google 的 [container-diff][37] 、`kpod push` 及 `buildah push` 都使用了该库。

`kpod` 与 Kubernetes 并没有紧密的联系，故未来可能会更换名称（事实上，在本文刊发过程中，已经更名为 [`podman`][38]），毕竟 Red Hat 法务部门还没有明确其名称。该团队希望实现更多 pod 级别的命令，这样可以对多个容器进行操作，有点类似于 [`docker compose`][39] 实现的功能。但在这方面，[Kompose][40] 是更好的工具，可以通过 [复合 YAML 文件][41] 在 Kubernetes 集群中运行容器。按计划，我们不会实现类似于 [`swarm`] 的 Docker 命令，这部分功能最好由 Kubernetes 本身完成。

目前看来，已经持续数年的 Docker 模块化努力终将硕果累累。但目前 `kpod` 处于快速迭代过程中，不太适合用于生产环境，不过那些工具的与众不同的设计理念让人很感兴趣，而且其中大部分的工具已经可以用于开发环境。目前只能通过编译源码的方式安装 libpod，但最终会提供各个发行版的二进制包。

> 本文[最初发表][43]于 [Linux Weekly News][44]。

--------------------------------------------------------------------------------

via: https://anarc.at/blog/2017-12-20-docker-without-docker/

作者：[Anarcat][a]
译者：[pinewall](https://github.com/pinewall)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://anarc.at
[1]:https://mobyproject.org/
[2]:https://kccncna17.sched.com/event/CU8j/cri-o-hosted-by-daniel-walsh-red-hat
[3]:http://events.linuxfoundation.org/events/kubecon-and-cloudnativecon-north-america
[4]:https://lwn.net/Articles/741897/
[5]:http://cri-o.io/
[6]:https://kubernetes.io/
[7]:https://www.openshift.com/
[8]:https://kccncna17.sched.com/event/CU6B/building-better-containers-a-survey-of-container-build-tools-i-michael-ducy-chef
[9]:https://github.com/GoogleCloudPlatform/distroless
[10]:https://github.com/oracle/smith
[11]:https://github.com/openshift/source-to-image
[12]:https://www.ansible.com/ansible-container
[13]:https://www.habitat.sh/
[14]:https://nixos.org/nixos/manual/#ch-containers
[15]:https://github.com/moby/buildkit
[16]:https://github.com/projectatomic/buildah
[17]:https://www.projectatomic.io/
[18]:https://raw.githubusercontent.com/projectatomic/buildah/master/logos/buildah-logomark_large.png (Buildah logo)
[19]:https://en.wikipedia.org/wiki/Boston_accent
[20]:https://github.com/projectatomic/buildah/issues/171
[21]:https://github.com/projectatomic/buildah/issues/158
[22]:https://github.com/moby/moby/issues/27886#issuecomment-281278525
[23]:https://about.gitlab.com/features/gitlab-ci-cd/
[24]:https://jpetazzo.github.io/2015/09/03/do-not-use-docker-in-docker-for-ci/
[25]:https://github.com/projectatomic/buildah/blob/master/docs/buildah-push.md
[26]:https://github.com/projectatomic/buildah/blob/master/docs/buildah-bud.md
[27]:https://github.com/projectatomic/libpod
[28]:https://github.com/projectatomic/libpod/blob/master/transfer.md#development-transfer
[29]:http://0pointer.de/blog/projects/socket-activated-containers.html
[30]:https://legacy-developer.atlassian.com/blog/2015/03/docker-systemd-socket-activation/
[31]:https://github.com/kubernetes/kubernetes/issues/484
[32]:https://github.com/projectatomic/libpod/issues/129
[33]:https://github.com/projectatomic/skopeo
[34]:https://github.com/moby/moby/pull/14258
[35]:https://github.com/containers/image
[36]:https://pivotal.io/
[37]:https://github.com/GoogleCloudPlatform/container-diff
[38]:https://github.com/projectatomic/libpod/blob/master/docs/podman.1.md
[39]:https://docs.docker.com/compose/overview/#compose-documentation
[40]:http://kompose.io/
[41]:https://docs.docker.com/compose/compose-file/
[42]:https://docs.docker.com/engine/swarm/
[43]:https://lwn.net/Articles/741841/
[44]:http://lwn.net/

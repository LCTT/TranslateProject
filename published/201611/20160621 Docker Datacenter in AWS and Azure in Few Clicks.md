 轻轻几个点击，在 AWS 和 Azure 上搭建 Docker 数据中心
===================================================

通过几个点击即可在 “AWS 快速起步”和“Azure 市场”上高效搭建产品级 Docker 数据中心。

通过 AWS 快速起步的 CloudFormation 模板和在 Azure 市场上的预编译模板来部署 Docker 数据中心使得比以往在公有云基础设施下的部署企业级的 CaaS Docker 环境更加容易。

Docker 数据中心 CaaS 平台为各种规模的企业的敏捷应用部署提供了容器和集群的编排和管理，使之更简单、安全和可伸缩。使用新为 Docker 数据中心预编译的云模板，开发者和 IT 运维人员可以无缝的把容器化的应用迁移到亚马逊 EC2 或者微软的 Azure 环境而无需修改任何代码。现在，企业可以快速实现更高的计算和运营效率，可以通过短短几步操作实现支持 Docker 的容器管理和编排。

### 什么是 Docker 数据中心？

Docker 数据中心包括了 Docker 通用控制面板（Docker Universal Control Plane）（UCP），Docker 可信注册库（ Docker Trusted Registry）（UTR）和商用版 Docker 引擎（CS Docker Engine），并带有与客户的应用服务等级协议相匹配的商业支持服务。

- Docker 通用控制面板（UCP），一种企业级的集群管理方案，帮助客户通过单个管理面板管理整个集群
- Docker 可信注册库（DTR）， 一种镜像存储管理方案，帮助客户安全存储和管理 Docker 镜像
- 商用版的 Docker 引擎

![](http://img.scoop.it/lVraAJgJbjAKqfWCLtLuZLnTzqrqzN7Y9aBZTaXoQ8Q=)

### 在 AWS 上快速布置 Docker 数据中心

秉承 Docker 与 AWS 最佳实践，参照 AWS 快速起步教程来，你可以在 AWS 云上快速部署 Docker 容器。Docker 数据中心快速起步基于模块化和可定制的 CloudFormation 模板，客户可以在其之上增加额外功能或者为自己的 Docker 部署修改模板。

- [AWS 的 Docker 数据中心应用说明](https://youtu.be/aUx7ZdFSkXU)

#### 架构

![](http://img.scoop.it/sZ3_TxLba42QB-r_6vuApLnTzqrqzN7Y9aBZTaXoQ8Q=)

AWS Cloudformation 的安装过程始于创建 AWS 资源，这些 AWS 需要的资源包括：VPC、安全组、公有与私有子网、因特网网关、NAT 网关与 S3 bucket。

然后，AWS Cloudformation 启动第一个 UCP 控制器实例，紧接着，安装 Docker 引擎和 UCP 容器。它把第一个 UCP 控制器创建的根证书备份到 S3。一旦第一个 UCP 控制器成功运行，其他 UCP 控制器、UCP 集群节点和第一个 DTR 复制的进程就会被触发。和第一个 UCP 控制器节点类似，其他所有节点创建进程也都由商用版 Docker 引擎开始，然后安装并运行 UCP 和 DTR 容器以加入集群。两个弹性负载均衡器（ELB），一个分配给 UCP，另外一个为 DTR 服务，它们启动并自动完成配置来在两个可用区（AZ）之间提供弹性负载均衡。

除这些之外，如有需要，UCP 控制器和节点在 ASG 中启动并提供扩展功能。这种架构确保 UCP 和 DTR 两者都部署在两个 AZ 上以增强弹性与高可靠性。在公有或者私有 HostedZone 上，Route53 用来动态注册或者配置 UCP 和 DTR。

![](http://img.scoop.it/HM7Ag6RFvMXvZ_iBxRgKo7nTzqrqzN7Y9aBZTaXoQ8Q=)

#### 快速起步模板的核心功能如下：

- 创建 VPC、不同 AZ 上的私有和公有子网、ELB、NAT 网关、因特网网关、自动伸缩组，它们全部基于 AWS 最佳实践
- 为 DDC 创建一个 S3 bucket，其用于证书备份和 DTR 映像存储（DTR 需要额外配置）
- 在客户的 VPC 范畴，跨多 AZ 部署 3 个 UCP 控制器
- 创建预配置正常检测的 UCP ELB
- 创建一个 DNS 记录并关联到 UCP ELB
- 创建可伸缩的 UCP 节点集群
- 在 VPC 范畴内，跨多 AZ 创建 3 个 DTR 副本
- 创建一个预配置正常检测的 DTR
- 创建一个 DNS 记录，并关联到 DTR ELB

- [下载 AWS 快速指南](https://s3.amazonaws.com/quickstart-reference/docker/latest/doc/docker-datacenter-on-the-aws-cloud.pdf)


### 在 AWS 使用 Docker 数据中心

1. 登录 [Docker Store][1] 获取 [30 天免费试用][2]或者[联系销售][4]
2. 确认之后，看到提示“Launch Stack”后，客户会被重定向到 AWS Cloudformation 入口
3. 确认启动 Docker 的 AWS 区域
4. 提供启动参数
5. 确认并启动
6. 启动完成之后，点击输出标签可以看到 UCP/DTR 的 URL、缺省用户名、密码和 S3 bucket 的名称

- [Docker 数据中心需要 2000 美刀信用担保](https://aws.amazon.com/mp/contactdocker/)

### 在 Azure 使用 Azure 市场的预编译模板部署

在 Azure 市场上，Docker 数据中心是一个预先编译的模板，客户可以在 Azure 横跨全球的数据中心即起即用。客户可以根据自己需求从 Azure 提供的各种 VM 中选择适合自己的 VM 部署 Docker 数据中心。

#### 架构 

![](http://img.scoop.it/V9SpuBCoAnUnkRL3J-FRFLnTzqrqzN7Y9aBZTaXoQ8Q=)

Azure 部署过程始于输入一些基本用户信息，如 ssh 登录的管理员用户名（系统级管理员）和资源组名称。你可以把资源组理解为一组有生命周期和部署边界的资源集合。你可以在这个链接了解更多关于资源组的信息： http://azure.microsoft.com/en-us/documentation/articles/resource-group-overview/ 。

下一步，输入集群详细信息，包括：UCP 控制器 VM 大小、控制器个数（缺省为 3 个）、UCP 节点 VM 大小、UCP 节点个数（缺省 1，最大值为 10）、DTR 节点 VM 大小、DTR 节点个数、虚拟网络名和地址（例如：10.0.0.1/19）。关于网络，客户可以配置 2 个子网：第一个子网分配给 UCP 控制器 ，第二个分配给 DTC 和 UCP 节点。

最后，点击 OK 完成部署。对于小集群，服务开通需要大约 15-19 分钟，大集群更久些。

![](http://img.scoop.it/DXPM5-GXP0j2kEhno0kdRLnTzqrqzN7Y9aBZTaXoQ8Q=)

![](http://img.scoop.it/321ElkCf6rqb7u_-nlGPtrnTzqrqzN7Y9aBZTaXoQ8Q=)

#### 如何在 Azure 部署

1. 注册 [Docker 数据中心 30 天试用][5]许可或者[联系销售][6]
2. [跳转到微软 Azure 市场的 Docker 数据中心][7]
3. [查看部署文档][8]


---

通过注册获取 Docker 数据中心许可证开始，然后你就能够通过 AWS 或者 Azure 模板搭建自己的数据中心。

- [获取 30 天试用许可证][9]
- [通过视频理解 Docker 数据中心架构][10]
- [观看演示视频][11]
- [获取 AWS 提供的部署 Docker 数据中心的 75 美元红包奖励][12]

了解有关 Docker 的更多信息：

- 初识 Docker? 尝试一下 10 分钟[在线学习课程][20]
- 分享镜像，自动构建，或用一个[免费的 Docker Hub 账号][21]尝试更多
- 阅读 [Docker 1.12 发行说明][22]
- 订阅 [Docker Weekly][23]
- 报名参加即将到来的 [Docker Online Meetups][24]
- 参加即将发生的 [Docker Meetups][25]
- 观看 [DockerCon EU2015][26]视频
- 开始为 [Docker][27] 贡献力量


--------------------------------------------------------------------------------

via: https://blog.docker.com/2016/06/docker-datacenter-aws-azure-cloud/

作者：[Trisha McCanna][a]
译者：[firstadream](https://github.com/firstadream)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://blog.docker.com/author/trisha/
[1]: https://store.docker.com/login?next=%2Fbundles%2Fdocker-datacenter%2Fpurchase?plan=free-trial
[2]: https://store.docker.com/login?next=%2Fbundles%2Fdocker-datacenter%2Fpurchase?plan=free-trial
[4]: https://goto.docker.com/contact-us.html
[5]: https://store.docker.com/login?next=%2Fbundles%2Fdocker-datacenter%2Fpurchase?plan=free-trial
[6]: https://goto.docker.com/contact-us.html
[7]: https://azure.microsoft.com/en-us/marketplace/partners/docker/dockerdatacenterdocker-datacenter/
[8]: https://success.docker.com/Datacenter/Apply/Docker_Datacenter_on_Azure
[9]: http://www.docker.com/trial
[10]: https://www.youtube.com/playlist?list=PLkA60AVN3hh8tFH7xzI5Y-vP48wUiuXfH
[11]: https://www.youtube.com/playlist?list=PLkA60AVN3hh8a8JaIOA5Q757KiqEjPKWr
[12]: https://aws.amazon.com/quickstart/promo/
[20]: https://docs.docker.com/engine/understanding-docker/ 
[21]: https://hub.docker.com/
[22]: https://docs.docker.com/release-notes/
[23]: https://www.docker.com/subscribe_newsletter/
[24]: http://www.meetup.com/Docker-Online-Meetup/
[25]: https://www.docker.com/community/meetup-groups
[26]: https://www.youtube.com/playlist?list=PLkA60AVN3hh87OoVra6MHf2L4UR9xwJkv
[27]: https://docs.docker.com/contributing/contributing/


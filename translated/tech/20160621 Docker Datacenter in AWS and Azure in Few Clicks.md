
聊聊Docker Datacenter在AWS和AZURE上的应用
===================================================


三言两语介绍一下AWS快速启动应用和Azure Marketplace上产品化和高可用性的Docker部署模板。

Docker Datacenter AWS快速启动应用使用CloudFormation模板和AZure Marketpalce上预编译的模板来简化企业CaaS Docker环境在公有云基础设施下的部署。


为敏捷应用而生的CasS平台，为各种规模企业提供容器、集群编排和管理等各种简单、安全和可伸缩的服务。使用为Docker Datacenter预编译的崭新的云模板，开发者和IT运维人员可以无缝的把它们的应用迁移到亚马逊EC2或者微软的Azure环境而无需修改任何代码。现在，企业可以快速实现更高的计算和运营效率，Docker可以通过短短几步操作支持容器管理和编排。

### 什么是Docker Datacenter ?


Docker Datacenter包括Docker通用控制平面，Docker可信注册表和与客户的应用服务等级协议相匹配的商用CS Docker引擎。


-  Docker通用控制平面(UCP)，一种企业级的集群管理方案，帮助客户通过单个管理仪表盘管理整个集群
-  Docker可信注册表（DTR）， 一种映像管理方案，帮助客户安全存储和管理Docker映像
- 商用版的Docker引擎

![](http://img.scoop.it/lVraAJgJbjAKqfWCLtLuZLnTzqrqzN7Y9aBZTaXoQ8Q=)

### 在AWS上快速布置Docker Datacenter

秉承Docker与AWS最佳实践，参照AWS快速启动教程，你可以在AWS云上快速部署Docker容器。Docker Datacenter快速应用基于模块化和可定制的CloudFormation模板，客户可以在其之上增加额外功能或者为自己的Docker部署修改模板。

[AWS的Docker Datacenter应用说明](https://youtu.be/aUx7ZdFSkXU)

#### 架构

![](http://img.scoop.it/sZ3_TxLba42QB-r_6vuApLnTzqrqzN7Y9aBZTaXoQ8Q=)

AWS Cloudformation通过创建AWS资源开始安装进程，这些AWS需要的资源包括：VPC, 安全组，公有与私有子网，因特网网关，NAT网关与S3 bucket。

然后，AWS Cloudformation启动第一个UCP控制器实例，紧接着，安装Docker引擎和UCP容器。它把UCP控制器创建的根证书备份到S3。一旦第一个UCP控制器成功运行，其他UCP控制器，UCP集群结点和第一个DTR复制进程就会被触发。和第一个UCP控制器结点类似，其他所有结点创建进程也都由商业版的Docker引擎开始，然后安装并运行UCP和DTR容器以加入集群。两个弹性负载均衡器（ELB），一个分配给UCP，另外一个为DTR服务，它们启动、自动完成配置并在两个可用区（Availability Zone）之间提供弹性负载均衡。

除些之外，如有需要，UCP控制器和结点在ASG中启动并提供扩展功能。这种架构确保UCP和DTR两者都部署在两个AZ上以增强弹性与高可靠性。在公有或者私有HostedZone，Route53用来动态注册或者配置UCP和DTR 。

![](http://img.scoop.it/HM7Ag6RFvMXvZ_iBxRgKo7nTzqrqzN7Y9aBZTaXoQ8Q=)

### 快速启动模板的核心功能如下：


- 创建VPC，不同AZ上的私有和公有子网，ELB，NAT网关，因特网网关，自动伸缩组，它们全部基于AWS最佳实践
- 为DDC创建一个S3 bucket，其应用于证书备份和DTR映像存储（DTR需要额外配置）
- 在客户的VPC范畴，跨多AZ部署3个UCP控制器
- 创建预配置正常检测的UCP ELB
- 创建一个DNS记录并关联到UCP ELB
- 创建可伸缩的UCP结点集群
- 在VPC范畴内，跨多AZ创建3个DTR副本
- 创建一个预配置正常检测的DTR
- 创建一个DNS记录，并关联到DTR ELB

[下载AWS快速指南](https://s3.amazonaws.com/quickstart-reference/docker/latest/doc/docker-datacenter-on-the-aws-cloud.pdf)


### 在AWS使用Docker Datacenter

1. 登录[Docker Store][1]获取[30天免费试用][2]或者[联系销售][4]
2. 确认之后，提示“Launch Stack”，客户会被重定向到AWS Cloudformation入口
3. 确认启动Docker的AWS区域
4. 提供启动参数
5. 确认并启动
6. 启动完成之后，点击输出分页标签可以看到UCP/DTR的 URL、缺省用户名、密码和S3 bucket的名称

[Docker Datacenter需要2000美刀信用担保](https://aws.amazon.com/mp/contactdocker/)


### 在Azure使用Azure Marketplace上预编译的模板部署

在Azure Marketplace上，Docker Datacenter是一个预先编译的模板，客户可以在Azure全球不同的数据中心即起即用。客户可以根据自己需求从Azure提供的各种VM中选择部署适合自己的Docker Datacenter。


#### 架构 
![](http://img.scoop.it/V9SpuBCoAnUnkRL3J-FRFLnTzqrqzN7Y9aBZTaXoQ8Q=)


Azure部署进程开始于输入一些基本用户信息，如ssh-ing管理员用户名（系统级管理员）和资源组名称。你可以把资源组理解为一组有生命周期和部署边界的资源集合。你可以在这个链接了解更多关于资源组的信息：[azure.microsoft.com/en-us/documentation/articles/resource-group-overview/](azure.microsoft.com/en-us/documentation/articles/resource-group-overview/)

下一步，输入集群详细信息，包括：UCP控制器VM大小，控制器个数（缺省为3个），UCP结点VM大小，UCP结点个数（缺省1，最大值为10），DTR结点VM大小，DTR结点个数，虚拟网络名和地址（例如：10.0.0.1/19）。关于网络，客户可以配置2个子网：第一个子网分配给UCP控制器 ，第二个分配给DTC和UCP结点。

最后，点击OK完成部署。对于小集群，服务开通需要大约15-19分钟，大集群更久些。

![](http://img.scoop.it/DXPM5-GXP0j2kEhno0kdRLnTzqrqzN7Y9aBZTaXoQ8Q=)

![](http://img.scoop.it/321ElkCf6rqb7u_-nlGPtrnTzqrqzN7Y9aBZTaXoQ8Q=)

#### 如何在Azure部署


1. 注册[Docker Datacenter30天试用][5]许可或者[联系销售][6]
2. [跳转到微软Azure Markplace的Docker Datacenter][7]
3. [评审部署文档][8]

如果客户注册获取Docker Datacenter许可证，那么他们将授权启动AWS或者Azure模板.
- [获取30天试用许可证][9]
- [通过视频理解Docker Datacenter架构][10]
- [观看演示视频][11]
- [获取AWS提供的部署Docker Datacenter的75美元红包奖励][12]

### 了解有关Docker的更多信息
- 初识Docker? 尝试一下10分钟[在线学习课程][20]
- 分享映像，自动构建，或用一个[免费的Docker Hub账号][21]尝试更多
- 阅读[Docker 1.12 发行说明][22]
- 订阅[Docker Weekly][23]
- 报名参加即将到来的[Docker Online Meetups][24]
- 参加即将发生的[Docker Meetups][25]
- 观看[DockerCon EU2015][26]视频
- 开始为[Docker][27]贡献力量



--------------------------------------------------------------------------------

via: https://blog.docker.com/2016/06/docker-datacenter-aws-azure-cloud/

作者：[Trisha McCanna][a]
译者：[firstadream](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

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


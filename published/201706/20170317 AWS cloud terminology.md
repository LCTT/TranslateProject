AWS 云服务清单
============================================================


 ![AWS Cloud terminology](http://cdn2.kerneltalks.com/wp-content/uploads/2017/03/AWS-Cloud-terminology-150x150.png) 

_认识 71 个 AWS 云服务的术语 ! 通过了解 AWS 世界中使用的术语开始你的 AWS 云服务使用生涯 !_ 


AWS，即<ruby>亚马逊 Web 服务<rt>Amazon Web Services</rt></ruby>，是一个提供了一系列按使用计费的 web 服务的云平台。 它是迄今为止最为著名的云平台之一。由于其灵活性、有效性、弹性、可测量性和无须维护，所以有一些企业正逐步把他们的业务迁移到云端。 由于许多公司目前在使用这些服务，所以对于系统管理员和运维人员来说应该了解一下 AWS。

这篇文章旨在列出这些 AWS 提供的服务并且解释在 AWS 中出现的术语。

截止到目前为止（2017 年 3 月），AWS 提供了分为 17 组的共计 71 种服务：


### 计算型服务

这是一个提供了虚拟服务器配置功能的服务，即所谓的云计算。它提供了包括以下这一系列的服务。

1.  EC2：EC2 代表弹性计算云。这种服务提供了可根据个人需求扩展的 [虚拟机][11]。
2.  EC2 容器服务：其高性能，高可扩展性使其可在 EC2 集群环境中运行服务。
3.  Lightsail：该服务使用户非常容易地启动和管理虚拟服务器（EC2）。
4.  Elastic Beanstalk：该服务能够自动管理你的应用程序的容量配置、负载平衡、扩展以及健康监控从而减少你的管理压力。
5.  Lambda：它允许你只在你需要的时候运行代码而不用去管理服务器。
6.  Batch：它使用户能够以自定义的管理方式运行计算工作负载（批处理）。

### 存储型服务

它是一种云存储服务，即由 Amazon 提供的云存储设施。 该组服务包括：

1.  S3：S3 代表简单存储服务（3 个 S）。 它给你提供了在线存储服务，你可随时从任何地方存储/检索任何数据。
2.  EFS：EFS 代表弹性文件系统。 它是一个可以和 EC2 服务器一起使用的在线存储服务。
3.  Glacier：它是一种低成本/低性能数据存储解决方案，主要针对存档或长期备份。
4.  Storage Gateway：这种服务的接口会将你的内部应用程序（托管在 AWS 之外）与 AWS 存储连接。

### 数据库

AWS 还提供在其基础设施上托管数据库，以便客户可以利用亚马逊最先进的技术来获得更快/高效/安全的数据处理。 该组包括：

1.  RDS：RDS 代表关系数据库服务。 用于在云上设置，操作和管理关系数据库。
2.  DynamoDB：其 NoSQL 数据库提供了快速处理和高可扩展性。
3.  ElastiCache：这是一种为你的 Web 应用程序管理内存缓存以便更快运行它们的方案 ！
4.  Redshift：它是一个巨大的（PB 级）的完全可升级的云端数据仓库服务。

### 网络 & 内容分发

由于 AWS 提供云端的 EC2 服务器，因此网络相关内容也将在出现在这里。 内容分发用于向位于最近位置的用户提供文件。 现如今有许多非常有名的加速网站。

1.  VPC：VPC 代表虚拟私有云。 它是你自己的虚拟网络，是你的专用 AWS 帐户。
2.  CloudFront：这是 AWS 的内容分发网络（CDN）服务。
3.  Direct Connect：它是将数据中心/场所与 AWS 连接起来的网络方式，以提高吞吐量，降低网络成本，并避免由于基于互联网的连接而导致的连接问题。
4.  Route 53：它是一个云端的域名系统的 DNS Web 服务。

### 迁移

它提供了一系列服务来帮助你实现本地服务到 AWS 的迁移工作。 这包括 ：

1.  Application Discovery Service：专门用于分析您的服务器、网络、应用程序以帮助/加速迁移的服务。
2.  DMS：DMS 指的是数据库迁移服务。 它用于将数据从本地数据库迁移到 EC2 上托管的 RDS 或 DB。
3.  Server Migration：也称为 SMS（服务器迁移服务）是一种无代理服务，将您的工作负载从本地移动到 AWS。
4.  Snowball： 当你想要使用物理存储设备（而不是基于互联网/基于网络的传输）将大量数据传入/迁出 AWS 时，你应该使用它。

### 开发者工具

顾名思义, 这是一系列帮助开发者简化在云端编码的服务。

1.  CodeCommit：它是一个安全的、可扩展的、可管理的源代码管理服务，用于托管代码仓库。
2.  CodeBuild：这是一个云端的代码生成器。主要用于执行、测试代码和构建部署软件包。
3.  CodeDeploy：这是一个可在 AWS 服务器或本地进行自动化应用程序部署的部署服务。
4.  CodePipeline：这个部署服务可以使编码人员可以在发布之前将其应用程序可视化。
5.  X-Ray：它可以使用事件调用分析应用程序。

### 管理工具

这是一组可帮助你管理 AWS 上的 Web 服务的服务。

1.  CloudWatch：监控你的 AWS 资源或应用程序的监控服务。
2.  CloudFormation：基础设施即代码！以集体有序的方式管理 AWS 架构的方式。
3.  CloudTrail：AWS 帐户的审计和合规工具。
4.  Config : AWS 的资源清单、配置历史记录和配置更改通知，以实现安全性和治理。
5.  OpsWorks：它可以自动化地配置，部署 EC2 或内部部署计算。
6.  Service Catalog：创建和管理被批准在你/公司帐户中使用的 IT 服务目录。
7.  Trusted Advisor：它的 AWS AI 可以通过审查你的 AWS 基础设施使你的 AWS 基础设施更好，更省钱。 
8.  Managed Service：提供持续的基础设施管理。


### 安全性、身份和合规

这是一组很重要的 AWS 服务以确保你的 AWS 空间的安全性。

1.  IAM：IAM 即身份和访问管理，控制用户访问你的 AWS 资源和服务。
2.  Inspector：自动安全评估可帮助你在 AWS 上的应用安全和合规。
3.  Certificate Manager：为 AWS 应用程序提供，管理和部署 SSL / TLS 证书。
4.  Directory Service：相当于 AWS 的 Microsoft Active Directory。
5.  WAF & Shield：WAF 即 Web 应用防火墙。 监控和控制对 CloudFront 或负载均衡器上的内容的访问。
6.  Compliance Reports：AWS 基础设施空间的合规报告，以确保您的应用程序符合您的策略。

### 数据分析

AWS 空间的数据分析服务，以帮助您查看、计划和对帐户中的事件采取行动。

1.  Athena：它是一个基于 SQL 查询的服务，用于分析 S3 存储的数据。
2.  EMR：EMR 的全写是 Elastic Map Reduce。 是一个主要用于大数据处理和分析的服务。
3.  CloudSearch：AWS 在应用和服务中的搜索功能。
4.  Elasticsearch Service：它可以创建一个域并在 AWS Cloud 中部署、操作和扩展 Elasticsearch 集群。
5.  Kinesis：这种服务可以实现实时的大量流数据处理。
6.  Data Pipeline：它可以帮助我们在不同的 AWS 服务之间实现数据迁移。
7.  QuickSight：收集、分析和呈现 AWS 的业务数据。

### 人工智能 

AWS 的 AI!

1.  Lex：它可以帮助我们在一些使用语音和文本的应用中构建会话界面。
2.  Polly：这是一个提供文字到语音转换的服务。
3.  Rekognition：使您能够将图像分析添加到应用程序。
4.  Machine Learning：它具有学习数据中的模式的算法。

### 物联网

这个服务保证了 AWS 在不同设备上的高可用性。

1.  AWS IoT：它使联网硬件设备与 AWS 的应用程序能够交互。

### 游戏开发 

顾名思义，这个服务旨在游戏开发。

1.  Amazon GameLift：该服务旨在部署、管理用于会话的多人游戏的专用游戏服务器。

### 移动服务 

这是一组主要针对手持设备的服务。

1.  Mobile Hub：帮助您创建移动应用的后台功能并将其集成到移动应用。
2.  Cognito：在连接了互联网设备上控制移动用户的身份验证和 AWS 的访问。
3.  Device Farm：移动应用测试服务使你可以在 Android 上托管的真实手机上跨 Android、iOS 测试应用。
4.  Mobile Analytics：在 AWS 上测量、跟踪和分析移动应用数据。
5.  Pinpoint：针对性的推送通知和移动互动。

### 应用服务 

这是一组可以和你在 AWS 上的应用一起使用的服务。

1.  Step Functions：定义和使用应用程序中的各种功能。
2.  SWF：SWF 代表简单的工作流服务。其云工作流程管理可帮助开发人员在应用程序生命周期的不同阶段进行协调和贡献。
3.  API Gateway：帮助开发人员创建、管理和托管 API。
4.  Elastic Transcoder：帮助开发人员将媒体文件转换为在各种设备上可以播放的格式。

### 消息 

AWS 中的通知和消息服务。

1.  SQS：SQS 表示简单队列服务。完全管理的消息队列服务，用于在 AWS 中的服务和应用之间进行通信。
2.  SNS：SNS 代表简单通知服务。 为 AWS 用户推送通知服务，提醒他们有关其在 AWS 空间中的服务。
3.  SES：SES 代表简单电子邮件服务。 这是 AWS 为自己的客户提供高性价比的电子邮件服务。

### 企业生产率 

一组帮你提高业务生产率的服务。

1.  WorkDocs：协同文件共享、存储和编辑服务。
2.  WorkMail：安全的商务邮件、日程服务。
3.  Amazon Chime：在线的企业会议！

### 桌面和应用程序流式传输

实现桌面应用程序通过云端进行流传输。

1.  WorkSpaces：完全管理且安全的云计算服务。
2.  AppStream 2.0：来自云端的流式桌面应用。

--------------------------------------------------------------------------------

via: http://kerneltalks.com/virtualization/aws-cloud-terminology/

作者：[Shrikant Lavhate][a]
译者：[chenxinlong](https://github.com/chenxinlong)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://kerneltalks.com/virtualization/aws-cloud-terminology/

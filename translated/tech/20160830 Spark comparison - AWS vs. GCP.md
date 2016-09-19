[firstadream 翻译完成]
Spark comparison: AWS vs. GCP
AWS和GCP Spark技术哪家强？
===========


>Tianhui Michael Li 和Ariel M’ndange-Pfupfu将在今年10月10、12和14号组织一个在线经验分享课程：Spark分布式计算入门。该课程的内容包括创建端到端的运行应用程序和精通Spark关键工具。

毋庸置疑，云计算将会在未来数据科学领域扮演至关重要的角色。弹性，可扩展性和按需分配的计算能力作为云计算的重要资源，直接导致云服务提供商集体火拼。其中最大的两股势力正是亚马逊网络服务（AWS)【1】和谷歌云平台（GCP)【2】。

本文依据构建时间和运营成本对AWS和GCP的Spark工作负载作一个简短比较。实验由我们的学生在数据孵化器进行，数据孵化器【3】是一个大数据培训组织，专门为公司招聘顶尖数据科学家并为公司职员培训最新的大数据科学技能。尽管内置的Spark效率惊人，分布式工作负载的时间和成本亦然可以大到不能忽略不计。因此我们一直努力寻求更高效的技术，我们的学生也因此能够学习到最好和最快的工具。

###提交Spark任务到云

Spark是一个类MapReduce但是比MapReduce更灵活、更抽象的并行计算框架。Spark提供Python和Java 编程接口，但它更愿意用户使用原生的Scala语言进行应用程序开发。Scala可以把应用程序和依赖文件打包在一个JAR文件从而使Spark任务提交变得简单。

通常情况下，Sprark结合HDFS应用于分布式数据存储，而与YARN协同工作则应用于集群管理；这种堪称完美的配合使得Spark非常适用于AWS的弹性MapReduce(EMR)集群和GCP的Dataproc集群。这两种集群都已有HDFS和YARN预配置，不需要额外进行配置。

通过命令行比通过网页接口管理数据、集群和任务具有更高的可扩展性。对AWS而言，这意味着客户需要安装CLI。客户必须获得证书并为每个EC2实例创建独立的密钥对。除此之外，客户还需要为EMR用户和EMR本身创建规则，主要是准入许可规则，从而使EMR用户获得足够多的权限。

相比而言，GCP的处理流程更加直接。如果客户选择安装Google Cloud SDK并且使用其Google账号登录，那么客户即刻可以使用GCP的几乎所有功能而无需其他任何配置。唯一需要提醒的是不要忘记通过API管理器使能计算引擎、Dataproc和云存储JSON的API。

AWS就是这样，实现自己喜欢的应用，一旦火力全开，根本停不下来！比如可以通过“aws s3 cp”或者“gsutil cp”命令拷贝客户的数据到云端。再比如客户可以创建自己的输入、输出或者任何其他需要的bucket，如此，运行一个应用就像创建一个集群或者提交JAR文件一样简单。请确定日志存放的地方，毕竟在云环境下跟踪问题或者调试bug有点诡异。

###一分钱一分货

谈及成本，Google的服务在以下几个方面更有优势。首先，购买计算能力的原始成本更低。4个vCPU和15G RAM的Google计算引擎服务每小时只需0.20美元，如果运行Dataproc，每小时也只需区区0.24美元。相比之下，同等的云配置，AWS EMR则需要每小时0.336美元。

其次，计费方式。AWS按小时计费，即使客户只使用15分钟也要付足1小时的费用。GCP按分钟计费，最低计费10分钟。在诸多用户案例中，资费方式的不同直接导致成本的巨大差异。

两种云服务都有其他多种定价机制。客户可以使用Sport Instance或Preemptible Instance竞价AWS或GCP的空闲云计算能力。这些服务比专有的、按需服务便宜，缺点是不能保证随时有可用的云资源提供服务。在GCP上，如果客户长时间（每月的25%至100%）使用服务，可以获取更多折扣。在AWS上预付费或者一次购买大批量服务可以节省不少费用。底线是，如果你是一个超级用户，并且使用云计算已经成为一种常态，那么最好深入研究云计算，自建云计算服务。

最后，新手在GCP上体验云服务的费用较低。新手只需300美元信用担保，就可以免费试用60天GCP提供的全部云服务。AWS只免费提供特定服务的特定试用层级，如果运行Spark任务，需要付费。这意味着初次体验Spark，GCP具有更多选择，也少了精打细算和讨价还价的烦恼。

###性能比拼

我们通过实验检测一个典型Spark工作负载的性能与开销。实验分别选择AWS的m3.xlarg和GCP的n1-standard-4，它们都是由一个Master和5个核心实例组成的集群。除了规格略有差别，虚拟核心和费用都相同。实际上它们在Spark任务的执行时间上也表现的惊人相似。

测试Spark任务包括对数据的解析、过滤、合并和聚合，这些数据来自堆栈交换数据转储。通过运行相同的JAR，我们首先对大约50M的数据子集进行交叉验证，然后将验证扩大到大约9.5G的数据集。

![](https://d3ansictanv2wj.cloudfront.net/1400_img_1_AWS_GCP-25ed6069029112a8439d89999796be18.jpg)
>Figure 1. Credit: Michael Li and Ariel M'ndange-Pfupfu.

![](https://d3ansictanv2wj.cloudfront.net/1400_img_2_AWS_GCP-448714718896b21e32f8b47d4657fc8c.jpg)
>Figure 2. Credit: Michael Li and Ariel M'ndange-Pfupfu.

结果表明，短任务在GCP 上具有明显的成本优势，这是因为GCP以分钟计费，并最终扣除了10分钟的费用，而AWS则收取了1小时的费用。但是即使长任务，因为计费方式占优，GPS仍然具有相当优势。同样值得注意的是存储成本并不包括在此次比较当中。

###结论

AWS是云计算的先驱，这甚至体现在API中。AWS拥有巨大的生态系统，但其准入模型已略显陈旧，配置管理也有些晦涩难解。相比之下，Google是云计算领域的新星并且抛光了云计算中一些粗糙的边缘问题。但是GCP缺少一些便捷的功能，比如通过简单方法自动结束集群和详细的任务计费信息分解。另外，其Python编程接口也不像AWS的Boto那么全面。

如果你初次使用云计算，GCP因简单易用，别具魅力。即使你已在使用AWS，你也许会发现迁移到GCP可能更划算，尽管真正从AWS迁移到GCP的代价可能得不偿失。

当然，现在对两种云服务作一个全面的总结还非常困难，因为它们都不是单一的实体，而是由多个实体整合而成的完整生态系统，并且各有利弊。真正的赢家是用户。一个例证就是在数据孵化器，我们的博士数据科学研究员在学习过程中真正体会到成本的下降。虽然我们的大数据企业培训客户可能对价格不那么敏感,他们很欣慰能够更快速地处理企业数据,同时保持价格不增加。数据科学家现在可以享受大量的可选服务,这些都是从竞争激烈的云计算市场得到的实惠。











--------------------------------------------------------------------------------

via: https://www.oreilly.com/ideas/spark-comparison-aws-vs-gcp?utm_source=dbweekly&utm_medium=email

作者：[Michael Li][a]  [Ariel M'Ndange-Pfupfu][b] 
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.oreilly.com/people/76a5b-michael-li
[b]: https://www.oreilly.com/people/Ariel-Mndange-Pfupfu
[1]: https://aws.amazon.com/
[2]: https://cloud.google.com/
[3]: https://www.thedataincubator.com/training.html?utm_source=OReilly&utm_medium=blog&utm_campaign=AWSvsGCP

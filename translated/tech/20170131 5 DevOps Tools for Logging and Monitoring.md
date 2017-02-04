5 个用于日志记录以及监控的 DevOps 工具
============================================================


 ![DevOps tools](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/devops-logging.jpg?itok=8-1glKie "DevOps tools") 
这些  DevOps 日志记录和监控工具是重塑云计算趋势的一部分 - 在“开放云”指南中了解更多。

[Creative Commons Zero][1]Pixabay

在云中，开源工具和应用程序对 DevOps 提高了很多效率，对于日志记录和监视解决方案尤其如此。监控云平台，应用程序和组件以及处理和分析日志对于确保高可用性、高性能、低延迟等至关重要。事实上，RightScale 最近的[云状态调查][4]报告中说，最常见的云优化的行为中，45％ 的大公司和中小型企业关注的是监控。

然而，专有的记录和监控解决方案是昂贵的。更糟的是，它们通常捆绑更昂贵的管理服务产品。

进入强大的开放日志和监控解决方案的新浪潮。其中一些关注于有针对性的任务，例如容器集群的监控和性能分析，而其他作为整体监控和警报工具包，它们能够进行多维度的数据收集和查询。

Linux基金会最近[宣布][5]了报告[开放云指导：当前趋势和开源项目][6]。这第三份年度报告全面地介绍了开放云计算的状态，包括有关 DevOps 社区的日志记录和监控的部分。该报告现在可以[下载][7]、汇总和分析研究了，它阐述了容器、监控，更多的是重塑云计算的趋势。该报告提供了对当今开放云环境的中心的分类项目的描述和链接。需要特别注意的是，DevOps 已经成为云中应用交付和维护的最有效方法。

在这里的[一系列帖子][8]中，我们按照类别从指南中列出了这些项目，提供了关于整体类别如何发展的额外见解。下面，你将看到一些用于记录和监视的重要 DevOps 工具集合，以及它们所带来的影响，以及它们的 GitHub 链接，这些都是从“开放云”指南收集而来的：

### 日志记录和监控

[Fluentd][9]

Fluentd 是一个用于统一日志记录层的开源数据收集器，由 Treasure Data 赞助。它将数据结构化为 JSON，以统一处理日志数据的所有方面：在多个源和目标之间收集、过滤、缓冲和输出日志。[Fluentd 的 GitHub][10]

[Heapster][11]

Heapster 是 Kubernetes 的一个容器集群监控和性能分析工具。它本身支持 Kubernetes 和 CoreOS，并可以适应在 OpenShift 上运行。它还支持可插拔的存储后端：使用 Grafana 的 InfluxDB、Google Cloud Monitoring、Google Cloud Logging、Hawkular、Riemann 和 Kafka。[Heapster 的 GitHub][12]

[Logstash][13]

Logstash 是 Elastic 的开源数据管道，用于帮助处理来自各种系统的日志和其他事件数据。它的插件可以连接到各种源和大规模流数据到中央分析系统。[LogStash 的 GitHub][14]

[Prometheus][15]

Prometheus 是一个开源系统监控和警报工具包，最初由 SoundCloud 构建，现在是 Linux 基金会的云计算基础项目。它适用于以机器为中心和微服务架构，并支持多维度数据收集和查询。[Prometheus 的 GitHub][16]


[Weave Scope][17]

Weave Scope 是 Weaveworks 的开源工具，用于实时监控分布式应用程序及其容器。它与 Kubernetes 和 AWS ECS 集成。[Weave Scope 的 GitHub][18]

_了解更多关于开源云计算的趋势，并查看顶级开源云计算项目的完整列表。[现在下载 Linux 基金会的开放云报告指南][3]！ _

--------------------------------------------------------------------------------

via: https://www.linux.com/news/open-cloud-report/2016/5-devops-tools-logging-and-monitoring

作者：[SAM DEAN][a]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linux.com/users/sam-dean
[1]:https://www.linux.com/licenses/category/creative-commons-zero
[2]:https://www.linux.com/files/images/devops-loggingjpg
[3]:http://bit.ly/2eHQOwy
[4]:http://www.rightscale.com/blog/cloud-industry-insights/cloud-computing-trends-2016-state-cloud-survey
[5]:https://www.linux.com/blog/linux-foundation-issues-2016-guide-open-source-cloud-projects
[6]:http://go.linuxfoundation.org/l/6342/2016-10-31/3krbjr?utm_source=press-release&utm_medium=pr&utm_campaign=open-cloud-report-2016
[7]:http://go.linuxfoundation.org/l/6342/2016-10-31/3krbjr
[8]:https://www.linux.com/news/open-cloud-report/2016/guide-open-cloud-state-micro-oses
[9]:http://www.fluentd.org/
[10]:https://github.com/fluent
[11]:http://blog.kubernetes.io/2015/05/resource-usage-monitoring-kubernetes.html
[12]:https://github.com/kubernetes/heapster
[13]:https://www.elastic.co/products/logstash
[14]:https://github.com/elastic/logstash
[15]:https://prometheus.io/
[16]:https://github.com/prometheus
[17]:https://www.weave.works/products/weave-scope/
[18]:https://github.com/weaveworks/scope

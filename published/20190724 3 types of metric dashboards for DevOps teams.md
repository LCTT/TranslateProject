[#]: collector: "lujun9972"
[#]: translator: "hello-wn"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-11183-1.html"
[#]: subject: "3 types of metric dashboards for DevOps teams"
[#]: via: "https://opensource.com/article/19/7/dashboards-devops-teams"
[#]: author: "Daniel Oh https://opensource.com/users/daniel-oh"

DevOps 团队必备的 3 种指标仪表板
=========

> 仪表板可以帮助 DevOps 团队观测和监控系统，以提高性能。

![](https://img.linux.net.cn/data/attachment/album/201908/04/083434ixlm9lgv8ev8dlyd.jpg)

指标仪表板帮助 [DevOps][2] 团队监控整个 DevOps 平台，以便实时响应<ruby>议题<rt>issue</rt></ruby>。在处理生产环境宕机或者应用服务中断等情况时，指标仪表板显得尤为重要。

DevOps 仪表板聚合了多个监测工具的指标，为开发和运维团队生成监控报告。它还允许团队跟踪多项指标，例如服务部署时间、程序 bug、报错信息、工作项、待办事项等等。

下面三种指标仪表板可以帮助 DevOps 团队监测系统，改善服务性能。

### 敏捷项目管理仪表板

这种类型的仪表板为 DevOps 团队的工作项提供可视化视图，优化敏捷项目的工作流。有利于提高团队协作效率，对工作进行可视化并提供灵活的视图 —— 就像我们过去在白板上使用便利贴来共享项目进度、<ruby>议题<rt>issue</rt></ruby>和待办事项一样。

- [Kanban boards][3] 允许 DevOps 团队创建卡片、标签、任务和栏目，便于持续交付敏捷项目。
- [Burndown charts][4] 对指定时间段内未完成的工作或待办事项提供可视化视图，并记录团队当前的效率和轨迹，这些指标通常用于敏捷项目和 DevOps 项目管理。
- [Jira boards][5] 帮助 DevOps 团队创建议题、计划迭代并生成团队总结。这些灵活的仪表板还能帮助团队综合考虑并确定个人和团队任务的优先级；实时查看、汇报和跟踪正在进行的工作；并提高团队绩效。
- [GitHub project boards][6] 帮助确定团队任务的优先级。它们还支持拉取请求，因此团队成员可以方便地提交 DevOps 项目相关的信息。

### 应用程序监控仪表板

开发者负责优化应用和服务的性能，并开发新功能。应用程序监控面板则帮助开发者在<ruby>持续集成/持续开发<rt>CI / CD</rt></ruby>流程下，加快修复 bug、增强程序健壮性、发布安全修丁的进度。另外，这些可视化仪表板有利于查看请求模式、请求耗时、报错和网络拓扑信息。

- [Jaeger][7] 帮助开发人员跟踪请求数量、请求响应时间等。对于分布式网络系统上的云原生应用程序，它还使用 [Istio 服务网格][8]加强了监控和跟踪。
- [OpenCensus][9] 帮助团队查看运行应用程序的主机上的数据，它还提供了一个可插拔的导出系统，用于将数据导出到数据中心。

### DevOps 平台监控面板

你可能使用多种技术和工具在云上或本地构建 DevOps 平台，但 Linux 容器管理工具（如 Kubernetes 和 OpenShift ）更利于搭建出一个成功的 DevOps 平台。因为 Linux 容器的不可变性和可移植性使得应用程序从开发环境到生产环境的编译、测试和部署变得更快更容易。

DevOps 平台监控仪表板帮助运营团队从机器/节点故障和服务报错中收集各种按时序排列的数据，用于编排应用程序容器和基于软件的基础架构，如网络（SDN）和存储（SDS）。这些仪表板还能可视化多维数据格式，方便地查询数据模式。

- [Prometheus dashboards][12] 从平台节点或者运行中的容器化应用中收集指标。帮助 DevOps 团队构建基于指标的监控系统和仪表板，监控微服务的客户端/服务器工作负载，及时识别出异常节点故障。
- [Grafana boards][13] 帮助收集事件驱动的各项指标，包括服务响应持续时间、请求量、<ruby>客户端/服务器<rt>client/server</rt></ruby>工作负载、网络流量等，并提供了可视化面板。DevOps 团队可以通过多种方式分享指标面板，也可以生成编码的当前监控数据快照分享给其他团队。

### 总结

这些仪表板提供了可视化的工作流程，能够发现团队协作、应用程序交付和平台状态中的各种问题。它们帮助开发团队增强其在快速应用交付、安全运行和自动化 CI/CD 等领域的能力。

------

via: https://opensource.com/article/19/7/dashboards-devops-teams

作者：[Daniel Oh][a]
选题：[lujun9972][b]
译者：[hello-wn](https://github.com/hello-wn)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/daniel-ohhttps://opensource.com/users/daniel-ohhttps://opensource.com/users/heronthecli
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/metrics_data_dashboard_system_computer_analytics.png
[2]: https://opensource.com/resources/devops
[3]: https://opensource.com/article/19/1/productivity-tool-taskboard
[4]: https://openpracticelibrary.com/practice/burndown/
[5]: https://www.atlassian.com/software/jira
[6]: https://opensource.com/life/15/11/short-introduction-github
[7]: https://www.jaegertracing.io/
[8]: https://opensource.com/article/19/3/getting-started-jaeger
[9]: https://opencensus.io/
[10]: https://opensource.com/article/18/11/intro-software-defined-networking
[11]: https://opensource.com/business/14/10/sage-weil-interview-openstack-ceph
[12]: https://opensource.com/article/18/12/introduction-prometheus
[13]: https://opensource.com/article/17/8/linux-grafana


[#]: collector: (lujun9972)
[#]: translator: (hello-wn)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (3 types of metric dashboards for DevOps teams)
[#]: via: (https://opensource.com/article/19/7/dashboards-devops-teams)
[#]: author: (Daniel Oh https://opensource.com/users/daniel-ohhttps://opensource.com/users/daniel-ohhttps://opensource.com/users/heronthecli)

3 types of metric dashboards for DevOps teams
======
Dashboards help DevOps teams observe and monitor systems to improve
performance.
![metrics and data shown on a computer screen][1]

Metrics dashboards enable [DevOps][2] teams to monitor the entire DevOps platform so they can respond to issues in real-time, which is critical in the event of downtime or disruption in the production environment or application services.

DevOps dashboards aggregate metrics from multiple observation tools to create monitoring reports for dev and ops teams. They also allow teams to track multiple metrics, such as service deployment times, bugs, errors, work items, backlogs, and more.

The three categories of metrics dashboards described below help DevOps teams observe and monitor systems and thereby improve performance.

### Agile project management dashboards

This type of dashboard visualizes work items for DevOps teams to optimize workflows in agile projects. The dashboard should be designed for maximizing team collaboration efficiency, visualizing work, and providing flexible views—just like we used to use sticky notes on a whiteboard to share project progress, issues, and backlogs.

  * [Kanban boards][3] enable DevOps teams to create cards, labels, assignments, and columns for continuous delivery of agile projects.
  * [Burndown charts][4] visualize uncompleted work or backlogs in a specified time period and provide the team's current velocity and trajectory, metrics that are typically used in agile and DevOps project management.
  * [Jira boards][5] enable DevOps teams to create issues, plan sprints, and generate team stories. These flexible dashboards also allow the team to prioritize individual and team tasks in full context; provide visibility to view, report, and track work in progress; and help improve team performance.
  * [GitHub project boards][6] help prioritize the team's tasks. They also support pull requests so team members can add information related to DevOps projects.



### Application monitoring dashboards

Developers are responsible for improving application and services performance and developing new functions. An app monitoring dashboard enables developers to produce bugfixes, enhance features, and release security patches as soon as possible within a continuous integration/continuous development (CI/CD) pipeline. These dashboards should also visualize request patterns, elapsed time, errors, and network topology.

  * [Jaeger][7] enables developers to trace the number of requests, response time for each request, and more. It also improves monitoring and tracing of cloud-native apps on a distributed networking system with the [Istio service mesh][8].
  * [OpenCensus][9] allows the team to view data on the host where an application is running, but it also has a pluggable export system for exporting data to central aggregators.



### DevOps platform observation dashboard

You might have combined technologies and tools to build a DevOps platform in the cloud or on-premises, but Linux container management tools, such as Kubernetes and OpenShift, are the foundation of a successful DevOps platform. This is because a Linux container's immutability and portability make it faster and easier to move from app development to building, testing, and deployment in production.

DevOps platform observation dashboards enable the ops teams to orchestrate application containers and software-defined infrastructure, like networking ([SDN][10]) and storage ([SDS][11]), by collecting numeric time-series data from machine or node failures and services errors. These dashboards also visualize multi-dimensional data formats and query data patterns.

  * [Prometheus dashboards][12] scrape metrics from nodes in the platform or directly in running containerized applications. They allow DevOps teams to build a metric-based monitoring system and dashboard to observe microservices' client/server workloads to identify abnormal node failures.
  * [Grafana boards][13] allow DevOps organizations to utilize event-driven metrics and visualize multiple panels, including service response duration, request volume, client/server workloads, network traffic flow, and more. DevOps teams can share metrics panels easily in a variety of ways as well as take the snapshot that encodes current monitoring data and share it with other teams.



### Summary

These dashboards visualize metrics on how your DevOps team works and can help identify current or potential issues in team collaboration, application delivery, and platform health status. They also enable DevOps teams to enhance their capabilities in areas such as fast app delivery, secured runtimes, and automated CI/CD.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/7/dashboards-devops-teams

作者：[Daniel Oh][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/daniel-ohhttps://opensource.com/users/daniel-ohhttps://opensource.com/users/heronthecli
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/metrics_data_dashboard_system_computer_analytics.png?itok=oxAeIEI- (metrics and data shown on a computer screen)
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

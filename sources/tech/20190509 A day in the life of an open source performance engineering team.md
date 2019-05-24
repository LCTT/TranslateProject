[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (A day in the life of an open source performance engineering team)
[#]: via: (https://opensource.com/article/19/5/life-performance-engineer)
[#]: author: (Aakarsh Gopi  https://opensource.com/users/aakarsh/users/portante/users/anaga/users/gameloid)

A day in the life of an open source performance engineering team
======
Collaborating with the community enables performance engineering to
address the confusion and complexity that come with working on a broad
spectrum of products.
![Team checklist and to dos][1]

In today's world, open source software solutions are a collaborative effort of the community. Can a performance engineering team operate the same way, by collaborating with the community to address the confusion and complexity that come with working on a broad spectrum of products?

To answer that question, we need to explore some basic questions:

  * What does a performance engineering team do?
  * How does a performance engineering team fulfill its responsibilities?
  * How are open source tools developed or leveraged for performance analysis?



The term "performance engineering" has different meanings, which causes difficulty in figuring out a performance engineering team's responsibilities. Adding to the confusion, a team may be charged with working on a broad spectrum of products, ranging from an operating system like RHEL, whose performance can be significantly impacted by hardware components (CPU caches, network interface controllers, disk technologies, etc.), to something much higher up in the stack like Kubernetes, which comes with the added challenges of operating at scale without compromising on performance.

Performance engineering has progressed a lot since the days of running manual A/B testing and single-system benchmarks. Now, these teams test cloud infrastructures and add machine learning classifiers as a component in the CI/CD pipeline for identifying performance regression in releases of products.

### What does a performance engineering team do?

A performance engineering team is generally responsible for the following (among other things):

  * Identifying potential performance issues
  * Identifying any scale issues that could occur
  * Developing tuning guides and/or tools that would enable the user to achieve the most out of a product
  * Developing guides and/or working with customers to help with capacity planning
  * Providing customers with performance expectations for different use cases of the product



The mission of our specific team is to:

  * Establish performance and scale leadership of the Red Hat portfolio; the scope includes component level, system, and solution analysis
  * Collaborate with engineering, product management, product marketing, and Customer Experience and Engagement (CEE), as well as hardware and software partners
  * Deliver public-facing guidance, internal enablement, and continuous integration tests



Our team fulfills our mission in the following ways:

  * We work with product teams to set performance goals and develop performance tests to run against those products deployed to see how they measure up to those goals.
    * We also work to re-run performance tests to ensure there are no regressions in behaviors.
  * We develop open source tooling to achieve our product performance goals, making them available to the communities where the products are derived to re-create what we do.
    * We work to be transparent and open about how we do performance engineering; sharing these methods and approaches benefits communities, allowing them to reuse our work, and benefits us by leveraging the work they contribute with these tools.



### How does a performance engineering team fulfill its responsibilities?

Meeting these responsibilities requires collaboration with other teams, such as product management, development, QA/QE, documentation, and consulting, and with the communities.

_Collaboration_ allows a team to be successful by pulling together team members' diverse knowledge and experience. A performance engineering team builds tools to share their knowledge both within the team and with the community, furthering the value of collaboration.

Our performance engineering team achieves success through:

  * **Collaboration:** _Intra_ -team collaboration is as important as _inter_ -team collaboration for our performance engineering team
    * Most performance engineers tend to create a niche for themselves in one or more sub-disciplines of performance engineering via tooling, performance analysis, systems knowledge, systems configuration, and such. Our team is composed of engineers with knowledge of setting up/configuring systems across the product stack, those who know how a configuration option would affect the system's performance, and so on. Our team's success is heavily reliant on effective collaboration between performance engineers on the team.
    * Our team works closely with other organizations at various levels within Red Hat and the communities where our products are derived.
  * **Knowledge:** To understand the performance implications of configuration and/or system changes, deep knowledge of the product alone is not sufficient.
    * Our team has the knowledge to cover performance across all levels of the stack:
      * Hardware setup and configuration
      * Networking and scale considerations
      * Operating system setup and configuration (Linux kernel, userspace stack)
      * Storage sub-systems (Ceph)
      * Cloud infrastructure (OpenStack, RHV)
      * Cloud deployments (OpenShift/Kubernetes)
      * Product architectures
      * Software technologies (databases like Postgres; software-defined networking and storage)
      * Product interactions with the underlying hardware
      * Tooling to monitor and accomplish repeatable benchmarking
  * **Tooling:** The differentiator for our performance engineering team is the data collected through its tools to help tackle performance analysis complexity in the environments where our products are deployed.



### How are open source tools developed or leveraged for performance analysis?

Tooling is no longer a luxury but a need for today's performance engineering teams. With today's product solutions being so complex (and increasing in complexity as more solutions are composed to solve ever-larger problems), we need tools to help us run performance test suites in a repeatable manner, collect data about those runs, and help us distill that data so it becomes understandable and usable.

Yet, no performance engineering team is judged on how performance analysis is done, but rather on the results achieved from this analysis.

This tension can be resolved by collaboratively developing tools. A performance engineering team can't spend all its time developing tools, since that would prevent it from effectively collecting data. By developing its tools in a collaborative manner, a team can leverage work from the community to make further progress while still generating the result by which they will be measured.

Tooling is the backbone of our performance engineering team, and we strive to use the tools already available upstream. When no tools are available in the community that fit our needs, we've built tools that help us achieve our goals and made them available to the community. Open sourcing our tools has helped us immensely because we receive contributions from our competitors and partners, allowing us to solve problems collectively through collaboration.

![Performance Engineering Tools][2]

Following are some of the tools our team has contributed to and rely upon for our work:

  * **[Perf-c2c][3]:** Is your performance impacted by false sharing in CPU caches? The perf-c2c tool can help you tackle this problem by helping you inspect the cache lines where false sharing is detected and understand the readers/writers accessing those cache lines along with the offsets where those accesses occurred. You can read more about this tool on [Joe Mario's blog][4].
  * **[Pbench][5]:** Do you repeat the same steps when collecting data about performance, but fail to do it consistently? Or do you find it difficult to compare results with others because you're collecting different configuration data? Pbench is a tool that attempts to standardize the way data is collected for performance so comparisons and historical reviews are much easier. Pbench is at the heart of our tooling efforts, as most of the other tools consume it in some form. Pbench is a Swiss Army Knife, as it allows the user to run benchmarks such as fio, uperf, or custom, user-defined tests while gathering metrics through tools such as sar, iostat, and pidstat, standardizing the methods of collecting configuration data about the environment. Pbench provides a dashboard UI to help review and analyze the data collected.
  * **[Browbeat][6]:** Do you want to monitor a complex environment such as an OpenStack cluster while running tests? Browbeat is the solution, and its power lies in its ability to collect comprehensive data, ranging from logs to system metrics, about an OpenStack cluster while it orchestrates workloads. Browbeat can also monitor the OpenStack cluster while users run test/workloads of their choice either manually or through their own automation.
  * **[Ripsaw][7]:** Do you want to compare the performance of different Kubernetes distros against the same platform? Do you want to compare the performance of the same Kubernetes distros deployed on different platforms? Ripsaw is a relatively new tool created to run workloads through Kubernetes native calls using the Ansible operator framework to provide solutions to the above questions. Ripsaw's unique selling point is that it can run against any kind of Kubernetes distribution, thus it would run the same against a Kubernetes cluster, on Minikube, or on an OpenShift cluster deployed on OpenStack or bare metal.
  * **[ClusterLoader][8]:** Ever wondered how an OpenShift component would perform under different cluster states? If you are looking for an answer that can stress the cluster, ClusterLoader will help. The team has generalized the tool so it can be used with any Kubernetes distro. It is currently hosted in the [perf-tests repository][9].



### Bottom line

Given the scale at which products are evolving rapidly, performance engineering teams need to build tooling to help them keep up with products' evolution and diversification.

Open source-based software solutions are a collaborative effort of the community. Our performance engineering team operates in the same way, collaborating with the community to address the confusion and complexity that comes with working on a broad spectrum of products. By developing our tools in a collaborative manner and using tools from the community, we are leveraging the community's work to make progress, while still generating the results we are measured on.

_Collaboration_ is our key to accomplish our goals and ensure the success of our team.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/5/life-performance-engineer

作者：[Aakarsh Gopi ][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/aakarsh/users/portante/users/anaga/users/gameloid
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/todo_checklist_team_metrics_report.png?itok=oB5uQbzf (Team checklist and to dos)
[2]: https://opensource.com/sites/default/files/uploads/performanceengineeringtools.png (Performance Engineering Tools)
[3]: http://man7.org/linux/man-pages/man1/perf-c2c.1.html
[4]: https://joemario.github.io/blog/2016/09/01/c2c-blog/
[5]: https://github.com/distributed-system-analysis/pbench
[6]: https://github.com/openstack/browbeat
[7]: https://github.com/cloud-bulldozer/ripsaw
[8]: https://github.com/openshift/origin/tree/master/test/extended/cluster
[9]: https://github.com/kubernetes/perf-tests/tree/master/clusterloader

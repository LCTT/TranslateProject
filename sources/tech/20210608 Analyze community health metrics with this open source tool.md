[#]: subject: (Analyze community health metrics with this open source tool)
[#]: via: (https://opensource.com/article/21/6/health-metrics-cauldron)
[#]: author: (Georg Link https://opensource.com/users/georglink)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Analyze community health metrics with this open source tool
======
Cauldron makes it easier for anyone to use GrimoireLab to learn more
about open source communities.
![Open source doctor.][1]

Community managers, maintainers, and foundations seek metrics and insights about open source communities. Because each open source project works differently, its data needs to be analyzed differently. Yet, all projects share common challenges with getting data and creating visualizations. This presents an ideal use case for an open source project to solve this problem generically with the capability to customize it to users' needs.

The open source GrimoireLab project has been working on ways to [measure the health of open source communities][2]. In addition to powering large-scale open source metrics solutions, it also serves as the backbone of the new [Cauldron][3] platform.

GrimoireLab solves some hard problems related to retrieving and curating data. It was designed to be a flexible metrics solution for analyzing open source communities. [LibreOffice][4] and [Mautic][5] are among the communities using GrimoireLab's open source tools to generate community health metrics.

![LibreOffice's GrimoireLab dashboard][6]

LibreOffice's GrimoireLab dashboard (Georg Link, [CC BY-SA 4.0][7])

GrimoireLab satisfies the need for metrics, but two challenges have prevented wider adoption. First, it is difficult to deploy and secure. Its setup is more difficult than many expect, especially those who just want to have metrics without manually editing configuration files. Second, it does not scale well if you have many users trying to analyze different projects; every user must deploy their own GrimoireLab instance.

Two platforms have solved these challenges to offer community metrics as a service, with GrimoireLab working under the hood. First, the Linux Foundation leveraged GrimoireLab to bootstrap its [LFX Insights platform][8]. It gives the foundation's open source projects a great deal of insight into their communities, some of which goes beyond GrimoireLab's core features. LFX Insights is not available as open source and only available from the Linux Foundation.

![LFX Insights dashboard][9]

LFX Insights dashboard showing metrics about the Kubernetes project (Georg Link, [CC BY-SA 4.0][7])

The other choice is [Cauldron][10], which is open source. It's designed to abstract the difficulty of using GrimoireLab's metrics and create a smooth user experience. Anyone can use Cauldron for their open source communities for free at [Cauldron.io][3]. Cauldron provides metrics without having to deploy software, which resolves the challenge of deploying and securing GrimoireLab.

![Cauldron dashboard][11]

Cauldron dashboard showing metrics about the Kubernetes project (Georg Link, [CC BY-SA 4.0][7])

Cauldron solves the scalability challenge by collecting data about an open source community centrally and making it available to all platform users. This reduces the time needed for new reports if the data was previously collected. It also minimizes the issue of API rate limits that could restrict collecting data at scale.

To mitigate privacy concerns, Cauldron anonymizes all data by default. Should you want to know who your contributors (or companies in your communities) are, you will need a private Cauldron instance, either by deploying it yourself or using [Cauldron Cloud service][12].

These design choices enable a new way of working with this data. Instead of limiting analysis to individual projects, anyone can define reports and include anything from a single project's repository to hundreds of repositories from a group of projects. This makes it possible to analyze trends, like the rise in blockchain projects, by looking at data across many projects.

Many people want to be able to compare data about multiple open source projects. In Cauldron, a user can create a report for each project then use the Comparison feature to show the data for each project side-by-side with graphs.

![A Cauldron dashboard comparing Ansible, Ethereum, and Kubernetes][13]

Cauldron dashboard comparing Ansible, Ethereum, and Kubernetes (Georg Link, [CC BY-SA 4.0][7])

The high demand for open source within the enterprise and increasing interest in community health and metrics are leading solution providers to improve usability. GrimoireLab continues to focus on retrieving data about open source communities. Downstream projects like LFX Insights and Cauldron leverage GrimoireLab to provide easy-to-use metrics.

On a related note, the CHAOSS Project offers a Community Health Report. The report is created using the two CHAOSS projects, Augur and GrimoireLab. You can [request your Community Health Report][14] on the CHAOSS website or see the same metrics and visualizations under the [CHAOSS tab][15] in Cauldron.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/6/health-metrics-cauldron

作者：[Georg Link][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/georglink
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/osdc_520x292_opensourcedoctor.png?itok=fk79NwpC (Open source doctor.)
[2]: https://opensource.com/article/20/3/grimoirelab
[3]: https://cauldron.io/
[4]: https://dashboard.documentfoundation.org/
[5]: https://dashboard.mautic.org/
[6]: https://opensource.com/sites/default/files/uploads/libreoffice_grimoirelab-dashboard.png (LibreOffice's GrimoireLab dashboard)
[7]: https://creativecommons.org/licenses/by-sa/4.0/
[8]: https://lfx.linuxfoundation.org/tools/insights
[9]: https://opensource.com/sites/default/files/uploads/lfx-insights.png (LFX Insights dashboard)
[10]: https://gitlab.com/cauldronio/cauldron/
[11]: https://opensource.com/sites/default/files/uploads/cauldron-dashboard.png (Cauldron dashboard)
[12]: http://cloud.cauldron.io/
[13]: https://opensource.com/sites/default/files/uploads/compare-projects.png (A Cauldron dashboard comparing Ansible, Ethereum, and Kubernetes)
[14]: https://chaoss.community/community-reports/
[15]: https://cauldron.io/project/372?tab=chaoss

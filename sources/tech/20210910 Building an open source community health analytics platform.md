[#]: subject: "Building an open source community health analytics platform"
[#]: via: "https://opensource.com/article/21/9/openrit-mystic"
[#]: author: "Quinn Foster https://opensource.com/users/quinn-foster"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Building an open source community health analytics platform
======
An academic OSPO is working with CHAOSS software to build a community
health analytics platform.
![metrics and data shown on a computer screen][1]

Rochester Institute of Technology (RIT) has made considerable strides in increasing its presence in the open source world lately. RIT's _Free and Open Source Software and Free Culture_ minor is the first of its kind in academia. For example, its open source programs office, Open @ RIT, has begun helping RIT faculty and staff fellows build and maintain communities for their open source projects.

These strides are driven by the students, faculty, and staff at RIT. Already, a growing number of people at the university are heading their own open projects. However, running an entirely open source project can be cumbersome. Much of this comes from maintaining a community for the project and managing data such as the project's code, issue tracking, and repositories.

To help these people, Open @ RIT is creating a system called Mystic, a community health analytics platform that utilizes [GrimoireLab][2], an open source toolkit developed by [CHAOSS][3] software that provides metrics and analytics for open source projects. GrimoireLab allows users to gather, enrich, filter, and visualize a project's data, such as the time it takes a reported issue to be solved, contributor affiliations, and much more.

Mystic will act as a front-end portal where anybody can submit their project. From there, the project will be sent directly to GrimoireLab, which will compute and publish the project's metrics for the submitter after only a few minutes.

> "Our hope is that anyone at RIT who is managing, leading, or participating in an open source project will be able to submit that project to Mystic and have any metrics they need provided to them," says Emi Simpson, full-stack developer at Open @ RIT and head developer of Mystic.

The process is straightforward. After logging into Mystic, the user uploading their project opens up a pop-up window where they enter details about the project and links to data sources like GitLab, RSS feed, and an Open Software Foundation (OSF) project. Once the details and project are saved, Mystic uses GrimoireLab to automatically retrieve metrics from the project source and render graphs for each source. The project and its metrics will then be displayed on its own dashboard.

![Mystic statistics page][4]

Screenshot by Quinn Foster, [CC-BY SA 4.0][5]

These dashboards will also be displayed and listed on a single page for others to see, encouraging cooperative development and interaction between open source communities within RIT worldwide. Simpson and Open @ RIT hope this will increase participation in open work at RIT and further cement the university as an open work hub.

> "If somebody asks what is RIT doing for open source software, my hope is that people will be able to point to Mystic and GrimoireLab and say 'here's what,'" says Simpson. "By building that metric of 'here's what we're doing, here's what we've contributed, here are the projects that people are working on,' we can build a community at RIT centered around the work that we're doing in open source."

At the moment, Mystic is still under development and not ready for a production environment, but its potential for both RIT and open source as a whole remains well in sight. Future goals include implementing easy integration with the university's reporting tools and comprehensive dashboards at the project level and in aggregate.

Are you interested in contributing to Mystic? [Get in touch with us][6] to get started.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/9/openrit-mystic

作者：[Quinn Foster][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/quinn-foster
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/metrics_data_dashboard_system_computer_analytics.png?itok=oxAeIEI- (metrics and data shown on a computer screen)
[2]: https://chaoss.github.io/grimoirelab/
[3]: https://chaoss.community/
[4]: https://opensource.com/sites/default/files/uploads/mystic_statistics_page.png (Mystic statistics page)
[5]: https://creativecommons.org/licenses/by-sa/4.0/
[6]: https://opensource.ieee.org/rit/mystic

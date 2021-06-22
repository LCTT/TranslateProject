[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (A guide to setting up your Open Source Program Office (OSPO) for success)
[#]: via: (https://opensource.com/article/20/5/open-source-program-office)
[#]: author: (J. Manrique Lopez de la Fuente https://opensource.com/users/jsmanrique)

A guide to setting up your Open Source Program Office (OSPO) for success
======
Learn how to best grow and maintain your open source communities and
allies.
![community team brainstorming ideas][1]

Companies create Open Source Program Offices (OSPO) to manage their relationship with the open source ecosystems they depend on. By understanding the company's open source ecosystem, an OSPO is able to maximize the company's return on investment and reduce the risks of consuming, contributing to, and releasing open source software. Additionally, since the company depends on its open source ecosystem, ensuring its health and sustainability shall ensure the company's health, sustainable growth, and evolution.

### How has OSPO become vital to companies and their open source ecosystem?

Marc Andreessen has said that "software is eating the world," and more recently, it could be said that open source is eating the software world. But how is that process happening?

Companies get involved with open source projects in several ways. These projects comprise the company's open source ecosystem, and their relationships and interactions can be seen through Open Source Software's (OSS) inbound and outbound processes.

From the OSS inbound point of view, companies use it to build their own solutions and their own infrastructure. OSS gets introduced because it's part of the code their technology providers use, or because their own developers add open source components to the company's information technology (IT) infrastructure.

From the OSS outbound point of view, some companies contribute to OSS projects. That contribution could be part of the company's requirements for their solutions that need certain fixes in upstream projects. For example, Samsung contributes to certain graphics-related projects to ensure its hardware has software support once it gets into the market. In some other cases, contributing to OSS is a mechanism to retain talent by allowing the people to contribute to projects different from their daily work.

Some companies release their own open source projects as an outbound OSS process. For companies like Red Hat or GitLab, it would be expected. But, there are increasingly more non-software companies releasing a lot of OSS, like Lyft.

![OSS inbound and outbound processes][2]

OSS inbound and outbound processes

Ultimately, all of these projects involved in the inbound and outbound OSS flow are the company's OSS ecosystem. And like any living being, the company's health and sustainability depend on the ecosystem that surrounds it.

### OSPO responsibilities

Following the species and their ecosystem, people working in the OSPO team could be seen as the rangers in the organization's OSS ecosystem. They take care of the ecosystem and its relationship with the company, to keep everything healthy and sustainable.

When the company consumes open source software projects, they need to be aware of licenses and compliance, to check the project's health, to ensure there are no security flaws, and, in some cases, to identify talented community members for potential hiring processes.

When the company contributes to open source software projects, they need to be sure there are no Intellectual Property (IP) issues, to ensure the company contributions' footprint and its leadership in the projects, and sometimes, also to help talented people stay engaged with the company through their contributions.

And when the company releases and maintains open source projects, they are responsible for ensuring community engagement and growth, for checking there are no IP issues, that the company maintains its footprint and leadership, and perhaps, to attract new talent to the company.

Have you realized the whole set of skills required in an OSPO team? When I've asked people working in OSPO about the size of their teams, the number is around 1 to 5 people per 1,000 developers in the company. That's a small team to monitor a lot of people and their potential OSS related activity.

### How to manage an OSPO

With all these activities in OSPO people's minds and all the resources they need to worry about, how are they able to manage all of this?

There are at least a couple of open source communities with valuable knowledge and resources available for them:

  * The [TODO Group][3] is "an open group of companies who want to collaborate on practices, tools, and other ways to run successful and effective open source projects and programs." For example, they have a complete set of [guides][4] with best practices for and from companies running OSPOS.
  * The [CHAOSS (Community Health Analytics for Open Source Software)][5] community develops metrics, methodologies, and software for managing open source project health and sustainability. (See more on CHAOSS' active communities and working groups below).



OSPO managers need to report a lot of information to the rest of the company to answer many questions related to their OSS inbound and outbound processes, i.e., Which projects are we using in our organization? What's the health of those projects? Who are the key people in those projects? Which projects are we contributing to? Which projects are we releasing? How are we dealing with community contributions? Who are the key contributors?

### Data-driven OSPO

As William Edwards Deming said, "Without data, you are just a person with an opinion."

Having opinions is not a bad thing, but having opinions based on data certainly makes it easier to understand, discuss, and determine the processes best suited to your company and its goals. CHAOSS is the recommended community to look to for guidance about metrics strategies and tools.

Recently, the CHAOSS community has released [a new set of metric definitions][6]. These metrics are only subsets of all the ones being discussed in the focus areas of each working group (WG):

  * [Common WG][7]: Defines the metrics that are used by both working groups or are important for community health, but that do not cleanly fit into one of the other existing working groups. Areas of interest include organizational affiliation, responsiveness, and geographic coverage.
  * [Diversity and Inclusion WG][8]: Gathers experiences regarding diversity and inclusion in open source projects with the goal of understanding, from a qualitative and quantitative point of view, how diversity and inclusion can be measured.
  * [Evolution WG][9]: Refines the metrics that inform evolution and works with software implementations.
  * [Risk WG][10]: Refines the metrics that inform risk and works with software implementations.
  * [Value WG][11]: Focuses on industry-standard metrics for economic value in open source. Their main goal is to publish trusted industry-standard value metrics—a kind of S&amp;P for software development and an authoritative source for metrics significance and industry norms.



On the tooling side, projects like [Augur][12], [Cregit][13], and [GrimoireLab][14] are the reference tools that report these metrics, but also many others related to OSPO activities. They are also the seed for new tools and solutions provided by the OSS community like [Cauldron.io][15], a SaaS open source solution to ease OSS ecosystem analysis.

![CHAOSS Metrics for 15 years of Unity OSS activity. Source: cauldron.io][16]

CHAOSS Metrics for 15 years of Unity OSS activity. Source: cauldron.io

All these metrics and data are useless without a metrics strategy. Usually, the first approach is to try to measure as much as possible, producing overwhelming reports and dashboards full of charts and data. What is the value of that?

Experience has shown that a very valid approach is the [Goal, Questions, Metrics (GQM)][17] strategy. But how do we put that in practice in an OSPO?

First of all, we need to understand the company's goals when using, consuming, contributing to, or releasing and maintaining OSS projects. The usual goals are related to market positioning, required upstream features development, and talent attraction or retention. Based on these goals, we should write down related questions that can be answered with numbers, like the following:

#### Who/how many are the core maintainers of my OSS ecosystem projects?

![Uber OSS code core, regular, and casual contributors evolution. Source: uber.biterg.io][18]

Uber OSS code core, regular, and casual contributors evolution. Source: uber.biterg.io

People contribute through different mechanisms or tools (code, issues, comments, tests, etc.). Measuring the core contributors (those that have done 80% of the contributions), the regular ones (those that have done 15% of the contributions), and the casual ones (those have made 5% of the contributions) can answer questions related to participation over time, but also how people move between the different buckets. Adding affiliation information helps to identify external core contributors.

#### Where are the contributions happening?

![Uber OSS activity based on location. Source: uber.biterg.io][19]

Uber OSS activity based on location. Source: uber.biterg.io

The growth of OSS ecosystems is also related to OSS projects spread across the world. Understanding that spread helps OSPO, and the company, to manage actions that improve support for people from different countries and regions.

#### What is the company's OSS network?

![Uber OSS network. Source: uber.biterg.io][20]

Uber OSS network. Source: uber.biterg.io

The company's OSS ecosystem includes those projects that the company's people contribute to. Understanding which projects they contribute to offers insight into which technologies or OSS components are interesting to people, and which companies or organizations the company collaborates with.

#### How is the company dealing with contributions?

![Github Pull Requests backlog management index and time to close analysis. Source: uber.biterg.io][21]

Github Pull Requests backlog management index and time to close analysis. Source: uber.biterg.io

One of the goals when releasing OSS projects is to grow the community around them. Measuring how the company handles contributions to its projects from outside its boundaries helps to understand how "welcoming" it is and identifies mentors (or bottlenecks) and opportunities to lower the barrier to contribute.

#### Consumers vs. maintainers

Over the last months, we have been hearing that corporations are taking OSS for free without contributing back. The typical arguments are that these corporations are making millions of dollars thanks to free work, plus the issue of OSS project maintainer burnout due to users' complaints and requests for free support.

The system is unbalanced; usually, the number of users exceeds the number of maintainers. Is that good or bad? Having users for our software is (or should be) good. But we need to manage expectations on both sides.

From the corporation's point of view, consuming OSS without care is very, very risky.

OSPO can play an important role in educating the company about the risks they are facing, and how to reduce them by contributing back to their OSS ecosystem. Remember, a company's overall sustainability could rely heavily on its ecosystem sustainability.

A good strategy is to start shifting your company from being pure OSS consumers to becoming contributors to their OSS inbound projects. From just submitting issues and asking questions to help solve issues, answering questions, and even sending patches, contributing helps grow and maintain the project while giving back to the community. It doesn't happen immediately, but over time, the company will be perceived as an OSS ecosystem citizen. Eventually, some people from the company could end up helping to maintain those projects too.

And what about money? There are plenty of ways to support the OSS ecosystem financially. Some examples:

  * Business initiatives like [Tidelift][22], or [OpenCollective][23]
  * Foundations and their supporting mechanisms, like [Software Freedom Conservancy][24], or [CommunityBridge][25] from the Linux Foundation
  * Self-funding programs (like [Indeed][26] and [Salesforce][27] have done)
  * Emerging gig development approaches like [Github Sponsors][28] or [Patreon][29]



Last but not least, companies need to avoid the "not invented here" syndrome. For some OSS projects, there might be companies providing consulting, customization, maintenance, and/or support services. Instead of taking OSS and spending time and people to self-host, self-customize, or try to bring those kinds of services in-house, it might be smarter and more efficient to hire some of those companies to do the thought work.

As a final remark, I would like to emphasize the importance of an OSPO for a company to succeed and grow in the current market. As shepherds of the company's OSS ecosystem, they are the best people in the organization to understand how the ecosystem works and flows, and they should be empowered to manage, monitor, and make recommendations and decisions to ensure sustainability and growth.

Does your organization have an OSPO yet?

Six common traits of successful open source programs, and a look back at how the open source...

Why would a company not in the business of software development create an open source program...

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/5/open-source-program-office

作者：[J. Manrique Lopez de la Fuente][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jsmanrique
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/meeting_discussion_brainstorm.png?itok=7_m4CC8S (community team brainstorming ideas)
[2]: https://opensource.com/sites/default/files/uploads/ospo_1.png (OSS inbound and outbound processes)
[3]: https://todogroup.org/
[4]: https://todogroup.org/guides/
[5]: https://chaoss.community/
[6]: https://chaoss.community/metrics/
[7]: https://github.com/chaoss/wg-common
[8]: https://github.com/chaoss/wg-diversity-inclusion
[9]: https://github.com/chaoss/wg-evolution
[10]: https://github.com/chaoss/wg-risk
[11]: https://github.com/chaoss/wg-value
[12]: https://github.com/chaoss/augur
[13]: https://github.com/cregit
[14]: https://chaoss.github.io/grimoirelab/
[15]: https://cauldron.io/
[16]: https://opensource.com/sites/default/files/uploads/ospo_2.png (CHAOSS Metrics for 15 years of Unity OSS activity. Source: cauldron.io)
[17]: https://en.wikipedia.org/wiki/GQM
[18]: https://opensource.com/sites/default/files/uploads/ospo_3.png (Uber OSS code core, regular, and casual contributors evolution. Source: uber.biterg.io)
[19]: https://opensource.com/sites/default/files/uploads/ospo_4.png (Uber OSS activity based on location. Source: uber.biterg.io)
[20]: https://opensource.com/sites/default/files/uploads/ospo_5_0.png (Uber OSS network. Source: uber.biterg.io)
[21]: https://opensource.com/sites/default/files/uploads/ospo_6.png (Github Pull Requests backlog management index and time to close analysis. Source: uber.biterg.io)
[22]: https://tidelift.com/
[23]: https://opencollective.com/
[24]: https://sfconservancy.org/
[25]: https://funding.communitybridge.org/
[26]: https://engineering.indeedblog.com/blog/2019/02/sponsoring-osi/
[27]: https://sustain.codefund.fm/23
[28]: https://help.github.com/en/github/supporting-the-open-source-community-with-github-sponsors
[29]: https://www.patreon.com/

[#]: subject: "Open source DevOps tools in a platform future"
[#]: via: "https://opensource.com/article/22/10/open-source-devops-tools"
[#]: author: "Will Kelly https://opensource.com/users/willkelly"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Open source DevOps tools in a platform future
======

The open source roots of DevOps tools are undeniable, even with a prediction that the global DevOps market will reach $17.8 billion by 2026. The changing world of work, security, and compliance concerns, along with venture capital firms, are pushing the market to DevOps platforms where development teams can access a complete end-to-end DevOps toolchain in the cloud.

### The current state of open source DevOps tools

Let's get one thing straight: There's no way open source tools will disappear from the DevOps world. Right now, there's a balance between open source and vendor DevOps tools, with developers using what works for them. Indeed, there are plenty of cases when a development team chooses an open source tool for their DevOps pipeline only to upgrade later to a commercial version.

### 3 examples of open source DevOps tools

Here are some examples of open source DevOps tools with a commercial business built around them.

#### Git

[Git][1]–the source code management tool–is probably one of the main foundations for DevOps toolchains serving as a source code repository.

The two best commercial examples of Git are GitLab and GitHub. GitLab [accepts contributions][2] to its open source project. GitHub is embarking on an effort to become a DevOps platform as well with the launch of GitHub Copilot–an AI pair programmer–launching to mixed reviews and criticism from some open source groups.

#### Jenkins

An open source automation server, Jenkins is prized for its easy installation, configuration, and extensibility.

CloudBees offers JenkinsX, an open-source solution that provides automated continuous integration and continuous delivery (CI/CD) and automated testing tools for cloud-native applications on Kubernetes. They also provide commercial support for JenkinsX, including:

- Access to CloudBees technical expertise
- 24x7 technical support
- Access to CloudBees documentation and online knowledge base

#### Kubernetes

The growth of [Kubernetes][3] is undeniable as more organizations seek an enterprise-grade container orchestration solution. Despite criticisms about its complexity, Kubernetes

There's an entire burgeoning industry around Kubernetes, and with good reason. According to Allied Market Research, the global container and [Kubernetes security][4] market was valued at $714 million in 2020 and is projected to reach $8242 million by 2030.

### DevOps toolchains today

There are still plenty of build-your-own (BYO) CI/CD toolchains in play across industries. The open source projects powering DevOps functions are still prospering,

BYO toolchains are integration-ready and very extensible, which has always been a strength for organizations continuing to iterate on their DevOps practices. The lack of a standard bill of materials might prove troublesome in enterprises seeking standardization for business, IT, and security reasons.

While the advent of DevOps platforms isn't going unnoticed, many organizations migrated their CI/CD toolchains to the public cloud well before the pandemic. The security of the toolchain itself has long been a rising concern, and public cloud infrastructure provides Identity Access Management (IAM) and other security features to control access.

### DevOps platforms: Friend or foe?

A DevOps platform is an end-to-end solution that places all functions of the CI/CD toolchain into the cloud. Examples of DevOps platforms include GitLab and Harness. GitHub is also making moves to become a DevOps platform in its own right.

#### Advantages (even if only in the eyes of enterprise buyers)

DevOps platforms are attractive to enterprise buyers who are already comfortable with the consumption-based and subscription-based pricing of the SaaS and cloud industries. Concerns about maintenance, security, compliance, and developer productivity are certainly at the top of mind for technology leaders in this remote and hybrid work world. Standardizing on a DevOps platform becomes an appealing story to these people.

#### Disadvantages

Age-old concerns about vendor lock-in come to mind when depending on a vendor for a DevOps toolchain. The extensibility of development teams building and maintaining their toolchains isn't going to be quite the experience as it was when they made their toolchains from scratch, much less bringing in new tools to improve their workflows.

There are also potential economic disadvantages with DevOps platform providers. Think what might happen to an overvalued DevOps tools startup that doesn't meet its investors' lofty financial goals. Likewise, there could be smaller startup vendors that may not receive their next round of funding and fade away into irrelevance.

While the advent of a DevOps platform makes sense in many ways, it does work against the open source ethos that has helped build the DevOps tools we use today.

### DevOps tools: An inflection point

Security and compliance concerns for DevOps toolchains continue to mount as working models change. It's only natural.

#### The changing world of work

How we work affects DevOps teams just like the rest of the enterprise. Remote and hybrid DevOps teams require secure toolchains. Changing collaboration and reporting requirements across the pipelines are also growing necessities, such as asynchronous work and executives demanding a return to the office.

#### Software supply chain security market

The software supply chain security market draws much attention after high-profile attacks and the federal government response. No organization has yet to blame open source for a software supply chain attack, but we're going to see an extension of DevOps/DevSecOps practices and tools to combat this threat. When it's all said and done, though, DevOps/DevSecOps tools and practices will outlast some startups that pivoted to the trend.

### Final thoughts

It's far from game over for OSS projects in the DevOps space, but DevOps stakeholders have a right to start asking questions about the toolchains of the future. However, OSS DevOps projects do need to consider their future, especially in light of growing security and compliance concerns that directly impact pipelines.

There's a future of coopetition where the DevOps platform providers donate time, money, and resources to the open source tools that serve as a foundation for their platforms. An interesting example of a potential future is [OpsVerse][5], which offers a DevOps platform with open source tools they manage for their customers.

Then again, there's also a future where the open source DevOps tools projects continue to prosper and innovate as more enterprise-built toolchains migrate to the cloud in more significant numbers.

**[ Kickstart an organizational culture change. Read the first article in a series, [DevSecOps: 5 tips for seeding a culture transformation][6] ]**

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/10/open-source-devops-tools

作者：[Will Kelly][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/willkelly
[b]: https://github.com/lkxed
[1]: https://opensource.com/article/22/4/our-favorite-git-commands
[2]: https://opensource.com/article/19/9/how-contribute-gitlab
[3]: https://opensource.com/resources/what-is-kubernetes
[4]: https://enterprisersproject.com/article/2019/1/kubernetes-security-4-tips-manage-risks?intcmp=7013a000002qLH8AAM
[5]: https://www.opsverse.io/
[6]: https://www.redhat.com/architect/devsecops-culture?intcmp=7013a000002qLH8AAM

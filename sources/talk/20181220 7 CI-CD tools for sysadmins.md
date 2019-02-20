[#]: collector: (lujun9972)
[#]: translator: (jdh8383)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (7 CI/CD tools for sysadmins)
[#]: via: (https://opensource.com/article/18/12/cicd-tools-sysadmins)
[#]: author: (Dan Barker https://opensource.com/users/barkerd427)

7 CI/CD tools for sysadmins
系统管理员的 7 个 CI/CD 工具
======
An easy guide to the top open source continuous integration, continuous delivery, and continuous deployment tools.
一篇简单指南:常见的开源持续集成、持续交付和持续部署工具。
![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/cicd_continuous_delivery_deployment_gears.png?itok=kVlhiEkc)

Continuous integration, continuous delivery, and continuous deployment (CI/CD) have all existed in the developer community for many years. Some organizations have involved their operations counterparts, but many haven't. For most organizations, it's imperative for their operations teams to become just as familiar with CI/CD tools and practices as their development compatriots are.
虽然持续集成、持续交付和持续部署（CI/CD）在开发者社区里已经存在很多年，一些机构在运维部门也有实施，但大多数公司并没有做这样的尝试。对于很多机构来说，让运维团队能够像他们的开发同行一样熟练操作 CI/CD 工具，已经变得十分必要了。

CI/CD practices can equally apply to infrastructure and third-party applications and internally developed applications. Also, there are many different tools but all use similar models. And possibly most importantly, leading your company into this new practice will put you in a strong position within your company, and you'll be a beacon for others to follow.
无论是基础设施、第三方应用还是内部开发应用，都可以开展 CI/CD 实践。尽管你会发现有很多不同的工具，但它们都有相似的设计模型。而且可能最重要的一点是：通过带领你的公司进行这些实践，会让你在公司内部变得举足轻重，成为他人学习的榜样。

Some organizations have been using CI/CD practices on infrastructure, with tools like [Ansible][1], [Chef][2], or [Puppet][3], for several years. Other tools, like [Test Kitchen][4], allow tests to be performed on infrastructure that will eventually host applications. In fact, those tests can even deploy the application into a production-like environment and execute application-level tests with production loads in more advanced configurations. However, just getting to the point of being able to test the infrastructure individually is a huge feat. Terraform can also use Test Kitchen for even more [ephemeral][5] and [idempotent][6] infrastructure configurations than some of the original configuration-management tools. Add in Linux containers and Kubernetes, and you can now test full infrastructure and application deployments with prod-like specs and resources that come and go in hours rather than months or years. Everything is wiped out before being deployed and tested again.
一些机构在自己的基础设施上已有多年的 CI/CD 实践经验，常用的工具包括 [Ansible][1]、[Chef][2] 或者 [Puppet][3]。另一些工具，比如 [Test Kitchen][4]，允许在用于生产的基础设施上运行测试。事实上，如果使用更高级的配置方法，你甚至可以将应用部署到有真实负载的仿真“生产环境”上，来运行应用级别的测试。然而，单单是能够测试基础设施就是一项了不起的成就了。配置管理工具 Terraform 可以通过 Test Kitchen 来快速创建可复用的基础设施配置，这比它的前辈要强不少。再加上 Linux 容器和 Kubernetes，在数小时内，你就可以创建一套类似于生产环境的配置参数和系统资源，来测试整个基础设施和其上部署的应用，这在以前可能需要花费几个月的时间。而且，删除和再次创建整个测试环境也非常容易。

However, you can also focus on getting your network configurations or database data definition language (DDL) files into version control and start running small CI/CD pipelines on them. Maybe it just checks syntax or semantics or some best practices. Actually, this is how most development pipelines started. Once you get the scaffolding down, it will be easier to build on. You'll start to find all kinds of use cases for pipelines once you get started.
当然，你也可以把网络配置和 DDL（数据定义语言）文件加入版本控制，然后开始尝试一些简单的 CI/CD 流程。虽然只能帮你检查一下语义语法，但实际上大多数开发管道（pipeline）都是这样起步的。只要你把脚手架搭起来，建造就容易得多了。而一旦起步，你就会发现各种真实的使用场景。

For example, I regularly write a newsletter within my company, and I maintain it in version control using [MJML][7]. I needed to be able to host a web version, and some folks liked being able to get a PDF, so I built a [pipeline][8]. Now when I create a new newsletter, I submit it for a merge request in GitLab. This automatically creates an index.html with links to HTML and PDF versions of the newsletter. The HTML and PDF files are also created in the pipeline. None of this is published until someone comes and reviews these artifacts. Then, GitLab Pages publishes the website and I can pull down the HTML to send as a newsletter. In the future, I'll automatically send the newsletter when the merge request is merged or after a special approval step. This seems simple, but it has saved me a lot of time. This is really at the core of what these tools can do for you. They will save you time.
举个例子，我经常会在公司内部写新闻简报，我使用 [MJML][7] 制作邮件模板，然后把它加入版本控制。我一般会维护一个 web 版本，但是一些同事喜欢 PDF 版，于是我创建了一个[管道][8]。每当我写好一篇新闻稿，就在 Gitlab 上提交一个合并请求。这样做会自动创建一个 index.html 文件，生成这篇新闻稿的 HTML 和 PDF 版链接。HTML 和 PDF 文件也会在管道里同时生成。这些文件不会被直接发布出去，除非有人来检查确认。GitLab Pages 发布这个网站后，我就可以下载一份 HTML 版，用来发送新闻简报。未来，我会修改这个流程，当合并请求通过或者在特殊的审核步骤后，自动发出对应的新闻稿。这些处理逻辑并不复杂，但的确为我节省了不少时间。实际上这些工具最核心的用途就是替你节省时间。

The key is creating tools to work in the abstract so that they can apply to multiple problems with little change. I should also note that what I created required almost no code except [some light HTML templating][9], some [node to loop through the HTML files][10], and some more [node to populate the index page with all the HTML pages and PDFs][11].
关键是要在抽象层创建出工具，这样它们稍加修改就可以处理不同的问题。值得留意的是，我创建的这套流程几乎不需要任何代码，除了一些[轻量级的 HTML 模板][9]，一些[把 HTML 文件转换成 PDF 的 nodejs 代码][10]，还有一些[生成 index 页面的 nodejs 代码][11]。

Some of this might look a little complex, but most of it was taken from the tutorials of the different tools I'm using. And many developers are happy to work with you on these types of things, as they might also find them useful when they're done. The links I've provided are to a newsletter we plan to start for [DevOps KC][12], and all the code for creating the site comes from the work I did on our internal newsletter.
这其中一些东西可能看起来有点复杂，但其中大部分都源自我使用的不同工具的教学文档。而且很多开发人员也乐意跟你合作干这些事，因为他们在完工时会发现这些东西也挺有用。上面我提供的那些代码链接是给 [DevOps KC][12]（一个地方性DevOps组织） 发送新闻简报用的，其中大部分用来创建网站的代码来自我在内部新闻简报项目上所作的工作。

Many of the tools listed below can offer this type of interaction, but some offer a slightly different model. The emerging model in this space is that of a declarative description of a pipeline in something like YAML with each stage being ephemeral and idempotent. Many of these systems also ensure correct sequencing by creating a [directed acyclic graph][13] (DAG) over the different stages of the pipeline.
下面列出的大多数工具都可以提供这种类型的交互，但是有些工具提供的模型略有不同。这一领域新兴的模型是用声明性的语言如 YAML 来描述一个管道，其中的每个阶段都是短暂而幂等的。许多系统还会创建[有向无环图（DAG）][13]，来确保管道上不同的阶段能正确排序。

These stages are often run in Linux containers and can do anything you can do in a container. Some tools, like [Spinnaker][14], focus only on the deployment component and offer some operational features that others don't normally include. [Jenkins][15] has generally kept pipelines in an XML format and most interactions occur within the GUI, but more recent implementations have used a [domain specific language][16] (DSL) using [Groovy][17]. Further, Jenkins jobs normally execute on nodes with a special Java agent installed and consist of a mix of plugins and pre-installed components.
这些阶段一般运行在 Linux 容器里，和普通的容器没有区别。有一些工具，比如 [Spinnaker][14]，只关注部署组件而且提供一些其他工具没有的操作特性。[Jenkins][15] 通常把管道配置存成 XML 格式，大部分交互都可以在图形界面里完成，但最新的方案是使用 [领域专用语言（DSL）][16] 如[Groovy][17]。并且，Jenkins 的任务（job）通常运行在各个节点里，这些节点会装一个专门的 Java 程序还有一堆混杂的插件和预装组件。

Jenkins introduced pipelines in its tool, but they were a bit challenging to use and contained several caveats. Recently, the creator of Jenkins decided to move the community toward a couple different initiatives that will hopefully breathe new life into the project—which is the one that really brought CI/CD to the masses. I think its most interesting initiative is creating a Cloud Native Jenkins that can turn a Kubernetes cluster into a Jenkins CI/CD platform.
Jenkins 在自己的工具里引入了管道的概念，但使用起来却并不轻松，甚至包含一些禁区。最近，Jenkins 的创始人决定带领社区向新的方向前进，希望能为这个项目注入新的活力，把 CI/CD 真正推广开(译者注：详见后面的 Jenkins 章节)。我认为其中最有意思的想法是构建一个云原生 Jenkins，能把 Kubernetes 集群转变成 Jenkins CI/CD 平台。

As you learn more about these tools and start bringing these practices into your company or your operations division, you'll quickly gain followers. You will increase your own productivity as well as that of others. We all have years of backlog to get to—how much would your co-workers love if you could give them enough time to start tackling that backlog? Not only that, but your customers will start to see increased application reliability, and your management will see you as a force multiplier. That certainly can't hurt during your next salary negotiation or when interviewing with all your new skills.
当你更多地了解这些工具并把实践带入你的公司和运维部门，你很快就会有追随者，因为你有办法提升自己和别人的工作效率。我们都有多年积累下来的技术债要解决，如果你能给同事们提供足够的时间来处理这些积压的工作，他们该会有多感激呢？不止如此，你的客户也会开始看到应用稳定性的提升，管理层会把你看作得力干将，你也会在下次谈薪资待遇或参加面试时更有底气。

Let's dig into the tools a bit more. We'll briefly cover each one and share links to more information.
让我们开始深入了解这些工具吧，我们将对每个工具做简短的介绍，并分享一些有用的链接。

### GitLab CI

GitLab is a fairly new entrant to the CI/CD space, but it's already achieved the top spot in the [Forrester Wave for Continuous Integration Tools][20]. That's a huge achievement in such a crowded and highly qualified field. What makes GitLab CI so great? It uses a YAML file to describe the entire pipeline. It also has a functionality called Auto DevOps that allows for simpler projects to have a pipeline built automatically with multiple tests built-in. This system uses [Herokuish buildpacks][21] to determine the language and how to build the application. Some languages can also manage databases, which is a real game-changer for building new applications and getting them deployed to production from the beginning of the development process. The system has native integrations into Kubernetes and will deploy your application automatically into a Kubernetes cluster using one of several different deployment methodologies, like percentage-based rollouts and blue-green deployments.
GitLab 可以说是 CI/CD 领域里新登场的玩家，但它却在 [Forrester（一个权威调研机构） 的调查报告][20]中位列第一。这在一个高水平、竞争激烈的领域里是个了不起的成就。是什么让 GitLab CI 这么成功呢？它使用 YAML 文件来描述整个管道。它还有一个功能叫做 Auto DevOps，可以为简单的工程自动生成管道，并且包含多种内置的测试单元。这套系统使用 [Herokuish buildpacks][21]来判断语言的种类以及如何构建应用。它和 Kubernetes 整合地很紧密，可以根据不同的方案将你的应用自动部署到 Kubernetes 集群，比如灰度发布、蓝绿部署等。

In addition to its CI functionality, GitLab offers many complementary features like operations and monitoring with Prometheus deployed automatically with your application; portfolio and project management using GitLab Issues, Epics, and Milestones; security checks built into the pipeline with the results provided as an aggregate across multiple projects; and the ability to edit code right in GitLab using the WebIDE, which can even provide a preview or execute part of a pipeline for faster feedback.
除了它的持续集成功能，GitLab 还提供了许多值得称赞的特性，比如：

### GoCD

GoCD comes from the great minds at Thoughtworks, which is testimony enough for its capabilities and efficiency. To me, GoCD's main differentiator from the rest of the pack is its [Value Stream Map][22] (VSM) feature. In fact, pipelines can be chained together with one pipeline providing the "material" for the next pipeline. This allows for increased independence for different teams with different responsibilities in the deployment process. This may be a useful feature when introducing this type of system in older organizations that intend to keep these teams separate—but having everyone using the same tool will make it easier later to find bottlenecks in the VSM and reorganize the teams or work to increase efficiencies.

It's incredibly valuable to have a VSM for each product in a company; that GoCD allows this to be [described in JSON or YAML][23] in version control and presented visually with all the data around wait times makes this tool even more valuable to an organization trying to understand itself better. Start by installing GoCD and mapping out your process with only manual approval gates. Then have each team use the manual approvals so you can start collecting data on where bottlenecks might exist.

### Travis CI

Travis CI was my first experience with a Software as a Service (SaaS) CI system, and it's pretty awesome. The pipelines are stored as YAML with your source code, and it integrates seamlessly with tools like GitHub. I don't remember the last time a pipeline failed because of Travis CI or the integration—Travis CI has a very high uptime. Not only can it be used as SaaS, but it also has a version that can be hosted. I haven't run that version—there were a lot of components, and it looked a bit daunting to install all of it. I'm guessing it would be much easier to deploy it all to Kubernetes with [Helm charts provided by Travis CI][26]. Those charts don't deploy everything yet, but I'm sure it will grow even more in the future. There is also an enterprise version if you don't want to deal with the hassle.

However, if you're developing open source code, you can use the SaaS version of Travis CI for free. That is an awesome service provided by an awesome team! This alleviates a lot of overhead and allows you to use a fairly common platform for developing open source code without having to run anything.

### Jenkins

Jenkins is the original, the venerable, de facto standard in CI/CD. If you haven't already, you need to read "[Jenkins: Shifting Gears][27]" from Kohsuke, the creator of Jenkins and CTO of CloudBees. It sums up all of my feelings about Jenkins and the community from the last decade. What he describes is something that has been needed for several years, and I'm happy CloudBees is taking the lead on this transformation. Jenkins will be a bit overwhelming to most non-developers and has long been a burden on its administrators. However, these are items they're aiming to fix.
Jenkins在 CI/CD 界绝对是元老级的存在，也是事实上的标准。我强烈建议你读一读这篇文章："[Jenkins: Shifting Gears][27]"，作者 Kohsuke 是 Jenkins 的创始人兼 CloudBees 公司 CTO。这篇文章总结了我在过去十年里对 Jenkins 及其社区的感受。他在文中阐述了一些这几年呼声很高的需求，我很乐意看到 CloudBees 引领这场变革。长期以来，Jenkins 对于非开发人员来说有点难以接受，并且一直是其管理员的重担。还好，这些问题正是他们想要着手解决的。

[Jenkins Configuration as Code][28] (JCasC) should help fix the complex configuration issues that have plagued admins for years. This will allow for a zero-touch configuration of Jenkins masters through a YAML file, similar to other CI/CD systems. [Jenkins Evergreen][29] aims to make this process even easier by providing predefined Jenkins configurations based on different use cases. These distributions should be easier to maintain and upgrade than the normal Jenkins distribution.
[Jenkins 配置既代码][28]（JCasC）应该可以帮助管理员解决困扰了他们多年的配置复杂性问题。与其他 CI/CD 系统类似，只需要修改一个简单的 YAML 文件就可以完成 Jenkins 主节点的配置工作。[Jenkins Evergreen][29] 的出现让配置工作变得更加轻松，它提供了很多预设的使用场景，你只管套用就可以了。这些发行版会比官方的标准版本 Jenkins 更容易维护和升级。

Jenkins 2 introduced native pipeline functionality with two types of pipelines, which [I discuss][30] in a LISA17 presentation. Neither is as easy to navigate as YAML when you're doing something simple, but they're quite nice for doing more complex tasks.
Jenkins 2 引入了两种原生的管道（pipeline）功能，我在 LISA（一个系统架构和运维大会） 2017 年的研讨会上已经[讨论过了][30]。这两种功能都没有 YAML 简便，但在处理复杂任务时它们很好用。

[Jenkins X][31] is the full transformation of Jenkins and will likely be the implementation of Cloud Native Jenkins (or at least the thing most users see when using Cloud Native Jenkins). It will take JCasC and Evergreen and use them at their best natively on Kubernetes. These are exciting times for Jenkins, and I look forward to its innovation and continued leadership in this space.
[Jenkins X][31] 是 Jenkins 的一个全新变种，用来实现云端原生 Jenkins（至少在用户看来是这样）。它会使用 JCasC 及 Evergreen，并且和 Kubernetes 整合的更加紧密。对于 Jenkins 来说这是个令人激动的时刻，我很乐意看到它在这一领域的创新，并且继续发挥领袖作用。

### Concourse CI

I was first introduced to Concourse through folks at Pivotal Labs when it was an early beta version—there weren't many tools like it at the time. The system is made of microservices, and each job runs within a container. One of its most useful features that other tools don't have is the ability to run a job from your local system with your local changes. This means you can develop locally (assuming you have a connection to the Concourse server) and run your builds just as they'll run in the real build pipeline. Also, you can rerun failed builds from your local system and inject specific changes to test your fixes.

Concourse also has a simple extension system that relies on the fundamental concept of resources. Basically, each new feature you want to provide to your pipeline can be implemented in a Docker image and included as a new resource type in your configuration. This keeps all functionality encapsulated in a single, immutable artifact that can be upgraded and modified independently, and breaking changes don't necessarily have to break all your builds at the same time.

### Spinnaker

Spinnaker comes from Netflix and is more focused on continuous deployment than continuous integration. It can integrate with other tools, including Travis and Jenkins, to kick off test and deployment pipelines. It also has integrations with monitoring tools like Prometheus and Datadog to make decisions about deployments based on metrics provided by these systems. For example, the canary deployment uses a judge concept and the metrics being collected to determine if the latest canary deployment has caused any degradation in pertinent metrics and should be rolled back or if deployment can continue.

A couple of additional, unique features related to deployments cover an area that is often overlooked when discussing continuous deployment, and might even seem antithetical, but is critical to success: Spinnaker helps make continuous deployment a little less continuous. It will prevent a stage from running during certain times to prevent a deployment from occurring during a critical time in the application lifecycle. It can also enforce manual approvals to ensure the release occurs when the business will benefit the most from the change. In fact, the whole point of continuous integration and continuous deployment is to be ready to deploy changes as quickly as the business needs to change.

### Screwdriver

Screwdriver is an impressively simple piece of engineering. It uses a microservices approach and relies on tools like Nomad, Kubernetes, and Docker to act as its execution engine. There is a pretty good [deployment tutorial][34] for deploying to AWS and Kubernetes, but it could be improved once the in-progress [Helm chart][35] is completed.

Screwdriver also uses YAML for its pipeline descriptions and includes a lot of sensible defaults, so there's less boilerplate configuration for each pipeline. The configuration describes an advanced workflow that can have complex dependencies among jobs. For example, a job can be guaranteed to run after or before another job. Jobs can run in parallel and be joined afterward. You can also use logical operators to run a job, for example, if any of its dependencies are successful or only if all are successful. Even better is that you can specify certain jobs to be triggered from a pull request. Also, dependent jobs won't run when this occurs, which allows easy segregation of your pipeline for when an artifact should go to production and when it still needs to be reviewed.

This is only a brief description of these CI/CD tools—each has even more cool features and differentiators you can investigate. They are all open source and free to use, so go deploy them and see which one fits your needs best.

### What to read next

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/12/cicd-tools-sysadmins

作者：[Dan Barker][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/barkerd427
[b]: https://github.com/lujun9972
[1]: https://www.ansible.com/
[2]: https://www.chef.io/
[3]: https://puppet.com/
[4]: https://github.com/test-kitchen/test-kitchen
[5]: https://www.merriam-webster.com/dictionary/ephemeral
[6]: https://en.wikipedia.org/wiki/Idempotence
[7]: https://mjml.io/
[8]: https://gitlab.com/devopskc/newsletter/blob/master/.gitlab-ci.yml
[9]: https://gitlab.com/devopskc/newsletter/blob/master/index/index.html
[10]: https://gitlab.com/devopskc/newsletter/blob/master/html-to-pdf.js
[11]: https://gitlab.com/devopskc/newsletter/blob/master/populate-index.js
[12]: https://devopskc.com/
[13]: https://en.wikipedia.org/wiki/Directed_acyclic_graph
[14]: https://www.spinnaker.io/
[15]: https://jenkins.io/
[16]: https://martinfowler.com/books/dsl.html
[17]: http://groovy-lang.org/
[18]: https://about.gitlab.com/product/continuous-integration/
[19]: https://gitlab.com/gitlab-org/gitlab-ce/
[20]: https://about.gitlab.com/2017/09/27/gitlab-leader-continuous-integration-forrester-wave/
[21]: https://github.com/gliderlabs/herokuish
[22]: https://www.gocd.org/getting-started/part-3/#value_stream_map
[23]: https://docs.gocd.org/current/advanced_usage/pipelines_as_code.html
[24]: https://docs.travis-ci.com/
[25]: https://github.com/travis-ci/travis-ci
[26]: https://github.com/travis-ci/kubernetes-config
[27]: https://jenkins.io/blog/2018/08/31/shifting-gears/
[28]: https://jenkins.io/projects/jcasc/
[29]: https://github.com/jenkinsci/jep/blob/master/jep/300/README.adoc
[30]: https://danbarker.codes/talk/lisa17-becoming-plumber-building-deployment-pipelines/
[31]: https://jenkins-x.io/
[32]: https://concourse-ci.org/
[33]: https://github.com/concourse/concourse
[34]: https://docs.screwdriver.cd/cluster-management/kubernetes
[35]: https://github.com/screwdriver-cd/screwdriver-chart

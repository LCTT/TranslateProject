将 Tuleap 用于软件项目管理
============================================================

> Tuleap 正在被 Eclipse 基金会使用，用来取代 Bugzilla

 ![Get to know Tuleap for project management](https://opensource.com/sites/default/files/styles/image-full-size/public/images/education/rh_003588_01_rd3os.combacktoschoolseriesk12_rh_021x_0.png?itok=kOixOaEU "Get to know Tuleap for project management") 

图片提供：opensource.com

Tuleap 是一个独特的开源项目管理工具，目前发展势头很好，现在，每个月它会出一个大版本。它还被列在 [2015 年五大开源项目管理工具][1]和 [2016 年十一个名列前茅项目管理工具][2]中。

Manuel Vacelet 是开发 Tuleap 项目的 Enalean 公司的联合创始人和 CTO，他说：“Tuleap 是一个完整用于托管软件项目的 GPLv2 平台，它提供了一个集中化的平台，在这里,团队可以找到他们所需的所有工具，追踪他们软件项目的生命周期。他们可以找到项目管理（Scrum、看板、瀑布、混合等等）、源码控制（git 和 svn）和代码审查（pull 请求和 gerrit）、持续集成、问题跟踪、wiki 和文档等的支持。”

在这次采访中，我会和 Manuel 讨论如何开始使用它，以及如何以开源方式管理 Tuleap。

**Nitish Tiwari（以下简称 NT）： 为什么 Tuleap 项目很重要？ **

**Manuel Vacelet（以下简称 MV）：** Tuleap 很重要是因为我们坚信一个成功的（软件）项目必须涉及所有利益相关者：开发人员、项目经理、QA、客户和用户。

很久以前，我还是一个 SourceForge 衍生项目的实习生（当时 SourceForge 还是一个自由开源项目），几年后它变成了 Tuleap。 我的第一个贡献是将 PhpWiki 集成到该工具中（不要告诉任何人，代码写的很糟）。

现在，我很高兴作为首席技术官和产品负责人在 Enalean 工作，该公司是 Tuleap 项目的主要贡献公司。

**NT：让我们聊聊技术方面。**

**MV：** Tuleap 核心系统是基于 LAMP 并且架构于 CentOS 之上。如今的开发栈是 AngularJS (v1)、REST 后端（PHP）、基于 NodeJS 的实时推送服务器。但如果你想成为一名 Tuleap 全栈开发人员，你还将需要接触 bash、Perl、Python、Docker、Make 等等。

说到技术方面，需要重点强调的 Tuleap 的一个显著特征是它的可扩展性。一个运行在单服务器上的 Tuleap 单一实例、并且没有复杂的 IT 架构，可以处理超过 10000 人的访问。

**NT：给我们说下该项目的用户和社区。有谁参与？他们如何使用这个工具？**

**MV：** 用户非常多样化。从使用 Tuleap 跟踪他们的项目进度并管理他们的源代码的小型初创公司，到非常大的公司，如法国电信运营商 Orange，它为超过 17000 用户部署了它，并托管了 5000 个项目。

许多用户依靠 Tuleap 来促进敏捷项目并跟踪其进度。开发人员和客户共享同一个工作区。客户不需要学习如何使用 GitHub，也不需要开发人员做额外的工作，就可以将其工作转换到“客户可访问”平台。

今年，Tuleap 被 [Eclipse 基金会][3]所使用，取代了 Bugzilla。

印度电子信息技术部使用 Tuleap 创建了印度政府开放电子政务的开放式协作开发平台。

Tuleap 有多种不同的使用方式和配置。有些人使用它作为 Drupal 客户门户网站的后端; 它们通过 REST API 插入到 Tuleap 中以管理 bug 和服务请求。

甚至一些建筑师也使用它来管理他们的工作进度和 AutoCAD 文件。

**NT：Tuleap 是否做了一些特别的事，使社区更安全，更多样化？**

**MV：** 我们还没有创建“行为准则”；本社区非常平和而欢迎新人，但我们有计划这样做。Tuleap 的开发人员和贡献者来自不同的国家（例如加拿大、突尼斯、法国）。而且 35％ 的活跃开发者和贡献者是女性。

**NT：由社区提议的 Tuleap 功能的百分比是多少？**

**MV：** 几乎 100％ 的功能是由社区驱动的。

这是 Enalean 的关键挑战之一：找到一种商业模式，使我们能以正确的方式做开源软件。对我们来说，“开放核心”模式（其中应用程序的核心是开放的，但有趣和有用的部分是封闭源的）不是正确的方法，因为你最终还是要依赖闭源。因此，我们发明了 [OpenRoadmap][4]，这种方式是我们从社区和最终用户那里收集需求，并找公司来为此买单。


--------------------------------------------------------------------------------

作者简介：

![](https://opensource.com/sites/default/files/styles/profile_pictures/public/nitish-crop.png?itok=h4PaLDQq)

Nitish 是一名专业的软件开发人员并对开源有热情。作为一本基于 Linux 的杂志的技术作者，他会尝试新的开源工具。他喜欢阅读和探索任何开源相关的事情。在他的空闲时间，他喜欢读励志书。他目前正在构建 DevUp - 一个让开发人员以真正的方式连接所有工具和拥抱 DevOps 的平台。你可以在 Twitter 上关注他 @tiwari_nitish。

--------------------------------------------------------------------------------

via: https://opensource.com/article/17/1/interview-Tuleap-project

作者：[Nitish Tiwari][a]
译者：[geekpi](https://github.com/geeki)
校对：[jamsinepeng](https://github.com/jasminepeng)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/tiwarinitish86
[1]:https://opensource.com/business/15/1/top-project-management-tools-2015
[2]:https://opensource.com/business/16/3/top-project-management-tools-2016
[3]:http://www.eclipse.org/
[4]:https://blog.enalean.com/enalean-open-roadmap-how-it-works/

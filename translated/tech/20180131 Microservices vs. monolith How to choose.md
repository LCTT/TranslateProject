微服务 vs. 整体服务：如何选择
============================================================

### 任何一种架构都是有利有弊的，而能满足你组织的独特需要的决策才是正确的选择。


![Microservices vs. monolith: How to choose](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/building_architecture_design.jpg?itok=lB_qYv-I "Microservices vs. monolith: How to choose")
Image by : 

Onasill ~ Bill Badzo on [Flickr][11]. [CC BY-NC-SA 2.0][12]. Modified by Opensource.com.

对于许多初创公司来说，传统的知识认为，从单一整体架构开始，而不是使用微服务。但是，我们还有别的选择吗？

这本新书 —— [初创公司的微服务][13]，从许多 CIO 们理解的微服务的角度，解释了微服务的优点与缺点。

对于初创公司，虽然不同的 CTO 对此给出的建议是不同的，但是他们都一致认为环境和性能很重要。如果你正考虑你的业务到底是采用微服务还是单一整体架构更好，下面讨论的这些因素正好可以为你提供一些参考。

### 理解范围

更多有关微服务的内容

*   [如何向你的 CEO 解释微服务][1]

*   [免费电子书：微服务 vs. 面向服务的架构][2]

*   [DevOps 确保微服务安全][3]

首先，我们先来准确定义我们所谓的 “整体服务” 和 “微服务” 是什么。

微服务是一种方法，它开发一个单一的应用程序来作为构成整体服务的小服务，每个小服务都运行在它自己的进程中，并且使用一个轻量级的机制进行通讯，通常是一个 HTTP 资源 API。这些服务都围绕业务能力来构建，并且可依赖全自动部署机制来独立部署。

一个整体应用程序是按单个的、统一的单元来构建，并且，通常情况下它是基于一个大量的代码来实现的。一般来说，一个整体服务是由三部分组成的：一个数据库、一个客户端用户界面（由 HTML 页面和/或运行在浏览器中的 JavaScript 组成）、以及一个服务器端应用程序。

“系统架构处于一个范围之中”，Zachary Crockett，[Particle][14] 的 CTO，在一次访谈中，他说，”在讨论微服务时，人们倾向于关注这个范围的一端：许多极小的应用程序给其它应用程序传递了过多的信息。在另一端，有一个巨大的整体服务做了太多的事情。在任何现实中的系统上，在这两个极端之间有很多合适的面向服务的架构“。

根据你的情况不同，不论是使用整体服务还是微服务都有很多很好的理由。

"我们希望为每个服务使用最好的工具”，Julien Lemoine 说，他是 Algolia 的 CTO。

与很多人的想法正好相反，整体服务并不是过去遗留下来的过时的架构。在某些情况下，整体服务是非常理想的。我采访了 Steven Czerwinski 之后，更好地理解了这一点，他是 [Scaylr][15] 的工程主管，前谷歌员工。

“尽管我们在谷歌时有使用微服务的一些好的经验，我们现在 [在 Scalyr] 却使用的是整体服务的架构，因为一个整体服务架构意味着我们的工作量更少，我们只有两位工程师。“ 他解释说。（采访他时，Scaylr 正处于早期阶段）

但是，如果你的团队使用微服务的经验很丰富，并且你对你们的发展方向有明确的想法，微服务可能是一个很好的 替代者。

Julien Lemoine，[Algolia][16] 的 CTO，在这个问题上，他认为：”我们通常从使用微服务开始，主要目的是我们可以使用不同的技术来构建我们的服务，因为如下的两个主要原因：

*   我们想为每个服务使用最好的工具。我们的搜索 API 是在底层做过高度优化的，而 C++ 是非常适合这项工作的。他说，在任何地方都使用 C++ 是一种生产力的浪费，尤其是在构建仪表板方面。

*   我们希望使用最好的人才，而只使用一种技术将极大地限制我们的选择。这就是为什么在公司中有不同语言的原因。“

如果你的团队已经准备好从一开始就使用微服务，这样你的组织从一开始就可以适应微服务环境的开发节奏。

### 权衡利弊

在你决定那种方法更适合你的组织之前，考虑清楚每种方法的优缺点是非常重要的。

### 整体服务

### 优点：

*   **很少担心横向联系：** 大多数应用程序开发者都担心横向联系，比如，日志、速度限制、以及像审计跟踪和 DoS 防护这样的安全特性。当所有的东西都运行在同一个应用程序中时，通过组件钩子来处理这些关注点就非常容易了。

*   **运营开销很少：** 只需要为一个应用程序设置日志、监视、以及测试。一般情况下，部署也相对要简单。

*   **性能：** 一个整体的架构可能会有更好的性能，因为共享内存的访问速度要比进程间通讯（IPC）更快。

### 缺点：

*   **紧耦合：** 整体服务的应用程序倾向于紧耦合，并且应用程序是整体进化，分离特定用途的服务是非常困难的，比如，独立扩展或者代码维护。

*   **理解起来很困难：** 当你想查看一个特定的服务或者控制器时，因为依赖、副作用、和其它的不可预见因素，整体架构理解起来更困难。

### 微服务

### 优点：

*   **非常好组织：** 微服务架构一般很好组织它们，因为每个微服务都有一个特定的工作，并且还不用考虑其它组件的工作。

*   **解耦合：** 解耦合的服务是能够非常容易地进行重组织和重配置，以服务于不同的应用程序（比如，同时向 Web 客户端和公共 API 提供服务）。它们在一个大的集成系统中，也允许快速、独立分发单个部分。

*   **性能：** 根据组织的情况，微服务可以提供更好的性能，因为你可以分离热点服务，并根据其余应用程序的情况来扩展它们。

*   **更少的错误：** 微服务允许系统中的不同部分，在维护良好边界的前提下进行并行开发。这样将使连接不该被连接的部分变得更困难，比如，需要连接的那些紧耦合部分。

### 缺点：

*   **跨每个服务的横向联系点：** 由于你构建了一个新的微服务架构，你可能会发现在设计时没有预料到的很多横向联系的问题。这也将导致需要每个横向联系点的独立模块（比如，测试）的开销增加，或者在其它服务层面因封装横向联系点，所导致的所有流量都需要路由。最终，即便是整体服务架构也倾向于通过横向联系点的外部服务层来路由流量，但是，如果使用整体架构，在项目更加成熟之前，也不过只是推迟了工作成本。

*   **更高的运营开销：** 微服务在它所属的虚拟机或容器上部署非常频繁，导致虚拟机争用激增。这些任务都是使用容器管理工具进行频繁的自动化部署的。

### 决策时刻

当你了解了每种方法的利弊之后，如何在你的初创公司使用这些信息？通过与这些 CTO 们的访谈，这里有三个问题可以指导你的决策过程：

**你是在熟悉的领域吗？**

如果你的团队有以前的一些领域的经验（比如，电子商务）和了解你的客户需求，那么分割成微服务是低风险的。如果你从未做过这些，从另一个角度说，整体服务或许是一个更安全的选择。

**你的团队做好准备了吗？**

你的团队有使用微服务的经验吗？如果明年，你的团队扩充到现在的四倍，将为微服务提供更好的环境？评估团队大小对项目的成功是非常重要的。

**你的基础设施怎么样？**

实施微服务，你需要基于云的基础设施。

David Strauss，[Pantheon][17] 的 CTO，他解释说："[以前]，你使用整体服务是因为，你希望部署在一个数据库上。每个单个的微服务都需要配置数据库服务器，然后，扩展它将是一个很重大的任务。只有大的、技术力量雄厚的组织才能做到。现在，使用像谷歌云和亚马逊 AWS 这样的云服务，为部署一个小的东西而不需要为它们中的每个都提供持久存储，对于这种需求你有很多的选择。“

### 评估业务风险

技术力量雄厚的初创公司为追求较高的目标，可以考虑使用微服务。但是微服务可能会带来业务风险。Strauss 解释说，”许多团队一开始就过度构建他们的项目。每个人都认为，他们的公司会成为下一个 “独角兽”，因此，他们使用微服务构建任何一个东西，或者一些其它的高扩展性的基础设施。但是这通常是一种错误的做法“。Strauss 说，在那种情况下，他们认为需要扩大规模的领域往往并不是一开始真正需要扩展的领域，最后的结果是浪费了时间和努力。

### 态势感知

最终，环境是关键。以下是一些来自 CTO 们的提示：

#### 什么时候使用整体服务

*   **你的团队还在创建阶段：** 你的团队很小 —— 也就是说，有 2 到 5 位成员 —— 还无法应对大范围、高成本的微服务架构。

*   **你正在构建的是一个未经证实的产品或者概念验证：** 如果你将一个全新的产品推向市场，随着时间的推移，它有可能会成功，而对于一个快速迭代的产品，整体架构是最合适的。这个提示也同样适用于概念验证，你的目标是尽可能快地学习，即便最终你可能会放弃它。

*   **你没有使用微服务的经验：** 除非你有合理的理由证明早期学习阶段的风险可控，否则，一个整体的架构更适用于一个没有经验的团队。

#### 什么时候开始使用微服务

*   **你需要快速、独立的分发服务：** 微服务允许在一个大的集成系统中快速、独立分发单个部分。请注意，根据你的团队规模，获取与整体服务的比较优势，可能需要一些时间。

*   **你的平台中的某些部分需要更高效：** 如果你的业务要求集中处理 PB 级别的日志卷，你可能需要使用一个像 C++ 这样的更高效的语言来构建这个服务，尽管你的用户仪表板或许还是用 [Ruby on Rails][5] 构建的。

*   **计划扩展你的团队：** 使用微服务，将让你的团队从一开始就开发独立的小服务，而服务边界独立的团队更易于按需扩展。

要决定整体服务还是微服务更适合你的组织，要坦诚并正确认识自己的环境和能力。这将有助于你找到业务成长的最佳路径。

### 主题

 [微服务][21]、 [DevOps][22]

### 关于作者

 [![](https://opensource.com/sites/default/files/styles/profile_pictures/public/pictures/profile_15.jpg?itok=EaSRMCN-)][18] jakelumetta - Jake 是 ButterCMS 的 CEO，它是一个 [API-first CMS][6]。他喜欢搅动出黄油双峰，以及构建让开发者工作更舒适的工具，喜欢他的更多内容，请在 Twitter 上关注 [@ButterCMS][7]，订阅 [他的博客][8]。[关于他的更多信息][9]

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/1/how-choose-between-monolith-microservices

作者：[jakelumetta ][a]
译者：[qhwdw](https://github.com/qhwdw)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/jakelumetta
[1]:https://blog.openshift.com/microservices-how-to-explain-them-to-your-ceo/?intcmp=7016000000127cYAAQ&amp;src=microservices_resource_menu1
[2]:https://www.openshift.com/promotions/microservices.html?intcmp=7016000000127cYAAQ&amp;src=microservices_resource_menu2
[3]:https://opensource.com/business/16/11/secured-devops-microservices?src=microservices_resource_menu3
[4]:https://opensource.com/article/18/1/how-choose-between-monolith-microservices?rate=tSotlNvwc-Itch5fhYiIn5h0L8PcUGm_qGvqSVzu9w8
[5]:http://rubyonrails.org/
[6]:https://buttercms.com/
[7]:https://twitter.com/ButterCMS
[8]:https://buttercms.com/blog/
[9]:https://opensource.com/users/jakelumetta
[10]:https://opensource.com/user/205531/feed
[11]:https://www.flickr.com/photos/onasill/16452059791/in/photolist-r4P7ci-r3xUqZ-JkWzgN-dUr8Mo-biVsvF-kA2Vot-qSLczk-nLvGTX-biVxwe-nJJmzt-omA1vW-gFtM5-8rsk8r-dk9uPv-5kja88-cv8YTq-eQqNJu-7NJiqd-pBUkk-pBUmQ-6z4dAw-pBULZ-vyM3V3-JruMsr-pBUiJ-eDrP5-7KCWsm-nsetSn-81M3EC-pBURh-HsVXuv-qjgBy-biVtvx-5KJ5zK-81F8xo-nGFQo3-nJr89v-8Mmi8L-81C9A6-qjgAW-564xeQ-ihmDuk-biVBNz-7C5VBr-eChMAV-JruMBe-8o4iKu-qjgwW-JhhFXn-pBUjw
[12]:https://creativecommons.org/licenses/by-nc-sa/2.0/
[13]:https://buttercms.com/books/microservices-for-startups/
[14]:https://www.particle.io/Particle
[15]:https://www.scalyr.com/
[16]:https://www.algolia.com/
[17]:https://pantheon.io/
[18]:https://opensource.com/users/jakelumetta
[19]:https://opensource.com/users/jakelumetta
[20]:https://opensource.com/users/jakelumetta
[21]:https://opensource.com/tags/microservices
[22]:https://opensource.com/tags/devops

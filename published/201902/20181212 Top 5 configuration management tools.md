[#]: collector: (lujun9972)
[#]: translator: (HankChow)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10497-1.html)
[#]: subject: (Top 5 configuration management tools)
[#]: via: (https://opensource.com/article/18/12/configuration-management-tools)
[#]: author: (Marco Bravo https://opensource.com/users/marcobravo)

五大最流行的配置管理工具
======

> 了解一下配置管理工具，以找出哪个最适合你的 DevOps 组织。

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/innovation_lightbulb_gears_devops_ansible.png?itok=TSbmp3_M)

DevOps 正因为有提高产品质量、缩短产品开发时间等优势，目前备受业界关注，同时也在长足发展当中。

[DevOps 的核心价值观][1]是<ruby>团队文化<rt>Culture</rt></ruby>、<ruby>自动化<rt>Automation</rt></ruby>、<ruby>评估<rt>Measurement</rt></ruby>和<ruby>分享<rt>Sharing</rt></ruby>（CAMS），同时，团队对 DevOps 的执行力也是 DevOps 能否成功的重要因素。

  * **团队文化**让大家团结一致；
  * **自动化**是 DevOps 的基础；
  * **评估**保证了及时的改进；
  * **分享**让 CAMS 成为一个完整的循环过程。

DevOps 的另一个思想是任何东西，包括服务器、数据库、网络、日志文件、应用配置、文档、自动化测试、部署流程等，都可以通过代码来管理。

在本文中，我主要介绍配置管理的自动化。配置管理工具作为[<ruby>基础架构即代码<rt>Infrastructure as Code</rt></ruby>][2]（IaC）的一部分，支持使用经过测试和验证的软件开发实践，通过明文定义文件管理和配置数据中心。

DevOps 团队只需要通过操作简单的配置文件，就可以实现应用开发中包括版本控制、测试、小型部署、设计模式在内的这些最佳实践。总而言之，配置管理工具实现了通过编写代码来使基础架构的配置和管理变得自动化。

### 为什么要使用配置管理工具？

配置管理工具可以提高应用部署和变更的效率，还可以让这些流程变得可重用、可扩展、可预测，甚至让它们维持在期望的状态，从而让资产的可控性提高。

使用配置管理工具的优势还包括：

  * 让代码遵守编码规范，提高代码可读性；
  * 具有<ruby>幂等性<rt>Idempotency</rt></ruby>，也就是说，无论执行多少次重复的配置管理操作，得到的结果都是一致的；
  * 分布式的设计可以方便地管理大量的远程服务器。

配置管理工具主要分为<ruby>拉取<rt>pull</rt></ruby>模式和<ruby>推送<rt>push</rt></ruby>模式。拉取模式是指安装在各台服务器上的<ruby>代理<rt>agent</rt></ruby>定期从<ruby>中央存储库<rt>central repository</rt></ruby>拉取最新的配置并应用到对应的服务器上；而推送模式则由<ruby>中央服务器<rt>central server</rt></ruby>的中央服务器会触发其它受管服务器的更新。

### 五大最流行的配置管理工具

目前配置管理工具有很多，不同的配置管理工具都有自己最适合的使用场景。而对于下面五个我按照字母顺序列出的配置管理工具，都对 DevOps 有明显的帮助：全都具有开源许可证、使用外部配置文件、支持无人值守运行、可以通过脚本自定义运行。下面对它们的介绍都来源于它们的软件库和官网内容。

#### Ansible

“Ansible 是一个极其简洁的 IT 自动化平台，可以让你的应用和系统以更简单的方式部署。不需要安装任何代理，只需要使用 SSH 的方式和简单的语言，就可以免去脚本或代码部署应用的过程。”——[GitHub Ansible 代码库][3]

- [官网](https://www.ansible.com/)
- [文档](https://docs.ansible.com/ansible/)
- [社区](https://www.ansible.com/community)

Ansible 是我最喜欢的工具之一，我在几年前就开始使用了。你可以使用 Ansible 在命令行中让多个服务器执行同一个命令，也可以使用 YAML 格式的<ruby>剧本<rt>playbook</rt></ruby>来让它自动执行特定的操作，这促进了技术团队和非技术团队之间的沟通。简洁、无代理、配置文件对非技术人员友好是它的几个主要优点。

由于 Ansible 不需要代理，因此对服务器的资源消耗会很少。Ansible 默认使用的推送模式需要借助 SSH 连接，但 Ansible 也支持拉取模式。[剧本][4] 可以使用最少的命令集编写，当然也可以扩展为更加精细的自动化任务，包括引入角色、变量和其它人写的模块。

你可以将 Ansible 和其它工具（包括 Ansible Works、Jenkins、RunDeck、[ARA][5] 等）结合起来使用，因为这些工具 [提供了运行剧本时的可追溯性][6]，这样就可以创建控制流程的中央控制台。

### CFEngine

“CFEngine 3 是一个流行的开源配置管理系统，它主要用于为大规模的系统提供自动化配置和维护。”——[GitHub CFEngine 代码库][7]

- [官网](https://cfengine.com/)
- [文档](https://docs.cfengine.com/docs/3.12/)
- [社区](https://cfengine.com/community/)

CFEngine 最早在 1993 年由 Mark Burgess 作为自动配置管理的科学方法提出，目的是降低计算机系统配置中的熵，最终收敛到期望的配置状态，同时还阐述了幂等性是让系统达到期望状态的能力。Burgess 在 2004 年又提出了<ruby>[承诺理论][8]<rt>Promise Theory</rt></ruby>，这个理论描述了代理之间自发合作的模型。

CFEngine 的最新版本已经用到了承诺理论，在各个服务器上的代理程序会从中央存储库拉取配置。CFEngine 的配置对专业技能要求较高，因此它比较适合技术团队使用。

### Chef

“为整个基础架构在配置管理上带来便利的一个系统集成框架。”——[GitHub Chef 代码库][9]

- [官网](http://www.chef.io/chef/)
- [文档](https://docs.chef.io/)
- [社区](https://www.chef.io/community/)

Chef 通过由 Ruby 编写的“<ruby>菜谱<rt>recipe</rt></ruby>”来让你的基础架构保持在最新、最兼容的状态，这些“菜谱”描述了一系列应处于某种状态的资源。Chef 既可以通过客户端-服务端的模式运行，也可以在 [chef-solo][10] 这种独立配置的模式下运行。大部分云提供商都很好地集成了 Chef，因此可以使用它为新机器做自动配置。

Chef 有广泛的用户基础，同时也提供了完备的工具包，让不同技术背景的团队可以通过“菜谱”进行沟通。尽管如此，它仍然算是一个技术导向的工具。

### Puppet

“Puppet 是一个可以在 Linux、Unix 和 Windows 系统上运行的自动化管理引擎，它可以根据集中的规范来执行诸如添加用户、安装软件包、更新服务器配置等等管理任务。”——[GitHub Puppet 代码库][11]

- [官网](https://puppet.com/)
- [文档](https://puppet.com/docs)
- [社区](https://puppet.com/community)

Puppet 作为一款面向运维工程师和系统管理员的工具，在更多情况下是作为配置管理工具来使用。它通过客户端-服务端的模式工作，使用代理从主服务器获取配置指令。

Puppet 使用<ruby>声明式语言<rt>declarative language</rt></ruby>或 Ruby 来描述系统配置。它包含了不同的模块，并使用<ruby>清单文件<rt>manifest files</rt></ruby>记录期望达到的目标状态。Puppet 默认使用推送模式，但也支持拉取模式。

### Salt

“为大规模基础结构或应用程序实现自动化管理的软件。”——[GitHub Salt 代码库][12]

- [官网](https://www.saltstack.com/)
- [文档](https://docs.saltstack.com/en/latest/contents.html)
- [社区](https://www.saltstack.com/resources/community/)

Salt 的专长就是快速收集数据，即使是上万台服务器也能够轻松完成任务。它使用 Python 模块来管理配置信息和执行特定的操作，这些模块可以让 Salt 实现所有远程操作和状态管理。但配置 Salt 模块对技术水平有一定的要求。

Salt 使用客户端-服务端的结构（Salt minions 是客户端，而 Salt master 是服务端），并以 Salt 状态文件记录需要达到的目标状态。

### 总结

DevOps 工具领域一直在发展，因此必须时刻关注其中的最新动态。希望这篇文章能够鼓励读者进一步探索相关的概念和工具。为此，<ruby>云原生计算基金会<rt>Cloud Native Computing Foundation</rt></ruby>（CNCF）在 [Cloud Native Landscape Project][13] 中也提供了很好的参考案例。

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/12/configuration-management-tools

作者：[Marco Bravo][a]
选题：[lujun9972][b]
译者：[HankChow](https://github.com/HankChow)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/marcobravo
[b]: https://github.com/lujun9972
[1]: https://www.oreilly.com/learning/why-use-terraform
[2]: https://www.oreilly.com/library/view/infrastructure-as-code/9781491924334/ch04.html
[3]: https://github.com/ansible/ansible
[4]: https://opensource.com/article/18/8/ansible-playbooks-you-should-try
[5]: https://github.com/openstack/ara
[6]: https://opensource.com/article/18/5/analyzing-ansible-runs-using-ara
[7]: https://github.com/cfengine/core
[8]: https://en.wikipedia.org/wiki/Promise_theory
[9]: https://github.com/chef/chef
[10]: https://docs.chef.io/chef_solo.html
[11]: https://github.com/puppetlabs/puppet
[12]: https://github.com/saltstack/salt
[13]: https://github.com/cncf/landscape


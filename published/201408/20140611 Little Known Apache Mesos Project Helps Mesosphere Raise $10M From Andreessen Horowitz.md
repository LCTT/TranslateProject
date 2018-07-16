鲜为人知的 Apache Mesos 项目帮助 Mesosphere 公司得到了千万美元投资
================================================================================
![](http://thenewstack.io/wp-content/uploads/2014/04/clouds.jpg)

[Mesosphere][1]，一家试图围绕鲜为人知的 Apache Mesos 项目开展商业活动的公司，刚刚从 Andreessen Horowitz 那里获得了 1000 万美元投资。以下是为什么这个项目能够吸引如此巨款的原因。

事实上 Mesos 这款自动扩放软件已经出现了五年了。据 Mesosphere 的CEO及联合创始人 Florian Leibert 所述，Mesos 已经在 Twitter 内已经管理了超过 50,000 个以上的CPU。此外， EBay, AirBnB, Netflix 还有 HubSpot 也是这款软件的使用者。

当那些互联网巨头发现 Mesos 的时候，这项技术却并不为大多数企业所知。但它确实可以满足一些公司在他们内部的数据中心上应用公共云的一些技术的需求。

Mesos 管理集群机器，根据需要自动扩放应用。它在每台机器上只依赖很少的软件，它由一个主调度程序协调。据 Leibert 所说，其CPU 占用为 0 并且几乎不消耗任何内存。在其工作的每台机器上的该软件会向调度程序报告关于虚拟机或者服务器的容量信息，接着调度程序向目标机器分派任务。

“如果一项任务终断并且没有返回任何结果，主调度程序知道如何重新调度它和它所用的资源在哪里。” Mesosphere 的资深副总裁 Matt Trifiro 说。

Mesos 能自动扩放一系列的任务，包括 Hadoop 数据库，Ruby on Rails 节点，以及 Cassandra 。

使用 Mesos 使得 Hubspot 削减了一半的 AWS(Amazon Web Services) 的费用支出，Liebert 说道。这是因为 Mesos 能够在目标机器之间有效地分配作业量的原因。

然而，Mesos 更有可能应用到那些试图真正地在内部创建一个类 AWS 环境的企业，一位来自 451 Research 的分析员 Jay Lyman 说。AWS 提供一些[自动扩放工具][3]，但大多数公司对于在公共云基础设施上运行所有东西还是感到不安。与此同时，他们并不想着反对他们的开发者采用 AWS 那样的公共云中可用的优异性能。他们希望他们的私有云能集成这些可用的优点。

“如你所见，类似 AWS 风格的界面风格，与监控、命令、操控以及稳定性相融合，” Liebert 继续说道。

Mesos 既可以在一个私有云上也可以在 AWS 上运行，向企业提供最有效率地使用其内部云的方法，并在需要扩放时自动切换到 AWS 去。

但是，从另外的方面说 Mesos 也是有一些缺点的。它[并不能运行][4]任何 Windows 操作系统或者比较古老的应用比如说 SAP 软件。

不过，Lyman 说，“假如一个团队拥有长时期使用云的经历，他们大概早就对 Linux 操作系统情有独钟了。”

在将来，Mesosphere 能够支持 Windows 操作系统是很有可能的。最初，像 Puppet 和 Chef 这样的技术也只支持 Linux 操作系统，Lyman 表示。“这只是早期 Mesosphere 的特性。现在它还是不太成熟，” 他又说道。

Mesosphere 正瞄向大部分使用现代编程技术构建了越来越多的运行于 Linux 的应用的企业，以及 Twitter 和 Netflix 这种在初创时还没有 Mesos 类似技术的第一代 Web 2.0 公司。“这是早期两类最常见的客户概况，” Trifiro 说。

年终之前，Mesosphere 希望发布包含文档的商业产品，通过技术支持与颁发许可证来获得营收。Mesosphere 已开发一款名为 Marathon 的大规模扩放编制工具，并且支持 Docker 集成。它现在免费提供打包好的 Mesos 发行版，希望以此占有未来的市场。

Mesosphere 同时也正在为少数早期的顾客工作。它帮助 HubSpot 实施有关 Mesos 的搭建。

Mesosphere 在这个领域并不唯一。Rightscale，Scalr 以及现在归 Dell 所有的 Enstratius，全都提供了一些各种版本的扩放或云管理技术。Mesosphere 强调说，Mesos 及其公司自己开发的技术在单独机器中创建服务器集群方面的表现远胜于市场上的其他同类软件。来自 Andreessen 的新投资一定会帮助 Meos 获得更大的动力。

--------------------------------------------------------------------------------

via: http://thenewstack.io/little-known-apache-mesos-project-helps-mesosphere-raise-10m-from-andreessen/

译者：[SteveArcher](https://github.com/SteveArcher) 校对：[ wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://mesosphere.io/
[2]:http://mesos.apache.org/
[3]:http://aws.amazon.com/autoscaling/
[4]:http://mesosphere.io/learn/
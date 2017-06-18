2017 年的八大系统运维和工程发展趋势
=================

![](https://d3tdunqjn7n0wj.cloudfront.net/720x480/operations-circle-binoculars-crop-84d7249dda092338c1a6f3b562203b3d.jpg)

预测趋势是棘手的，尤其是在快速发展的系统运维和工程领域。2016 年，在我们的 Velocity 大会上，我们讨论了分布式系统、SRE、容器化、无服务架构，人员倦怠以及与提供软件相关的人力与技术挑战等诸多问题。以下是我们认为的下一年的趋势：

### 1、 分布式系统

我们认为这个很重要，我们[在整个 Velocity 会议上再次关注了它][1]。

### 2、 站点可靠性工程（SRE）

[站点可靠性工程（Site Reliability Engineering）][3]（SRE）-它只是运维么？[或者它是 DevOps 的另外一个名称吗][4]？这是 Google 对那些需要做大量系统及软件工程的运维专业人士的称呼。它由在像 Dropbox 公司的前 Google 人向业内推广，[招聘 SRE 的职位][5]正不断增加，特别是有大型数据中心的面向网络的公司。在某些情况下，SRE 的作用更多地是帮助开发人员运营自己的服务。

### 3、 容器化

公司将继续容器化它们的软件交付。Docker 公司本身已经将 Docker 定位为“[增量革命][6]”的工具，对遗留应用进行容器化已成为企业的常见案例。Docker 的未来是什么？随着工程师继续采用诸如 Kubernetes 和 Mesos 之类的编排工具，更高层次的抽象可能为其他容器（如 rkt、Garden 等）提供更多空间。

### 4、 Unikernels

unikernels 是容器化之后的下一步么？它们不合适产品环境么？有些人吹捧 unikernels 的安全和性能好处。关注一下 unikernels 在 2017 是如何进化的，[特别要关注下 Dokcer 公司在这个领域做的][7]。（今年它已经收购了 Unikernel Systems）

### 5、 无服务架构（Serverless）

无服务架构视功能为基础的计算单元。有些人认为这个术语是误导性的（让人想起 “noops”），并且更倾向于把这个趋势称为“功能即服务（Functions-as-a-Service）”（FaaS）。开发人员和架构师正在越来越多地尝试这个技术，并期望看到有越来越多的程序用这个范式编写。更多关于 serverless/FaaS 对运维的意义，请查看 Michael Hausenblas 的 [Serverless 运维][8]免费电子书。

### 6、 原生云程序开发

就像 DevOps，这个术语已经被市场人员使用并滥用很久了，但是云计算基金会（Cloud Native Computing Foundation）（CNCF）为这些新工具（通常是谷歌发起的）做了一个很好的例子，这些工具不仅利用了云，而且特别还在于分布式系统（即微服务，容器化和动态编排）所提供的优势和机会。

### 7、 监控

随着行业从 Nagios 风格的监控发展到流化指标和可视化，我们在生产越来越多的系统数据，而如何理解它们则是下一个挑战，因此，我们看到供应商开始提供具有机器学习功能的监控服务，以及更普遍的是 IT 运营人员开始去研究让机器学习分析系统数据的技术。同样，随着我们的基础设施变得更加动态和分布式，监控越来越少地检查某个资源的健康状况，更多的是在服务之间追踪流量。因此，分布式跟踪已经出现。

### 8、 DevOps 安全

随着 DevOps 安全的普及，[安全性正在迅速成为团队范围的关注][9]。当重视安全和合规方面的公司在速度的竞争上感到了压力时，要同时满足速度和可靠性的 DevOps 所面对的经典挑战尤其明显。

### 告诉我们关于你的工作

作为一名 IT 运维专业人员 - 你是否使用系统管理的术语如 DevOps、SRE、DBA 等等。- [欢迎你来分享你的见解][10]。

--------------------------------------------------------------------------------

作者简介：

Courtney Nash 主持 O'Reilly Media 的多个会议，是专注于现代网络运维、高性能程序和安全性的战略内容总监。一位前学术神经科学家，她仍然对大脑着迷，以及它如何告诉我们与技术互动和对技术的期望。自从移居西雅图，在一家蓬勃发展的在线书店工作之后，她花了 17 年的时间从事技术行业的各种工作。在外面，你可以看到 Courtney 在骑自行车、徒步旅行、滑雪。。。

O'Reilly Media 的基础架构和运维编辑 Brian Anderson 介绍了从传统系统管理到云计算、Web 性能、Docker 和 DevOps 等软件交付的重要内容。他一直从事在线教育，服务于学习者的需求超过十多年。

--------------------------------------------------------------------------------

via: https://www.oreilly.com/ideas/top-8-systems-operations-and-engineering-trends-for-2017

作者：[Courtney Nash][a], [Brian Anderson][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.oreilly.com/people/3f5d7-courtneyw-nash
[b]:https://www.oreilly.com/people/brian_anderson
[1]:https://www.oreilly.com/ideas/velocity-a-new-direction
[2]:https://www.oreilly.com/ideas/top-8-systems-operations-and-engineering-trends-for-2017?imm_mid=0ec113&cmp=em-webops-na-na-newsltr_20170106
[3]:https://www.oreilly.com/ideas/what-is-sre-site-reliability-engineering
[4]:http://conferences.oreilly.com/velocity/devops-web-performance-ny/public/content/devops-sre-ama-video
[5]:https://www.glassdoor.com/Salaries/site-reliability-engineer-salary-SRCH_KO0,25.htm
[6]:http://blog.scottlowe.org/2016/06/21/dockercon-2016-day-2-keynote/
[7]:http://www.infoworld.com/article/3024410/application-virtualization/docker-kicks-off-unikernel-revolution.html
[8]:http://www.oreilly.com/webops-perf/free/serverless-ops.csp?intcmp=il-webops-free-lp-na_new_site_top_8_systems_operations_and_engineering_trends_for_2017_body_text_cta
[9]:https://www.oreilly.com/learning/devopssec-securing-software-through-continuous-delivery
[10]:http://www.oreilly.com/webops-perf/2016-ops-survey.html
[11]:http://www.oreilly.com/webops-perf/2016-ops-survey.html

开发者定义的应用交付
============================================================

> 负载均衡器如何帮助你解决分布式系统的复杂性。


 ![Ship with tug](https://d3tdunqjn7n0wj.cloudfront.net/360x240/ship-84139_1400-154e17db40c32ff6fc352fd12b2b32d3.jpg) 

原生云应用旨在利用分布式系统的性能、可扩展性和可靠性优势。不幸的是，分布式系统往往以额外的复杂性为代价。由于你程序的各个组件跨网络分布，并且这些网络有通信障碍或者性能降级，因此你的分布式程序组件需要能够继续独立运行。

为了避免程序状态的不一致，分布式系统设计应该有一个共识，即组件会失效。没有什么比在网络中更突出了。因此，在其核心，分布式系统在很大程度上依赖于负载平衡——请求分布于两个或多个系统，以便在面临网络中断时具有弹性，并在系统负载波动时水平缩放时。

随着分布式系统在原生云程序的设计和交付中越来越普及，负载平衡器在现代应用程序体系结构的各个层次都影响了基础设施设计。在大多数常见配置中，负载平衡器部署在应用程序前端，处理来自外部世界的请求。然而，微服务的出现意味着负载平衡器可以在幕后发挥关键作用：即管理_服务_之间的流。

因此，当你使用原生云程序和分布式系统时，负载均衡器将承担其他角色：

*   作为提供缓存和增加安全性的**反向代理**，因为它成为外部客户端的中间人。
*   作为通过提供协议转换（例如 REST 到 AMQP）的 **API 网关**。
*   它可以处理**安全性**（即运行 Web 应用程序防火墙）。
*   它可能承担应用程序管理任务，如速率限制和 HTTP/2 支持。

鉴于它们的扩展能力远大于平衡流量，<ruby>负载平衡器<rt>load balancer</rt></ruby>可以更广泛地称为<ruby>应用交付控制器<rt>Application Delivery Controller</rt></ruby>（ADC）。

### 开发人员定义基础设施

从历史上看，ADC 是由 IT 专业人员购买、部署和管理的，最常见运行企业级架构的应用程序。对于物理负载平衡器设备（如 F5、Citrix、Brocade等），这种情况在很大程度上仍然存在。具有分布式系统设计和临时基础设施的云原生应用要求负载平衡器与它们运行时的基础设施 (如容器) 一样具有动态特性。这些通常是软件负载均衡器（例如来自公共云提供商的 NGINX 和负载平衡器）。云原生应用通常是开发人员主导的计划，这意味着开发人员正在创建应用程序（例如微服务器）和基础设施（Kubernetes 和 NGINX）。开发人员越来越多地对负载平衡 (和其他) 基础设施的决策做出或产生重大影响。

作为决策者，云原生应用的开发人员通常不会意识到企业基础设施需求或现有部署的影响，同时要考虑到这些部署通常是新的，并且经常在公共或私有云环境中进行部署。云技术将基础设施抽象为可编程 API，开发人员正在定义应用程序在该基础设施的每一层的构建方式。在有负载平衡器的情况下，开发人员会选择要使用的类型、部署方式以及启用哪些功能。它们以编程的方式对负载平衡器的行为进行编码 —— 随着程序在部署的生存期内增长、收缩和功能上进化时，它如何动态响应应用程序的需要。开发人员将基础设施定义为代码 —— 包括基础设施配置及其运维。

### 开发者为什么定义基础设施？

编写如何构建和部署应用程序的代码实践已经发生了根本性的转变，它体现在很多方面。简而言之，这种根本性的转变是由两个因素推动的：将新的应用功能推向市场所需的时间（_上市时间_）以及应用用户从产品中获得价值所需的时间（_获益时间_）。因此，新的程序写出来就被持续地交付（作为服务），无需下载和安装。

上市时间和获益时间的压力并不是新的，但由于其他因素的加剧，这些因素正在加强开发者的决策权力：

*   云：通过 API 将基础设施定义为代码的能力。
*   伸缩：需要在大型环境中高效运维。
*   速度：马上需要交付应用功能，为企业争取竞争力。
*   微服务：抽象框架和工具选择，进一步赋予开发人员基础设施决策权力。

除了上述因素外，值得注意的是开源的影响。随着开源软件的普及和发展，开发人员手中掌握了许多应用程序基础设施 - 语言、运行时环境、框架、数据库、负载均衡器、托管服务等。微服务的兴起使应用程序基础设施的选择民主化，允许开发人员选择最佳的工具。在选择负载平衡器的情况下，那些与云原生应用的动态特质紧密集成并响应的那些人将超人一等。

### 总结

当你在仔细考虑你的云原生应用设计时，请与我一起讨论“[在云中使用 NGINX 和 Kubernetes 进行负载平衡][8]”。我们将检测不同公共云和容器平台的负载平衡功能，并通过一个宏应用的案例研究。我们将看看它是如何被变成较小的、独立的服务，以及 NGINX 和 Kubernetes 的能力是如何拯救它的。

--------------------------------------------------------------------------------

作者简介：

Lee Calcote 是一位创新思想领袖，对开发者平台和云、容器、基础设施和应用的管理软件充满热情。先进的和新兴的技术一直是 Calcote 在 SolarWinds、Seagate、Cisco 和 Pelco 时的关注重点。他是技术会议和聚会的组织者、写作者、作家、演讲者，经常活跃在技术社区。

----------------------------

via: https://www.oreilly.com/learning/developer-defined-application-delivery

作者：[Lee Calcote][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.oreilly.com/people/7f693-lee-calcote
[1]:https://pixabay.com/en/ship-containers-products-shipping-84139/
[2]:https://conferences.oreilly.com/velocity/vl-ca?intcmp=il-webops-confreg-na-vlca17_new_site_velocity_sj_17_cta
[3]:https://www.oreilly.com/people/7f693-lee-calcote
[4]:http://www.oreilly.com/pub/e/3864?intcmp=il-webops-webcast-reg-webcast_new_site_developer_defined_application_delivery_text_cta
[5]:https://www.oreilly.com/learning/developer-defined-application-delivery?imm_mid=0ee8c5&cmp=em-webops-na-na-newsltr_20170310
[6]:https://conferences.oreilly.com/velocity/vl-ca?intcmp=il-webops-confreg-na-vlca17_new_site_velocity_sj_17_cta
[7]:https://conferences.oreilly.com/velocity/vl-ca?intcmp=il-webops-confreg-na-vlca17_new_site_velocity_sj_17_cta
[8]:http://www.oreilly.com/pub/e/3864?intcmp=il-webops-webcast-reg-webcast_new_site_developer_defined_application_delivery_body_text_cta

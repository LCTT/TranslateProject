Developer-defined application delivery
============================================================

How load balancers help you manage the complexity of distributed systems.


 ![Ship with tug](https://d3tdunqjn7n0wj.cloudfront.net/360x240/ship-84139_1400-154e17db40c32ff6fc352fd12b2b32d3.jpg) 

Cloud-native applications are designed to draw upon the performance, scalability, and reliability benefits of distributed systems. Unfortunately, distributed systems often come at the cost of added complexity. As individual components of your application are distributed across networks, and those networks have communication gaps or experience degraded performance, your distributed application components need to continue to function independently.

To avoid inconsistencies in application state, distributed systems should be designed with an understanding that components will fail. Nowhere is this more prominent than in the network. Consequently, at their core, distributed systems rely heavily on load balancing—the distribution of requests across two or more systems—in order to be resilient in the face of network disruption and horizontally scale as system load fluctuates.

Get O'Reilly's weekly Systems Engineering and Operations newsletter[
 ![](https://cdn.oreillystatic.com/oreilly/email/webops-newsletter-20170102.png) 
][5]

As distributed systems become more and more prevalent in the design and delivery of cloud-native applications, load balancers saturate infrastructure design at every level of modern application architecture. In their most commonly thought-of configuration, load balancers are deployed in front of the application, handling requests from the outside world. However, the emergence of microservices means that load balancers play a critical role behind the scenes: i.e. managing the flow between  _services_ .

Therefore, when you work with cloud-native applications and distributed systems, your load balancer takes on other role(s):

*   As a reverse proxy to provide caching and increased security as it becomes the go-between for external clients.
*   As an API gateway by providing protocol translation (e.g. REST to AMQP).
*   It may handle security (i.e. running a web application firewall).
*   It may take on application management tasks such as rate limiting and HTTP/2 support.

Given their clearly expanded capabilities beyond that of balancing traffic, load balancers can be more broadly referred to as Application Delivery Controllers (ADCs).

### Developers defining infrastructure

Historically, ADCs were purchased, deployed, and managed by IT professionals most commonly to run enterprise-architected applications. For physical load balancer equipment (e.g. F5, Citrix, Brocade, etc.), this largely remains the case. Cloud-native applications with their distributed systems design and ephemeral infrastructure require load balancers to be as dynamic as the infrastructure (e.g. containers) upon which they run. These are often software load balancers (e.g. NGINX and load balancers from public cloud providers). Cloud-native applications are typically developer-led initiatives, which means that developers are creating the application (e.g. microservices) and the infrastructure (Kubernetes and NGINX). Developers are increasingly making or heavily influencing decisions for load balancing (and other) infrastructure.

As a decision maker, the developer of cloud-native applications generally isn't aware of, or influenced by, enterprise infrastructure requirements or existing deployments, both considering that these deployments are often new and often deployments within a public or private cloud environment. Because cloud technologies have abstracted infrastructure into programmable APIs, developers are defining the way that applications are built at each layer of that infrastructure. In the case of the load balancer, developers choose which type to use, how it gets deployed, and which functions to enable. They programmatically encode how the load balancer behaves—how it dynamically responds to the needs of the application as the application grows, shrinks and evolves in functionality over the lifetime of application deployments. Developers are defining infrastructure as code—both infrastructure configuration and its operation as code.

### Why developers are defining infrastructure

The practice of writing this code— _how applications are built and deployed_ —has undergone a fundamental shift, which can be characterized in many ways. Stated pithily, this fundamental shift has been driven by two factors: the time it takes to bring new application functionality to market ( _time to market_ ) and the time it takes for an application user to derive value from the offering ( _time to value_ ). As a result, new applications are written to be continuously delivered (as a service), not downloaded and installed.

Time-to-market and time-to-value pressures aren’t new, but they are joined by other factors that are increasing the decisioning-making power developers have:

*   Cloud: the ability to define infrastructure as code via API.
*   Scale: the need to run operations efficiently in large environments.
*   Speed: the need to deliver application functionality now; for businesses to be competitive.
*   Microservices: abstraction of framework and tool choice, further empowering developers to make infrastructure decisions.

In addition to the above factors, it’s worth noting the impact of open source. With the prevalence and power of open source software, developers have a plethora of application infrastructure—languages, runtimes, frameworks, databases, load balancers, managed services, etc.—at their fingertips. The rise of microservices has democratized the selection of application infrastructure, allowing developers to choose best-for-purpose tooling. In the case of choice of load balancer, those that tightly integrate with and respond to the dynamic nature of cloud-native applications rise to the top of the heap.

### Conclusion

As you are mulling over your cloud-native application design, join me for a discussion on  _[Load Balancing in the Cloud with NGINX and Kubernetes][8]_ . We'll examine the load balancing capabilities of different public clouds and container platforms and walk through a case study involving a bloat-a-lith—an overstuffed monolithic application. We'll look at how it was broken into smaller, independent services and how capabilities of NGINX and Kubernetes came to its rescue.

--------------------------------------------------------------------------------

作者简介：

Lee Calcote is an innovative thought leader, passionate about developer platforms and management software for clouds, containers, infrastructure and applications. Advanced and emerging technologies have been a consistent focus through Calcote’s tenure at SolarWinds, Seagate, Cisco and Pelco. An organizer of technology meetups and conferences, a writer, author, speaker, he is active in the tech community.


----------------------------

via: https://www.oreilly.com/learning/developer-defined-application-delivery

作者：[Lee Calcote][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

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

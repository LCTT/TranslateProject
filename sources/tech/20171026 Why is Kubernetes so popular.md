translating---geekpi

Why is Kubernetes so popular?
============================================================

### The Google-developed container management system has quickly become one of the biggest success stories in open source history.

![Why is Kubernetes so popular?](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/running-containers-two-ship-container-beach.png?itok=wr4zJC6p "Why is Kubernetes so popular?")
Image credits : RIkki Endsley. [CC BY-SA 4.0][7]

[Kubernetes][8], an open source container management system, has surged in popularity in the past several years. Used by the largest enterprises in a wide range of industries for mission-critical tasks, it has become one of the biggest success stories in open source. How did that happen? And what is it about Kubernetes that explains its widespread adoption?

### Kubernetes' backstory: Origins in Google's Borg system

As the computing world became more distributed, more network-based, and more about cloud computing, we saw large, monolithic apps slowly transform into multiple, agile microservices. These microservices allowed users to individually scale key functions of an application and handle millions and millions of customers. On top of this paradigm change, we saw technologies like Docker containers emerge in the enterprise, creating a consistent, portable, and easy way for users to quickly build these microservices.

Linux Containers

*   [What are Linux containers?][1]

*   [What is Docker?][2]

*   [What is Kubernetes?][3]

*   [An introduction to container terminology][4]

While Docker continued to thrive, managing these microservices and containers became a paramount requirement. That's when Google, which had been running container-based infrastructure for many years, made the bold decision to open source an in-house project called [Borg][15]. The Borg system was key to running Google's services, such as Google Search and Gmail. This decision by Google to open source its infrastructure has created a way for any company in the world to run its infrastructure like one of the top companies in the world.

### One of the biggest open source communities

After its open source release, Kubernetes found itself competing with other container-management systems, namely Docker Swarm and Apache Mesos. One of the reasons Kubernetes surged past these other systems in recent months is the community and support behind the system: It's one of the largest open source communities (more than 27,000+ stars on GitHub); has contributions from thousands of organizations (1,409 contributors); and is housed within a large, neutral open source foundation, the [Cloud Native Computing Foundation][9] (CNCF).

The CNCF, which is also part of the larger Linux Foundation, has some of the top enterprise companies as members, including Microsoft, Google, and Amazon Web Services. Additionally, the ranks of enterprise members in CNCF continue to grow, with SAP and Oracle joining as Platinum members within the past couple of months. These companies joining the CNCF, where the Kubernetes project is front and center, is a testament to how much these enterprises are betting on the community to deliver a portion of their cloud strategy.

The enterprise community around Kubernetes has also surged, with vendors providing enterprise versions with added security, manageability, and support. Red Hat, CoreOS, and Platform 9 are some of the few that have made Enterprise Kubernetes offerings key to their strategy going forward and have invested heavily in ensuring the open source project continues to be maintained.

### Delivering the benefits of the hybrid cloud

Yet another reason why enterprises are adopting Kubernetes at such a breakneck pace is that Kubernetes can work in any cloud. With most enterprises sharing assets between their existing on-premises datacenters and the public cloud, the need for hybrid cloud technologies is critical.

Kubernetes can be deployed in a company's pre-existing datacenter on premises, in one of the many public cloud environments, and even run as a service. Because Kubernetes abstracts the underlying infrastructure layer, developers can focus on building applications, then deploy them to any of those environments. This helps accelerate a company's Kubernetes adoption, because it can run Kubernetes on-premises while continuing to build out its cloud strategy.

### Real-world use cases

Another reason Kubernetes continues to surge is that major corporations are using the technology to tackle some of the industry's largest challenges. Capital One, Pearson Education, and Ancestry.com are just a few of the companies that have published Kubernetes [use cases][10].

[Pokemon Go][11] is one of the most-popular publicized use cases showing the power of Kubernetes. Before its release, the online multiplayer game was expected to be reasonably popular. But as soon as it launched, it took off like a rocket, garnering 50 times the expected traffic. By using Kubernetes as the infrastructure overlay on top of Google Cloud, Pokemon Go could scale massively to keep up with the unexpected demand.

What started out as an open source project from Google—backed by 15 years of experience running Google services and a heritage from Google Borg—Kubernetes is now open source software that is part of a big foundation (CNCF) with many enterprise members. It continues to grow in popularity and is being widely used with mission-critical apps in finance, in massive multiplayer online games like Pokemon Go, and by educational companies and traditional enterprise IT. Considered together, all signs point to Kubernetes continuing to grow in popularity and remaining one of the biggest success stories in open source.

--------------------------------------------------------------------------------

作者简介：


Anurag Gupta - Anurag Gupta is a Product Manager at Treasure Data driving the development of the unified logging layer, Fluentd Enterprise. Anurag has worked on large data technologies including Azure Log Analytics, and enterprise IT services such as Microsoft System Center.

--------------------------------------------------------------------------------

via: https://opensource.com/article/17/10/why-kubernetes-so-popular

作者：[Anurag Gupta ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/anuraggupta
[1]:https://opensource.com/resources/what-are-linux-containers?utm_campaign=containers&intcmp=70160000000h1s6AAA
[2]:https://opensource.com/resources/what-docker?utm_campaign=containers&intcmp=70160000000h1s6AAA
[3]:https://opensource.com/resources/what-is-kubernetes?utm_campaign=containers&intcmp=70160000000h1s6AAA
[4]:https://developers.redhat.com/blog/2016/01/13/a-practical-introduction-to-docker-container-terminology/?utm_campaign=containers&intcmp=70160000000h1s6AAA
[5]:https://opensource.com/article/17/10/why-kubernetes-so-popular?rate=LM949RNFmORuG0I79_mgyXiVXrdDqSxIQjOReJ9_SbE
[6]:https://opensource.com/user/171186/feed
[7]:https://creativecommons.org/licenses/by-sa/4.0/
[8]:https://kubernetes.io/
[9]:https://www.cncf.io/
[10]:https://kubernetes.io/case-studies/
[11]:https://cloudplatform.googleblog.com/2016/09/bringing-Pokemon-GO-to-life-on-Google-Cloud.html
[12]:https://opensource.com/users/anuraggupta
[13]:https://opensource.com/users/anuraggupta
[14]:https://opensource.com/article/17/10/why-kubernetes-so-popular#comments
[15]:http://queue.acm.org/detail.cfm?id=2898444

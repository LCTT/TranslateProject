[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (6 requirements of cloud-native software)
[#]: via: (https://opensource.com/article/20/1/cloud-native-software)
[#]: author: (Daniel Oh https://opensource.com/users/daniel-oh)

6 requirements of cloud-native software
======
A checklist for developing and implementing cloud-native
(container-first) software.
![Team checklist][1]

For many years, monolithic applications were the standard enterprise architecture for achieving business requirements. But that changed significantly once cloud infrastructure began treating business acceleration at scale and speed. Application architectures have also transformed to fit into the cloud-native applications and the [microservices][2], [serverless][3], and event-driven services that are running on immutable infrastructures across hybrid and multi-cloud platforms.

### The cloud-native connection to Kubernetes

According to the [Cloud Native Computing Foundation][4] (CNCF):

> "Cloud native technologies empower organizations to build and run scalable applications in modern, dynamic environments such as public, private, and hybrid clouds. Containers, service meshes, microservices, immutable infrastructure, and declarative APIs exemplify this approach.
>
> "These techniques enable loosely coupled systems that are resilient, manageable, and observable. Combined with robust automation, they allow engineers to make high-impact changes frequently and predictably with minimal toil."

Container orchestration platforms like [Kubernetes][5] allow DevOps teams to build immutable infrastructures to develop, deploy, and manage application services. The speed at which rapid iteration is possible now aligns with business needs. Developers building containers to run in Kubernetes need an effective place to do so.

### Requirements for cloud-native software

What capabilities are required to create a cloud-native application architecture, and what benefits will developers gain from it?

While there are many ways to build and architect cloud-native applications, the following are some ingredients to consider:

  * **Runtimes:** They are more likely to be written in the container-first or/and Kubernetes-native language, which means runtimes such as Java, Node.js, Go, Python, and Ruby.
  * **Security:** When deploying and maintaining applications in a multi-cloud or hybrid cloud application environment, security is of utmost importance and should be part of the environment.
  * **Observability:** Use tools such as Prometheus, Grafana, and Kiali that can enhance observability by providing realtime metrics and more information about how applications are being used and behave in the cloud.
  * **Efficiency:** Focus on a tiny memory footprint, small artifact size, and fast boot time to make applications portable across hybrid/multi-cloud platforms.
  * **Interoperability:** Integrate cloud-native apps with open source technologies that enable you to meet the requirements listed above, including Infinispan, MicroProfile, Hibernate, Kafka, Jaeger, Prometheus, and more, for building standard runtime architectures.
  * **DevOps/DevSecOps:** These methodologies are designed for continuous deployment to production, in-line with the minimum viable product (MVP) and with security as part of the tooling.



### Making cloud-native concrete

Cloud-native can seem like an abstract term, but reviewing the definition and thinking like a developer can make it more concrete. In order for cloud-native applications to be successful, they need to include a long, well-defined list of ingredients.

How are you planning for cloud-native application design? Share your thoughts in the comments.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/1/cloud-native-software

作者：[Daniel Oh][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/daniel-oh
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/checklist_todo_clock_time_team.png?itok=1z528Q0y (Team checklist)
[2]: https://opensource.com/resources/what-are-microservices
[3]: https://opensource.com/article/18/11/open-source-serverless-platforms
[4]: https://github.com/cncf/toc/blob/master/DEFINITION.md
[5]: https://opensource.com/resources/what-is-kubernetes

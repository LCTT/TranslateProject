[#]: subject: (Why you should care about service mesh)
[#]: via: (https://opensource.com/article/21/3/service-mesh)
[#]: author: (Daniel Oh https://opensource.com/users/daniel-oh)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Why you should care about service mesh
======
Service mesh provides benefits for development and operations in
microservices environments.
![Net catching 1s and 0s or data in the clouds][1]

Many developers wonder why they should care about [service mesh][2]. It's a question I'm asked often in my presentations at developer meetups, conferences, and hands-on workshops about microservices development with cloud-native architecture. My answer is always the same: "As long as you want to simplify your microservices architecture, it should be running on Kubernetes."

Concerning simplification, you probably also wonder why distributed microservices must be designed so complexly for running on Kubernetes clusters. As this article explains, many developers solve the microservices architecture's complexity with service mesh and gain additional benefits by adopting service mesh in production.

### What is a service mesh?

A service mesh is a dedicated infrastructure layer for providing a transparent and code-independent (polyglot) way to eliminate nonfunctional microservices capabilities from the application code.

![Before and After Service Mesh][3]

(Daniel Oh, [CC BY-SA 4.0][4])

### Why service mesh matters to developers

When developers deploy microservices to the cloud, they have to address nonfunctional microservices capabilities to avoid cascading failures, regardless of business functionalities. Those capabilities typically can be represented in service discovery, logging, monitoring, resiliency, authentication, elasticity, and tracing. Developers must spend more time adding them to each microservice rather than developing actual business logic, which makes the microservices heavy and complex.

As organizations accelerate their move to the cloud, the service mesh can increase developer productivity. Instead of making the services responsible for dealing with those complexities and adding more code into each service to deal with cloud-native concerns, the Kubernetes + service mesh platform is responsible for providing those services to any application (existing or new, in any programming language or framework) running on the platform. Then the microservices can be lightweight and focus on their business logic rather than cloud-native complexities.

### Why service mesh matters to ops

This doesn't answer why ops teams need to care about the service mesh for operating cloud-native microservices on Kubernetes. It's because the ops teams have to ensure robust security, compliance, and observability for spreading new cloud-native applications across large hybrid and multi clouds on Kubernetes environments.

The service mesh is composed of a control plane for managing proxies to route traffic and a data plane for injecting sidecars. The sidecars allow the ops teams to do things like adding third-party security tools and tracing traffic in all service communications to avoid security breaches or compliance issues. The service mesh also improves observation capabilities by visualizing tracing metrics on graphical dashboards.

### How to get started with service mesh

Service mesh manages cloud-native capabilities more efficiently—for developers and operators and from application development to platform operation.

You might want to know where to get started adopting service mesh in alignment with your microservices applications and architecture. Luckily, there are many open source service mesh projects. Many cloud service providers also offer service mesh capabilities within their Kubernetes platforms.

![CNCF Service Mesh Landscape][5]

(Daniel Oh, [CC BY-SA 4.0][4])

You can find links to the most popular service mesh projects and services on the [CNCF Service Mesh Landscape][6] webpage.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/3/service-mesh

作者：[Daniel Oh][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/daniel-oh
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/data_analytics_cloud.png?itok=eE4uIoaB (Net catching 1s and 0s or data in the clouds)
[2]: https://www.redhat.com/en/topics/microservices/what-is-a-service-mesh
[3]: https://opensource.com/sites/default/files/uploads/vm-vs-service-mesh.png (Before and After Service Mesh)
[4]: https://creativecommons.org/licenses/by-sa/4.0/
[5]: https://opensource.com/sites/default/files/uploads/service-mesh-providers.png (CNCF Service Mesh Landscape)
[6]: https://landscape.cncf.io/card-mode?category=service-mesh&grouping=category

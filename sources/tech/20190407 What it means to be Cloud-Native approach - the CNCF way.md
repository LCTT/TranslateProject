[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (What it means to be Cloud-Native approach — the CNCF way)
[#]: via: (https://medium.com/@sonujose993/what-it-means-to-be-cloud-native-approach-the-cncf-way-9e8ab99d4923)
[#]: author: (Sonu Jose https://medium.com/@sonujose993)

What it means to be Cloud-Native approach — the CNCF way
======

![](https://cdn-images-1.medium.com/max/2400/0*YknjM7T_Pxwz9deR)

While discussing on Digital Transformation and modern application development Cloud-Native is a term which frequently comes in. But what does it actually means to be cloud-native? This blog is all about giving a good understanding of the cloud-native approach and the ways to achieve it in the CNCF way.

Michael Dell once said that “the cloud isn’t a place, it’s a way of doing IT”. He was right, and the same can be said of cloud-native.

Cloud-native is an approach to building and running applications that exploit the advantages of the cloud computing delivery model. Cloud-native is about how applications are created and deployed, not where. … It’s appropriate for both public and private clouds.

Cloud native architectures take full advantage of on-demand delivery, global deployment, elasticity, and higher-level services. They enable huge improvements in developer productivity, business agility, scalability, availability, utilization, and cost savings.

### CNCF (Cloud native computing foundation)

Google has been using containers for many years and they led the Kubernetes project which is a leading container orchestration platform. But alone they can’t really change the broad perspective in the industry around modern applications. So there was a huge need for industry leaders to come together and solve the major problems facing the modern approach. In order to achieve this broader vision, Google donated kubernetes to the Cloud Native foundation and this lead to the birth of CNCF in 2015.

![](https://cdn-images-1.medium.com/max/1200/1*S1V9R_C_rjLVlH3M8dyF-g.png)

Cloud Native computing foundation is created in the Linux foundation for building and managing platforms and solutions for modern application development. It really is a home for amazing projects that enable modern application development. CNCF defines cloud-native as “scalable applications” running in “modern dynamic environments” that use technologies such as containers, microservices, and declarative APIs. Kubernetes is the world’s most popular container-orchestration platform and the first CNCF project.

### The approach…

CNCF created a trail map to better understand the concept of Cloud native approach. In this article, we will be discussed based on this landscape. The newer version is available at https://landscape.cncf.io/

The Cloud Native Trail Map is CNCF’s recommended path through the cloud-native landscape. This doesn’t define a specific path with which we can approach digital transformation rather there are many possible paths you can follow to align with this concept based on your business scenario. This is just a trail to simplify the journey to cloud-native.


Let's start discussing the steps defined in this trail map.

### 1. CONTAINERIZATION

![][1]

You can’t do cloud-native without containerizing your application. It doesn’t matter what size the application is any type of application will do. **A container is a standard unit of software that packages up the code and all its dependencies** so the application runs quickly and reliably from one computing environment to another. Docker is the most preferred platform for containerization. A **Docker container** image is a lightweight, standalone, executable package of software that includes everything needed to run an application.

### 2. CI/CD

![][2]

Setup Continuous Integration/Continuous Delivery (CI/CD) so that changes to your source code automatically result in a new container being built, tested, and deployed to staging and eventually, perhaps, to production. Next thing we need to setup is automated rollouts, rollbacks as well as testing. There are a lot of platforms for CI/CD: **Jenkins, VSTS, Azure DevOps** , TeamCity, JFRog, Spinnaker, etc..

### 3. ORCHESTRATION

![][3]

Container orchestration is all about managing the lifecycles of containers, especially in large, dynamic environments. Software teams use container orchestration to control and automate many tasks. **Kubernetes** is the market-leading orchestration solution. There are other orchestrators like Docker swarm, Mesos, etc.. **Helm Charts** help you define, install, and upgrade even the most complex Kubernetes application.

### 4. OBSERVABILITY & ANALYSIS

Kubernetes provides no native storage solution for log data, but you can integrate many existing logging solutions into your Kubernetes cluster. Kubernetes provides detailed information about an application’s resource usage at each of these levels. This information allows you to evaluate your application’s performance and where bottlenecks can be removed to improve overall performance.

![][4]

Pick solutions for monitoring, logging, and tracing. Consider CNCF projects Prometheus for monitoring, Fluentd for logging and Jaeger for TracingFor tracing, look for an OpenTracing-compatible implementation like Jaeger.

### 5. SERVICE MESH

As its name says it’s all about connecting services, the **discovery of services** , **health checking, routing** and it is used to **monitoring ingress** from the internet. A service mesh also often has more complex operational requirements, like A/B testing, canary rollouts, rate limiting, access control, and end-to-end authentication.

![][5]

**Istio** provides behavioral insights and operational control over the service mesh as a whole, offering a complete solution to satisfy the diverse requirements of microservice applications. **CoreDNS** is a fast and flexible tool that is useful for service discovery. **Envoy** and **Linkerd** each enable service mesh architectures.

### 6. NETWORKING AND POLICY

It is really important to enable more flexible networking layers. To enable more flexible networking, use a CNI compliant network project like Calico, Flannel, or Weave Net. Open Policy Agent (OPA) is a general purpose policy engine with uses ranging from authorization and admission control to data filtering

### 7. DISTRIBUTED DATABASE

A distributed database is a database in which not all storage devices are attached to a common processor. It may be stored in multiple computers, located in the same physical location; or may be dispersed over a network of interconnected computers.

![][6]

When you need more resiliency and scalability than you can get from a single database, **Vitess** is a good option for running MySQL at scale through sharding. Rook is a storage orchestrator that integrates a diverse set of storage solutions into Kubernetes. Serving as the “brain” of Kubernetes, etcd provides a reliable way to store data across a cluster of machine

### 8. MESSAGING

When you need higher performance than JSON-REST, consider using gRPC or NATS. gRPC is a universal RPC framework. NATS is a multi-modal messaging system that includes request/reply, pub/sub and load balanced queues. It is also applicable and take care of much newer and use cases like IoT.

### 9. CONTAINER REGISTRY & RUNTIMES

Container Registry is a single place for your team to manage Docker images, perform vulnerability analysis, and decide who can access what with fine-grained access control. There are many container registries available in market docker hub, Azure Container registry, Harbor, Nexus registry, Amazon Elastic Container Registry and way more…

![][7]

Container runtime **containerd** is available as a daemon for Linux and Windows. It manages the complete container lifecycle of its host system, from image transfer and storage to container execution and supervision to low-level storage to network attachments and beyond.

### 10. SOFTWARE DISTRIBUTION

If you need to do secure software distribution, evaluate Notary, implementation of The Update Framework (TUF).

TUF provide a framework (a set of libraries, file formats, and utilities) that can be used to secure new and existing software update systems. The framework should enable applications to be secure from all known attacks on the software update process. It is not concerned with exposing information about what software is being updated (and thus what software the client may be running) or the contents of updates.

--------------------------------------------------------------------------------

via: https://medium.com/@sonujose993/what-it-means-to-be-cloud-native-approach-the-cncf-way-9e8ab99d4923

作者：[Sonu Jose][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://medium.com/@sonujose993
[b]: https://github.com/lujun9972
[1]: https://cdn-images-1.medium.com/max/1200/1*glD7bNJG3SlO0_xNmSGPcQ.png
[2]: https://cdn-images-1.medium.com/max/1600/1*qOno8YNzmwimlaL9j2fSbA.png
[3]: https://cdn-images-1.medium.com/max/1200/1*fw8YJnfF32dWsX_beQpWOw.png
[4]: https://cdn-images-1.medium.com/max/1600/1*sbjPYNq76s9lR7D_FK4ltg.png
[5]: https://cdn-images-1.medium.com/max/1600/1*kUFBuGfjZSS-n-32CCjtwQ.png
[6]: https://cdn-images-1.medium.com/max/1600/1*4OGiB3HHQZBFsALjaRb9pA.jpeg
[7]: https://cdn-images-1.medium.com/max/1600/1*VMCJN41mGZs4p2lQHD0nDw.png

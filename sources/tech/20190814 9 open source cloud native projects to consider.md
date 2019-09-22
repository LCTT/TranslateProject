[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (9 open source cloud native projects to consider)
[#]: via: (https://opensource.com/article/19/8/cloud-native-projects)
[#]: author: (Bryant Son https://opensource.com/users/brsonhttps://opensource.com/users/marcobravo)

9 open source cloud native projects to consider
======
Work with containers? Get familiar with these projects from the Cloud
Native Computing Foundation
![clouds in the sky with blue pattern][1]

As the practice of developing applications with containers is getting more popular, [cloud-native applications][2] are also on the rise. By [definition][3]:

> "Cloud-native technologies are used to develop applications built with services packaged in containers, deployed as microservices, and managed on elastic infrastructure through agile DevOps processes and continuous delivery workflows."

This description includes four elements that are integral to cloud-native applications:

  1. Container
  2. Microservice
  3. DevOps
  4. Continuous integration and continuous delivery (CI/CD)



Although these technologies have very distinct histories, they complement each other well and have led to surprisingly exponential growth of cloud-native applications and toolsets in a short time. This [Cloud Native Computing Foundation][4] (CNCF) infographic shows the size and breadth of the cloud-native application ecosystem today.

![Cloud-Native Computing Foundation applications ecosystem][5]

Cloud-Native Computing Foundation projects

I mean, just look at that! And this is just a start. Just as NodeJS’s creation sparked the explosion of endless JavaScript tools, the popularity of container technology started the exponential growth of cloud-native applications.

The good news is that there are several organizations that oversee and connect these dots together. One is the [**Open Containers Initiative (OCI)**][6], which is a lightweight, open governance structure (or project), "formed under the auspices of the Linux Foundation for the express purpose of creating open industry standards around container formats and runtime." The other is the **CNCF**, "an open source software foundation dedicated to making cloud native computing universal and sustainable."

In addition to building a community around cloud-native applications generally, CNCF also helps projects set up structured governance around their cloud-native applications. CNCF created the concept of maturity levels—Sandbox, Incubating, or Graduated—which correspond to the Innovators, Early Adopters, and Early Majority tiers on the diagram below.

![CNCF project maturity levels][7]

CNCF project maturity levels

The CNCF has detailed [criteria][8] for each maturity level (included below for readers’ convenience). A two-thirds supermajority of the Technical Oversight Committee (TOC) is required for a project to be Incubating or Graduated.

### Sandbox stage

> To be accepted in the sandbox, a project must have at least two TOC sponsors. See the CNCF Sandbox Guidelines v1.0 for the detailed process.

### Incubating stage

> Note: The incubation level is the point at which we expect to perform full due diligence on projects.
>
> To be accepted to incubating stage, a project must meet the sandbox stage requirements plus:
>
>   * Document that it is being used successfully in production by at least three independent end users which, in the TOC’s judgement, are of adequate quality and scope.
>   * Have a healthy number of committers. A committer is defined as someone with the commit bit; i.e., someone who can accept contributions to some or all of the project.
>   * Demonstrate a substantial ongoing flow of commits and merged contributions.
>   * Since these metrics can vary significantly depending on the type, scope, and size of a project, the TOC has final judgement over the level of activity that is adequate to meet these criteria
>


### Graduated stage

> To graduate from sandbox or incubating status, or for a new project to join as a graduated project, a project must meet the incubating stage criteria plus:
>
>   * Have committers from at least two organizations.
>   * Have achieved and maintained a Core Infrastructure Initiative Best Practices Badge.
>   * Have completed an independent and third party security audit with results published of similar scope and quality as the following example (including critical vulnerabilities addressed): <https://github.com/envoyproxy/envoy#security-audit> and all critical vulnerabilities need to be addressed before graduation.
>   * Adopt the CNCF Code of Conduct.
>   * Explicitly define a project governance and committer process. This preferably is laid out in a GOVERNANCE.md file and references an OWNERS.md file showing the current and emeritus committers.
>   * Have a public list of project adopters for at least the primary repo (e.g., ADOPTERS.md or logos on the project website).
>   * Receive a supermajority vote from the TOC to move to graduation stage. Projects can attempt to move directly from sandbox to graduation, if they can demonstrate sufficient maturity. Projects can remain in an incubating state indefinitely, but they are normally expected to graduate within two years.
>


## 9 projects to consider

While it’s impossible to cover all of the CNCF projects in this article, I’ll describe are nine of most interesting Graduated and Incubating open source projects.

Name | License | What It Is
---|---|---
[Kubernetes][9] | Apache 2.0 | Orchestration platform for containers
[Prometheus][10] | Apache 2.0 | Systems and service monitoring tool
[Envoy][11] | Apache 2.0 | Edge and service proxy
[rkt][12] | Apache 2.0 | Pod-native container engine
[Jaeger][13] | Apache 2.0 | Distributed tracing system
[Linkerd][14] | Apache 2.0 | Transparent service mesh
[Helm][15] | Apache 2.0 | Kubernetes package manager
[Etcd][16] | Apache 2.0 | Distributed key-value store
[CRI-O][17] | Apache 2.0 | Lightweight runtime for Kubernetes

I also created this video tutorial to walk through these projects.

## Graduated projects

Graduated projects are considered mature—adopted by many organizations—and must adhere to the CNCF’s guidelines. Following are three of the most popular open source CNCF Graduated projects. (Note that some of these descriptions are adapted and reused from the projects' websites.)

### Kubernetes

Ah, Kubernetes. How can we talk about cloud-native applications without mentioning Kubernetes? Invented by Google, Kubernetes is undoubtedly the most famous container-orchestration platform for container-based applications, and it is also an open source tool.

What is a container orchestration platform? Basically, a container engine on its own may be okay for managing a few containers. However, when you are talking about thousands of containers and hundreds of services, managing those containers becomes super complicated. This is where the container engine comes in. The container-orchestration engine helps scale containers by automating the deployment, management, networking, and availability of containers.

Docker Swarm and Mesosphere Marathon are other container-orchestration engines, but it is safe to say that Kubernetes has won the race (at least for now). Kubernetes also gave birth to Container-as-a-Service (CaaS) platforms like [OKD][18], the Origin community distribution of Kubernetes that powers [Red Hat OpenShift][19].

To get started, visit the [Kubernetes GitHub repository][9], and access its documentation and learning resources from the [Kubernetes documentation][20] page.

### Prometheus

Prometheus is an open source system monitoring and alerting toolkit built at SoundCloud in 2012. Since then, many companies and organizations have adopted Prometheus, and the project has a very active developer and user community. It is now a standalone open source project that is maintained independently of the company.

![Prometheus’ architecture][21]

Prometheus’ architecture

The easiest way to think about Prometheus is to visualize a production system that needs to be up 24 hours a day and 365 days a year. No system is perfect, and there are techniques to reduce failures (called fault-tolerant systems). However, if an issue occurs, the most important thing is to identify it as soon as possible. That is where a monitoring tool like Prometheus comes in handy. Prometheus is more than a container-monitoring tool, but it is most popular among cloud-native application companies. In addition, other open source monitoring tools, including [Grafana][22], leverage Prometheus.

The best way to get started with Prometheus is to check out its [GitHub repo][10]. Running Prometheus locally is easy, but you need to have a container engine installed. You can access detailed documentation on [Prometheus’ website][23].

### Envoy

Envoy (or Envoy Proxy) is an open source edge and service proxy designed for cloud-native applications. Created at Lyft, Envoy is a high-performance, C++, distributed proxy designed for single services and applications, as well as a communications bus and a universal data plane designed for large microservice service mesh architectures. Built on the learnings of solutions such as Nginx, HAProxy, hardware load balancers, and cloud load balancers, Envoy runs alongside every application and abstracts the network by providing common features in a platform-agnostic manner.

When all service traffic in an infrastructure flows through an Envoy mesh, it becomes easy to visualize problem areas via consistent observability, tune overall performance, and add substrate features in a single place. Basically, Envoy Proxy is a service mesh tool that helps organizations build a fault-tolerant system for production environments.

There are numerous alternatives for service mesh applications, such as Uber’s [Linkerd][24] (discussed below) and [Istio][25]. Istio extends Envoy Proxy by deploying as a [Sidecar][26] and leveraging the [Mixer][27] configuration model. Notable Envoy features are:

  * All the "table stakes" features (when paired with a control plane, like Istio) are included
  * Low, 99th percentile latencies at scale when running under load
  * Acts as an L3/L4 filter at its core with many L7 filters provided out of the box
  * Support for gRPC and HTTP/2 (upstream/downstream)
  * It’s API-driven and supports dynamic configuration and hot reloads
  * Has a strong focus on metric collection, tracing, and overall observability



Understanding Envoy, proving its capabilities, and realizing its full benefits require extensive experience with running production-level environments. You can learn more in its [detailed documentation][28] and by accessing its [GitHub][11] repository.

## Incubating projects

Following are six of the most popular open source CNCF Incubating projects.

### rkt

rkt, pronounced "rocket," is a pod-native container engine. It has a command-line interface (CLI) for running containers on Linux. In a sense, it is similar to other containers, like [Podman][29], Docker, and CRI-O.

rkt was originally developed by CoreOS (later acquired by Red Hat), and you can find detailed [documentation][30] on its website and access the source code on [GitHub][12].

### Jaeger

Jaeger is an open source, end-to-end distributed tracing system for cloud-native applications. In one way, it is a monitoring solution like Prometheus. Yet it is different because its use cases extend into:

  * Distributed transaction monitoring
  * Performance and latency optimization
  * Root-cause analysis
  * Service dependency analysis
  * Distributed context propagation



Jaeger is an open source technology built by Uber. You can find [detailed documentation][31] on its website and its [source code][13] on GitHub.

### Linkerd

Like Lyft with Envoy Proxy, Uber developed Linkerd as an open source solution to maintain its service at the production level. In some ways, Linkerd is just like Envoy, as both are service mesh tools designed to give platform-wide observability, reliability, and security without requiring configuration or code changes.

However, there are some subtle differences between the two. While Envoy and Linkerd function as proxies and can report over services that are connected, Envoy isn’t designed to be a Kubernetes Ingress controller, as Linkerd is. Notable features of Linkerd include:

  * Support for multiple platforms (Docker, Kubernetes, DC/OS, Amazon ECS, or any stand-alone machine)
  * Built-in service discovery abstractions to unite multiple systems
  * Support for gRPC, HTTP/2, and HTTP/1.x requests plus all TCP traffic



You can read more about it on [Linkerd’s website][32] and access its source code on [GitHub][14].

### Helm

Helm is basically the package manager for Kubernetes. If you’ve used Apache Maven, Maven Nexus, or a similar service, you will understand Helm’s purpose. Helm helps you manage your Kubernetes application. It uses "Helm Charts" to define, install, and upgrade even the most complex Kubernetes applications. Helm isn’t the only method for this; another concept becoming popular is [Kubernetes Operators][33], which are used by Red Hat OpenShift 4.

You can try Helm by following the [quickstart guide][34] in its documentation or its [GitHub guide][15].

### Etcd

Etcd is a distributed, reliable key-value store for the most critical data in a distributed system. Its key features are:

  * Well-defined, user-facing API (gRPC)
  * Automatic TLS with optional client certificate authentication
  * Speed (benchmarked at 10,000 writes per second)
  * Reliability (distributed using Raft)



Etcd is used as a built-in default data storage for Kubernetes and many other technologies. That said, it is rarely run independently or as a separate service; instead, it utilizes the one integrated into Kubernetes, OKD/OpenShift, or another service. There is also an [etcd Operator][35] to manage its lifecycle and unlock its API management capabilities:

You can learn more in [etcd’s documentation][36] and access its [source code][16] on GitHub.

### CRI-O

CRI-O is an Open Container Initiative (OCI)-compliant implementation of the Kubernetes runtime interface. CRI-O is used for various functions including:

  * Runtime using runc (or any OCI runtime-spec implementation) and OCI runtime tools
  * Image management using containers/image
  * Storage and management of image layers using containers/storage
  * Networking support through the Container Network Interface (CNI)



CRI-O provides plenty of [documentation][37], including guides, tutorials, articles, and even podcasts, and you can also access its [GitHub page][17].

* * *

Did I miss an interesting open source cloud-native project? Please let me know in the comments.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/8/cloud-native-projects

作者：[Bryant Son][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/brsonhttps://opensource.com/users/marcobravo
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/rh_003601_05_mech_osyearbook2016_cloud_cc.png?itok=XSV7yR9e (clouds in the sky with blue pattern)
[2]: https://opensource.com/article/18/7/what-are-cloud-native-apps
[3]: https://thenewstack.io/10-key-attributes-of-cloud-native-applications/
[4]: https://www.cncf.io
[5]: https://opensource.com/sites/default/files/uploads/cncf_1.jpg (Cloud-Native Computing Foundation applications ecosystem)
[6]: https://www.opencontainers.org
[7]: https://opensource.com/sites/default/files/uploads/cncf_2.jpg (CNCF project maturity levels)
[8]: https://github.com/cncf/toc/blob/master/process/graduation_criteria.adoc
[9]: https://github.com/kubernetes/kubernetes
[10]: https://github.com/prometheus/prometheus
[11]: https://github.com/envoyproxy/envoy
[12]: https://github.com/rkt/rkt
[13]: https://github.com/jaegertracing/jaeger
[14]: https://github.com/linkerd/linkerd
[15]: https://github.com/helm/helm
[16]: https://github.com/etcd-io/etcd
[17]: https://github.com/cri-o/cri-o
[18]: https://www.okd.io/
[19]: https://www.openshift.com
[20]: https://kubernetes.io/docs/home
[21]: https://opensource.com/sites/default/files/uploads/cncf_3.jpg (Prometheus’ architecture)
[22]: https://grafana.com
[23]: https://prometheus.io/docs/introduction/overview
[24]: https://linkerd.io/
[25]: https://istio.io/
[26]: https://istio.io/docs/reference/config/networking/v1alpha3/sidecar
[27]: https://istio.io/docs/reference/config/policy-and-telemetry
[28]: https://www.envoyproxy.io/docs/envoy/latest
[29]: https://podman.io
[30]: https://coreos.com/rkt/docs/latest
[31]: https://www.jaegertracing.io/docs/1.13
[32]: https://linkerd.io/2/overview
[33]: https://coreos.com/operators
[34]: https://helm.sh/docs
[35]: https://github.com/coreos/etcd-operator
[36]: https://etcd.io/docs/v3.3.12
[37]: https://github.com/cri-o/cri-o/blob/master/awesome.md

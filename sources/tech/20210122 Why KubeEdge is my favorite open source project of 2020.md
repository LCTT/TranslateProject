[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Why KubeEdge is my favorite open source project of 2020)
[#]: via: (https://opensource.com/article/21/1/kubeedge)
[#]: author: (Mike Calizo https://opensource.com/users/mcalizo)

Why KubeEdge is my favorite open source project of 2020
======
KubeEdge is a workload framework for edge computing.
![Tips and gears turning][1]

I believe [edge computing][2], which "brings computation and data storage closer to the location where it is needed to improve response times and save bandwidth," is the next major phase of technology adoption. The widespread use of mobile devices and wearable gadgets and the availability of free city-wide WiFi in some areas create a lot of data that can provide many advantages if used properly. For example, this data can help people fight crime, learn about nearby activities and events, find the best sale price, avoid traffic, and so on.

[Gartner][3] says the rapid growth in mobile application adoption requires an edge infrastructure to use the data from these devices to further progress and improve quality of life. Some of the brightest minds are looking for ways to use the rich data generated from our mobile devices. Take the COVID-19 pandemic, for example. Edge computing can gather data that can help fight the spread of the virus. In the future, mobile devices might warn people about the potential for community infection by providing live updates to their devices based on processing and serving data collected from other devices (using artificial intelligence and machine learning).

In defining an edge-computing architecture, one thing is constant: The platform must be flexible and scalable to deploy a smart or intelligent application on it and in your core data center. As an open source advocate and user, this naturally triggers my interest in using open source technology to harness the power of edge computing.

This is why [KubeEdge][4], which delivers container orchestration to resource-constrained environments, is my favorite open source project of 2020. This extremely lightweight but fully compliant Kubernetes distribution was created to run cloud-native workloads in Internet of Things (IoT) devices at the network's edge.

![Edge computing architecture][5]

(Michael Calizo, [CC BY-SA 4.0][6])

### Challenges of collecting and consuming data

Having a rich data source does not mean anything if the data isn't used properly. This is the dilemma that edge computing is trying to solve. To be able to use data properly, the platform must be flexible enough to handle the demand required to collect, process, and serve data and make smart decisions about whether the data can be processed at the edge or must be processed in a regional or core data center.

The challenges when moving data from the edge location to a core data center include:

  * Network reliability
  * Security
  * Resource constraints
  * Autonomy



A Kubernetes platform on the edge, such as KubeEdge, meets these requirements, as it provides the scalability, flexibility, and security needed to perform data collection, processing, and serving. KubeEdge is open source, lightweight, and easy to deploy, has low resource requirements, and provides everything you need.

### KubeEdge's architecture

KubeEdge was [introduced in 2018][7] at KubeCon in Seattle. In 2019, it was accepted as a Cloud Native Computing Foundation (CNCF) sandbox project, which gives it wider public visibility and puts it on the way to becoming a full-fledged CNCF-sanctioned project.

![KubeEdge architecture][8]

(©2019 [The New Stack][9])

In a nutshell, KubeEdge has two main components or parts: Cloud and Edge.

#### Cloud

The Cloud part is where the Kubernetes Master components, the EdgeController, and edge CloudHub reside.

  * **CloudHub** is a communication interface module in the Cloud component. It acts as a caching mechanism to ensure changes in the Cloud part are sent to the Edge caching mechanism (EdgeHub).
  * The **EdgeController** manages the edge nodes and performs reconciliation between edge nodes.



#### Edge

The Edge part is where edge nodes are found. The most important Edge components are:

  * **EdgeHub** is a communication interface module to the Cloud component.
  * **Edged** does the kubelet's job, including managing pod lifecycles and other related kubelet jobs on the nodes.
  * **MetaManager** makes sure that all node-level metadata is persistent.
  * **DeviceTwin** is responsible for syncing devices between the Cloud and the Edge components.
  * **EventBus** handles the internal edge communications using Message Queuing Telemetry Transport (MQTT).



### Kubernetes for edge computing

Kubernetes has become the gold standard for orchestrating containerized workloads on premises and in public clouds. This is why I think KubeEdge is the perfect solution for using edge computing to reap the benefits of the data that mobile technology generates.

The KubeEdge architecture allows autonomy on an edge computing layer, which solves network latency and velocity problems. This enables you to manage and orchestrate containers in a core data center as well as manage millions of mobile devices through an autonomous edge computing layer. This is possible because of how KubeEdge uses a combination of the message bus (in the Cloud and Edge components) and the Edge component's data store to allow the edge node to be independent. Through caching, data is synchronized with the local datastore every time a handshake happens. Similar principles are applied to edge devices that require persistency.

KubeEdge handles machine-to-machine (M2M) communication differently from other edge platform solutions. KubeEdge uses [Eclipse Mosquitto][10], a popular open source MQTT broker from the Eclipse Foundation. Mosquitto enables WebSocket communication between the edge and the master nodes. Most importantly, Mosquitto allows developers to author custom logic and enable resource-constrained device communication at the edge.

**[Read next: [How to explain edge computing in plain terms][11]]**

Security is a must for M2M communication; it is the only way you can trust sensitive data sent through the web. Currently, KubeEdge supports Secure Production Identity Framework for Everyone ([SPIFFE][12]), ensuring that:

  1. Only verifiable nodes can join the edge cluster.
  2. Only verifiable workloads can run on the edge nodes.
  3. Short-lived certificates are used with rotation policies.



### Where KubeEdge is heading

KubeEdge is in the very early stage of adoption, but it is gaining popularity due to its flexible approach to making edge computing communications secure, reliable, and autonomous so that they won't be affected by network latency.

KubeEdge is a flexible, vendor-neutral, lightweight, heterogeneous edge computing platform. This enables it to support use cases such as data analysis, video analytics, machine learning, and more. Because it is vendor-neutral, KubeEdge allows big cloud players to use it.

These are the reasons why KubeEdge is my favorite project of 2020. There is much more to come, and I expect to see more contributions from the community for wider adoption. I am excited about its future of enabling us to consume available data and use it for the greater good.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/1/kubeedge

作者：[Mike Calizo][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/mcalizo
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/gears_devops_learn_troubleshooting_lightbulb_tips_520.png?itok=HcN38NOk (Tips and gears turning)
[2]: https://en.wikipedia.org/wiki/Edge_computing
[3]: https://www.gartner.com/smarterwithgartner/what-edge-computing-means-for-infrastructure-and-operations-leaders/
[4]: https://kubeedge.io/en/
[5]: https://opensource.com/sites/default/files/uploads/edgecomputing.png (Edge computing architecture)
[6]: https://creativecommons.org/licenses/by-sa/4.0/
[7]: https://www.youtube.com/watch?v=nWFkxuRvZ7U&feature=youtu.be&t=1755
[8]: https://opensource.com/sites/default/files/uploads/kubeedge-architecture.png (KubeEdge architecture)
[9]: https://thenewstack.io/kubeedge-extends-the-power-of-kubernetes-to-the-edge/
[10]: https://mosquitto.org/
[11]: https://enterprisersproject.com/article/2019/7/edge-computing-explained-plain-english
[12]: https://spiffe.io/

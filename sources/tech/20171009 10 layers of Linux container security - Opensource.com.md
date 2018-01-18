Translating by qhwdw 10 layers of Linux container security | Opensource.com
======
![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/EDU_UnspokenBlockers_1110_A.png?itok=x8A9mqVA)

Containers provide an easy way to package applications and deliver them seamlessly from development to test to production. This helps ensure consistency across a variety of environments, including physical servers, virtual machines (VMs), or private or public clouds. These benefits are leading organizations to rapidly adopt containers in order to easily develop and manage the applications that add business value.

Enterprises require strong security, and anyone running essential services in containers will ask, "Are containers secure?" and "Can we trust containers with our applications?"

Securing containers is a lot like securing any running process. You need to think about security throughout the layers of the solution stack before you deploy and run your container. You also need to think about security throughout the application and container lifecycle.

Try these 10 key elements to secure different layers of the container solution stack and different stages of the container lifecycle.

### 1. The container host operating system and multi-tenancy

Containers make it easier for developers to build and promote an application and its dependencies as a unit and to get the most use of servers by enabling multi-tenant application deployments on a shared host. It's easy to deploy multiple applications on a single host, spinning up and shutting down individual containers as needed. To take full advantage of this packaging and deployment technology, the operations team needs the right environment for running containers. Operations needs an operating system that can secure containers at the boundaries, securing the host kernel from container escapes and securing containers from each other.

### 2. Container content (use trusted sources)

Containers are Linux processes with isolation and resource confinement that enable you to run sandboxed applications on a shared host kernel. Your approach to securing containers should be the same as your approach to securing any running process on Linux. Dropping privileges is important and still the best practice. Even better is to create containers with the least privilege possible. Containers should run as user, not root. Next, make use of the multiple levels of security available in Linux. Linux namespaces, Security-Enhanced Linux ( [SELinux][1] ), [cgroups][2] , capabilities, and secure computing mode ( [seccomp][3] ) are five of the security features available for securing containers.

When it comes to security, what's inside your container matters. For some time now, applications and infrastructures have been composed from readily available components. Many of these are open source packages, such as the Linux operating system, Apache Web Server, Red Hat JBoss Enterprise Application Platform, PostgreSQL, and Node.js. Containerized versions of these packages are now also readily available, so you don't have to build your own. But, as with any code you download from an external source, you need to know where the packages originated, who built them, and whether there's any malicious code inside them.

### 3. Container registries (secure access to container images)

Your teams are building containers that layer content on top of downloaded public container images, so it's critical to manage access to and promotion of the downloaded container images and the internally built images in the same way other types of binaries are managed. Many private registries support storage of container images. Select a private registry that helps to automate policies for the use of container images stored in the registry.

### 4. Security and the build process

In a containerized environment, the software-build process is the stage in the lifecycle where application code is integrated with needed runtime libraries. Managing this build process is key to securing the software stack. Adhering to a "build once, deploy everywhere" philosophy ensures that the product of the build process is exactly what is deployed in production. It's also important to maintain the immutability of your containers--in other words, do not patch running containers; rebuild and redeploy them instead.

Whether you work in a highly regulated industry or simply want to optimize your team's efforts, design your container image management and build process to take advantage of container layers to implement separation of control, so that the:

  * Operations team manages base images
  * Architects manage middleware, runtimes, databases, and other such solutions
  * Developers focus on application layers and just write code



Finally, sign your custom-built containers so that you can be sure they are not tampered with between build and deployment.

### 5. Control what can be deployed within a cluster

In case anything falls through during the build process, or for situations where a vulnerability is discovered after an image has been deployed, add yet another layer of security in the form of tools for automated, policy-based deployment.

Let's look at an application that's built using three container image layers: core, middleware, and the application layer. An issue is discovered in the core image and that image is rebuilt. Once the build is complete, the image is pushed to the container platform registry. The platform can detect that the image has changed. For builds that are dependent on this image and have triggers defined, the platform will automatically rebuild the application image, incorporating the fixed libraries.

Add yet another layer of security in the form of tools for automated, policy-based deployment.

Once the build is complete, the image is pushed to container platform's internal registry. It immediately detects changes to images in its internal registry and, for applications where triggers are defined, automatically deploys the updated image, ensuring that the code running in production is always identical to the most recently updated image. All these capabilities work together to integrate security capabilities into your continuous integration and continuous deployment (CI/CD) process and pipeline.

### 6. Container orchestration: Securing the container platform

Once the build is complete, the image is pushed to container platform's internal registry. It immediately detects changes to images in its internal registry and, for applications where triggers are defined, automatically deploys the updated image, ensuring that the code running in production is always identical to the most recently updated image. All these capabilities work together to integrate security capabilities into your continuous integration and continuous deployment (CI/CD) process and pipeline.

Of course, applications are rarely delivered in a single container. Even simple applications typically have a frontend, a backend, and a database. And deploying modern microservices applications in containers means deploying multiple containers, sometimes on the same host and sometimes distributed across multiple hosts or nodes, as shown in this diagram.

When managing container deployment at scale, you need to consider:

  * Which containers should be deployed to which hosts?
  * Which host has more capacity?
  * Which containers need access to each other? How will they discover each other?
  * How will you control access to--and management of--shared resources, like network and storage?
  * How will you monitor container health?
  * How will you automatically scale application capacity to meet demand?
  * How will you enable developer self-service while also meeting security requirements?



Given the wealth of capabilities for both developers and operators, strong role-based access control is a critical element of the container platform. For example, the orchestration management servers are a central point of access and should receive the highest level of security scrutiny. APIs are key to automating container management at scale and used to validate and configure the data for pods, services, and replication controllers; perform project validation on incoming requests; and invoke triggers on other major system components.

### 7. Network isolation

Deploying modern microservices applications in containers often means deploying multiple containers distributed across multiple nodes. With network defense in mind, you need a way to isolate applications from one another within a cluster. A typical public cloud container service, like Google Container Engine (GKE), Azure Container Services, or Amazon Web Services (AWS) Container Service, are single-tenant services. They let you run your containers on the VM cluster that you initiate. For secure container multi-tenancy, you want a container platform that allows you to take a single cluster and segment the traffic to isolate different users, teams, applications, and environments within that cluster.

With network namespaces, each collection of containers (known as a "pod") gets its own IP and port range to bind to, thereby isolating pod networks from each other on the node. Pods from different namespaces (projects) cannot send packets to or receive packets from pods and services of a different project by default, with the exception of options noted below. You can use these features to isolate developer, test, and production environments within a cluster; however, this proliferation of IP addresses and ports makes networking more complicated. In addition, containers are designed to come and go. Invest in tools that handle this complexity for you. The preferred tool is a container platform that uses [software-defined networking][4] (SDN) to provide a unified cluster network that enables communication between containers across the cluster.

### 8. Storage

Containers are useful for both stateless and stateful applications. Protecting attached storage is a key element of securing stateful services. Container platforms should provide plugins for multiple flavors of storage, including network file systems (NFS), AWS Elastic Block Stores (EBS), GCE Persistent Disks, GlusterFS, iSCSI, RADOS (Ceph), Cinder, etc.

A persistent volume (PV) can be mounted on a host in any way supported by the resource provider. Providers will have different capabilities, and each PV's access modes are set to the specific modes supported by that particular volume. For example, NFS can support multiple read/write clients, but a specific NFS PV might be exported on the server as read only. Each PV gets its own set of access modes describing that specific PV's capabilities, such as ReadWriteOnce, ReadOnlyMany, and ReadWriteMany.

### 9. API management, endpoint security, and single sign-on (SSO)

Securing your applications includes managing application and API authentication and authorization.

Web SSO capabilities are a key part of modern applications. Container platforms can come with various containerized services for developers to use when building their applications.

APIs are key to applications composed of microservices. These applications have multiple independent API services, leading to proliferation of service endpoints, which require additional tools for governance. An API management tool is also recommended. All API platforms should offer a variety of standard options for API authentication and security, which can be used alone or in combination, to issue credentials and control access.

Securing your applications includes managing application and API authentication and authorization.

These options include standard API keys, application ID and key pairs, and OAuth 2.0.

### 10. Roles and access management in a cluster federation

These options include standard API keys, application ID and key pairs, and OAuth 2.0.

In July 2016, Kubernetes 1.3 introduced [Kubernetes Federated Clusters][5]. This is one of the exciting new features evolving in the Kubernetes upstream, currently in beta in Kubernetes 1.6. Federation is useful for deploying and accessing application services that span multiple clusters running in the public cloud or enterprise datacenters. Multiple clusters can be useful to enable application high availability across multiple availability zones or to enable common management of deployments or migrations across multiple cloud providers, such as AWS, Google Cloud, and Azure.

When managing federated clusters, you must be sure that your orchestration tools provide the security you need across the different deployment platform instances. As always, authentication and authorization are key--as well as the ability to securely pass data to your applications, wherever they run, and manage application multi-tenancy across clusters. Kubernetes is extending Cluster Federation to include support for Federated Secrets, Federated Namespaces, and Ingress objects.

### Choosing a container platform

Of course, it is not just about security. Your container platform needs to provide an experience that works for your developers and your operations team. It needs to offer a secure, enterprise-grade container-based application platform that enables both developers and operators, without compromising the functions needed by each team, while also improving operational efficiency and infrastructure utilization.

Learn more in Daniel's talk, [Ten Layers of Container Security][6], at [Open Source Summit EU][7], which will be held October 23-26 in Prague.

### About The Author
Daniel Oh;Microservives;Agile;Devops;Java Ee;Container;Openshift;Jboss;Evangelism



--------------------------------------------------------------------------------

via: https://opensource.com/article/17/10/10-layers-container-security

作者：[Daniel Oh][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/daniel-oh
[1]:https://en.wikipedia.org/wiki/Security-Enhanced_Linux
[2]:https://en.wikipedia.org/wiki/Cgroups
[3]:https://en.wikipedia.org/wiki/Seccomp
[4]:https://en.wikipedia.org/wiki/Software-defined_networking
[5]:https://kubernetes.io/docs/concepts/cluster-administration/federation/
[6]:https://osseu17.sched.com/mobile/#session:f2deeabfc1640d002c1d55101ce81223
[7]:http://events.linuxfoundation.org/events/open-source-summit-europe

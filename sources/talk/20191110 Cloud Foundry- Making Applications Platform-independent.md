[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Cloud Foundry: Making Applications Platform-independent)
[#]: via: (https://opensourceforu.com/2019/11/cloud-foundry-making-applications-platform-independent/)
[#]: author: (Neetesh Mehrotra https://opensourceforu.com/author/neetesh-mehrotra/)

Cloud Foundry: Making Applications Platform-independent
======

[![][1]][2]

_Cloud Foundry is an enterprise standard open source platform for developing and deploying cloud applications. This article gives readers an overview of it, discusses how it differs from Kubernetes and why it should be used._

Cloud Foundry is an open source, multi-cloud, multi-language application platform that supports non-stop delivery. It can be used on an individual deployment infrastructure or on any IaaS like Amazon Web Services, Azure, VMware, or vSphere, and can be deployed using the BOSH deployment system. Cloud Foundry permits an environment to run, scale and maintain applications easily. It supports most of the languages and environments like Java, NodeJS, Ruby, Python, etc. Pivotal has a business instance of Cloud Foundry called Pivotal Web Services on the AWS cloud.

Some of its features are:

  * User management
  * Middleware and OS management
  * Logging and metrics
  * Services
  * Health management
  * Scaling for high availability of platforms and applications



**The concepts of Cloud Foundry**

  * _Users_ are the users of Cloud Foundry who can manage org/space/app.
  * _Roles_ are the privileges assigned to different users like Org manager or Space manager.
  * _Orgs_ are at the top level of the platform, and can be used by different users to group apps together. Each Org has one or multiple spaces.
  * _Space_ is where apps can be deployed and where configurations can be shared. Multiple apps can be deployed in a single space. Single or multiple spaces constitute an Org.
  * _Application_ is each and every individual application that runs inside Cloud Foundry.



**Differences between Cloud Foundry and Kubernetes**
Kubernetes is a management service for containers (Dockers) like the ECS in AWS. It doesn’t perform application management. It takes care of the managing, allocating and diving tasks between containers.
On the other hand, Cloud Foundry is an application management service. It makes the whole enterprise or application platform-independent. It manages the application entirely by putting a wrapper on it to get it executed on any cloud platform independently, which gives a feeling of platform independence.

**When, where and why one should choose Cloud Foundry**
If you have a cloud related application and you don’t want to worry about operations, Cloud Foundry is the right choice, because of the following reasons:

  * Cloud Foundry favours using build packs instead of Docker containers. This means the rootFS will be updated by the platform. The developers don’t have to worry about updating the Docker image with regard to security patches.
  * Some people say that Kubernetes is better in running legacy systems and that one should use it for applications that don’t run on Cloud Foundry. I can’t provide an example application, or a description of how such an application looks like. It might be that everything that requires a file system runs better on Kubernetes. There is also a possibility of mounting persistent volumes on applications on Cloud Foundry, but this is not supported by the majority of Cloud Foundry setups.
  * Cloud Foundry is more opinionated than Kubernetes. So the latter may provide more flexibility but Cloud Foundry is easier to use. For instance, Kubernetes Pots allows optimisation of a microservices setup to reduce network latency but it is harder to configure.



![Avatar][3]

[Neetesh Mehrotra][4]

The author works at TCS as a systems engineer. His areas of interest are Java development and automation testing. He can be contacted at [mehrotra.neetesh@gmail.com][5].

[![][6]][7]

--------------------------------------------------------------------------------

via: https://opensourceforu.com/2019/11/cloud-foundry-making-applications-platform-independent/

作者：[Neetesh Mehrotra][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensourceforu.com/author/neetesh-mehrotra/
[b]: https://github.com/lujun9972
[1]: https://i2.wp.com/opensourceforu.com/wp-content/uploads/2013/12/Cloud.jpg?resize=590%2C335&ssl=1 (Cloud)
[2]: https://i2.wp.com/opensourceforu.com/wp-content/uploads/2013/12/Cloud.jpg?fit=590%2C335&ssl=1
[3]: https://secure.gravatar.com/avatar/9e923310f568db4d7e51c3067c42105f?s=100&r=g
[4]: https://opensourceforu.com/author/neetesh-mehrotra/
[5]: mailto:mehrotra.neetesh@gmail.com
[6]: https://opensourceforu.com/wp-content/uploads/2019/11/assoc.png
[7]: https://feedburner.google.com/fb/a/mailverify?uri=LinuxForYou&loc=en_US

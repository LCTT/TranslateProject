translating---geekpi

OpenShift on OpenStack: Delivering Applications Better Together
============================================================

Have you ever asked yourself, where should I run OpenShift? The answer is anywhere—it runs great on bare metal, on virtual machines, in a private cloud or in the public cloud. But, there are some reasons why people are moving to private and public clouds related to automation around full stack exposition and consumption of resources. A traditional operating system has always been about [exposition and consumption of hardware resources][2]—hardware provides resources, applications consume them, and the operating system has always been the traffic cop. But a traditional operating system has always been confined to a single machine[1].

Well, in the cloud-native world, this now means expanding this concept to include multiple operating system instances. That’s where OpenStack and OpenShift come in. In a cloud-native world, virtual machines, storage volumes and network segments all become dynamically provisioned building blocks. We architect our applications from these building blocks. They are typically paid for by the hour or minute and deprovisioned when they are no longer needed. But you need to think of them as dynamically provisioned capacity for applications. OpenStack is really good at dynamically provisioning capacity (exposition), and OpenShift is really good at dynamically provisioning applications (consumption), but how do we glue them together to provide a dynamic, highly programmable, multi-node operating system?

To understand, let’s take a look at what would happen if we installed OpenShift in a traditional environment— imagine we want to provide developers with dynamic access to create new applications or imagine we want to provide lines of business with access to provision new copies of existing applications to meet contractual obligations. Each application would need access to persistent storage. Persistent storage is not ephemeral, and in a traditional environment, this is provisioned by filing a ticket. That’s OK, we could wire up OpenShift to file a ticket every time it needs storage. A storage admin could log into the enterprise storage array and carve off volumes as needed, then hand them back to OpenShift to satisfy applications. But this would be a horribly slow, manual process—and, you would probably have storage administrators quit.

![](https://blog.openshift.com/wp-content/uploads/OpenShift-on-OpenStack-Delivering-Applications-Better-Together-Traditional-Storage-1024x615.png)

In a cloud-native world, we should think about this as a policy-driven, automated process. The storage administrator becomes more strategic, setting policies, quota, and service levels (silver, gold, etc.), but the actual provisioning becomes dynamic.

![](https://blog.openshift.com/wp-content/uploads/OpenShift-on-OpenStack-Delivering-Applications-Better-Together-Cloud-Storage-1024x655.png)

A dynamic process scales to multiple applications – this could be lines of business or even new applications being tested by developers. From 10s of applications to 1000s of applications, dynamic provisioning provides a cloud native experience.

![](https://blog.openshift.com/wp-content/uploads/OpenShift-on-OpenStack-Delivering-Applications-Better-Together-Persistent-Volume-Claims-Persistent-Volumes-Demo-1024x350.png)

The demo video below, shows how dynamic storage provisioning works with Red Hat OpenStack Platform (Cinder volumes) and Red Hat OpenShift Container Platform – but dynamic provisioning isn’t restricted to storage alone. Imagine an environment where nodes are scaled up automatically as an instance of OpenShift needs more capacity. Imagine carving off network segments for load testing a particular instance of OpenShift before pushing a particularly sensitive application change. The reasons why you need dynamic provisioning of IT building blocks goes on and on. OpenStack is really designed to do this in a programmatic, API driven way. :

[YOUTUBE VIDEO](https://youtu.be/PfWmAS9Fc7I)

OpenShift and OpenStack deliver applications better together. OpenStack dynamically provisions resources, while OpenShift dynamically consumes them. Together, they provide a flexible cloud-native solution for all of your container and virtual machine needs.

[1] High availability clustering and some specialized operating systems bridged this gap to an extent, but was generally an edge case in computing.

--------------------------------------------------------------------------------

via: https://blog.openshift.com/openshift-on-openstack-delivering-applications-better-together/

作者：[SCOTT MCCARTY ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://blog.openshift.com/author/smccartyredhat-com/
[1]:https://blog.openshift.com/author/smccartyredhat-com/
[2]:https://docs.google.com/presentation/d/139_dxpiYc5JR8yKAP8pl-FcZmOFQCuV8RyDxZqOOcVE/edit

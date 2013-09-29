Red Hat Expands Virtualization Options With Open-Source Docker
==============================================================

![redhat](http://www.eweek.com/imagesvr_ce/1773/290x195redhat1.jpg)

**Red Hat teams up with the developers behind the open-source Docker container technology to provide an alternative to virtualization hypervisors.**

Linux vendor Red Hat is working with virtualization vendor dotCloud to bring a new type of open-source container technology, called "[Docker][1]," to the Fedora community Linux project. Fedora is a Linux project that is sponsored by Red Hat.

Virtualization technology on Linux today typically includes hypervisors such as KVM and Xen as well as container technology in the form of the [Linux LXC][2] project (LinuX Containers). Fedora Project Leader Robyn Bergeron explained to eWEEK that Red Hat has been using container technology as part of its OpenShift platform-as-a-service (PaaS) solution to provide application isolation.

Docker is not the container technology that Red Hat is currently using for OpenShift, though Bergeron noted Docker does have a similar type of container approach. Bergeron said both dotCloud, the lead commercial vendor behind Docker, and Red Hat had been receiving requests about having Docker work on Red Hat-based Linux systems. The partnership between dotCloud and Red Hat will see Docker packaged for Fedora Linux as part of a collaborative open-source development.

Solomon Hykes, founder of dotCloud and the creator of the Docker project, explained to eWEEK that Docker is not a replacement for LXC containers.

"Docker uses LXC under the hood, combined with other technologies," Hykes said. "It's a collection of low-level technologies that already existed, but organized in a way that is more than the sum of its parts."

The goal is to bring to the world of [DevOps][3] a unit of technology that both developers and operations people can understand and use, according to Hykes. A Docker container contains all the binary, library and configuration files necessary to run a particular process.

"We're orienting the use of containers toward the deployment of applications, as opposed to just treating them like miniature servers," he said.

###Containers vs. Virtual Machine Hypervisors

In the enterprise server space, many system administrators today are familiar with virtualization hypervisors such as VMware ESX, Xen and KVM. Hykes sees container technology as being complementary to hypervisors.

"What has happened with hypervisors is that it's a great technology, but the industry sees it as a big hammer and is trying to use it everywhere," he said.
Hykes sees virtual machine (VM) hypervisors as a server type that provides an alternative to a bare metal machine. In contrast, the job of the container is to deliver a unit of software.

###Red Hat and Docker

As part of the development partnership with Red Hat, Hykes said his first goal is to make sure that the usage of Docker on Red Hat-based Linux systems is a smooth one. He admitted that the current Docker 0.6 version doesn't run properly on Red Hat-based Linux systems, including the Fedora Linux system. The goal with the 0.7 release will be to change that and make Red Hat-based Linux systems a first-class citizen for Docker deployments.

To date, dotCloud has raised $10 million in venture funding for its Docker development efforts. Hykes noted that there is not yet a commercial product, as his first priority is to build the Docker community and user base.

"Phase one for us at dotCloud is to make sure Docker is ubiquitous and that larger players in IT are comfortable with it," Hykes said. "Having Red Hat working with us is a huge win." 

via: http://www.eweek.com/developer/red-hat-expands-virtualization-options-with-open-source-docker.html#sthash.Dxr5KoLY.dpuf

本文由 [LCTT][] 原创翻译，[Linux中国][] 荣誉推出

译者：[Mr小眼儿][] 校对：[校对者ID][]

[LCTT]:https://github.com/LCTT/TranslateProject
[Linux中国]:http://linux.cn/portal.php
[译者ID]:http://linux.cn/space/译者ID
[校对者ID]:http://linux.cn/space/校对者ID

[1]:https://www.docker.io/
[2]:http://en.wikipedia.org/wiki/LXC
[3]:http://en.wikipedia.org/wiki/DevOps

[#]: subject: "Cloud service providers: How to keep your options open"
[#]: via: "https://opensource.com/article/22/5/cloud-service-providers-open"
[#]: author: "Seth Kenlon https://opensource.com/users/seth"
[#]: collector: "lkxed"
[#]: translator: "FelixYFZ "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "
Cloud service providers: How to keep your options open
======
No matter what level of openness your cloud service operates on, you have choices for your own environment.

![Sky with clouds and grass][1]
(Image by Flickr user: theaucitron, CC BY-SA 2.0)

For Linux users, there's a new kind of computer on the market, and it's known as the cloud.

As with the PC sitting on your desk, the laptop in your backpack, and the virtual private server you rent from your favorite web hosting service, you have your choice in vendors for cloud computing. The brand names are different than the hardware brands you've known over the years, but the concept is the same.

To run Linux, you need a computer. To run Linux on the cloud, you need a cloud service provider. And just like the hardware and firmware that ships with your computer, there's a spectrum for how open source your computing stack can be.

As a user of open source, I prefer my computing stack to be as open as possible. After a careful survey of the cloud computing market, I've developed a three-tier view of cloud service providers. Using this system as your guide, you can make intelligent choices about what cloud provider you choose.

### Open stack

A cloud that's fully open is a cloud built on open source technology from the ground up. So much cloud technology is open source, and has been from the beginning, that an open stack isn't all that difficult to accomplish, at least on the technical level. However, there are cloud providers reinventing the wheel in a proprietary way, which makes it easy to stumble into a cloud provider that's mixed a lot of closed source components in with the usual open source tooling.

If you're looking for a truly open cloud, look for a cloud provider providing [OpenStack][2] as its foundation. OpenStack provides the software infrastructure for clouds, including Software-Defined Networking (SDN) through Neutron, object storage through Swift, identity and key management, image services, and much more. Keeping with my hardware computer analogy, OpenStack is the "kernel" that powers the cloud.

I don't mean that literally, of course, but if your cloud provider runs OpenStack, that's reasonably as far down in the stack as you can go. From a user perspective, OpenStack is the reason your cloud exists and has a filesystem, network, and so on.

Sitting on top of OpenStack, there may be a web UI such as Horizon or Skyline, and there may be extra components such as [OpenShift][3] or OKD (not an acronym, but formerly known as OpenShift Origin). All of these are open source, and they help you run containers, which are minimalist Linux images with applications embedded within them.

Because OpenShift and OKD don't require OpenStack, that's the next tier of my cloud-based world view.

### Open platform

You don't always have a choice in which stack your cloud is running. Instead of OpenStack, your cloud might be running Azure, Amazon Web Services (AWS), or something similar.

Those are the "binary blobs" of the cloud world. You have no insight into how or why they work; all you know is that your cloud exists and has a filesystem, a networking stack, and so on.

Just as with desktop computing, you can have an "operating system" running on the box you've been given. Again, I'm not speaking literally, and there's a strong argument that OpenStack itself is essentially an operating system for the cloud. Still, it's usually OpenShift that a cloud user interacts with directly.

OpenShift is an open source "desktop" or workspace in which you can manage containers and pods with Podman and Kubernetes. It lets you run applications on the cloud much as you might launch an app on your laptop.

### Open standards

Last but not least, there are those situations when you have no choice in cloud service providers. You're put on a platform with a proprietary "kernel," a proprietary "operating system," and all that's left for you to influence is what you run inside that environment.

All is not lost.

When you're dealing with open source, you have the ability to construct your own scaffolding. You can choose what components you use inside your containers. You can and should design your working environment around open source tools, because if you do get to change service providers, you can take everything you've built with you.

This might mean implementing something already built into the (non-open) platform you're stuck on. For instance, your cloud provider might entice you with an API management system or continuous integration/continuous delivery (CI/CD) pipeline that's included in their platform "for free," but you know better. When a non-open application is offered as "free," it usually bears a cost in some other form. One cost is that once you start building on top of it, you'll be all the more hesitant to migrate away because you know that you'll have to leave behind everything you built.

Instead of using the closed "features" of your cloud provider, reimplement those services as open source for your own use. Run [Jenkins][4] and [APIMan][5] in containers. Find the problems your cloud provider claims to solve with proprietary code, then use an open source solution to ensure that, when you leave for an open provider, you can migrate the system you've built.

### Open source computing

For too many people, cloud computing is a place where open source is incidental. In reality, open source is as important on the cloud as it is on your personal computer and the servers powering the internet.

Look for open source cloud services.

When you're stuck with something that doesn't provide source code, be the one using open source in your cloud.

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/5/cloud-service-providers-open

作者：[Seth Kenlon][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lkxed
[1]: https://opensource.com/sites/default/files/lead-images/bus-cloud.png
[2]: https://opensource.com/resources/what-is-openstack
[3]: https://cloud.redhat.com/?intcmp=7013a000002qLH8AAM
[4]: https://opensource.com/article/19/9/intro-building-cicd-pipelines-jenkins
[5]: https://www.apiman.io/latest/

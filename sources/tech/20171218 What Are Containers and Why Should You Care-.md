What Are Containers and Why Should You Care?
======
What are containers? Do you need them? Why? In this article, we aim to answer some of these basic questions.

But, to answer these questions, we need more questions.  When you start considering how containers might fit into your world, you need to ask: Where do you develop your application? Where do you test it and where is it deployed?

You likely develop your application on your work laptop, which has all the libraries, packages, tools, and framework needed to run that application. It's tested on a platform that resembles the production machine and then it's deployed in production. The problem is that not all three environments are the same; they don't have same tools, frameworks, and libraries. And, the app that works on your dev machine may not work in the production environment.

Containers solved that problem. As Docker explains, "a container image is a lightweight, standalone, executable package of a piece of software that includes everything needed to run it: code, runtime, system tools, system libraries, settings."

What this means is that once an application is packaged as a container, the underlying environment doesn't really matter. It can run anywhere, even on a multi-cloud environment. That's one of the many reasons containers became so popular among developers, operations teams, and even CIOs.

### Containers for developers

Now developers or operators don't have to concern themselves with what platforms they are using to run applications. Devs don't have to tell ops that "it worked on my system" anymore.

Another big advantage of containers is isolation and security. Because containers isolate the app from the platform, the app remains safe and keeps everything around it safe. At the same time, different teams can run different applications on the same infrastructure at the same time -- something that's not possible with traditional apps.

Isn't that what virtual machines (VM) offer? Yes and no. VMs do offer isolation, but they have massive overhead. [In a white paper][1], Canonical compared containers with VM and wrote, "Containers offer a new form of virtualization, providing almost equivalent levels of resource isolation as a traditional hypervisor. However, containers are lower overhead both in terms of lower memory footprint and higher efficiency. This means higher density can be achieved -- simply put, you can get more for the same hardware." Additionally, VMs take longer to provision and start; containers can be spinned up in seconds, and they boot instantly.

### Containers for ecosystem

A massive ecosystem of vendors and solutions now enable companies to deploy containers at scale, whether it's orchestration, monitoring, logging, or lifecycle management.

To ensure that containers run everywhere, the container ecosystem came together to form the [Open Container Initiative][2] (OCI), a Linux Foundation project to create specifications around two core components of containers -- container runtime and container image format. These two specs ensure that there won't be any fragmentation in the container space.

For a long time, containers were specific to the Linux kernel, but Microsoft has been working closely with Docker to bring support for containers on Microsoft's platform. Today you can run containers on Linux, Windows, Azure, AWS, Google Compute Engine, Rackspace, and mainframes. Even VMware is adopting containers with [vSphere Integrated Container][3] (VIC), which lets  IT pros run containers and traditional workloads on their platforms.

### Containers for CIOs

Containers are very popular among developers for all the reasons mentioned above, and they offer great advantages for CIOs, too. The biggest advantage of moving to containerized workloads is changing the way companies operate.

Traditional applications have a life-cycle of a about a decade. New versions are released after years of work and because they are platform dependent, sometimes they don't see production for years. Due to this lifecycle, developers try to cram in as many features as they can, which can make the application monolithic, big, and buggy.

This process affects the innovative culture within companies. When people don't see their ideas translated into products for months and years, they are demotivated.

Containers solve that problem, because you can break the app into smaller microservices. You can develop, test, and deploy in a matter of weeks or days. New features can be added as new containers. They can go into production as soon as they are out of testing. Companies can move faster and stay ahead of the competitors. This approach breeds innovation as ideas can be translated into containers and deployed quickly.

### Conclusion

Containers solve many problems that traditional workloads face. However, they are not the answer to every problem facing IT professionals. They are one of many solutions. In the next article, we'll cover some of the basic terminology of containers, and then we will explain how to get started with containers.

Learn more about Linux through the free ["Introduction to Linux" ][4] course from The Linux Foundation and edX.

--------------------------------------------------------------------------------

via: https://www.linux.com/blog/intro-to-Linux/2017/12/what-are-containers-and-why-should-you-care

作者：[wapnil Bhartiya][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linux.com/users/arnieswap
[1]:https://www.ubuntu.com/containers
[2]:https://www.opencontainers.org/
[3]:https://www.vmware.com/products/vsphere/integrated-containers.html
[4]:https://training.linuxfoundation.org/linux-courses/system-administration-training/introduction-to-linux

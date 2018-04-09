Containerization, Atomic Distributions, and the Future of Linux
======

![](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/atomic-distro.jpg?itok=SjBeCDtq)
Linux has come a long way since Linus Torvalds announced it in 1991. It has become the dominant operating system in the enterprise space. And, although we’ve seen improvements and tweaks in the desktop environment space, the model of a typical Linux distribution has largely remained the same over the past 25+ years. The traditional package management based model has dominated both the desktop and server space.

However, things took an interesting turn when Google launched Linux-based Chrome OS, which deployed an image-based model. Core OS (now owned by Red Hat) came out with an operating system (Container Linux) that was inspired by Google but targeted at enterprise customers.

Container Linux changed the way operating systems update. It changed the way applications were delivered and updated. Is this the future of Linux distributions? Will it replace the traditional package-based distribution model?

### Three models

Matthias Eckermann, Director of Product Management for SUSE Linux Enterprise, thinks there are not two but three models. “Outside of the traditional (RHEL/SLE) and the image-based model (RH Atomic Host), there is a third model: transactional. This is where [SUSE CaaS Platform][1] and its SUSE MicroOS lives,” said Eckermann.

### What’s the difference?

Those who live in Linux land are very well aware of the traditional model. It’s made up of single packages and shared libraries. This model has its own benefit as application developers don’t have to worry about bundling libraries with their apps. There is no duplication, which keeps the system lean and thin. It also saves bandwidth as users don’t have to download a lot of packages. Distributions have total control over packages so security issues can be fixed easily by pushing updates at the system level.

“Traditional packaging continues to provide the opportunity to carefully craft and tune an operating system to support mission-critical workloads that need to stand the test of time,” said Ron Pacheco, Director of Product Management at Red Hat Enterprise Linux.

But the traditional model has some disadvantages, too. App developers must restrict themselves to the libraries shipped with the distro, which means they can’t take advantage of new packages for their apps if the distro doesn’t support them. It could also lead to conflict between two different versions. As a result, it creates administration challenges as they are often difficult to keep updated and in sync.

### Image-based Model

That’s where the image based model comes to the rescue. “The image-based model solves the problems of the traditional model as it replaces the operating system at every reiteration and doesn't work with single packages,” said Eckermann.

“When we talk about the operating system as an image, what we’re really talking about is developing and deploying in a programmatic way and with better integrated life cycle management,” said Pacheco, giving the example of OpenShift, which is built on top of Red Hat Enterprise Linux.

Pacheco sees the image-based OS as a continuum, from hand-tooling a deployed image to a heavily automated infrastructure that can be managed at a large scale; regardless of where a customer is on this range, the same applications have to run. “You don't want to create a silo by using a wholly different deployment model,” he said.

The image-based model replaces the entire OS with new libraries and packages, which introduces its own set of problems. The image-based model has to be reconstructed to meet the needs of specific environments. For example, if the user has a specific need for installing a specific hardware driver or low-level monitoring option, the image model fails, or options to have finer granularity have to be re-invented.

### Transactional model

The third model is transactional updates, which follows the traditional package-based updates, but instead handles all packages as if they were images, updating all the packages that belong together in one shot like an image.

“The difference is because they are single packages that are grouped together as well as on descending and the installation, the customer has the option to influence this if necessary. This gives the user extra flexibility by combining the benefits of both and avoiding the disadvantages associated with the traditional or image model,” said Eckermann.

Pacheco said that it’s becoming increasingly common for carefully crafted workloads to be deployed as images in order to deploy consistently, reliably, and to do so with elasticity. “This is what we see our customers do today when they create and deploy virtual machines on premises or on public/private clouds as well as on traditional bare metal deployments,” he said.

Pacheco suggests that we should not look at these models as strictly a “compare and contrast scenario,” but rather as an evolution and expansion of the operating system’s role.

### Arrival of Atomic Updates

Google’s Chrome OS and the Core OS popularized the concept of transactional updates, a model followed by both Red Hat and SUSE.

“The real problem is the operating system underlining the container host operating system is not in focus anymore -- at least not in a way the administrator should care about. Both RH Atomic Host and SUSE CaaS Platform solve this problem similarly from a user experience perspective,” said Eckermann.

[Immutable infrastructure][2], such as that provided by SUSE CaaS Platform, Red Hat Atomic Host, and Container Linux (formerly Core OS), encourages the use of transactional updates. “Having a model where the host always moves to a ‘known good’ state enables better confidence with updates, which in turn enables a faster flow of features, security benefits, and an easier-to-adopt operational model,” said Ben Breard, senior technology product manager, Red Hat.

These newer OSes isolate the applications from the underlying host with Linux containers thereby removing many of the traditional limitations associated with infrastructure updates.

“The real power and benefits are realized when the orchestration layer is intelligently handling the updates, deployments, and, ultimately, seamless operations,” added Breard.

### The Future

What does the future hold for Linux? The answer really depends on who you ask. Container players will say the future belongs to containerized OS, but Linux vendors who still have a huge market may disagree.

When asked if, in the long run, atomic distros will replace traditional distributions, Eckermann said, “If I say yes, then I am following the trend; if I say no, I will be considered old-fashioned. Nevertheless, I say no: atomic distros will not replace traditional distros in the long run -- but traditional workloads and containerized workloads will live together in data centers as well as private and public cloud environments.”

Pacheco maintained that the growth in Linux deployments, in general, makes it difficult to imagine one model replacing the other. He said that instead of looking at them as competing models, we should look at atomic distributions as part of the evolution and deployment of the operating system.

Additionally, there are many use-cases that may need a mix of both species of Linux distributions. “Imagine the large number of PL/1 and Cobol systems in banks and insurance companies. Think about in-memory databases and core data bus systems,” said Eckermann.

Most of these applications can’t be containerized. As much as we would like to think, containerization is not a silver bullet that solves every problem. There will always be a mix of different technologies.

Eckermann believes that over time, a huge number of new developments and deployments will go into containerization, but there is still good reason to keep traditional deployment methods and applications in the enterprise.

“Customers need to undergo business, design, and cultural transformations in order to maximize the advantages that container-based deployments are delivering. The good news is that the industry understands this, as a similar transformation at scale occurred with the historical moves from mainframes to UNIX to x86 to virtualization,” said Pacheco.

### Conclusion

It’s apparent that the volume of containerized workloads will increase in the future, which translates into more demand for atomic distros. In the meantime, a substantial percentage of workloads may remain on traditional distros that will keep them running. What really matters is that both players have invested heavily in new models and are ready to tweak their strategy as the market evolves. An external observer can clearly see that the future belongs to transactional/atomic models. We have seen the evolution of datacenter; we have come a long way from one application per server to function-as-a-service model. It is not far fetched to see Linux distros entering the atomic phase.

--------------------------------------------------------------------------------

via: https://www.linux.com/blog/2018/4/containerization-atomic-distributions-and-future-linux

作者：[SWAPNIL BHARTIYA][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)
选题：[lujun9972](https://github.com/lujun9972)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linux.com/users/arnieswap
[1]:https://www.suse.com/products/caas-platform/
[2]:https://www.digitalocean.com/community/tutorials/what-is-immutable-infrastructure

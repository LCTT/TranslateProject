[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Do Linux distributions still matter with containers?)
[#]: via: (https://opensource.com/article/19/2/linux-distributions-still-matter-containers)
[#]: author: (Scott McCarty https://opensource.com/users/fatherlinux)

Do Linux distributions still matter with containers?
======
There are two major trends in container builds: using a base image and building from scratch. Each has engineering tradeoffs.
![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/cube_innovation_process_block_container.png?itok=vkPYmSRQ)

Some people say Linux distributions no longer matter with containers. Alternative approaches, like distroless and scratch containers, seem to be all the rage. It appears we are considering and making technology decisions based more on fashion sense and immediate emotional gratification than thinking through the secondary effects of our choices. We should be asking questions like: How will these choices affect maintenance six months down the road? What are the engineering tradeoffs? How does this paradigm shift affect our build systems at scale?

It's frustrating to watch. If we forget that engineering is a zero-sum game with measurable tradeoffs—advantages and disadvantages, with costs and benefits of different approaches— we do ourselves a disservice, we do our employers a disservice, and we do our colleagues who will eventually maintain our code a disservice. Finally, we do all of the maintainers ([hail the maintainers!][1]) a disservice by not appreciating the work they do.

### Understanding the problem

To understand the problem, we have to investigate why we started using Linux distributions in the first place. I would group the reasons into two major buckets: kernels and other packages. Compiling kernels is actually fairly easy. Slackware and Gentoo (I still have a soft spot in my heart) taught us that.

On the other hand, the tremendous amount of development and runtime software that needs to be packaged for a usable Linux system can be daunting. Furthermore, the only way you can ensure that millions of permutations of packages can be installed and work together is by using the old paradigm: compile it and ship it together as a thing (i.e., a Linux distribution). So, why do Linux distributions compile kernels and all the packages together? Simple: to make sure things work together.

First, let's talk about kernels. The kernel is special. Booting a Linux system without a compiled kernel is a bit of a challenge. It's the core of a Linux operating system, and it's the first thing we rely on when a system boots. Kernels have a lot of different configuration options when they're being compiled that can have a tremendous effect on how hardware and software run on one. A secondary problem in this bucket is that system software, like compilers, C libraries, and interpreters, must be tuned for the options you built into the kernel. Gentoo taught us this in a visceral way, which turned everyone into a miniature distribution maintainer.

Embarrassingly (because I have worked with containers for the last five years), I must admit that I have compiled kernels quite recently. I had to get nested KVM working on RHEL 7 so that I could run [OpenShift on OpenStack][2] virtual machines, in a KVM virtual machine on my laptop, as well as [our Container Development Kit (CDK][3]). #justsayin Suffice to say, I fired RHEL7 up on a brand new 4.X kernel at the time. Like any good sysadmin, I was a little worried that I missed some important configuration options and patches. And, of course, I had missed some things. Sleep mode stopped working right, my docking station stopped working right, and there were numerous other small, random errors. But it did work well enough for a live demo of OpenShift on OpenStack, in a single KVM virtual machine on my laptop. Come on, that's kinda' fun, right? But I digress…

Now, let's talk about all the other packages. While the kernel and associated system software can be tricky to compile, the much, much bigger problem from a workload perspective is compiling thousands and thousands of packages to give us a useable Linux system. Each package requires subject matter expertise. Some pieces of software require running only three commands: **./configure** , **make** , and **make install**. Others require a lot of subject matter expertise ranging from adding users and configuring specific defaults in **etc** to running post-install scripts and adding systemd unit files. The set of skills necessary for the thousands of different pieces of software you might use is daunting for any single person. But, if you want a usable system with the ability to try new software whenever you want, you have to learn how to compile and install the new software before you can even begin to learn to use it. That's Linux without a Linux distribution. That's the engineering problem you are agreeing to when you forgo a Linux distribution.

The point is that you have to build everything together to ensure it works together with any sane level of reliability, and it takes a ton of knowledge to build a usable cohort of packages. This is more knowledge than any single developer or sysadmin is ever going to reasonably learn and retain. Every problem I described applies to your [container host][4] (kernel and system software) and [container image][5] (system software and all other packages)—notice the overlap; there are compilers, C libraries, interpreters, and JVMs in the container image, too.

### The solution

You already know this, but Linux distributions are the solution. Stop reading and send your nearest package maintainer (again, hail the maintainers!) an e-card (wait, did I just give my age away?). Seriously though, these people do a ton of work, and it's really underappreciated. Kubernetes, Istio, Prometheus, and Knative: I am looking at you. Your time is coming too, when you will be in maintenance mode, overused, and underappreciated. I will be writing this same article again, probably about Kubernetes, in about seven to 10 years.

### First principles with container builds

There are tradeoffs to building from scratch and building from base images.

#### Building from base images

Building from base images has the advantage that most build operations are nothing more than a package install or update. It relies on a ton of work done by package maintainers in a Linux distribution. It also has the advantage that a patching event six months—or even 10 years—from now (with RHEL) is an operations/systems administrator event (yum update), not a developer event (that requires picking through code to figure out why some function argument no longer works).

Let's double-click on that a bit. Application code relies on a lot of libraries ranging from JSON munging libraries to object-relational mappers. Unlike the Linux kernel and Glibc, these types of libraries change with very little regard to breaking API compatibility. That means that three years from now your patching event likely becomes a code-changing event, not a yum update event. Got it, let that sink in. Developers, you are getting paged at 2 AM if the security team can't find a firewall hack to block the exploit.

Building from a base image is not perfect; there are disadvantages, like the size of all the dependencies that get dragged in. This will almost always make your container images larger than building from scratch. Another disadvantage is you will not always have access to the latest upstream code. This can be frustrating for developers, especially when you just want to get something out the door, but not as frustrating as being paged to look at a library you haven't thought about in three years that the upstream maintainers have been changing the whole time.

If you are a web developer and rolling your eyes at me, I have one word for you: DevOps. That means you are carrying a pager, my friend.

#### Building from scratch

Scratch builds have the advantage of being really small. When you don't rely on a Linux distribution in the container, you have a lot of control, which means you can customize everything for your needs. This is a best-of-breed model, and it's valid in certain use cases. Another advantage is you have access to the latest packages. You don't have to wait for a Linux distro to update anything. You are in control, so you choose when to spend the engineering work to incorporate new software.

Remember, there is a cost to controlling everything. Often, updating to new libraries with new features drags in unwanted API changes, which means fixing incompatibilities in code (in other words, [shaving yaks][6]). Shaving yaks at 2 AM when the application doesn't work is not fun. Luckily, with containers, you can roll back and shave the yaks the next business day, but it will still eat into your time for delivering new value to the business, new features to your applications. Welcome to the life of a sysadmin.

OK, that said, there are times that building from scratch makes sense. I will completely concede that statically compiled Golang programs and C programs are two decent candidates for scratch/distroless builds. With these types of programs, every container build is a compile event. You still have to worry about API breakage three years from now, but if you are a Golang shop, you should have the skillset to fix things over time.

### Conclusion

Basically, Linux distributions do a ton of work to save you time—on a regular Linux system or with containers. The knowledge that maintainers have is tremendous and leveraged so much without really being appreciated. The adoption of containers has made the problem even worse because it's even further abstracted.

With container hosts, a Linux distribution offers you access to a wide hardware ecosystem, ranging from tiny ARM systems, to giant 128 CPU x86 boxes, to cloud-provider VMs. They offer working container engines and container runtimes out of the box, so you can just fire up your containers and let somebody else worry about making things work.

For container images, Linux distributions offer you easy access to a ton of software for your projects. Even when you build from scratch, you will likely look at how a package maintainer built and shipped things—a good artist is a good thief—so, don't undervalue this work.

So, thank you to all of the maintainers in Fedora, RHEL (Frantisek, you are my hero), Debian, Gentoo, and every other Linux distribution. I appreciate the work you do, even though I am a "container guy."

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/2/linux-distributions-still-matter-containers

作者：[Scott McCarty][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/fatherlinux
[b]: https://github.com/lujun9972
[1]: https://aeon.co/essays/innovation-is-overvalued-maintenance-often-matters-more
[2]: https://blog.openshift.com/openshift-on-openstack-delivering-applications-better-together/
[3]: https://developers.redhat.com/blog/2018/02/13/red-hat-cdk-nested-kvm/
[4]: https://developers.redhat.com/blog/2018/02/22/container-terminology-practical-introduction/#h.8tyd9p17othl
[5]: https://developers.redhat.com/blog/2018/02/22/container-terminology-practical-introduction/#h.dqlu6589ootw
[6]: https://en.wiktionary.org/wiki/yak_shaving

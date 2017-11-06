jrglinux is translating!!!

But I don't know what a container is
============================================================

### Here's how containers are both very much like — and very much unlike — virtual machines.


![But I don't know what a container is](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/container-ship.png?itok=pqZYgQ7K "But I don't know what a container is")
Image by : opensource.com

I've been speaking about security in DevOps—also known as "DevSecOps"[*][9]—at a few conferences and seminars recently, and I've started to preface the discussion with a quick question: "Who here understands what a container is?" Usually I don't see many hands going up,[**][10]  so I've started briefly explaining what containers[***][11] are before going much further.

To be clear: You  _can_  do DevOps without containers, and you  _can_  do DevSecOps without containers. But containers lend themselves so well to the DevOps approach—and to DevSecOps, it turns out—that even though it's possible to do DevOps without them, I'm going to assume that most people will use containers.

### What is a container?

Linux Containers

*   [What are Linux containers?][1]

*   [What is Docker?][2]

*   [What is Kubernetes?][3]

*   [An introduction to container terminology][4]

I was in a meeting with colleagues a few months ago, and one of them was presenting on containers. Not everybody around the table was an expert on the technology, so he started simply. He said something like, "There's no mention of containers in the Linux kernel source code." This, it turned out, was a dangerous statement to make in this particular group, and within a few seconds, both my boss (sitting next to me) and I were downloading the recent kernel source tarballs and performing a count of the exact number of times that the word "container" occurred. It turned out that his statement wasn't entirely correct. To give you an idea, I just tried it on an old version (4.9.2) I have on a laptop—it turns out 15,273 lines in that version include the word "container."[****][16] My boss and I had a bit of a smirk and ensured we corrected him at the next break.

What my colleague meant to say—and clarified later—is that the concept of a container doesn't really exist as a clear element within the Linux kernel. In other words, containers use a number of abstractions, components, tools, and mechanisms from the Linux kernel, but there's nothing very special about these; they can also be used for other purposes. So, there's "no such thing as a container, according to the Linux kernel."

What, then, is a container? Well, I come from a virtualization—hypervisor and virtual machine (VM)—background, and, in my mind, containers are both very much like and very much unlike VMs. I realize that this may not sound very helpful, but let me explain.

### How is a container like a VM?

The main way in which a container is like a VM is that it's a unit of execution. You bundle something up—an image—which you can then run on a suitably equipped host platform. Like a VM, it's a workload on a host, and like a VM, it runs at the mercy of that host. Beyond providing workloads with the resources they need to do their job (CPU cycles, networking, storage access, etc.), the host has a couple of jobs that it needs to do:

1.  Protect workloads from each other, and make sure that a malicious, compromised, or poorly written workload cannot affect the operation of any others.

2.  Protect itself (the host) from workloads, and make sure that a malicious, compromised, or poorly written workload cannot affect the operation of the host.

The ways VMs and containers achieve this isolation are fundamentally different, with VMs isolated by hypervisors making use of hardware capabilities, and containers isolated via software controls provided by the Linux kernel.[******][12]These controls revolve around various "namespaces" that ensure one container can't see other containers' files, users, network connections, etc.—nor those of the host. These can be supplemented by tools such as SELinux, which provide capabilities controls for further isolation of containers.

### How is a container unlike a VM?

The problem with the description above is that if you're even vaguely hypervisor-aware, you probably think that a container is just like a VM, and it  _really_  isn't.

A container, first and foremost,[*******][6] is a packaging format. "WHAT?" you say, "but you just said it was something that was executed." Well, yes, but the main reason containers are so interesting is that it's very easy to create the images from which they're instantiated, and those images are typically much,  _much_  smaller than for VMs. For this reason, they take up very little memory and can be spun up and spun down very, very quickly. Having a container that sits around for just a few minutes or even seconds (OK, milliseconds, if you like) is an entirely sensible and feasible idea. For VMs, not so much.

Given that containers are so lightweight and easy to replace, people are using them to create microservices—minimal components split out of an application that can be used by one or many other microservices to build into whatever you want. Given that you plan to put only what you need for a particular function or service within a container, you're now free to make it very small, which means that writing new ones and throwing away the old ones becomes very practicable. I'll follow up on this and some of the impacts this might have on security, and hence DevSecOps, in a future article.

Hopefully this has been a useful intro to containers, and you're motivated to learn more about DevSecOps. (And if you aren't, just pretend.)

* * *

* I think SecDevOps reads oddly, and DevOpsSec tends to get pluralized, and then you're on an entirely different topic.

** I should note that this isn't just with British audiences, who are reserved and don't like drawing attention to themselves. This also happens with Canadian and U.S. audiences who, well … are different in that regard.

*** I'm going to be talking about Linux containers. I'm aware there's history here, so it's worth noting. In case of pedantry.

**** I used **grep -ir container linux-4.9.2 | wc -l** in case you're interested.[*****][13]

***** To be fair, at a quick glance, a number of those uses have nothing to do with containers in the way we're discussing them as "Linux containers," but refer to abstractions, which can be said to contain other elements, and are, therefore, logically referred to as containers.

****** There are clever ways to combine VMs and containers to benefit from the strengths of each. I'm not going into those today.

 _*******_Well, apart from the execution bit that we just covered, obviously.

 _This article originally appeared on [Alice, Eve, and Bob—a security blog][7] and is republished with permission._

--------------------------------------------------------------------------------

作者简介：

Mike Bursell - I've been in and around Open Source since around 1997, and have been running (GNU) Linux as my main desktop at home and work since then: not always easy...  I'm a security bod and architect, and am currently employed as Chief Security Architect for Red Hat.  I have a blog - "Alice, Eve & Bob" - where I write (sometimes rather parenthetically) about security.  I live in the UK and like single malts.

--------------------------------------------------------------------------------

via: https://opensource.com/article/17/10/what-are-containers

作者：[Mike Bursell][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/mikecamel
[1]:https://opensource.com/resources/what-are-linux-containers?utm_campaign=containers&intcmp=70160000000h1s6AAA
[2]:https://opensource.com/resources/what-docker?utm_campaign=containers&intcmp=70160000000h1s6AAA
[3]:https://opensource.com/resources/what-is-kubernetes?utm_campaign=containers&intcmp=70160000000h1s6AAA
[4]:https://developers.redhat.com/blog/2016/01/13/a-practical-introduction-to-docker-container-terminology/?utm_campaign=containers&intcmp=70160000000h1s6AAA
[5]:https://opensource.com/article/17/10/what-are-containers?rate=sPHuhiD4Z3D3vJ6ZqDT-wGp8wQjcQDv-iHf2OBG_oGQ
[6]:https://opensource.com/article/17/10/what-are-containers#*******
[7]:https://aliceevebob.wordpress.com/2017/07/04/but-i-dont-know-what-a-container-is/
[8]:https://opensource.com/user/105961/feed
[9]:https://opensource.com/article/17/10/what-are-containers#*
[10]:https://opensource.com/article/17/10/what-are-containers#**
[11]:https://opensource.com/article/17/10/what-are-containers#***
[12]:https://opensource.com/article/17/10/what-are-containers#******
[13]:https://opensource.com/article/17/10/what-are-containers#*****
[14]:https://opensource.com/users/mikecamel
[15]:https://opensource.com/users/mikecamel
[16]:https://opensource.com/article/17/10/what-are-containers#****

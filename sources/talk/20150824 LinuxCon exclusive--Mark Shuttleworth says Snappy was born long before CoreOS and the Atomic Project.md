LinuxCon exclusive: Mark Shuttleworth says Snappy was born long before CoreOS and the Atomic Project
================================================================================
![](http://images.techhive.com/images/article/2015/08/mark-100608730-primary.idge.jpg)

Mark Shuttleworth at LinuxCon Credit: Swapnil Bhartiya 

> Mark Shuttleworth, founder of Canonical and Ubuntu, made a surprise visit at LinuxCon. I sat down with him for a video interview and talked about Ubuntu on IBM’s new LinuxONE systems, Canonical’s plans for containers, open source in the enterprise space and much more.

### You made a surprise entry during the keynote. What brought you to LinuxCon? ###

**Mark Shuttleworth**: I am here at LinuxCon to support IBM and Canonical in their announcement of Ubuntu on their new Linux-only super-high-end mainframe LinuxONE. These are the biggest machines in the world, purpose-built to run only Linux. And we will be bringing Ubuntu to them, which is a real privilege for us and is going to be incredible for developers. 

![mark selfie](http://images.techhive.com/images/article/2015/08/mark-selfie-100608731-large.idge.jpg)

Swapnil Bhartiya

Mark Shuttleworth and Swapnil Bhartiya, mandatory selfie at LinuxCon 

### Only Red Hat and SUSE were supported on it. Why was Ubuntu missing from the mainframe scene?  ###

**Mark**: Ubuntu has always been about developers. It has been about enabling the free software platform from where it is collaboratively built to be available at no cost to developers in the world, so they are limited only by their imagination—not by money, not by geography. 

There was an incredible story told today about a 12-year-old kid who started out with Ubuntu; there are incredible stories about people building giant businesses with Ubuntu. And for me, being able to empower people, whether they come from one part of the world or another to express their ideas on free software, is what Ubuntu is all about. It's been a journey for us essentially, going to the platforms those developers care about, and just in the last year, we suddenly saw a flood of requests from companies who run mainframes, who are using Ubuntu for their infrastructure—70% of OpenStack deployments are on Ubuntu. Those same people said, “Look, there is the mainframe, and we like to unleash it and think of it as a region in the cloud.” So when IBM started talking to us, saying that they have this project in the works, it felt like a very natural fit: You are going to be able to take your Ubuntu laptop, build code there and ship it straight to every cloud, every virtualization environment, every bare metal in every architecture including the mainframe, and that's going to be beautiful. 

### Will Canonical be offering support for these systems? ###

**Mark**: Yes. Ubuntu on z Systems is going to be completely supported. We will make long-term commitments to that. The idea is to bring together scale-out-fast cloud-like workloads, which is really born on Ubuntu; 70% of workloads on Amazon and other public clouds run on Ubuntu. Now you can think of running that on a mainframe if that makes sense to you.

We are going to provide exactly the same platform that we do on the cloud, and we are going to provide that on the mainframe as well. We are also going to expose it to the OpenStack API so you can consume it on a mainframe with exactly the same tools and exactly the same processes that you would consume on a laptop, or OpenStack or public cloud resources. So all of the things that Ubuntu builds to make your life easy as a developer are going to be available across that full range of platforms and systems, and all of that is commercially supported. 

### Canonical is doing a lot of things: It is into enterprise, and it’s in the consumer space with mobile and desktop. So what is the core focus of Canonical now?  ###

**Mark**: The trick for us is to enable the reuse of specifically the same parts [of our technology] in as many useful ways as possible. So if you look at the work that we do at z Systems, it's absolutely defined by the work that we do on the cloud. We want to deliver exactly the same libraries on exactly the same date for the mainframe as we do for public clouds and for x86, ARM and Power servers today.

We don't allow Ubuntu or our focus to fragment very dramatically because we don't allow different products managers to find Ubuntu in different ways in different environments. We just want to bring that standard experience that developers love to this new environment.

Similarly if you look at the work we are doing on IoT [Internet of Things], Snappy Ubuntu is the heart of the phone. It’s the phone without the GUI. So the definitions, the tools, the kernels, the mechanisms are shared across those projects. So we are able to multiply the impact of the work. We have an incredible community, and we try to enable the community to do things that they want to do that we can’t do. So that's why we have so many buntus, and it's kind of incredible for me to see what they do with that.

We also see the community climbing in. We see hundreds of developers working with Snappy for IoT, and we see developers working with Snappy on mobile, for personal computing as convergence becomes real. And, of course, there is the cloud server story: 70% of the world is Ubuntu, so there is a huge audience. We don't have to do all the work that we do; we just have to be open and willing to, kind of, do the core infrastructure and then reuse it as efficiently as possible. 

### Is Snappy a response to Atomic or CoreOS?  ###

**Mark**: Snappy as a project was born four years ago when we started working on the phone, which was long before the CoreOS, long before Atomic. I think the principles of atomicity, transactionality are beautiful, but remember: We needed to build the same things for the phone. And with Snappy, we have the ability to deliver transactional updates to any of these systems—phones, servers and cloud devices. 

Of course, it feels a little different because in order to provide those guarantees, we have to shape the system in such a way that we can guarantee the guarantees. And that's why Snappy is snappy; it's a new thing. It's not based on an old packaging system. Though we will keep both of them: All Snaps for us that Canonical makes, the core snaps that define the OS, are all built from Debian packages. They are two different faces of the same coin for us, and developers will use them as tools. We use the right tools for the job.

There are couple of key advantages for Snappy over CoreOS and Atomic, and the main one is this: We took the view that we wanted the base idea to be extensible. So with Snappy, the core operating system is tiny. You make all the choices, and you take all the decisions about things you want to bolt on that: you want to bolt on Docker; you want to bolt on Kubernete; you want to bolt on Mesos; you want to bolt on Lattice from Pivotal;  you want to bolt on OpenStack. Those are the things you choose to add with Snappy. Whereas with Atomic and CoreOS, it's one blob and you have to do it exactly the way they want you to do it. You have to live with the versions of software and the choices they make.

Whereas with Snappy, we really preserve this idea of the choices you have got in Ubuntu are now transactionally available on Snappy systems. That makes the core much smaller, and it gives you the choice of different container systems, different container management systems, different cloud infrastructure systems or different apps of every description. I think that's the winning idea. In fullness of time, people will realize that they wanted to make those choices themselves; they just want Canonical to do the work of providing the updates in a really efficient manner. 

### There is so much competition in the container space with Docker, Rocket and many other players. Where will Canonical stand amid this competition?  ###

**Mark**: Canonical is focused on platform tools, and we see things like the Rocket and Docker as things super-useful for developers; we just make sure that those work best on Ubuntu. Docker, for years, ran only Ubuntu because we work very closely with them, and we are glad now that it's available everywhere else. But if you look at the numbers, the vast majority of Docker containers are on Ubuntu. Because we work really hard, as developers, you get the best experience with all of these tools on Ubuntu. We don't want to try and control everything, and it’s great for us to have those guys competing.

I think in the end people will see that there is really two kinds of containers. 1) There are cases where a container is just like a VM machine. It feels like a whole machine, it runs all processes, all the logs and cron jobs are there. It's like a VM, just that it's much cheaper, much lighter, much faster, and that's LXD. 2) And then there would be process containers, which are like Docker or Rocket; they are there to run a specific application very fast. I think we lead the world in general machine container story, which is our hypervisor LXD, and I think Docker leads the story when it comes to applications containers, process containers. And those two work together really beautifully. 

### Microsoft and Canonical are working together on LXD? Can you tell us about this engagement?  ###

Mark: LXD is two things. First, it's an implementation on top of Canonical's work on the kernel so that you can start to create full machine containers on any host. But it's also a REST API. That’s the transitions from LXC to LXD. We got a daemon there so you can talk to the daemon over the network, if it's listening on the network, and says tell me about the containers on that machine, tell me about the file systems on that machine, the networks on that machine, start or stop the container.

So LXD becomes a distributed hypervisor effectively. Very interestingly, last week Microsoft announced that they like REST API. It is very clean, very simple, very well engineered, and they are going to implement the same API for Windows machines. It's completely cross-platform, which means you will be able to talk to any machine—Linux or Windows. So it gives you very clean and simple APIs to talk about containers on any host on the network. 

Of course, we have led the work in [OpenStack to bind LXD to Nova][1], which is the control system to compute in OpenStack, so that's how we create a whole cloud with OpenStack API with the individual VMs being actually containers, so much denser, much faster, much lighter, much cheaper. 

### Open Source is becoming a norm in the enterprise segment. What do you think is driving the adoption of open source in the enterprise?  ###

**Mark**: The reason why open source has become so popular in the enterprise is because it enables them to go faster. We are all competing at some level, and if you can't make progress because you have to call up some vendor, you can't dig in and help yourself go faster, then you feel frustrated. And given the choice between frustration and at least the ability to dig into a problem, enterprises over time will always choose to give themselves the ability to dig in and help themselves. So that is why open source is phenomenal.

I think it goes a bit deeper than that. I think people have started to realize as much as we compete, 99% of what we need to do is shared, and there is something meaningful about contributing to something that is shared. As I have seen Ubuntu go from something that developers love, to something that CIOs love that developers love Ubuntu. As that happens, it's not a one-way ticket. They often want to say how can we help contribute to make this whole thing go faster.

We have always seen a curve of complexity, and open source has traditionally been higher up on the curve of complexity and therefore considered threatening or difficult or too uncertain for people who are not comfortable with the complexity. What's wonderful to me is that many open source projects have identified that as a blocker for their own future. So in Ubuntu we have made user experience, design and “making it easy” a first-class goal. We have done the same for OpenStack. With Ubuntu tools for OpenStack anybody can build an OpenStack cloud in an hour, and if you want, that cloud can run itself, scale itself, manage itself, can deal with failures. It becomes something you can just fire up and forget, which also makes it really cheap. It also makes it something that's not a distraction, and so by making open source easier and easier, we are broadening its appeal to consumers and into the enterprise and potentially into the government. 

### How open are governments to open source? Can you tell us about the utilization of open source by governments, especially in the U.S.?  ###

**Mark**: I don't track the usage in government, but part of government utilization in the modern era is the realization that how untrustworthy other governments might be. There is a desire for people to be able to say, “Look, I want to review or check and potentially self-build all the things that I depend on.” That's a really important mission. At the end of the day, some people see this as a game where maybe they can get something out of the other guy. I see it as a game where we can make a level playing field, where everybody gets to compete. I have a very strong interest in making sure that Ubuntu is trustworthy, which means the way we build it, the way we run it, the governance around it is such that people can have confidence in it as an independent thing. 

### You are quite vocal about freedom, privacy and other social issues on Google+. How do you see yourself, your company and Ubuntu playing a role in making the world a better place?  ###

**Mark**: The most important thing for us to do is to build confidence in trusted platforms, platforms that are freely available but also trustworthy. At any given time, there will always be people who can make arguments about why they should have access to something. But we know from history that at the end of the day, due process of law, justice, doesn't depend on the abuse of privacy, abuse of infrastructure, the abuse of data. So I am very strongly of the view that in the fullness of time, all of the different major actors will come to the view that their primary interest is in having something that is conceptually trustworthy. This isn't about what America can steal from Germany or what China can learn in Russia. This is about saying we’re all going to be able to trust our infrastructure; that's a generational journey. But I believe Ubuntu can be right at the center of people's thinking about that. 

--------------------------------------------------------------------------------

via: http://www.itworld.com/article/2973116/linux/linuxcon-exclusive-mark-shuttleworth-says-snappy-was-born-long-before-coreos-and-the-atomic-project.html

作者：[Swapnil Bhartiya][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.itworld.com/author/Swapnil-Bhartiya/
[1]:https://wiki.openstack.org/wiki/HypervisorSupportMatrix
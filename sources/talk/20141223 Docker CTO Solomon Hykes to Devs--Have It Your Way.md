Docker CTO Solomon Hykes to Devs: Have It Your Way
================================================================================
![](http://www.linuxinsider.com/ai/845971/docker-cloud.jpg)

**"We made a very conscious effort with Docker to insert the technology into an existing toolbox. We did not want to turn the developer's world upside down on the first day. ... We showed them incremental improvements so that over time the developers discovered more things they could do with Docker. So the developers could transition into the new architecture using the new tools at their own pace."**

[Docker][1] in the last two years has moved from an obscure Linux project to one of the most popular open source technologies in cloud computing.

Project developers have witnessed millions of Docker Engine downloads. Hundreds of Docker groups have formed in 40 countries. Many more companies are announcing Docker integration. Even Microsoft will ship Windows 10 with Docker preinstalled.

![](http://www.linuxinsider.com/article_images/2014/81504_330x260.jpg)

Solomon Hykes
Founder and CTO of Docker

"That caught a lot of people by surprise," Docker founder and CTO Solomon Hykes told LinuxInsider.

Docker is an open platform for developers and sysadmins to build, ship and run distributed applications. It uses a Docker engine along with a portable, lightweight runtime and packaging tool. It also needs the Docker Hub and a cloud service for sharing applications and automating workflows.

Docker provides a vehicle for developers to quickly assemble their applications from components. It eliminates the friction between development, quality assurance and production environments. Thus, IT can ship applications faster and run them unchanged on laptops, on data center virtual machines, and in any cloud.

In this exclusive interview, LinuxInsider discusses with Solomon Hykes why Docker is revitalizing Linux and the cloud.

**LinuxInsider: You have said that Docker's success is more the result of being in the right place at the right time for a trend that's much bigger than Docker. Why is that important to users?**

**Solomon Hykes**: There is always an element of being in the right place at the right time. We worked on this concept for a long time. Until recently, the market was not ready for this kind of technology. Then it was, and we were there. Also, we were very deliberate to make the technology flexible and very easy to get started using.

**LI: Is Docker a new cloud technology or merely a new way to do cloud storage?**

**Hykes**: Containers in themselves are just an enabler. The really big story is how it changes the software model enormously. Developers are creating new kinds of applications. They are building applications that do not run on only one machine. There is a need for completely new architecture. At the heart of that is independence from the machine.

The problem for the developer is to create the kind of software that can run independently on any kind of machine. You need to package it up so it can be moved around. You need to cross that line. That is what containers do.

**LI: How analogous is the software technology to traditional cargo shipping in containers?**

**Hykes**: That is a very apt example. It is the same thing for shipping containers. The innovation is not in the box. It is in how the automation handles millions of those boxes moving around. That is what is important.

**LI: How is Docker affecting the way developers build their applications?**

**Hykes**: The biggest way is it helps them structure their applications for a better distributive system. Another distributive application is Gmail. It does not run on just one application. It is distributive. Developers can package the application as a series of services. That is their style of reasoning when they design. It brings the tooling up to the level of design.

**LI: What led you to this different architecture approach?**

**Hykes**: What is interesting about this process is that we did not invent this model. It was there. If you look around, you see this trend where developers are increasingly building distributive applications where the tooling is inadequate. Many people have tried to deal with the existing tooling level. This is a new architecture. When you come up with tools that support this new model, the logical thing to do is tell the developer that the tools are out of date and are inadequate. So throw away the old tools and here are the new tools.

**LI: How much friction did you encounter from developers not wanting to throw away their old tools?**

**Hykes**: That approach sounds perfectly reasonable and logical. But in fact it is very hard to get developers to throw away their tools. And for IT departments the same thing is very true. They have legacy performance to support. So most of these attempts to move into next-generation tools have failed. They ask too much of the developers from day one.

**LI: How did you combat that reaction from developers?**

**Hykes**: We made a very conscious effort with Docker to insert the technology into an existing toolbox. We did not want to turn the developer's world upside down on the first day. Instead, we showed them incremental improvements so that over time the developers discovered more things they could do with Docker. So the developers could transition into the new architecture using the new tools at their own pace. That makes all the difference in the world.

**LI: What reaction are you seeing from this strategy?**

**Hykes**: When I ask people using Docker today how revolutionary it is, some say they are not using it in a revolutionary way. It is just a little improvement in my toolbox. That is the point. Others say that they jumped all in on the first day. Both responses are OK. Everyone can take their time moving toward that new model.

**LI: So is it a case of integrating Docker into existing platforms, or is a complete swap of technology required to get the full benefit?**

**Hykes**: Developers can go either way. There is a lot of demand for Docker native. But there is a whole ecosystem of new tools and companies competing to build brand new platforms entirely build on top of Docker. Over time the world is trending towards Docker native, but there is no rush. We totally support the idea of developers using bits and pieces of Docker in their existing platform forever. We encourage that.

**LI: What about Docker's shared Linux kernel architecture?**

**Hykes**: There are two steps involved in answering that question. What Docker does is become a layer on top of the Linux kernel. It exposes an abstraction function. It takes advantage of the underlying system. It has access to all of the Linux features. It also takes advantage of the networking stack and the storage subsystem. It uses the abstraction feature to map what developers need.

**LI: How detailed a process is this for developers?**

**Hykes**: As a developer, when I make an application I need a run-time that can run my application in a sandbox environment. I need a packaging system that makes it easy to move it around to other machines. I need a networking model that allows my application to talk to the outside world. I need storage, etc. We abstract ... the gritty details of whatever the kernel does right now.

**LI: Why does this benefit the developer?**

**Hykes**: There are two really big advantages to that. The first is simplicity. Developers can actually be productive now because that abstraction is easier for them to comprehend and is designed for that. The system APIs are designed for the system. What the developer needs is a consistent abstraction that works everywhere.

The second advantage is that over time you can support more systems. For example, early on Docker could only work on a single distribution of Linux under very narrow versions of the kernel. Over time, we expanded the surface area for the number of systems out there that Docker supports natively. So now you can run Docker on every major Linux distribution and in combination with many more networking and storage features.

**LI: Does this functionality trickle down to nondevelopers, or is the benefit solely targeting developers?**

**Hykes**: Every time we expand that surface area, every single developer that uses the Docker abstraction benefits from that too. So every application running Docker gets the added functionality every time the Docker community adds to the expansion. That is the thing that benefits all users. Without that universal expansion, every single developer would not have time to invest to update. There is just too much to support.

**LI: What about Microsoft's recent announcement that it was shipping Docker support with Windows?**

**Hykes**: If you think of Docker as a very narrow and very simple tool, then why would you roll out support for Windows? The whole point is that over time, you can expand the reach of that abstraction. Windows works very differently, obviously. But now that Microsoft has committed to adding features to Windows 10, it exposes the functionality required to run Docker. That is real exciting.

Docker still has to be ported to Windows, but Microsoft has committed to contributing in a major way to the port. Realize how far Microsoft has come in doing this. Microsoft is doing this fully upstream in a completely native, open source way. Everyone installing Windows 10 will get Docker preinstalled.

**LI: What lies ahead for growing Docker's feature set and user base?**

**Hykes**: The community has a lot of features on the drawing board. Most of them have to do with more improved tools for developers to build better distributive applications. A toolkit implies having a series of tools with each tool designed for one job.

In each of these subsystems, there is a need for new tools. In each of these areas, you will see an enormous amount of activity in the community in terms of contributions and designs. In that regard, the Docker project is enormously ambitious. The ability to address each of these areas will ensure that developers have a huge array of choices without fragmentation.

--------------------------------------------------------------------------------

via: http://www.linuxinsider.com/story/Docker-CTO-Solomon-Hykes-to-Devs-Have-It-Your-Way-81504.html

作者：Jack M. Germain
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:https://www.docker.com/
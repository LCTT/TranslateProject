[#]: subject: "Open Programmable Infrastructure: 1+1=3"
[#]: via: "https://www.linux.com/news/open-programmable-infrastructure-113/"
[#]: author: "Dan Whiting https://www.linuxfoundation.org/blog/open-programmable-infrastructure-113/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Open Programmable Infrastructure: 1+1=3
======
At last week’’s Open Source Summit North America, [Robin Ginn][1], Executive Director of the [OpenJS Foundation][2], relayed a principle her mentor taught: “1+1=3”. No, this isn’t ‘new math,’ it is demonstrating the principle that, working together, we are more impactful than working apart. Or, as my wife and I say all of the time, teamwork makes the dream work.

This principle is really at the core of open source technology. Turns out it is also how I look at the Open Programmable Infrastructure project.

Stepping back a bit, as “the new guy” around here, I am still constantly running across projects where I want to dig in more and understand what it does, how it does it, and why it is important. I had that very thought last week as we launched another new project, the [Open Programmable Infrastructure Project][3]. As I was [reading up on it][4], they talked a lot about data processing units (DPUs) and infrastructure processing units (IPUs), and I thought, I need to know what these are and why they matter. In the timeless words of The Bobs, “What exactly is it you do here?”

### What are DPUs/IPUs? 

First – and this is important – they are basically the same thing, they just have different names. Here is my oversimplified explanation of what they do.

In most personal computers, you have a separate graphic processing unit(s) that helps the central  processing unit(s) (CPU) handle the tasks related to processing and displaying the graphics. They offload that work from the CPU, allowing it to spend more time on the tasks it does best. So, working together, they can achieve more than each can separately.

Servers powering the cloud also have CPUs, but they have other tasks that can consume tremendous computing  power, say data encryption or network packet management. Offloading these tasks to separate processors enhances the performance of the whole system, as each processor focuses on what it does best.

In order words, 1+1=3.

### DPUs/IPUs are highly customizable

While separate processing units have been around for some time, like your PC’s GPU, their functionally was primarily dedicated to a particular task. Instead, DPUs/IPUs combine multiple offload capabilities that are highly  customizable through software. That means a hardware manufacturer can ship these units out and each organization uses software to configure the units according to their specific needs. And, they can do this on the fly.

Core to the cloud and its continued advancement and growth is the ability to quickly and easily create and dispose of the “hardware” you need. It wasn’t too long ago that if you wanted a server, you spent thousands of dollars on one and built all kinds of infrastructure around it and hoped it was what you needed for the time. Now, pretty much anyone can quickly setup a virtual server in a matter of minutes for virtually no initial cost.

DPUs/IPUs bring this same type of flexibility to your own datacenter because they can be configured to be “specialized” with software rather than having to literally design and build a different server every time you need a different capability.

### What is Open Programmable Infrastructure (OPI)?

OPI is focused on utilizing  open software and standards, as well as frameworks and toolkits, to allow for the rapid adoption and use of DPUs/IPUs. The OPI Project is both hardware and software companies coming together to establish and nurture an ecosystem to support these solutions. It “seeks to help define the architecture and frameworks for the DPU and IPU software stacks that can be applied to any vendor’s hardware offerings. The OPI Project also aims to foster a rich open source application ecosystem, leveraging existing open source projects, such as DPDK, SPDK, OvS, P4, etc., as appropriate.”

In other words, competitors are coming together to agree on a common, open ecosystem they can build together and innovate, separately, on top of. The are living out 1+1=3.

I, for one, can’t wait to see the innovation.

A special thanks to [Yan][5] [Fisher][6] of Red Hat for helping me understand open programmable infrastructure concepts. He and his colleague, Kris Murphy, have a more [technical blog post on Red Hat’s blog][7]. Check it out.

For more information on the OPI Project, visit their [website][8] and start contributing at [https://github.com/opiproject/opi][9].

Click here to add your own text

The post [Open Programmable Infrastructure: 1+1=3][10] appeared first on [Linux Foundation][11].

--------------------------------------------------------------------------------

via: https://www.linux.com/news/open-programmable-infrastructure-113/

作者：[Dan Whiting][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.linuxfoundation.org/blog/open-programmable-infrastructure-113/
[b]: https://github.com/lkxed
[1]: https://github.com/opiproject/opi
[2]: https://openjsf.org/
[3]: https://opiproject.org/
[4]: https://www.linuxfoundation.org/press-release/linux-foundation-announces-open-programmable-infrastructure-project/
[5]: https://www.redhat.com/en/authors/yan-fisher
[6]: https://www.redhat.com/en/authors/yan-fisher
[7]: https://www.redhat.com/en/blog/why-red-hat-joining-open-programmable-infrastructure-project
[8]: https://opiproject.org/
[9]: https://github.com/opiproject/opi
[10]: https://www.linuxfoundation.org/blog/open-programmable-infrastructure-113/
[11]: https://www.linuxfoundation.org/

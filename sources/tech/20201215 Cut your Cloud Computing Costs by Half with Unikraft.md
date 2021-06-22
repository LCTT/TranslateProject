[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Cut your Cloud Computing Costs by Half with Unikraft)
[#]: via: (https://www.linux.com/news/cut-your-cloud-computing-costs-by-half-with-unikraft/)
[#]: author: (Linux.com Editorial Staff https://www.linux.com/author/linuxdotcom/)

Cut your Cloud Computing Costs by Half with Unikraft
======

***A novel modular unikernel allows for extreme tailoring of your operating system to your application’s needs. A proof of concept, built on Unikraft, a Xen Project subproject, shows up to 50% efficiency improvements than standard Linux on AWS EC2. ***

Cloud computing has revolutionized the way we think about IT infrastructure: Another web server? More database capacity? Resources for your artificial intelligence use case? Just spin-up another instance, and you are good to go. Virtualization and containers have allowed us to deploy services without worrying about physical hardware constraints. As a result, most companies heavily rely on micro-services, which are individual servers highly specialized to perform a specific task.

The problem is that general-purpose operating systems such as Linux struggle to keep pace with this growing trend towards specialization. The status quo is that most microservices are built on top of a complete Linux kernel and distribution. It is as if you wanted to enable individual air travel with only one passenger seat per aircraft but kept the powerful engines of a jumbo jet. The result of having a proliferation of general-purpose OSes in the cloud are bloated instances, that feast on memory and processing power while uselessly burning electrical energy as well as your infrastructure budget.

![Figure 1. Linux kernel components have strong inter-dependencies making it difficult to remove or replace them.][1]

Despite this, putting Linux and other monolithic OSes on a diet is far from trivial. Removing unneeded components from the Linux kernel is a tedious endeavor due to the interdependencies among subsystems of the kernel: Figure 1 above illustrates a large number of such inter-dependencies a line denotes a dependency and a blue number the amount of such dependencies between two components. 

An alternative is to build so-called _unikernels_, images tailored to specific applications and often built on much smaller kernels. Unikernels have shown great promise and performance numbers (e.g., boot times of a few milliseconds, memory consumption when running off-the-shelf applications such as nginx of only a few MBs, and high throughput). However, their Achilles heel has been that they often require substantial expert work to create them and that at least part of the work has to be redone for each additional application. These issues, coupled with the fact that most unikernel projects don’t have a rich set of tools and ecosystem (e.g., Kubernetes integration, debugging and monitoring tools, etc.), resulting in 1GB Linux instances for jobs that might be as easy as delivering static web pages. 

## **Unikraft: A Revolutionary Way Forward**

[Unikraft][2] is on a mission to change that. In stark contrast to other unikernel projects, Unikraft, a  Xen Project subproject, has developed a truly modular unikernel common code base from which building tailored made (uni)kernels is orders of magnitude faster than in the past.

 “Without Unikraft, you have to choose between unikernel projects that only work for a specific language or application, or projects that aim to support POSIX but do so while sacrificing performance and thus defeating the purpose of using unikernels in the first place”, says Felipe Huici, one of the Unikraft team’s core contributors. “

Unikraft aims to run a large set of off-the-shelf application and languages (C/C++, Python, Go, Ruby, Lua, and WASM are supported, with Rust and Java on the way), but still allows for easy customization and even removal of unneeded kernel parts; also, it provides a set of rich, performance-oriented APIs that allows further customization by plugging the application at different levels of the stack for even higher performance.” 

A sample of such APIs are shown in Figure 2 below.

![Figure 2. Rhea architecture \(APIs in black boxes\) enables specialization by allowing apps to plug into APIs at different levels and to choose from multiple API implementations.][3]

Unikraft already supports more than 130 syscalls in terms of POSIX compatibility, and the number is continuously increasing. While this is certainly short of the 300+ that Linux supports, it turns out that only a subset of these are needed for running most of the major server applications. This, and ongoing efforts to support standard frameworks such as Kubernetes and Prometheus make Unikraft an enticing proposition and mark the coming of age of unikernels into the mainstream.

## **Unikraft Goes to the Cloud**

But what’s really in it for end-users? To demonstrate the power and efficiency of Unikraft, the team created an experimental Unikraft AWS EC2 image running nginx, currently the world’s most popular web server. “We’ve built a Unikraft nginx image and compared it to a ngnix running on an off-the-shelf Debian image to compare the performance of the two when serving static web pages. We’ve been more than pleased with the results” says Huici. “On Unikraft, nginx could handle twice the number of requests per second compared to the Debian instance. Or you could take a less performant AWS EC2 instance at half the price and get the same job done. Further, Unikraft needed about a sixth the amount of memory to run”.  The throughput results can be seen in Figure 3 below.

![][4]

So far, this is only a proof of concept, but Huici and the Unikraft team are moving quickly. “We are currently working on a system to make the process of creating a Unikraft image as easy as online-shopping” – this includes analyzing the applications which are meant to run on top of it and providing a ready-to-use operating system that has everything the specific use case needs, and nothing more. “Why should we waste money, resources, and pollute the environment running software in the background that is not needed for a specific service?”

_**About the author: Simon Kuenzer is the Project Lead and Maintainer of Unikraft, which is part of the Xen Project at the Linux Foundation.**_

--------------------------------------------------------------------------------

via: https://www.linux.com/news/cut-your-cloud-computing-costs-by-half-with-unikraft/

作者：[Linux.com Editorial Staff][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.linux.com/author/linuxdotcom/
[b]: https://github.com/lujun9972
[1]: https://www.linux.com/wp-content/uploads/2020/12/unikraft1.png
[2]: https://xenproject.org/developers/teams/unikraft/
[3]: https://www.linux.com/wp-content/uploads/2020/12/unikraft2.png
[4]: https://www.linux.com/wp-content/uploads/2020/12/unikraft3.png

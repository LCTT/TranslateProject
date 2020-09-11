[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How Open Source Is Accelerating NFV Transformation)
[#]: via: (https://www.linux.com/blog/2019/3/how-open-source-accelerating-nfv-transformation)
[#]: author: (Pam Baker https://www.linux.com/users/pambaker)

How Open Source Is Accelerating NFV Transformation
======

![NFV][1]

In anticipation of the upcoming Open Networking Summit, we talked with Thomas Nadeau, Technical Director NFV at Red Hat, about the role of open source in innovation for telecommunications service providers.

[Creative Commons Zero][2]

Red Hat is noted for making open source a culture and business model, not just a way of developing software, and its message of [open source as the path to innovation][3] resonates on many levels.

In anticipation of the upcoming [Open Networking Summit][4], we talked with [Thomas Nadeau][5], Technical Director NFV at Red Hat, who gave a [keynote address][6] at last year’s event, to hear his thoughts regarding the role of open source in innovation for telecommunications service providers.

One reason for open source’s broad acceptance in this industry, he said, was that some very successful projects have grown too large for any one company to manage, or single-handedly push their boundaries toward additional innovative breakthroughs.

“There are projects now, like Kubernetes, that are too big for any one company to do. There's technology that we as an industry need to work on, because no one company can push it far enough alone,” said Nadeau. “Going forward, to solve these really hard problems, we need open source and the open source software development model.”

Here are more insights he shared on how and where open source is making an innovative impact on telecommunications companies.

**Linux.com: Why is open source central to innovation in general for telecommunications service providers?**

**Nadeau:** The first reason is that the service providers can be in more control of their own destiny. There are some service providers that are more aggressive and involved in this than others. Second, open source frees service providers from having to wait for long periods for the features they need to be developed.

And third, open source frees service providers from having to struggle with using and managing monolith systems when all they really wanted was a handful of features. Fortunately, network equipment providers are responding to this overkill problem. They're becoming much more flexible, more modular, and open source is the best means to achieve that.

**Linux.com: In your ONS keynote presentation, you said open source levels the playing field for traditional carriers in competing with cloud-scale companies in creating digital services and revenue streams. Please explain how open source helps.**

**Nadeau:** Kubernetes again. OpenStack is another one. These are tools that these businesses really need, not to just expand, but to exist in today's marketplace. Without open source in that virtualization space, you’re stuck with proprietary monoliths, no control over your future, and incredibly long waits to get the capabilities you need to compete.

There are two parts in the NFV equation: the infrastructure and the applications. NFV is not just the underlying platforms, but this constant push and pull between the platforms and the applications that use the platforms.

NFV is really virtualization of functions. It started off with monolithic virtual machines (VMs). Then came "disaggregated VMs" where individual functions, for a variety of reasons, were run in a more distributed way. To do so meant separating them, and this is where SDN came in, with the separation of the control plane from the data plane. Those concepts were driving changes in the underlying platforms too, which drove up the overhead substantially. That in turn drove interest in container environments as a potential solution, but it's still NFV.

You can think of it as the latest iteration of SOA with composite applications. Kubernetes is the kind of SOA model that they had at Google, which dropped the worry about the complicated networking and storage underneath and simply allowed users to fire up applications that just worked. And for the enterprise application model, this works great.

But not in the NFV case. In the NFV case, in the previous iteration of the platform at OpenStack, everybody enjoyed near one-for-one network performance. But when we move it over here to OpenShift, we're back to square one where you lose 80% of the performance because of the latest SOA model that they've implemented. And so now evolving the underlying platform rises in importance, and so the pendulum swing goes, but it's still NFV. Open source allows you to adapt to these changes and influences effectively and quickly. Thus innovations happen rapidly and logically, and so do their iterations.

**Linux.com: Tell us about the underlying Linux in NFV, and why that combo is so powerful.**

**Nadeau:** Linux is open source and it always has been in some of the purest senses of open source. The other reason is that it's the predominant choice for the underlying operating system. The reality is that all major networks and all of the top networking companies run Linux as the base operating system on all their high-performance platforms. Now it's all in a very flexible form factor. You can lay it on a Raspberry Pi, or you can lay it on a gigantic million-dollar router. It's secure, it's flexible, and scalable, so operators can really use it as a tool now.

**Linux.com: Carriers are always working to redefine themselves. Indeed, many are actively seeking ways to move out of strictly defensive plays against disruptors, and onto offense where they ARE the disruptor. How can network function virtualization (NFV) help in either or both strategies?**

**Nadeau:** Telstra and Bell Canada are good examples. They are using open source code in concert with the ecosystem of partners they have around that code which allows them to do things differently than they have in the past. There are two main things they do differently today. One is they design their own network. They design their own things in a lot of ways, whereas before they would possibly need to use a turnkey solution from a vendor that looked a lot, if not identical, to their competitors’ businesses.

These telcos are taking a real “in-depth, roll up your sleeves” approach. ow that they understand what they're using at a much more intimate level, they can collaborate with the downstream distro providers or vendors. This goes back to the point that the ecosystem, which is analogous to partner programs that we have at Red Hat, is the glue that fills in gaps and rounds out the network solution that the telco envisions.

_Learn more at[Open Networking Summit][4], happening April 3-5 at the San Jose McEnery Convention Center._

--------------------------------------------------------------------------------

via: https://www.linux.com/blog/2019/3/how-open-source-accelerating-nfv-transformation

作者：[Pam Baker][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.linux.com/users/pambaker
[b]: https://github.com/lujun9972
[1]: https://www.linux.com/sites/lcom/files/styles/rendered_file/public/nfv-443852_1920.jpg?itok=uFbzmEPY (NFV)
[2]: /LICENSES/CATEGORY/CREATIVE-COMMONS-ZERO
[3]: https://www.linuxfoundation.org/blog/2018/02/open-source-standards-team-red-hat-measures-open-source-success/
[4]: https://events.linuxfoundation.org/events/open-networking-summit-north-america-2019/
[5]: https://www.linkedin.com/in/tom-nadeau/
[6]: https://onseu18.sched.com/event/Fmpr

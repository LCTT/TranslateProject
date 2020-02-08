[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (VMware licensing increase draws ire but is a logical move)
[#]: via: (https://www.networkworld.com/article/3521191/vmware-licensing-increase-draws-ire-but-is-a-logical-move.html)
[#]: author: (Andy Patrizio https://www.networkworld.com/author/Andy-Patrizio/)

VMware licensing increase draws ire but is a logical move
======
Under the new VMware licensing pricing model, one CPU license will cover up to 32 cores in a single CPU. If a CPU has more than 32 cores, additional CPU licenses will be required.
Getty / VMware

VMware is increasing its [CPU licensing prices][1] for customers running CPUs with more than 32 physical cores. Effective April 2, if CPUs with more than 32 cores are deployed, then customers need to purchase additional CPU licenses.

Such a change doesn't seem surprising. For the longest time, 32-core processors seemed like a pipe dream. Intel was hovering in the range of 20-odd cores, and AMD was a non-player. Then came the AMD Epyc with 32 cores in 2017, followed by Epyc 2 with 64 cores in 2019 .

**READ MORE:** [VMware’s ongoing reinvention][2]

Intel Xeons currently top out at 28 cores, but the company is promising to ship a 38-core “Ice Lake” generation and 48-core “Cooper Lake” generation this year.

So while the pricing increase hits AMD harder, for now, AMD doesn't seem to be terribly bothered by it, based on this statement from a company spokesman: “AMD continues to lead the industry on performance, features and TCO in virtualized environments for both 1-socket and 2-socket systems. While the new VMware licensing guidelines change the economics slightly for higher-core-count processors, AMD remains committed to VMware as a winning virtualization solution for AMD EPYC customers.”

My read of that statement is that AMD doesn’t feel targeted. However, Jeff Ready, CEO and co-founder of cloud provider Scale Computing, didn’t take the news so well.

“I’ve seen a bunch of customers that want to move over to those higher-core-count types of CPUs. Now one VMware license doesn’t cover you anymore. You’re going to need two, or four, or whatever amount of licensing it works out to be. While that hurts everybody, it’s evidence that maybe VMware doesn’t understand the edge computing in the midmarket where we play. I give the marketing department props for coming up with some spin, but at the end of the day it’s a price increase,” Ready said in a statement sent out to tech press.

I think he’s overstating things. Scale Computing uses both Epyc processors and VMware software, so I can understand that this hits the company hard, but was VMware supposed to ignore the growing core count of CPUs and give everyone a freebie from core 33 and up? VMware licenses are by the core, and if the core count rises, VMware would be a bit derelict to not alter its licenses. 

[][3]

“A fact of data center life is that as IT infrastructure hardware evolves, so does the software that runs on it. That includes the pricing models that vendors adopt to gain what they believe is fair value for their products,” said Charles King, principal analyst with Pund-IT.

“On the plus side, VMware's changes will impact a relatively small number of enterprise customers. That doesn't mean that those companies and the VMware partners who support them won't feel pain, especially those who have already planned and funded their 2020 budgets,” King added.

Join the Network World communities on [Facebook][4] and [LinkedIn][5] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3521191/vmware-licensing-increase-draws-ire-but-is-a-logical-move.html

作者：[Andy Patrizio][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Andy-Patrizio/
[b]: https://github.com/lujun9972
[1]: https://www.vmware.com/company/news/updates/cpu-pricing-model-update-feb-2020.html
[2]: https://www.networkworld.com/article/3340259/vmware-s-transformation-takes-hold.html
[3]: https://www.networkworld.com/article/3440100/take-the-intelligent-route-with-consumption-based-storage.html?utm_source=IDG&utm_medium=promotions&utm_campaign=HPE21620&utm_content=sidebar ( Take the Intelligent Route with Consumption-Based Storage)
[4]: https://www.facebook.com/NetworkWorld/
[5]: https://www.linkedin.com/company/network-world
